/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rot";};
			case 1: {_color = "Gelb";};
			case 2: {_color = "Weiss";};
			case 3: {_color = "Blau";};
			case 4: {_color = "Dunkel Rot";};
			case 5: {_color = "Blau / Weiss"};
			case 6: {_color = "Schwarz"};
			case 7: {_color = "Taxi"};
			case 8: {_color = "Polizei"};
			case 9: {_color = "Tussy"};
			case 10: {_color = "Monster"};
			case 11: {_color = "Adac"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
		case 0: {_color = "Angry"};
		};
	};
	
	case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
		case 0: {_color = "Polizei"};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Gruen";};
			case 2: {_color = "Blau";};
			case 3: {_color = "Dunkel Blau";};
			case 4: {_color = "Gelb";};
			case 5: {_color = "Weiss"};
			case 6: {_color = "Grau"};
			case 7: {_color = "Schwarz"};
			case 8:  {_color = "Metallica"};
			case 9: {_color = "Polizei"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rot"};
			case 1: {_color = "Dunkel Blau"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Schwarz / Weiss"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Gruen"};
			case 6: {_color = "Schwarz Metallic"};
			case 7: {_color = "Schwarz"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "Silver";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Weiss";};
			case 4: {_color = "Polizei";};
			case 5: {_color = "Carbon";};
			case 6: {_color = "Batman";};
			case 7: {_color = "Superman";};
			case 8: {_color = "Notarzt";};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
		};
	};
	
	case "B_Quadbike_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Braun"};
			case 1: {_color = "Digital Braun"};
			case 2: {_color = "Schwarz"};
			case 3: {_color = "Blau"};
			case 4: {_color = "Rot"};
			case 5: {_color = "Weiss"};
			case 6: {_color = "Digital Gruen"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebell Camo"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
			case 1: {_color = "Black"};
			case 2: {_color = "Civ Blue"};
			case 3: {_color = "Civ Red"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blue"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Rebellen Digital"};
			case 14: {_color = "Gruen/Braun"};
			case 15: {_color = "Weed"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Weiss / Blau"};
			case 2: {_color = "Digital Gruen"};
			case 3: {_color = "Digital Braun"};
			case 4: {_color = "Weiss / Gruen"};
			case 5: {_color = "Weiss / Orange"};
			case 6: {_color = "Weiss / Grau"};
			case 7: {_color = "Schwarz"};
			case 8: {_color = "Notarzt"};
			case 9: {_color = "Adac"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Regular"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Polizei"};
		};
	};
	
	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Regular"};
			case 1: {_color = "Camo"};
			case 2: {_color = "Sand"};
		};
	};
	
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
		case 0: {_color = "Black"};
		case 1: {_color = "Sand"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rot"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Blau"};
			case 3: {_color = "Gruen"};
			case 4: {_color = "Orange"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rot"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Blau"};
			case 3: {_color = "Gruen"};
			case 4: {_color = "Orange"};
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
			case 2: {_color = "Braun"};
			case 3: {_color = "RageCore"};
			case 4: {_color = "Camo"};			
		};
	};

	case "B_Truck_01_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Regulear"};
		};
	};

};

_color;