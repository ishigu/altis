/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {7};
	case "oilp": {5};
	case "heroinu": {5};
	case "heroinp": {4};
	case "cannabis": {4};
	case "marijuana": {3};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {6};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "beer": {1};
	case "sekt": {1};
	case "blackbeer": {1};
	case "vodca": {1};
	case "wine": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {6};
	case "copper_r": {3};
	case "iron_r": {4};
	case "sand": {4};
	case "salt": {4};
	case "salt_r": {2};
	case "glass": {2};
	case "diamond": {5};
	case "diamondc": {2};
	case "cocaine": {6};
	case "cocainep": {4};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "goldbar": {12};
	case "chemical": {5};
	case "benzin": {6};
	case "meth": {2};
	case "medical": {3};
	case "defib":{5};
	case "paint":{4};
	case "pylon":{2};
	case "barrier":{15};
	/*
	case "cocoa": {2};
	case "milk": {2};
	case "chocolate": {1};
	*/
	default {1};
};
