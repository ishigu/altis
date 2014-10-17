#include <macro.h>
/*
	File: fn_checkSideReceived.sqf
	Author: ishi
	
	Description:
	Received sideCheck result from server
*/

if (playerSide != _this && __GETC__(life_adminlevel) < 3) then {
	if (playerSide == west && _this == east) then {
		["RebelCop",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
	};
	if (playerSide == east && _this == west) then {
		["CopRebel",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
	};
};