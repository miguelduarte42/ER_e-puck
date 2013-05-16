#include "camera/fast_2_timer/e_po3030k.h"
#include "utilities.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/e_init_port.h"
#include "uart/e_uart_char.h"

/*char buffer[160*2];

int main(void) {

    int selector = getSelector();

    if(selector != 0) {

        //e_init_port();
        e_init_uart1();
        e_init_motors();

        e_po3030k_init_cam();//this already does e_init_port!!!

        e_po3030k_config_cam((ARRAY_WIDTH - 320)/2,(ARRAY_HEIGHT - 32)/2,320,8,2,4,GREY_SCALE_MODE);
        e_po3030k_write_cam_registers();

        int i = 0;
        while(1) {
            e_set_led(i,1);
            e_po3030k_launch_capture(buffer);
            while(!e_po3030k_is_img_ready());
            e_send_uart1_char(buffer,160*2);
            while(e_uart1_sending());
            e_set_led(i,0);
            i++;
            i=i%8;
        }
    }
    return 0;
}*/