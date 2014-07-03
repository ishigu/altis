/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint "Du musst etwas auswahlen!";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "sekt" or _item == "wine" or _item == "vodca" or _item == "blackbeer" or _item == "beer"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 1;
			titleText["Du hast getrunken und fühlst dich nicht so gut.","PLAIN"];
		};
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText["Ich fuehle mich gut","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint "Du hast bereits ein Nagelband ausgelegt"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "pylon"):
	{
		if(!isNull life_pylon) exitWith {hint "Du stellst schon einen Pylon auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_pylon;
		};
	};
	
	case (_item == "barrier"):
	{
		if(!isNull life_barrier) exitWith {hint "Du stellst schon eine Straßensperre auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_barrier;
		};
	};
	
	case (_item == "heroinp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn fnc_drug_use;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "Du kannst das Fahrzeug nicht von innen betanken!"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_weed;
		};
	};
	
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};
	
	case "fishing":
	{
		[] spawn fnc_fishing;
	};
	
	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	
	default
	{
		hint "Dieser Gegenstand kann nicht verwendet werden.";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;