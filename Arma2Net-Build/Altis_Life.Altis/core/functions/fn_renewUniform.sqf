/*
	File: fn_renewUniform.sqf
	Author: ishi
	
	Description:
	Update Uniform textures if server requests it
*/
if(alive player && player == player) then {
	[player, uniform player] call life_fnc_setUniform;
};