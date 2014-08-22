/*
	File: fn_dogHide.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Hides/removes the dog
*/
private ["_unit","_dog"];
_unit 	= _this select 0;
_dog 	= _unit getvariable "dog";

hint "Jessie, Hide!";

_unit setvariable ["follow",'false'];
_unit setvariable ["order","nil"];
_unit setvariable ["step","go"];

sleep 3;
deleteVehicle _dog;