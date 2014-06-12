#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in ["cop_1","cop_2","cop_3","cop_4"])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["Du bist kein Polizist",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] execVM "welcome.sqf";

[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_Rangemaster"};//Rekrut Uniform
        player setObjectTextureGlobal [0,"textures\uniform\police_shirt.paa"];
        waitUntil {uniform player != "U_Rangemaster"};
    };
};

[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "V_TacVest_blk"};//Polizei Weste
        player setObjectTextureGlobal [0,"textures\uniform\police_vest.paa"];
        waitUntil {uniform player != "V_TacVest_blk"};
    };
};

[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_B_CombatUniform_mcam"};//GSG9 Uniform
        player setObjectTextureGlobal [0,"textures\uniform\swat_shirt.paa"];
        waitUntil {uniform player != "U_B_CombatUniform_mcam"};
    };
};

[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "H_HelmetB_plain_mcamo"}; //GSG9 Helm
        player setObjectTextureGlobal [0,"textures\uniform\swat_helmet.paa"];
        waitUntil {uniform player != "H_HelmetB_plain_mcamo"};
    };
};

[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "V_PlateCarrier1_blk"}; //GSG9 Weste
        player setObjectTextureGlobal [0,"textures\uniform\swat_s_vest.paa"];
        waitUntil {uniform player != "V_PlateCarrier1_blk"};
    };
};

[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "H_Cap_tan_specops_US"}; //Polizei Muetze
        player setObjectTextureGlobal [0,"textures\uniform\swat_s_cap.paa"];
        waitUntil {uniform player != "H_Cap_tan_specops_US"};
    };
};