/*
	File: fn_civLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Shentoza
	
	Description:
	Loads the rebs out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "U_IG_Guerilla2_1";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

[] call life_fnc_saveGear;