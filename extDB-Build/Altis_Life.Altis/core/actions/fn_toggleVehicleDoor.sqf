/*
	File: fn_toggleVehicleDoor.sqf
	Author: ishi
	
	Description:
	Toggles the door animation of a vehicle
*/
private["_veh","_door","_phase","_toggle"];
_veh = nearestObjects[getPos player,["Air","LandVehicle"],7] select 0;
if (isNil "_veh") exitWith {};
if (!(_veh in life_vehicles)) exitWith {};

_door = (_this select 3) select 0;
_phase = _veh doorPhase _door; // 0 = closed, >0 => opened
_toggle = 0;
if (_phase == 0) then { _toggle = 1; } else { _toggle = 0; };

_veh animateDoor [_door, _toggle];