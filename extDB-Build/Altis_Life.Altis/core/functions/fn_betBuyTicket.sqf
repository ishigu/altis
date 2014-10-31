/*
File: fn_betBuyTicket.sqf
Author: Shentoza
Description: Buys a ticket for the lottery.
*/
_number = parseNumber(_this select 0);
_player = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(_number < 0 || _number > 100) exitWith {hint "Die Zahl muss zwischen 0 und 100 liegen!";};

_action = [
	parseText format["Ein Lotterieticket kostet $200.000.<br/><br/>Hinweis: Wenn Text eingegeben wurde, kann die korrekte Ausfüllung des Tickets nicht garantiert werden!"],
	"Altis Lotterie",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_atmcash < 200000) exitWith {hint localize "STR_NOTF_NotEnoughFunds";}; 
	if (life_atmcash >= 200000) then 
	{
		life_atmcash = life_atmcash - 200000;
		[] call SOCK_fnc_updateRequest; //Silent Sync
	};
	[[_number,player],"TON_fnc_betAdd",false,false] call life_fnc_MP;
	closeDialog 0;
} else {
	hint localize "STR_NOTF_ActionCancel";
	closeDialog 0;
};