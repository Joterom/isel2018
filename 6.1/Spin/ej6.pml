ltl spec{
	[](((state == OFF) && p) -> <> (state == ON)) &&
	[](((state == ON) && (!p)) -> <> (state == OFF)) &&
	[](((state == ON) && alarm) -> <> (state == ON));
}

bit p, alarm;
mtype {ON, OFF};
byte state;

active proctype alarma(){
	state = OFF;
	do
	:: (state == OFF) -> atomic{
		if
		::(p) -> state = ON; 
		fi
		}
	:: (state == ON) -> atomic{
		if
		::(!p) -> state = OFF;
		::alarm -> state = ON;
		fi
		}
	od
}

active proctype entorno(){
	do
	:: p=1
	:: (!p) -> skip;
	:: alarm = 1;
	:: (!alarm) -> skip;
	od
}
