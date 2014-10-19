/*
	File: fn_escortActionRebel.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
if((player distance _unit) > 2) exitWith {};
if(_unit call life_fnc_isMedic) exitWith {}; //Not a medic
_unit attachTo [player,[0.1,1.1,0]];
_unit setVariable["transporting",false,true];
_unit setVariable["Escorting",true,true];
player reveal _unit;
[_unit] spawn {
	_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
	waitUntil {(!(_unit getVariable["Escorting",true])) || !alive player};
	if(!alive player && _unit getVariable["Escorting",false]) exitWith{[_unit] call life_fnc_stopEscortingRebel;};
};