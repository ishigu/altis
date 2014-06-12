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
if(str(player) in ["medic_1","medic_2","medic_3","medic_4"]) then {
if(!((__GETC__(life_medicLevel)) == 1 ||(__GETC__(life_medicLevel)) == 3)) exitWith {
	["Du bist kein Notarzt",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
    };

[] spawn
{
while {true} do
{
waitUntil {uniform player == "U_I_CombatUniform"};
player setObjectTextureGlobal [0,"textures\saniuniform.jpg"];
waitUntil {uniform player != "U_I_CombatUniform"};
};
};
};

if(str(player) in ["adac_1","adac_2"]) then {

if(!((__GETC__(life_medicLevel)) == 2 ||(__GETC__(life_medicLevel)) == 3)) exitWith {
	["Du bist kein Adac",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
    };
[] spawn
{
while {true} do
{
waitUntil {uniform player == "U_I_CombatUniform"};
player setObjectTextureGlobal [0,"textures\ADAC.jpg"];
waitUntil {uniform player != "U_I_CombatUniform"};
};
};
};

[] call life_fnc_medicLoadout;
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.