
int main();

void run(void);

void neuralNetwork();

void updateFlag(void);

void preprogrammedCycle(void);

void annCycle(void);

float sensorToInput(int sensor);

float lightToInput(int sensorNumber);

void resetValues();

void readValues();

void averageValues();

void lightCalibration();

int findMaxBehavior(float* outputs, int size);

void applyBehavior(int b, float* inputs);

void moveForward(float* inputs);

void turnLeft();

void turnRight();

void cameraTest();

void hierarquicalAnnCycle(void);

void regularAnnCycle(void);