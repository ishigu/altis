/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {hint "Du kannst nur alle 5 Minuten Sync Daten verwenden.";};

switch (typeName life_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count life_fnc_MP_packet == 0) exitWith
		{
			_exit = true;
		};
	};
	
	default {_exit = true;};
};

if(!isNil "_exit") exitWith {hint "Ein Cheater hat das BIS MP Framework befallen. Versuche es bitte gleich nochmal";};

[] call SOCK_fnc_updateRequest;
hint "Syncronisiere Spielerdaten mit Server.\n\n Bitte 20 sekunden warten, bevor du dich ausloggst.";
[] spawn
{
	life_session_time = true;
	sleep (5 * 60);
	life_session_time = false;
};
	