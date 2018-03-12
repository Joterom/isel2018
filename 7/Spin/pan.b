	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC entorno */

	case 3: // STATE 1
		;
		now.p0 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 5: // STATE 4
		;
		now.p15 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 7: // STATE 7
		;
		now.time2s = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 9: // STATE 10
		;
		now.time10s = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 11: // STATE 16
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC alarma */

	case 12: // STATE 1
		;
		now.state = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: // STATE 5
		;
		now.p0 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 16: // STATE 12
		;
		now.p0 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 17: // STATE 20
		goto R999;

	case 18: // STATE 15
		;
		now.time2s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 19: // STATE 18
		;
		now.time10s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 21: // STATE 25
		;
		now.p0 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 22: // STATE 33
		goto R999;

	case 23: // STATE 28
		;
		now.time2s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 24: // STATE 31
		;
		now.time10s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 26: // STATE 38
		;
		now.p0 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 27: // STATE 46
		goto R999;

	case 28: // STATE 41
		;
		now.time2s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 29: // STATE 44
		;
		now.time10s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 31: // STATE 51
		;
		now.p0 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 32: // STATE 59
		goto R999;

	case 33: // STATE 54
		;
		now.time2s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 34: // STATE 57
		;
		now.time10s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 36: // STATE 64
		;
		now.p0 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 37: // STATE 72
		goto R999;

	case 38: // STATE 67
		;
		now.time2s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 39: // STATE 70
		;
		now.time10s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 41: // STATE 77
		;
		now.p0 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 42: // STATE 85
		goto R999;

	case 43: // STATE 80
		;
		now.time2s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 44: // STATE 83
		;
		now.time10s = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 46: // STATE 90
		;
		now.p0 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 47: // STATE 95
		goto R999;

	case 48: // STATE 93
		;
		now.p15 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 49: // STATE 100
		;
		p_restor(II);
		;
		;
		goto R999;
	}

