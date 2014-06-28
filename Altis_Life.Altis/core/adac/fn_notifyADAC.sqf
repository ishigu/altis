/*
	File: fn_notifyADAC.sqf
	
	Description:
	Checks if player is ADAC and notifies them
*/
private["_sender","_from","_msg","_message2","_pos"];
if(isServer) exitWith{};
if(isNil "_this") exitWith{};
_sender = _this select 0;
_from = name _sender;
_pos = mapGridPosition _sender;
_msg = _this select 1;
if(player == _sender) then
{
	if(_msg == "") exitWith{hint "Du musst eine Nachricht eingeben!";};
	hint "Du hast eine Nachricht an den ADAC geschickt!";
	[] call life_fnc_cellphone;
};
if ((!(!(player call life_fnc_isMedic) && (side player == independent))) || _msg == "") exitWith {};  // Kein ADAC oder leere Nachricht
["ADACDispatch",[format["Notruf von %1",_from]]] call bis_fnc_showNotification;
_message = format[">>>ADAC Notruf von %1 bei (%2) : %3",_from,_pos,_msg];
systemChat _message;

hint parseText format["<t color='#FFCC00'><t size='2'><t align='center'>ADAC Notruf<br/><t color='#33CC33'><t align='left'><t size='1'>Position:   %1<br/>An: <t color='#ffffff'>ADAC Team<t color='#33CC33'><br/>Von: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%3",_pos,_from,_msg];