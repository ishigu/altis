/* Puts on a ghilliesuit out of virtual inventory, and saves the current inventory
Author: Shentoza for Westerland

*/
private["_inventory","_mode"];
if(playerSide != west) exitWith {hint "Du bist kein Polizist!";};
_mode = _this select 0;
_inventory = uniformItems player;
if(_mode) then 
{
	life_cop_olduniform = uniform player;
	player addUniform "U_B_GhillieSuit";
	{
		player addItem _x;
	} forEach _inventory;
	hint "Du hast einen Ghillieanzug angezogen!";
	waitUntil { ((uniform player != "U_B_GhillieSuit") || (life_inv_ghilliepack == 0))};
	if(life_inv_ghilliepack == 0) exitWith{ hint "Du hast deinen Ghillie verloren!"; [false,"lost"] spawn life_fnc_ghilliepack;};
};
if(!(_mode)) then
{
	player addUniform life_cop_olduniform;
	{
		player addItem _x;
	} forEach _inventory;
	life_cop_olduniform = "";
	if( _this select 1 != "lost") then {
	hint "Du hast einen Ghillieanzug ausgezogen!";
	};
};