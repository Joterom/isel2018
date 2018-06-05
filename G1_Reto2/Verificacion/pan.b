	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC entorno */

	case 3: // STATE 1
		;
		now.btn_der = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 2
		;
		now.btn_der = trpt->bup.oval;
		;
		goto R999;

	case 5: // STATE 3
		;
		now.btn_izq = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 4
		;
		now.btn_izq = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 5
		;
		choca_paredes = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 6
		;
		camino_libre = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 7
		;
		now.choca_raqueta = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 8
		;
		now.choca_techo = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 9
		;
		now.choca_suelo = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 10
		;
		now.choca_izq = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 11
		;
		now.choca_der = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 12
		;
		now.pelota_timeout = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 13
		;
		now.raqueta_timeout = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 19: // STATE 22
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC fsm_pelota */

	case 20: // STATE 1
		;
		now.b_state = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 22: // STATE 9
		;
		now.choca_techo = trpt->bup.ovals[5];
		now.choca_suelo = trpt->bup.ovals[4];
		now.choca_raqueta = trpt->bup.ovals[3];
		now.choca_izq = trpt->bup.ovals[2];
		now.choca_der = trpt->bup.ovals[1];
		now.b_state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;
;
		
	case 23: // STATE 48
		goto R999;

	case 24: // STATE 16
		;
		now.choca_techo = trpt->bup.ovals[5];
		now.choca_suelo = trpt->bup.ovals[4];
		now.choca_raqueta = trpt->bup.ovals[3];
		now.choca_der = trpt->bup.ovals[2];
		now.choca_izq = trpt->bup.ovals[1];
		now.b_state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;

	case 25: // STATE 23
		;
		now.choca_techo = trpt->bup.ovals[5];
		now.choca_suelo = trpt->bup.ovals[4];
		now.choca_raqueta = trpt->bup.ovals[3];
		now.choca_izq = trpt->bup.ovals[2];
		now.choca_der = trpt->bup.ovals[1];
		now.b_state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;

	case 26: // STATE 31
		;
		end = trpt->bup.ovals[6];
		now.choca_raqueta = trpt->bup.ovals[5];
		now.choca_techo = trpt->bup.ovals[4];
		now.choca_suelo = trpt->bup.ovals[3];
		now.choca_izq = trpt->bup.ovals[2];
		now.choca_der = trpt->bup.ovals[1];
		now.b_state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 27: // STATE 38
		;
		now.choca_techo = trpt->bup.ovals[5];
		now.choca_suelo = trpt->bup.ovals[4];
		now.choca_raqueta = trpt->bup.ovals[3];
		now.choca_izq = trpt->bup.ovals[2];
		now.choca_der = trpt->bup.ovals[1];
		now.b_state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;

	case 28: // STATE 46
		;
		now.pelota_timeout = trpt->bup.ovals[6];
		now.choca_techo = trpt->bup.ovals[5];
		now.choca_suelo = trpt->bup.ovals[4];
		now.choca_raqueta = trpt->bup.ovals[3];
		now.choca_izq = trpt->bup.ovals[2];
		now.choca_der = trpt->bup.ovals[1];
		now.b_state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 29: // STATE 53
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC fsm_raqueta */

	case 30: // STATE 1
		;
		now.r_state = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 32: // STATE 7
		;
		mov = trpt->bup.ovals[3];
		now.btn_izq = trpt->bup.ovals[2];
		now.btn_der = trpt->bup.ovals[1];
		now.r_state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		
	case 33: // STATE 22
		goto R999;

	case 34: // STATE 12
		;
		mov = trpt->bup.ovals[3];
		now.btn_izq = trpt->bup.ovals[2];
		now.btn_der = trpt->bup.ovals[1];
		now.r_state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 35: // STATE 17
		;
		mov = trpt->bup.ovals[3];
		now.btn_der = trpt->bup.ovals[2];
		now.btn_izq = trpt->bup.ovals[1];
		now.r_state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 36: // STATE 20
		;
		now.raqueta_timeout = trpt->bup.ovals[1];
		now.r_state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 37: // STATE 27
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC fsm_pantalla */

	case 38: // STATE 1
		;
		now.s_state = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 40: // STATE 4
		;
		now.s_state = trpt->bup.oval;
		;
		goto R999;

	case 41: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;
	}

