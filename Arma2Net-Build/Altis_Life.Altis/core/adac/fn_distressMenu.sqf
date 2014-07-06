#include <macro.h>
/*
	File: fn_distressMenu.sqf
	
	Description:
	When the distress menu is opened
*/
private["_display","_list","_index","_str","_data"];
disableSerialization;
if(isServer) exitWith{};
if(!(player call life_fnc_isADAC)) exitWith{};
_display = findDisplay 13100;
_list = _display displayCtrl 13102;
_data = _display displayCtrl 13103;
lbClear _list;
_data ctrlSetStructuredText parseText format["Kein Eintrag ausgewählt."];

if(count life_adac_distress > 0) then
{
	{
		_list lbAdd format["%1", name(_x select 1)];
		_list lbSetData[(lbSize _list)-1,name(_x select 1)];
	}forEach life_adac_distress;

	_index = lbCurSel 13102;
	if(_index != -1) then
	{
	_index = life_adac_distress select _index;
	_str = parseText format["Absender:%1<br/>Position: %2<br/>Nachricht:<br/> %3",name (_index select 1), mapGridPosition(_index select 2), (_index select 3)];
	_data ctrlSetStructuredText _str;
	};
}
else {
	_list lbAdd "Keine Einträge";
};