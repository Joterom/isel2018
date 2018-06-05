#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC entorno */
	case 3: // STATE 1 - fsm_verif.pml:60 - [btn_der = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		(trpt+1)->bup.oval = ((int)now.btn_der);
		now.btn_der = 1;
#ifdef VAR_RANGES
		logval("btn_der", ((int)now.btn_der));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - fsm_verif.pml:61 - [btn_der = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		(trpt+1)->bup.oval = ((int)now.btn_der);
		now.btn_der = 0;
#ifdef VAR_RANGES
		logval("btn_der", ((int)now.btn_der));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - fsm_verif.pml:62 - [btn_izq = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		(trpt+1)->bup.oval = ((int)now.btn_izq);
		now.btn_izq = 0;
#ifdef VAR_RANGES
		logval("btn_izq", ((int)now.btn_izq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - fsm_verif.pml:63 - [btn_izq = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][4] = 1;
		(trpt+1)->bup.oval = ((int)now.btn_izq);
		now.btn_izq = 1;
#ifdef VAR_RANGES
		logval("btn_izq", ((int)now.btn_izq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - fsm_verif.pml:64 - [choca_paredes = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][5] = 1;
		(trpt+1)->bup.oval = ((int)choca_paredes);
		choca_paredes = 1;
#ifdef VAR_RANGES
		logval("choca_paredes", ((int)choca_paredes));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - fsm_verif.pml:65 - [camino_libre = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][6] = 1;
		(trpt+1)->bup.oval = ((int)camino_libre);
		camino_libre = 1;
#ifdef VAR_RANGES
		logval("camino_libre", ((int)camino_libre));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 7 - fsm_verif.pml:66 - [choca_raqueta = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][7] = 1;
		(trpt+1)->bup.oval = ((int)now.choca_raqueta);
		now.choca_raqueta = 1;
#ifdef VAR_RANGES
		logval("choca_raqueta", ((int)now.choca_raqueta));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 8 - fsm_verif.pml:67 - [choca_techo = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][8] = 1;
		(trpt+1)->bup.oval = ((int)now.choca_techo);
		now.choca_techo = 1;
#ifdef VAR_RANGES
		logval("choca_techo", ((int)now.choca_techo));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 9 - fsm_verif.pml:68 - [choca_suelo = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][9] = 1;
		(trpt+1)->bup.oval = ((int)now.choca_suelo);
		now.choca_suelo = 1;
#ifdef VAR_RANGES
		logval("choca_suelo", ((int)now.choca_suelo));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 10 - fsm_verif.pml:69 - [choca_izq = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][10] = 1;
		(trpt+1)->bup.oval = ((int)now.choca_izq);
		now.choca_izq = 1;
#ifdef VAR_RANGES
		logval("choca_izq", ((int)now.choca_izq));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 11 - fsm_verif.pml:70 - [choca_der = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][11] = 1;
		(trpt+1)->bup.oval = ((int)now.choca_der);
		now.choca_der = 1;
#ifdef VAR_RANGES
		logval("choca_der", ((int)now.choca_der));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 12 - fsm_verif.pml:71 - [pelota_timeout = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][12] = 1;
		(trpt+1)->bup.oval = ((int)now.pelota_timeout);
		now.pelota_timeout = 1;
#ifdef VAR_RANGES
		logval("pelota_timeout", ((int)now.pelota_timeout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 13 - fsm_verif.pml:72 - [raqueta_timeout = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[3][13] = 1;
		(trpt+1)->bup.oval = ((int)now.raqueta_timeout);
		now.raqueta_timeout = 1;
#ifdef VAR_RANGES
		logval("raqueta_timeout", ((int)now.raqueta_timeout));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 16 - fsm_verif.pml:74 - [printf('\\n Estado raqueta: %d, Estado pelota: %d, Estado pantalla: %d',r_state,b_state,s_state)] (0:0:0 - 14)
		IfNotBlocked
		reached[3][16] = 1;
		Printf("\n Estado raqueta: %d, Estado pelota: %d, Estado pantalla: %d", now.r_state, now.b_state, now.s_state);
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 17 - fsm_verif.pml:75 - [printf('\\n choca_paredes: %d, camino_libre: %d, choca_techo: %d, choca_raqueta: %d, choca_suelo: %d',choca_paredes,camino_libre,choca_techo,choca_raqueta,choca_suelo)] (0:0:0 - 1)
		IfNotBlocked
		reached[3][17] = 1;
		Printf("\n choca_paredes: %d, camino_libre: %d, choca_techo: %d, choca_raqueta: %d, choca_suelo: %d", ((int)choca_paredes), ((int)camino_libre), ((int)now.choca_techo), ((int)now.choca_raqueta), ((int)now.choca_suelo));
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 18 - fsm_verif.pml:76 - [printf('\\n Boton derecha: %d, Boton izquierda: %d, Raqueta: %d\\n',btn_der,btn_izq,mov)] (0:0:0 - 1)
		IfNotBlocked
		reached[3][18] = 1;
		Printf("\n Boton derecha: %d, Boton izquierda: %d, Raqueta: %d\n", ((int)now.btn_der), ((int)now.btn_izq), mov);
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 22 - fsm_verif.pml:78 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][22] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC fsm_pelota */
	case 20: // STATE 1 - fsm_verif.pml:42 - [b_state = PELOTA] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = now.b_state;
		now.b_state = 3;
#ifdef VAR_RANGES
		logval("b_state", now.b_state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 2 - fsm_verif.pml:44 - [((b_state==PELOTA))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!((now.b_state==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 3 - fsm_verif.pml:46 - [(choca_der)] (50:0:6 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!(((int)now.choca_der)))
			continue;
		/* merge: b_state = PELOTA(50, 4, 50) */
		reached[2][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = now.b_state;
		now.b_state = 3;
#ifdef VAR_RANGES
		logval("b_state", now.b_state);
#endif
		;
		/* merge: choca_der = 0(50, 5, 50) */
		reached[2][5] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.choca_der);
		now.choca_der = 0;
#ifdef VAR_RANGES
		logval("choca_der", ((int)now.choca_der));
#endif
		;
		/* merge: choca_izq = 0(50, 6, 50) */
		reached[2][6] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.choca_izq);
		now.choca_izq = 0;
#ifdef VAR_RANGES
		logval("choca_izq", ((int)now.choca_izq));
#endif
		;
		/* merge: choca_raqueta = 0(50, 7, 50) */
		reached[2][7] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.choca_raqueta);
		now.choca_raqueta = 0;
#ifdef VAR_RANGES
		logval("choca_raqueta", ((int)now.choca_raqueta));
#endif
		;
		/* merge: choca_suelo = 0(50, 8, 50) */
		reached[2][8] = 1;
		(trpt+1)->bup.ovals[4] = ((int)now.choca_suelo);
		now.choca_suelo = 0;
#ifdef VAR_RANGES
		logval("choca_suelo", ((int)now.choca_suelo));
#endif
		;
		/* merge: choca_techo = 0(50, 9, 50) */
		reached[2][9] = 1;
		(trpt+1)->bup.ovals[5] = ((int)now.choca_techo);
		now.choca_techo = 0;
#ifdef VAR_RANGES
		logval("choca_techo", ((int)now.choca_techo));
#endif
		;
		/* merge: .(goto)(50, 48, 50) */
		reached[2][48] = 1;
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[2][51] = 1;
		;
		_m = 3; goto P999; /* 8 */
	case 23: // STATE 48 - fsm_verif.pml:53 - [.(goto)] (0:50:0 - 6)
		IfNotBlocked
		reached[2][48] = 1;
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[2][51] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 24: // STATE 10 - fsm_verif.pml:47 - [(choca_izq)] (50:0:6 - 1)
		IfNotBlocked
		reached[2][10] = 1;
		if (!(((int)now.choca_izq)))
			continue;
		/* merge: b_state = PELOTA(50, 11, 50) */
		reached[2][11] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = now.b_state;
		now.b_state = 3;
#ifdef VAR_RANGES
		logval("b_state", now.b_state);
#endif
		;
		/* merge: choca_izq = 0(50, 12, 50) */
		reached[2][12] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.choca_izq);
		now.choca_izq = 0;
#ifdef VAR_RANGES
		logval("choca_izq", ((int)now.choca_izq));
#endif
		;
		/* merge: choca_der = 0(50, 13, 50) */
		reached[2][13] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.choca_der);
		now.choca_der = 0;
#ifdef VAR_RANGES
		logval("choca_der", ((int)now.choca_der));
#endif
		;
		/* merge: choca_raqueta = 0(50, 14, 50) */
		reached[2][14] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.choca_raqueta);
		now.choca_raqueta = 0;
#ifdef VAR_RANGES
		logval("choca_raqueta", ((int)now.choca_raqueta));
#endif
		;
		/* merge: choca_suelo = 0(50, 15, 50) */
		reached[2][15] = 1;
		(trpt+1)->bup.ovals[4] = ((int)now.choca_suelo);
		now.choca_suelo = 0;
#ifdef VAR_RANGES
		logval("choca_suelo", ((int)now.choca_suelo));
#endif
		;
		/* merge: choca_techo = 0(50, 16, 50) */
		reached[2][16] = 1;
		(trpt+1)->bup.ovals[5] = ((int)now.choca_techo);
		now.choca_techo = 0;
#ifdef VAR_RANGES
		logval("choca_techo", ((int)now.choca_techo));
#endif
		;
		/* merge: .(goto)(50, 48, 50) */
		reached[2][48] = 1;
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[2][51] = 1;
		;
		_m = 3; goto P999; /* 8 */
	case 25: // STATE 17 - fsm_verif.pml:48 - [(choca_raqueta)] (50:0:6 - 1)
		IfNotBlocked
		reached[2][17] = 1;
		if (!(((int)now.choca_raqueta)))
			continue;
		/* merge: b_state = PELOTA(50, 18, 50) */
		reached[2][18] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = now.b_state;
		now.b_state = 3;
#ifdef VAR_RANGES
		logval("b_state", now.b_state);
#endif
		;
		/* merge: choca_der = 0(50, 19, 50) */
		reached[2][19] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.choca_der);
		now.choca_der = 0;
#ifdef VAR_RANGES
		logval("choca_der", ((int)now.choca_der));
#endif
		;
		/* merge: choca_izq = 0(50, 20, 50) */
		reached[2][20] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.choca_izq);
		now.choca_izq = 0;
#ifdef VAR_RANGES
		logval("choca_izq", ((int)now.choca_izq));
#endif
		;
		/* merge: choca_raqueta = 0(50, 21, 50) */
		reached[2][21] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.choca_raqueta);
		now.choca_raqueta = 0;
#ifdef VAR_RANGES
		logval("choca_raqueta", ((int)now.choca_raqueta));
#endif
		;
		/* merge: choca_suelo = 0(50, 22, 50) */
		reached[2][22] = 1;
		(trpt+1)->bup.ovals[4] = ((int)now.choca_suelo);
		now.choca_suelo = 0;
#ifdef VAR_RANGES
		logval("choca_suelo", ((int)now.choca_suelo));
#endif
		;
		/* merge: choca_techo = 0(50, 23, 50) */
		reached[2][23] = 1;
		(trpt+1)->bup.ovals[5] = ((int)now.choca_techo);
		now.choca_techo = 0;
#ifdef VAR_RANGES
		logval("choca_techo", ((int)now.choca_techo));
#endif
		;
		/* merge: .(goto)(50, 48, 50) */
		reached[2][48] = 1;
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[2][51] = 1;
		;
		_m = 3; goto P999; /* 8 */
	case 26: // STATE 24 - fsm_verif.pml:49 - [(choca_suelo)] (50:0:7 - 1)
		IfNotBlocked
		reached[2][24] = 1;
		if (!(((int)now.choca_suelo)))
			continue;
		/* merge: b_state = PELOTA(50, 25, 50) */
		reached[2][25] = 1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = now.b_state;
		now.b_state = 3;
#ifdef VAR_RANGES
		logval("b_state", now.b_state);
#endif
		;
		/* merge: choca_der = 0(50, 26, 50) */
		reached[2][26] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.choca_der);
		now.choca_der = 0;
#ifdef VAR_RANGES
		logval("choca_der", ((int)now.choca_der));
#endif
		;
		/* merge: choca_izq = 0(50, 27, 50) */
		reached[2][27] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.choca_izq);
		now.choca_izq = 0;
#ifdef VAR_RANGES
		logval("choca_izq", ((int)now.choca_izq));
#endif
		;
		/* merge: choca_suelo = 0(50, 28, 50) */
		reached[2][28] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.choca_suelo);
		now.choca_suelo = 0;
#ifdef VAR_RANGES
		logval("choca_suelo", ((int)now.choca_suelo));
#endif
		;
		/* merge: choca_techo = 0(50, 29, 50) */
		reached[2][29] = 1;
		(trpt+1)->bup.ovals[4] = ((int)now.choca_techo);
		now.choca_techo = 0;
#ifdef VAR_RANGES
		logval("choca_techo", ((int)now.choca_techo));
#endif
		;
		/* merge: choca_raqueta = 0(50, 30, 50) */
		reached[2][30] = 1;
		(trpt+1)->bup.ovals[5] = ((int)now.choca_raqueta);
		now.choca_raqueta = 0;
#ifdef VAR_RANGES
		logval("choca_raqueta", ((int)now.choca_raqueta));
#endif
		;
		/* merge: end = 1(50, 31, 50) */
		reached[2][31] = 1;
		(trpt+1)->bup.ovals[6] = ((int)end);
		end = 1;
#ifdef VAR_RANGES
		logval("end", ((int)end));
#endif
		;
		/* merge: .(goto)(50, 48, 50) */
		reached[2][48] = 1;
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[2][51] = 1;
		;
		_m = 3; goto P999; /* 9 */
	case 27: // STATE 32 - fsm_verif.pml:50 - [(choca_techo)] (50:0:6 - 1)
		IfNotBlocked
		reached[2][32] = 1;
		if (!(((int)now.choca_techo)))
			continue;
		/* merge: b_state = PELOTA(50, 33, 50) */
		reached[2][33] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = now.b_state;
		now.b_state = 3;
#ifdef VAR_RANGES
		logval("b_state", now.b_state);
#endif
		;
		/* merge: choca_der = 0(50, 34, 50) */
		reached[2][34] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.choca_der);
		now.choca_der = 0;
