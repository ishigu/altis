/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
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
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "blastingcharge"): {
		if(vehicle player != player) exitWith{hint localize "STR_NOTF_InsideVehicle";};
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
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
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(vehicle player != player) exitWith{hint localize "STR_NOTF_InsideVehicle";};
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "pylon"):
	{
		if(vehicle player != player) exitWith{hint localize "STR_NOTF_InsideVehicle";};
		if(!isNull life_pylon) exitWith {hint "Du stellst schon einen Pylon auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_pylon;
		};
	};
	
	case (_item == "barrier"):
	{
		if(vehicle player != player) exitWith{hint localize "STR_NOTF_InsideVehicle";};
		if(!isNull life_barrier) exitWith {hint "Du stellst schon eine Straßensperre auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_barrier;
		};
	};
	
	case (_item == "radartrap"):
	{
		if(vehicle player != player) exitWith{hint localize "STR_NOTF_InsideVehicle";};
		if(!isNull life_pylon) exitWith {hint "Du stellst schon einen Blitzer auf!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_radartrap;
		};
	};
	
	case (_item == "ghilliepack"):
	{
		if(uniform player == "U_B_GhillieSuit") then {
			[false,""] spawn life_fnc_ghilliepack;
		}
		else {
			[true,""] spawn life_fnc_ghilliepack;
		};	
	};
	
	case (_item == "dogfood"):
	{
		if ((player getVariable["action", "false"]) == "false") then {
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				[player] spawn life_fnc_dogInit;
			};
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
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
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
	
	case (_item == "radarreader"):
	{
		[] spawn life_fnc_radarReader;
	};
	case (_item == "oildrill"):
	{
		if(vehicle player != player) exitWith{hint localize "STR_NOTF_InsideVehicle";};
		if(!isNull life_oildrill) exitWith {hint "Du stellst schon einen Bohrturm auf!";};
		if(! (playerSide in [civilian,east]) ) exitWith {hint "Du darfst das nicht benutzen!"};
		if( (player distance (getMarkerPos "oil_1") > 40) && (player distance getMarkerPos "oil_2" > 40) ) exitWith {hint localize "STR_NOTF_notNearResource";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[0] spawn life_fnc_oildrill;
		};
	};
	case (_item == "oildrill1"):
	{
		if(vehicle player != player) exitWith{hint localize "STR_NOTF_InsideVehicle";};
		if(!isNull life_oildrill) exitWith {hint "Du stellst schon einen Bohrturm auf!"};
		if(! (playerSide in [civilian,east]) ) exitWith {hint "Du darfst das nicht benutzen!"};
		if( (player distance (getMarkerPos "oil_1") > 40) && (player distance getMarkerPos "oil_2" > 40) ) exitWith {hint localize "STR_NOTF_notNearResource";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[1] spawn life_fnc_oildrill;
		};
	};
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;