#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};

	case "adac_shop":
	{
		_return = [
			["C_Offroad_01_F",5000]
		];
	};
	
	case "adac_air_hs": {
		_return = [
			["O_Heli_Light_02_unarmed_F",5000]
		];
	};

	case "med_shop":
	{
		_return = [
			["C_SUV_01_F",5000]
		];
	};
	
	case "med_air_hs": {
		_return = [
			["O_Heli_Light_02_unarmed_F",5000]
		];
	};

	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",6000],
			["C_Offroad_01_F",10000],
			["C_SUV_01_F",15000],
			["C_Van_01_transport_F",30000]
		];
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",75000],
			["C_Van_01_Fuel_F",75000],
			["I_Truck_02_transport_F",100000],
			["I_Truck_02_covered_F",150000],
			["I_Truck_02_fuel_F",150000],
			["B_Truck_01_transport_F",300000],
			["B_Truck_01_covered_F",330000],
			["B_Truck_01_fuel_F",330000]
		];	
	};
	
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",10000],
			["O_MRAP_02_F",750000],
			["B_Heli_Light_01_F",250000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",800000]];
		};
	};
	
	case "cop_car":
	{
		_return set[count _return,["C_Hatchback_01_F",5000]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["C_SUV_01_F",15000]];			
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,["B_MRAP_01_F",30000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,["I_MRAP_03_F",80000]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,["C_Offroad_01_F",5000]];
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",350000],
			["O_Heli_Light_02_unarmed_F",1000000],
			["I_Heli_light_03_unarmed_F",2300000]
		];
	};
	
	case "cop_air":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["B_Heli_Light_01_F",75000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,["B_Heli_Transport_01_F",200000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
		};
	};
	
	case "cop_airhq":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["B_Heli_Light_01_F",75000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,["B_Heli_Transport_01_F",200000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["O_Lifeboat",5000],
			["O_Boat_Transport_01_F",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "cop_ship":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["B_Boat_Transport_01_F",3000]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,["C_Boat_Civil_01_police_F",20000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,["B_Boat_Armed_01_minigun_F",75000]];
			_return set[count _return,["B_SDV_01_F",100000]];
		};
	};
	
	case "medic_car_1":
	{
		_return =
		[
			["C_SUV_01_F",20000]
		];
	};
	
	case "medic_air_1":
	{
		_return =
		[
			["O_Heli_Light_02_unarmed_F",50000]
		];
	};
	
	case "donator":
	{
		_return =
		[

		];
		
		if(__GETC__(life_donator) > 0) then
		{
			_return =
			[
				["C_Hatchback_01_sport_F",10000],
				["B_Quadbike_01_F",1500],
				["C_Offroad_01_F",5000],
				["C_SUV_01_F",15000]
			];
		};
		if(__GETC__(life_donator) > 1) then
		{
			_return set[count _return,["B_Truck_01_box_F",250000]];
			_return set[count _return,["B_Heli_Light_01_F",200000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",600000]];
		};
		if(__GETC__(life_donator) > 2) then
		{
			_return set[count _return,["C_Kart_01_Fuel_F",10000]];
			_return set[count _return,["C_Kart_01_Vrana_F",10000]];
			_return set[count _return,["C_Kart_01_Blu_F",10000]];
			_return set[count _return,["C_Kart_01_Red_F",10000]];
			_return set[count _return,["O_Truck_03_device_F",500000]];
			_return set[count _return,["O_Truck_03_covered_F",500000]];
			_return set[count _return,["O_Truck_03_ammo_F",500000]];
			_return set[count _return,["O_Truck_03_fuel_F",500000]];
			_return set[count _return,["I_Heli_Transport_02_F",1200000]];
			_return set[count _return,["I_Heli_light_03_unarmed_F",1000000]];
		};
	};
	
	case "donator_airport":
	{
		_return =
		[

		];

		if(__GETC__(life_donator) > 1) then
		{;
			_return set[count _return,["B_Heli_Light_01_F",200000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",600000]];
		};
		if(__GETC__(life_donator) > 2) then
		{
			_return set[count _return,["I_Heli_Transport_02_F",1200000]];
			_return set[count _return,["I_Heli_light_03_unarmed_F",1000000]];
		};
	};
	
	case "donator_heli":
	{
		_return =
		[
			["B_Heli_Light_01_F",100000],
			["I_Heli_light_03_unarmed_F",175000],
			["I_Heli_Transport_02_F",650000]
		];
	};
	
	case "donator_car":
	{
		_return =
		[
			["B_Quadbike_01_F",500],
			["C_Offroad_01_F",2500],
			["C_Hatchback_01_sport_F",10000],
			["C_SUV_01_F",20000],
			["C_Van_01_fuel_F",7500]
		];
	};
};

_return;
