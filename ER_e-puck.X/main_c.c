#include "p30f6014A.h"
#include "main_c.h"

#include "motor_led/e_epuck_ports.h"
#include "motor_led/e_init_port.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "motor_led/advance_one_timer/e_agenda.h"

#include "a_d/advance_ad_scan/e_ad_conv.h"
#include "a_d/advance_ad_scan/e_prox.h"

#include "uart/e_uart_char.h"
#include "e_randb.h"
#include "ctrhnnmultilayercontroller.h"
#include "camera/fast_2_timer/e_po3030k.h"
#include "utilities.h"

#include <string.h>
#include <math.h>
#include <stdlib.h>

#define BAUDRATE 115200

int startSteps;
int targetSteps = 333 - 10; //this is around 90 degrees
int behaviors[] = {0,0,0};
int TURN_LEFT = 0;
int TURN_RIGHT = 1;
int FORWARD = 2;

float inputs[6];

float sensorReferenceValues[] = {3842.55,3774.18,1769.57,979.94,546.55,190.11,99.29,57.8,37.71,23.99,16.61,12.74,10.36,7.99,6.39};

float distances[] = {0,0.5,1,1.5,2,3,4,5,6,7,8,9,10,11,12};
int numberOfDistances = 15;

int forwardSpeed = 800;//10cm/s
int turnSpeed = 80;//1cm/s

float clocksPerSecond = 15000000.0;//100ms

float prev = 0;

long values[6];//Average values read while waiting in the ANN cycle

long readTimes = 0;

//Sensor numbers
int S_FRONT_RIGHT = 0;
int S_RIGHT = 2;
int S_LEFT = 5;
int S_FRONT_LEFT = 7;

int currentFixedTimeSteps[] = {0,0};
int fixedTimeSteps = 15;
float leftLightReference = 0;
float rightLightReference = 0;
float lightThreshold = 10;
float lastLight2 = 0,lastLight5 = 0;
float* outputs;

int lockReading = 0;

int activeNetwork = 0;
float timeStep = 0;

int leftSpeed = 0;
int rightSpeed = 0;
int flag = 0;

int speedLeft = 0;
int speedRight = 0;

char LED0_SELECTOR = 2,
        LED1_SELECTOR = 8,
        LED2_SELECTOR = 32,
        LED3_SELECTOR = 128,
        LED0_ON = 1,
        LED1_ON = 4,
        LED2_ON = 16,
        LED3_ON = 64,
        START = 110,
        LED = 111,
        WHEEL_LEFT = 112,
        WHEEL_RIGHT = 113,
        SENSORS = 114;

int main() {

    //initialization
    e_init_port();
    e_init_motors();
    e_init_ad_scan(ALL_ADC);
    e_init_uart1();

    int selector = getSelector();

    if(selector != 0) {
        dummyANN();
    }

}

void dummyANN() {

    e_set_led(4,1);
    e_calibrate_ir();
    lightCalibration();
    
    unsigned short s;

    do{
        s = receiveMessage();
    }while(s != START);

    e_set_led(4,0);

    int selector;

    selector = getSelector();
    while(selector == getSelector());

    selector = getSelector();

    e_activate_agenda(updateFlag, 1000);
    e_activate_agenda(readValues, 100);
    e_start_agendas_processing();

    while(1) {
        while(!flag);
        flag = 0;
        sendInputs();

        readOrder();
        readOrder();

        e_set_speed_left(speedLeft);
        e_set_speed_right(speedRight);
    }
}

void sendInputs() {
    averageValues();

    //proximity
    unsigned short fr = sensorToInput(S_FRONT_RIGHT)*1000;
    unsigned short r = sensorToInput(S_RIGHT)*1000;
    unsigned short l = sensorToInput(S_LEFT)*1000;
    unsigned short fl = sensorToInput(S_FRONT_LEFT)*1000;

    //light
    unsigned short lf = lightToInput(S_LEFT)*1000;
    unsigned short lr = lightToInput(S_RIGHT)*1000;

    resetValues();

    transmitShort(SENSORS);
    transmitShort(fr);
    transmitShort(r);
    transmitShort(l);
    transmitShort(fl);
    transmitShort(lf);
    transmitShort(lr);

    unsigned short left = speedLeft+1000;
    unsigned short right = speedRight+1000;

    //transmitShort(left);
    //transmitShort(right);
}

