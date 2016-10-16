// **********************************************************************************************************
// * This project is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) 
// * https://creativecommons.org/licenses/by-sa/4.0/
// **********************************************************************************************************
//	@file Name: modmodChecker.sqf
//	@file Author: NRZ7 (www.standarol.com)
//	@description: This script modCheck the mods loaded by the client. If any mod is not loaded, pop's a screen with detailed information and clickable community links (modmodCheckerDisplay.sqf).
//					You can configure requiered addons (error 99) or optional addons (error 1). If any required mod fails, the client load "You Loose" screen after close the dialog.

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Exile_Client Example - READ TO UNDERSTAND - DO NOT TOUCH - READ - DO NOT TOUCH - READ - DO NOT TOUCH
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Change "Exile_Client" to name of the CfgPatches from desired mod.
// You can find under editor. ("Tools" - "Config Viewer" - "Configfile" - "CfgPatches")
if (isClass(configFile >> "CfgPatches" >> "Exile_Client")) then  
	{  
// Change modCheckExile to your desired and unique mod variable name
// Change "Exile Mod is" to your mod string. For advanced users, can change size, color, allign, etc.
		modCheckExile =  "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Exile Mod is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
// Change "Exile Mod is" to your mod string
	modCheckExile = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Exile Mod is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
// Set 99 to Required, Set 1 to optional
	errorLevel = errorLevel + 99
	};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// START OF MODS CONFIG - EDIT OR DELETE UNDER THIS LINE
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
// Esseker Example - DELETE OR MODIFY
if (isClass(configFile >> "CfgPatches" >> "Esseker")) then  
	{  
		modCheckEsseker = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Esseker Map is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		modCheckEsseker = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Esseker Map is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 99
	};

// Zombis & Demonds Example - DELETE OR MODIFY
if (isClass(configFile >> "CfgPatches" >> "Ryanzombies")) then  
	{  
		modCheckRyan = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Zombies and Demonds is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		modCheckRyan = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>Zombies and Demonds is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 99
	};

// CUP_Weapons Example - DELETE OR MODIFY
if (isClass(configFile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore")) then  
	{  
		modCheckWeapons = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Weapons is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		modCheckWeapons = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Weapons is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 99
	};

// CUP_Vehicles Example - DELETE OR MODIFY
if (isClass(configFile >> "CfgPatches" >> "CUP_Vehicles_Core")) then  
	{  
		modCheckVehicles = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Vehicles is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		modCheckVehicles = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Vehicles is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 99
	};

// CUP_TerrainCore Example - DELETE OR MODIFY
if (isClass(configFile >> "CfgPatches" >> "CUP_Worlds")) then  
	{  
		modCheckTerrain = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Terrain Core is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		modCheckTerrain = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Terrain Core is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 1
	};

// CUP_Units Example - DELETE OR MODIFY
if (isClass(configFile >> "CfgPatches" >> "CUP_Creatures_People_Core")) then  
	{  
		modCheckUnits = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Units is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		modCheckUnits = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CUP Units is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 99
	};

// Community Base Addon Example - DELETE OR MODIFY
if (isClass(configFile >> "CfgPatches" >> "CBA_main")) then  
	{  
		modCheckCBA = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CBA_A3 is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		modCheckCBA = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>CBA_A3 is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 1
	};

	
// YOU CAN ADD MORE MODS, ADD FOR EACH SOME CODE LIKE THIS
	
/*
if (isClass(configFile >> "CfgPatches" >> "YOUR_MOD_CLASSNAME")) then  
	{  
		modCheckYOURMOD = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>YOUR MOD is</t><t color='#2fd402' size='0.9' shadow='1' shadowColor='#000000' align='center'> found!</t><br/>";
	} else { 
		modCheckYOURMOD = "<t size='0.9' shadow='1' shadowColor='#000000' align='center'>YOUR MOD is</t><t color='#ff0000' size='0.9' shadow='1' shadowColor='#000000' align='center'> NOT FOUND!</t><br/>";
		errorLevel = errorLevel + 1
	};
*/
