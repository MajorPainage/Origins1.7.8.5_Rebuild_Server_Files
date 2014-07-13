///////////////////////////////////////////////////////
///Use the built in mission system (config file for mission system in mission folder)
ai_mission_sysyem = True;

///////////////////////////////////////////////////////
/// clears all Weapons and Magazines off body on death
ai_clear_body = False;

/// Clears dead bodies after given time
ai_clean_dead = True;

/// Time (in seconds) after which a dead body will be cleaned up
cleanup_time = 1800;
///////////////////////////////////////////////////////
/// Sets radius for AI patrols (call spawn_group)
ai_patrol_radius = 5;

/// Sets number of waypoints to add in patrol area (call spawn_group)
ai_patrol_radius_wp = 5;

/// Sets behavior of AI groups 
ai_combatmode = "RED";
ai_behaviour = "Stealth";

///////////////////////////////////////////////////////
/// Turns on AI info sharing (Makes them very hard even on low skill settings)
ai_ahare_info = True;

/// Distance AI will let other enemies know of your position (currently only on kill) 
ai_share_distance = 100;

///////////////////////////////////////////////////////
/// Gain humanity for killing an AI unit (True: is on. False: is off.) 
ai_humanity_gain = True;

/// Humanity added for AI kill 
ai_add_humanity = 50;

/// Adds bandit kill when killing an AI (True: on. False: off.)
ai_banditkills_gain = True;

///////////////////////////////////////////////////////
/// Allows you to set a custom skill array for units. (True: will use these arrays. False: will use number in spawn array)
ai_custom_skills = True;

/// Custom skill array. Use 0 to use this with ai_custom_skills = True 
ai_custom_array1 = [
["aimingAccuracy",0.80],
["aimingShake",0.70],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

/// Custom skill array. Use 1 to use this with ai_custom_skills = True 
ai_custom_array2 = [
["aimingAccuracy",0.85],
["aimingShake",0.70],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

/// Custom skill array. Use 2 to use this with ai_custom_skills = True 
ai_custom_array3 = [
["aimingAccuracy",0.80],
["aimingShake",0.70],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

/// Arrays used in "Random" custom skill 
ai_skill_random = [ai_custom_array1,ai_custom_array2,ai_custom_array3];

///////////////////////////////////////////////////////
/// Allows AI on static guns to have a loadout 
ai_static_useweapon = True;

/// Allows you to set custom array for AI on static weapons. (True: On False: Off) 
ai_static_skills = True;

/// Custom skill array. Use this with ai_static_skills = True;
ai_static_array = [
["aimingAccuracy",0.85],
["aimingShake",0.70],
["aimingSpeed",0.75],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

///////////////////////////////////////////////////////
/// Gearset arrays for unit Loadouts ///

/// 0 ///
ai_gear0 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemRadio","ItemFlashlight"]
];

/// 1 ///
ai_gear1 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemRadio","ItemFlashlight"]
];

/// 2 ///
ai_gear2 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemRadio","ItemFlashlight"]
];

/// 3 ///
ai_gear3 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemRadio","ItemFlashlight"]
];

/// 4 ///
ai_gear4 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemRadio","ItemFlashlight"]
];

/// Gearsets to use if set to "Random" ///
ai_gear_random = [ai_gear0,ai_gear1,ai_gear2,ai_gear3,ai_gear4];

///////////////////////////////////////////////////////
/// Weapon arrays for unit Loadouts ///
/// Format is ["Gun","Ammo"] ///

/// 0 ///
ai_wep0 = [
["AKS_74_UN_kobra","30Rnd_545x39_AKSD"], 
["M4A3_CCO_EP1","30Rnd_556x45_Stanag"], 
["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"], 
["M16A4","30Rnd_556x45_Stanag"], 
["m8_carbine","30Rnd_556x45_Stanag"], 
["BAF_L85A2_RIS_Holo","30Rnd_556x45_Stanag"], 
["Sa58V_CCO_EP1","30Rnd_762x39_AK47"]
];

/// 1 ///
ai_wep1 = [
["AK_107_pso","30Rnd_545x39_AK"], 
["M16A4_ACG","30Rnd_556x45_Stanag"], 
["Sa58V_RCO_EP1","30Rnd_762x39_AK47"], 
["SCAR_L_STD_Mk4CQT","30Rnd_556x45_Stanag"], 
["BAF_L86A2_ACOG","30Rnd_556x45_Stanag"], 
["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"], 
["M14_EP1","20Rnd_762x51_DMR"], 
["M8_sharpshooter","30Rnd_556x45_Stanag"]
];

/// 2 ///
ai_wep2 = [
["AK_107_GL_pso","30Rnd_545x39_AK"], 
["AK_107_GL_kobra","30Rnd_545x39_AK"], 
["M4A1_HWS_GL","30Rnd_556x45_Stanag"], 
["M16A4_ACG_GL","30Rnd_556x45_Stanag"], 
["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"], 
["SCAR_L_STD_EGLM_RCO","30Rnd_556x45_Stanag"], 
["BAF_L86A2_ACOG","30Rnd_556x45_Stanag"], 
["M4A3_RCO_GL_EP1","30Rnd_556x45_Stanag"]
];

/// 3 ///
ai_wep3 = [ 
["SCAR_H_STD_EGLM_Spect","20rnd_762x51_B_SCAR"], 
["M110_NVG_EP1","20rnd_762x51_B_SCAR"], 
["SCAR_H_LNG_Sniper_SD","20rnd_762x51_SB_SCAR"], 
["SVD_CAMO","10Rnd_762x54_SVD"], 
["VSS_Vintorez","20Rnd_9x39_SP5_VSS"], 
["DMR","20Rnd_762x51_DMR"], 
["M40A3","5Rnd_762x51_M24"]
];

/// 4 ///
ai_wep4 = [
["RPK_74","75Rnd_545x39_RPK"], 
["MK_48_DZ","100Rnd_762x51_M240"], 
["M249_DZ","200Rnd_556x45_M249"], 
["M240_DZ","100Rnd_762x51_M240"]
];

/// Arrays used in "Random" for weapons///
ai_wep_random = [ai_wep0,ai_wep1,ai_wep2,ai_wep3,ai_wep4];

///////////////////////////////////////////////////////
/// Backpacks used when "" for random ///
ai_packs = [
"DZ_Patrol_Pack_EP1",
"DZ_ALICE_Pack_EP1",
"DZ_CivilBackpack_EP1",
"DZ_Backpack_EP1",
"O_TravelerPack_1",
"ori_30l_Backpack"
];

///////////////////////////////////////////////////////
/// Skins used when "" for random ///
ai_skin = [
"Bandit1_DZ",
"Bandit1_1DZ",
"Bandit1_2DZ",
"Bandit1_3DZ",
"Bandit1_3_1DZ",
"Bandit1_3_2DZ",
"Bandit2_1DZ",
"Bandit2_2DZ",
"Bandit2_3DZ",
"Bandit2_4DZ",
"Bandit2_5DZ",
"Bandit3_1",
"Bandit_S_DZ",
"Hero2_1DZ",
"Hero2_2DZ",
"Hero2_3DZ",
"Hero2_4DZ",
"Hero2_5DZ",
"Hero2_10DZ",
"Hero3_1DZ",
"Hero3_2DZ",
"Hero3_3DZ",
"Hero3_4DZ",
"Hero3_5DZ",
"Hero3_6DZ"
];
//////////////////////////////////////////////////////
WAIconfigloaded = True;