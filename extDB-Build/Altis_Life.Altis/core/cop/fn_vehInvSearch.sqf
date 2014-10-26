#include <macro.h>
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value","_trunk","_weight"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle"))) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if(count _vehicleInfo == 0) exitWith {hint localize "STR_Cop_VehEmpty"};
_trunk = [];
_weight = 0;
_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_index = [_var,life_illegal_items] call TON_fnc_index;
	if(_index != -1) then
	{
		_vIndex = [_var,__GETC__(sell_array)] call TON_fnc_index;
		if(_vIndex != -1) then
		{
			_value = _value + (_val * ((__GETC__(sell_array) select _vIndex) select 1));
		};
	} else {
		_trunk set[count _trunk,[_var,_val]];
		_weight = _weight + (([_var] call life_fnc_itemWeight) * _val);
	};
} foreach (_vehicleInfo select 0);

if(_value > 0) then
{
	[[0,"STR_NOTF_VehContraband",true,[[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	life_atmcash = life_atmcash + _value;
	//_vehicle setVariable["Trunk",[],true];
	_vehicle setVariable["Trunk",[_trunk,_weight],true];
	[[getPlayerUID player,playerSide,life_atmcash,1],"DB_fnc_updatePartial",false,false] spawn life_fnc_MP;
}
	else
{
	hint localize "STR_Cop_NoIllegalVeh";
};