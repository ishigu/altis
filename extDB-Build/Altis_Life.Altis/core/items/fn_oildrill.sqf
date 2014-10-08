/*
    File: fn_oildrill.sqf
	Author: Shentoza
    
    Beschreibung
    Platziert einen kleinen Bohrturm der Öl abbaut.
*/
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_item = "";
switch (_mode) do
{
	case 0: {_item = "oildrill";};
	case 1: {_item = "oildrill1";};
	default {_item = "oildrill";};
};
_generator = "Land_Portable_generator_F" createVehicle [0,0,0];
_barrel = "Land_MetalBarrel_F" createVehicle [0,0,0];
_generator attachTo[player,[0,2.5,1.25]];
_barrel attachTo[_generator,[0,.75,0]];
life_action_oildrillDeploy = player addAction["<t color='#00FF00'>Ölbohrer aufstellen</t>",{if(!isNull life_oildrill) then {detach life_oildrill; life_oildrill = ObjNull;}; player removeAction life_action_oildrillDeploy; life_action_oildrillDeploy = nil;},"",999,false,false,"",'!isNull life_oildrill && playerSide in [east,civilian]'];
life_oildrill = _generator;
waitUntil {isNull life_oildrill};
if(!isNil "life_action_oildrillDeploy") then {player removeAction life_action_oildrillDeploy;};
if(isNull _generator) exitWith {life_oildrill = ObjNull;};
detach _barrel;
_barrel setPos [(getPos _barrel select 0),(getPos _barrel select 1),0];
_generator setPos [(getPos _generator select 0),(getPos _generator select 1),0];
if( (player distance (getMarkerPos "oil_1") > 40) && (player distance getMarkerPos "oil_2" > 40) ) exitWith 
{
	hint localize "STR_NOTF_notNearResource";
	[true,_item,1] call life_fnc_handleInv;
    deleteVehicle _generator;
	deleteVehicle _barrel;
};
_generator allowDamage false;
_barrel allowDamage false;
_generator setVariable ["mode",_mode,true];
_generator setVariable ["item","generatorDeployed",true];
_generator setVariable ["barrel",_barrel,true];
_generator setVariable ["mining",false,true];
_barrel setVariable ["mode",_mode,true];
_barrel setVariable ["generator",_generator,true];
_barrel setVariable ["oil",0,true];