/*
	File: fn_seizeWeapon.sqf
	Author: ishi
	
	Description:
	Strip the current cursorTarget of all his weapons
*/
private["_unit"];
_unit = cursorTarget;

[[player],"life_fnc_seizeWeaponAction",_unit,false] spawn life_fnc_MP;
[[0,format[localize "STR_NOTF_WeaponsSeized_Broadcast", _unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
titleText[format[localize "STR_NOTF_WeaponsSeized_Cop", _unit getVariable["realname",name _unit]],"PLAIN"];