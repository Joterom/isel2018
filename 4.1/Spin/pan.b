	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM spec */
;
		;
		;
		;
		;
		;
		;
		;
		
	case 7: // STATE 20
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC entorno */

	case 8: // STATE 1
		;
		now.bit0 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 10: // STATE 4
		;
		now.bit15 = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 12: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC lampara */

	case 13: // STATE 1
		;
		now.state = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: // STATE 5
		;
		now.bit0 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 16: // STATE 10
		goto R999;

	case 17: // STATE 8
		;
		now.bit15 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 19: // STATE 15
		;
		now.bit0 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 20: // STATE 20
		goto R999;

	case 21: // STATE 18
		;
		now.bit15 = trpt->bup.ovals[1];
		now.state = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 22: // STATE 25
		;
		p_restor(II);
		;
		;
		goto R999;
	}

