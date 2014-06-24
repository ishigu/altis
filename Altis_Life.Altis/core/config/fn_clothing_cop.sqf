#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{	
		_ret set[count _ret,["U_Rangemaster","Rekruten Uniform",nil,25]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["U_O_Wetsuit","Taucher Anzug",nil,2500]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["U_B_CombatUniform_mcam","GSG9 Uniform",nil,2000]];
		};
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["H_Cap_blk",nil,150]];
			_ret set[count _ret,["H_Cap_tan_specops_US",nil,150]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["H_Beret_blk_POLICE",nil,800]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,1000]]; 
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Diving",nil,500],
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["V_TacVest_blk","Polizei Weste",1500]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{  	
			_ret set[count _ret,["V_RebreatherIA","Taucher Weste",1500]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["V_PlateCarrier1_blk","GSG9 Weste",2000]];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_blk",nil,500],
			["B_AssaultPack_blk",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500],
			["B_Parachute",nil,500]
		];
	};
};

_ret;