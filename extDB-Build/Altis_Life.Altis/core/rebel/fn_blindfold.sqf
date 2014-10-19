/*
	File: fn_blindfold.sqf
	Author: Shentoza
	Description: Blindfolds a person
*/
private["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if((_unit call life_fnc_isMedic)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
_current = _unit getVariable ["blindfolded",false];
//Broadcast!
if(!_current) then {
	if([false,"blindbag",1] call life_fnc_handleInv) then
	{
		_unit setVariable["blindfolded",true,true];
		[[player],"life_fnc_blindfolded",_unit,true] spawn life_fnc_MP;
		titleText[format[localize "STR_Reb_Blindfold",_unit getVariable ["realname",name _unit]],"PLAIN"];
	}else{
		titleText[localize "STR_Reb_NoBlindbag","PLAIN"];
	};
} else
{
	titleText[localize "STR_Reb_AlreadyBlind","PLAIN"];
};