void transmitShort(unsigned short i) {
    e_send_uart1_char(&i,2);
    while(e_uart1_sending());
}

void readOrder() {
    unsigned short c = receiveMessage();

    if(c == WHEEL_LEFT || c == WHEEL_RIGHT) {

        unsigned short finalSpeed = receiveMessage();
        int intSpeed= ((int)finalSpeed) - 1000;

        if(c == WHEEL_LEFT) {
            speedLeft = intSpeed;
            //e_set_speed_left(intSpeed);
        }else{
            speedRight = intSpeed;
            //e_set_speed_right(intSpeed);
        }

    }else if(c == LED) {
        c = receiveMessage();

        if(c & LED0_SELECTOR) {
            if(c & LED0_ON)
                e_set_led(0,1);
            else
                e_set_led(0,0);
        }
        if(c & LED1_SELECTOR) {
            if(c & LED1_ON)
                e_set_led(1,1);
            else
                e_set_led(1,0);
        }
        if(c & LED2_SELECTOR) {
            if(c & LED2_ON)
                e_set_led(2,1);
            else
                e_set_led(2,0);
        }
        if(c & LED3_SELECTOR) {
            if(c & LED3_ON)
                e_set_led(3,1);
            else
                e_set_led(3,0);
        }
    }
}

void run(void);

void neuralNetwork() {

    e_set_led(4,1);
    e_calibrate_ir();
    lightCalibration();
    e_set_led(4,0);

    int selector;
    //int numberOfInputNeurons = 6;
    //int numberOfOutputNeurons = 3;

    while(1) {

        inputs[0] = 0;
        inputs[1] = 0;
        inputs[2] = 0;
        inputs[3] = 0;
        inputs[4] = 0;
        inputs[5] = 0;

        selector = getSelector();
        while(selector == getSelector());

        timeStep = 0;
        createNetworks(4);
        
        //defineNetwork(0,4,10,2); //clutteredmaze
        defineNetwork(0,6,10,3); //mazesolver
        defineNetwork(1,4,3,2);  //corridor
        defineNetwork(2,4,3,2);  //left
        defineNetwork(3,4,3,2);  //right
        //defineNetwork(5,4,3,2);  //roomsolver

        //setWeights(0, clutteredmaze);
//        setWeights(0, mazesolver);
 //       setWeights(1, corridor);
  //      setWeights(2, leftturn);
        //setWeights(4, rightturn);
        //setWeights(5, roomsolver);

        outputs = malloc(3*sizeof(float));
        outputs[0] = 0;
        outputs[1] = 0;
        outputs[2] = 0;

        selector = getSelector();

        e_activate_agenda(updateFlag, 1000);
        e_activate_agenda(readValues, 100);
        e_start_agendas_processing();

        while(1) {
            while(!flag);
            flag = 0;
            //annCycle();
            sendFloat(inputs[0]);
            regularAnnCycle();
        }
    }
}

void updateFlag(void) {
    flag = 1;
}

void preprogrammedCycle(void) {

    averageValues();

    inputs[0] = sensorToInput(S_FRONT_RIGHT);
    inputs[1] = sensorToInput(S_RIGHT);
    inputs[2] = sensorToInput(S_LEFT);
    inputs[3] = sensorToInput(S_FRONT_LEFT);

    inputs[4] = lightToInput(S_LEFT);
    inputs[5] = lightToInput(S_RIGHT);

    outputs = computeOutputs(0, inputs);

    int activeBehavior = 999;

    int i;
    for(i = 0 ; i < 3 ; i++)
        if(behaviors[i])
            activeBehavior = i;

    int newBehavior;
    if(activeBehavior != 999)
        newBehavior = activeBehavior;
    else
        newBehavior = findMaxBehavior(outputs,3);

    applyBehavior(newBehavior,inputs);

    timeStep++;

    resetValues();
}

