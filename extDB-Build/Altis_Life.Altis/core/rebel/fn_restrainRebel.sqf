/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
private["_unit","_player"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _unit) exitWith {};

//Monitor excessive restrainment
[_unit] spawn
{
	private["_unit","_time","_stopReason"];
	_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
	if(isNull _unit) exitWith {};
	_time = time;
	_stopReason = "";
	waitUntil{( (!(player getVariable ["restrained",false])) || (_unit distance player > 15) )};
	player setVariable["restrained",FALSE,TRUE];
	player setVariable["Escorting",FALSE,TRUE];
	player setVariable["transporting",false,true];
	detach player;
	titleText[localize "STR_Reb_VictimUnres","PLAIN"];
};

hint localize "STR_Reb_TiedUp";		
while {player getVariable ["restrained",false]} do
{
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
	
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable ["restrained",true]) || vehicle player != _state};
			
	if(!alive player) exitWith
	{
		player setVariable ["restrained",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach _player;
	};
	
	if(vehicle player != player) then
	{
		//disableUserInput true;
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
};

//disableUserInput false;
		
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	detach player;
};