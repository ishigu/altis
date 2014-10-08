/*
	File: fn_spawnParadrop.sqf
	Author: ishi
	
	Description:
	Spawns a paradrop every 60 minutes
*/
private["_obj","_pos","_loot","_num","_weed","_cocaine","_heroin","_meth","_numitems","_rnd","_weight"];
while {true} do
{
	sleep (60 * 60);
	_num = count playableUnits;
	_numitems = round _num/2;
	_pos = life_cratedrop_positions call BIS_fnc_selectRandom;
	diag_log format["Paradrop an Position: %1", str(_pos)];
	_weed = 0;
	_cocaine = 0;
	_heroin = 0;
	_meth = 0;
	
	if (_num >= 10) then {
		// Calculate loot
		_loot = [];
		_weight = 0;
		for "_x" from 1 to _numitems do {
			_rnd = [1,2,3,4] call BIS_fnc_selectRandom;
			switch (_rnd) do {
				case 1: {_weed = _weed + 1;};
				case 2: {_cocaine = _cocaine + 1;};
				case 3: {_heroin = _heroin + 1;};
				case 4: {_meth = _meth + 1;};
			};
		};
		if (_weed > 0) then {_loot pushBack ["marijuana", _weed]; _weight = _weight + (_weed * 3);};
		if (_cocaine > 0) then {_loot pushBack ["cocainep", _cocaine]; _weight = _weight + (_cocaine * 4);};
		if (_heroin > 0) then {_loot pushBack ["heroinp", _heroin]; _weight = _weight + (_heroin * 4);};
		if (_meth > 0) then {_loot pushBack ["meth", _meth]; _weight = _weight + (_meth * 2);};

		// Let's spawn a paradrop
		_obj = "Land_WoodenBox_F" createVehicle [0,0,0];
		_obj allowDamage false;
		_obj setVariable ["locked",false,true];
		_obj setVariable ["Trunk",[_loot,_weight],true];
		_obj setDir random 360;
		_obj setPos [_pos select 0,_pos select 1,800];
		_obj call fnc_paraDrop;
		
		// Spawn smoke for a few minutes
		_obj spawn {
			private ["_obj","_smoke"];
			_obj = _this;
			
			for "_x" from 1 to 15 do {
				_smoke = "SmokeShellOrange" createVehicle [0,0,0];
				_smoke attachTo[_obj,[0,0,0.6]];
				sleep 30;
				deleteVehicle _smoke;
			}
		};
		
		// Broadcast a hint
		[[0,format ["News: %1 wurde ein Objekt am Himmel gesichtet! Berichten zufolge befand sich bis vor wenigen Minuten ein Flugzeug in der Nähe des Objekts!", _pos select 2]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	}
};