#ifdef VAR_RANGES
		logval("choca_der", ((int)now.choca_der));
#endif
		;
		/* merge: choca_izq = 0(50, 35, 50) */
		reached[2][35] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.choca_izq);
		now.choca_izq = 0;
#ifdef VAR_RANGES
		logval("choca_izq", ((int)now.choca_izq));
#endif
		;
		/* merge: choca_raqueta = 0(50, 36, 50) */
		reached[2][36] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.choca_raqueta);
		now.choca_raqueta = 0;
#ifdef VAR_RANGES
		logval("choca_raqueta", ((int)now.choca_raqueta));
#endif
		;
		/* merge: choca_suelo = 0(50, 37, 50) */
		reached[2][37] = 1;
		(trpt+1)->bup.ovals[4] = ((int)now.choca_suelo);
		now.choca_suelo = 0;
#ifdef VAR_RANGES
		logval("choca_suelo", ((int)now.choca_suelo));
#endif
		;
		/* merge: choca_techo = 0(50, 38, 50) */
		reached[2][38] = 1;
		(trpt+1)->bup.ovals[5] = ((int)now.choca_techo);
		now.choca_techo = 0;
#ifdef VAR_RANGES
		logval("choca_techo", ((int)now.choca_techo));
#endif
		;
		/* merge: .(goto)(50, 48, 50) */
		reached[2][48] = 1;
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[2][51] = 1;
		;
		_m = 3; goto P999; /* 8 */
	case 28: // STATE 39 - fsm_verif.pml:51 - [(pelota_timeout)] (50:0:7 - 1)
		IfNotBlocked
		reached[2][39] = 1;
		if (!(((int)now.pelota_timeout)))
			continue;
		/* merge: b_state = PELOTA(50, 40, 50) */
		reached[2][40] = 1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = now.b_state;
		now.b_state = 3;
