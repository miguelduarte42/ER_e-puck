#include <time.h>
#include <string.h>
#include <stdio.h>

/*void testLeft() {

    int startSteps = e_get_steps_left();
    e_set_speed_left(100);
    e_set_speed_right(-100);

    while(e_get_steps_left() - startSteps <= 333);

    e_set_speed_left(0);
    e_set_speed_right(0);

    while(1);

}

void testRight() {

    int startSteps = e_get_steps_right();
    e_set_speed_left(-100);
    e_set_speed_right(100);

    while(e_get_steps_right() - startSteps <= 333);

    e_set_speed_left(0);
    e_set_speed_right(0);

    while(1);

}

void timeTest() {

    sendString("new");
    time_t start,end;
    double diff;

    while(1) {

        time (&start);

        do {
            time (&end);
            diff = difftime(end,start);
        }while(diff < 15000000);

        sendDouble(diff);
        sendNewLine();
    }
}

void waitSeconds(double seconds)
{
  clock_t endwait;
  endwait = clock () + seconds*300000000;
  while (clock() < endwait);
}*/

/*int arrayMax(int values[]) {
    int max = values[0];
    int i;

    if(max < values[1])
        max = values[1];

    if(max < values[2])
        max = values[2];

    if(max < values[3])
        max = values[3];

    char buffer[25];
    sprintf(buffer, "%d %d %d %d max=%d\n\r\0",
    values[0],values[1],values[2],values[3],max);
    e_send_uart1_char(buffer, strlen(buffer));
    while(e_uart1_sending());
    return max;
}*/

/*void wallAvoider()
{
    while(1) {

        long maxLeft = 0;
        long maxRight = 0;

        int left[4];

        left[0] = e_get_prox(4);
        left[1] = e_get_prox(5);
        left[2] = e_get_prox(6);
        left[3] = e_get_prox(7);

        int right[4];

        right[0] = e_get_prox(0);
        right[1] = e_get_prox(1);
        right[2] = e_get_prox(2);
        right[3] = e_get_prox(3);

        maxRight = arrayMax(right);
        maxLeft = arrayMax(left);

        if(maxLeft > 200)
            e_set_speed_right(-400);
        else
            e_set_speed_right(400);

        if(maxRight > 200)
            e_set_speed_left(-400);
        else
            e_set_speed_left(400);

    }
}*/

/*void walkAwayFromWall()
{
    int stepsLimit = 10;
    int target = 10;

    e_set_speed_left(-100);
    e_set_speed_right(-100);

    char buffer[100];

    sprintf(buffer, "%d,%d,%d,%d,%d,%d,%d,%d,%d\n\r\0",
            e_get_steps_left()*-1,e_get_prox(0),e_get_prox(1),e_get_prox(2),e_get_prox(3),
                    e_get_prox(4),e_get_prox(5),e_get_prox(6),e_get_prox(7));
            e_send_uart1_char(buffer, strlen(buffer));
            while(e_uart1_sending());

    while(e_get_steps_left()*-1 < 1000) {

        if(e_get_steps_left()*-1 >= target) {

            target+= stepsLimit;
           //e_set_speed_left(0);
            //e_set_speed_right(0);
            //int i;
            //for(i = 0 ; i < 30000; i++);
            sprintf(buffer, "%d,%d,%d,%d,%d,%d,%d,%d,%d\n\r\0",
            e_get_steps_left()*-1,e_get_prox(0),e_get_prox(1),e_get_prox(2),e_get_prox(3),
                    e_get_prox(4),e_get_prox(5),e_get_prox(6),e_get_prox(7));
            e_send_uart1_char(buffer, strlen(buffer));
            while(e_uart1_sending());

        }

    }

    e_set_speed_left(0);
    e_set_speed_right(0);

    while(1);
}*/

/*void sendProximity(int sensor) {
    //e_set_speed_right(400);
    //e_set_speed_left(400);

    char buffer[100];

    while(1) {
        sprintf(buffer, "%d\n\r\0",
        e_get_prox(sensor));
        e_send_uart1_char(buffer, strlen(buffer));
        while(e_uart1_sending());
    }
}*/

void sendString(char* s) {
    char buffer[200];

    sprintf(buffer, "%s\n\r\0",s);
    e_send_uart1_char(buffer, strlen(buffer));
    while(e_uart1_sending());
}

void sendQuickString(char* s) {
    e_send_uart1_char(s, strlen(s));
    while(e_uart1_sending());
}
void sendDouble(float i) {

    char buffer[25];

    sprintf(buffer, "%f \0",i);

    e_send_uart1_char(buffer, strlen(buffer));
    while(e_uart1_sending());
}

