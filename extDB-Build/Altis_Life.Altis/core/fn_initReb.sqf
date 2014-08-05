/*
	File: fn_initReb.sqf
	Author: ishi
	
	Description:
	Initializes the rebels.
*/
private["_spawnPos"];
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_rebellevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
	["Du stehst nicht auf der Rebellenwhitelist.",false,true] call BIS_fnc_endMission;
	sleep 35;
};

if(life_is_arrested) then {
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
else {
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
player addRating 9999999;

[] call life_fnc_zoneCreator;
[] execVM "welcome.sqf";
player addItem "ItemMap"; 
player assignItem "ItemMap";
sleep 10;
hint "Du hast eine Karte erhalten.";
//[] call life_fnc_civSaveGear; //save gear into file