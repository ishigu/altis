/*
File: fn_betMonitor.sqf
Author: Shentoza
Description: Monitors when to distribute profits.
*/
_played = 0;
_playedMaximum = 4;
life_bet_number = 0;
life_bet_funds = 0;
life_bet_done = false;
while {true} do
{
life_bet_funds = life_bet_funds + 30000;
_played = _played +1;
life_bet_players = [];
if(_played > _playedMaximum) exitWith 
{
	diag_log "4x Lotterie gespielt, Funktion gestoppt!";
	[[{systemChat "Die letzte Runde Lotto wurde für ""heute"" gespielt! Bitte keinen neuen Tickets kaufen!";life_bet_done = true;}], "BIS_fnc_spawn", true, false] spawn life_fnc_MP;
	life_bet_number = -1;
};

life_bet_number = round(random 100);
diag_log format["RNG Number for Lottery: %1",life_bet_number];
sleep 1500;
[[[life_bet_funds],
{
	_amount = [_this,0,0,[0]] call BIS_fnc_param;
	if(_amount == -1) exitWith {};
	["NewsBroadcast",[format["Channel 7 News"]]] call bis_fnc_showNotification;
	if(_amount < 1000000) then {
	hint parseText format["<t color='#B43104'><t size='2'><t align='center'>Channel 7 News<br/><t align='left'><t size='1'><t color='#ffffff'><br/>In 30 Minuten findet die nächste Lottoauslosung statt!<br/>Benutze jetzt dein Handy, für eine Chance auf $%1!<br/><br/>Chance 1:100.<br/>Glücksspiel kann süchtig machen.",_amount];
	}else{
	hint parseText format["<t color='#B43104'><t size='2'><t align='center'>Channel 7 News<br/><t align='left'><t size='1'><t color='#ffffff'><br/>In 30 Minuten findet die nächste Lottoauslosung statt!<br/>Benutze jetzt dein Handy, für eine Chance auf %1 Mio!<br/><br/>Chance 1:100.<br/>Glücksspiel kann süchtig machen.",round(_amount/10000)/100];
	};
}], "BIS_fnc_spawn", true, false] spawn life_fnc_MP;


sleep 1500;
[[[life_bet_funds],
{
	_amount = [_this,0,0,[0]] call BIS_fnc_param;
	if(_amount == -1) exitWith {};
	["NewsBroadcast",[format["Channel 7 News"]]] call bis_fnc_showNotification;
	if(_amount < 1000000) then {
	hint parseText format["<t color='#B43104'><t size='2'><t align='center'>Channel 7 News<br/><t align='left'><t size='1'><t color='#ffffff'><br/>In 5 Minuten findet die nächste Lottoauslosung statt!<br/>Benutze jetzt dein Handy, für eine Chance auf $%1!<br/><br/>Chance 1:100.<br/>Glücksspiel kann süchtig machen.",_amount];
	}else {
	hint parseText format["<t color='#B43104'><t size='2'><t align='center'>Channel 7 News<br/><t align='left'><t size='1'><t color='#ffffff'><br/>In 5 Minuten findet die nächste Lottoauslosung statt!<br/>Benutze jetzt dein Handy, für eine Chance auf %1 Mio!<br/><br/>Chance 1:100.<br/>Glücksspiel kann süchtig machen.",round(_amount/10000)/100];
	};
}], "BIS_fnc_spawn", true, false] spawn life_fnc_MP;

sleep 300;
{
	_current = _x;
	_changed = false;
	life_bet_players set[_forEachIndex,-1];
	{
		if(_current == (getPlayerUID _x)) exitWith { _current = _x;_changed = true;};
	}forEach playableUnits;
	if(_changed) then { life_bet_players set [_forEachIndex,_current]; };
}forEach life_bet_players;

life_bet_players = life_bet_players - [-1]; //remove non-eligible "winners" aka. disconnected players and stuff
_winnerString = "";
if(count life_bet_players > 0) then {
	_amount = round(life_bet_funds / (count life_bet_players));
	{
		if(_forEachIndex != 0) then {_winnerString = _winnerString + "<br/>"};
		[[[_amount],
		{_amount = [_this,0,0,[0]] call BIS_fnc_param;
		if(_amount == -1) exitWith {};
		life_atmcash = life_atmcash + _amount;
		if(_amount < 1000000) then {
		systemChat format["Herzlichen Glückwunsch! Du hast $%1 aus der Lotterie gewonnen!",_amount];
		}else {
		systemChat format["Herzlichen Glückwunsch! Du hast %1 Mio aus der Lotterie gewonnen!",round(_amount/10000)/100];
		};
		}], "BIS_fnc_spawn",_x, false] spawn life_fnc_MP;
		_winnerString = _winnerString + (_x getVariable["realname",name _x]);
	}forEach life_bet_players;
	
	[[[life_bet_funds,life_bet_number,_winnerString],
	{
		_amount = [_this,0,-1,[0]] call BIS_fnc_param;
		_number = [_this,1,-1,[0]] call BIS_fnc_param;
		_winnerString = [_this,2,"",[""]] call BIS_fnc_param;
		if(_amount == -1 || _number == -1 || _winnerString == "") exitWith {};
		["NewsBroadcast",[format["Channel 7 News"]]] call bis_fnc_showNotification;
		if(_amount < 1000000) then {
		hint parseText format["<t color='#B43104'><t size='2'><t align='center'>Channel 7 News<br/><t align='left'><t size='1'><t color='#ffffff'><br/>Die Lottozahl der Stunde ist %1!<br/>Und das sind unsere Gewinner:<br/><t align='center'>%2<br/><br/><t align='left'>Insgesamt wurden $%3 ausgeschüttet!",_number,_winnerString,_amount];
		}else {
		hint parseText format["<t color='#B43104'><t size='2'><t align='center'>Channel 7 News<br/><t align='left'><t size='1'><t color='#ffffff'><br/>Die Lottozahl der Stunde ist %1!<br/>Und das sind unsere Gewinner:<br/><t align='center'>%2<br/><br/><t align='left'>Insgesamt wurden %3 Mio ausgeschüttet!",_number,_winnerString,round(_amount/10000)/100];
		};
	}], "BIS_fnc_spawn", true, false] spawn life_fnc_MP;
	diag_log format["Lotterie Gewinner dieser %1. Runde: %2",_played,_winnerString];
	life_bet_funds = 0;
}
else
{
	[[[life_bet_funds,life_bet_number],
	{
		_amount = [_this,0,-1,[0]] call BIS_fnc_param;
		_number = [_this,1,-1,[0]] call BIS_fnc_param;
		if(_amount == -1 || _number == -1) exitWith {};
		["NewsBroadcast",[format["Channel 7 News"]]] call bis_fnc_showNotification;
		if(_amount < 1000000) then {
		hint parseText format["<t color='#B43104'><t size='2'><t align='center'>Channel 7 News<br/><t align='left'><t size='1'><t color='#ffffff'><br/>Die Lottozahl der Stunde ist %1!<br/><br/>Leider hat niemand richtig geraten.<br/> Also gehen die $%2 in den Jackpot,für die nächste Runde!",_number,_amount];
		}else{
		hint parseText format["<t color='#B43104'><t size='2'><t align='center'>Channel 7 News<br/><t align='left'><t size='1'><t color='#ffffff'><br/>Die Lottozahl der Stunde ist %1!<br/><br/>Leider hat niemand richtig geraten.<br/> Also gehen die %2 Mio in den Jackpot,für die nächste Runde!",_number,round(_amount/10000)/100];
		};
	}], "BIS_fnc_spawn", true, false] spawn life_fnc_MP;
};
sleep 5;
}