void hierarquicalAnnCycle(void) {

    averageValues();

    inputs[0] = sensorToInput(S_FRONT_RIGHT);
    inputs[1] = sensorToInput(S_RIGHT);
    inputs[2] = sensorToInput(S_LEFT);
    inputs[3] = sensorToInput(S_FRONT_LEFT);

    inputs[4] = lightToInput(S_LEFT);
    inputs[5] = lightToInput(S_RIGHT);

    outputs = computeOutputs(0, inputs);

    int newActiveNetwork = findMaxBehavior(outputs, 3) + 1;

    if(newActiveNetwork != activeNetwork)
        resetNetwork(newActiveNetwork);

    activeNetwork = newActiveNetwork;

    outputs = computeOutputs(activeNetwork, inputs);

    leftSpeed = (int)(forwardSpeed*(outputs[0]-0.5)*2.0);
    rightSpeed = (int)(forwardSpeed*(outputs[1]-0.5)*2.0);

    e_set_speed_left(leftSpeed);
    e_set_speed_right(rightSpeed);

    timeStep++;
    
    resetValues();
}

void regularAnnCycle(void) {

    averageValues();

    inputs[0] = sensorToInput(S_FRONT_RIGHT);
    inputs[1] = sensorToInput(S_RIGHT);
    inputs[2] = sensorToInput(S_LEFT);
    inputs[3] = sensorToInput(S_FRONT_LEFT);

    inputs[4] = lightToInput(S_LEFT);
    inputs[5] = lightToInput(S_RIGHT);

    outputs = computeOutputs(0, inputs);

    leftSpeed = (int)(forwardSpeed*(outputs[0]-0.5)*2.0);
    rightSpeed = (int)(forwardSpeed*(outputs[1]-0.5)*2.0);

    e_set_speed_left(leftSpeed);
    e_set_speed_right(rightSpeed);

    sendDouble(1.0);

    timeStep++;

    resetValues();
}

float sensorToInput(int sensor) {

    float value;

    if(sensor == S_FRONT_RIGHT)     value = values[0];
    else if(sensor == S_RIGHT)      value = values[1];
    else if(sensor == S_LEFT)       value = values[2];
    else if(sensor == S_FRONT_LEFT) value = values[3];

    if(value > sensorReferenceValues[numberOfDistances-1]) {

        int i;
        for(i = 0; i < numberOfDistances ; i++) {
            if(value > sensorReferenceValues[i]) {
                if(i == 0)
                    return 1.0;

                 float referenceBefore =sensorReferenceValues[i-1];
                float referenceAfter =sensorReferenceValues[i];

                float linearization = (value-referenceAfter)/(referenceBefore-referenceAfter);

                float distanceAfter = distances[i];
                float distanceBefore = distances[i-1];
                float currentDistance = (distanceBefore-distanceAfter)*(linearization)+distanceAfter;

                return 1.0-currentDistance/distances[numberOfDistances-1];
            }
        }
    }
    return 0.0;
}

float lightToInput(int sensorNumber) {

    float rawValue;
    float value;
    
    if(sensorNumber == S_RIGHT){
        rawValue = values[5];
        value = rightLightReference-rawValue;
    }else if(sensorNumber == S_LEFT) {
        rawValue = values[4];
        value = leftLightReference-rawValue;
    }

    float result = 0;

    if(value > lightThreshold)
        result = 1;

    float lastValue = 0;
    if(sensorNumber == S_RIGHT) lastValue = lastLight2;
    if(sensorNumber == S_LEFT) lastValue = lastLight5;
    
    int index = 0;
    
    if(sensorNumber == S_RIGHT)
        index = 1;

    if(currentFixedTimeSteps[index] < fixedTimeSteps && lastValue > 0) {
        currentFixedTimeSteps[index]++;
        result = 1;
    } else if(lastValue == 0)
        currentFixedTimeSteps[index] = 0;

    if(sensorNumber == S_RIGHT) lastLight2 = result;
    if(sensorNumber == S_LEFT) lastLight5 = result;

    if(sensorNumber == S_RIGHT) {
        if(result > 0.1) {
            e_set_led(3,1);
        }else
            e_set_led(3,0);
    }else if(sensorNumber == S_LEFT) {
        if(result > 0.1) {
            e_set_led(5,1);
        }else
            e_set_led(5,0);
    }

    return result;
}

void resetValues() {
    lockReading = 0;
    values[0]=0;
    values[1]=0;
    values[2]=0;
    values[3]=0;
    values[4]=0;
    values[5]=0;
    readTimes = 0;
}

