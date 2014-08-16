/*
 Returns the role of the player.
 needed: 
	life_fnc_isMedic
	life_fnc_isADAC
	East as rebels
 Author: Shentoza
*/
private["_return"];
_unit = _this;

switch(playerSide) do
{
	case civilian: {_return = "civ"};
	case west: {_return = "cop"};
	case independent: {
		_return = "adac";
		if(player call life_fnc_isMedic) then {_return = "med"};
	};
	case east: {_return = "reb"};
};
_return 