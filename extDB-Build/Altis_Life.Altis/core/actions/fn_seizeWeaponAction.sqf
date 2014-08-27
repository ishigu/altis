/*
	File: fn_seizeWeaponAction.sqf
	Author: ishi
	
	Description:
	Removes the weapons (client)
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Remove weapons and save to DB
removeAllWeapons player;
[] call life_fnc_saveGear;
[] call life_fnc_loadGear;

titleText[format[localize "STR_NOTF_WeaponsSeized_Victim", _unit getVariable["realname",name _unit]],"PLAIN"];
[] call SOCK_fnc_updateRequest;