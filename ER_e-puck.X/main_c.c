#include "p30f6014A.h"
#include "main_c.h"

#include "motor_led/e_epuck_ports.h"
#include "motor_led/e_init_port.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "motor_led/advance_one_timer/e_agenda.h"

#include "a_d/advance_ad_scan/e_ad_conv.h"
#include "a_d/advance_ad_scan/e_prox.h"

#include "I2C/e_I2C_master_module.h"
#include "I2C/e_I2C_protocol.h"

#include "uart/e_uart_char.h"
#include "e_randb.h"
#include "ctrhnnmultilayercontroller.h"
#include "camera/fast_2_timer/e_po3030k.h"
#include "utilities.h"

#include <string.h>
#include <math.h>
#include <stdlib.h>

//ANN weighs
float ann[] = {1.0186857373517237,-7.475683599040901,-0.4405801663602631,-1.3383211673648836,0.36605074753342737,-1.4725349270331487,-3.1964130950325242,-6.442202232349752,-1.3470574837616127,-6.350548820261115,-1.8085622919149955,0.8439916962152452,1.0872771166000255,-2.625628212579953,-0.9023856106832596,-6.352699062113713,0.8225958361416228,-9.551495700294396,-3.037982492893332,-0.3015422918023814,0.15803511657796643,2.3855950779177926,-9.132388611819124,0.1920570155060468,-5.534369428343568,8.229571194740185,-2.6483392989073673,-9.268471026743297,-0.2934444822919336,1.2142066749695877,-7.5744190961145135,-6.934692524328595,-0.3151964746202238,-6.106833986331924,2.5317228989262146,3.1809511459788795,-7.844566541602759,2.603017437308979,3.9300965238961645,2.108271972584107,-2.1035697183644126,-4.857807416927509,-3.1715096288198543,1.4584762888130542,-2.5374012509042343,-4.689616713063325,3.7724426946901644,-7.249634891494593,-5.624414778370726,-10.0,-3.390022432117288,3.8542347899922142,-4.5793759610852485,-3.064035867549898,-1.7508826476147181,6.521152772264868,4.185895327998204,-2.723871619073064,0.3998504723007248,-1.9383610345020155,-7.061201469216554,2.2052463348438365,-4.23926316939738,-2.845006179555863,-2.0878626136082774,-4.044446028435798,-3.239021458094553,-1.3094402998113681,5.3216595760609415,1.4772707982198223,-2.0667201128341603,0.8201621571315405,-2.7314696064903874,-8.321425678549634,1.3326071643201265,-3.5601397385653,-1.5614087209275131,0.47146897260344306,-6.09326373927271,-0.7641814512147735,-0.8097037328664487,-6.362562051897353,0.5749761678927819,-0.9173963974170033,-4.383132131094809,2.770315846761898,-1.0830365045764998,-4.08468297950306,-0.4720145625674774,-2.7772288583190625,-6.077867423329266,-3.3806217257601183,3.587297920368622,-7.630300433581471,5.4116034676104094,0.06335984623673131,0.15970028391460755,-10.0,-4.984290757171224,-0.37138728125026355,0.5917392400397785,-0.029874519113911147,-1.7314513215415486,-2.0444408523835196,-6.828375558932857,-9.680932993050584,2.057449585436978,0.2902745997579167,-0.5893516132336778,-0.9502955548077974,7.568248020021569,-0.5534358806449735,3.1473355184521723,-4.689113695978695,-6.182789836562501,5.6824034401575885,3.4366914089512703,4.483511444392193,-5.305925775932317,4.184903398077745,1.691616722712368,1.5033500993599447,2.1470468657677033,-0.4564471539863838,-2.272384453818826,-8.01933960023024,-2.391247137015722,-0.02374105253348524,3.927050086859371,0.32583415568415575,3.759649183955654,-0.595789557969494,0.060403496086896824,-0.9099095574613901,-2.8842791259896594,5.911838068118133,0.4579455789317703,1.4989296128810605,-7.161200229465171,-0.2468962281239856,0.8302501979232912,-0.29686855708761173,0.9332173910914583,-1.207399997841522,-7.654212924702881,-4.8921649738789075,-2.079644722127696,3.751878789238153,-6.130517707500769,-2.375747502618644,1.9604966087074727,-1.8533480172389165,-7.064426135734538,-7.385048385189214,-1.9827106224114641,0.3262204905082349,-8.916219685413026,5.754107736406751,-0.8116607039273996,-3.3167022795135868,-6.361751893872746,-9.614016645237374,1.7812522358786023,-5.438142701971375,-5.03278644371958,-1.4585995180496716,8.05532043895285,-0.6370611202520291,-0.6177345908156732,-3.1084411920883,4.631680743186439,1.716464569864367,-3.2770844068826004,-5.578154781960215,4.2919949120990575,3.9025727888577366,0.6455241776560168,-3.769902847995919,-2.4648269417264617,-1.6959897795653263,-3.559135259879885,-8.001864402948584,-3.9786254703436335,-1.767930391690974,3.6470238399515913,-4.329238820591519,0.17603579419943396,-2.3977692638970853,-0.6166911166631428,10.0,-5.91192786730997,2.6565407048504692,-1.6338586300879028};
//float corridor[] = {1.3931838764842643,-0.662158666813073,-0.22055808482353467,-1.700309900372547,4.344124441923328,1.774700447827112,-3.124672431778498,-4.163406143909192,-5.04391721454275,1.180506399367846,-1.628215721803486,-7.085079020900242,-1.9259920244261264,0.7150466597208923,1.5673982919150689,3.4139319319518644,1.916857437914972,-2.4612825185605978,-3.5773908500586726,1.8102262948929364,-1.737470612855581,-5.835175168810551,-0.7690538897973358,2.4185237236260226,0.3613629442155276,-7.499579956048632,-7.868520858241885,1.5366341369291765,-7.054307713182831,3.438058023854003,-2.0479371562655113,6.227829333532279,5.52561171299704,4.083390243581929,0.8854571714904695};
//float left[] = {-2.5208230611619475,1.7423071725264745,-0.4578519866873094,7.671178246654585,1.6038481639669129,2.300409369193382,-0.7211349237390821,-5.152462330382561,4.421619751922505,-1.4978353184114936,-2.967396648229604,5.631858632191838,-3.063698772420594,-3.973552833598986,0.1644079220070817,-1.467398305083888,-1.860975980866346,0.1647515637769515,1.0778673219304693,-0.3058579820968611,-4.856276889016559,0.6426719881994518,0.2102833957117533,0.10817207157788979,-3.3541497146366726,-0.5704548434538509,0.2034629114938285,2.8090822644015043,-2.4088774808721265,-5.12452519350807,-1.10220252709525,2.622858197363396,-2.4251307821132357,1.5648754436893701,0.9601105571627659};
//float right[] = {-2.418097113842574,-3.5327347339525,-0.053595038902610914,-0.3219014741212832,-2.712600911691071,-3.674152786444435,-3.816762196089511,1.6957522705846952,-4.362566275897446,-5.271109651033521,0.8039192682592368,8.343706730082465,0.513679630474204,-1.3047178836944897,4.558885952013647,-1.0572316551790883,0.48921518546850207,-8.445137822011134,-4.283513585715793,-1.2973297632132899,2.2396199027822297,-2.203450664703018,-0.8794902114829515,0.37175954927925,0.9899890779151184,1.4450220826707958,-9.571404065982724,-0.5739501304552994,-7.109848723802777,10.0,1.8288754440138513,-4.479666846656912,-4.904083067322738,0.8239009742048082,3.467480546446145};

