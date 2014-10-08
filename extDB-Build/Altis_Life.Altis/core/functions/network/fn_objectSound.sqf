/*
	Description:
	Plays a sound spawning on an object ( in a loop)
	Author: Tonic
	Edited by: Shentoza
*/
_object = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_sound = [_this,1,"",[""]] call BIS_fnc_param;
_sleep = [_this,2,-1,[0]] call BIS_fnc_param;
_condition = [_this,3,"",[""]] call BIS_fnc_param;
_distance = [_this,4,-1,[0]] call BIS_fnc_param;
if(isNull _object || _sound == "" || _sleep == -1 || _condition == "" || _distance == -1) exitWith {};
if(player distance _object > _distance) exitWith {}; //Don't run it... They're to far out..
while {true} do {
	if(isNull _object OR !alive _object) exitWith {};
	if(isNil {_object getVariable _condition}) exitWith {};
	_object playSound3D [_sound,_object];
	sleep _sleep;
};