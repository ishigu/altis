/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(life_cash < 50) exitWith {hint "Du benoetigt $50 um dich Verartzen zu lassen."};
titleText["Doktor Alan heilt dich... Hab keine Angst...","PLAIN"];
sleep 2;
titleText["Ups, da habe ich die Nadel wohl ins falsche Loch gesteckt...","PLAIN"];
sleep 5;
if(player distance (_this select 0) > 5) exitWith {titleText["Du musst in der Naehe des Doktors bleiben, um geheilt zu werden.","PLAIN"]};
titleText["Du bist jetzt voellig genesen!","PLAIN"];
player setdamage 0;
life_cash = life_cash - 50;