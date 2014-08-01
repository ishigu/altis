#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_restriction"];
if((lbCurSel 2401) == -1) exitWith {hint "Du musst etwas Auswaehlem zum Kaufen."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
_restriction = 0;
switch (_type) do {
	case "radartrap": { _restriction = 2;};
	default {};
};
////Marktsystem Anfang////
_marketprice = [_type] call life_fnc_marketGetBuyPrice;
if(__GETC__(life_coplevel) < _restriction) exitWith {hint "Du hast nicht den benötigten Rang!";};
if((_type == "ghilliepack") && ( !(license_cop_sniper)) ) exitWith {hint "Du hast nicht die benötigte Ausbildung!"};

if(_marketprice != -1) then
{
	_price = _marketprice;
};
		////Marktsystem Ende////
if(!([_amount] call fnc_isnumber)) exitWith {hint "Du hast keine zugelassene Menge angegeben";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "Du hast nicht genug Platz im Inventar!"};
_amount = _diff;
if((_price * _amount) > life_cash) exitWith {hint "Du hast nicht genug Geld!"};

_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	hint format["Du hast %1 %2 fuer $%3 gekauft",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
	life_cash = life_cash - (_price * _amount);
	playSound "cashregister";
	if(_marketprice != -1) then 
		{ 
			//##94
			[_type, _amount] spawn
			{
				sleep 120;
				[_this select 0,_this select 1] call life_fnc_marketBuy;
			};			
		};
	[] call life_fnc_virt_update;
};
