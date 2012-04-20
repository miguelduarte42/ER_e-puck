#include "p30f6014A.h"

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
#include "hierarchycalcontroller.h"
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include "camera/fast_2_timer/e_po3030k.h"
#include "tests.h"
#include "main_c.h"

#define BAUDRATE 115200

int startSteps;
int targetSteps = 333 - 10;//you can make it turn a bit more than 90degrees if necessary
int behaviors[] = {0,0,0};
int TURN_LEFT = 0;
int TURN_RIGHT = 1;
int FORWARD = 2;

float* inputs;

float weights[] = {-9.164682623286234,5.2405140216318085,-3.087988515232065,-9.598277161858366,7.711675579909836,3.0350695059426616,6.368687183689318,-8.512526741603805,-2.673621103808827,-5.509726723629,-9.929953193954507,1.097656001340961,-0.3941188600401685,-6.527425984151944,-4.625180820126049,10.0,-1.3496940990929358,1.5859930842986256,0.7352898721216057,-8.786182432932533,-6.97240082569839,-8.167353368986335,4.039671380004358,7.288910036589007,-3.526265620947335,10.0,-1.4759082418411962,-5.681697918355943,2.0314146613552637,8.31719561075607,4.472413329640704,-5.268002582688053,1.2427348266109672,-5.5125243550307506,-9.11657397593498,6.678384623752252,6.459509133773524,4.3534179145189515,-7.229740393870425,-2.907766383094964,5.956999143740342,5.500810470164953,-0.9962860917031322,3.593005334519387,3.9078346365448198,-6.329023495200543,2.2173853169697564,4.269642033223368,-5.037486601723941,-3.3284733189900613,2.1521659629241583,-9.573610653010943,10.0,-3.5312942973959434,-8.267487780095195,-8.873972663515525,-5.76071053879088,1.1037805467038044,0.5642520150679184,3.0069775724549634,5.309297120370352,-3.2493660453332227,-8.049694247399202,0.7140833125006394,-7.201056067893969,-8.442645341590001,-0.23894752372817848,-10.0,-3.1643078853975313,-1.9616343520603563,-6.631110249485758,-3.2688574226994893,-6.322558802147567,-2.1734019812625296,10.0,1.7326509229667728,-8.23648079155781,-10.0,-5.136815359780853,-4.517799572583258,-6.5020721672628286,-3.436151456032249,3.8445499889826085,2.9893433611521845,6.903902439283039,10.0,-4.956768607315159,-0.6196182220959792,-5.682000054112513,-7.038864812072307,8.720398538172573,0.255338283563722,-0.38590842294914784,3.225022620460346,-8.286454302438436,-1.7068142387475749,-5.101480625274459,-2.5187005998116447,0.62577785902722,3.547620804031299,-3.2188535904036875,-4.773188944820728,3.3529307288391887,-5.778056563948166,-5.39639345114026,0.6602214683211722,-5.185332598485351,-2.3186445362445727,-2.2780670398962624,-8.086197775804763,10.0,-9.507066603655067,-3.3643007924317962,9.493113135047263,2.9005581307646584,10.0,-1.3613673753106665,-8.754432744708161,-6.323016394707461,-0.3677550476508666,8.989014753510965,3.3536724307042114,-4.015436262640064,2.610876307108452,2.002223469210275,-1.4627811325102458,-10.0,-6.223877333768151,0.014059198314064991,-5.313908111504387,-0.6476483313545554,6.830481538685797,9.825662509166543,-9.271053887056839,-3.1445313282727883,-5.5024607320139385,7.332104403070956,-0.4317304263593084,3.5078573437145595,4.401021365864727,-3.8468609452297833,-5.018092325339607,-4.570504431751047,1.0635499048129669,-4.341673136196703,-1.819865491787942,1.942036299812962,-4.6474679368077885,-3.481695088533179,-10.0,-9.633312345747143,-3.810907097813074,-9.884128947913212,1.2698141241619576,-0.10612737912779935,3.2122491665422173,-3.045542420042149,7.676672512352347,8.365551191682975,5.934124337962628,-9.346554325843242,-6.4182135996371175,-0.9089448193481917,-2.1664280315436666,-8.142755303172901,2.2964439819863474,-4.815992965170331,-8.779801924212151,4.670399109650315,-2.310039212004189,-0.8785669741039632,-5.1323148800096305,10.0,-0.9695952250147944,-5.038469122120778,-0.6355262493655616,-4.468074327314873,-5.305797541036257,-6.001833125773041,-3.9420055734256128,-0.007307815443304333,7.423576145265626,-5.958092820493072,0.7325272806247043,6.152451526228453,0.8156300743340736,-4.5698062702189315,-5.560113631582325,-3.3613639650348492,1.5327824584506546,-1.1418467229582177,-2.4004341806088574,-4.929529329004753,5.071191768016243,3.4128604033529304,-2.1035415989889192,-3.572574757814336,2.3123693288388765,-10.0,-0.40309430791972,-1.1051080656599024,-1.5789308122696835,0.5631995095202075,3.614961293914745,-4.713616071366137,-4.314290444926459,10.0,-3.62645354813995,3.38750152412341,-2.5522013636855685,-5.952036261752146,1.2737908830629578,-1.1610831021102828};
float corridor[] = {-6.616121370699313,-9.043912833071044E-4,1.5032863630309485,0.6244008271845928,4.891734832662374,0.38099440074751756,0.03126109111289052,-4.780775810320788,-7.94931421274473,2.835676118247296,-2.8562128983955146,-3.7450416890205585,-0.8139674430206081,-3.979845801668362,-0.5409698813119663,2.4997336728160686,-0.3499494297393089,-1.8735329368823381,-4.600451941030473,-4.03394978357712,-4.818976440279687,0.9842590677429728,-1.3728101580251448,1.989384913226786,-1.7099487975490493,-5.494783982310734,-3.842411894148708,1.9135089776239904,-2.354745362388502,0.16600930796098834,-1.3136536900533253,7.130745893155513,0.39295040022649746,2.6607165658867125,1.0034047058755338};
float leftturn[] = {0.47610623195797425,-1.4824545982916164,-6.345075888454299,5.434642294772442,-4.360638881243151,1.0192818530880616,3.1785715833712174,2.3662383419154405,-10.0,1.1015499191351363,0.5375568622268201,3.8435953340494193,-1.824512616579989,-0.6624821413227172,1.807407425469572,-0.6123934982122035,-0.28792270005726983,2.102703168760996,0.5014171771637748,-0.7058121482741524,-2.98703679853403,-0.9618411619168675,6.3170608383930125,1.6410733871960805,-6.307587891582519,-2.4401525741142533,-5.643655485926937,-5.334712587561342,0.7798666168959172,7.957544977890706,-0.16798867868298162,2.6095776094550303,-4.168152317784758,-0.7045474762318571,2.041552984850552};
float rightturn[] = {-1.6525688949335178,-3.3405708917088415,-5.06931703755196,-6.031413252901572,-3.6081181965457487,2.555400637932176,1.6561240986883297,-4.2275533652407375,-1.0287302632237647,2.4269582581651554,1.3344463600631669,-8.61704706913138,2.922098071474519,5.916264387090377,-2.81398748545879,-5.250192317300627,4.464213794211311,-3.365464567846417,-0.4467430599961183,-8.13590322329216,-1.7251915612708277,-2.696693023712929,-2.584928503670807,0.40377240012127974,3.407498262409527,-3.729732513749351,-8.167343934169955,0.09449072623438604,-2.529440135823686,-4.2724226735731285,4.611010105263753,2.7210720389478054,8.766854614761193,5.335061753353333,-0.8051458920793152};

