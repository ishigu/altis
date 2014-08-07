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
						["FirstAidKit",nil,0],
						["NVGoggles",nil,100],
						["Chemlight_yellow",nil,10],
						["SmokeShellYellow",nil,10],
						["U_I_CombatUniform","Uniform",500],
						["B_Kitbag_cbr","Rucksack",nil,250]
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
				["Polizeirekut",
					[
						["arifle_sdar_F","Taser Rifle",500],
						["hgun_P07_snds_F","Stun Pistol",250],
						["muzzle_snds_L",nil,650],
						["MineDetector",nil,1000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,2500],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch (true) do 
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 2): {"Du hast nicht den benoetigten Rang!"};
			default
			{
				["Polizeibeamter",
					[
						["SMG_02_F",nil,10000],
						["30Rnd_9x21_Mag",nil,250],
						["muzzle_snds_L",nil,650],
						["optic_Aco",nil,1500],
						["optic_ACO_grn",nil,1500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,2500],
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
				["Polizeimeister",
					[
						["arifle_MXC_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["muzzle_snds_H",nil,650],
						["optic_Hamr",nil,3500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,2500],
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
				["Polizei Hauptmeister",
					[
						["arifle_MXC_Black_F",nil,20000],
						["arifle_MX_SW_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["muzzle_snds_H_SW",nil,2000],
						["muzzle_snds_H",nil,2000],
						["optic_SOS",nil,200],
						["optic_Hamr",nil,3500],
						["rangefinder",nil,1000],
						["ItemGPS",nil,100],
						["ToolKit",nil,2500],
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
				["Kommissar",
					[	
						["arifle_MXC_Black_F",nil,20000],
						["arifle_MX_SW_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["muzzle_snds_H_SW",nil,2000],
						["muzzle_snds_H",nil,2000],
						["srifle_EBR_F",nil,20000],
						["20Rnd_762x51_Mag",nil,200],
						["muzzle_snds_B",nil,2000],	
						["optic_SOS",nil,200],
						["optic_Hamr",nil,3500],
						["B_UAV_01_backpack_F",nil,50000],
						["B_UavTerminal",nil,50000],
						["rangefinder",nil,1000],
						["ItemGPS",nil,100],
						["ToolKit",nil,2500],
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
			case (!(license_cop_sniper)): {"Du hast nicht die benoetigte Ausbildung!"};
			default
			{
				["Präzisionsschütze",
					[
						["arifle_MXC_Black_F",nil,20000],
						["arifle_MX_SW_Black_F",nil,20000],
						["arifle_MX_GL_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["muzzle_snds_H_SW",nil,2000],
						["muzzle_snds_H",nil,2000],
						["srifle_EBR_F",nil,20000],
						["20Rnd_762x51_Mag",nil,200],
						["muzzle_snds_B",nil,2000],
						["optic_SOS",nil,200],
						["optic_Hamr",nil,3500],
						["B_UAV_01_backpack_F",nil,50000],
						["B_UavTerminal",nil,50000],
						["rangefinder",nil,1000],
						["ItemGPS",nil,100],
						["ToolKit",nil,2500],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100],
						["SmokeShell",nil,100],
						["3Rnd_UGL_FlareWhite_F",nil,100],
						["3Rnd_UGL_FlareRed_F",nil,100],
						["3Rnd_UGL_FlareYellow_F",nil,100],
						["3Rnd_Smoke_Grenade_shell",nil,100],
						["3Rnd_SmokeGreen_Grenade_shell",nil,100],
						["3Rnd_SmokeRed_Grenade_shell",nil,100],
						["3Rnd_SmokeBlue_Grenade_shell",nil,100],
						["3Rnd_SmokeYellow_Grenade_shell",nil,100]
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
						["arifle_MXC_Black_F",nil,20000],
						["arifle_MX_SW_Black_F",nil,20000],
						["arifle_MX_GL_Black_F",nil,20000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["muzzle_snds_H_MG",nil,2000],
						["muzzle_snds_H",nil,2000],
						["srifle_EBR_F",nil,20000],
						["20Rnd_762x51_Mag",nil,200],
						["muzzle_snds_B",nil,2000],
						["optic_SOS",nil,200],
						["optic_Hamr",nil,3500],
						["B_UAV_01_backpack_F",nil,50000],
						["B_UavTerminal",nil,50000],
						["rangefinder",nil,1000],
						["ItemGPS",nil,100],
						["ToolKit",nil,2500],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100],
						["SmokeShell",nil,100],
						["3Rnd_UGL_FlareWhite_F",nil,100],
						["3Rnd_UGL_FlareRed_F",nil,100],
						["3Rnd_UGL_FlareYellow_F",nil,100],
						["3Rnd_Smoke_Grenade_shell",nil,100],
						["3Rnd_SmokeGreen_Grenade_shell",nil,100],
						["3Rnd_SmokeRed_Grenade_shell",nil,100],
						["3Rnd_SmokeBlue_Grenade_shell",nil,100],
						["3Rnd_SmokeYellow_Grenade_shell",nil,100]
					]
				];
			};
		};
	};

	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != east): {"Du bist kein Rebell!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_TRG20_F","TRG-20 5,56 mm",50000],
                        ["30Rnd_556x45_Stanag",nil,300],
                        ["muzzle_snds_M",nil,5000],
						["arifle_Katiba_F",nil,75000],
						["30Rnd_65x39_caseless_green",nil,275],
						["muzzle_snds_H",nil,15000],
						["srifle_DMR_01_F",nil,120000],
						["10Rnd_762x51_Mag",nil,500],
						["muzzle_snds_B",nil,30000],
						["arifle_SDAR_F",nil,35000],
                        ["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["muzzle_snds_M",nil,5000],
						["SMG_01_F",nil,30000],
                        ["muzzle_snds_acp",nil,6000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,300],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["optic_SOS",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200]
					]
				];
			};
		};
	};
	
	case "criminal":
	{
		switch(true) do
		{
			case (!(playerSide in [civilian,east])): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"Du hast keine Schwarzmarktlizenz!"};
			default
			{
				["Schwarzmarkt Waffen",
					[
						["arifle_SDAR_F",nil,35000],
                        ["20Rnd_556x45_UW_mag",nil,500],
						["30Rnd_556x45_Stanag",nil,1000],
						["SMG_01_F",nil,28000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,500],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200]
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (!(playerSide in [civilian,east])): {"Du bist kein Zivilist!"};
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
		if ((__GETC__(life_donator) == 0 && __GETC__(life_adminlevel) == 0)) exitWith {"Du bist kein Donator!"};

		_return =
		[
			["ToolKit",nil,250],
			["itemgps",nil,50],
			["NVGoggles",nil,350],
			["FirstAidKit",nil,25]
		];
		if (side player == east) then
		{
			if (__GETC__(life_donator) >= 3) then {
				_return set[count _return,["arifle_Mk20C_plain_F",nil,25000]];
				_return set[count _return,["30Rnd_556x45_Stanag",nil,125]];
				_return set[count _return,["LMG_Mk200_F",nil,35000]];
				_return set[count _return,["200Rnd_65x39_cased_Box",nil,125]];
				_return set[count _return,["200Rnd_65x39_cased_Box_Tracer",nil,125]];
			};
		};
		if (side player in [civilian,east]) then
		{
			if (__GETC__(life_donator) >= 3) then {
				_return set[count _return,["hgun_pistol_heavy_01_F",nil,5850]];
				_return set[count _return,["11Rnd_45ACP_Mag",nil,85]];
				_return set[count _return,["optic_MRCO",nil,5000]];
				_return set[count _return,["U_C_Driver_1",nil,1000]];
				_return set[count _return,["H_RacingHelmet_1_F",nil,1000]];
				_return set[count _return,["U_C_Driver_2",nil,1000]];
				_return set[count _return,["H_RacingHelmet_2_F",nil,1000]];
				_return set[count _return,["U_C_Driver_3",nil,1000]];
				_return set[count _return,["H_RacingHelmet_3_F",nil,1000]];
				_return set[count _return,["U_C_Driver_4",nil,1000]];
				_return set[count _return,["H_RacingHelmet_4_F",nil,1000]];
			};
			_return set[count _return,["hgun_Rook40_F",nil,750]];
			_return set[count _return,["hgun_PDW2000_F",nil,6500]];
			_return set[count _return,["optic_ACO_grn_smg",nil,750]];
			_return set[count _return,["16Rnd_9x21_Mag",nil,25]];
			_return set[count _return,["30Rnd_9x21_Mag",nil,75]];
			_return set[count _return,["H_PilotHelmetHeli_O",nil,1000]];
			_return set[count _return,["U_B_PilotCoveralls",nil,1000]];
			_return set[count _return,["V_PlateCarrierH_CTRG",nil,1000]];
			_return set[count _return,["V_PlateCarrierIA2_dgtl",nil,1000]];
			_return set[count _return,["H_Cap_blk_CMMG",nil,1000]];
			_return set[count _return,["U_C_Journalist",nil,1000]];
			_return set[count _return,["V_Press_F",nil,1000]];
			_return set[count _return,["H_Shemag_tan",nil,1000]];
			_return set[count _return,["H_Cap_press",nil,1000]];
			_return set[count _return,["U_C_Scientist",nil,1000]];
			_return set[count _return,["U_NikosBody",nil,1000]];
		};

		if (__GETC__(life_adminlevel) > 0) then
		{
			_return set[count _return,["optic_Nightstalker",nil,100]];
			_return set[count _return,["optic_tws_mg",nil,100]];
		};
		if(true) exitWith{[format ["Donator Shop %1", __GETC__(life_donator)],_return]};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (!(playerSide in [civilian,east])): {"You are not a civilian/rebel!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
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
				["ItemMap",nil,100],
				["ItemGPS",nil,1000],
				["ToolKit",nil,2500],
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
