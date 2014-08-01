/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText["Du musst etwas auswaehlen.","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > life_cash) exitWith {titleText["Du hast nicht genug Geld.","PLAIN"];[player, uniform player] call life_fnc_setUniform;};
life_cash = life_cash - _price;
playSound "cashregister";

life_clothesPurchased = true;
[player, uniform player] call life_fnc_setUniform;
closeDialog 0;