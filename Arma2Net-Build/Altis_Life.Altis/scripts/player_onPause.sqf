if (isDedicated) exitWith {};
private["_display","_btnRespawn","_btnAbort","_timeOut","_timeMax"];
		disableSerialization;
		waitUntil {
			_display = findDisplay 49;
			!isNull _display;
		};
		_btnRespawn = _display displayCtrl 1010;
		_btnAbort = _display displayCtrl 104;
		_btnRespawn ctrlEnable false;
		_btnAbort ctrlEnable false;
		_timeOut = 0;
		_timeMax = 20;

		// if(r_player_dead) exitWith {_btnAbort ctrlEnable true;};

		while {!isNull _display} do {
			switch true do {


				case (_timeOut < _timeMax) :
				{
					_btnAbort ctrlEnable false;
					_btnRespawn ctrlEnable false;
					cutText [format ["!ANTI CB LOG! Vergess nicht zu speichern. Abbruch erlaubt in %1",(_timeMax - _timeOut)], "PLAIN DOWN"];
					_timeOut = _timeOut + 1;
				};



				default {
					_btnAbort ctrlEnable true;
					_btnRespawn ctrlEnable true;
					cutText ["", "PLAIN DOWN"];
				};
			};
			showChat true;
			sleep 1;
		};
		cutText ["", "PLAIN DOWN"];