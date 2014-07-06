/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
removeAllContainers player;
removeAllWeapons player;
player addUniform "U_I_CombatUniform";
player addItem "B_Kitbag_cbr";
player addItem "Medikit";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
	player unlinkItem (hmd player);
};

[player, uniform player] call life_fnc_setUniform;