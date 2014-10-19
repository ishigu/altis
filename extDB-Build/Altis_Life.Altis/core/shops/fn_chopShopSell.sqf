/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};
if(isNil "life_garage_inUse") then {life_garage_inUse = time - 11;};
if((life_garage_inUse + 10) >= time) exitWith {closeDialog 0;hint localize "STR_NOTF_RapidAction";};

hint localize "STR_Shop_ChopShopSelling";
life_action_inUse = true;
_price2 = life_cash + _price;
playSound "cashregister";
[[player,_vehicle,_price,_price2],"TON_fnc_chopShopSell",false,false] spawn life_fnc_MP;
closeDialog 0;
life_garage_inUse = time;