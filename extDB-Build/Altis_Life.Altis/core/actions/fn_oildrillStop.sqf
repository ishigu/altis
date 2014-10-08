/*
	File: fn_oildrillStop.sqf
	Author: Shentoza
	Description: Stops the drilling
*/
_generator = nearestObjects[getPos player,["Land_Portable_generator_F"],2] select 0;
if(isNil "_generator") exitWith {};
if(!(_generator getVariable ["mining",true])) exitWith{};
_generator setVariable ["mining",false,true];