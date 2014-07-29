/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Du musst etwas auswahlen.";};
if(!([_value] call fnc_isnumber)) exitWith {hint "Ungueltiges Zeichen."};
if(parseNumber(_value) <= 0) exitWith {hint "Ungueltige Menge."};
_ind = [_data,life_illegal_items] call fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["Polizei ist in der Naehe, du kannst jetzt nichts wegwerfen","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Du kannst nicht wegwerfen waerend du im Fahrzeug sitzt.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Du hast nicht genug von diesem Item."};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Du hast %1 %2 aus deinem Inventar geloescht.",(parseNumber _value), _type];
	
[] call life_fnc_p_updateMenu;