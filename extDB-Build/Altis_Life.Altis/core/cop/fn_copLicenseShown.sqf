/*

	Wrap


*/

private["_msg"];

_msg = [_this,1,"",[""]] call BIS_fnc_param;
if(_msg == "") exitWith {};

hintSilent parseText _msg;