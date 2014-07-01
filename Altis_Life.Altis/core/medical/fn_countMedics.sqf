/*
   counts how many medics are online
*/
_return = 0;
{
	if(_x call life_fnc_isMedic)then 
		{_return = _return+1;}
} forEach playableUnits;  

_return