// **********************************************************************************************************
// * This project is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) 
// * https://creativecommons.org/licenses/by-sa/4.0/
// **********************************************************************************************************
//	@file Name: modChecker.sqf
//	@file Author: NRZ7 (www.standarol.com)
//	@description: This script check the mods loaded by the client. If any mod is not loaded, pop's a screen with detailed information and clickable community links (modCheckerDisplay.sqf).
//					You can configure requiered addons (error 99) or optional addons (error 1). If any required mod fails, the client load "You Loose" screen after close the dialog.
//			

		
errorLevel = 0;


// Exile_Client Example
// Change "Exile_Client" to name of the Cfg patche from desired mod
if (isClass(configFile >> "CfgPatches" >> "Exile_Client")) then  {  
// Change checkExile to your desired mod variable name
// Change "Exile Mod is" to your mod string
		checkExile =  "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Exile Mod is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
// Change "Exile Mod is" to your mod string
	checkExile = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Exile Mod is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
// Set 99 to Required, Set 1 to optional
	errorLevel = errorLevel + 99
	};

// Esseker Example
if (isClass(configFile >> "CfgPatches" >> "Esseker")) then  {  
		checkEsseker = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Esseker Map is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		checkEsseker = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Esseker Map is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 99
	};

// Zombis & Demonds Example
if (isClass(configFile >> "CfgPatches" >> "Ryanzombies")) then  {  
		checkRyan = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Zombies and Demonds is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		checkRyan = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Zombies and Demonds is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 99
	};

// CUP_Weapons Example
if (isClass(configFile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore")) then  {  
		checkWeapons = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Weapons is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		checkWeapons = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Weapons is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 1
	};

// CUP_Vehicles Example
if (isClass(configFile >> "CfgPatches" >> "CUP_Vehicles_Core")) then  {  
		checkVehicles = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Vehicles is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		checkVehicles = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Vehicles is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 1
	};

// CUP_TerrainCore Example
if (isClass(configFile >> "CfgPatches" >> "CUP_Worlds")) then  {  
		checkTerrain = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Terrain Core is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		checkTerrain = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Terrain Core is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 1
	};

// CUP_Units Example
if (isClass(configFile >> "CfgPatches" >> "CUP_Creatures_People_Core")) then  {  
		checkUnits = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Units is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		checkUnits = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Units is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 1
	};

// Community Base Addon Example
if (isClass(configFile >> "CfgPatches" >> "CBA_main")) then  
	{  
		checkCBA = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CBA_A3 is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		checkCBA = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CBA_A3 is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 1
	};

if (errorLevel > 0) then {
	warnMessage =  "<t color='#ff0000' size='1.3' shadow='1' shadowColor='#000000' align='center'>Some is WRONG with your MODS</t><br/>";
	} else {
	warnMessage = "<t color='#2fd402' size='1.3' shadow='1' shadowColor='#000000' align='center'>All MODS are FINE</t><br/>";
	};
	
if ((errorLevel == 0) && (firstCheck == 0)) then {
	firstCheck = 1 // Do nothing
	} else {
	execVM "addons\modChecker\modCheckerDisplay.sqf"
	};

// execVM "addons\modChecker\modCheckerDisplay.sqf"


