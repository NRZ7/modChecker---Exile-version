// Add this at the bottom of initPlayerLocal.sqf

///////////////////////////////////////////////////////////////////////////
// MOD CHECKER
///////////////////////////////////////////////////////////////////////////

waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''}; // wait until player is in spawned
uiSleep 3;

firstCheck = 0; 
execVM "addons\modChecker\init\modCheckerInit.sqf";

/*Note, if you have Exile ProtectionRemember.sqf, use this

///////////////////////////////////////////////////////////////////////////
// MOD CHECKER + PROTECTION REMEMBER
///////////////////////////////////////////////////////////////////////////

waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''}; // wait until player is in spawned
uiSleep 3;
execVM "addons\scripts\protectionRemember.sqf";
firstCheck = 0; 
execVM "addons\modChecker\modChecker.sqf";

*/