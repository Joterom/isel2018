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
	case 3: // STATE 1 - ej7.pml:68 - [p0 = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.p0);
		now.p0 = 1;
#ifdef VAR_RANGES
		logval("p0", ((int)now.p0));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - ej7.pml:69 - [(!(p0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!( !(((int)now.p0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 4 - ej7.pml:70 - [p15 = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.oval = ((int)now.p15);
		now.p15 = 1;
#ifdef VAR_RANGES
		logval("p15", ((int)now.p15));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 5 - ej7.pml:71 - [(!(p15))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!( !(((int)now.p15))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 7 - ej7.pml:72 - [time2s = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		(trpt+1)->bup.oval = ((int)now.time2s);
		now.time2s = 1;
#ifdef VAR_RANGES
		logval("time2s", ((int)now.time2s));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 8 - ej7.pml:73 - [(!(time2s))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (!( !(((int)now.time2s))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 10 - ej7.pml:74 - [time10s = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.oval = ((int)now.time10s);
		now.time10s = 1;
#ifdef VAR_RANGES
		logval("time10s", ((int)now.time10s));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 11 - ej7.pml:75 - [(!(time10s))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!( !(((int)now.time10s))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 16 - ej7.pml:77 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC alarma */
	case 12: // STATE 1 - ej7.pml:8 - [state = ALARM_OFF] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.state);
		now.state = 8;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 2 - ej7.pml:10 - [((state==ALARM_OFF))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)now.state)==8)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 3 - ej7.pml:12 - [(p0)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!(((int)now.p0)))
			continue;
		/* merge: state = EN_FIGURE_1(97, 4, 97) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 6;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: p0 = 0(97, 5, 97) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.p0);
		now.p0 = 0;
#ifdef VAR_RANGES
		logval("p0", ((int)now.p0));
#endif
		;
		/* merge: .(goto)(97, 7, 97) */
		reached[0][7] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 15: // STATE 9 - ej7.pml:15 - [((state==EN_FIGURE_1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!((((int)now.state)==6)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 10 - ej7.pml:17 - [(p0)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		if (!(((int)now.p0)))
			continue;
		/* merge: state = EN_FIGURE_1(97, 11, 97) */
		reached[0][11] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 6;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: p0 = 0(97, 12, 97) */
		reached[0][12] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.p0);
		now.p0 = 0;
#ifdef VAR_RANGES
		logval("p0", ((int)now.p0));
#endif
		;
		/* merge: .(goto)(97, 20, 97) */
		reached[0][20] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 17: // STATE 20 - ej7.pml:21 - [.(goto)] (0:97:0 - 3)
		IfNotBlocked
		reached[0][20] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 13 - ej7.pml:18 - [(time2s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!(((int)now.time2s)))
			continue;
		/* merge: state = EN_FIGURE_2(97, 14, 97) */
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 5;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time2s = 0(97, 15, 97) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time2s);
		now.time2s = 0;
#ifdef VAR_RANGES
		logval("time2s", ((int)now.time2s));
#endif
		;
		/* merge: .(goto)(97, 20, 97) */
		reached[0][20] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 19: // STATE 16 - ej7.pml:19 - [(time10s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (!(((int)now.time10s)))
			continue;
		/* merge: state = ALARM_OFF(97, 17, 97) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 8;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time10s = 0(97, 18, 97) */
		reached[0][18] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time10s);
		now.time10s = 0;
#ifdef VAR_RANGES
		logval("time10s", ((int)now.time10s));
#endif
		;
		/* merge: .(goto)(97, 20, 97) */
		reached[0][20] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 20: // STATE 22 - ej7.pml:22 - [((state==EN_FIGURE_2))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		if (!((((int)now.state)==5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 23 - ej7.pml:24 - [(p0)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		if (!(((int)now.p0)))
			continue;
		/* merge: state = EN_FIGURE_2(97, 24, 97) */
		reached[0][24] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 5;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: p0 = 0(97, 25, 97) */
		reached[0][25] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.p0);
		now.p0 = 0;
#ifdef VAR_RANGES
		logval("p0", ((int)now.p0));
#endif
		;
		/* merge: .(goto)(97, 33, 97) */
		reached[0][33] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 22: // STATE 33 - ej7.pml:28 - [.(goto)] (0:97:0 - 3)
		IfNotBlocked
		reached[0][33] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 23: // STATE 26 - ej7.pml:25 - [(time2s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][26] = 1;
		if (!(((int)now.time2s)))
			continue;
		/* merge: state = EN_FIGURE_3(97, 27, 97) */
		reached[0][27] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 4;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time2s = 0(97, 28, 97) */
		reached[0][28] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time2s);
		now.time2s = 0;
#ifdef VAR_RANGES
		logval("time2s", ((int)now.time2s));
#endif
		;
		/* merge: .(goto)(97, 33, 97) */
		reached[0][33] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 24: // STATE 29 - ej7.pml:26 - [(time10s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][29] = 1;
		if (!(((int)now.time10s)))
			continue;
		/* merge: state = ALARM_OFF(97, 30, 97) */
		reached[0][30] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 8;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time10s = 0(97, 31, 97) */
		reached[0][31] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time10s);
		now.time10s = 0;
#ifdef VAR_RANGES
		logval("time10s", ((int)now.time10s));
#endif
		;
		/* merge: .(goto)(97, 33, 97) */
		reached[0][33] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 25: // STATE 35 - ej7.pml:29 - [((state==EN_FIGURE_3))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][35] = 1;
		if (!((((int)now.state)==4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 36 - ej7.pml:31 - [(p0)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][36] = 1;
		if (!(((int)now.p0)))
			continue;
		/* merge: state = EN_FIGURE_3(97, 37, 97) */
		reached[0][37] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 4;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: p0 = 0(97, 38, 97) */
		reached[0][38] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.p0);
		now.p0 = 0;
#ifdef VAR_RANGES
		logval("p0", ((int)now.p0));
#endif
		;
		/* merge: .(goto)(97, 46, 97) */
		reached[0][46] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 27: // STATE 46 - ej7.pml:35 - [.(goto)] (0:97:0 - 3)
		IfNotBlocked
		reached[0][46] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 28: // STATE 39 - ej7.pml:32 - [(time2s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][39] = 1;
		if (!(((int)now.time2s)))
			continue;
		/* merge: state = ALARM_ON(97, 40, 97) */
		reached[0][40] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 7;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time2s = 0(97, 41, 97) */
		reached[0][41] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time2s);
		now.time2s = 0;
#ifdef VAR_RANGES
		logval("time2s", ((int)now.time2s));
#endif
		;
		/* merge: .(goto)(97, 46, 97) */
		reached[0][46] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 29: // STATE 42 - ej7.pml:33 - [(time10s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][42] = 1;
		if (!(((int)now.time10s)))
			continue;
		/* merge: state = ALARM_OFF(97, 43, 97) */
		reached[0][43] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 8;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time10s = 0(97, 44, 97) */
		reached[0][44] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time10s);
		now.time10s = 0;
#ifdef VAR_RANGES
		logval("time10s", ((int)now.time10s));
#endif
		;
		/* merge: .(goto)(97, 46, 97) */
		reached[0][46] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 30: // STATE 48 - ej7.pml:36 - [((state==DIS_FIGURE_1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][48] = 1;
		if (!((((int)now.state)==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 49 - ej7.pml:38 - [(p0)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][49] = 1;
		if (!(((int)now.p0)))
			continue;
		/* merge: state = DIS_FIGURE_1(97, 50, 97) */
		reached[0][50] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 3;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: p0 = 0(97, 51, 97) */
		reached[0][51] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.p0);
		now.p0 = 0;
#ifdef VAR_RANGES
		logval("p0", ((int)now.p0));
#endif
		;
		/* merge: .(goto)(97, 59, 97) */
		reached[0][59] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 32: // STATE 59 - ej7.pml:42 - [.(goto)] (0:97:0 - 3)
		IfNotBlocked
		reached[0][59] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 33: // STATE 52 - ej7.pml:39 - [(time2s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][52] = 1;
		if (!(((int)now.time2s)))
			continue;
		/* merge: state = DIS_FIGURE_2(97, 53, 97) */
		reached[0][53] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 2;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time2s = 0(97, 54, 97) */
		reached[0][54] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time2s);
		now.time2s = 0;
#ifdef VAR_RANGES
		logval("time2s", ((int)now.time2s));
#endif
		;
		/* merge: .(goto)(97, 59, 97) */
		reached[0][59] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 34: // STATE 55 - ej7.pml:40 - [(time10s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][55] = 1;
		if (!(((int)now.time10s)))
			continue;
		/* merge: state = ALARM_ON(97, 56, 97) */
		reached[0][56] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 7;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time10s = 0(97, 57, 97) */
		reached[0][57] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time10s);
		now.time10s = 0;
#ifdef VAR_RANGES
		logval("time10s", ((int)now.time10s));
#endif
		;
		/* merge: .(goto)(97, 59, 97) */
		reached[0][59] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 35: // STATE 61 - ej7.pml:43 - [((state==DIS_FIGURE_2))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][61] = 1;
		if (!((((int)now.state)==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 62 - ej7.pml:45 - [(p0)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][62] = 1;
		if (!(((int)now.p0)))
			continue;
		/* merge: state = DIS_FIGURE_2(97, 63, 97) */
		reached[0][63] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 2;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: p0 = 0(97, 64, 97) */
		reached[0][64] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.p0);
		now.p0 = 0;
#ifdef VAR_RANGES
		logval("p0", ((int)now.p0));
#endif
		;
		/* merge: .(goto)(97, 72, 97) */
		reached[0][72] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 37: // STATE 72 - ej7.pml:49 - [.(goto)] (0:97:0 - 3)
		IfNotBlocked
		reached[0][72] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 38: // STATE 65 - ej7.pml:46 - [(time2s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][65] = 1;
		if (!(((int)now.time2s)))
			continue;
		/* merge: state = DIS_FIGURE_3(97, 66, 97) */
		reached[0][66] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 1;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time2s = 0(97, 67, 97) */
		reached[0][67] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time2s);
		now.time2s = 0;
#ifdef VAR_RANGES
		logval("time2s", ((int)now.time2s));
#endif
		;
		/* merge: .(goto)(97, 72, 97) */
		reached[0][72] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 39: // STATE 68 - ej7.pml:47 - [(time10s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][68] = 1;
		if (!(((int)now.time10s)))
			continue;
		/* merge: state = ALARM_ON(97, 69, 97) */
		reached[0][69] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 7;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time10s = 0(97, 70, 97) */
		reached[0][70] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time10s);
		now.time10s = 0;
#ifdef VAR_RANGES
		logval("time10s", ((int)now.time10s));
#endif
		;
		/* merge: .(goto)(97, 72, 97) */
		reached[0][72] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 40: // STATE 74 - ej7.pml:50 - [((state==DIS_FIGURE_3))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][74] = 1;
		if (!((((int)now.state)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 75 - ej7.pml:52 - [(p0)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][75] = 1;
		if (!(((int)now.p0)))
			continue;
		/* merge: state = DIS_FIGURE_3(97, 76, 97) */
		reached[0][76] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 1;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: p0 = 0(97, 77, 97) */
		reached[0][77] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.p0);
		now.p0 = 0;
#ifdef VAR_RANGES
		logval("p0", ((int)now.p0));
#endif
		;
		/* merge: .(goto)(97, 85, 97) */
		reached[0][85] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 42: // STATE 85 - ej7.pml:56 - [.(goto)] (0:97:0 - 3)
		IfNotBlocked
		reached[0][85] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 43: // STATE 78 - ej7.pml:53 - [(time2s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][78] = 1;
		if (!(((int)now.time2s)))
			continue;
		/* merge: state = ALARM_ON(97, 79, 97) */
		reached[0][79] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 7;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time2s = 0(97, 80, 97) */
		reached[0][80] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time2s);
		now.time2s = 0;
#ifdef VAR_RANGES
		logval("time2s", ((int)now.time2s));
#endif
		;
		/* merge: .(goto)(97, 85, 97) */
		reached[0][85] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 44: // STATE 81 - ej7.pml:54 - [(time10s)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][81] = 1;
		if (!(((int)now.time10s)))
			continue;
		/* merge: state = ALARM_OFF(97, 82, 97) */
		reached[0][82] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 8;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: time10s = 0(97, 83, 97) */
		reached[0][83] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.time10s);
		now.time10s = 0;
#ifdef VAR_RANGES
		logval("time10s", ((int)now.time10s));
#endif
		;
		/* merge: .(goto)(97, 85, 97) */
		reached[0][85] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 45: // STATE 87 - ej7.pml:57 - [((state==ALARM_ON))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][87] = 1;
		if (!((((int)now.state)==7)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 88 - ej7.pml:59 - [(p0)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][88] = 1;
		if (!(((int)now.p0)))
			continue;
		/* merge: state = DIS_FIGURE_1(97, 89, 97) */
		reached[0][89] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 3;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: p0 = 0(97, 90, 97) */
		reached[0][90] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.p0);
		now.p0 = 0;
#ifdef VAR_RANGES
		logval("p0", ((int)now.p0));
#endif
		;
		/* merge: .(goto)(97, 95, 97) */
		reached[0][95] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 47: // STATE 95 - ej7.pml:62 - [.(goto)] (0:97:0 - 2)
		IfNotBlocked
		reached[0][95] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 48: // STATE 91 - ej7.pml:60 - [(p15)] (97:0:2 - 1)
		IfNotBlocked
		reached[0][91] = 1;
		if (!(((int)now.p15)))
			continue;
		/* merge: state = ALARM_ON(97, 92, 97) */
		reached[0][92] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 7;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: p15 = 0(97, 93, 97) */
		reached[0][93] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.p15);
		now.p15 = 0;
#ifdef VAR_RANGES
		logval("p15", ((int)now.p15));
#endif
		;
		/* merge: .(goto)(97, 95, 97) */
		reached[0][95] = 1;
		;
		/* merge: .(goto)(0, 98, 97) */
		reached[0][98] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 49: // STATE 100 - ej7.pml:64 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][100] = 1;
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

