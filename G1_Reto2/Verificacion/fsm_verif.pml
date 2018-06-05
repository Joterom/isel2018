/* ltl spec {
	( []( ( (r_state == RAQUETA) && (btn_der == btn_izq) ) -> (<>(mov == 0)) ) ); 
	( []( ( (b_state == PELOTA) && (choca_suelo == 1) ) -> <>(end == 1) ) ); 
}*/

mtype {PANTALLA}
mtype s_state;
bit raqueta_timeout, pelota_timeout, btn_der, btn_izq, camino_libre, choca_izq, choca_der, choca_suelo, choca_raqueta, choca_techo, choca_paredes, end;
int mov = 0;
int movx, movy = 0;

active proctype fsm_pantalla(){
	s_state = PANTALLA;
	do
	::(s_state == PANTALLA) -> atomic {
		if
		:: (timeout) -> s_state = PANTALLA;
		fi
	}
	od;	
}

mtype {RAQUETA}
mtype r_state
active proctype fsm_raqueta(){
	r_state = RAQUETA;
	do
	:: (r_state == RAQUETA) -> atomic {
		if
		::(btn_der == btn_izq) -> r_state = RAQUETA; btn_der = 0; btn_izq = 0; mov=0;
		::(btn_der && !btn_izq) -> r_state = RAQUETA; btn_der = 0; btn_izq = 0; mov=1;
		::(btn_izq && !btn_der) -> r_state = RAQUETA; btn_izq = 0; btn_der = 0; mov=2;
		::(raqueta_timeout) -> r_state = RAQUETA; raqueta_timeout = 0;
		fi;
	}
	od
}

mtype {PELOTA}
mtype b_state;
active proctype fsm_pelota(){
	b_state = PELOTA;
	do
	:: (b_state == PELOTA) -> atomic {
		if
		::(choca_der) -> b_state=PELOTA; choca_der = 0; choca_izq=0; choca_raqueta=0; choca_suelo=0; choca_techo=0;     
		::(choca_izq) -> b_state=PELOTA; choca_izq = 0; choca_der=0; choca_raqueta=0; choca_suelo=0; choca_techo=0;   
		::(choca_raqueta) -> b_state=PELOTA; choca_der = 0; choca_izq=0; choca_raqueta = 0; choca_suelo=0; choca_techo=0;   
		::(choca_suelo) -> b_state=PELOTA; choca_der=0; choca_izq=0; choca_suelo=0; choca_techo=0; choca_raqueta = 0; end = 1;
		::(choca_techo) -> b_state=PELOTA; choca_der=0; choca_izq=0; choca_raqueta=0; choca_suelo=0; choca_techo = 0;     
		::(pelota_timeout) -> b_state=PELOTA; choca_der=0; choca_izq=0; choca_raqueta=0; choca_suelo=0; choca_techo=0; pelota_timeout = 0;
		fi
	}
	od
}

active proctype entorno(){
	do
	:: if
	   :: btn_der = 1;
	   :: btn_der = 0;
	   :: btn_izq = 0;
	   :: btn_izq = 1;
	   :: choca_paredes = 1;
	   :: camino_libre = 1;
	   :: choca_raqueta = 1;
	   :: choca_techo = 1;
	   :: choca_suelo = 1;
	   :: choca_izq = 1;
	   :: choca_der = 1;
	   :: pelota_timeout = 1;
	   :: raqueta_timeout = 1;
	   fi;
	printf ("\n Estado raqueta: %d, Estado pelota: %d, Estado pantalla: %d",r_state, b_state, s_state);
	printf ("\n choca_paredes: %d, camino_libre: %d, choca_techo: %d, choca_raqueta: %d, choca_suelo: %d", choca_paredes, camino_libre, choca_techo, choca_raqueta, choca_suelo);
	printf ("\n Boton derecha: %d, Boton izquierda: %d, Raqueta: %d\n", btn_der, btn_izq, mov);
	od;
}
