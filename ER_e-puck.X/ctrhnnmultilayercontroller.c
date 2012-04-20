/******************************************************************************/
/******************************************************************************/

#include <stdlib.h>
#include <math.h>
#include "uart/e_uart_char.h"

//Constants
float m_fTimeStep = 0.2;
float tau = 2.5;

//Arguments
int numberOfSensorInputs = 0;
int numberOfHiddenNodes = 0;
int numberOfActuatorOutputs = 0;

//Calculated
float* m_pfInputToHiddenWeights;
float* m_pfHiddenToHiddenWeights;
float* m_pfHiddenBiases;
float* m_pfHiddenTaus;
float* m_pfHiddenToOutputWeights;
float* m_pfOutputBiases;
float* m_pfOutputs;
float* m_pfHiddenDeltaStates;
float* m_pfHiddenStates;

void DefineNetwork(int inputs, int hidden, int outputs)
{
    numberOfSensorInputs = inputs;
    numberOfHiddenNodes = hidden;
    numberOfActuatorOutputs = outputs;
}

void SetWeights(float* pfGenes)
{
    
    //float* pfGenes = malloc(un_number_of_weights * sizeof (float));
    
    int i;
    /*for (i = 0; i < un_number_of_weights; i++)
    {
        pfGenes[i] = (pf_genes[i] + 10) / 20;
    }*/
    
    int A = numberOfSensorInputs;
    int B = numberOfHiddenNodes;
    int C = numberOfActuatorOutputs;

    //unsigned int unRequiredNumberOfWeights = (A+1) * B + B*B + (B+1) * C + B;

    /*if (un_number_of_weights != unRequiredNumberOfWeights)
    {
        printf("Trying to set an incorrect number of weights (%d should be %d), the sbot\n"
               "has %d sensor inputs and %d actuator outputs and %d hidden nodes\n"
               "are being used\n", un_number_of_weights, unRequiredNumberOfWeights, 
               numberOfSensorInputs, numberOfActuatorOutputs,
               numberOfHiddenNodes);
        return;
    }*/
    
    m_pfInputToHiddenWeights  = &pfGenes[0];//malloc((A * B)*sizeof(float));
    m_pfHiddenToHiddenWeights = &m_pfInputToHiddenWeights[A * B];//malloc((B * B)*sizeof(float));
    m_pfHiddenBiases          = &m_pfHiddenToHiddenWeights[B*B];//malloc(B*sizeof(float));

    m_pfHiddenTaus            = &m_pfHiddenBiases[B];//malloc(B*sizeof(float));

    m_pfHiddenToOutputWeights = &m_pfHiddenTaus[B];//malloc((B * C)*sizeof(float));
    m_pfOutputBiases          = &m_pfHiddenToOutputWeights[B * C];//malloc(C*sizeof(float));
    m_pfOutputs               = malloc(C*sizeof(float));

    for (i = 0; i < B; i++)
    {
        m_pfHiddenTaus[i] = pow(10, (-1.0 + (tau * (m_pfHiddenTaus[i] + 10.0) /20.0)));
    }

    for (i = 0; i < C; i++)
    {
	m_pfOutputs[i] = 0.0;
    }
    /*
    sendPointer(m_pfInputToHiddenWeights);
    sendPointer(m_pfHiddenToHiddenWeights);
    sendPointer(m_pfHiddenBiases);
    sendPointer(m_pfHiddenTaus);
    sendPointer(m_pfHiddenToOutputWeights);
    sendPointer(m_pfOutputBiases);
    sendPointer(m_pfOutputs);
    */

    /*int unChromosomePosition = 0;
    
    for (i = 0; i < A * B; i++)
    {
        m_pfInputToHiddenWeights[i] = pfGenes[unChromosomePosition++];
    }
    
    for (i = 0; i < B * B; i++)
    {
        m_pfHiddenToHiddenWeights[i] = pfGenes[unChromosomePosition++];
    }

    for (i = 0; i < B; i++)
    {
        m_pfHiddenBiases[i] = pfGenes[unChromosomePosition++];
    }

    for (i = 0; i < B; i++)
    {
        m_pfHiddenTaus[i] = pow(10, (-1.0 + (tau * (pfGenes[unChromosomePosition++] + 10.0) /20)));
    }

    for (i = 0; i < B * C; i++)
    {
        m_pfHiddenToOutputWeights[i] = pfGenes[unChromosomePosition++];
    }

    for (i = 0; i < C; i++)
    {
	m_pfOutputs[i] = 0.0;
    }*/

    int sizeHidden = B*sizeof(float);

    m_pfHiddenDeltaStates = malloc(sizeHidden);

    m_pfHiddenStates = malloc(sizeHidden);

    for (i = 0; i < B; i++)
    {
        m_pfHiddenStates[i] = 0;
    }

    //free(pfGenes);
}

float* ComputeOutputs(float* pf_inputs)
{
    int i;
    int j;
    // Update delta state of hidden layer from inputs:

    //sendString("\nm_pfHiddenDeltaStates");
    for(i = 0; i < numberOfHiddenNodes; i++)
    {
        m_pfHiddenDeltaStates[i] = -m_pfHiddenStates[i];
      
        for (j = 0; j < numberOfSensorInputs; j++)
        {
            // weight * sigmoid(state)
            m_pfHiddenDeltaStates[i] += m_pfInputToHiddenWeights[i * numberOfSensorInputs + j] * pf_inputs[j] ;
        }
        //sendDouble(m_pfHiddenDeltaStates[i]);
    }

    //sendString("\nm_pfHiddenDeltaStates");
    // Update delta state from hidden layer, self-recurrent connections:
    for (i = 0; i < numberOfHiddenNodes; i++)
    {
        for (j = 0; j < numberOfHiddenNodes; j++)
        {
            float exponential = exp(-( m_pfHiddenStates[j]+m_pfHiddenBiases[j]));
            float z = 1.0/(exponential + 1.0);

            m_pfHiddenDeltaStates[i] += m_pfHiddenToHiddenWeights[i * numberOfHiddenNodes + j] * z;
        }
        //sendDouble(m_pfHiddenDeltaStates[i]);
    }

    //sendString("\nm_pfHiddenStates");
    for(i = 0; i < numberOfHiddenNodes; i++)
    {
        m_pfHiddenStates[i] += m_pfHiddenDeltaStates[i] * m_fTimeStep/m_pfHiddenTaus[i];
        //sendDouble(m_pfHiddenStates[i]);
    }

    //sendString("\nz");
    // Update the outputs layer::
    for (i = 0; i < numberOfActuatorOutputs; i++)
    {
        for (j = 0; j < numberOfHiddenNodes; j++)
        {
            float z = ((1.0)/( exp(-( m_pfHiddenStates[j] + m_pfHiddenBiases[j])) + 1.0 ));
            //sendDouble(z);
            m_pfOutputs[i] += m_pfHiddenToOutputWeights[i * numberOfHiddenNodes + j] * z;
        }

        // Compute the activation function immediately, since this is
        // what we return and since the output layer is not recurrent:
        m_pfOutputs[i] = ((1.0)/( exp(-( m_pfOutputs[i] + m_pfOutputBiases[i])) + 1.0 ));
    }

    //sendNewLine();
    //sendNewLine();
    //sendString("computed outputs");

    for (i = 0; i < numberOfActuatorOutputs; i++) {
        //sendDouble(m_pfOutputs[i]);
    }

    //sendNewLine();
    //sendNewLine();
    //sendNewLine();

    return m_pfOutputs;
}
