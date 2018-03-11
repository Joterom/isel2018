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

		 /* CLAIM spec */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [((!(!(((state==OFF)&&(bit0||bit15))))&&!((state==ON))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!(( !( !(((((int)now.state)==1)&&(((int)now.bit0)||((int)now.bit15)))))&& !((((int)now.state)==2)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 3 - _spin_nvr.tmp:4 - [((!(!(((state==ON)&&(bit0||bit15))))&&!((state==OFF))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][3] = 1;
		if (!(( !( !(((((int)now.state)==2)&&(((int)now.bit0)||((int)now.bit15)))))&& !((((int)now.state)==1)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 10 - _spin_nvr.tmp:9 - [(!((state==ON)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][10] = 1;
		if (!( !((((int)now.state)==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 15 - _spin_nvr.tmp:13 - [(!((state==OFF)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported15 = 0;
			if (verbose && !reported15)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported15 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported15 = 0;
			if (verbose && !reported15)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported15 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][15] = 1;
		if (!( !((((int)now.state)==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 20 - _spin_nvr.tmp:15 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported20 = 0;
			if (verbose && !reported20)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported20 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported20 = 0;
			if (verbose && !reported20)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported20 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC entorno */
	case 8: // STATE 1 - ej2.pml:27 - [bit0 = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.bit0);
		now.bit0 = 1;
#ifdef VAR_RANGES
		logval("bit0", ((int)now.bit0));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 2 - ej2.pml:28 - [(!(bit0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!( !(((int)now.bit0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 4 - ej2.pml:29 - [bit15 = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.oval = ((int)now.bit15);
		now.bit15 = 1;
#ifdef VAR_RANGES
		logval("bit15", ((int)now.bit15));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 5 - ej2.pml:30 - [(!(bit15))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!( !(((int)now.bit15))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 10 - ej2.pml:32 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC lampara */
	case 13: // STATE 1 - ej2.pml:8 - [state = OFF] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.state);
		now.state = 1;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 2 - ej2.pml:10 - [((state==OFF))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)now.state)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 3 - ej2.pml:12 - [(bit0)] (22:0:2 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!(((int)now.bit0)))
			continue;
		/* merge: state = ON(22, 4, 22) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 2;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: bit0 = 0(22, 5, 22) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.bit0);
		now.bit0 = 0;
#ifdef VAR_RANGES
		logval("bit0", ((int)now.bit0));
#endif
		;
		/* merge: .(goto)(22, 10, 22) */
		reached[0][10] = 1;
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 16: // STATE 10 - ej2.pml:15 - [.(goto)] (0:22:0 - 2)
		IfNotBlocked
		reached[0][10] = 1;
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 17: // STATE 6 - ej2.pml:13 - [(bit15)] (22:0:2 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (!(((int)now.bit15)))
			continue;
		/* merge: state = ON(22, 7, 22) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 2;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: bit15 = 0(22, 8, 22) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.bit15);
		now.bit15 = 0;
#ifdef VAR_RANGES
		logval("bit15", ((int)now.bit15));
#endif
		;
		/* merge: .(goto)(22, 10, 22) */
		reached[0][10] = 1;
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 18: // STATE 12 - ej2.pml:16 - [((state==ON))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (!((((int)now.state)==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 13 - ej2.pml:18 - [(bit0)] (22:0:2 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!(((int)now.bit0)))
			continue;
		/* merge: state = OFF(22, 14, 22) */
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 1;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: bit0 = 0(22, 15, 22) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.bit0);
		now.bit0 = 0;
#ifdef VAR_RANGES
		logval("bit0", ((int)now.bit0));
#endif
		;
		/* merge: .(goto)(22, 20, 22) */
		reached[0][20] = 1;
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 20: // STATE 20 - ej2.pml:21 - [.(goto)] (0:22:0 - 2)
		IfNotBlocked
		reached[0][20] = 1;
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 21: // STATE 16 - ej2.pml:19 - [(bit15)] (22:0:2 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (!(((int)now.bit15)))
			continue;
		/* merge: state = OFF(22, 17, 22) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.state);
		now.state = 1;
#ifdef VAR_RANGES
		logval("state", ((int)now.state));
#endif
		;
		/* merge: bit15 = 0(22, 18, 22) */
		reached[0][18] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.bit15);
		now.bit15 = 0;
#ifdef VAR_RANGES
		logval("bit15", ((int)now.bit15));
#endif
		;
		/* merge: .(goto)(22, 20, 22) */
		reached[0][20] = 1;
		;
		/* merge: .(goto)(0, 23, 22) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 22: // STATE 25 - ej2.pml:23 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][25] = 1;
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

