/*
	File: fn_upgradeTools.sqf
	Author: Shentoza
	
	Description: Upgrades one of your tools
*/
_tool = [_this,3,"",[""]] call BIS_fnc_param;
if(_tool == "") exitWith {};
_cost = 0;
_oldTool = "";
_newTool = "";
_message = "";

switch (true) do
{
	case (_tool == "oildrill"): 
	{
		if(life_inv_oildrill > 0) then 
		{
			_cost = 450000;
			_oldTool = "life_inv_oildrill";
			_newTool = "life_inv_oildrill1";
		};
		
		//if(life_inv_oildrill1 > 0) then {
	};
	case(_tool == "shredder"):
	{
		if(life_inv_shredder > 0) then
		{
			_cost = 540000;
			_oldTool = "life_inv_shredder";
			_newTool = "life_inv_shredder1";
		};
	};
	default {_cost = -1;};
};
if(_cost == -1) exitWith {};
_action = [
				format[localize "STR_NOTF_UpgradeText",_cost],
				"Werkzeug Upgrade",
				localize "STR_Global_Yes",
				localize "STR_Global_No"
			] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_cash < _cost && life_atmcash < _cost) exitWith {hint localize "STR_NOTF_NotEnoughMoney";};
	if(life_cash >= _cost) then 
	{
		life_cash = life_cash - _cost;
		[] call SOCK_fnc_updateRequest; //Silent Sync
	}else { 
		if (life_atmcash >= _cost) then 
		{
			life_atmcash = life_atmcash - _cost;
			[] call SOCK_fnc_updateRequest; //Silent Sync
		};
	};
	missionNamespace setVariable [_oldTool,0];
	missionNamespace setVariable [_newTool,1];
	playSound "cashregister";
	closeDialog 0;
				
} else {
	hint localize "STR_NOTF_ActionCancel";
	closeDialog 0;
};