/*
	DZMSAIConfig.sqf
	This is a configuration for the AI that spawn at missions.
	This includes their skin, weapons, gear, and skills.
	You can adjust these to your liking, but it is for advanced users.
*/

///////////////////////////////////////////////
// Array of skin classnames for the AI to use
DZMSBanditSkins = ["Bandit1_DZ","Bandit2_3DZ"];

////////////////////////
// Array of AI Skills
DZMSSkills0 = [
	["aimingAccuracy",0.05,0.115],
	["aimingShake",0.35,0.45],
	["aimingSpeed",0.35,0.45],
	["endurance",0.30,0.40],
	["spotDistance",0.20,0.35],
	["spotTime",0.20,0.35],
	["courage",0.30,0.50],
	["reloadSpeed",0.40,0.50],
	["commanding",0.30,0.40],
	["general",0.30,0.50]
];

DZMSSkills1 = [
	["aimingAccuracy",0.105,0.13],
	["aimingShake",0.50,0.60],
	["aimingSpeed",0.50,0.60],
	["endurance",0.45,0.55],
	["spotDistance",0.35,0.50],
	["spotTime",0.35,0.50],
	["courage",0.45,0.65],
	["reloadSpeed",0.50,0.60],
	["commanding",0.45,0.55],
	["general",0.45,0.65]
];

DZMSSkills2 = [
	["aimingAccuracy",0.12,0.15],
	["aimingShake",0.65,0.75],
	["aimingSpeed",0.60,0.70],
	["endurance",0.60,0.70],
	["spotDistance",0.50,0.65],
	["spotTime",0.50,0.65],
	["courage",0.60,0.80],
	["reloadSpeed",0.60,0.70],
	["commanding",0.60,0.80],
	["general",0.60,0.80]
];

DZMSSkills3 = [	
	["aimingAccuracy",0.15,0.18],
	["aimingShake",0.75,0.85],
	["aimingSpeed",0.70,0.80],
	["endurance",0.70,0.80],
	["spotDistance",0.60,0.75],
	["spotTime",0.60,0.75],
	["courage",0.70,0.90],
	["reloadSpeed",0.70,0.80],
	["commanding",0.70,0.80],
	["general",0.70,0.90]
];

//////////////////////////////////////////////////////////////
// This is the primary weaponlist that can be assigned to AI
// These are assigned based on AI difficulty level
DZMSWeps0 = [
"M16A2",
"M16A2GL",
"AK_74",
"M4A1_Aim",
"AKS_74_kobra",
"AKS_74_U",
"AK_47_M",
"M24",
"M1014",
"DMR",
"M4A1",
"M14_EP1",
"Remington870_lamp",
"MP5A5",
"MP5SD",
"M4A3_CCO_EP1"
];

DZMSWeps1 = [
"M16A2",
"M16A2GL",
"M249_DZ",
"AK_74",
"M4A1_Aim",
"AKS_74_kobra",
"AKS_74_U",
"AK_47_M",
"M24",
"SVD_CAMO",
"M1014",
"DMR",
"M4A1",
"M14_EP1",
"Remington870_lamp",
"M240_DZ",
"M4A1_AIM_SD_camo",
"M16A4_ACG",
"M4A1_HWS_GL_camo",
"Mk_48_DZ",
"M4A3_CCO_EP1",
"Sa58V_RCO_EP1",
"Sa58V_CCO_EP1",
"M40A3",
"Sa58P_EP1",
"Sa58V_EP1"
];

DZMSWeps2 = [
"FN_FAL",
"FN_FAL_ANPVS4",
"Mk_48_DZ",
"M249_DZ",
"BAF_L85A2_RIS_Holo",
"G36C",
"G36C_camo",
"G36A_camo",
"G36K_camo",
"AK_47_M",
"AKS_74_U",
"M14_EP1",
"bizon_silenced",
"DMR",
"RPK_74"
];

DZMSWeps3 = [
"FN_FAL",
"FN_FAL_ANPVS4",
"Mk_48_DZ",
"M249_DZ",
"BAF_L85A2_RIS_Holo",
"G36C",
"G36C_camo",
"G36A_camo",
"G36K_camo",
"AK_47_M",
"AKS_74_U",
"M14_EP1",
"bizon_silenced",
"DMR",
"RPK_74"
];

/////////////////////////////////////////////////////////////
// These are gear sets that will be randomly given to the AI
// They are all the same, but can be customized.
DZMSGear0 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear1 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear2 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear3 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

DZMSGear4 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

////////////////////////////////////////////////////////////
// These are the backpacks that can be assigned to AI units.
DZMSPacklist = [
"DZ_Patrol_Pack_EP1",
"DZ_ALICE_Pack_EP1",
"DZ_CivilBackpack_EP1",
"DZ_Backpack_EP1",
"O_TravelerPack_1",
"ori_30l_Backpack"
];