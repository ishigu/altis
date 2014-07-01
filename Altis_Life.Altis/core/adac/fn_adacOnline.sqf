/*
	Checks if AADACs are online
	Author: Westerland Altis Life
*/
private ["_return"];
_return = false;
if(((!isNil "adac_1") && (alive adac_1)) || ((!isNil "adac_2") && (alive adac_2)) || ((!isNil "adac_3") && (alive adac_3)) || ((!isNil "adac_3") || (alive adac_3)) || ((!isNil "adac_4") || (alive adac_4)))
then { _return = true;};

_return