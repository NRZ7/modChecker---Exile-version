// **********************************************************************************************************
// * This project is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) 
// * https://creativecommons.org/licenses/by-sa/4.0/
// **********************************************************************************************************
//	@file Name: modCheckerDisplay.sqf
//	@file Author: NRZ7 (www.standarol.com)
//	@description: This script is a UI launched by modchecker.sqf. If any mod is not loaded, pop's a screen with detailed information and clickable community links (modCheckerDisplay.sqf).
//					You can configure custom messages and links to your community guides.

/*
	Some code is from
	File: rules.sqf
	For exile edited by Repentz
	Link: http://www.exilemod.com/topic/10375-advanced-server-rules-for-xm8/
*/

if ((firstCheck == 0) && (errorLevel > 0)) then { player allowdamage false }; // God Mode ON to avoid die and close dialog only if ModCheckerDisplay is auto opened.

disableSerialization;
[
	"",
	0,
	0.2,
	10,
	0,
	0,
	8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999; // 999999 needed to whitelist in infistar if you are using this.
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayctrl 2400;
_textSpoiler = _display displayctrl 1101;
_text2 = _display displayCtrl 1102;

/////////////////////////////////////////////////////////////////////////////////////////////
// Remember to add-delete-modify the same mod variable names like modChecker.sqf
/////////////////////////////////////////////////////////////////////////////////////////////

// Display header
_message = "";
_message = _message + "<t align='center' size='2' shadow='0'></t><br />";
_message = _message + "<t align='center' size='2' shadow='0'>Welcome to Mod Checker</t><br />";
_message = _message + "<t align='center'>______________________________________________________________________________________<br /><br />";
_message = _message + warnMessage;
_message = _message + "<t align='center'><br />";

//Mod variable names
_message = _message + checkExile;
_message = _message + checkEsseker;
_message = _message + checkRyan;
_message = _message + checkWeapons;
_message = _message + checkVehicles;
_message = _message + checkUnits;
_message = _message + checkTerrain;
_message = _message + checkCBA;

// Custom message with community links
_message = _message + "<br />";
_message = _message + "If you get any error, please, read the following links<br /><br />";
_message = _message + "Download the mods from <a href= 'http://steamcommunity.com/sharedfiles/filedetails/?id=752130537' color='#ff9900'>Steam Workshop</a> Only click on Subscribe!<br />";
_message = _message + "<a href= 'http://standarol.com/index.php/topic,674.0.html' color='#ff9900'>Guía de lanzamiento e instalación de mods [ESPAÑOL]</a> </t><br /><br />";

/////////////////////////////////////////////////////////////////////////////////////////////////////
// END OF CUSTOMIZABLE TEXT, DO NOT TOUCH UNDER THIS LINE IF YOU DON'T KWOW WHAT ARE YOU WANT
////////////////////////////////////////////////////////////////////////////////////////////////////

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlcommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;

//Waith until dialog is closed and kick the player  if a required mod is not loaded.
waitUntil {!dialog };
if (errorLevel > 90) then // non requiered addons have level 1. Requiered addons have error level 99.
	{
	endMission "LOSER"
	}
	else
	{
	firstCheck = 1; player allowDamage true // Disables God Mode protection and set mods as checked.
	};