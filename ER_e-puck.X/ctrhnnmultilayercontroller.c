#include <stdlib.h>
#include <math.h>

//Constants
float Hm_fTimeStep = 0.2;
float Htau = 2.5;

struct NeuralNetwork
{
    int numberOfSensorInputs;
    int numberOfHiddenNodes;
    int numberOfActuatorOutputs;
    float* m_pfInputToHiddenWeights;
    float* m_pfHiddenToHiddenWeights;
    float* m_pfHiddenBiases;
    float* m_pfHiddenTaus;
    float* m_pfHiddenToOutputWeights;
    float* m_pfOutputBiases;
    float* m_pfOutputs;
    float* m_pfHiddenDeltaStates;
    float* m_pfHiddenStates;
};

struct NeuralNetwork **networks;

void createNetworks(int numberOfNetworks)
{
    networks = malloc(sizeof(struct NeuralNetwork*)*numberOfNetworks);

    int i;
    for(i = 0 ; i < numberOfNetworks ; i++) {
        struct NeuralNetwork* ann = malloc(sizeof(struct NeuralNetwork));
        networks[i] = (struct NeuralNetwork*) ann;
    }
}

void defineNetwork(int index, int inputs, int hidden, int outputs)
{
    networks[index]->numberOfSensorInputs = inputs;
    networks[index]->numberOfHiddenNodes = hidden;
    networks[index]->numberOfActuatorOutputs = outputs;
}

void setWeights(int index, float* pfGenes)
{
    int i;
    int A = networks[index]->numberOfSensorInputs;
    int B = networks[index]->numberOfHiddenNodes;
    int C = networks[index]->numberOfActuatorOutputs;

    networks[index]->m_pfInputToHiddenWeights  = &pfGenes[0];
    networks[index]->m_pfHiddenToHiddenWeights = &networks[index]->m_pfInputToHiddenWeights[A * B];
    networks[index]->m_pfHiddenBiases          = &networks[index]->m_pfHiddenToHiddenWeights[B*B];

    networks[index]->m_pfHiddenTaus            = &networks[index]->m_pfHiddenBiases[B];

    networks[index]->m_pfHiddenToOutputWeights = &networks[index]->m_pfHiddenTaus[B];
    networks[index]->m_pfOutputBiases          = &networks[index]->m_pfHiddenToOutputWeights[B * C];
    networks[index]->m_pfOutputs               = malloc(C*sizeof(float));

    for (i = 0; i < B; i++)
    {
        networks[index]->m_pfHiddenTaus[i] = pow(10, (-1.0 + (Htau * (networks[index]->m_pfHiddenTaus[i] + 10.0) /20.0)));
    }

    for (i = 0; i < C; i++)
    {
	networks[index]->m_pfOutputs[i] = 0.0;
    }

    int sizeHidden = B*sizeof(float);

    networks[index]->m_pfHiddenDeltaStates = malloc(sizeHidden);

    networks[index]->m_pfHiddenStates = malloc(sizeHidden);

    for (i = 0; i < B; i++)
    {
        networks[index]->m_pfHiddenStates[i] = 0;
    }
}

void resetNetwork(int index)
{

    int i;
    int j;

    for(i = 0; i < networks[index]->numberOfHiddenNodes; i++)
    {
        networks[index]->m_pfHiddenDeltaStates[i] = 0;

        for (j = 0; j < networks[index]->numberOfSensorInputs; j++)
        {
            networks[index]->m_pfHiddenDeltaStates[i] = 0;
        }
    }

    for (i = 0; i < networks[index]->numberOfHiddenNodes; i++)
    {
        for (j = 0; j < networks[index]->numberOfHiddenNodes; j++)
        {
            networks[index]->m_pfHiddenDeltaStates[i] = 0;
        }
    }

    for(i = 0; i < networks[index]->numberOfHiddenNodes; i++)
    {
        networks[index]->m_pfHiddenStates[i] = 0;
    }

    for (i = 0; i < networks[index]->numberOfActuatorOutputs; i++)
    {
        for (j = 0; j < networks[index]->numberOfHiddenNodes; j++)
        {
            networks[index]->m_pfOutputs[i] = 0;
        }
        networks[index]->m_pfOutputs[i] = 0;
    }
}

float* computeOutputs(int index, float* pf_inputs)
{
    int i;
    int j;
    // Update delta state of hidden layer from inputs:

    for(i = 0; i < networks[index]->numberOfHiddenNodes; i++)
    {
        networks[index]->m_pfHiddenDeltaStates[i] = -networks[index]->m_pfHiddenStates[i];

        for (j = 0; j < networks[index]->numberOfSensorInputs; j++)
        {
            // weight * sigmoid(state)
            networks[index]->m_pfHiddenDeltaStates[i] += networks[index]->m_pfInputToHiddenWeights[i * networks[index]->numberOfSensorInputs + j] * pf_inputs[j] ;
        }

    }


    // Update delta state from hidden layer, self-recurrent connections:
    for (i = 0; i < networks[index]->numberOfHiddenNodes; i++)
    {
        for (j = 0; j < networks[index]->numberOfHiddenNodes; j++)
        {
            float exponential = exp(-( networks[index]->m_pfHiddenStates[j]+networks[index]->m_pfHiddenBiases[j]));
            float z = 1.0/(exponential + 1.0);

            networks[index]->m_pfHiddenDeltaStates[i] += networks[index]->m_pfHiddenToHiddenWeights[i * networks[index]->numberOfHiddenNodes + j] * z;
        }
    }

    for(i = 0; i < networks[index]->numberOfHiddenNodes; i++)
    {
        networks[index]->m_pfHiddenStates[i] += networks[index]->m_pfHiddenDeltaStates[i] * Hm_fTimeStep/networks[index]->m_pfHiddenTaus[i];
    }

    // Update the outputs layer::
    for (i = 0; i < networks[index]->numberOfActuatorOutputs; i++)
    {
        for (j = 0; j < networks[index]->numberOfHiddenNodes; j++)
        {
            float z = ((1.0)/( exp(-( networks[index]->m_pfHiddenStates[j] + networks[index]->m_pfHiddenBiases[j])) + 1.0 ));
            networks[index]->m_pfOutputs[i] += networks[index]->m_pfHiddenToOutputWeights[i * networks[index]->numberOfHiddenNodes + j] * z;
        }

        // Compute the activation function immediately, since this is
        // what we return and since the output layer is not recurrent:
        networks[index]->m_pfOutputs[i] = ((1.0)/( exp(-( networks[index]->m_pfOutputs[i] + networks[index]->m_pfOutputBiases[i])) + 1.0 ));
    }

    return networks[index]->m_pfOutputs;
}
