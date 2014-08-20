#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};
if((player call life_fnc_isMedic)) then {
	if(!((__GETC__(life_medicLevel)) == 1 ||(__GETC__(life_medicLevel)) == 3)) exitWith {
		["Du bist kein Notarzt",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
	};
	[] call life_fnc_medicLoadout;
};

if(!(player call life_fnc_isMedic) && (playerSide == independent)) then {
	if(!((__GETC__(life_medicLevel)) == 2 ||(__GETC__(life_medicLevel)) == 3)) exitWith {
		["Du bist kein Adac",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
    };
	[] call life_fnc_adacLoadout;
};

[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_I_CombatUniform"};
        [player, uniform player] call life_fnc_setUniform;
        waitUntil {uniform player != "U_I_CombatUniform"};
    };
};

[] spawn
{
while {true} do
    {
        waitUntil {backpack player == "B_Kitbag_cbr"};
        [player, uniform player] call life_fnc_setUniform;
        waitUntil {backpack player != "B_Kitbag_cbr"};
    };
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.