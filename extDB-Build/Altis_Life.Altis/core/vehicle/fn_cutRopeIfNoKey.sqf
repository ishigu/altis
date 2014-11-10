/*
	File: fn_cutRopeIfNoKey.sqf
	Author: ishi
	
	Description:
	Don't allow slingloading if we don't have a key to the vehicle
*/
private["_veh"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (!(_veh in life_vehicles)) then {
	{
		ropeDestroy _x;
	} forEach (ropes (vehicle player));
};