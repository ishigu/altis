#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "adac_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein ADAC!"};
			default {
				["ADAC Shop",
					[
						["ItemGPS",nil,100],
						["ToolKit",nil,0],
						["NVGoggles",nil,100],
						["Chemlight_yellow",nil,10],
						["SmokeShellYellow",nil,10],
						["U_I_CombatUniform","Uniform",500],
						["B_Kitbag_cbr",nil,250]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein Notarzt!"};
			default {
				["Notarzt Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,0],
						["Medikit",nil,0],
						["NVGoggles",nil,200],
						["B_Kitbag_cbr",nil,250],
						["H_Cap_blk",nil,50],
						["U_I_CombatUniform","Uniform",500],
						["Chemlight_red",nil,10],
						["SmokeShellPurple",nil,10]
					]
				];
			};
		};
	};
	
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			default
			{
				["Altis Polizeirekut",
					[
						["arifle_sdar_F","Taser Rifle",500],
						["hgun_P07_snds_F","Stun Pistol",250],
						["hgun_P07_F",nil,7500],
						["muzzle_snds_L",nil,650],
						["MineDetector",nil,1000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 2): {"Du hast nicht den benoetigten Rang!"};
			default
			{
				["Altis Polizeibeamter",
					[
						["arifle_MXC_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_65x39_caseless_mag_Tracer",nil,300],
						["optic_Holosight",nil,2500],
						["SMG_02_F",nil,10000],
						["30Rnd_9x21_Mag",nil,250],
						["muzzle_snds_H",nil,650],
						["rangefinder",nil,1000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 3): {"Du hast nicht den benoetigten Rang!"};
			default
			{
				["Altis Polizeiteam",
					[
						["arifle_MXC_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_65x39_caseless_mag_Tracer",nil,300],
						["optic_Hamr",nil,3500],
						["muzzle_snds_H",nil,650],
						["rangefinder",nil,1000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100]
						
					]
				];
			};
		};
	};

	case "cop_leader":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 4): {"Du hast nicht den benoetigten Rang!"};
			default
			{
				["Altis Polizei Teamleiter",
					[
						["srifle_EBR_F",nil,20000],
						["20Rnd_762x51_Mag",nil,200],
						["optic_SOS",nil,200], 
						["muzzle_snds_B",nil,2000],
						["arifle_MXC_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_65x39_caseless_mag_Tracer",nil,300],
						["optic_Hamr",nil,3500],
						["muzzle_snds_H",nil,2000],	
						["B_UAV_01_backpack_F",nil,50000],
						["B_UavTerminal",nil,50000],						
						["rangefinder",nil,1000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100]
					]
				];
			};
		};
	};

	case "cop_gsg9":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 5): {"Du hast nicht den benoetigten Rang!"};
			default
			{
				["Altis GSG9",
					[
						["srifle_EBR_F",nil,20000],
						["20Rnd_762x51_Mag",nil,200],
						["optic_SOS",nil,200],
						["muzzle_snds_B",nil,2000],
						["arifle_MXC_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_65x39_caseless_mag_Tracer",nil,300],
						["optic_Hamr",nil,3500],
						["muzzle_snds_H",nil,2000],
						["B_UAV_01_backpack_F",nil,50000],
						["B_UavTerminal",nil,50000],
						["rangefinder",nil,1000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100],
						["SmokeShell",nil,100]
					]
				];
			};
		};
	};

	case "cop_gsg9Lead":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 6): {"Du hast nicht den benoetigten Rang!"};
			default
			{
				["Altis GSG9Leiter",
					[
						["srifle_EBR_F",nil,20000],
						["20Rnd_762x51_Mag",nil,200],
						["optic_SOS",nil,200],
						["muzzle_snds_B",nil,2000],
						["arifle_MXC_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_65x39_caseless_mag_Tracer",nil,300],
						["optic_Hamr",nil,3500],
						["muzzle_snds_H",nil,2000],
						["B_UAV_01_backpack_F",nil,50000],
						["B_UavTerminal",nil,50000],
						["rangefinder",nil,1000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100],
						["SmokeShell",nil,100]
					]
				];
			};
		};
	};

	case "cop_chef":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 7): {"Du hast nicht den benoetigten Rang!"};
			default
			{
				["Altis Polizeipraesident",
					[
						
						["srifle_EBR_F",nil,20000],
						["20Rnd_762x51_Mag",nil,200],
						["optic_SOS",nil,200],
						["muzzle_snds_B",nil,2000],
						["arifle_MXC_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_65x39_caseless_mag_Tracer",nil,300],
						["optic_Hamr",nil,3500],
						["muzzle_snds_H",nil,2000],
						["rangefinder",nil,1000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100],
						["B_UAV_01_backpack_F",nil,50000],
						["B_UavTerminal",nil,50000],
						["SmokeShell",nil,100]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_TRG20_F",nil,25000],
						["arifle_Katiba_F",nil,30000],
						["srifle_DMR_01_F",nil,50000],
						["arifle_SDAR_F",nil,20000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag",nil,500],
						["30Rnd_65x39_caseless_green",nil,275]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"Du bist kein Donator!"};
			case (__GETC__(life_donator) == 1):
			{
				["STS Donator Shop Tier 1",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["optic_ACO_grn_smg",nil,750],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["STS Donator Shop Tier 2",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["arifle_MK20C_plain_F",nil,25000],
						["optic_ACO_grn_smg",nil,750],
						["NVGoggles",nil,350],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};

			case (__GETC__(life_donator) >= 3):
			{
				["STS Donator Shop Tier 3",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_PDW2000_F",nil,6500],
						["hgun_pistol_heavy_01_F",nil,5850],
						["arifle_Mk20C_plain_F",nil,25000],
						["optic_ACO_grn_smg",nil,750],
						["optic_MRCO",nil,10000],
						["NVGoggles",nil,350],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Allgemeines Zubehoer",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};
