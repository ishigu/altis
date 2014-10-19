/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name","_side","_tickTime","_dir"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,[],[[],""]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_dir = [_this,5,0,[0]] call BIS_fnc_param;
_name = name _unit;
_side = side _unit;
_unit = owner _unit;

if(_vid == -1 OR _pid == "") exitWith {};
if(_vid in serv_sv_use) exitWith {};
serv_sv_use set[count serv_sv_use,_vid];

_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith {};

_vInfo = _queryResult;
if(isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];};
if(count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];};

if((_vInfo select 5) == 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 6) == 1) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};
if(typeName _sp != "STRING") then {
	_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
} else {
	_nearVehicles = [];
};
if(count _nearVehicles > 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[_price,{life_atmcash = life_atmcash + _this;}],"BIS_fnc_spawn",_unit,false] spawn life_fnc_MP;
	[[1,(localize "STR_Garage_SpawnPointError")],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid];
//_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

waitUntil {!DB_Async_Active};
[_query,false] spawn DB_fnc_asyncCall;
/*
_thread = [_query,false] spawn DB_fnc_asyncCall;
waitUntil {scriptDone _thread};
*/
if(typeName _sp == "STRING") then {
	_vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,14]);
	sleep 0.6;
} else {
	_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_vehicle setPos _sp;
	_vehicle setVectorUp (surfaceNormal _sp);
	_vehicle setDir _dir;
};
_vehicle allowDamage true;
//Send keys over the network.
[[_vehicle],"life_fnc_addVehicle2Chain",_unit,false] spawn life_fnc_MP;
_vehicle lock 2;
//Remove fuel from fueltracks for now
_vehicle setFuelCargo 0;
[[_vehicle,0],"life_fnc_setFuelCargo",true,false] spawn life_fnc_MP;
//Reskin the vehicle 
[[_vehicle,_vInfo select 8],"life_fnc_colorVehicle",nil,false] spawn life_fnc_MP;
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7]];
_vehicle setVariable["side",(_vInfo select 1),TRUE];
//_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"]; //Obsolete function?
[_vehicle] call life_fnc_clearVehicleAmmo;

//Sets of animations
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F" && _vInfo select 8 != 13) then
{
	[[_vehicle,"civ_littlebird",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then
{
	[[_vehicle,"cop_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

if(((_vInfo select 1) == "med") && (_vInfo select 2) == "C_Offroad_01_F") then
{
	[[_vehicle,"med_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};
if((((_vInfo select 1) == "adac")) && (_vInfo select 2) == "C_Offroad_01_F") then
{
	[[_vehicle,"adac_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};
[[1,"Your vehicle is ready!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
if(((_vInfo select 1) == "med") || ((_vInfo select 1) == "adac")) then
{
	_vehicle setVariable["lights",false,true];
};

if((_vInfo select 1) == "cop") then { //(_vInfo select 2) in ["B_MRAP_01_F","C_SUV_01_F"]
	_vehicle setVariable["lights",false,true];
};

if((_vInfo select 1) == "reb" && (_vInfo select 2) == "B_Heli_Light_01_F" && _vInfo select 8 != 13) then
{
	[[_vehicle,"civ_littlebird",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

[[_vehicle],"life_fnc_clearVehicleAmmo",_unit,false] spawn life_fnc_MP;

serv_sv_use = serv_sv_use - [_vid];