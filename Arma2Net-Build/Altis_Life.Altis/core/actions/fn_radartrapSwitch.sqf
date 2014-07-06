/*
Switches the mode of the radartrap
Author: Shentoza

*/
private ["_radarTrap","_mode"];
if(side (_this select 1) != west) exitWith{hint "Du bist kein Polizist!";};
_radarTrap = _this select 0;
_id = _this select 2;
if((isNil "_radarTrap")) exitWith {};

_mode = _radarTrap getVariable["mode",true];
if (_mode) then{
_radarTrap setVariable ["mode",false];
_radarTrap setUserActionText [_id,"Blitzer auf <t color='#00FF00'>'Innerorts'</t> einstellen"];
titleText["Du hast den Blitzer auf 'Ausserorts' eingestellt","PLAIN"];
}
else{
_radarTrap setVariable ["mode",true];
_radarTrap setUserActionText [_id,"Blitzer auf <t color='#00FF00'>'Ausserorts'</t> einstellen"];
titleText["Du hast den Blitzer auf 'Innerorts' eingestellt","PLAIN"];
};