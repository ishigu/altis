/*
	File: fn_gangCash.sqf
*/


private ["_index","_gang","_gangPaycheck","_owner","_myGang","_newmoney"];

while {true} do {
	sleep 600;
	
	_index = [life_my_gang,life_gang_list] call fnc_index;
	if (!(_index == -1)) then {
		_gang = (life_gang_list select _index);
		_gangPaycheck = 0;
		
		{
			_owner = _x getVariable ["gangControl", ""];
			_myGang = (_gang select 0);
			
			if ((_owner != "") AND (_myGang == _owner)) then {
				_newmoney = (count playableUnits) * 500;
				_gangPaycheck = _gangPaycheck + _newmoney;
			};
		} forEach life_gang_flags;
		
		if (_gangPaycheck > 0) then {
			if (alive player) then {
				hint parseText format["Du hast $%1 fuer dein Gang-Territorium erhalten. Die naechste Zahlung erfolgt in 10 Minuten.",[_gangPaycheck] call life_fnc_numberText];
				life_atmCash = life_atmCash + _gangPaycheck;
			} else {
				hint parseText "Du hast deine Gang-Auszahlung verpasst.";
			};
			_gangPaycheck = 0;
		};
	};
};