#include <macro.h>
/*
	File: fn_adminKey.sqf
	Author: Shentoza
	
	Description:
	Gives a copy of the key for the selected vehicle you.
*/
private["_vehicle"];
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
_vehicle = cursorTarget;
if(isNull _vehicle) then {_vehicle = (position player) nearEntities [["Air", "Car", "Ship"], 5] select 0;};
if(isNull _vehicle) exitWith{ hint "Kein Fahrzeug ausgewählt!";};

_uid = getPlayerUID player;
_owners = _vehicle getVariable "vehicle_info_owners";
_index = [_uid,_owners] call TON_fnc_index;
if(_index != -1) exitWith {hint "Du besitzt den Schlüssel bereits.";};
if(_index == -1) then 
{
	_owners set[count _owners,[_uid,player getVariable["realname",name player]]];
	_vehicle setVariable["vehicle_info_owners",_owners,true];
	life_vehicles set[count life_vehicles, _vehicle];
};

hint format["Du hast die Schlüssel zu dem %1 erhalten.",typeOf _vehicle];
