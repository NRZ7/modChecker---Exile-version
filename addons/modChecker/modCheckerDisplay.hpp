// **********************************************************************************************************
// * This project is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) 
// * https://creativecommons.org/licenses/by-sa/4.0/
// **********************************************************************************************************
//	@file Name: modCheckerDisplay.sqf
//	@file Author: NRZ7 (www.standarol.com) and Repentz
//	@description: This script is a UI launched by modchecker.sqf. If any mod is not loaded, pop's a screen with detailed information and clickable community links (modCheckerDisplay.sqf).
//					You can configure custom messages and links to your community guides.

/////////////////////////////////////////////////////////////////////////////////////////////
// 							CUSTOMIZABLE PART HERE
// Remember to add-delete-modify the same mod variable names used in modCheckerConfig.hpp
/////////////////////////////////////////////////////////////////////////////////////////////

// Display header
_message = "";
_message = _message + "<t align='center' size='2' shadow='0'></t><br />";
_message = _message + "<t align='center' size='2' shadow='0'>Welcome to Mod Checker</t><br />";
_message = _message + "<t align='center'>______________________________________________________________________________________<br /><br />";
_message = _message + warnMessage;
_message = _message + "<t align='center'><br />";

//Mod variable names - MODIFY HERE
_message = _message + checkExile;
_message = _message + checkEsseker;
_message = _message + checkRyan;
_message = _message + checkWeapons;
_message = _message + checkVehicles;
_message = _message + checkUnits;
_message = _message + checkTerrain;
_message = _message + checkCBA;

// Custom message with community links - MODIFY HERE
_message = _message + "<br />";
_message = _message + "If you get any error, please, read the following links<br /><br />";
_message = _message + "Download the mods from <a href= 'http://steamcommunity.com/sharedfiles/filedetails/?id=752130537' color='#ff9900'>Steam Workshop</a> Only click on Subscribe!<br />";
_message = _message + "<a href= 'http://standarol.com/index.php/topic,674.0.html' color='#ff9900'>Guía de lanzamiento e instalación de mods [ESPAÑOL]</a> </t><br /><br />";