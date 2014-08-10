/*
	File: fn_medicRequestRecieve.sqf
	
	Description:
	Checks if player is medic and sends them the information about the injured/dead player.
*/
private["_sender","_from","_msg","_message","_pos","_causedByDeath"];
if(isServer) exitWith{};
if(isNil "_this") exitWith{};
_sender = _this select 0;
	_from = name _sender;
	_pos = mapGridPosition _sender;
_msg = _this select 1;
_causedByDeath = _this select 2;
if(_causedByDeath) then {
	_msg = "Helft mir, ich bin schwer verletzt, und halte nicht mehr lange durch!";};
if(player == _sender && _causedByDeath) then
{	
	if((call life_fnc_countMedic) < 1) exitWith{systemChat "Keine Medics online!";};
	systemChat "Du hast einen Notruf abgesetzt!";
	life_request_timer = true;
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
};
if((!(player call life_fnc_isMedic)) || _msg == "") exitWith {};
["MedicalRequestEmerg",[format["Notruf von %1",_from]]] call bis_fnc_showNotification;
_message = format[">>>Notruf von %1 bei (%2) : %3",_from,_pos,_msg];
systemChat _message;
hint parseText format["<t color='#FF0000'><t size='2'><t align='center'>Notruf<br/><t color='#33CC33'><t align='left'><t size='1'>Position:   %1<br/>An: <t color='#ffffff'>Krankenhauszentrale<t color='#33CC33'><br/>Von: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%3",_pos,_from,_msg];