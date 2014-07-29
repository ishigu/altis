/*
	File: fn_distressRemove.sqf
	
	
	Description:
	Deletes a distress
	distress array = [index,unit,distpos,msg]
*/
private["_index"];
if(isServer) exitWith{};
if(!(player call life_fnc_isADAC)) exitWith{};
if(count life_adac_distress < 1) exitWith{};
_index = _this select 0;
if(_index == -1) exitWith{};
life_adac_distress set [ _index, -1];
life_adac_distress = life_adac_distress - [-1];
lbSetCurSel[13102, _index-1];
[] call life_fnc_distressMenu;


