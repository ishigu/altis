/*
	File: fn_addGangLocs.sqf
	Author: Vampire
	
	Description:
	What does the fox say?
*/

private ["_gangNum","_pos","_name","_text","_nil","_flag"];

life_gang_flags = [];
_gangNum = 0;
{
	_pos = _x;
	_gangNum = _gangNum + 1;
	_name = format["Gang_Area_%1", _gangNum];
	_text = format["Ganggebiet %1", _gangNum];
	
	_nil = createMarker [_name, _pos];
	_name setMarkerColor "ColorRed";
	_name setMarkerType "mil_dot";
	_name setMarkerText _text;
	
	_flag = "Flag_Red_F" createVehicle _pos;
	life_gang_flags = life_gang_flags + [_flag];
	_flag setPos _pos;
	_flag setVariable ["gangControl", "", true];
	_flag setVariable ["gangNum", str(_gangNum), true];
	
} forEach [
	[4184.92,11743.2,0],[4794.88,16215.7,0],[4531.71,21329.7,0],
	[9468.22,20291.7,0],[14596.5,20773.4,0],[18292.7,15531.4,0],
	[21408.7,16363.8,0],[19419,13328.3,0],[21751.6,7537.62,0],
	[26727.9,24634.2,0]
]; // ,[9231.08,8057.51,0] rebellendorf || [9231.74,15997.9,0], dp11
// above here are the coordinates
publicVariable "life_gang_flags";