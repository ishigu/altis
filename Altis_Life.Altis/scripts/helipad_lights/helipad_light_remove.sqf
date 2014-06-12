/*
	Author: JoeJoe (27.12.13) v.1

	Description:
	Removes the lights around a helipad

	Parameter(s):
		helipad: helipad object (this or name of helipad)

	Example:
	
	* 1st way of calling:

		execute in trigger or script with helipad name
		null = [helipadName] execVM "helipad_lights\helipad_light_remove.sqf";
		

	Returns:
		nothing
	
	Changelog:
		v.1 initial release 
		
		v.11
			added:
			- isServer to prevent multiple clients call the script in mp
*/
private["_helipad", "_pos", "_types", "_objects"];

if (!isServer) exitWith {};

_helipad = _this select 0;

_pos = getPos _heliPad;
_types = ["Land_Flush_Light_red_F", "Land_Flush_Light_green_F","Land_Flush_Light_yellow_F","Land_runway_edgelight_blue_F","Land_runway_edgelight","B_IRStrobe","
 NVG_TargetC","O_IRStrobe","NVG_TargetW","I_IRStrobe","NVG_TargetE"];

_objects = nearestobjects [_pos,_types,8];
{
	deleteVehicle _x;
} forEach _objects;