int startSteps;
int targetSteps = 333 - 10; //this is around 90 degrees
//int targetSteps = 40;

//Output value for each of the turn behaviors
int behaviors[] = {0,0,0};

//Preprogrammed behaviors
int TURN_LEFT = 0;
int TURN_RIGHT = 1;
int FORWARD = 2;

float inputs[6];

float sensorReferenceValues[] = {3842.55,3774.18,1769.57,979.94,546.55,190.11,99.29,57.8,37.71,23.99,16.61,12.74,10.36,7.99,6.39};

float distances[] = {0,0.5,1,1.5,2,3,4,5,6,7,8,9,10,11,12};
int numberOfDistances = 15;

int forwardSpeed = 650;//760;//10cm/s
int turnSpeed = 76;//1cm/s

float prev = 0;

//Sensor numbers
int S_FRONT_RIGHT = 0,
    S_RIGHT = 2,
    S_LEFT = 5,
    S_FRONT_LEFT = 7;

//Keeps track of how long the light sensor has been active
int currentFixedTimeSteps[] = {0,0};
int fixedTimeSteps = 15;
float leftLightReference = 0;
float rightLightReference = 0;

float lightThreshold = 15;

float lastLight2 = 0,lastLight5 = 0;
float* outputs;

int lockReading = 0;

