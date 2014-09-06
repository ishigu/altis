#include <macro.h>
/*
	Author:Shentoza
	Description: Makes you invisible (hides nametag and leaves group aswell


*/
private ["_current","_oldgroup"];
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
_current = player getVariable ["hideNametag",false];
_oldgroup = player getVariable ["oldGroup",group player];
if(_current) then
{
	[[[player], {_this select 0 hideObjectGlobal false}], "BIS_fnc_spawn", false, false] spawn life_fnc_MP;
	player setVariable ["hideNametag",nil,true];
	player setVariable ["oldGroup",nil];
	[player] joinSilent _oldGroup;
};
if(!_current) then
{
	[[[player], {_this select 0 hideObjectGlobal true}], "BIS_fnc_spawn", false, false] spawn life_fnc_MP;
	player setVariable ["hideNametag",true,true];
	player setVariable ["oldGroup",group player];
	[player] joinSilent grpNull;
};