#ifdef VAR_RANGES
		logval("b_state", now.b_state);
#endif
		;
		/* merge: choca_der = 0(50, 41, 50) */
		reached[2][41] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.choca_der);
		now.choca_der = 0;
#ifdef VAR_RANGES
		logval("choca_der", ((int)now.choca_der));
#endif
		;
		/* merge: choca_izq = 0(50, 42, 50) */
		reached[2][42] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.choca_izq);
		now.choca_izq = 0;
#ifdef VAR_RANGES
		logval("choca_izq", ((int)now.choca_izq));
#endif
		;
		/* merge: choca_raqueta = 0(50, 43, 50) */
		reached[2][43] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.choca_raqueta);
		now.choca_raqueta = 0;
#ifdef VAR_RANGES
		logval("choca_raqueta", ((int)now.choca_raqueta));
#endif
		;
		/* merge: choca_suelo = 0(50, 44, 50) */
		reached[2][44] = 1;
		(trpt+1)->bup.ovals[4] = ((int)now.choca_suelo);
		now.choca_suelo = 0;
#ifdef VAR_RANGES
		logval("choca_suelo", ((int)now.choca_suelo));
#endif
		;
		/* merge: choca_techo = 0(50, 45, 50) */
		reached[2][45] = 1;
		(trpt+1)->bup.ovals[5] = ((int)now.choca_techo);
		now.choca_techo = 0;
