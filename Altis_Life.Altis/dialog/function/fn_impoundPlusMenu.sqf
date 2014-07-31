#include <macro.h>
/*
	File: fn_impoundPlusMenu.sqf
	Author: Shentoza for Westerland
	
	Description:
	Main Menu for the impoundPlusMenu
*/

private["_vehicles","_control"];
disableSerialization;
_vehicles = [_this,0,[],[[]]] call BIS_fnc_param;

ctrlShow[28503,false];
ctrlShow[28530,false];
waitUntil {!isNull (findDisplay 28500)};
if(count _vehicles == 0) exitWith
{
	ctrlSetText[28511,localize "STR_Garage_NoVehicles"];
};
_control = ((findDisplay 28500) displayCtrl 28502);
lbClear _control;


{
	_vehicleInfo = [_x select 2] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_tmp = [_x select 2,parseNumber(_x select 8)];
	_tmp = str(_tmp);
	_control lbSetData [(lbSize _control)-1,_tmp];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,parseNumber(_x select 0)];
} foreach _vehicles;

ctrlShow[28510,false];
ctrlShow[28511,false];