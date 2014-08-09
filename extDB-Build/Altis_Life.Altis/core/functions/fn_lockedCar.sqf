/*
      Created by Shentoza
	  Date: 09.08.
	  Checks if the vehicle is locked, and disables the HUD ( therefore any interaction with the vehicle)
*/

private["_vehicle"];
while{true} do 
{
	waitUntil{
	_vehicle = cursorTarget;
	!isNull _vehicle && (player distance _vehicle < 5) && locked _vehicle == 2 &&!(_vehicle in life_vehicles)};
	showHUD false;
	waitUntil{_vehicle = cursorTarget;
	isNull _vehicle || locked _vehicle == 0 || (player distance _vehicle >= 5) || (_vehicle in life_vehicles)};
	showHUD true;
};