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

_revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
_target setVariable["Reviving",player,TRUE];
if(_target getVariable["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned"};

_target setVariable["Reviving",NIL,TRUE];
_target setVariable["Revive",TRUE,TRUE];
[[{life_atmcash = life_atmcash + (call life_revive_fee);}], "BIS_fnc_spawn", _target, false] spawn life_fnc_MP;
[[{systemChat "Du wurdest von einem Admin wiederbelebt! Die Kosten für den Medic wurden erstattet!";}], "BIS_fnc_spawn", _target, false] spawn life_fnc_MP;
if(_target == player) then {closeDialog 0;};
[[profileName],"life_fnc_revived",_target,FALSE] spawn life_fnc_MP;