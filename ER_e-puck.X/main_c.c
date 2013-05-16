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
float ann[] = {-0.06021132793849504,-0.14911514449288843,-2.822166145442657,9.526767011047108,-4.591949705560446,2.3247390783400865,-5.827771453101747,-6.553716536562396,3.808565156492382,0.024518842142601083,-7.069013573881338,-9.694472108616297,1.9953045590003988,1.0824786751160864,-1.8153003871835562,4.494614479658232,-4.95898657867666,-3.632344209372487,-2.092069290398271,4.726626355741221,0.25657113167247214,0.9628714782534633,-1.0207571074240065,-1.5578835881929762,2.5289849189772555,-7.096551333001298,-2.6664669335123996,1.6081001926609573,3.466996242289394,7.477431293905786,-5.612457165084548,-0.09503622981920257,0.8045543791352823,-1.347975781244698,-2.255267776123499,-0.42405513541392253,4.552971718134646,0.23879634177667008,-4.422131436778603,4.053844844941706,2.285361343112442,0.7184351009910308,8.875327688884216E-4,0.7666226425071341,2.99156642293625,-10.0,3.6208494513546285,-2.4650220549570347,0.23386361252537424,0.9988279843228911,-0.6077850136486325,-0.8225487184274883,6.944108064931556,-2.238595988153843,-7.379703881965168,0.8616236074752985,1.3836842323429521,-8.997549919583761,-0.9774895467045642,0.15595589268333865,1.4231393500002647,2.401569329725694,2.1647832638251288,-6.801863768694237,-1.5029501890087102,-2.635197751597112,-3.1027699287016675,6.334997570423093,6.141081810782875,-1.0985067827211614,0.9226024576612017,2.514059729543014,-0.16881864406660985,-2.444346337813917,-1.632476147432982,-0.4435468647494398,-3.4758873494104474,-7.047289942308272,3.645704322261033,-3.7784676714722005,-2.3598173669251463,0.050032891085421916,0.6065953689337724,3.022457476381047,5.502117491503103,-2.046016554332,1.970552029969749,5.366653241042987,-3.4951338079602805,2.975400241349778,-2.009012300123029,3.9130052760911567,2.958400347381006,-2.6241454972949203,-2.109601924744304,1.6843935588261059,2.8506677051628673,-2.7297974986450395,-1.66551508741958,-7.521307087735304,-4.1375327735855425,1.2769633892227712,-4.229951089507445,-4.845342724965588,0.7981498019569926,-3.533786140722191,4.925738819577332,-3.675434853774087,-3.0450462529168765,-3.3605373319706175,-0.44802771423336024,6.124409593537153,5.758248404041916,6.296968833392105,-2.0089466701334224,-1.7431259876377978,-1.0229465325756228,6.502076391859896,-4.957558633334982,-2.7033036583643106,1.6030392538396017,4.037005021991002,-0.8312036368011567,-4.979364401479448,3.7090266280949287,2.764765861604539,0.25273688359864765,-0.14243455604087862,-0.9965586207488779,0.5642422131198717,2.362745726147997,-0.0622319043510593,2.8805457750332706,1.2314065445263345,-7.207847744984386,-5.090264379381912,0.5786325188950148,-1.769849837705575,-0.39439890908339037,3.2884928771224047,-4.330923610260073,2.4950073882063313,-4.78048995754318,2.9885565000944583,-3.254342394428328,-1.7078332561725897,1.605999873961888,2.692254503529327,-0.2778202965230332,-2.4775237823718483,3.5487186184488317,-3.0481835963857007,1.7016014744523058,-3.4092414657763106,1.3995981370169004,1.731489507641144,2.8567789455085024,-5.957659238980295,-2.325805681000732,-4.289331008739973,0.6039977947203197,0.024433925996459244,-3.0766740734822142,-3.227120616170864,-2.1180815878769863,2.2910109396347744,3.7922643116126302,-0.35711477733044605,0.5278342054457806,-0.12232142544921842,2.0059765176667086,5.63188038839784,-3.995389300168748,0.7846776513152867,-2.127432044982534,6.201216683894405,3.9665571843141625,-3.9465464557727348,2.777885823346731,-4.8707091155422635,-1.961078405039823,-0.9522530562866448,-0.9670067676175126,0.9327685027880214,5.8503960147100935,-0.9164482758269017,3.9872692198748245,1.466853780103132,2.3663125173271387,5.582542120849785,1.1867611014102106,2.282469001918452,-1.434050585181991,-1.0211036929594204,2.331425608266823,1.0365184400434049,-1.3612516111865047,-1.7082005605900692,-1.884335558768329,4.361016156542867,1.1024598471138936,3.241507885523464,1.836279211068291,3.7058408726492975,-4.860502122421761,-6.816836994967846,4.565479351784922,-3.6683062148078798,0.7450576625901679,-4.7224955822216765,0.3875090992678607,3.0100313474855436,2.987107915537787};//{-4.892571396806224,-2.6172320345256903,3.9300575812298293,-2.021969801980863,5.25798975533254,2.5505970445978985,-5.263115231364518,0.7713200598806977,-0.4762149478310928,-6.814588757661554,4.179739083583238,-5.643233995956258,-5.357385997688704,3.8561397766809353,1.5892222810153964,1.785625386577258,-4.764871824659019,0.9880085631538453,-3.8710196080695627,-3.891245585739194,1.1867751689774138,-3.5024555321508157,-0.11525422962518395,-0.032687178786589235,-4.7794466620423215,-3.2971663251349836,0.25414513123101856,-4.4670920496422495,3.926484090130841,1.2521807592800716,-4.255107740128854,-0.4377404181847975,4.267821874753887,-5.784152965284471,3.97505170412003,-6.2444609147304355,1.3893582132476134,-0.9966059168406435,0.9813380955195887,-10.0,-1.826241979823388,-2.0292607576022528,0.9145221536470398,1.2524388841478857,-3.3780756811391126,0.6142734486929716,-7.065960089871275,-8.987514438623581,-3.314987348125952,-0.7155762415705308,-1.7870256002546046,-6.711173383730195,-2.9663679286259934,2.2876188793938526,-3.563871099606654,-2.701809143727588,-4.994647321251022,-4.696135488249396,-1.5243414260504131,-1.886580943400208,-4.554267714525289,3.752823614371245,3.0157758041906764,2.6845501880889766,8.477664036139785,5.023331486771354,-0.46303093544302065,-4.240529174799205,-3.050667918871712,0.6513323690516067,-0.07644688158134312,-1.3033704813361782,1.8237760839745694,-0.9754750657087984,-7.530473857090967,-2.3805094392091233,-0.1098753393843861,-4.2770487568334525,-5.922290035833086,1.7930231710392586,4.990382951013529,-1.5953337260010196,0.13425314175074288,-1.3058643827514524,-3.015352602264408,1.135347110056585,-4.623194057558824,1.4488815136198945,0.7145097324761145,-1.6304550950528578,3.837680544512474,-2.61128715955164,-1.2178776014348118,3.0673260287472317,-1.1069192378056243,3.3589320833039125,-2.441665571147624,1.996756154354367,-1.693691257825816,-4.106506533288527,-1.74216880917131,2.743388408182944,-4.265646051251441,3.2473878684600552,-1.910628355452632,-1.925196097236306,-0.24082239570747171,-2.8118523781406726,-0.14644521799709664,-3.0419931529284625,1.8339515181240347,0.7305828371242019,-2.239510845301691,-2.8710178408101106,-5.154224715487683,3.6317698626442616,5.821683395260096,-5.224201467289985,-5.003908688027581,-3.742871601563149,-1.0041766342759342,-0.8664333945155396,6.937260450614118,-2.334015527850952,-4.669250797334951,2.149144505617474,-1.9235806093568135,1.361015255901729,0.36449007767943264,1.6426824003146339,0.6651914801578572,0.8366304417751741,0.2589081481186837,3.6054969551136575,1.2046157098117374,1.3366522406611148,-8.200057031553396,0.06815285486592604,-0.4205685372034248,-2.1657767538116506,-3.238497216208489,-1.1608614079676771,-2.242209154639288,-2.708184068995775,-2.4703063910503937,-3.8821966387617763,-2.664939415124282,-2.4400627254815843,3.1143066814592792,2.29303034791266,2.443016097407217,1.302977295029824,1.9171731876036424,0.6111801313710796,-3.4812868503002528,-3.9714948170753814,-0.7199204739519811,-7.007114682698424,-4.191297000423149,-5.0533886919563695,-3.088718339454356,-3.367080578337837,1.3445654007835015,2.522560128841258,0.4164327731116888,-4.50598018778113,2.7580656557884518,-10.0,0.7009539288971658,-0.3332326079196282,-7.614388175057757,-1.7948014549252536,5.3568559530262005,0.09437827012145739,-4.691400865621626,-3.248494889651189,6.037019789649941,-4.884479676949442,-0.25299082796877287,4.3139650022081195,0.2783904046383248,-1.2201101063923936};
//float corridor[] = {1.3931838764842643,-0.662158666813073,-0.22055808482353467,-1.700309900372547,4.344124441923328,1.774700447827112,-3.124672431778498,-4.163406143909192,-5.04391721454275,1.180506399367846,-1.628215721803486,-7.085079020900242,-1.9259920244261264,0.7150466597208923,1.5673982919150689,3.4139319319518644,1.916857437914972,-2.4612825185605978,-3.5773908500586726,1.8102262948929364,-1.737470612855581,-5.835175168810551,-0.7690538897973358,2.4185237236260226,0.3613629442155276,-7.499579956048632,-7.868520858241885,1.5366341369291765,-7.054307713182831,3.438058023854003,-2.0479371562655113,6.227829333532279,5.52561171299704,4.083390243581929,0.8854571714904695};
//float left[] = {-2.5208230611619475,1.7423071725264745,-0.4578519866873094,7.671178246654585,1.6038481639669129,2.300409369193382,-0.7211349237390821,-5.152462330382561,4.421619751922505,-1.4978353184114936,-2.967396648229604,5.631858632191838,-3.063698772420594,-3.973552833598986,0.1644079220070817,-1.467398305083888,-1.860975980866346,0.1647515637769515,1.0778673219304693,-0.3058579820968611,-4.856276889016559,0.6426719881994518,0.2102833957117533,0.10817207157788979,-3.3541497146366726,-0.5704548434538509,0.2034629114938285,2.8090822644015043,-2.4088774808721265,-5.12452519350807,-1.10220252709525,2.622858197363396,-2.4251307821132357,1.5648754436893701,0.9601105571627659};
//float right[] = {-2.418097113842574,-3.5327347339525,-0.053595038902610914,-0.3219014741212832,-2.712600911691071,-3.674152786444435,-3.816762196089511,1.6957522705846952,-4.362566275897446,-5.271109651033521,0.8039192682592368,8.343706730082465,0.513679630474204,-1.3047178836944897,4.558885952013647,-1.0572316551790883,0.48921518546850207,-8.445137822011134,-4.283513585715793,-1.2973297632132899,2.2396199027822297,-2.203450664703018,-0.8794902114829515,0.37175954927925,0.9899890779151184,1.4450220826707958,-9.571404065982724,-0.5739501304552994,-7.109848723802777,10.0,1.8288754440138513,-4.479666846656912,-4.904083067322738,0.8239009742048082,3.467480546446145};

