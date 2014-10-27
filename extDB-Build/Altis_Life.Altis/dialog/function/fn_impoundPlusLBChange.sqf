#include <macro.h>
/*
	File: fn_impoundPlusLBChange.sqf
	Author: Shentoza
	
	Description:
*/
disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_retrievePrice"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = _control lbData _index; _dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
_vehicleColor = [_className,_dataArr select 1] call life_fnc_vehicleColorStr;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_retrievePrice = [_className,__GETC__(life_garage_prices)] call TON_fnc_index;
_retrievePrice = if(_retrievePrice == -1) then {1000} else {(__GETC__(life_garage_prices) select _retrievePrice) select 1;};
_retrievePrice = _retrievePrice * 2;

(getControl(28500,28503)) ctrlSetStructuredText parseText format["
	Kaufpreis: <t color='#8cff9b'>$%1</t><br/>
	Farbe: %7<br/>
	Max Geschwindigkeit: %2 km/h<br/>
	PS: %3<br/>
	Passagiersitze: %4<br/>
	Kofferraum: %5<br/>
	Tankinhalt: %6
	",
[_retrievePrice] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleColor
];

ctrlShow [28503,true];
ctrlShow [28530,true];