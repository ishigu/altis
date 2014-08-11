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

_return = switch(playerSide) do
{
	case civilian: {"civ"};
	case west: {"cop"};
	case independent: {
		if(player call life_fnc_isMedic) then {"med"};
		if(player call life_fnc_isADAC) then {"adac"};
	};
	case east: {"reb"};
};
_return 