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
		now.p = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 10: // STATE 4
		;
		now.alarm = trpt->bup.oval;
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

		 /* PROC alarma */

	case 13: // STATE 1
		;
		now.state = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: // STATE 4
		;
		now.state = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 17: // STATE 10
		;
		now.state = trpt->bup.oval;
		;
		goto R999;
;
		
	case 18: // STATE 14
		goto R999;

	case 19: // STATE 12
		;
		now.state = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 19
		;
		p_restor(II);
		;
		;
		goto R999;
	}

