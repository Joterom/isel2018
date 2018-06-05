#include "esp_common.h"
#include "freertos/task.h"
#include "gpio.h"
#include <fsm.h>

enum fsm_state {
	PELOTA,
};

// 0 si parado, 1 si positivo y 2 si negativo.
int mov_x = 0;
int mov_y = 0;

int x_pelota, y_pelota, raqueta=0;

portTickType timeout, now;

typedef struct pelota_s pelota_s;
struct pelota_s{
  int x;
	int y;
  int x_next;
	int y_next;
};
pelota_s pelota;

int timeout_pelota (fsm_t *self) {
  now = xTaskGetTickCount();
  return (now>=timeout);
}

int choca_der (fsm_t *self) {
  return ((pelota.x)==9 && mov_x==1);
}

int choca_izq (fsm_t *self) {
  return (pelota.x==0 && mov_x==2);
}

int choca_techo (fsm_t *self) {
  return (pelota.y==7 && mov_y==1);
}

int choca_raqueta (fsm_t *self) {
  return (pelota.y==1 && mov_y==2 && pelota.x==raqueta);
}

int choca_suelo (fsm_t *self) {
  return (pelota.y==1 && mov_y==2 && pelota.x!=raqueta);
}

void x_positivo (fsm_t *self) {
  mov_x=1;
}
void x_negativo (fsm_t *self) {
  mov_x=2;
}
void y_positivo (fsm_t *self) {
  mov_y=1;
}
void y_negativo (fsm_t *self) {
  mov_y=2;
}
void actualiza_pelota (fsm_t *self) {
  timeout = xTaskGetTickCount() + 1000/portTICK_RATE_MS;

  // Asignación de variable X
  if(mov_x==1){
    pelota.x_next=pelota.x + 1;
  }
  else if (mov_x==2){
    pelota.x_next=pelota.x - 1;
  }
  else{
    pelota.x_next=pelota.x;
  }

  // Asignación de variable Y
  if(mov_y==1){
    pelota.y_next=pelota.y + 1;
  }
  else if (mov_y==2){
    pelota.y_next=pelota.y - 1;
  }
  else{
    pelota.y_next=pelota.y;
  }
  x_pelota=pelota.x_next;
  y_pelota=pelota.y_next;
}

void game_over (fsm_t *self) {
  printf("GAME OVER");
}

fsm_t* fsm_new_pelota(int* x_pelota_p, int* y_pelota_p, int* raqueta_p){
  static fsm_trans_t pelota_tt[] = {
    { PELOTA, timeout_pelota, PELOTA, actualiza_pelota},
    { PELOTA, choca_der,      PELOTA, x_negativo},
    { PELOTA, choca_izq,      PELOTA, x_positivo},
    { PELOTA, choca_raqueta,  PELOTA, y_positivo},
    { PELOTA, choca_techo,    PELOTA, y_negativo},
    { PELOTA, choca_suelo,    PELOTA, game_over},
    {-1, NULL, -1, NULL},
  };

	//pelota = {x_pelota, y_pelota, 0, 0};
  x_pelota_p = x_pelota;
  y_pelota_p = y_pelota;
  raqueta_p  = raqueta;


  return fsm_new(pelota_tt);
}