#ifdef VAR_RANGES
		logval("choca_techo", ((int)now.choca_techo));
#endif
		;
		/* merge: pelota_timeout = 0(50, 46, 50) */
		reached[2][46] = 1;
		(trpt+1)->bup.ovals[6] = ((int)now.pelota_timeout);
		now.pelota_timeout = 0;
#ifdef VAR_RANGES
		logval("pelota_timeout", ((int)now.pelota_timeout));
#endif
		;
		/* merge: .(goto)(50, 48, 50) */
		reached[2][48] = 1;
		;
		/* merge: .(goto)(0, 51, 50) */
		reached[2][51] = 1;
		;
		_m = 3; goto P999; /* 9 */
	case 29: // STATE 53 - fsm_verif.pml:55 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][53] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC fsm_raqueta */
	case 30: // STATE 1 - fsm_verif.pml:26 - [r_state = RAQUETA] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = now.r_state;
		now.r_state = 2;
#ifdef VAR_RANGES
		logval("r_state", now.r_state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 2 - fsm_verif.pml:28 - [((r_state==RAQUETA))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((now.r_state==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 3 - fsm_verif.pml:30 - [((btn_der==btn_izq))] (24:0:4 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!((((int)now.btn_der)==((int)now.btn_izq))))
			continue;
		/* merge: r_state = RAQUETA(24, 4, 24) */
		reached[1][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.r_state;
		now.r_state = 2;
#ifdef VAR_RANGES
		logval("r_state", now.r_state);
#endif
		;
		/* merge: btn_der = 0(24, 5, 24) */
		reached[1][5] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.btn_der);
		now.btn_der = 0;
#ifdef VAR_RANGES
		logval("btn_der", ((int)now.btn_der));
#endif
		;
		/* merge: btn_izq = 0(24, 6, 24) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.btn_izq);
		now.btn_izq = 0;
#ifdef VAR_RANGES
		logval("btn_izq", ((int)now.btn_izq));
#endif
		;
		/* merge: mov = 0(24, 7, 24) */
		reached[1][7] = 1;
		(trpt+1)->bup.ovals[3] = mov;
		mov = 0;
#ifdef VAR_RANGES
		logval("mov", mov);
#endif
		;
		/* merge: .(goto)(24, 22, 24) */
		reached[1][22] = 1;
		;
		/* merge: .(goto)(0, 25, 24) */
		reached[1][25] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 33: // STATE 22 - fsm_verif.pml:35 - [.(goto)] (0:24:0 - 4)
		IfNotBlocked
		reached[1][22] = 1;
		;
		/* merge: .(goto)(0, 25, 24) */
		reached[1][25] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 34: // STATE 8 - fsm_verif.pml:31 - [((btn_der&&!(btn_izq)))] (24:0:4 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (!((((int)now.btn_der)&& !(((int)now.btn_izq)))))
			continue;
		/* merge: r_state = RAQUETA(24, 9, 24) */
		reached[1][9] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.r_state;
		now.r_state = 2;
#ifdef VAR_RANGES
		logval("r_state", now.r_state);
#endif
		;
		/* merge: btn_der = 0(24, 10, 24) */
		reached[1][10] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.btn_der);
		now.btn_der = 0;
#ifdef VAR_RANGES
		logval("btn_der", ((int)now.btn_der));
#endif
		;
		/* merge: btn_izq = 0(24, 11, 24) */
		reached[1][11] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.btn_izq);
		now.btn_izq = 0;
#ifdef VAR_RANGES
		logval("btn_izq", ((int)now.btn_izq));
#endif
		;
		/* merge: mov = 1(24, 12, 24) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals[3] = mov;
		mov = 1;
#ifdef VAR_RANGES
		logval("mov", mov);
#endif
		;
		/* merge: .(goto)(24, 22, 24) */
		reached[1][22] = 1;
		;
		/* merge: .(goto)(0, 25, 24) */
		reached[1][25] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 35: // STATE 13 - fsm_verif.pml:32 - [((btn_izq&&!(btn_der)))] (24:0:4 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!((((int)now.btn_izq)&& !(((int)now.btn_der)))))
			continue;
		/* merge: r_state = RAQUETA(24, 14, 24) */
		reached[1][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.r_state;
		now.r_state = 2;
#ifdef VAR_RANGES
		logval("r_state", now.r_state);
#endif
		;
		/* merge: btn_izq = 0(24, 15, 24) */
		reached[1][15] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.btn_izq);
		now.btn_izq = 0;
#ifdef VAR_RANGES
		logval("btn_izq", ((int)now.btn_izq));
#endif
		;
		/* merge: btn_der = 0(24, 16, 24) */
		reached[1][16] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.btn_der);
		now.btn_der = 0;
#ifdef VAR_RANGES
		logval("btn_der", ((int)now.btn_der));
#endif
		;
		/* merge: mov = 2(24, 17, 24) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[3] = mov;
		mov = 2;
#ifdef VAR_RANGES
		logval("mov", mov);
#endif
		;
		/* merge: .(goto)(24, 22, 24) */
		reached[1][22] = 1;
		;
		/* merge: .(goto)(0, 25, 24) */
		reached[1][25] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 36: // STATE 18 - fsm_verif.pml:33 - [(raqueta_timeout)] (24:0:2 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		if (!(((int)now.raqueta_timeout)))
			continue;
		/* merge: r_state = RAQUETA(24, 19, 24) */
		reached[1][19] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.r_state;
		now.r_state = 2;
#ifdef VAR_RANGES
		logval("r_state", now.r_state);
#endif
		;
		/* merge: raqueta_timeout = 0(24, 20, 24) */
		reached[1][20] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.raqueta_timeout);
		now.raqueta_timeout = 0;
