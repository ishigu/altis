#include <macro.h>
/*
	File: fn_adminSpectate.sqf
	Author: ColinM9991
	
	Description:
	Spectate the chosen player.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
life_spectate_vehicle = vehicle _unit;
life_spectate_vehAttach = false;
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};
life_spectate_pos = getPos player;

_handle = [] spawn life_fnc_adminInvisible;
waitUntil {scriptDone _handle};

player attachTo [_unit,[0,-2,0.8]];
if(life_spectate_vehicle != _unit) then {
	player disableCollisionWith life_spectate_vehicle;
	life_spectate_vehAttach = true;
};
_unit switchCamera "INTERNAL";
hint format["You are now spectating %1 \n\n Press F10 to stop Spectating.",_unit getVariable["realname",name _unit]];

AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","
if((_this select 1) == 68) then 
{
	[] spawn {
		(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];
		detach player;
		player setPos life_spectate_pos;
		waitUntil{((player distance life_spectate_pos) < 1)};
		life_spectate_pos =nil;
		_handle = [] spawn life_fnc_adminInvisible;
		waitUntil {scriptDone _handle};
		if(life_spectate_vehAttach) then { player enableCollisionWith life_spectate_vehicle};
		life_spectate_vehAttach = nil;
		life_spectate_vehicle = nil;
		player switchCamera 'INTERNAL';
		hint 'You have stopped spectating';
	};
};false"];