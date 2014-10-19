/*
	File: fn_restrainActionRebel.sqf
	Author: Tonic (basically)
			& Shentoza
	Description: Restraining for Rebels
*/
private["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable ["restrained",false])) exitWith {};
if((_unit call life_fnc_isMedic)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!


//Setup our progress bar
_title = localize "STR_Reb_Restraining";
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
	sleep 0.025;
	_cP = _cP + 0.005;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _unit > 4) exitWith {};
	if(_unit getVariable "restrained") exitWith {};
};
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(_cp < 1) exitWith {};
//Executed correctly?

_unit setVariable["restrained",true,true];
_unit setVariable["rebelRestrain",true,true];
[[player], "life_fnc_restrainRebel", _unit, false] spawn life_fnc_MP;
_unit say3D "Handcuffs";
titleText[localize "STR_NOTF_RestrainedPerson","PLAIN"];
[_unit] spawn
{
	private["_unit"];
	_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
	if(isNull _unit) exitWith {}; //Not valid
	waitUntil{(!(_unit getVariable ["restrained",false]))};
	if(_unit distance player > 15) exitWith {titleText[localize "STR_Reb_RebDistance","PLAIN"];};
	if(true) exitWith {titleText[localize "STR_Reb_RebUnres","PLAIN"];};
};