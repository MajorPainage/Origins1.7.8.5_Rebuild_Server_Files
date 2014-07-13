// Time between missions (seconds)
wai_mission_timer = 600;

// How long before a mission times out (seconds)
wai_mission_timeout = 1800;

// missions used when selecting the next random mission
wai_missions = [
"bandit_base",
"armed_vehicle",
"disabled_civchopper",
"crash_spawner",
"disabled_milchopper",
"MV22",
"weapon_cache",
"mayors_mansion",
"convoy",
"C130_crash",
"ems_cache",
"medi_camp",
"Ural"
];

// fuel the mission vehicles spawn with 0-100.
wai_mission_fuel = .5;

// armed vehicles to spawn in missions
armed_vehicle = [
"KamazOpen_Ori",
"Kamaz_Ori",
"LandRover_MG_Ori",
"Offroad_MG_Ori",
"UAZ_MG_Ori",
"Pickup_PK_Ori",
"HMMWV_Ori"
];

//armed helis to spawn in missions
armed_chopper = [
"HC3_Merlin_Ori",
"Mi171ShCZ_Ori",
"UH1H_Ori",
"MH60S_Ori",
"Ka60c_Ori"
];

// civilian aircraft to spawn in missions
civil_aircraft = [
"AH6X_Ori",
"MH6J_Ori",
"Mi17_Civilian_Ori",
"AN2_Ori",
"MV22_Ori"
];

// military unarmed vehicles to spawn in missions
military_unarmed = [
"Zodiac_Ori",
"PBX_Ori",
"ori_p85_originsmod_CUCV",
"ori_p85_originsmod_cucv_pickup",
"HMMWV_Ori",
"ori_vil_lada_2105_rust",
"ori_rth_originsmod_bathmobile",
"ori_vil_originsmod_volvo_fl290",
"ori_vil_originsmod_lublin_truck",
"ori_scrapTank",
"ori_ScrapBuggy",
"ori_survivorBus"
];

// cargo trucks to spawn in missions
cargo_trucks = [
"ori_vil_truck_civ_base",
"ori_vil_originsmod_truck_civ",
"ori_vil_originsmod_truck_civ1",
"ori_vil_originsmod_truck_civ2"
];

// refuel trucks to spawn in missions
refuel_trucks = [
"ori_vil_truck_civ_base",
"ori_vil_originsmod_truck_civ",
"ori_vil_originsmod_truck_civ1",
"ori_vil_originsmod_truck_civ2"
];

// civilian vehicles to spawn in missions
civil_vehicles = [
"ori_vil_lada_2105_rust",
"ori_p85_originsmod_CUCV",
"ori_p85_originsmod_cucv_pickup"
];

// Number of guns to spawn in ammo boxes 
wai_mission_numberofguns = 8;
// classnames of guns to spawn in ammo boxes (only class weapons)
ammo_box_guns = [
"M9SD",
"M9",
"AKS_74_UN_kobra",
"AK_107_pso",
"AK_107_GL_pso",
"AK_107_GL_kobra",
"M4A3_CCO_EP1",
"M4A1_AIM_SD_camo",
"M16A4_ACG",
"VSS_vintorez",
"M8_sharpshooter",
"M40A3",
"Mk_48_DZ",
"M240_DZ",
"M249_DZ",
"RPK_74",
"BAF_LRR_scoped",
"DMR",
"SVD_CAMO",
"SCAR_H_LNG_Sniper_SD",
"M110_NVG_EP1",
"Sa58V_RCO_EP1",
"BAF_L86A2_ACOG",
"M14_EP1",
"Sa58V_CCO_EP1"
];

// Number of tools to spawn in ammo boxes 
wai_mission_numberoftools = 5;
// classnames of tools to spawn in ammo boxes (only toolbelt items or weapon class Eg. "Chainsaw" or "ItemToolbox")
ammo_box_tools =[
"ItemToolbox",
"ItemKnife",
"ItemEtool",
"Binocular",
"ItemCompass",
"ItemGPS",
"ItemHatchet",
"ItemMatchbox",
"NVGoggles"
];

// Number of items to spawn in ammo boxes 
wai_mission_numberofitems = 10;
// classnames of items to spawn in ammo boxes (only type magazine will work here)
ammo_box_items =[
"ItemBandage",
"ItemSodaMdew"
];

//////////////////////////////////////////////////////////////////////
WAImissionconfig = True;