float sensorReferenceValues[] = {3842.55,3774.18,1769.57,979.94,546.55,190.11,99.29,57.8,37.71,23.99,16.61,12.74,10.36,7.99,6.39};

float distances[] = {0,0.5,1,1.5,2,3,4,5,6,7,8,9,10,11,12};
int numberOfDistances = 15;

int forwardSpeed = 776;//10cm/s
int turnSpeed = 80;//1cm/s

float clocksPerSecond = 15000000.0;//100ms

float prev = 0;

long* values;//Average values read while waiting in the ANN cycle

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
int semaforo = 0;

void updateSemaforo(void);

int main() {

    //system initialization
    e_init_port();    			// configure port pins
    e_init_motors();
    e_init_ad_scan(ALL_ADC);	// configure Analog-to-Digital Converter Module
    e_init_uart1();// initialize UART to 115200 Kbaud
    //e_start_agendas_processing();*/

    int selector = getSelector();

    if(selector != 0) {

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

        // buffer contain a 40*40 RGB picture now
        

        //checkStuff(); //check ambient light
        //neuralNetwork();
        
        //neuralNetwork();
        //regularNeuralNetwork();
        hierarchicalNeuralNetwork();

        //testProximity(2);

        //checkStuff();

        /*e_calibrate_ir();
        myCalibration();
        e_set_speed_left(776);
        e_set_speed_right(776);

        int step = 0;

        while(1) {
            sendInt(step++);
            sendInt(e_get_calibrated_prox(0));
            sendInt(e_get_calibrated_prox(2));
            sendInt(e_get_calibrated_prox(5));
            sendInt(e_get_calibrated_prox(7));
            sendNewLine();
        }

        //testProximity(2);

        if(selector == 1)
            testProximity(0);
        if(selector == 2)
            testProximity(2);
        if(selector == 3)
            testProximity(5);
        if(selector == 4)
            testProximity(7);
       
        if(selector == 1)
            sendProximity(0);
        else if(selector == 2)
            walkAwayFromWall();
        else if(selector == 3)
            neuralNetwork();
        else if(selector == 4)
            regularNeuralNetwork();
         else if(selector == 5)
            sendAllValues();
        else if(selector == 6)
            sendSensor();
        else if(selector == 7)
            sendAllSensors();
        else
           wallAvoider();*/
    }

}

