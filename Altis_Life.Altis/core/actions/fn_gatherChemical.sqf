/*
	File: fn_gatherChemical.sqf
	Autor: Gabax	

	Description:
	Gathers chemical?
*/
private["_sum"];
_sum = ["chemical",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_in_use = true;
	titleText["Sammle Chemie...","PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,"chemical",1] call life_fnc_handleInv)) then
	{
		titleText["Du hast Chemie gesammelt.","PLAIN"];
	};
};

life_action_in_use = false;