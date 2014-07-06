/*
	File: fn_distressAdd.sqf
	
	Description:
	Adds or updates a unit to the ADAC distress list.
	distress array = [index,unit,distpos,msg]
*/
private["_unit","_index","_distpos","_msg","_array"];
if(isServer) exitWith{};
if(!(player call life_fnc_isADAC)) exitWith{};
if(isNil "_this") exitWith{};
_array = [];
_unit = _this select 0;
_distpos = _this select 1;
_msg = _this select 2;
_index = 0;
_alreadyIn = false;
if(count life_adac_distress > 0) then
{
	{
		if(_x select 1 == _unit) exitWith{};
			_index = _index+1;
	} forEach life_adac_distress;

};
_array = [_index,_unit,_distpos,_msg];
life_adac_distress set [_index,_array]; //insert new array, or update the existing one