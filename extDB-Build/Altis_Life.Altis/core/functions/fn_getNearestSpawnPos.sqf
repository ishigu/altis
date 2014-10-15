/*
	File: fn_getNearestSpawnPos.sqf
	Author: ishi
	
	Description:
	Calculates the nearest spawn position
*/
private["_nearest","_markers","_str"];
_nearest = 0;

_markers = [playerSide] call life_fnc_spawnPointCfg;
if (count _markers > 0) then {
	{
		if (((getPos player) distance (getMarkerPos (_x select 0))) <= ((getPos player) distance (getMarkerPos ((_markers select _nearest) select 0)))) then {
			_str = toArray (_x select 0);
			_str resize 6;
			_str = toString _str;
			
			if (_str != "house_") then { _nearest = [_x select 0, _markers] call fnc_index; };
		};
	} forEach _markers;
};

if (_nearest == -1) then { _nearest = 0; };

_nearest