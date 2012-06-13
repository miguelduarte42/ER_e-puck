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

//ANN weighs
float ann[] = {6.673809673979845,0.9567931801298626,4.749636255023309,-5.401523219556853,-10.0,-3.569355426063707,8.391619380225785,0.8474542916049075,10.0,-1.9259122163184406,-6.105028878996794,10.0,5.427725121405797,-5.7201499059180865,-4.917912779216056,7.070702900248024,10.0,7.170172391078034,-5.6973363711278635,-9.237228849396889,-7.15290755216894,-0.7377853782539214,-1.0246092143778323,4.377198884524381,5.154895168024574,10.0,0.26026476693508815,1.5639563679074748,-2.295775649783283,3.9358926212975227,1.9057923155215093,8.106172411096274,-4.2877688998337256,1.7320306618263601,-0.43072683457596456,-3.7588008713149073,-7.600169166892564,8.663475035703367,3.5088279985641897,-1.1093525705100429,-2.2551538415427315,2.582308052425945,-0.27648914693779436,4.939642762033612,-4.6051311897396054,-0.46077685172948735,1.3291530313251732,0.4006447437646793,9.456135369521965,3.459123913109444,-2.8514243270544837,1.1903578689542724,-2.695295972238101,3.0736184968272715,-0.2660424408406746,2.283589681578431,-0.002872113978787949,1.072844111338088,-9.280541942807218,4.707925681681601,-5.427334097127003,-7.193934447479429,7.3417037780686565,3.071941065457721,-1.2500481871366629,0.2319429168175336,-6.255626593092681,-4.156933450475266,-9.892369000098821,-1.0250467414052276,-3.4971550503406235,2.7922486788687166,6.076784906481487,1.5450054271390299,4.92021940617239,7.291606403677743,1.2686515336449173,3.736553170227722,4.637937351634471,-4.379709481871973,-3.979810684399334,8.927496578306217,9.88959073942488,0.784438024182544,5.604417034479592,-4.150749397384435,5.278709543376042,3.332469440906571,1.0855430690591619,1.0990304878571897,7.141872035568256,4.0026925926832435,6.9765720566467175,-2.915428754486875,-7.780833728354896,1.181380119598379,3.060832979488675,-5.160890125616429,-8.531919773110008,-1.5064036213072178,-2.0925291418235865,-5.536125632347533,-5.5153812749833,-0.08679160213514747,1.049358071463138,3.1981317322627145,8.287889063215324,0.5083354348483968,2.9386240702963127,-2.605166982387886,0.822418139988754,1.0675540472476026,0.09096933408550173,-9.646240110637303,0.13016556026558423,3.1647762434017213,7.814023333293761,-9.807683218496834,9.899294761926315,3.2219630055858053,-7.6857819105254555,-4.897357071765779,-6.522167088104439,10.0,-6.169708462140214,0.2634440560931868,-8.638657071418331,-3.916815999524048,2.4090447846029983,-5.510569943453075,3.226547995376245,-5.235520740363789,1.6160759003938137,-1.8944074833534854,1.169295242417315,1.9812407542440125,-4.031280804260861,3.607922893136406,8.884265020379836,1.9259679219645507,-3.3057000231443214,-0.5383798807953273,-2.6288689255135207,-5.502656434948123,8.69084601738855,-4.724629222254649,-10.0,-6.841714592657253,-8.952940458126424,-7.315151320593043,-0.6302935989674385,-8.872878850394365,-5.585882079360113,-7.861150206310766,3.9425873170552204,-7.362434991362487,5.610107685213731,2.3521807921143765,-9.413963544232235,-2.758230582342607,-2.4604100964708193,7.831188430546736,-3.032403202298246,-0.9022481294418452,0.9944351114688912,0.041125372209434685,2.775383196214455,3.783393831794452,-5.874016455918749,-4.819526481487016,7.677140749081055,-1.1429805597040472,7.661994948216111,-3.135708133529705,0.7354551286229241,-0.35991216887527355,2.91520864580033,-4.631836550706873,-6.575682072776398,3.063003259522673,-1.0205588357745345,2.5667660765093734};
float corridor[] = {1.2111220874173578,1.695030265510316,-0.5043945129452035,-0.25214525936742005,-3.310688544835588,1.8165061374821159,-3.918651664854313,2.2915926361759142,5.997526067334249,-0.47439156918793984,-3.8069034408699394,-2.1383987619219833,-1.952278773971869,-1.527853156208932,-3.222311911292833,-2.2682134028418366,-0.5075289211824625,0.19149710831449318,-0.36129436615062915,-3.557257803346241,-3.3122601273520367,-1.0791745142331144,-1.1272426607270065,-0.5715657395892051,-6.2024702682895985,0.29824797934545166,-6.629936016952121,2.1750543707571968,-2.6892062525232983,-4.70758226371668,1.2819574786747707,-6.135821621984563,5.2305546118374995,2.5748656839893083,2.090030704380202};
float left[] = {-5.916084021203817,1.0882530779628246,2.0641737597502687,2.28415662225604,0.39132557132720946,-4.020842675840974,-3.035448715632221,-4.143813775730996,-0.3571090616003544,-4.983441468045029,-0.006213481498859252,10.0,-0.9614393923190019,3.4978867476093307,0.6589131055521336,-1.0057188507866819,1.6801209369958419,2.573809997583299,-3.8161581471719197,-5.477715700476551,-3.9488188312489223,-0.23457340210266014,0.21721011445078317,0.30791626215569357,-1.3212467275675066,-3.250399992506177,-5.940875508174553,3.5408813018491436,-6.865172360396701,5.014873907512689,2.9591383689978326,2.6541928482251893,-4.284757647902483,-1.5190304685345226,0.280752560247389};
float right[] = {7.939650287200646,-0.8826478563171114,-3.272181847123387,-3.968933720542571,1.1279689006741214,-6.0429977509195,-1.7185241397355722,4.563694454159609,-0.22434896406511745,0.3979754635926777,-2.4344266986273517,-6.566721917774817,0.37762734606051,1.1983104127026805,1.204772067682856,-0.6207204253459373,-0.13632907617279322,-0.13267196822707883,-3.949220734828085,-1.9673319221723047,-0.535741483169614,-0.8874591155389269,-0.23606373721447388,0.15769721011173632,-7.266469667786915,-7.801128560050118,2.208185563470987,-3.2581263025421565,1.7979705461852085,3.8603585827530345,0.2898303540936612,-1.6294789969416552,-3.593842832393258,0.9502615338580003,1.3053182608937441};

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

