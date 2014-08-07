/*
	Updates color index of vehicle
*/
private["_uid","_side","_type","_className","_color","_plate","_query","_sql"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_plate = [_this,1,-1,[0]] call BIS_fnc_param;
_color = [_this,2,0,[0]] call BIS_fnc_param;


//Stop bad data being passed.
if(_uid == "" OR _color == -1 OR _plate == -1) exitWith {diag_log "repaintVehicle canceled!";};
_query = format["UPDATE vehicles SET color='%1' WHERE plate='%2' AND pid='%3'",_color, _plate, _uid];
	waitUntil {!DB_Async_Active};
	_thread = [_query,1] call DB_fnc_asyncCall;
	//waitUntil {scriptDone _thread};