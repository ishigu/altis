#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout"];
if((lbCurSel 2401) == -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_restriction = 0;
switch (_type) do {
	case "radartrap": { _restriction = 2;};
	default {};
};
////Marktsystem Anfang////
_marketprice = [_type] call life_fnc_marketGetBuyPrice;
if(__GETC__(life_coplevel) < _restriction) exitWith {hint "Du hast nicht den benötigten Rang!";};
if((_type == "ghilliepack") && ( !(license_cop_sniper)) ) exitWith {hint "Du hast nicht die benötigte Ausbildung!"};
if((_type == "dogfood") && ( !(license_cop_dea)) ) exitWith {hint "Du bist kein DEA Mitglied!"};


//Check if item is limited
_limit = -1;
{
		if(_type in (_x select 0)) exitWith {_limit = _forEachIndex;};
}forEach __GETC__(life_limited_items);

_value = -1;
if(_limit != -1) then
	{
		_value = 0;
		{_value = _value + (missionNamespace getVariable ( [_x,0] call life_fnc_varHandle ));} forEach ((__GETC__(life_limited_items) select _limit) select 0);
		_limit = (__GETC__(life_limited_items) select _limit) select 1;
	};
if ( (_limit != -1) && ((_value+parseNumber(_amount)) > _limit) ) exitWith {
		hint format [localize "STR_Shop_Virt_AmountRestr",_limit,( [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr )];
	};

	
	
if(_marketprice != -1) then
{
	_price = _marketprice;
};
		////Marktsystem Ende////
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > life_cash && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};

_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if(_marketprice != -1) then 
	{ 
		//##94
		[_type, _amount] spawn
		{
			sleep 120;
			[_this select 0,_this select 1] call life_fnc_marketBuy;
		};			
	};

	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[life_cash] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format[localize "STR_Shop_Virt_BoughtGang",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
		} else {
			if((_price * _amount) > life_cash) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint localize "STR_NOTF_NotEnoughMoney";};
			hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			__SUB__(life_cash,_price);
			playSound "cashregister";
		};
	} else {
		if((_price * _amount) > life_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"; [false,_type,_amount] call life_fnc_handleInv;};
		hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
		__SUB__(life_cash,(_price * _amount));
		playSound "cashregister";
	};
	[] call life_fnc_virt_update;
};

[0] call SOCK_fnc_updatePartial;