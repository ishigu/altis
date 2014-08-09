/*

	Opens the ADAC repaint menu

*/

disableSerialization;
private["_display", "_veh", "_name", "_pic", "_index", "_vehtype", "_tokenarray","_condarray","_colorindex","_colorcost"];

createDialog "Life_vehicle_repaint";
_display = findDisplay 2300;

_veh = cursorTarget;
//life_adac_repaint_vehicle = _veh;

if(isNull _veh) exitWith {};
if(!(alive _veh)) exitWith {};

_vehtype = typeOf _veh;

//Initialize list 
_name = getText(configFile >> "CfgVehicles" >> _vehtype >> "displayName");
_pic = getText(configFile >> "CfgVehicles" >> _vehtype >> "picture");

_index = lbAdd [2302, _name];
lbSetPicture [2302, _index, _pic];


//Initialize color list
_vehData = _veh getVariable["vehicle_info_owners",[]];
if(count _vehData == 0) exitWith {hint "Das Fahrzeug wurde wahrscheinlich mit Cheats gespawnt oder der Besitzer hatte einen Disconnect.\n\nKann Fahrzeug nicht lackieren.";};
_vehOwnerUID = (_vehData select 0) select 0;

_unit = objNull;
{if(str(getPlayerUID _x) == str(_vehOwnerUID)) then {_unit = _x;}; } forEach playableUnits;
_side = switch(side _unit) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"}; case east:{"reb"}};
if(_side == "med" && !(_unit call life_fnc_isMedic)) then {_side = "adac";};
if(_side == "") exitWith{hint format["Konnte den Fahrzeugeigentuemer %1 nicht finden",(_vehData select 0) select 1];};

_colorArray = [_vehtype] call life_fnc_vehicleColorCfg;
for "_i" from 0 to count(_colorArray)-1 do {
	if((_colorArray select _i) select 1 == _side) then {
		_temp = [_vehtype,_i] call life_fnc_vehicleColorStr;
		_index = lbAdd [2303, format["%1", _temp]];
		lbSetValue[2303, _index, _i];
		lbSetData[2303, _index, [1] call life_fnc_numberText];
	};
};

if(lbSize 2303 != 0) then
{
	lbSetCurSel [2303, 0];
};