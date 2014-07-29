/*
Switches the mode of the radartrap
Author: Shentoza

*/
private ["_radarTrap","_mode"];
_radarTrap = nearestObjects[getPos player,["Land_PortableLight_single_F"],2] select 0;
if((isNil "_radarTrap")) exitWith {};

_mode = _radarTrap getVariable["mode","innerorts"];
if (_mode == "innerorts") then{
_radarTrap setVariable ["mode","ausserorts",true];
titleText["Du hast den Blitzer auf 'Ausserorts' eingestellt","PLAIN"];
}
else{
_radarTrap setVariable ["mode","innerorts",true];
titleText["Du hast den Blitzer auf 'Innerorts' eingestellt","PLAIN"];
};