int forwardSpeed = 760;//10cm/s
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
        STOP = 109,
        START = 110,
        LED = 111,
        WHEEL_LEFT = 112,
        WHEEL_RIGHT = 113,
        SENSORS = 114;

//Number of times the values from the sensors have been read
long int readTimes = 0;

//Average values read by the sensors while waiting in the ANN cycle
long int values[6];

int main() {

    //initialization
    e_init_port();
    e_init_motors();
    e_init_ad_scan(ALL_ADC);
    e_init_uart1();

    int selector = getSelector();

    if(selector != 0) {
        if(selector < 5)
            dummyANN();
        else
            neuralNetwork();
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

        e_activate_agenda(updateFlag, 1000);
        e_activate_agenda(readValues, 10);
        e_start_agendas_processing();

        while(1) {
            while(!flag);
            flag = 0;
            //preprogrammedCycle();
            regularAnnCycle();
            //hierarquicalAnnCycle();
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
        }while(s != START);

        e_set_led(4,0);

        e_activate_agenda(updateFlag, 1000);
        e_activate_agenda(readValues, 10);
        e_start_agendas_processing();

        finished = 0;

        while(!finished) {
            while(!flag);
            flag = 0;
            sendInputs();

            readOrder();
            readOrder();

            e_set_speed_left(speedLeft);
            e_set_speed_right(speedRight);
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

    resetValues();

    transmitShort(SENSORS);
    transmitShort(fr);
    transmitShort(r);
    transmitShort(l);
    transmitShort(fl);
    transmitShort(lf);
    transmitShort(lr);
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
    } else if(c == STOP) {
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
