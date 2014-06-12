/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint "Du musst jemanden auswaehlen um den Betrag zu ueberweisen."};
if(isNil "_unit") exitWith {hint "Dieser Spieler ist nicht Online"};
if(_val > 999999) exitWith {hint "Du kannst nicht mehr als 999,999 Ueberweisen";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint "Bitte nur Zahlen eingeben."};
if(_val > life_atmcash) exitWith {hint "Du hast nicht soviel Geld!"};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > life_atmcash) exitWith {hint format["Du hast nicht genuegend Geld, fuer $%1 du brauchst $%2 als Ueberwesiungsgebuehr.",_val,_tax]};

life_atmcash = life_atmcash - (_val + _tax);

bank_addfunds = _tax;
publicVariableServer "bank_addfunds";
[[_val,name player],"clientWireTransfer",_unit,false] spawn life_fnc_MP;
[] call life_fnc_atmMenu;
hint format["Du hast $%1 fuer %2.\n\nEine Gebuehr von $%3 wurde für die Überweisung genommen.",[_val] call life_fnc_numberText,name _unit,[_tax] call life_fnc_numberText];
[] call SOCK_fnc_updateRequest; //Silent Sync