void sendInt(int i) {

    char buffer[25];

    sprintf(buffer, "%i \0",i);

    e_send_uart1_char(buffer, strlen(buffer));
    while(e_uart1_sending());
}

void sendNewLine() {

    char buffer[7];

    sprintf(buffer, "\n\r\0");
    e_send_uart1_char(buffer, strlen(buffer));
    while(e_uart1_sending());
}

void sendPointer(float* i) {

    char buffer[25];

    sprintf(buffer, "%p \0",i);

    e_send_uart1_char(buffer, strlen(buffer));
    while(e_uart1_sending());
}

void sendLong(long l) {

    char buffer[25];

    sprintf(buffer, "%ld \0",l);
    e_send_uart1_char(buffer, strlen(buffer));
    while(e_uart1_sending());
}

/*void testProximity(int sensor) {

    e_calibrate_ir();
    //myCalibration();

    float waitTime = clocksPerSecond/10.0;
    time_t start,end;
    float diff;

    int totalTries = 100;

    while(1) {

        int tries = 0;
        int selector = getSelector();
        while(getSelector() == selector);

        time (&start);

        e_set_speed_left(776);
        e_set_speed_right(776);

        while(tries < totalTries) {
            //int i1 = e_get_calibrated_prox(sensor);
            sendInt(tries);
            int i0 = e_get_calibrated_prox(sensor);
            sendInt(i0);
            sendNewLine();

            //wait 100ms
            do {
                time (&end);
                diff = difftime(end,start);
            }while(diff < waitTime);

            time (&start);

            tries++;
        }

        e_set_speed_left(0);
        e_set_speed_right(0);
    }
}

void checkStuff() {
    e_calibrate_ir();

    int selector = getSelector();

    while(selector == getSelector());

    int timestep = 0;
    e_set_speed_left(776);
    e_set_speed_right(776);
    while(1) {
        sendInt(timestep);
        //sendInt(e_get_calibrated_prox(2));
        //sendInt(e_get_ambient_light(5));
        sendInt(e_get_ambient_light(2));
        sendInt(e_get_ambient_light(5));
        sendNewLine();
        timestep++;
    }
}



void IRReceiver() {

    unsigned int range = 150;

    e_init_randb(I2C);
    e_randb_set_range(range);
    e_randb_set_calculation(ON_BOARD);
    e_randb_store_light_conditions();

    char tmp[20];
    sprintf(tmp,"UART RECEIVER\n");
    sendString(tmp);
    finalDataRegister data;
    while(1)
    {
        sendInt(e_get_prox(0));
        sendNewLine();
        if (e_randb_get_if_received())
        {
            unsigned int data = e_randb_get_data;
            //sprintf(tmp,"%d %d %d\n",data.data, (int)(data.bearing * 180.0 / 3.14), data.range);
            sendInt(data);
            //sendString(tmp);
        }
    }
    return 0;

}

void IRSender() {

    sendString("UART EMITTER\0");

    unsigned int range = 150;

    e_init_randb(I2C);
    e_randb_set_range(range);
    e_randb_set_calculation(ON_BOARD);
    e_randb_store_light_conditions();

    unsigned int data = 0;

    while(1)
    {
        //e_randb_uart_send_all_data(data);
        e_randb_send_all_data(data);
        sendInt(data);

        data++;

        if(data==65535) data=0;
    }
    return 0;
}

void sendSensor() {

    e_set_speed_left(776);
    e_set_speed_right(776);

    while(1) {
        int i = e_get_prox(getSelector());
        sendInt(i);
        sendNewLine();
    }

}

void sendAllSensors() {

    int count = 0;
    int i;

    while(1) {
        sendInt(count++);
        for(i = 0; i < 8 ; i++) {
            double d = sensorToInput(i);
            sendDouble(d);
        }
        sendNewLine();
        //applyBehavior(TURN_RIGHT);
    }
}

void sendAllValues() {

    int i;

    while(1) {
        for(i = 0; i < 8 ; i++) {
            int d = e_get_prox(i);
            sendInt(d);
        }
        sendNewLine();
        //applyBehavior(FORWARD);
    }
}

void debug(int t, double* i, double* o) {

    char buffer[150];
    sprintf(buffer, "%d %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n\r\0",
            t, i[0], i[1], i[2], i[3], i[4], i[5], i[6], i[7], i[8],
            i[9], i[10], o[0], o[1], o[2]);
    sendQuickString(buffer);
}*/