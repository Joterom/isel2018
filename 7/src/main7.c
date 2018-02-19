#include <stdlib.h>
#include "esp_common.h"
#include "freertos/task.h"
#include "gpio.h"
#include "fsm.h"
#define PERIOD_TICK 100/portTICK_RATE_MS
#define TIEMPO_ON 6000
#define NUM_TICKS_1S 100
#define NUM_TICKS_5S 500
static int const PASSWORD = 666;
volatile portTickType timer_1s;
volatile portTickType timer_5s;
volatile int code_figure_1;
volatile int code_figure_2;
volatile int code_figure_3;
volatile int code_figure_num;

enum fsm_state {
  ALARM_ON,
  ALARM_OFF,
  ALARM_RDY,
  EN_FIGURE_1,
  EN_FIGURE_2,
  EN_FIGURE_3,
  DIS_FIGURE_1,
  DIS_FIGURE_2,
  DIS_FIGURE_3,
};

int check_password(void);

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

int timeout (fsm_t* self) {
   portTickType now = xTaskGetTickCount();
   if (now > timer_5s){
     printf("\nTimeout de 5s disparado\n");
     return(1);
   }
   return(0);
}

int button_pressed (fsm_t* self){
  portTickType now = xTaskGetTickCount();
    if (!GPIO_INPUT_GET(0)){
      printf("GPIO 0 pulsado --> ");
      if (timer_1s == 0 || now <= timer_1s){
        if (code_figure_num == 1) {
          code_figure_1 ++;
          if (code_figure_1 == 10) {
            code_figure_1 = 0;
          }
        } else if (code_figure_num == 2) {
          code_figure_2 ++;
          if (code_figure_2 == 10) {
            code_figure_2 = 0;
          }
        } else if (code_figure_num == 3) {
          code_figure_3 ++;
          if (code_figure_3 == 10) {
            code_figure_3 = 0;
          }
        }
        timer_1s = now + NUM_TICKS_1S;
        timer_5s = now + NUM_TICKS_5S;
        printf("\nSe actualiza el valor de timer_1s y timer_5s");
        printf("\n----------\nESTADO DEL CODIGO:\nModificando cifra %i\n Valor de la palabra introducida: %i%i%i\n\n",code_figure_num,code_figure_3,code_figure_2,code_figure_1);
        return 0;
      } else if (now <= timer_5s){
        timer_5s = now + NUM_TICKS_5S;
        if (code_figure_num == 3) {
          return (check_password());
        } else {
          return 1;
        }
      } else {
        printf("\nERROR\nValor de now: %i\n Valor de timer_1s: %i\nValor de timer_5s: %i\n",now,timer_1s,timer_5s);
        return 0;
      }
    }
    return 0;
}

int check_password (void){
  int pass = code_figure_3*100 + code_figure_2*10 + code_figure_1;
  return pass;
}

void turn_on (fsm_t* self) {
  printf("\n++++++++++\nALARMA SONANDO\n++++++++++\n");
  GPIO_OUTPUT_SET(2, 0);
}
void dismount (fsm_t* self) {
  printf("\nSistema desconectado\n");
  timer_1s = 0;
  timer_5s = 0;
  GPIO_OUTPUT_SET(2, 1);
}

void mount (fsm_t* self){
  timer_1s = 0;
  timer_5s = 0;
  code_figure_num = 1;
  printf("\nSistema operativo\n");
}

int alert (fsm_t* self){
    if (GPIO_INPUT_GET(15)){
      printf("GPIO 15 activo --> Presencia detectada");
    }
    return (GPIO_INPUT_GET(15));
}

void reset_timers (fsm_t* self){
  timer_1s = 0;
  timer_5s = 0;
  code_figure_1 = 0;
  code_figure_2 = 0;
  code_figure_3 = 0;
  code_figure_num ++;
  printf("\nEl codigo introducido es: %i%i%i\n",code_figure_3,code_figure_2,code_figure_1);
}

void inter(void* ignore){

  PIN_FUNC_SELECT(GPIO_PIN_REG_15, FUNC_GPIO15);
  PIN_FUNC_SELECT(GPIO_PIN_REG_0, FUNC_GPIO0);
  GPIO_AS_OUTPUT(2);
  static fsm_trans_t interruptor[]={
    {ALARM_OFF, button_pressed, EN_FIGURE_1, reset_timers },
    {EN_FIGURE_1, button_pressed, EN_FIGURE_2, reset_timers},
    {EN_FIGURE_1, timeout, ALARM_OFF, dismount},
    {EN_FIGURE_2, button_pressed, EN_FIGURE_3, reset_timers},
    {EN_FIGURE_2, timeout, ALARM_OFF, dismount},
    {EN_FIGURE_3, button_pressed, ALARM_RDY, mount},
    {EN_FIGURE_3, timeout, ALARM_OFF, dismount},
    {ALARM_RDY, alert, ALARM_ON, turn_on},
    {ALARM_RDY, button_pressed, DIS_FIGURE_1, reset_timers},
    {ALARM_ON, button_pressed, DIS_FIGURE_1, reset_timers},
    {DIS_FIGURE_1, button_pressed, DIS_FIGURE_2, reset_timers},
    {DIS_FIGURE_1, timeout, ALARM_ON, turn_on},
    {DIS_FIGURE_2, button_pressed, DIS_FIGURE_3, reset_timers},
    {DIS_FIGURE_2, timeout, ALARM_ON, turn_on},
    {DIS_FIGURE_3, button_pressed, ALARM_OFF, dismount},
    {DIS_FIGURE_3, timeout, ALARM_ON, turn_on},
    {-1, NULL, -1, NULL },
  };

  fsm_t* fsm = fsm_new(interruptor);
  dismount(fsm);
  portTickType xLastWakeTime;
  code_figure_num = 1;
  code_figure_1 = 0;
  code_figure_2 = 0;
  code_figure_3 = 0;
  timer_1s = 0;
  timer_5s = 0;

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
