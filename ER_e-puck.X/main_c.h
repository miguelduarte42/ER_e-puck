
float sensorToInput(int sensor);
float findLight(int sensor);
float lightToInput(int sensorNumber);
void myCalibration();
void hierarchicalNeuralNetwork();
void resetValues();
void readValues();
void averageValues();
void applyBehavior(int b, float* inputs);
void moveForward(float* inputs);
void turnLeft();
void turnRight();
void hCycle(void);