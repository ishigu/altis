/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint "Die gewaehlte Person ist nil"};
if(isNull life_ticket_unit) exitWith {hint "Die Person existiert nicht."};
if(!(life_ticket_unit getVariable["restrained",false])) exitWith {hint "Die Person ist nicht festgenommen."};
_val = ctrlText 2652;
if(!([_val] call fnc_isnumber)) exitWith {hint "Keine Zahl eingegeben."};
if((parseNumber _val) > 100000) exitWith {hint "Tickets können maximal ueber $100.000 ausgestellt werden!"};
[[0,format["%1 hat ein Ticket in Hoehe von $%2 an %3 ausgestellt.",name player,[(parseNumber _val)] call life_fnc_numberText,name life_ticket_unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[player,(parseNumber _val)],"life_fnc_ticketPrompt",life_ticket_unit,false] spawn life_fnc_MP;
closeDialog 0;