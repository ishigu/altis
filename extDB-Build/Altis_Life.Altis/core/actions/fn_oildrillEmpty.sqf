/*
	File: fn_oildrillEmpty.sqf
	Author: Shentoza
	
	Description: Takes the oil out of the oildrill
*/
_barrel = nearestObjects[getPos player,["Land_MetalBarrel_F"],2] select 0;
if(isNil "_barrel") exitWith {};
_generator = _barrel getVariable ["generator",objNull];
if(isNull _generator) exitWith {};
if(_generator getVariable ["mining",false]) exitWith {titleText[localize "STR_NOTF_DeviceIsRunning","PLAIN"];};
if(( _barrel getVariable ["oil",0] ) == 0) exitWith {hint localize "STR_NOTF_EmptyDevice";};
_oilamount = _barrel getVariable "oil";
_oilold = life_inv_oilu;

if(([true,"oilu",_oilamount] call life_fnc_handleInv)) then
{
	_itemName = [(["oilu",0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_DeviceTook",(_barrel getVariable "oil")],"PLAIN"];
	_oilnew = life_inv_oilu;
	_diff = _oilnew - _oilold;
	_barrel setVariable ["oil",(_oilamount - _diff),true];
	if(_oilamount - _diff != 0) then {titleText[localize "STR_NOTF_NoSpace","PLAIN"];};
}
else {
	titleText[localize "STR_NOTF_InvFull","PLAIN"];
};