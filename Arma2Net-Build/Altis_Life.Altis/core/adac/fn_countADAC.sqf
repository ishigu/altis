/*
	Counts the active ADACs.
	Author: Westerland Altis Life
*/
_return = 0;
{
	if(_x call life_fnc_isADAC)then 
		{_return = _return+1;}
} forEach playableUnits;  

_return