/*
      Created by Mokomoko
      Date: 04.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
	  Edited by bonz, ishi
*/

private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption","_velocityUp"];

while{true} do 
{
	_vehicleToFuel = (vehicle player);
	if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && (_vehicleToFuel != player) ) then
	{
		_velocityUp = (velocity _vehicleToFuel select 2)*3;
		_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6 + _velocityUp;
		
		
		switch (typeOf (_vehicleToFuel)) do {
			case "B_Heli_Light_01_F":{_fuelConsumption = 0;}; // Hummingbird (already consumes enough)
			case "B_Heli_Transport_01_F":{_fuelConsumption = _velocityOfVehicle/280000 + 0.0001;}; // Ghost Hawk
			case "I_Heli_Transport_02_F":{_fuelConsumption = _velocityOfVehicle/280000 + 0.0001;}; // Mohawk
			case "I_Heli_light_03_unarmed_F":{_fuelConsumption = _velocityOfVehicle/280000 + 0.0001;}; // Hellcat
			case "O_Heli_Light_02_unarmed_F":{_fuelConsumption = _velocityOfVehicle/230000 + 0.0001;}; // Orca
			case "O_Truck_03_transport_F":{_fuelConsumption = _velocityOfVehicle/350000 + 0.0001;}; // Tempest Transport
			case "O_Truck_03_covered_F":{_fuelConsumption = _velocityOfVehicle/350000 + 0.0001;}; // Tempest Transport (Covered)
			case "O_Truck_03_ammo_F":{_fuelConsumption = _velocityOfVehicle/350000 + 0.0001;}; // Tempest Ammo
			case "O_Truck_03_fuel_F":{_fuelConsumption = _velocityOfVehicle/350000 + 0.0001;}; // Tempest Fuel
			case "O_Truck_03_device_F":{_fuelConsumption = _velocityOfVehicle/350000 + 0.0001;}; // Tempest (Device)
			case "B_Truck_01_mover_F":{_fuelConsumption = _velocityOfVehicle/250000 + 0.0001;}; // HEMTT
			case "B_Truck_01_box_F":{_fuelConsumption = _velocityOfVehicle/250000 + 0.0001;}; // HEMTT Box
			case "B_Truck_01_fuel_F":{_fuelConsumption = _velocityOfVehicle/250000 + 0.0001;}; // HEMTT Fuel
			case "B_Truck_01_transport_F":{_fuelConsumption = _velocityOfVehicle/250000 + 0.0001;}; // HEMTT Transport
			case "B_Truck_01_covered_F":{_fuelConsumption = _velocityOfVehicle/250000 + 0.0001;}; // HEMTT Transport (Covered)
            default {_fuelConsumption = _velocityOfVehicle/150000 + 0.0001;}
        };
		
		if(_fuelConsumption > 0.002) then
		{
			_fuelConsumption = 0.002;
		};
		_vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);
		
		//hint format["Benzinverbrauch: %1L/km",_fuelConsumption*10000];

		if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
		{
			hint "Du fährst auf Reserve. Du solltest eine Tankstelle aufsuchen!";
		}
		else
		{
			if(fuel _vehicleToFuel < 0.03) then
			{
				hint "Der Tank ist leer!";
			};
		};
	};
	sleep 2;
};