int startSteps;
int targetSteps = 333 - 10; //this is around 90 degrees
//int targetSteps = 40;

//Output value for each of the turn behaviors
int behaviors[] = {0,0,0};

//Preprogrammed behaviors
int FORWARD = 0;
int TURN_LEFT = 1;
int TURN_RIGHT = 2;

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

long lightValues[2][3];
long leftLightIndex = 0;
long rightLightIndex = 0;

float lightThreshold = 10;

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

        if(selector == 1) {
            
            e_calibrate_ir();
            lightCalibration();

            while(getSelector() == 1);
            
            e_activate_agenda(readValues, 10);
            e_activate_agenda(updateFlag, 100);
            
            e_start_agendas_processing();

            while(1) {

                int i = 0;

                e_set_speed_left(170);
                e_set_speed_right(-170);
                
                flag = 0;
                while(1) {
                    while(!flag);
                    flag = 0;
                    sendInputs();
                }
            }

        } else if(selector == 2) {

            e_start_agendas_processing();
            int leftSpeed = 650;
            int rightSpeed = 650;
            e_set_speed_left(leftSpeed);
            e_set_speed_right(rightSpeed);
            while(1);

        } else if(selector == 1){
            setupRBB();
            irreceiver = 1;
            dummyANN();
        } else if(selector == 2) {
            setupRBB();
            goBack();
        } else if(selector <= 6){
            dummyANN();
        }else if(selector == 7) {
            lightTest();
        } else
            neuralNetwork();
    }

}

