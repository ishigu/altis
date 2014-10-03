/*
	File: fn_stealPhoneAction.sqf
	Author: ishi
	
	Description:
	Steals the persons phone
*/
private["_target"];
_target = cursorTarget;

if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

//if(_target getVariable["knockedout",false]) exitWith {};
[[player],"life_fnc_stealPhoneClient",_target,false] spawn life_fnc_MP;