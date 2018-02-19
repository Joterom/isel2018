#include <stdlib.h>
#include "esp_common.h"
#include "freertos/task.h"
#include "gpio.h"
#include "fsm.h"
#define PERIOD_TICK 100/portTICK_RATE_MS
#define ETS_GPIO_INTR_ENABLE() _xt_isr_unmask(1 << ETS_GPIO_INUM);
#define REBOUND_TICK 150
#define TIEMPO_ON 6000
volatile portTickType tiempo_de_apagado;
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
   //printf("\nPARAMETROS TIMEOUT: \nValor de now: %i\nValor de tiempo_apagado: %i\n",now,tiempo_de_apagado);
   if (now >= tiempo_de_apagado){
     return(1);
   } else {
     return(0);
   }
}

int button_pressed (fsm_t* self){
  //printf("\nLlamada a button_pressed: \nREBOTE = %i\nPULSADOR 0: %i\nPULSADOR 15: %i\n",rebote,!GPIO_INPUT_GET(0),GPIO_INPUT_GET(15));
  //if (rebote = 0){
    if (!GPIO_INPUT_GET(0)){
      printf("GPIO 0 pulsado --> ");
      tiempo_de_apagado = xTaskGetTickCount() + TIEMPO_ON;
    } else if (GPIO_INPUT_GET(15)){
      printf("GPIO 15 pulsado --> ");
      tiempo_de_apagado = xTaskGetTickCount() + TIEMPO_ON;
    }


    printf("\nSe apagara en: %i\n",tiempo_de_apagado);
    return (GPIO_INPUT_GET(15) || !GPIO_INPUT_GET(0));
}

void led_on (fsm_t* self) {
  printf("Estoy encendido\n");
  GPIO_OUTPUT_SET(2, 0);
}
void led_off (fsm_t* self) {
  printf("Estoy apagado\n");
  GPIO_OUTPUT_SET(2, 1);
}

void isr_gpio(void* arg){
  uint32 status = GPIO_REG_READ(GPIO_STATUS_ADDRESS);
  static portTickType ultimotick = 0;
  portTickType ahora = xTaskGetTickCount();
  //printf("\nSe atiende la interrupcion: valor de rebote = %i",rebote);
  //printf("\nTiempo actual: %i",ahora);
  if (status){
    if (ahora > ultimotick){
      ultimotick = ahora + REBOUND_TICK;
      //rebote = 0;
      //printf("\nNo se produce rebote: valor de rebote = %i\nSaliendo\n",rebote);
    } else {
      //rebote = 1;
      //printf("\nSe produce rebote: valor de rebote = %i\nSaliendo\n",rebote);
    }
  }

  GPIO_REG_WRITE(GPIO_STATUS_W1TC_ADDRESS, status);
}

void inter(void* ignore){

  PIN_FUNC_SELECT(GPIO_PIN_REG_15, FUNC_GPIO15);
  PIN_FUNC_SELECT(GPIO_PIN_REG_0, FUNC_GPIO0);
  GPIO_AS_OUTPUT(2);
  static fsm_trans_t interruptor[]={
    {LED_ON, led_timeout, LED_OFF, led_off },
    {LED_OFF, button_pressed, LED_ON, led_on},
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
