ltl spec {
	[](((state == ALARM_OFF) && p0) -> <> (state = EN_FIGURE_1))
	[](((state == EN_FIGURE_1) && time2s) -> <> (state = EN_FIGURE_2))
	[](((state == EN_FIGURE_1) && p0) -> <> (state = EN_FIGURE_1))
	[](((state == EN_FIGURE_1) && time10s) -> <> (state = ALARM_OFF))

	[](((state == EN_FIGURE_2) && time2s) -> <> (state = EN_FIGURE_3))
	[](((state == EN_FIGURE_2) && p0) -> <> (state = EN_FIGURE_2))
	[](((state == EN_FIGURE_2) && time10s) -> <> (state = ALARM_OFF))

	[](((state == (EN_FIGURE_3) && time2s) -> <> (state = ALARM_ON))
	[](((state == EN_FIGURE_3) && p0) -> <> (state = EN_FIGURE_3))
	[](((state == EN_FIGURE_3) && time10s) -> <> (state = ALARM_OFF))

	[](((state == ALARM_ON) && p0) -> <> (state = DIS_FIGURE_1))
	[](((state == ALARM_ON) && p15) -> <> (state = ALARM_ON))

	[](((state == DIS_FIGURE_1) && time2s) -> <> (state = DIS_FIGURE_2))
	[](((state == DIS_FIGURE_1) && p0) -> <> (state = DIS_FIGURE_1))
	[](((state == DIS_FIGURE_1) && time10s) -> <> (state = ALARM_ON))

	[](((state == DIS_FIGURE_2) && time2s) -> <> (state = DIS_FIGURE_3))
	[](((state == DIS_FIGURE_2) && p0) -> <> (state = DIS_FIGURE_2))
	[](((state == DIS_FIGURE_2) && time10s) -> <> (state = ALARM_ON))

	[](((state == DIS_FIGURE_3) && time2s) -> <> (state = ALARM_OFF))
	[](((state == DIS_FIGURE_3) && p0) -> <> (state = DIS_FIGURE_3))
	[](((state == DIS_FIGURE_3) && time10s) -> <> (state = ALARM_ON))
}

bit p0, p15, time2s, time10s;
mtype {ALARM_OFF, ALARM_ON, EN_FIGURE_1, EN_FIGURE_2, EN_FIGURE_3, DIS_FIGURE_1, DIS_FIGURE_2, DIS_FIGURE_3};
byte state;

active proctype alarma(){
	state = ALARM_OFF;
	do
	:: (state == ALARM_OFF) -> atomic {
		if
		::p0 -> state = EN_FIGURE_1; p0 = 0;
		fi
		}
	:: (state == EN_FIGURE_1) -> atomic {
		if
		::p0 -> state = EN_FIGURE_1; p0 = 0;
		::time2s -> state = EN_FIGURE_2; time2s = 0;
		::time10s -> state = ALARM_OFF; time10s = 0;
		fi
		}
	:: (state == EN_FIGURE_2) -> atomic {
		if
		::p0 -> state = EN_FIGURE_2; p0 = 0;
		::time2s -> state = EN_FIGURE_3; time2s = 0;
		::time10s -> state = ALARM_OFF; time10s = 0;
		fi
		}
	:: (state == EN_FIGURE_3) -> atomic {
		if
		::p0 -> state = EN_FIGURE_3; p0 = 0;
		::time2s -> state = ALARM_ON; time2s = 0;
		::time10s -> state = ALARM_OFF; time10s = 0;
		fi
		}
	:: (state == DIS_FIGURE_1) -> atomic {
		if
		::p0 -> state = DIS_FIGURE_1; p0 = 0;
		::time2s -> state = DIS_FIGURE_2; time2s = 0;
		::time10s -> state = ALARM_ON; time10s = 0;
		fi
		}	
	:: (state == DIS_FIGURE_2) -> atomic {
		if
		::p0 -> state = DIS_FIGURE_2; p0 = 0;
		::time2s -> state = DIS_FIGURE_3; time2s = 0;
		::time10s -> state = ALARM_ON; time10s = 0;
		fi
		}
	:: (state == DIS_FIGURE_3) -> atomic {
		if
		::p0 -> state = DIS_FIGURE_3; p0 = 0;
		::time2s -> state = ALARM_ON; time2s = 0;
		::time10s -> state = ALARM_OFF; time10s = 0;
		fi
		}
	:: (state == ALARM_ON) -> atomic {
		if
		::p0 -> state = DIS_FIGURE_1; p0 = 0;
		::p15 -> state = ALARM_ON; p15 = 0;
		fi
		}
	od
}

active proctype entorno(){
	do
	:: p0 = 1
	:: (!p0) -> skip;
	:: p15 = 1
	:: (!p15) -> skip
	:: time2s = 1
	:: (!time2s) -> skip
	:: time10s = 1
	:: (!time10s) -> skip
	od
}
