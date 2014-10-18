/*
	File: fn_restrainActionRebel.sqf
	Author: Tonic (basically)
			& Shentoza
	Description: Restraining for Rebels
*/
private["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable ["restrained",false])) exitWith {};
if((_unit call life_fnc_isMedic)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!


_unit setVariable["restrained",true,true];
_unit setVariable["rebelRestrain",true,true];
[[player], "life_fnc_restrainRebel", _unit, false] spawn life_fnc_MP;
_unit say3D "Handcuffs";
titleText[localize "STR_NOTF_RestrainedPerson","PLAIN"];
[_unit] spawn
{
	private["_unit"];
	_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
	if(isNull _unit) exitWith {}; //Not valid
	waitUntil{(!(_unit getVariable ["restrained",false]))};
	if(_unit distance player > 15) exitWith {titleText[localize "STR_Reb_RebDistance","PLAIN"];};
	if(true) exitWith {titleText[localize "STR_Reb_RebUnres","PLAIN"];};
};