void lightTest() {
    e_calibrate_ir();
    lightCalibration();

    e_set_led(4,1);

    while(1) {

        int selector = getSelector();

        while(selector == getSelector());

        e_set_led(4,0);

        e_activate_agenda(updateFlag, 500);//1000
        e_activate_agenda(readValues, 10);
        e_start_agendas_processing();

        e_set_speed_left(680);
        e_set_speed_right(680);

        finished = 0;

        int i = 0;

        while(!finished) {
            if(!stopped) {
                while(!flag);
                flag = 0;
                averageValues();

                int rawValue = values[5];
                int value1 = rightLightReference-rawValue;

                rawValue = values[4];
                int value2 = leftLightReference-rawValue;

                resetValues();

                char b1[20];
                sprintf(b1,"%d %d %d\n",i,value1,value2);
                i++;
                e_send_uart1_char(b1,20);

            }else{
                resetValues();
            }
        }
    }
    
}


void dummyANN() {

    e_calibrate_ir();
    lightCalibration();

    int selector = getSelector();

    while(1) {

        resetValues();

        e_set_led(4,1);

        unsigned short s;

        do{
            s = receiveMessage();
        }while(s != B_START);

        e_set_led(4,0);

        e_activate_agenda(IRReceiver, 5000);

        e_activate_agenda(updateFlag, 500);//500//1000
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
    unsigned short ll;// = lightToInput(S_LEFT)*1000;
    unsigned short lr;// = lightToInput(S_RIGHT)*1000;
    
    //unsigned short ft = 0;

    //if(foundTeammate > 0 && foundTeammate < foundTeammateSteps) {
    //    foundTeammate++;
    //    ft = 1000;
    //}

    if(getSelector() == 6) {
        ll = lightToInput(S_LEFT)*1000;
        lr = lightToInput(S_RIGHT)*1000;
    }

    resetValues();

    transmitShort(SENSORS);
    transmitShort(fr);
    transmitShort(r);
    transmitShort(l);
    transmitShort(fl);

    if(getSelector() == 6) {
        transmitShort(ll);
        transmitShort(lr);
        //transmitShort(ft);
    }
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

float sensorToInput(int sensor) {

    float value;

    if(sensor == S_FRONT_RIGHT)     value = values[0];
    else if(sensor == S_RIGHT)      value = values[1];
    else if(sensor == S_LEFT)       value = values[2];
    else if(sensor == S_FRONT_LEFT) value = values[3];

    if(lightValues[0][0] > 5 && lightValues[0][1] > 5 && lightValues[0][2] > 5 && sensor == S_LEFT) {
        return 0.2;
    }

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
    int lightIndex = 0;
    
    if(sensorNumber == S_RIGHT){
        rawValue = values[5];
        value = rightLightReference-rawValue;

        lightIndex = 1;
        lightValues[lightIndex][rightLightIndex] = value;
        rightLightIndex++;
        rightLightIndex = rightLightIndex % 3;
    }else if(sensorNumber == S_LEFT) {
        rawValue = values[4];
        value = leftLightReference-rawValue;

        lightValues[lightIndex][leftLightIndex] = value;
        leftLightIndex++;
        leftLightIndex = leftLightIndex % 3;
    }

    float result = 0;

    int above5 = 0;

    int i;
    for(i = 0 ; i < 3 ; i++) {
        if(lightValues[lightIndex][i] > 5)
            above5++;
    }

    if(above5 == 3 && lightSeen < 2)
        result = 1;

    //if(value > lightThreshold && lightSeen < 2 && sensorEnabled)
    //    result = 1;

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

    if(lastValue == 0 && result == 1)
        lightSeen++;

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
    values[0]=0;
    values[1]=0;
    values[2]=0;
    values[3]=0;
    values[4]=0;
    values[5]=0;
    lockReading = 0;
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
    //if(!foundTeammate) {
    //    if(sensorToInput(0) > 0.3 || sensorToInput(7) > 0.3) {
    //        foundTeammate = 1;
    //    }
    //}

    //if(foundTeammate && sensorToInput(0) == 0)
    //    stopped = 0;
    //sendInt(data);
}

void setupRBB() {
    e_init_randb(I2C);
    e_randb_set_range(170);
    e_randb_set_calculation(ON_BOARD);
    e_randb_store_light_conditions();
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

        defineNetwork(0,6,10,3);
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
                
                preprogrammedCycle();

                //regularAnnCycle();
                //hierarquicalAnnCycle();
        }
    }
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
                }//else if(countTeammate > 0 && inputs[0] > 0.5) {
                //    e_set_led(5,0);
                //    e_set_led(3,1);
                //    countTeammate = 1;
                //}

            }
        }
    }
}