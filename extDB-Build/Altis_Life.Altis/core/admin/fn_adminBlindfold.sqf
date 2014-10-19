#include <macro.h>
/*
	File: fn_adminBlindfold.sqf
	Author: Shentoza
	Description: Forces a blindfold on the person. Has to be removed by person.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};
_current = _unit getVariable ["blindfolded",false];
//Broadcast!
if(!_current) then {
		_unit setVariable["blindfolded",true,true];
		_unit setVariable["adminBlindfold",true,true];
		waitUntil{ (_unit getVariable ["blindfolded",false]) && (_unit getVariable ["adminBlindfold",false]) };
		[[player],"life_fnc_blindfolded",_unit,true] spawn life_fnc_MP;
		titleText[format[localize "STR_Reb_Blindfold",_unit getVariable ["realname",name _unit]],"PLAIN"];
} else
{
	titleText[format[localize "STR_Reb_UnBlindfold",_unit getVariable ["realname",name _unit]],"PLAIN"];
	_unit setVariable["blindfolded",false,true];
};