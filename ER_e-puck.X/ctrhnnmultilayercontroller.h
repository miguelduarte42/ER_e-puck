#ifndef CTRHNNMULTILAYERCONTROLLER_H_
#define CTRHNNMULTILAYERCONTROLLER_H_

void createNetworks(int numberOfNetworks);
void defineNetwork(int index, int inputs, int hidden, int outputs);
void setWeights(int index, float* pfGenes);
void resetNetwork(int index);
float* computeOutputs(int index, float* pf_inputs);

#endif
