/*
	File: fn_oildrillActivate
	Author: Shentoza
	
	Description: starts the drill and lets it drill
*/
_generator = nearestObjects[getPos player,["Land_Portable_generator_F"],2] select 0;
if(isNil "_generator") exitWith {};
_barrel = _generator getVariable ["barrel",objNull];
if(isNull _barrel) exitWith {};
if(_generator getVariable ["mining",false]) exitWith {hint localize "STR_NOTF_DeviceIsMining";};


_mode = _generator getVariable ["mode",0];
_maxOil = 0;
_chance = 0;
switch (true) do
{
	case (_mode == 0): {_chance = 60;_maxOil = 10;};
	case (_mode == 1): {_chance = 40;_maxOil = 20;};
	default {_chance = 60;_maxOil = 10;};
};
if((_barrel getVariable ["oil",0]) == _maxOil) exitWith {titleText[localize "STR_NOTF_BarrelFull","PLAIN"];};

//Setup our progress bar
_title = localize "STR_NOTF_DeviceActivate";
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.02;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _generator > 4) exitWith {};
	if(_generator getVariable "mining") exitWith {};
};
5 cutText ["","PLAIN"];
player playActionNow "stop";

_generator setVariable ["mining",true,true];
_timesDrilled = 0;
_stopped = false;
while {true} do
{
	if((_barrel getVariable ["oil",0]) == _maxOil) exitWith {titleText[localize "STR_NOTF_BarrelFull","PLAIN"];_generator setVariable ["mining",nil,true];};
	if( ( (_timesDrilled >= 5) && (round(random 100) <= _chance) )) exitWith
		{
			_generator setVariable ["mining",nil,true];titleText[localize"STR_NOTF_DeviceBroke","PLAIN"];
		};
	_time = time + 8;
	playSound3D ["a3\sounds_f_epc\Truck_03\ext\truck03_exhaust_1.wss",_generator,false,getPosATL _generator,1.5,1,2500];
	waitUntil {
		if(!(_generator getVariable ["mining",true])) exitWith {_stopped = true;true};
		if(round(_time - time) == 4) then {playSound3D ["a3\sounds_f_epc\Truck_03\ext\truck03_exhaust_1.wss",_generator,false,getPosATL _generator,1.5,1,2500];};
		if(round(_time - time) < 1) exitWith {true};
		sleep 0.2;
		false
	};
	if(_stopped) exitWith {titleText[localize "STR_NOTF_DeviceStopped","PLAIN"]; };
	_timesDrilled = _timesDrilled + 1;
	_barrel setVariable["oil",(_barrel getVariable ["oil",0])+1,true];
	hint format [localize "STR_NOTF_BarrelProgress",(_barrel getVariable "oil"),_maxOil];
};
	
	