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

hint "Versteck dich, Rex!";

_unit setvariable ["follow",'false'];
_unit setvariable ["order","nil"];
_unit setvariable ["step","go"];
_unit setvariable ["action","false"];

sleep 3;
deleteVehicle _dog;