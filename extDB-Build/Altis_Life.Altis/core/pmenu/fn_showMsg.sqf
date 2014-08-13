#include <macro.h>
/*

    file: fn_showMsg.sqf
    Author: Silex

*/
private["_index","_data","_status"];
_index = [_this,0,0] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cMessageList = _display displayCtrl 88882;
_cMessageShow = _display displayCtrl 88887;
_cMessageHeader = _display displayCtrl 88890;
_cSendBtn = _display displayCtrl 887892;

_data = call compile (_cMessageList lnbData[_index,0]);

_msgTarget = _data select 0;
if ((getPlayerUID player) == (_data select 0)) then { _msgTarget = _data select 1; };

_status = "[OFFLINE]";
{
    if(getPlayerUID _x == _msgTarget) then
    {
        _status = "[ONLINE]";
        life_smartphoneTarget = _x;
        ctrlEnable[887892,true];
    };
}forEach playableUnits;

if ((getPlayerUID player) == (_data select 0)) then {
	_cMessageHeader ctrlSetText format["Du schriebst %1 %2:",_data select 4,_status];
	_cMessageShow ctrlSetText format["%1",_data select 2];
	_cSendBtn ctrlSetText localize "STR_Smartphone_Schreiben";
} else {
	_cMessageHeader ctrlSetText format["%1 %2 schrieb:",_data select 3,_status];
	_cMessageShow ctrlSetText format["%1",_data select 2];
	_cSendBtn ctrlSetText localize "STR_Smartphone_Antworten";
};