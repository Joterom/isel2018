ltl spec{
	[]((state == OFF) && (bit0 || bit15) -> <> (state == ON)) &&
	[]((state == ON) && (bit0 || bit15) -> <> (state == OFF))
}

mtype = {ON, OFF};
bit bit0, bit15;
byte state;

active proctype lampara() {
	state = OFF;
	do
	::(state == OFF) -> atomic {
			if
			::bit0 -> state = ON; bit0 = 0;
			::bit15 -> state = ON; bit15 = 0;
			fi
			}
	::(state == ON) -> atomic {
			if
			::bit0 -> state = OFF; bit0 = 0;
			::bit15 -> state = OFF; bit15 = 0;
			fi;
			}
	od
}

active proctype entorno(){
	do
	::bit0 = 1
	::(!bit0) -> skip
	::bit15 = 1
	::(!bit15) -> skip
	od
}