void run(void);

void hierarchicalNeuralNetwork() {

    e_set_led(4,1);
    e_calibrate_ir();
    myCalibration();
    e_set_led(4,0);

    float waitTime = clocksPerSecond/10.0;
    float diff;
    time_t start,end;
    int selector;
    int numberOfInputNeurons = 6;
    int numberOfOutputNeurons = 3;

    values = malloc(numberOfInputNeurons*sizeof(long));
    inputs = malloc(numberOfInputNeurons*sizeof(float));

    while(1) {

        //e_set_speed_left(0);
        //e_set_speed_right(0);

        inputs[0] = 0;
        inputs[1] = 0;
        inputs[2] = 0;
        inputs[3] = 0;
        inputs[4] = 0;
        inputs[5] = 0;

        sendDouble(0.0f);

        selector = getSelector();
        while(selector == getSelector());

        sendDouble(2.0f);

        time (&start);

        /*do {
            time (&end);
            diff = difftime(end,start);
            sendLong(start);
            sendLong(end);
            sendLong(diff);
            sendNewLine();
        }while(diff < waitTime*20);*/

        sendDouble(1.0f);

        timeStep = 0;
        HCreateNetworks(4);
        HDefineNetwork(0,6,10,3);
        HDefineNetwork(1,4,3,2);
        HDefineNetwork(2,4,3,2);
        HDefineNetwork(3,4,3,2);
        HSetWeights(0, weights);
        HSetWeights(1, corridor);
        HSetWeights(2, leftturn);
        HSetWeights(3, rightturn);

        outputs = malloc(numberOfOutputNeurons*sizeof(float));
        outputs[0] = 0;
        outputs[1] = 0;
        outputs[2] = 0;

        selector = getSelector();
        time (&start);

        e_activate_agenda(updateSemaforo, 1000);
        e_activate_agenda(readValues, 100);
        e_start_agendas_processing();

        while(1) {
            while(!semaforo);
            semaforo = 0;
            hCycle();
        }
    }
}

void updateSemaforo(void) {
    semaforo = 1;
}

void run(void) {
    e_set_speed_left(leftSpeed);
    e_set_speed_right(rightSpeed);
}

void hCycle(void) {

    //e_set_speed_left(leftSpeed);
   // e_set_speed_right(rightSpeed);

    averageValues();

    inputs[0] = sensorToInput(S_FRONT_RIGHT);
    inputs[1] = sensorToInput(S_RIGHT);
    inputs[2] = sensorToInput(S_LEFT);
    inputs[3] = sensorToInput(S_FRONT_LEFT);

    inputs[4] = lightToInput(S_LEFT);
    inputs[5] = lightToInput(S_RIGHT);

    outputs = HComputeOutputs(0, inputs);

    int newActiveNetwork = findMaxBehavior(outputs, 3) + 1;

    if(newActiveNetwork != activeNetwork)
        HResetNetwork(newActiveNetwork);

    activeNetwork = newActiveNetwork;

    outputs = HComputeOutputs(activeNetwork, inputs);

    leftSpeed = (int)(forwardSpeed*(outputs[0]-0.5)*2.0);
    rightSpeed = (int)(forwardSpeed*(outputs[1]-0.5)*2.0);

    //leftSpeed = 500;
    //rightSpeed = 500;

    e_set_speed_left(leftSpeed);
    e_set_speed_right(rightSpeed);

    timeStep++;

    if(((int)timeStep) % 10 == 0)
        sendDouble(timeStep);
    
    resetValues();
}

