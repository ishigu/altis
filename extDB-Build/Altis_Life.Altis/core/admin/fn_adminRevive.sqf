#include <macro.h>
/*
	fn_adminRevive.sqf
	Author: Shentoza
	Description: Revives cursorTarget, or yourself if dead
*/
private ["_target"];
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitWith {};
if(isNull _target) exitWith {};
if((_target getVariable["Revive",false])) exitWith {};

if(!(isNull (_target getVariable ["Reviving",ObjNull])) && _target getVariable ["Reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
_target setVariable["Reviving",NIL,TRUE];
_target setVariable["Revive",TRUE,TRUE];
[[{life_atmcash = life_atmcash + (call life_revive_fee);}], "BIS_fnc_spawn", _target, false] spawn life_fnc_MP;
[[profileName],"life_fnc_revived",_target,FALSE] spawn life_fnc_MP;