#ifdef VAR_RANGES
		logval("raqueta_timeout", ((int)now.raqueta_timeout));
#endif
		;
		/* merge: .(goto)(24, 22, 24) */
		reached[1][22] = 1;
		;
		/* merge: .(goto)(0, 25, 24) */
		reached[1][25] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 37: // STATE 27 - fsm_verif.pml:37 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][27] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC fsm_pantalla */
	case 38: // STATE 1 - fsm_verif.pml:13 - [s_state = PANTALLA] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = now.s_state;
		now.s_state = 1;
#ifdef VAR_RANGES
		logval("s_state", now.s_state);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 2 - fsm_verif.pml:15 - [((s_state==PANTALLA))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((now.s_state==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 3 - fsm_verif.pml:17 - [(timeout)] (8:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!(((trpt->tau)&1)))
			continue;
		/* merge: s_state = PANTALLA(8, 4, 8) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = now.s_state;
		now.s_state = 1;
#ifdef VAR_RANGES
		logval("s_state", now.s_state);
#endif
		;
		/* merge: .(goto)(8, 6, 8) */
		reached[0][6] = 1;
		;
		/* merge: .(goto)(0, 9, 8) */
		reached[0][9] = 1;
		;
		_m = 1; goto P999; /* 3 */
	case 41: // STATE 11 - fsm_verif.pml:21 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

