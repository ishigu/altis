/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\";
		_ret =
		[
			[_path + "Skins\heli_transport_02_1_ion_co.paa","civ",_path + "Skins\heli_transport_02_2_ion_co.paa",_path + "Skins\heli_transport_02_3_ion_co.paa"],
			[_path + "Skins\heli_transport_02_1_dahoman_co.paa","civ",_path + "Skins\heli_transport_02_2_dahoman_co.paa",_path + "Skins\heli_transport_02_3_dahoman_co.paa"],
			["textures\vehicles\heli_transport_braun.paa","civ",_path + "Skins\heli_transport_02_2_dahoman_co.paa",_path + "Skins\heli_transport_02_3_dahoman_co.paa"],
			["textures\vehicles\mohawk_ragecore_1.jpg","civ","textures\vehicles\mohawk_ragecore_2.jpg","textures\vehicles\mohawk_ragecore_3.jpg"],
			["textures\vehicles\mohawk_camo_1.jpg","civ","textures\vehicles\mohawk_camo_2.jpg","textures\vehicles\mohawk_camo_3.jpg"],
			[_path + "heli_transport_02_1_indp_co.paa","reb",_path + "heli_transport_02_2_indp_co.paa",_path + "heli_transport_02_3_indp_co.paa"]
		];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			[_path + "hatchback_01_ext_base09_co.paa","cop"],
			["textures\vehicles\hatchback_police.jpg","cop"]
		];
	};
		
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa","civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			/*["#(ai,64,64,1)Fresnel(0.3,3)","cop"],*/
			["textures\vehicles\offroad_polizei.paa","cop"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["textures\vehicles\offroad_polizei.paa","cop"],
			["textures\vehicles\offroad_greenfoot.paa","civ"],
			["textures\vehicles\offroad_tussi.paa","civ"],
			["textures\vehicles\offroad_baustellenfahrzeug.paa","civ"],
			["textures\vehicles\offroad_mario.paa","civ"],
			["textures\vehicles\offroad_monster.jpg","civ"],
			["textures\vehicles\offroad_nyan.jpg","civ"],
			["textures\vehicles\offroad_pokemon.jpg","civ"],
			["textures\vehicles\adac_offroad.paa","adac"],
			["#(ai,64,64,1)Fresnel(0.3,3)","cop"]
		];
	};
	
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
			["textures\vehicles\hatchback_pimp.jpg","civ"],
			["textures\vehicles\hatchback_kitty.jpg","civ"],
			["textures\vehicles\hatchback_blue.jpg","civ"],
			["textures\vehicles\hatchback_metallica.jpg","civ"],
			["textures\vehicles\hatchback_police.jpg","cop"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","cop"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["textures\vehicles\Suvweiss.paa","civ"],
			["textures\vehicles\SUV_polizei.paa","cop"],
			["textures\vehicles\SUV_var_02.paa","civ"],
			["textures\vehicles\SUV_var_03.paa","civ"],
			["textures\vehicles\suv_ragecore.jpg","civ"],
			["textures\vehicles\suv_batman.paa","civ"],
			["textures\vehicles\suv_superman.paa","civ"],
			["textures\vehicles\medic_suv.paa","med"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","cop"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["textures\vehicles\heli_light_01_polizei.paa","cop"],
			/*["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","cop"],*/
			["textures\vehicles\heli_light_01_polizei.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","civ"],
			["textures\vehicles\heli_light_01_weed.paa","civ"]
			
		];
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["textures\vehicles\orca_polizei.paa","cop"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","reb"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["textures\vehicles\heli_light_02_green.paa","civ"],
			["textures\vehicles\heli_light_02_orange.paa","civ"],
			["textures\vehicles\heli_light_02_grey.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","civ"],
			["textures\vehicles\medic_orca.paa","med"],
			["textures\vehicles\adac_orca.paa","adac"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			/*["\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"],*/
			["textures\vehicles\hunter_polizei_front2.paa","cop","#(argb,8,8,3)color(0.05,0.05,0.05,1)"]
			//["textures\vehicles\hunter_sek.paa","cop"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"],
			["textures\vehicles\zamak_blue.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["textures\vehicles\zamak_green.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["textures\vehicles\zamak_orange.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"],
			["textures\vehicles\zamak_blue.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["textures\vehicles\zamak_green.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["textures\vehicles\zamak_orange.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_indp_co.paa","reb","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_indp_co.paa"]
		];
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};

	case "I_Plane_Fighter_03_CAS_F":
	{
		_ret = 
		[
			["\a3\air_f_gamma\Plane_Fighter_03\Data\plane_fighter_03_body_1_indp_co.paa","civ"]
		];
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		_ret =
		[
			["textures\vehicles\hellcat_angry.jpg","civ"],
			["textures\vehicles\hellcat_angry.jpg","reb"],
			["textures\vehicles\hellcat_polizei.paa","cop"],
			["\a3\air_f_epb\Heli_Light_03\data\heli_light_03_base_indp_co","reb"]
		];
	};
	
	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["\a3\Soft_F_Beta\MRAP_03\Data\mrap_03_ext_co.paa","cop"],
			["textures\vehicles\strider_camo.paa","reb"],
			["textures\vehicles\ifrit_sand0.paa","reb"]
		];
	};
	
	case "O_MRAP_02_F":
	{
		_ret =
		[
			["textures\vehicles\ifrit_black.jpg","reb","textures\vehicles\ifrit_black.jpg"],
			["textures\vehicles\ifrit_death1.jpg","reb","textures\vehicles\ifrit_death2.jpg","textures\vehicles\ifrit_death3.jpg"],
			["textures\vehicles\ifrit_sand0.paa","reb","textures\vehicles\ifrit_sand1.paa","textures\vehicles\ifrit_sand0.paa"],
			["textures\vehicles\ifrit_gold.jpg","reb","textures\vehicles\ifrit_gold.jpg"],
			["textures\vehicles\ifrit_pixel.jpg","reb","textures\vehicles\ifrit_pixel.jpg"]
		];
	};
	
	case "B_Heli_Transport_01_F":
	{
		_ret =
		[
			["textures\vehicles\ghosthawk_police_ext_01.paa","cop","textures\vehicles\ghosthawk_police_ext_02.jpg"]
		];
		
	};
	
	case "B_Truck_01_covered_F":
	{
		_ret = 
		[
			["\a3\soft_f_beta\Truck_01\Data\truck_01_ext_01_co.paa","civ"]
		];
	};

	case "B_Truck_01_mover_F":
	{
		_ret = 
		[
			["textures\vehicles\adac_hemett_01.paa","adac","textures\vehicles\adac_hemett_02.paa"]
		];
	};
};

_ret;