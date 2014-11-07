/*
	File: fn_vehicleRopeAttach.sqf
	Author: ishi
	
	Description:
	Control which vehicles we can slingload
*/
private["_vehicle","_rope","_heli","_side"];
_heli = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_rope = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_vehicle = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
diag_log _this;
if(isNull _vehicle) exitWith {}; //NULL
if(isNull _rope) exitWith {}; //NULL
if(isNull _heli) exitWith {}; //NULL

_side = side (group (driver _heli));
if ((_side == independent) && (typeOf _heli == "O_Heli_Transport_04_F")) exitWith {}; // Allow ADAC to slingload vehicles nonetheless

[[_vehicle],"life_fnc_cutRopeIfNoKey",driver _heli,false] spawn life_fnc_MP;
