/*
	File: fn_checkSide.sqf
	Author: ishi
	
	Description:
	Checks if player was logged in as a cop before
*/
private["_uid","_plr","_side","_index"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_plr = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_side = civilian;

_index = [_uid, life_side_players] call TON_fnc_index;
if (_index != -1) then { _side = (life_side_players select _index) select 1; };

[_side,"SOCK_fnc_checkSideReceived",_plr,false] spawn life_fnc_MP;
//diag_log format["SideCheck - checkSide UID:%1 Side:%2",_uid,_side];
//diag_log format["SideCheck - life_side_players: %1",str(life_side_players)];