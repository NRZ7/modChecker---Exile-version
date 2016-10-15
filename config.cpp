class CfgXM8
{
    extraApps[] = {"ExAd_modChecker"};
	
	class ExAd_modChecker 
	{
		title = "Mod Checker";
		controlID = 99999;
		logo = "ExadClient\XM8\Apps\modChecker\modChecker.paa";
		onLoad = "ExAdClient\XM8\Apps\modChecker\onLoad.sqf";
		onOpen = "ExAdClient\XM8\Apps\modChecker\onOpen.sqf";
		onClose = "ExAdClient\XM8\Apps\modChecker\onClose.sqf";
	};
};  