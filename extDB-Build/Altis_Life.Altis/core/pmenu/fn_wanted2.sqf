private["_unit","_amount"];

ctrlShow[2001,false];
if((lbCurSel 9902) == -1) exitWith {hint "Niemand wurde ausgewaehlt!";ctrlShow[2001,true];};
_unit = lbData [9902,lbCurSel 9902];
_unit = call compile format["%1",_unit];
_amount = lbData [9991,lbCurSel 9991];
_text = lbText [9991,lbCurSel 9991];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
//if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
_text = toArray _text;
_index = -1;
_index = {if(_x == 36) exitWith {_forEachIndex}}forEach _text;
if(_index != -1) then{
	_text resize _index-1;
};
_text = toString _text;

[[1,format["%1 lässt wegen ""%2"" nach %3 fahnden.",player getVariable ["realname",name player],_text, name _unit]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[0,format["%1 lässt wegen ""%2"" nach %3 fahnden.",player getVariable ["realname",name player],_text, name _unit]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[getPlayerUID _unit,name _unit,_amount],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;