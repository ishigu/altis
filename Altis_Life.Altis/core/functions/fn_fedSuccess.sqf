/*
	File: fn_fedSuccess.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Ugh coming up with a name for it was stupid but whatever.
	If the robbery was successful on the Federal reserve then punish
	everyone and take some money.

	Support for Bank Insurance is there.
*/
private["_funds"];
_funds = [_this,0,-1,[0]] call BIS_fnc_param;
if(_funds == -1) exitWith {};
if(!life_use_atm) exitWith {};
sleep 45;

if(_funds >= life_atmcash && !life_has_insurance) then
{
	hint "Wegen dem Bankraubs wurde dir ein Teil deines Geldes geklaut, du bist nun Bankrott.\n\n Fuer das naechste mal lieber eine Bankversicherung am ATM abschliessen!";
	life_atmcash = 0;
}
	else
{
	if(life_has_insurance) then
	{
		hint "Der Bankraub traf die Zivilisten, wo es am meisten weh tut. Gluecklicherweise hast du eine Versicherung und somit keinen Cent verloren!\n\nJedoch solltest du deine Versicherung erneuern, da diese verloren ist!";
		life_has_insurance = false;
	}
		else
	{
		hint format["Wegen dem Bankraub wurden $%1 deinem Konto entwendet, kauf dir lieber eine Versicherung das naechste Mal!\n\nDu kannst eine Versicherung am ATM abschließen!",[_funds] call life_fnc_numberText];
		life_atmcash = life_atmcash - _funds;
	};
};