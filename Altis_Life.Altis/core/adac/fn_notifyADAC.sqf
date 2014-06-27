/*
	File: fn_notifyADAC.sqf
	
	Description:
	Checks if player is ADAC and notifies them
*/
private["_sender","_msg","_pos"];
if(isNil (_this select 0)) exitWith{};
_sender = name _this select 0;
_pos = mapGridPosition _this select 0;
_msg = _this select 1;

if( player == _sender && _msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
if(!(!(player call life_fnc_isMedic) && (side player == independent))) exitWith {};
hint parseText format["<t color='#FFCC00'><t size='2'><t align='center'>ADAC Notruf<br/><t color='#33CC33'><t align='left'><t size='1'>Position:   %1<br/>To: <t color='#ffffff'>You<t color='#33CC33'><br/>From: <t color='#ffffff'>%3<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%4",_pos,_sender,_msg];