void readValues() {
    if(!lockReading) {
        values[0]+= e_get_calibrated_prox(S_FRONT_RIGHT);
        values[1]+= e_get_calibrated_prox(S_RIGHT);
        values[2]+= e_get_calibrated_prox(S_LEFT);
        values[3]+= e_get_calibrated_prox(S_FRONT_LEFT);
        values[4]+= e_get_ambient_light(S_LEFT);
        values[5]+= e_get_ambient_light(S_RIGHT);
        readTimes++;
    }
}

void averageValues() {
    lockReading = 1;
    if(readTimes > 0) {
        values[0] = values[0]/readTimes;
        values[1] = values[1]/readTimes;
        values[2] = values[2]/readTimes;
        values[3] = values[3]/readTimes;
        values[4] = values[4]/readTimes;
        values[5] = values[5]/readTimes;
    }else {
        values[0] = 0;
        values[1] = 0;
        values[2] = 0;
        values[3] = 0;
        values[4] = 0;
        values[5] = 0;
    }
}

void lightCalibration() {
    leftLightReference = e_get_ambient_light(S_LEFT);
    rightLightReference = e_get_ambient_light(S_RIGHT);
}

int findMaxBehavior(float* outputs, int size) {

    int maxIndex = 0;

    int i;

    for(i = 1; i < size ; i++)
        if(outputs[maxIndex] < outputs[i])
            maxIndex = i;

    return maxIndex;
}

void applyBehavior(int b, float* inputs) {

    if(b == TURN_LEFT)
        turnLeft();
    else if(b == TURN_RIGHT)
        turnRight();
    else
        moveForward(inputs);
}

void moveForward(float* inputs) {

    float distRight = inputs[1];
    float distLeft = inputs[2];

    int speedLeft = forwardSpeed;
    int speedRight = forwardSpeed;

    float percentage = 0.075;

    if(prev == 0){
        if(distLeft > distRight) prev = distLeft;
        if(distRight > distLeft) prev = distRight;
    }

    if(distLeft > distRight && distLeft > 0.8) {
        speedRight-=speedRight*percentage;
    }else if(distRight > distLeft && distRight > 0.8) {
        speedLeft-=speedLeft*percentage;

    }else {
        
        if(distLeft > distRight) {
            if(prev < distLeft)
                speedRight-=speedRight*percentage;
            else
                speedLeft-=speedLeft*percentage;
            prev=distLeft;
        }else if(distRight > distLeft) {
            if(prev < distRight)
                speedLeft-=speedLeft*percentage;
            else
                speedRight-=speedRight*percentage;
            prev=distRight;
        }
    }

    e_set_speed_left(speedLeft);
    e_set_speed_right(speedRight);
}

void turnLeft() {
    //if first time being called
    if(!behaviors[TURN_LEFT]) {
        startSteps = e_get_steps_right();
        e_set_speed_left(-turnSpeed);
        e_set_speed_right(turnSpeed);
        behaviors[TURN_LEFT] = 1;
    }

    if(e_get_steps_right() - startSteps > targetSteps) {
        e_set_speed_left(0);
        e_set_speed_right(0);
        behaviors[TURN_LEFT] = 0;
    }
}

void turnRight() {
    //if first time being called
    if(!behaviors[TURN_RIGHT]) {
        startSteps = e_get_steps_left();
        e_set_speed_left(turnSpeed);
        e_set_speed_right(-turnSpeed);
        behaviors[TURN_RIGHT] = 1;
    }

    if(e_get_steps_left() - startSteps > targetSteps) {
        e_set_speed_left(0);
        e_set_speed_right(0);
        behaviors[TURN_RIGHT] = 0;
    }
}

void cameraTest() {
    /* char buffer[160*2];

    e_po3030k_init_cam();
    e_po3030k_config_cam((ARRAY_WIDTH -160)/2,(ARRAY_HEIGHT-160)/2,
                     160,160,4,4,RGB_565_MODE);
    e_po3030k_write_cam_registers();

    e_po3030k_launch_capture(buffer);

    while(1) {
        while(!e_po3030k_is_img_ready());
        sendString(buffer);
    }*/
}
