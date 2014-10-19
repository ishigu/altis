/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag","_idx"];
_packet = [getPlayerUID player,(profileName),playerSide,life_cash,life_atmcash];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"civ"}};
{
	if(_x select 1 == _flag) then
	{
		_array set[count _array,[_x select 0,(missionNamespace getVariable (_x select 0))]];
	};
} foreach life_licenses;
_packet set[count _packet,_array];

[] call life_fnc_saveGear;

// Fuck you combatloggers!
if(alive player && !(player getVariable["Revive",FALSE])) then {
	_packet set[count _packet, life_gear];
} else {
	_packet set[count _packet, []];
};
_packet set[count _packet,life_is_arrested];

_idx = 0; // lastspawn array index, 0-> cop
switch (playerSide) do {
	case civilian: {
		_idx = 2;
	};
	case east: {
		_idx = 1;
	};
};

//Update lastspawn position
if (isNil {life_lastspawn}) then { life_lastspawn = [0,0,0]; };
life_lastspawn set[_idx,[] call life_fnc_getNearestSpawnPos];
_packet pushBack life_lastspawn;

[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;