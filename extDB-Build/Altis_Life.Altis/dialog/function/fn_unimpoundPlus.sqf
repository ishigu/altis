#include <macro.h>
/*
	File: fn_unimpoundPlus.sqf
	Author: Shentoza
	
	Description:
	Puts the car back into the garage
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 28502 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[28502,(lbCurSel 28502)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[28502,(lbCurSel 28502)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "Es ist ein Fehler aufgetreten..."};

_price = [_vehicle,__GETC__(life_garage_prices)] call TON_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
_price = _price *2;
if(life_atmcash < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

[[_vid,_pid],"DB_fnc_unimpoundVehiclePlus",false,false] spawn life_fnc_MP;
_vehicle = [_vehicle] call life_fnc_fetchVehInfo;
_vehicle = _vehicle select 3;
hint format[(localize "STR_Garage_RetrievingVeh"),_vehicle];
lbDelete [28502,(lbCurSel 28502)];
playSound "cashregister";
life_atmcash = life_atmcash - _price;
[[getPlayerUID player,playerSide,life_atmcash,1],"DB_fnc_updatePartial",false,false] spawn life_fnc_MP;
