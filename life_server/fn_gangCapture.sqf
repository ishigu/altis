/*
	File: fn_gangCapture.sqf
*/

private ["_flag","_index","_gang","_attName","_attGang","_areaGang","_nearUnits","_xindex","_xgang","_xname","_areaContested","_curGang",
"_gangNum","_run","_perCent","_mName","_mText","_newmoney","_nil"];

_flag = getpos player nearestObject "Flag_POWMIA_F";

if ((player distance _flag) > 20) exitWith { hint parseText "Du musst naeher an die Fahne, um dieses Gebiet einzunehmen!"; };
if ((side player == CIVILIAN) AND (isNull life_my_gang)) exitWith { hint parseText "Du musst in einer Gang sein, um dieses Gebiet einzunehmen!"; };

if (side player == CIVILIAN) then {
	_index = [life_my_gang,life_gang_list] call fnc_index;
	if (_index == -1) exitWith { hint parseText "Du musst in einer Gang sein, um dieses Gebiet einzunehmen!"; };
	
	_gang = life_gang_list select _index;
	_attName = _gang select 0;
	_attGang = _gang select 1;
	
	_areaContested = false;
	_nearUnits = _flag nearEntities ["Man",300];
	{
		if ((isPlayer _x) AND (_x != player) AND (side _x == CIVILIAN) AND (!(_x in (units _attGang)))) then {
			_areaContested = true;
			
			_xindex = [(group _x),life_gang_list] call fnc_index;
			_xgang = life_gang_list select _xindex;
			_xname = _xgang select 0;
		};
		if ((isPlayer _x) AND (_x != player) AND (side _x == WEST)) then {
			_areaContested = true;
			
			_xname = "in Polizeigewalt";
		};
		if (_areaContested) exitWith {
			if (_xname == "in Polizeigewalt") then {
				hint parseText "Mitglieder der Polizei sind in der Naehe! Sie muessen getoetet werden um dieses Gebiet einzunehmen!";
			} else {
				hint parseText format["%1 Mitglieder sind in der Naehe! Sie muessen getoetet werden um dieses Gebiet einzunehmen!", _xname];
			};
		};
	} forEach _nearUnits;
	
	if (_areaContested) exitWith {};

	_curGang = _flag getVariable ["gangControl", ""];
	if (_curGang == _attName) exitWith { hint parseText "Du besitzt bereits dieses Gebiet!"; };
	
	_gangNum = _flag getVariable ["gangNum", ""];
	[[0,format["Die Gang [%2] ist dabei das Gebiet %1 zu uebernehmen.", _gangNum, _attName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	
	_run = true;
	_perCent = 0;
	while {_run} do {
		hint parseText format["Gang Gebiet %1<br/><br/>%2 Prozent eingenommen!", _gangNum, _perCent];
		if (!(alive player)) then { _run = false; };
		if (_perCent == 100) then { _run = false; };
		_perCent = _perCent + 1;
		if ((player distance _flag) > 20) exitWith { _areaContested = true; };
		sleep 1;
	};
	
	if (_areaContested) exitWith { 
		hint parseText "Du musst naeher an die Fahne, um dieses Gebiet einzunehmen!"; 
		_areaContested = false; 
		[[0,format["[%2] konnte das Gang Gebiet %1 nicht einnehmen!", _gangNum, _attName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		};
	
	
	if (alive player) then {
		hint parseText format["Deine Gang hat das Gebiet %1 eingenommen!", _gangNum];
		[[0,format["Gang Gebiet %1 ist von [%2] erobert worden.", _gangNum, _attName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		_mName = format["Gang_Area_%1", _gangNum];
		_mText = format["Gebiet #%1 [%2]", _gangNum, _attName];
		_mName setMarkerText _mText;
		_mName setMarkerColor "ColorBlack";
		_mName setMarkerType "KIA";
		_mName setMarkerSize [0.9, 0.9];
		_mName setMarkerAlpha 0.8;
		
		//ringmarker
		_mName2 = format["Gang_marker_%1", _gangNum];
		_pos2 = getMarkerPos _mName;
		_nil = createMarker [_mName2, _pos2];
		_mName2 setMarkerColor "ColorRed";
		_mName2 setMarkerShape "ELLIPSE";
		_mName2 setMarkerBrush "Grid";
		_mName2 setMarkerAlpha 0.3;
		_mName2 setMarkerSize [300,300];
		
		_flag setVariable ["gangControl", _attName, true];
	} else {
		hint parseText "Du wurdest getoetet, beim Versuch das Gebiet einzunehmen!";
		[[0,format["[%2] konnte das Gang Gebiet %1 nicht einnehmen!", _gangNum, _attName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
};

if (side player == WEST) then {
	_curGang = _flag getVariable ["gangControl", ""];
	_gangNum = _flag getVariable ["gangNum", ""];
	
	if (_curGang == "") exitWith { hint parseText "Dieses Gang Gebiet ist noch nicht eingenommen."; };

	_areaContested = false;
	_nearUnits = _flag nearEntities ["Man",300];
	{
		if ((isPlayer _x) AND (_x != player) AND (side _x == CIVILIAN)) then {
			_xindex = [(group _x),life_gang_list] call fnc_index;
			if (!(_xindex == -1)) then {
				_xname = ((life_gang_list select _xindex) select 0);
				if (_xname == _curGang) then {_areaContested = true;};
			};
		};
		if (_areaContested) exitWith {
			hint parseText format["%1 Gang-Mitglieder sind in der Naehe! Alle müssen festgenommen werden um dieses Gebiet zu neutralisieren!", _curGang];
		};
	} forEach _nearUnits;
	
	if (_areaContested) exitWith {};
	
	[[0,format["Die Cops sind dabei das Gang Gebiet %1 von [%2] zu neutralisieren.", _gangNum, _curGang]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	
	_run = true;
	_perCent = 100;
	while {_run} do {
		hint parseText format["Gang Gebiet %1<br/><br/>%2 Prozent neutralisiert!", _gangNum, _perCent];
		if (!(alive player)) then { _run = false; };
		if (_perCent == 0) then { _run = false; };
		_perCent = _perCent - 1;
		if ((player distance _flag) > 20) exitWith { _areaContested = true; };
		sleep 1;
	};
	
	if (_areaContested) exitWith { 
		hint parseText "Du musst naeher an die Fahne, um dieses Gebiet zu neutralisieren!"; 
		_areaContested = false; 
		[[0,format["Die Cops konnten das Gang Gebiet %1 nicht neutralisieren!", _gangNum]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		};
	
	if (alive player) then {
		hint parseText format["Gang Gebiet %1<br/><br/>Du hast dieses Gebiet neutralisiert!", _gangNum];
		[[0,format["Gang Gebiet %1 wurde von den Cops neutralisiert!", _gangNum]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		_mName = format["Gang_Area_%1", _gangNum];
		_mText = format[" Ganggebiet #%1", _gangNum];
		_mName setMarkerText _mText;
		_mName setMarkerColor "ColorPink";
		_mName setMarkerType "mil_circle";
		_mName setMarkerSize [0.7, 0.7];
		_mName setMarkerAlpha 0.9;
		
		//ringmarker löschen
		_mName2 = format["Gang_marker_%1", _gangNum];
		deleteMarker _mName2;
		
		_flag setVariable ["gangControl", "", true];
		
		_newmoney = (count playableUnits) * 500;
		life_cash = life_cash + _newmoney;
	} else {
		hint parseText "Du wurdest getoetet, beim Versuch das Gebiet zu neutralisieren!";
		[[0,format["[%2] konnte das Gang Gebiet %1 nicht neutralisieren!", _gangNum, _curGang]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
};