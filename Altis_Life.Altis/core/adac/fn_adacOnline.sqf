/*
	Checks if AADACs are online
	Author: Westerland Altis Life
*/
private ["_return"];
_return = false;

{
	if(!(isNil (_x))) then { _return = true;};
}forEach life_adac_slots;

_return