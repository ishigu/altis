/*
File: fn_broadcastNews.sqf
Author: Shentoza
*/
private["_value","_action"];
_value = [_this,0,"",[""]] call BIS_fnc_param;
if(_value == "") exitWith {hint "Du musst eine Nachricht eingeben!";};

_action = [
	"Diese Nachricht abzuschicken kostet $100.000",
	"Channel 7 News",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_cash < 100000 && life_atmcash < 100000) exitWith {hint localize "STR_NOTF_NotEnoughMoney";};
	
	if(life_cash >= 100000) then 
	{
		life_cash = life_cash - 100000;
		[] call SOCK_fnc_updateRequest; //Silent Sync
	}
	else 
	{ 
		if (life_atmcash >= 100000) then 
		{
			life_atmcash = life_atmcash - 100000;
			[] call SOCK_fnc_updateRequest; //Silent Sync
		};
	};
	[[player,_value],"life_fnc_broadcastNewsRecieve",true,false] call life_fnc_MP;
	playSound "cashregister";
	closeDialog 0;
} else {
	hint localize "STR_NOTF_ActionCancel";
	closeDialog 0;
};