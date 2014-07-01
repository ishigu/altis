/*
	Checks if the player is an ADAC
*/
private ["_player","_return"];
_player = _this;

_return = false;
if(str(_player) in life_adac_slots) then { _return = true; };

_return