#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Withdraws money from the players gang bank.
*/
private["_value","_gangbank","_ownerID"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
_ownerID = grpPlayer getVariable["gang_owner",""];
if(_ownerID != steamid) exitWith {hint localize "STR_ATM_WithdrawGangNotLeader"};
_gangbank = grpPlayer getVariable ["gang_bank", 0];
if(_value > _gangbank) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

_gangbank = _gangbank - _value;
grpPlayer setVariable ["gang_bank",_gangbank,true];
life_atmcash = life_atmcash + _value;

hint format[localize "STR_ATM_WithdrawGang",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest; //Silent Sync
[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
