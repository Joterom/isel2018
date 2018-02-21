#include <stdlib.h>
#include "esp_common.h"
#include "freertos/task.h"
#include "gpio.h"
#include "fsm.h"
#define PERIOD_TICK 100/portTICK_RATE_MS
#define NUM_TICKS_2S 200
#define NUM_TICKS_10S 1000
#define ETS_GPIO_INTR_ENABLE() _xt_isr_unmask(1 << ETS_GPIO_INUM);
#define PASSWORD 666
#define REBOUND_TICK 20

volatile portTickType timer_2s;
volatile portTickType timer_10s;
int code_in[3];
int *code;
volatile int boton15;
volatile int boton0;


enum fsm_state {
  ALARM_ON,
  ALARM_OFF,
  EN_FIGURE_1,
  EN_FIGURE_2,
  EN_FIGURE_3,
  DIS_FIGURE_1,
  DIS_FIGURE_2,
  DIS_FIGURE_3,
};

int check_password(int *pass);

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

int timeout2s (fsm_t* self) {
   portTickType now = xTaskGetTickCount();
   if (now > timer_2s){
     printf("\nTimeout de 2s disparado\n");
     return(1);
   }
   return(0);
}

int timeout2sTurn (fsm_t* self) {
   portTickType now = xTaskGetTickCount();
   if (now > timer_2s){
     return(check_password(code));
   }
   return(0);
}

int timeout10s (fsm_t* self) {
   portTickType now = xTaskGetTickCount();
   if (now > timer_10s){
     printf("\nTimeout de 10s disparado\n");
     return(1);
   }
   return(0);
}

int button_pressed (fsm_t* self){
  portTickType now = xTaskGetTickCount();
  if (boton0) {
    return (1);
  }
  return 0;
}

int check_password (int* pass){
  int pass_num = ((*(pass) * 100) + (*(pass-1) * 10) + *(pass-2));
  if ( pass_num == PASSWORD) {
    printf("Contraseña correcta");
    return 1;
  }
  return 0;
}

void setTimers (fsm_t* self){
  portTickType now = xTaskGetTickCount();
  timer_2s = now + NUM_TICKS_2S;
  timer_10s = now + NUM_TICKS_10S;
  boton0 = 0;
  printf("\nComienza la introduccion del codigo\nCodigo introducido hasta el momento: %i%i%i\n",(code_in[2]),(code_in[1]),(code_in[0]));
}

void turn_on (fsm_t* self) {
  printf("\n++++++++++\nALARMA SONANDO\n++++++++++\n");
  GPIO_OUTPUT_SET(2, 0);
  boton15 = 0;
}
void dismount (fsm_t* self) {
  timer_2s = 0;
  timer_10s = 0;
  code = &code_in[0];
  *code = 0;
  *(code + 1) = 0;
  *(code + 2) = 0;
  printf("\nSistema desconectado\nCodigo reseteado a %i%i%i\n",(code_in[2]),(code_in[1]),(code_in[0]));
  GPIO_OUTPUT_SET(2, 1);
}

void mount (fsm_t* self){
  timer_2s = 0;
  timer_10s = 0;
  code = &code_in[0];
  *code = 0;
  *(code + 1) = 0;
  *(code + 2) = 0;
  printf("\nSistema OPERATIVO\nCodigo reseteado a %i%i%i\n",(code_in[2]),(code_in[1]),(code_in[0]));
}

void anadeCifra (fsm_t* self){
  code = code + 1;
  portTickType now = xTaskGetTickCount();
  timer_2s = now + NUM_TICKS_2S;
  printf("\nCodigo introducido hasta el momento: %i%i%i\n",(code_in[2]),(code_in[1]),(code_in[0]));
}

void sumaCifra (fsm_t* self){
  *code = *code + 1;
  if (*code == 10){
    *code = 0;
  }
  portTickType now = xTaskGetTickCount();
  timer_2s = now + NUM_TICKS_2S;
  timer_10s = now + NUM_TICKS_10S;
  boton0 = 0;
  printf("\nCodigo introducido hasta el momento: %i%i%i\n",(code_in[2]),(code_in[1]),(code_in[0]));
}

int alert (fsm_t* self){
    if (boton15){
      printf("GPIO 15 activo --> Presencia detectada");
    }
    return (boton15);
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
      //printf("\nPulsacion detectada, GPIO0\nTiempo actual : %i\nTiempo de rebote: %i\n",ahora,ultimotick0);
    } else {
      printf("\nAntirrebotes lanzado, GPIO0 --> Tiempo actual: %i\n",ahora);
    }
  }

  if (status & BIT(15)){
    if (ahora > ultimotick15){
      ultimotick15 = ahora + REBOUND_TICK;
      boton15 = 1;
      //printf("\nPulsacion detectada, GPIO15\nTiempo actual : %i\nTiempo de rebote: %i\n",ahora,ultimotick15);
    } else {
      //printf("\nAntirrebotes lanzado, GPIO15 --> Tiempo actual: %i\n",ahora);
    }
  }
  GPIO_REG_WRITE(GPIO_STATUS_W1TC_ADDRESS, status);
}

void inter(void* ignore){

  PIN_FUNC_SELECT(GPIO_PIN_REG_15, FUNC_GPIO15);
  PIN_FUNC_SELECT(GPIO_PIN_REG_0, FUNC_GPIO0);
  GPIO_AS_OUTPUT(2);
  static fsm_trans_t interruptor[]={
    {ALARM_OFF, button_pressed, EN_FIGURE_1, setTimers },

    {EN_FIGURE_1, timeout2s, EN_FIGURE_2, anadeCifra},
    {EN_FIGURE_1, button_pressed, EN_FIGURE_1, sumaCifra},
    {EN_FIGURE_1, timeout10s, ALARM_OFF, dismount},

    {EN_FIGURE_2, timeout2s, EN_FIGURE_3, anadeCifra},
    {EN_FIGURE_2, button_pressed, EN_FIGURE_2, sumaCifra},
    {EN_FIGURE_2, timeout10s, ALARM_OFF, dismount},

    {EN_FIGURE_3, button_pressed, EN_FIGURE_3, sumaCifra},
    {EN_FIGURE_3, timeout2sTurn, ALARM_ON, mount},
    {EN_FIGURE_3, timeout10s, ALARM_OFF, dismount},

    {ALARM_ON, button_pressed, DIS_FIGURE_1, setTimers},
    {ALARM_ON, alert, ALARM_ON, turn_on},

    {DIS_FIGURE_1, timeout2s, DIS_FIGURE_2, anadeCifra},
    {DIS_FIGURE_1, button_pressed, DIS_FIGURE_1, sumaCifra},
    {DIS_FIGURE_1, timeout10s, ALARM_ON, turn_on},

    {DIS_FIGURE_2, timeout2s, DIS_FIGURE_3, anadeCifra},
    {DIS_FIGURE_2, button_pressed, DIS_FIGURE_2, sumaCifra},
    {DIS_FIGURE_2, timeout10s, ALARM_ON, turn_on},

    {DIS_FIGURE_3, button_pressed, DIS_FIGURE_3, sumaCifra},
    {DIS_FIGURE_3, timeout2sTurn, ALARM_OFF, dismount},
    {DIS_FIGURE_3, timeout10s, ALARM_ON, turn_on},
    {-1, NULL, -1, NULL },
  };

  fsm_t* fsm = fsm_new(interruptor);
  dismount(fsm);
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
