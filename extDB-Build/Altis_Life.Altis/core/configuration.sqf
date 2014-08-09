#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_pylon = ObjNull;
life_barrier = ObjNull;
life_respawn_timer = 4; //Scaled in minutes
life_increased_respawn_timer = 15;
life_has_insurance = false;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_mining_hotkey_inuse = false; // Fix pressing actionkey + q to mine/gather faster
life_delay_pickaxe = false; // Try to fix Q spam
life_request_timer = false;
life_smartphoneTarget = ObjNull;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,FALSE); //Save Y-Inventory for civs and cops? (Medics excluded for now)

//Revive constant variables.
__CONST__(life_revive_cops,false); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,4000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
life_cash = 0;
__CONST__(life_impound_car,2500);
__CONST__(life_impound_boat,2500);
__CONST__(life_impound_air,10000);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 7000; //Starting Bank Money
		life_paycheck = 2500; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 5000; //Starting Bank Money
		life_paycheck = 350; //Paycheck Amount
	};
	
	case independent: {
		life_atmcash = 7500;
		life_paycheck = 2500;
	};
	
	case east: {
		life_atmcash = 5000;
		life_paycheck = 750;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_chemical",
	"life_inv_meth",
	"life_inv_medical",
	"life_inv_beer",
	"life_inv_blackbeer",
	"life_inv_vodca",
	"life_inv_wine",
	"life_inv_sekt",
	"life_inv_benzin",
	"life_inv_defib",
	"life_inv_paint",
	"life_inv_pylon",
	"life_inv_barrier",
	"life_inv_radartrap",
	"life_inv_ghilliepack"
	
	/*
	"life_inv_cocoa",
	"life_inv_milk",
	"life_inv_chocolate"
	*/
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_civ_benzin","civ"],
	["license_civ_chemical","civ"],
	["license_civ_medical","civ"],
	["license_civ_meth","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_med_car","med"],
	["license_civ_lawyer","civ"],
	["license_cop_sniper","cop"]

	/*
	["license_civ_chocolate","civ"],
	*/
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["marijuana",2000],["turtle",3000],["blastingcharge",10000],["boltcutter",500],["meth",6000],["cannabis",2000]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",45],
	["heroinu",1250],
	["heroinp",2850],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",900],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",1950],
	["turtle",9000],
	["water",5],
	["coffee",5],
	["turtlesoup",850],
	["donuts",60],
	["marijuana",2250],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",60],
	["cocaine",2200],
	["cocainep",3500],
	["diamond",750],
	["diamondc",2500],
	["iron_r",2400],
	["copper_r",800],
	["salt_r",1750],
	["glass",1000],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1550],
	["goldbar",95000],
	["chemical",1000],
	["oilp",1950],
	["benzin",2000],
	["medical",3900],
	["meth",6000],
	["defib",150],
	["paint",300],
	["pylon",50],
	["barrier",200],
	["radartrap",1500],
	["ghilliepack",1000]
	
	/*
	["cocoa",100],
	["milk",300],
	["chocolateWW",750]
	*/
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",7000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",1000],
	["pickaxe",2500],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["beer",150],
	["blackbeer",150],
	["vodca",150],
	["wine",150],
	["sekt",150],
	["defib",300],
	["paint",750],
	["pylon",50],
	["barrier",200],
	["radartrap",3000],
	["ghilliepack",2000]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["Binocular",0],
	["ItemGPS",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",0],
	["Chemlight_yellow",0],
	["Chemlight_green",0],
	["Chemlight_red",0],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",0],
	["acc_flashlight",0],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_Aco",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",0],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",0],
	["arifle_Mk20C_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",350],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",2500],
	["C_SUV_01_F",2500],
	["C_Hatchback_01_F",2500],
	["C_Hatchback_01_sport_F",2500],
	["C_Van_01_transport_F",2500],
	["C_Van_01_box_F",2500],
	["C_Van_01_fuel_F",2500],
	["I_Truck_02_transport_F",15000],
	["I_Truck_02_covered_F",15000],
	["I_Truck_02_fuel_F",15000],
	["B_Truck_01_transport_F",15000],
	["B_Truck_01_covered_F",15000],
	["B_Truck_01_box_F", 15000],
	["B_Truck_01_fuel_F",15000],
	["B_MRAP_01_F",20000],
	["O_MRAP_02_F",200000],
	["I_Heli_Transport_02_F",25000],
	["B_Heli_Light_01_F",20000],
	["O_Heli_Light_02_unarmed_F",20000],
	["I_Heli_light_03_unarmed_F",20000],
	["C_Rubberboat",2500],
	["C_Boat_Civil_01_F",2500],
	["B_Boat_Transport_01_F",2500],
	["C_Boat_Civil_01_police_F",2500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",20000],
	["O_Truck_03_device_F",20000],
	["O_Truck_03_covered_F",20000],
	["O_Truck_03_ammo_F",20000],
	["O_Truck_03_fuel_F",20000],
	["B_Heli_Transport_01_F",30000],
	["I_MRAP_03_F",25000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",950],
	["B_G_Offroad_01_F",3500],
	["C_Offroad_01_F",6500],
	["C_SUV_01_F",6500],
	["C_Hatchback_01_F",4500],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_transport_F",25000],
	["C_Van_01_box_F",35000],
	["C_Van_01_fuel_F",3850],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["I_Truck_02_fuel_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_covered_F",145000],
	["B_Truck_01_box_F", 150000],
	["B_Truck_01_fuel_F",135000],
	["B_MRAP_01_F",10000],
	["O_MRAP_02_F",65000],
	["I_MRAP_03_F",10000],
	["I_Heli_Transport_02_F",125000],
	["B_Heli_Light_01_F",57000],
	["O_Heli_Light_02_unarmed_F",72500],
	["I_Heli_light_03_unarmed_F",80000],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["O_Truck_03_device_F",80000],
	["O_Truck_03_covered_F",80000],
	["O_Truck_03_ammo_F",80000],
	["O_Truck_03_fuel_F",80000]
];
__CONST__(life_garage_sell,life_garage_sell);

life_medic_slots = ["medic_1","medic_2","medic_3","medic_4","medic_5","medic_6","medic_7","medic_8","medic_9","medic_10"];
life_adac_slots = ["adac_1","adac_2","adac_3","adac_4"];
life_adac_distress =[];
life_cop_olduniform = "";
life_god = false;
life_frozen = false;
life_markers = false;
