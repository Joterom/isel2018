#include "esp_common.h"
#include "freertos/task.h"
#include "gpio.h"
#include <fsm.h>


fsm_t* fsm_new_pantalla(int* x_pelota_p, int* y_pelota_p, int* raqueta_p);
fsm_t* fsm_new_pelota(int* x_pelota_p, int* y_pelota_p, int* raqueta_p);
fsm_t* fsm_new_raqueta(int* raqueta_p, int* btn_der_p, int* btn_izq_p);



/******************************************************************************
 * FunctionName : user_rf_cal_sector_set
 * Description  : SDK just reversed 4 sectors, used for rf init data and paramters.
 *                We add self function to force users to set rf cal sector, since
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

static int* x_pelota_p  = NULL;
static int* y_pelota_p  = NULL;
static int* raqueta_p   = NULL;
static int* btn_der_p     = NULL;
static int* btn_izq_p     = NULL;

portTickType InicioPantalla;
portTickType FinPantalla;
portTickType InicioPelota;
portTickType FinPelota;
portTickType InicioRaqueta;
portTickType FinRaqueta;

portTickType msecPelota;
portTickType msecPantalla;
portTickType msecRaqueta;

static void arkanoPi (void* ignore) {
    while (1) {
        start_pelota();
        start_raqueta();
        start_pantalla();
    }
}

void user_init(void){
  xTaskCreate(arkanoPi, (signed char *)"startup", 2048, NULL, 1, NULL);
}

// Tiempo de ejecución en caso peor
void start_pantalla(void){
    portTickType xLastWakeTime;
    // Cada cuanto queremos que se ejecute la máquina de estados
    portTickType segundosEnTicks =250/ portTICK_RATE_MS;
    xLastWakeTime = xTaskGetTickCount();
    fsm_t* pantalla_fsm = fsm_new_pantalla(x_pelota_p, y_pelota_p, raqueta_p);

  while(1)
  {
    //Difinimos las máquina de estados
    InicioPantalla = xTaskGetTickCount();
    fsm_fire (pantalla_fsm);
    FinPantalla = xTaskGetTickCount();

    if((FinPantalla-InicioPantalla)>=msecPantalla){
          msecPantalla = FinPantalla-InicioPantalla;
          printf("msecPantalla\n");
      }
    vTaskDelayUntil(&xLastWakeTime, segundosEnTicks);
  }
}

void start_pelota(void){
    portTickType xLastWakeTime;
    // Cada cuanto queremos que se ejecute la máquina de estados
    portTickType segundosEnTicks =250/ portTICK_RATE_MS;
    xLastWakeTime = xTaskGetTickCount();
    fsm_t* pelota_fsm = fsm_new_pelota(x_pelota_p, y_pelota_p, raqueta_p);

  while(1)
  {
    //Difinimos las máquina de estados
    InicioPelota = xTaskGetTickCount();
    fsm_fire (pelota_fsm);
    FinPelota = xTaskGetTickCount();

    if((FinPelota-InicioPelota)>=msecPelota){
          msecPelota = FinPelota-InicioPelota;
          printf("msecPelota\n");
      }
    vTaskDelayUntil(&xLastWakeTime, segundosEnTicks);
  }
}
void start_raqueta(void){
    portTickType xLastWakeTime;
    // Cada cuanto queremos que se ejecute la máquina de estados (cada 1segundo)
    portTickType segundosEnTicks =250/ portTICK_RATE_MS;
    xLastWakeTime = xTaskGetTickCount();
    fsm_t* raqueta_fsm = fsm_new_raqueta(raqueta_p, btn_der_p, btn_izq_p);

  while(1)
  {
    //Difinimos las máquina de estados
    InicioRaqueta = xTaskGetTickCount();
    fsm_fire (raqueta_fsm);
    FinRaqueta = xTaskGetTickCount();

    if((FinRaqueta-InicioRaqueta)>=msecRaqueta){
          msecRaqueta = FinRaqueta-InicioRaqueta;
          printf("msecRaqueta\n");
      }
    vTaskDelayUntil(&xLastWakeTime, segundosEnTicks);
  }

}
