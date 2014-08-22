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
	case "market": {["Altis Market",["beer","blackbeer","vodca","wine","sekt","water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Wong's Essen auf Raedern",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Kaffee",["coffee","donuts"]]};
	case "heroin": {["Drogendealer",["cocainep","heroinp","marijuana","meth"]]};
	case "oil": {["Oelhaendler",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Altis Fisch Markt",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glashaendler",["glass"]]};
	case "iron": {["Altis Industriehaendler",["iron_r","copper_r"]]};
	case "diamond": {["Diamantenhaendler",["diamond","diamondc"]]};
	case "salt": {["Salzhaendler",["salt_r"]]};
	case "cop": {["Polizeibedarf",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","barrier","pylon","radartrap","ghilliepack","defusekit"]]};
	case "cement": {["Zementhaendler",["cement"]]};
	case "gold": {["Gold Buyer",["goldbar"]]};
	case "benzin": {["Benzinhaendler",["benzin"]]};
	case "medical": {["Medikamentenhaendler",["medical"]]};
	case "medic": {["Notarztitems",["water","tbacon","defib","pylon"]]};
	case "adac": {["ADAC Shop",["water","tbacon","fuelF","paint","pylon","barrier"]]};
};