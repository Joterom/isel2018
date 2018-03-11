#include <stdlib.h>
#include "esp_common.h"
#include "freertos/task.h"
#include "gpio.h"
#include "fsm.h"
#define PERIOD_TICK 100/portTICK_RATE_MS
#define REBOUND_TICK 50 //Mismo comentario que en el ejercicio anterior
#define TIEMPO_ON 6000
volatile portTickType tiempo_de_apagado;
void gpio_config (GPIO_ConfigTypeDef *pGPIOConfig);

static int *valid_code = NULL;
static int GPIO_button = 12;
static int GPIO_alarm = 2;

void
alarm_setup (int button, int alarm)
{
  GPIO_ConfigTypeDef io_in_conf;

  GPIO_button = button;
  GPIO_alarm = alarm;

  io_in_conf.GPIO_IntrType = GPIO_PIN_INTR_DISABLE;
  io_in_conf.GPIO_Mode = GPIO_Mode_Input;
  io_in_conf.GPIO_Pin = (1 << GPIO_button);
  io_in_conf.GPIO_Pullup = GPIO_PullUp_EN;
  gpio_config (&io_in_conf);

  io_in_conf.GPIO_IntrType = GPIO_PIN_INTR_DISABLE;
  io_in_conf.GPIO_Mode = GPIO_Mode_Output;
  io_in_conf.GPIO_Pin = (1 << GPIO_alarm);
  io_in_conf.GPIO_Pullup = GPIO_PullUp_DIS;
  gpio_config (&io_in_conf);

  GPIO_OUTPUT_SET (GPIO_alarm, 1);
  puts ("ALARMA: INIT");
}

int timeout (fsm_t* fsm) {
   portTickType now = xTaskGetTickCount();
   if (now >= tiempo_de_apagado){
     return(1);
   }
   return(0);
}

static int code_ok(fsm_t* fsm){
    return *valid_code;
}

static int presence(fsm_t* fsm){
  if(! GPIO_INPUT_GET (GPIO_button)){
    tiempo_de_apagado = xTaskGetTickCount() + TIEMPO_ON;
  }
  return ! GPIO_INPUT_GET (GPIO_button);
}

static void alarm_on (fsm_t* fsm) {
  printf("\n++++++++++\nALARMA SONANDO\n++++++++++\n");
  GPIO_OUTPUT_SET(GPIO_alarm, 0);
}

static void turn_on(fsm_t* fsm){
  GPIO_OUTPUT_SET (GPIO_alarm, 1);
  *valid_code = 0;
  printf ("ALARMA: ARMADA");
}

static void turn_off(fsm_t* fsm){
  GPIO_OUTPUT_SET (GPIO_alarm, 1);
  *valid_code = 0;
  printf ("ALARMA: DESARMADA");
}


fsm_t*
fsm_new_alarm (int* validp, int button, int alarm)
{
    GPIO_AS_OUTPUT(2);
    static fsm_trans_t alarm_tt[] = {
        {  0, code_ok, 1, turn_on },
        {  1, code_ok, 0, turn_off },
        {  1, presence, 2, alarm_on },
        {  2, code_ok,0, turn_off},
        {  2, timeout, 0, turn_off},
        { -1, NULL, -1, NULL },
    };

    valid_code = validp;
    alarm_setup (button, alarm);
    return fsm_new (alarm_tt);
}
