#include <string.h>
#include <stdio.h>
#include "motor_led/e_epuck_ports.h"
#include "I2C/e_I2C_master_module.h"
#include "I2C/e_I2C_protocol.h"
#include "utilities.h"

char waitForMessage(char msg) {
    char c;
    while(e_getchar_uart1(&c) <= 0 && c != msg);
    return c;
}

unsigned short receiveMessage() {
    unsigned short a1 = receiveSingleChar();
    unsigned short a2 = receiveSingleChar();

    unsigned short a3 = a2<<8 | a1;

    //unsigned char a2 = receiveSingleChar();

    //unsigned short i = ((unsigned short)((a1 & 0x00FF) | a2<<8));
    return a3;
}

unsigned char receiveSingleChar() {
    unsigned char c;
    while(e_getchar_uart1(&c) <= 0);
    return c;
}

int getSelector() {
    return SELECTOR0 + 2*SELECTOR1 + 4*SELECTOR2 + 8*SELECTOR3;
}

int mystrlen(char* s) {

    int i = 0;
    while(s[i] != '\0')
        i++;

    return i;
}

void sendString(char* s) {
    e_send_uart1_char(s, mystrlen(s));
    while(e_uart1_sending());
}

void sendString2(char* s, int len) {
    e_send_uart1_char(s, len);
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

void receiveDouble() {
    char buffer[25];

}