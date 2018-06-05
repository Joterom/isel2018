#include "esp_common.h"
#include "freertos/task.h"
#include "gpio.h"
#include <fsm.h>

int raqueta;
int actual;
int next;

// 1 si movimiento a la derecha (+1) y 2 si movimiento a la izquierda (-1)
int mov=0;

portTickType timeout , now;

enum fsm_state {
	RAQUETA,
};

int btn_der(fsm_t* self){
  return btn_der;
}

int btn_izq(fsm_t* self){
  return btn_izq;
}

int timeout_raqueta (fsm_t *self) {
  now = xTaskGetTickCount();
  return (now>=timeout);
}

void mov_der(fsm_t *self){
  mov=1;
}

void mov_izq(fsm_t *self){
  mov=2;
}

void actualiza_raqueta (fsm_t *self) {
  timeout = xTaskGetTickCount() + 1000/portTICK_RATE_MS;

  // Asignación de variable Y
  if(mov==1){
    next=actual + 1;
  }
  else if (mov==2){
    next=actual - 1;
  }
  else{
    next=actual;
  }
  raqueta=next;
}

fsm_t* fsm_new_raqueta(int* raqueta_p, int* btn_der_p, int* btn_izq_p){
  static fsm_trans_t raqueta_tt[] = {
    { RAQUETA, btn_der, RAQUETA, mov_der},
    { RAQUETA, btn_izq, RAQUETA, mov_izq},
    { RAQUETA, timeout_raqueta,  RAQUETA, actualiza_raqueta},
    {-1, NULL, -1, NULL},
  };

  raqueta_p = raqueta;
  btn_der_p = btn_der;
  btn_izq_p = btn_izq;

  return fsm_new(raqueta_tt);
}
