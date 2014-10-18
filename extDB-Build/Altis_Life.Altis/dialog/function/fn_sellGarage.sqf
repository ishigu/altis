#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_display","_btn"];
disableSerialization;
_display = findDisplay 2800;
_btn = _display displayCtrl 2840;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = [_vehicle,__GETC__(life_garage_sell)] call fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};
if (playerSide == independent) then { _price = 5000; };
_btn ctrlEnable false;
[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn life_fnc_MP;
sleep 2;
_btn ctrlEnable true;
closeDialog 0;