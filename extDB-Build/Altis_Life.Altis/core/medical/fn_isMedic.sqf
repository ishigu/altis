/*
	Checks if the player is a medic
*/
private ["_player","_return"];
_player = _this;

_return = false;
if(str(_player) in life_medic_slots) then { _return = true; };

_return