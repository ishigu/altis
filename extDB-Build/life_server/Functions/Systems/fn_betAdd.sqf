/*
File: 	fn_betAdd.sqf
Author: Shentoza
Description: Adds an player to the betting array.
*/
_number = [_this,0,-1,[0]] call BIS_fnc_param;
_player = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(_number == -1 || isNull _player) exitWith {};
if(life_bet_done) then {
	[[{
		hint "Du kannst kein neues Ticket kaufen, da die letzte Runde Lotto für ""heute"" gespielt wurde!";
		life_atmcash = life_atmcash + 50000;
		[] call SOCK_fnc_updateRequest;
		life_bet_done = true;
	}], "BIS_fnc_spawn", _player, false] spawn life_fnc_MP;
};

_player = getPlayerUID _player;

if(_number == life_bet_number) then {
life_bet_players set[count life_bet_players,_player];
};

life_bet_funds = life_bet_funds + 45000;