/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Toeten mit Fahrzeug (A)",6500];};
	case "187": {_type = ["Mord (A)",200000];};
	case "901": {_type = ["Gefaengnisausbruch (A)",4500];};
	case "261": {_type = ["Vergewaltigung (A)",5000];};
	case "261A": {_type = ["Versuchte Vergewaltigung (A)",3000];};
	case "215": {_type = ["Versuchter Autodiebstahl (A)",5000];};
	case "213": {_type = ["Illegale Verwendung von Sprengstoff (A)",10000];};
	case "211": {_type = ["Raubueberfall (A)",40000];};
	case "207": {_type = ["Entfuehrung (A)",100000];};
	case "207A": {_type = ["Versuchte Entfuehrung",30000];};
	case "487": {_type = ["Autodiebstahl(A)",20000];};
	case "488": {_type = ["Diebstahl(A)",2000];};
	case "480": {_type = ["Fahrerflucht(A)",5000];};
	case "481": {_type = ["Drogenbesitz(A)",25000];};
	case "482": {_type = ["Versuchter Drogenhandel(A)",25000];};
	case "483": {_type = ["Drogenhandel(A)",50000];};
	case "503": {_type = ["Handel mit exotischen Gütern(A)",25000];};
	case "44B": {_type = ["Innerorts über 50km/h (A)",750];};
	case "45B": {_type = ["Innerorts über 60km/h (A)",1500];};
	case "46B": {_type = ["Innerorts über 85km/h (A)",5000];};
	case "47B": {_type = ["Innerorts über 110km/h (A)",20000];};
	case "48B": {_type = ["Innerorts über 200km/h (A)",50000];};
	case "49B": {_type = ["Außerorts über 130km/h (A)",5000];};
	case "50B": {_type = ["Außerorts über 180km/h (A)",10000];};
	case "51B": {_type = ["Außerorts über 230km/h+ (A)",20000];};
	
    case "1": {_type = ["versuchter Fahrzeugdiebstahl",5000];};
    case "2": {_type = ["Fahrzeugdiebstahl",20000];};
    case "3": {_type = ["Fahrzeugbeschädigung",5000];};
    case "4": {_type = ["Versuchter Raubüberfall",20000];};
    case "5": {_type = ["Raubüberfall",40000];};
    case "6": {_type = ["Mord",200000];};
    case "7": {_type = ["Ausbruch aus dem Gefängnis",0];};
    case "8": {_type = ["Beihilfe beim Gefängisausbruch",25000];};
    case "9": {_type = ["Misslungener Banküberfall",50000];};
    case "10": {_type = ["Geglückter Banküberfall",100000];};
    case "11": {_type = ["Diebstahl aus Rucksack",2000];};
    case "12": {_type = ["Drogenschmuggel/-handel",50000];};
    case "13": {_type = ["Schmuggel mit verbotenen Tieren",50000];};
    case "14": {_type = ["Platzverweis Missachtung",20000];};
    case "15": {_type = ["versuchte Entführung",30000];};
    case "16": {_type = ["Entführung",100000];};
    case "17": {_type = ["Flüchtig",5000];};
    case "18": {_type = ["Betrugsabsichten [Falschinformation]",15000];};
    case "19": {_type = ["Trolling",50000];};
    case "20": {_type = ["Behinderung der Polizei [einmalig]",5000];};
    case "21": {_type = ["Behinderung der Polizei [mehrmals]",10000];};
    case "22": {_type = ["Behinderung der Polizei [weitere Verstöße]",0];};
    case "23": {_type = ["Beamtenbeleidigung [einmaliger Verstoß]",5000];};
    case "24": {_type = ["Beamtenbeleidigung [mehrfach]",7500];};
    case "25": {_type = ["Kriminellenbefreiung [einmaliger Verstoß]",25000];};
    case "26": {_type = ["Kriminellenbefreiung [mehrfach]",25000];};
    case "27": {_type = ["Androhung von Mord",50000];};
    case "28": {_type = ["Durchsuchung poliz. Ausrüstung/Fahrzeuge",5000];};
    case "29": {_type = ["Beamtenbeschuss",50000];};
    case "30": {_type = ["Waffe sichtbar tragen Innerorts",7500];};
    case "31": {_type = ["Waffe ohne Waffenlizenz",10000];};
    case "32": {_type = ["Waffe abfeuern Innerorts",15000];};
    case "33": {_type = ["Besitz außerhalb der Rebellenzone",20000];};
    case "34": {_type = ["Verursachter Personenschaden",200000];};
    case "35": {_type = ["Schweben über Siedlung unter 150m",10000];};
    case "36": {_type = ["Landen innerhalb 500m zur Siedlung",10000];};
    case "37": {_type = ["Landen auf Straßen",15000];};
    case "38": {_type = ["Landen in gesperrten Gebieten",30000];};
    case "39": {_type = ["Heli-Flucht Unterstützung",20000];};
    case "40": {_type = ["Fliegen ohne Kollisionsleuchten",5000];};
	case "41": {_type = ["Fliegen ohne Lizens",10000];};
	case "42": {_type = ["Kein Sanikasten als Fahrzeugführer",250];};
	case "43": {_type = ["Kein Werkzeugkasten als Fahrzeugführer",250];};
	case "44": {_type = ["Innerorts über 50km/h",750];};
	case "45": {_type = ["Innerorts über 60km/h",1500];};
	case "46": {_type = ["Innerorts über 85km/h",5000];};
	case "47": {_type = ["Innerorts über 110km/h",20000];};
	case "48": {_type = ["Innerorts über 200km/h",50000];};
	case "49": {_type = ["Außerorts über 130km/h",5000];};
	case "50": {_type = ["Außerorts über 180km/h",10000];};
	case "51": {_type = ["Außerorts über 230km/h+",20000];};
	case "52": {_type = ["Fahren ohne Fahrerlaubnis",5000];};
	case "53": {_type = ["Fahren ohne Licht [Nachts]",2000];};
	case "54": {_type = ["Fahren auf der falschen Straßenseite",3000];};
	case "55": {_type = ["Unfallverursacher",5000];};
	case "56": {_type = ["Fahrerflucht nach Unfall",5000];};
	case "57": {_type = ["Behinderung des Verkehrs",1000];};
	case "58": {_type = ["Vorsätzliches Überfahren von Spielern",0];};
	case "59": {_type = ["Falschparken",1000];};
	case "60": {_type = ["Behinderung des Fahrzeugspawns",2000];};
	case "61": {_type = ["Offroad (übers Feld fahren)",5000];};
	case "62": {_type = ["Fahren in gesperrten Gebieten",30000];};
	case "63": {_type = ["Verbotene Fahrzeuge",100000];};
	case "64": {_type = ["Lärmbelästigung durch unnötiges Hupen",0];};
	case "65": {_type = ["Einbruch",40000];};
	
    default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes set[count _crimes,(_type select 0)];
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list set[count life_wanted_list,[_name,_uid,[(_type select 0)],(_type select 1)]];
};