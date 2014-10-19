#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
life_cash = parseNumber (_this select 2);
life_atmcash = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));
player setVariable["aliases",(_this select 6),TRUE];
player setVariable["dbName",(_this select 1),TRUE];

//Loop through licenses
if(count (_this select 7) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 7);
};

life_gear = _this select 9;
[] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel, parseNumber(_this select 8));
		__CONST__(life_medicLevel,0);
		__CONST__(life_rebellevel,0);
		life_blacklisted = _this select 10;
		life_lastspawn = _this select 11;
	};
	
	case civilian: {
		life_is_arrested = _this select 8;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		__CONST__(life_rebellevel,0);
		life_houses = _this select 11;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles set[count life_vehicles,_house];
		} foreach life_houses;
		
		life_gangData = _This select 12;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
		
		life_lastspawn = _this select 10;
	};
	
	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 8));
		__CONST__(life_copLevel,0);
		__CONST__(life_rebellevel,0);
	};
	
	case east: {
		__CONST__(life_rebellevel,parseNumber(_this select 10));
		__CONST__(life_copLevel,0);
		__CONST__(life_medicLevel,0);
		life_houses = _this select 12;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles set[count life_vehicles,_house];
		} foreach life_houses;
		
		life_gangData = _This select 13;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
		
		life_lastspawn = _this select 11;
	};
};

switch(__GETC__(life_donator)) do
{
	case 1: {life_paycheck = life_paycheck + 1250;};
	case 2: {life_paycheck = life_paycheck + 2000;};
	case 3: {life_paycheck = life_paycheck + 2500;};
	case 4: {life_paycheck = life_paycheck + 2500;};
	case 5: {life_paycheck = life_paycheck + 2500;};
};

life_session_completed = true;
[[getPlayerUID player,playerSide],"TON_fnc_addSideCheck",false,false] call life_fnc_MP;