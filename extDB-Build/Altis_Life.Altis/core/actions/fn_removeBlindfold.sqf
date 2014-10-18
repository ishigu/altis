/*
	File: fn_removeBlindfold.sqf
	Author: Shentoza
	Description: Removes the Blindfold from a person
*/
private["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if((_unit call life_fnc_isMedic)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
_current = _unit getVariable ["blindfolded",false];
//Broadcast!
if(_current) then {
	_unit setVariable["blindfolded",false,true];
	if(playerSide == east && (!(_unit getVariable ["adminBlindfold",false]))) then {
		[true,"blindbag",1] call life_fnc_handleInv;};
};