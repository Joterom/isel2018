#include "esp_common.h"
#include "freertos/task.h"
#include "gpio.h"
#include <fsm.h>

portTickType timeout, now ;
int pantalla[8][10];
int x_pelota, y_pelota, raqueta;

enum fsm_state {
	PANTALLA,
};


int timeout_pantalla(fsm_t* self){
	now = xTaskGetTickCount();
	return (now>=timeout);
}

void refresco_pantalla(fsm_t* self){
	// Timeout salta cada 30s
	timeout = xTaskGetTickCount() + 1000/portTICK_RATE_MS;
	int i=0;
	int j=0;
	for (i=0; i<8; i++){
		for (j=0; j<10; j++){
			pantalla[i][j]=0;
			if((i==x_pelota)&&(j==y_pelota)){
				pantalla[i][j]=1;
			}
			if((i==raqueta)&&(j==0)){
				pantalla[i][j]=1;
			}
			printf(pantalla[i][j]);
		}
	}
}

fsm_t* fsm_new_pantalla(int* x_pelota_p, int* y_pelota_p, int* raqueta_p){
  static fsm_trans_t pantalla_tt[] = {
    { PANTALLA, timeout_pantalla, PANTALLA, refresco_pantalla},
    {-1, NULL, -1, NULL},
  };

  x_pelota_p = x_pelota;
  y_pelota_p = y_pelota;
  raqueta_p  = raqueta;

  return fsm_new(pantalla_tt);
}
