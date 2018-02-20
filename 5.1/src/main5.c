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

/******************************************************************************
 * FunctionName : user_rf_cal_sector_set
 * Description  : SDK just reversed 4 sectors, used for rf init data and paramters.
 *                We add this function to force users to set rf cal sector, since
 *                we don't know which sector is free in user's application.
 *                sector map for last several sectors : ABCCC
 *                A : rf cal
 *                B : rf init data
 *                C : sdk parameters
 * Parameters   : none
 * Returns      : rf cal sector
*******************************************************************************/
uint32 user_rf_cal_sector_set(void)
{
    flash_size_map size_map = system_get_flash_size_map();
    uint32 rf_cal_sec = 0;
    switch (size_map) {
        case FLASH_SIZE_4M_MAP_256_256:
            rf_cal_sec = 128 - 5;
            break;

        case FLASH_SIZE_8M_MAP_512_512:
            rf_cal_sec = 256 - 5;
            break;

        case FLASH_SIZE_16M_MAP_512_512:
        case FLASH_SIZE_16M_MAP_1024_1024:
            rf_cal_sec = 512 - 5;
            break;

        case FLASH_SIZE_32M_MAP_512_512:
        case FLASH_SIZE_32M_MAP_1024_1024:
            rf_cal_sec = 1024 - 5;
            break;

        default:
            rf_cal_sec = 0;
            break;
    }

    return rf_cal_sec;
}

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

void inter(void* ignore){

  PIN_FUNC_SELECT(GPIO_PIN_REG_15, FUNC_GPIO15);
  PIN_FUNC_SELECT(GPIO_PIN_REG_0, FUNC_GPIO0);
  GPIO_AS_OUTPUT(2);
  static fsm_trans_t interruptor[]={
    {LED_OFF, button_pressed, LED_ON, led_on},
    {LED_ON, led_timeout, LED_OFF, led_off },
    {-1, NULL, -1, NULL },
  };

  fsm_t* fsm = fsm_new(interruptor);
  led_off(fsm);
  portTickType xLastWakeTime;

  gpio_intr_handler_register((void*) isr_gpio, NULL);
  gpio_pin_intr_state_set(0, GPIO_PIN_INTR_NEGEDGE);
  gpio_pin_intr_state_set(15, GPIO_PIN_INTR_POSEDGE);

  ETS_GPIO_INTR_ENABLE();

  while(true) {
    xLastWakeTime = xTaskGetTickCount();
    fsm_fire(fsm);
    vTaskDelayUntil(&xLastWakeTime, PERIOD_TICK);
  }
}

/******************************************************************************
 * FunctionName : user_init
 * Description  : entry of user application, init user function here
 * Parameters   : none
 * Returns      : none
*******************************************************************************/
void user_init(void)
{
    xTaskCreate(&inter, "startup", 2048, NULL, 1, NULL);
}
