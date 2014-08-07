/*
	Updates impound status of the vehicle.
*/
private["_vid","_pid","_query","_sql"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;


//Stop bad data being passed.
if((_vid == -1) || (_pid == "")) exitWith {diag_log "Unimpounding canceled!";};

//_query = format["UPDATE vehicles SET impound='0' WHERE id='%1' AND pid='%2'",_vid, _pid];
//_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];
_query = format["UPDATE vehicles SET active='0',impound='0' WHERE pid='%1' AND id='%2'",_pid,_vid];
	waitUntil {!DB_Async_Active};
	_thread = [_query,1] call DB_fnc_asyncCall;
	//waitUntil {scriptDone _thread};