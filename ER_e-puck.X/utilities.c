#include <string.h>
#include <stdio.h>
#include "motor_led/e_epuck_ports.h"
#include "I2C/e_I2C_master_module.h"
#include "I2C/e_I2C_protocol.h"
#include "utilities.h"

int getSelector() {
    return SELECTOR0 + 2*SELECTOR1 + 4*SELECTOR2 + 8*SELECTOR3;
}

void sendString(char* s) {
    e_send_uart1_char(s, strlen(s));
    while(e_uart1_sending());
}

void sendFloat(float i) {
    sendDouble(i);
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

    char buffer[3];

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

/*void IRReceiver() {

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
}*/