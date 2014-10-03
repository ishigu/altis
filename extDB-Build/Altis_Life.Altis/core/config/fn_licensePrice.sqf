/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {1000}; //Drivers License cost
	case "boat": {30000}; //Boating license cost
	case "pilot": {40000}; //Pilot/air license cost
	case "gun": {25000}; //Firearm/gun license cost
	case "dive": {7500}; //Diving license cost
	case "oil": {40000}; //Oil processing license cost
	case "cair": {10000}; //Cop Pilot License cost
	case "swat": {20000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {75000}; //Heroin processing license cost
	case "marijuana": {50000}; //Marijuana processing license cost
	case "medmarijuana": {5000}; //Medical Marijuana processing license cost
	case "gang": {5000}; //Gang license cost
	case "rebel": {75000}; //Rebel license cost
	case "truck": {35000}; //Truck license cost
	case "diamond": {50000};
	case "salt": {25000};
	case "cocaine": {90000};
	case "sand": {20000};
	case "iron": {25000};
	case "copper": {5000};
	case "cement": {50000};
	case "chemical": {20000};
	case "benzin": {40000};
	case "medical": {30000};
	case "meth": {100000};
	case "dangerousgoods": {5000};
	case "mair": {15000};
	case "home": {75000};
	case "clawyer":{150000};
	case "sniper":{0};
	case "dea":{0};
};