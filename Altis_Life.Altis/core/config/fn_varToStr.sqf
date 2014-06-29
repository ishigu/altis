/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {"Rohoel"};
	case "life_inv_oilp": {"Oel"};
	case "life_inv_heroinu": {"rohes Heroin"};
	case "life_inv_heroinp": {"Heroin"};
	case "life_inv_cannabis": {"Cannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_apple": {"Apfel"};
	case "life_inv_rabbit": {"Doener"};
	case "life_inv_salema": {"Goldstriemenfleisch"};
	case "life_inv_ornate": {"Schmucksalmlerfleisch"};
	case "life_inv_mackerel": {"Makrelenfleisch"};
	case "life_inv_tuna": {"Thunfisch"};
	case "life_inv_mullet": {"Rotbarbenfleisch"};
	case "life_inv_catshark": {"Katzenhaifleisch"};
	case "life_inv_turtle": {"Schildkroetenfleisch"};
	case "life_inv_fishingpoles": {"Angel"};
	case "life_inv_water": {"Wasserflasche"};
	case "life_inv_coffee": {"Kaffee"};
	case "life_inv_beer": {"Bier"};
	case "life_inv_blackbeer": {"Schwarzbier"};
	case "life_inv_vodca": {"Wodka"};
	case "life_inv_wine": {"Wein"};
	case "life_inv_sekt": {"Sekt"};
	case "life_inv_turtlesoup": {"Schildkroetensuppe"};
	case "life_inv_donuts": {"Donuts"};
	case "life_inv_fuelE": {"Leerer Benzinkanister"};
	case "life_inv_fuelF": {"Voller Benzinkanister"};
	case "life_inv_pickaxe": {"Spitzhacke"};
	case "life_inv_copperore": {"Kupfererz"};
	case "life_inv_ironore": {"Eisenerz"};
	case "life_inv_ironr": {"Eisenbarren"};
	case "life_inv_copperr": {"Kupferbarren"};
	case "life_inv_sand": {"Sand"};
	case "life_inv_salt": {"Rohsalz"};
	case "life_inv_saltr": {"Salz"};
	case "life_inv_glass": {"Glas"};
	case "life_inv_diamond": {"Rohdiamant"};
	case "life_inv_diamondr": {"Geschliffener Diamant"};
	case "life_inv_tbacon": {"Taktischer Speck"};
	case "life_inv_redgull": {"Energy Drink"};
	case "life_inv_lockpick": {"Dietrich"};
	case "life_inv_peach": {"Pfirsich"};
	case "life_inv_coke": {"Kokablaetter"};
	case "life_inv_cokep": {"Kokain"};
	case "life_inv_spikeStrip": {"Nagelband"};
	case "life_inv_rock": {"Stein"};
	case "life_inv_cement": {"Zement"};
	case "life_inv_goldbar": {"Goldbarren"};
	case "life_inv_chemical": {"Chemikalien"};
	case "life_inv_benzin": {"Benzin"};
	case "life_inv_medical": {"Medikamente"};
	case "life_inv_meth": {"Meth"};
	case "life_inv_defib":{"Defibrillator"};
	
	//License Block
	case "license_civ_driver": {"Fuehrerschein"};
	case "license_civ_air": {"Pilotenschein"};
	case "license_civ_heroin": {"Heroinzubereitung"};
	case "license_civ_gang": {"Gruppenlizenz"};
	case "license_civ_oil": {"Oellizenz"};
	case "license_civ_dive": {"Taucherschein"};
	case "license_civ_boat": {"Bootsschein"};
	case "license_civ_gun": {"Waffenlizenz"};
	case "license_cop_air": {"Pilotenschein"};
	case "license_cop_swat": {"Spezialausbildung"};
	case "license_cop_cg": {"Kuestenwache"};
	case "license_civ_rebel": {"Rebellenausbildung"};
	case "license_civ_truck": {"LKW Fuehrerschein"};
	case "license_civ_diamond": {"Diamantenverarbeitung"};
	case "license_civ_copper": {"Kupferverarbeitung"};
	case "license_civ_iron": {"Eisenverarbeitung"};
	case "license_civ_sand": {"Sandverarbeitung"};
	case "license_civ_salt": {"Salzverarbeitung"};
	case "license_civ_coke": {"Kokainverarbeitung"};
	case "license_civ_marijuana": {"Marijuanaverarbeitung"};
	case "license_civ_cement": {"Zementmischlizenz"};
	case "license_civ_chemical": {"Chemikalienlizenz"};
	case "license_civ_benzin": {"Benzinlizenz"};
	case "license_civ_medical": {"Medizinlizenz"};
	case "license_civ_meth": {"Methlizenz"};
	case "license_civ_dangerousgoods": {"Gefahrengutlizenz"};
	case "license_med_air": {"Pilotenlizenz Sani"};
	case "license_med_car": {"Fuehrerschein Sani"};
	case "license_civ_lawyer": {"Anwaltslizenz"};

};
