/*
	File: fn_impoundPlusInit.sqf
	Author: Shentoza for Westerland
	
	Description:
	Main Menu for the impoundPlusMenu
*/
_unit = _this select 1;
if(isNil "_unit") exitWith{};
createDialog "Life_impound_plus";
disableSerialization;
[[getPlayerUID player,playerSide,player],"TON_fnc_getImpoundedVehiclesPlus",false,false] spawn life_fnc_MP;