int getSelector() {
    return SELECTOR0 + 2*SELECTOR1 + 4*SELECTOR2 + 8*SELECTOR3;
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

    if(currentFixedTimeSteps[index] < fixedTimeSteps && lastValue > 0.9) {
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

void regularNeuralNetwork()
{
    e_set_led(4,1);
    e_calibrate_ir();
    myCalibration();
    e_set_led(4,0);

    int numberOfInputNeurons = 4+2;
    int numberOfHiddenNeurons = 10;
    int numberOfOutputNeurons = 2;

    DefineNetwork(numberOfInputNeurons,numberOfHiddenNeurons,numberOfOutputNeurons);

    SetWeights(weights);

    float* outputs;

    float waitTime = clocksPerSecond/10.0;
    float diff;
    time_t start,end;
    time (&start);

    int leftSpeed = 0;
    int rightSpeed = 0;

    inputs = malloc(numberOfInputNeurons*sizeof(float));
    values = malloc(6*sizeof(long));

    outputs = malloc(numberOfOutputNeurons*sizeof(float));
    outputs[0] = 0;
    outputs[1] = 0;
    outputs[2] = 0;

    e_set_speed_left(0);
    e_set_speed_right(0);

    inputs[0] = 0;
    inputs[1] = 0;
    inputs[2] = 0;
    inputs[3] = 0;
    inputs[4] = 0;
    inputs[5] = 0;

    int selector = getSelector();
    while(selector == getSelector());

    time (&start);

    do {
        time (&end);
        diff = difftime(end,start);
    }while(diff < waitTime*20);

    while(1) {

        resetValues();
        do {
            readValues();
            time (&end);
            diff = difftime(end,start);
        }while(diff < waitTime);
        time (&start);
        averageValues();

        inputs[0] = sensorToInput(0);
        inputs[1] = sensorToInput(2);
        inputs[2] = sensorToInput(5);
        inputs[3] = sensorToInput(7);

        inputs[4] = lightToInput(5);
        inputs[5] = lightToInput(2);

        outputs = ComputeOutputs(inputs);

        leftSpeed = (int)(forwardSpeed*(outputs[0]-0.5)*2.0);
        rightSpeed = (int)(forwardSpeed*(outputs[1]-0.5)*2.0);

        e_set_speed_left(leftSpeed);
        e_set_speed_right(rightSpeed);
    }
}

void neuralNetwork()
{
    e_set_led(4,1);
    e_calibrate_ir();
    myCalibration();
    e_set_led(4,0);

    int activeBehavior;
    float waitTime = clocksPerSecond/10.0;
    float diff;
    time_t start,end;
    int selector;
    int numberOfInputNeurons = 4+2;
    int numberOfHiddenNeurons = 10;
    int numberOfOutputNeurons = 3;

    int i;
    float timeStep;

    values = malloc(6*sizeof(long));
    inputs = malloc(numberOfInputNeurons*sizeof(float));

    while(1) {

        e_set_speed_left(0);
        e_set_speed_right(0);

        inputs[0] = 0;
        inputs[1] = 0;
        inputs[2] = 0;
        inputs[3] = 0;
        inputs[4] = 0;
        inputs[5] = 0;

        selector = getSelector();
        while(selector == getSelector());

        time (&start);

        do {
            time (&end);
            diff = difftime(end,start);
        }while(diff < waitTime*20);


        timeStep = 0;
        DefineNetwork(numberOfInputNeurons,numberOfHiddenNeurons,numberOfOutputNeurons);

        SetWeights(weights);

        float* outputs = malloc(numberOfOutputNeurons*sizeof(float));
        outputs[0] = 0;
        outputs[1] = 0;
        outputs[2] = 0;

        selector = getSelector();
        time (&start);

        while(1) {

            resetValues();
            do {
                readValues();
                time (&end);
                diff = difftime(end,start);
            }while(diff < waitTime);
            time (&start);
            averageValues();

            inputs[0] = sensorToInput(S_FRONT_RIGHT);
            inputs[1] = sensorToInput(S_RIGHT);
            inputs[2] = sensorToInput(S_LEFT);
            inputs[3] = sensorToInput(S_FRONT_LEFT);

            inputs[4] = lightToInput(S_LEFT);
            inputs[5] = lightToInput(S_RIGHT);

            outputs = ComputeOutputs(inputs);

            activeBehavior = 999;

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
        }
    }
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

void myCalibration() {
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
        e_set_speed_right(-turnSpeed);//100
        behaviors[TURN_RIGHT] = 1;
    }

    if(e_get_steps_left() - startSteps > targetSteps) {
        e_set_speed_left(0);
        e_set_speed_right(0);
        behaviors[TURN_RIGHT] = 0;
    }
}