int activeNetwork = 0;
float timeStep = 0;

int flag = 0;

int speedLeft = 0;
int speedRight = 0;

int finished = 0;

int turnSteps = 0;

int lightSeen = 0;

char LED0_SELECTOR = 2,
        LED1_SELECTOR = 8,
        LED2_SELECTOR = 32,
        LED3_SELECTOR = 128,
        LED0_ON = 1,
        LED1_ON = 4,
        LED2_ON = 16,
        LED3_ON = 64,
        B_STOP = 109,
        B_START = 110,
        LED = 111,
        WHEEL_LEFT = 112,
        WHEEL_RIGHT = 113,
        SENSORS = 114;

//Number of times the values from the sensors have been read
long int readTimes = 0;

//Average values read by the sensors while waiting in the ANN cycle
long int values[6];

int stopped = 0;

int irreceiver = 0;
int irsender = 0;
int foundTeammate = 0;
int foundTeammateSteps = 50;
int ledNum = 0;

int main() {

    //initialization
    e_init_port();
    e_init_motors();
    e_init_ad_scan(ALL_ADC);
    e_init_uart1();

    int selector = getSelector();

    if(selector != 0) {

        if(selector == 1){
            setupRBB();
            irreceiver = 1;
            dummyANN();
        } else if(selector == 2) {
            setupRBB();
            goBack();
        } else if(selector < 5){
            dummyANN();
        }else
            neuralNetwork();
    }

}

