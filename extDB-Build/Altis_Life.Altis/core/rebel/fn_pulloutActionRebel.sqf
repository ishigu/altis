/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_unit = cursorTarget;
_crew = crew cursorTarget;

//Setup our progress bar
_title = localize "STR_Reb_PullingOut";
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
};
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
if(_cp < 1) exitWith {};
{
	if((_x getVariable ["restrained",false]) || (_x getVariable ["blindfolded",false])) then
	{
		_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
		[[_x],"life_fnc_pulloutVehRebel",_x,false] spawn life_fnc_MP;
	};
} foreach _crew;