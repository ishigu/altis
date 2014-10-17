/*
	File: fn_spawnPointCustomCfg.sqf
	Author: ishi
	
	Description:
	Determines the spawn points a player can choose from
*/
private["_spCfg","_lastSpawn"];
_spCfg = [_this select 0] call life_fnc_spawnPointCfg;
_tmp = [];
_lastSpawn = life_lastspawn select 0;
switch (_this select 0) do {
	case civilian: {
		_lastSpawn = life_lastspawn select 2;
	};
	case east: {
		_lastSpawn = life_lastspawn select 1;
	};
	case independent: {
		life_showAllSpawnpoints = true;
	};
};
{
	if ((_x select 2) == "\a3\ui_f\data\map\MapControl\lighthouse_ca.paa") then {
		// It's a house, add it
		_tmp pushBack _x;
	};
	
	_tmpIdx = [_x select 0, _spCfg] call fnc_index;
	if ((_tmpIdx == _lastSpawn) || life_showAllSpawnpoints) then {
		_tmp pushBack _x;
	};
	//diag_log format["spawnPointCustomCfg: _tmpIdx: %1, _x: %2, _lastSpawn: %3, _tmp: %4", _tmpIdx, _x, _lastSpawn, _tmp];
} forEach _spCfg;
_tmp