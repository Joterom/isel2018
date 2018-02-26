#include <stdlib.h>
#include "esp_common.h"
#include "freertos/task.h"
#include "gpio.h"
#include "fsm.h"
#define PERIOD_TICK 100/portTICK_RATE_MS
#define ETS_GPIO_INTR_ENABLE() _xt_isr_unmask(1 << ETS_GPIO_INUM);
#define REBOUND_TICK 50 //Mismo comentario que en el ejercicio anterior
#define TIEMPO_ON 6000
volatile portTickType tiempo_de_apagado;
volatile int boton0;
volatile int boton15;
enum fsm_state {
  LED_ON,
  LED_OFF,
};
int led_timeout (fsm_t* self) {
   portTickType now = xTaskGetTickCount();
   if (now >= tiempo_de_apagado){
     return(1);
   }
   return(0);
}

int button_pressed (fsm_t* self){
    if (boton0){
      tiempo_de_apagado = xTaskGetTickCount() + TIEMPO_ON;
      printf("GPIO 0 pulsado -->");
    }
    if (boton15){
      tiempo_de_apagado = xTaskGetTickCount() + TIEMPO_ON;
      printf("GPIO 15 pulsado -->");
    }
    return (boton0 || boton15);
}

void led_on (fsm_t* self) {
  boton0 = 0;
  boton15 = 0;
  printf("Estoy encendido\n");
  GPIO_OUTPUT_SET(2, 0);
}

void led_off (fsm_t* self) {
  boton0 = 0;
  boton15 = 0;
  printf("Estoy apagado\n");
  GPIO_OUTPUT_SET(2, 1);
}

void isr_gpio(void* arg){
  uint32 status = GPIO_REG_READ(GPIO_STATUS_ADDRESS);
  static portTickType ultimotick0 = 0;
  static portTickType ultimotick15 = 0;
  portTickType ahora = xTaskGetTickCount();

  if (status & BIT(0)){
    if (ahora > ultimotick0){
      ultimotick0 = ahora + REBOUND_TICK;
      boton0 = 1;
      printf("\nPulsacion detectada, GPIO0\nTiempo actual : %i\nTiempo de rebote: %i\n",ahora,ultimotick0);
    } else {
      printf("\nAntirrebotes lanzado, GPIO0\nTiempo actual: %i\n",ahora);
    }
  }

  if (status & BIT(15)){
    if (ahora > ultimotick15){
      ultimotick15 = ahora + REBOUND_TICK;
      boton15 = 1;
      printf("\nPulsacion detectada, GPIO15\nTiempo actual : %i\nTiempo de rebote: %i\n",ahora,ultimotick15);
    } else {
      printf("\nAntirrebotes lanzado, GPIO15\nTiempo actual: %i\n",ahora);
    }
  }
  GPIO_REG_WRITE(GPIO_STATUS_W1TC_ADDRESS, status);
}

fsm_t*
fsm_new_led (int* validp, int button)
{
  static fsm_trans_t interruptor[]={
    {LED_OFF, button_pressed, LED_ON, led_on},
    {LED_ON, led_timeout, LED_OFF, led_off },
    {-1, NULL, -1, NULL },
  };
    valid_code = validp;
    code_setup (button);
    return fsm_new (code_tt);
}
