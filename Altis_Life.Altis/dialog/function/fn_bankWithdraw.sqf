/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint "You can't withdraw more then $999,999";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint "Bitte nur Zahlen eingeben."};
if(_val > life_atmcash) exitWith {hint "Du hast nicht soviel Geld!"};
if(_val < 100 && life_atmcash > 20000000) exitWith {hint "Du kannst nicht weniger als 100 einzahlen"}; //Temp fix for something.

life_cash = life_cash + _val;
life_atmcash = life_atmcash - _val;
hint format ["Du hast $%1 abgehoben",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest; //Silent Sync