void goBack() {

    e_set_led(4,1);
    e_calibrate_ir();
    lightCalibration();
    e_set_led(4,0);

   int selector;

    while(1) {

        inputs[0] = 0;
        inputs[1] = 0;
        inputs[2] = 0;
        inputs[3] = 0;
        inputs[4] = 0;
        inputs[5] = 0;

        timeStep = 0;
        
        selector = getSelector();
        while(selector == getSelector());

        resetValues();

        e_activate_agenda(IRSender, 500);

        e_activate_agenda(updateFlag, 1000);
        e_activate_agenda(readValues, 10);
        e_start_agendas_processing();

        int steps = 0;

        int count0 = 0;
        stopped = 1;
        int countTeammate = 0;

        while(1) {
            while(!flag);
            flag = 0;

            averageValues();

            inputs[0] = sensorToInput(S_FRONT_RIGHT);
            inputs[1] = sensorToInput(S_RIGHT);
            inputs[2] = sensorToInput(S_LEFT);
            inputs[3] = sensorToInput(S_FRONT_LEFT);

            resetValues();

            if(!stopped) {

                if(steps > 50 && !behaviors[TURN_LEFT] && !behaviors[TURN_RIGHT]) {

                    if(behaviors[TURN_LEFT]) {
                        turnLeft();
                    }else if(behaviors[TURN_RIGHT]){
                        turnRight();
                    }else if(inputs[1] > 0.2 && inputs[2] <= 0.2) {

                        if(count0 > 6){
                            turnLeft();
                            steps = 0;
                        }else {
                            count0++;
                            moveForward(inputs);
                        }
                    }else if(inputs[1] <= 0.2 && inputs[2] > 0.2) {
                        if(count0 > 6){
                            turnRight();
                            steps = 0;
                        }else {
                            count0++;
                            moveForward(inputs);
                        }
                    }else{
                        moveForward(inputs);
                    }

                }else if(behaviors[TURN_LEFT]) {
                    turnLeft();
                }else if(behaviors[TURN_RIGHT]){
                    turnRight();
                }else{
                    moveForward(inputs);
                    steps++;
                    count0 = 0;
                }

            }else {
                if(countTeammate > 50){
                    stopped = 0;
                    e_set_led(3,0);
                    e_set_led(4,1);
                    e_set_led(5,0);
                }else if(countTeammate > 0 && inputs[0] < 0.5) {
                    countTeammate++;
                    e_set_led(5,1);
                    e_set_led(3,0);
                }else if(countTeammate >= 0 && inputs[0] > 0.5) {
                    e_set_led(3,1);
                    e_set_led(5,0);
                    countTeammate = 1;
                }/*else if(countTeammate > 0 && inputs[0] > 0.5) {
                    e_set_led(5,0);
                    e_set_led(3,1);
                    countTeammate = 1;
                }*/

            }
        }
    }
}

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

        timeStep = 0;
        createNetworks(1);

        defineNetwork(0,4,10,2);
        //defineNetwork(1,4,3,2);
        //defineNetwork(2,4,3,2);
        //defineNetwork(3,4,3,2);

        setWeights(0, ann);
        //setWeights(1, corridor);
        //setWeights(2, left);
        //setWeights(3, right);

        selector = getSelector();
        while(selector == getSelector());

        resetValues();

        //if(irsender)
        //    e_activate_agenda(IRSender, 1000);

        e_activate_agenda(updateFlag, 1000);
        e_activate_agenda(readValues, 10);
        e_start_agendas_processing();

        while(1) {
                while(!flag);
                flag = 0;
                //preprogrammedCycle();
                //regularAnnCycle();
                hierarquicalAnnCycle();
        }
    }
}

