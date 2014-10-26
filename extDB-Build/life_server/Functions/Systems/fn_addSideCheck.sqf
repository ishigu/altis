/*
	File: fn_addSideCheck.sqf
	Author: ishi
	
	Description:
	Adds player to the side array if he isn't already
*/
private["_uid","_plr","_side","_index"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;

if (!(_side in [east,west])) exitWith{};

_index = [_uid, life_side_players] call TON_fnc_index;
if (_index == -1) then { life_side_players pushBack [_uid, _side]; };

//diag_log format["SideCheck - addSideCheck UID:%1 Side:%2",_uid,_side];
//diag_log format["SideCheck - life_side_players: %1",str(life_side_players)];