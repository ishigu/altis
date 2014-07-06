/*
	File: fn_adacLoadout.sqf
	Author: ishi
	
	Description:
	Loads the adac member out with the default gear.
*/
removeAllContainers player;
removeAllWeapons player;
player addUniform "U_I_CombatUniform";
player addItem "B_Kitbag_cbr";
player assignItem "B_Kitbag_cbr";
player addItem "ToolKit";
player addItem "ToolKit";
player addItem "ToolKit";
player addItem "ToolKit";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
	player unlinkItem (hmd player);
};

[player, uniform player] call life_fnc_setUniform;