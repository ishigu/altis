/*
	File: fn_pardon.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pardons the selected player.
*/
private["_display","_list","_uid"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_data = call compile format["%1", _data];
_text = lbText[2401,(lbCurSel 2401)];
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};

_uid = _data select 1;
[[1,format["%1 nahm %2 von der Fahndungsliste.",player getVariable ["realname",name player],_text]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[0,format["%1 nahm %2 von der Fahndungsliste.",player getVariable ["realname",name player],_text]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[_uid],"life_fnc_wantedPardon",false,false] spawn life_fnc_MP;