void dummyANN() {

    e_calibrate_ir();
    lightCalibration();

    while(1) {

        resetValues();

        e_set_led(4,1);

        unsigned short s;

        do{
            s = receiveMessage();
        }while(s != B_START);

        e_set_led(4,0);

        e_activate_agenda(IRReceiver, 1000);

        e_activate_agenda(updateFlag, 1000);
        e_activate_agenda(readValues, 10);
        e_start_agendas_processing();

        finished = 0;

        while(!finished) {
            if(!stopped) {
                while(!flag);
                flag = 0;
                sendInputs();

                readOrder();
                readOrder();

                e_set_speed_left(speedLeft);
                e_set_speed_right(speedRight);
            }else{
                resetValues();
            }
        }
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
    
    unsigned short ft = 0;

    if(foundTeammate > 0 && foundTeammate < foundTeammateSteps) {
        foundTeammate++;
        ft = 1000;
    }

    resetValues();

    transmitShort(SENSORS);
    transmitShort(fr);
    transmitShort(r);
    transmitShort(l);
    transmitShort(fl);
    transmitShort(lf);
    transmitShort(lr);
    transmitShort(ft);
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
        }else{
            speedRight = intSpeed;
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
    } else if(c == B_STOP) {
        speedLeft = 0;
        speedRight = 0;
        finished = 1;
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

    sendInt(activeNetwork);

    outputs = computeOutputs(activeNetwork, inputs);

    speedLeft = (int)(forwardSpeed*(outputs[0]-0.5)*2.0);
    speedRight = (int)(forwardSpeed*(outputs[1]-0.5)*2.0);

    e_set_speed_left(speedLeft);
    e_set_speed_right(speedRight);

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

    speedLeft = (int)(forwardSpeed*(outputs[0]-0.5)*2.0);
    speedRight = (int)(forwardSpeed*(outputs[1]-0.5)*2.0);

    e_set_speed_left(speedLeft);
    e_set_speed_right(speedRight);

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

    if(value > lightThreshold && lightSeen < 2)
        result = 1;

    float lastValue = 0;
    if(sensorNumber == S_RIGHT) lastValue = lastLight2;
    if(sensorNumber == S_LEFT) lastValue = lastLight5;
    
    int index = 0;
    
    if(sensorNumber == S_RIGHT)
        index = 1;

    if(currentFixedTimeSteps[index] < (fixedTimeSteps-1) && lastValue > 0) {
        currentFixedTimeSteps[index]++;
        result = 1;
    } else if(lastValue == 0)
        currentFixedTimeSteps[index] = 0;

    //if(lastValue == 0 && result == 1)
    //    lightSeen++;

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

    //sendString("FORWARD");

    e_set_speed_left(speedLeft);
    e_set_speed_right(speedRight);
}

void turnLeft() {
    //if first time being called
    if(!behaviors[TURN_LEFT]) {
        //startSteps = e_get_steps_left();
        e_set_steps_right(0);
        e_set_steps_left(0);
        //sendString("LEFT");
        turnSteps = 0;
        behaviors[TURN_LEFT] = 1;
    }

    e_set_speed_left(-turnSpeed);
    e_set_speed_right(turnSpeed);

    //sendInt(e_get_steps_left());

    if(e_get_steps_left() < -targetSteps && e_get_steps_right() > targetSteps) {
    //if(turnSteps++ > targetSteps+10000) {
        e_set_speed_left(0);
        e_set_speed_right(0);
        behaviors[TURN_LEFT] = 0;
    }
}

void turnRight() {

    //if first time being called
    if(!behaviors[TURN_RIGHT]) {
        //sendString("RIGHT");
        e_set_steps_right(0);
        e_set_steps_left(0);
        //startSteps = e_get_steps_right();
        turnSteps = 0;
        behaviors[TURN_RIGHT] = 1;
    }

    e_set_speed_left(turnSpeed);
    e_set_speed_right(-turnSpeed);

    //sendInt(e_get_steps_right());

    if(e_get_steps_left() > targetSteps && e_get_steps_right() < -targetSteps) {
    //if(turnSteps++ > targetSteps+10000) {
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

void IRReceiver() {

    if(!foundTeammate) {
        if (e_randb_get_if_received()) {
            foundTeammate = 1;
        }
    }

    //unsigned int data = e_randb_get_data;
    //while(r > range)
   // {
        //sendInt(e_get_prox(0));
        //sendNewLine();
        
            //sendInt(r);
            //if(r < range)
              //  e_set_led(8,1);
            //else
              //  e_set_led(8,0);
            //sprintf(tmp,"%d %d %d\n",data.data, (int)(data.bearing * 180.0 / 3.14), data.range);
            //sendInt(data);
            //sendString(tmp);
      //  }
  //  }
 //   dummyANN();
    //return 0;

}

void IRSender() {

    if(stopped)
        e_randb_send_all_data(1);

    //e_randb_uart_send_all_data(data);
/*    if(!foundTeammate) {
        if(sensorToInput(0) > 0.3 || sensorToInput(7) > 0.3) {
            foundTeammate = 1;
        }
    }

    if(foundTeammate && sensorToInput(0) == 0)
        stopped = 0;*/
    //sendInt(data);
}

void setupRBB() {
    e_init_randb(I2C);
    e_randb_set_range(170);
    e_randb_set_calculation(ON_BOARD);
    e_randb_store_light_conditions();
}
