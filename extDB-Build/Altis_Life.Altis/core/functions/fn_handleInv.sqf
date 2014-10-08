#include <macro.h>
/*
	File: fn_handleInv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Do I really need one?
*/
private["_math","_item","_num","_return","_var","_weight","_value","_diff"];
_math = [_this,0,false,[false]] call BIS_fnc_param; //true = add; false = subtract;
_item = [_this,1,"",[""]] call BIS_fnc_param; //The item we are using to add or remove.
_num = [_this,2,0,[0]] call BIS_fnc_param; //Number of items to add or remove.
if(_item == "" OR _num == 0) exitWith {false};

_var = [_item,0] call life_fnc_varHandle;
if(_math) then
{
	_diff = [_item,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	_num = _diff;
	if(_num <= 0) exitWith {false};
};
_weight = ([_item] call life_fnc_itemWeight) * _num;
_value = missionNamespace getVariable _var;

//Check if item is limited, if partially limited, only add the max possible amount
_limit = -1;
if(_math) then 
{
	{
		if( (_item in (_x select 0)) ) exitWith {_limit = _forEachIndex;};
	}forEach __GETC__(life_limited_items);
	
	if(_limit != -1) then
	{
		_value = 0;
		{_value = _value + (missionNamespace getVariable ( [_x,0] call life_fnc_varHandle ))} forEach ((__GETC__(life_limited_items) select _limit) select 0);
		_limit = (__GETC__(life_limited_items) select _limit) select 1;
	};
};
if (_math && _limit != -1 && (_value >= _limit)) exitWith {false};
if (_math && _limit != -1 && ( (_value+_num) > _limit) ) exitWith {_num = _limit - _value;[_math,_item,_num] call life_fnc_handleInv;false};

if(_math) then
{
	//Lets add!
	if((life_carryWeight + _weight) <= life_maxWeight) then
	{
		missionNamespace setVariable[_var,(_value + _num)];
		
		if((missionNamespace getVariable _var) > _value) then
		{
			life_carryWeight = life_carryWeight + _weight;
			_return = true;
		}
			else
		{
			_return = false;
		};
	}
		else
	{
		_return = false;
	};
}
	else
{
	//Lets subtract!
	if((_value - _num) < 0) then
	{
		_return = false;
	}
		else
	{
		missionNamespace setVariable[_var,(_value - _num)];
		
		if((missionNamespace getVariable _var) < _value) then
		{
			life_carryWeight = life_carryWeight - _weight;
			_return = true;
		}
			else
		{
			_return = false;
		};
	};
};

_return;