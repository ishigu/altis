/*
	File: fn_bountyReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
private["_val","_total"];
_val = [_this,0,"",["",0]] call BIS_fnc_param;
_total = [_this,1,"",["",0]] call BIS_fnc_param;

if(_val == _total) then
{
	titleText[format["Dir wurde ein Kopfgeld in Hoehe von $%1 ausgezahlt.",[_val] call life_fnc_numberText],"PLAIN"];
}
	else
{
	titleText[format["Du hast $%1 bekommen, weil du einen Kriminellen getoetet hast. Fuer die Gefangnahme haettest du $%2 bekommen",[_val] call life_fnc_numberText,[_total] call life_fnc_numberText],"PLAIN"];
};

life_atmcash = life_atmcash + _val;