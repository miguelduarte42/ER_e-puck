#ifndef CTRHNNMULTILAYERCONTROLLER_H_
#define CTRHNNMULTILAYERCONTROLLER_H_

void SetWeights(float* pf_weights );
float* ComputeOutputs(float* pf_inputs);
void DefineNetwork(int inputs, int hidden, int outputs);
void SetArguments(float wmin, float wmax, float biasmin, float biasmax, float taumin, float taumax);
/*class CCtrhnnMultilayerController : public CNNController {
 public:
  CCtrhnnMultilayerController(const char* pch_name, CSbot* pc_sbot,
			     unsigned int un_number_hiddens, CArguments* pc_controller_arguments );
  
  virtual ~CCtrhnnMultilayerController();
  
  virtual void SetWeights( unsigned int un_number_of_weights, 
                           double* pf_weights ); 
  virtual const double* ComputeOutputs(double* pf_inputs);
  
protected:
//    double        m_fInputGain;
//    double*       m_pfInputBiases;
//    double*       m_pfInputTaus;
//    double*       m_pfInputStates;

    double*       m_pfInputToHiddenWeights;

    double*       m_pfHiddenBiases;
    double*       m_pfHiddenTaus;
    double*       m_pfHiddenDeltaStates;
    double*       m_pfHiddenStates;

    double*       m_pfHiddenToHiddenWeights;
    double*       m_pfHiddenToOutputWeights;

    double*       m_pfOutputBiases;
    double*       m_pfOutputTaus;
    double*       m_pfOutputStates;
    double*       m_pfOutputs;

    unsigned int  m_unNumberOfHiddenNodes;
    double        m_fTimeStep;
};
*/

/******************************************************************************/
/******************************************************************************/


#endif
