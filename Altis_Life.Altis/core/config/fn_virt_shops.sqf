/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Markt",["beer","blackbeer","vodca","wine","sekt","water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach"]]};
	case "wongs": {["Wong's Essen auf Raedern",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Kaffee",["coffee","donuts"]]};
	case "heroin": {["Drogendealer",["cocainep","heroinp","marijuana","meth"]]};
	case "oil": {["Oelhaendler",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Altis Fisch Markt",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glashaendler",["glass"]]};
	case "iron": {["Altis Industriehaendler",["iron_r","copper_r"]]};
	case "diamond": {["Diamantenhaendler",["diamond","diamondc"]]};
	case "salt": {["Salzhaendler",["salt_r"]]};
	case "cop": {["Polizeikantine",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","barrier","radartrap"]]};
	case "cement": {["Zementhaendler",["cement"]]};
	case "benzin": {["Benzinhaendler",["benzin"]]};
	case "medical": {["Medikamentenhaendler",["medical"]]};
	case "medic": {["Notarztitems",["water","tbacon","defib","pylon"]]};
	case "adac": {["ADAC Shop",["water","tbacon","fuelF","paint","pylon","barrier"]]};
};