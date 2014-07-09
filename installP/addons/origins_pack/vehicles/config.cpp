#define TEast		0
#define TWest		1
#define TGuerrila		2
#define TCivilian		3
#define TSideUnknown		4
#define TEnemy		5
#define TFriendly		6
#define TLogic		7

#define private		0
#define protected		1
#define public		2

#define true	1
#define false	0

class CfgPatches
{
	class ori_vil_pack
	{
		units[] = {"ori_vil_originsmod_lublin_truck", "ori_vil_originsmod_truck_civ", "ori_vil_originsmod_truck_civ1", "ori_vil_originsmod_truck_civ2", "ori_vil_originsmod_volvo_fl290", "ori_p85_originsmod_CUCV", "ori_p85_originsmod_cucv_pickup", "ori_vil_lada_2105_rust", "ori_poldek", "ori_poldek_black", "ori_transit",  "ori_survivorBus"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"CAWater2", "CAWheeled", "CAWheeled_E"};
	};
};

class CfgFactionClasses
{
	class rth_copter_class
	{
		displayName = "Dayz: Origins";
		priority = 0;
		side = TCivilian;
	};
};

class CfgSounds
{
	class z_origins_hidraulic1_0
	{
		name="Hidraulic1";
		sound[]={"\origins_pack\sounds\hidraulic1.ogg",db-5,1.000000};
		titles[]={};
	};
	class z_demolishwall_0
	{
		name="";
		sound[]={"\origins_pack\sounds\demolishwall.ogg",db-5,1.000000};
		titles[]={};
	};
	class z_ffalarm_0
	{
		name="";
		sound[] = {"\origins_pack\sounds\ffalarm.ogg",2,1,80};
		titles[]={};
	};
	class z_spraycan_0
	{
		name="";
		sound[] = {"\origins_pack\sounds\spraycan.ogg",1,1,80};
		titles[]={};
	};
	class z_subsink_0
	{
		name="";
		sound[] = {"\ori_submarine\sound\bubbles1.ogg",5,1,80};
		titles[]={};
	};
	class z_subgoup_0
	{
		name="";
		sound[] = {"\ori_submarine\sound\potop.ogg",5,1,80};
		titles[]={};
	};
	

};

class CfgVehicles {
	class LandVehicle;
	class Car: LandVehicle
	{
		class HitPoints
		{
			class HitLFWheel;
			class HitLBWheel;
			class HitRFWheel;
			class HitRBWheel;
			class HitFuel;
			class HitEngine;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
		};
		class Turrets
		{
			class Mainturret;
		};
	};
	
	class Pickup_PK_base;
	class UAZ_MG_base;
	class Ori_car_turrets : Pickup_PK_base {
		class Turrets;	// External class reference
		class MainTurret;	// External class reference
	};
	class Ori_car_turrets2 : UAZ_MG_base {
		class Turrets;	// External class reference
		class MainTurret;	// External class reference
	};
	class Skodabase;
	class UAZ_Unarmed_Base;
	class Ural_Base;
	class SUV_Base_EP1;
	

	class ori_vil_originsmod_lublin_truck : UAZ_Unarmed_Base {
		armor = 32;
		mapSize = 6;
		faction = "rth_copter_class";
		vehicleClass = "Car";
		scope = public;
		side = TCivilian;
		icon = "\origins_pack\vehicles\icons\ico_van_ca.paa";
		picture = "\origins_pack\vehicles\icons\pic_van_ca.paa";
		attendant = "false";
		DriverAction = "Golf_Driver";
		model = "\origins_pack\vehicles\VIL_lublin_truck";
		transportSoldier = 1;
		displayName = "Lublin (truck)";
		cargoAction[] = {"HMMWV_Cargo01"};
		crew = "Profiteer2";
		hasGunner = "false";
		transportMaxMagazines = 100;
		transportMaxWeapons = 10;
		transportMaxBackpacks = 10;
		hiddenSelections[] = {"camo01"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\lublin_t_co.paa"};
		
		class Reflectors {
			class Left1 {
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				brightness = 0.8;
			};
			
			class Right1 {
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
				size = 1;
				brightness = 0.8;
			};
		};
		
		class TransportMagazines {};
		
		class Library {
			libTextDesc = "Lublin van produced by FSR and later continued by Daewoo";
		};
		
		class AnimationSources {
			class pluhPredni {
				source = "pluhPredni";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class kolaOchrana {
				source = "kolaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class oknaOchrana {
				source = "oknaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class predniOknoOchrana {
				source = "predniOknoOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel {
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel {
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel {
				hitpoint = "HitRBWheel";
			};
			
			class HitGlass1 {
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			
			class HitGlass2 : HitGlass1 {
				hitpoint = "HitGlass2";
			};
			
			class HitGlass3 : HitGlass1 {
				hitpoint = "HitGlass3";
			};
			
			class HitGlass4 : HitGlass1 {
				hitpoint = "HitGlass4";
			};
			
			class HitGlass5 : HitGlass1 {
				hitpoint = "HitGlass5";
			};
			
			class HitGlass6 : HitGlass1 {
				hitpoint = "HitGlass6";
			};
			
			class HitGlass7 : HitGlass1 {
				hitpoint = "HitGlass7";
			};
			
			class HitGlass8 : HitGlass1 {
				hitpoint = "HitGlass8";
			};
		};
		
		class HitPoints {
			class HitGlass1 {
				armor = 0.1;
				material = -1;
				name = "sklo_p";
				visual = "sklo_p";
				passThrough = false;
			};
			
			class HitGlass2 : HitGlass1 {
				name = "sklo_p1";
				visual = "sklo_p1";
			};
			
			class HitGlass3 : HitGlass1 {
				name = "sklo_p2";
				visual = "sklo_p2";
			};
			
			class HitGlass4 : HitGlass1 {
				name = "sklo_p3";
				visual = "sklo_p3";
			};
			
			class HitGlass5 : HitGlass1 {
				name = "sklo_l1";
				visual = "sklo_l1";
			};
			
			class HitGlass6 : HitGlass1 {
				name = "sklo_l2";
				visual = "sklo_l2";
			};
			
			class HitGlass7 : HitGlass1 {
				name = "sklo_l3";
				visual = "sklo_l3";
			};
			
			class HitGlass8 : HitGlass1 {
				name = "sklo_z";
				visual = "sklo_z";
			};
			
			class HitLFWheel {
				armor = 0.15;
				material = -1;
				name = "levy predni tlumic";
				visual = "";
				passThrough = 0.3;
			};
			
			class HitLBWheel : HitLFWheel {
				name = "levy zadni tlumic";
				visual = "";
			};
			
			class HitRFWheel : HitLFWheel {
				name = "pravy predni tlumic";
				visual = "";
			};
			
			class HitRBWheel : HitLFWheel {
				name = "pravy zadni tlumic";
				visual = "";
			};
			
			class HitBody {
				armor = 1;
				material = -1;
				name = "karoserie";
				visual = "";
				passThrough = true;
			};
			
			class HitFuel {
				armor = 0.3;
				material = -1;
				name = "palivo";
				passThrough = 0.5;
			};
			
			class HitRGlass {
				armor = 0.3;
				material = -1;
				name = "sklo predni P";
				passThrough = false;
			};
			
			class HitLGlass {
				armor = 0.3;
				material = -1;
				name = "sklo predni L";
				passThrough = false;
			};
			
			class HitEngine {
				armor = 0.4;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
		};
		
		class Damage {
			tex[] = {"origins_pack\vehicles\textures\sedan_glass_ca.paa", "ca\wheeled\data\sedan_glassbr1_ca.paa", "ca\wheeled\data\sedan_glassbr2_ca.paa"};
			mat[] = {"origins_pack\vehicles\textures\lub1.rvmat", "origins_pack\vehicles\textures\lub1.rvmat", "origins_pack\vehicles\textures\lub1_de.rvmat", "origins_pack\vehicles\textures\lub2.rvmat", "origins_pack\vehicles\textures\lub2.rvmat", "origins_pack\vehicles\textures\lub2_de.rvmat", "origins_pack\vehicles\textures\lublin_old.rvmat", "origins_pack\vehicles\textures\lublin_old.rvmat", "origins_pack\vehicles\textures\lublin_old_de.rvmat", "origins_pack\vehicles\textures\lublin_new.rvmat", "origins_pack\vehicles\textures\lublin_new.rvmat", "origins_pack\vehicles\textures\lublin_new_de.rvmat", "origins_pack\vehicles\textures\lublin_t.rvmat", "origins_pack\vehicles\textures\lublin_t.rvmat", "origins_pack\vehicles\textures\lublin_t_de.rvmat", "origins_pack\vehicles\textures\ambulace.rvmat", "origins_pack\vehicles\textures\ambulace.rvmat", "origins_pack\vehicles\textures\pusty_de.rvmat"};
		};
	};
	
	class ori_originsmod_pickupold : Ori_car_turrets {
		armor = 32;
		mapSize = 6;
		hiddenSelections[] = {"camo","main_body", "clan", "clan_sign"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\cucv_co.paa"};
		transportSoldier = 4;
		vehicleClass = "Car";
		faction = "rth_copter_class";
		crew = "Profiteer2";
		driverAction = "HMMWV_Driver";
		cargoAction[] = {"HMMWV_Cargo01"};
		
		class TransportMagazines {};
		model = "\origins_pack\vehicles\ori_vil_postapoca_pickup";
		maxSpeed = 120;
		hideProxyInCombat = false;
		castDriverShadow = true;
		forceHideDriver = false;
		side = TCivilian;
		scope = public;
		displayName = "Gatling Capri 69";
		icon = "\origins_pack\vehicles\icons\ico_cucv_ca.paa";
		picture = "\origins_pack\vehicles\icons\pic_cucv_ca.paa";
		transportMaxMagazines = 100;
		transportMaxWeapons = 10;
		transportMaxBackpacks = 10;
		enableManualFire = 1;
		hideWeaponsGunner = 0;
		ejectDeadGunner = 1;
		ejectDeadCargo = 1;
		ejectDeadDriver = 1;
		ejectDeadCommander = 1;
 
		wheelCircumference = 3;
		soundGear[] = {"", db-85, 1};
		soundGetIn[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_door", db-5, 1};
		soundGetOut[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_door", db-5, 1, 20};
		soundEngineOnInt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_start", 0.177828, 1.0};
		soundEngineOnExt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_start", 0.177828, 1.0, 100};
		soundEngineOffInt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_stop", 0.177828, 1.0};
		soundEngineOffExt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_stop", 0.177828, 1.0, 100};
		buildCrash0[] = {"Ca\sounds\Vehicles\Crash\crash_building_01", 0.707946, 1, 200};
		buildCrash1[] = {"Ca\sounds\Vehicles\Crash\crash_building_02", 0.707946, 1, 200};
		buildCrash2[] = {"Ca\sounds\Vehicles\Crash\crash_building_03", 0.707946, 1, 200};
		buildCrash3[] = {"Ca\sounds\Vehicles\Crash\crash_building_04", 0.707946, 1, 200};
		soundBuildingCrash[] = {"buildCrash0", 0.25, "buildCrash1", 0.25, "buildCrash2", 0.25, "buildCrash3", 0.25};
		WoodCrash0[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_01", 0.707946, 1, 200};
		WoodCrash1[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_02", 0.707946, 1, 200};
		WoodCrash2[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_03", 0.707946, 1, 200};
		WoodCrash3[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_04", 0.707946, 1, 200};
		WoodCrash4[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_05", 0.707946, 1, 200};
		WoodCrash5[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_06", 0.707946, 1, 200};
		soundWoodCrash[] = {"woodCrash0", 0.166, "woodCrash1", 0.166, "woodCrash2", 0.166, "woodCrash3", 0.166, "woodCrash4", 0.166, "woodCrash5", 0.166};
		ArmorCrash0[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_01", 0.707946, 1, 200};
		ArmorCrash1[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_02", 0.707946, 1, 200};
		ArmorCrash2[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_03", 0.707946, 1, 200};
		ArmorCrash3[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_04", 0.707946, 1, 200};
		soundArmorCrash[] = {"ArmorCrash0", 0.25, "ArmorCrash1", 0.25, "ArmorCrash2", 0.25, "ArmorCrash3", 0.25};
		
		class SoundEvents {
			class AccelerationIn {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_accelerate_3_x", db-5, 1.0};
				limit = 0.4;
				expression = "(engineOn*(1-camPos))*gmeterZ";
			};
			
			class AccelerationOut {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_accelerate_3", db-5, 1.0, 200};
				limit = 0.4;
				expression = "(engineOn*camPos)*gmeterZ";
			};
		};
		
		class Sounds {
			class Engine {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_low", 0.177828, 1.4, 100};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "camPos*engineOn*((rpm factor[0.3, 0.4]) min (rpm factor[0.7, 0.5]))";
			};
			
			class EngineHighOut {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_high", db0, 0.8, 300};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "camPos*engineOn*(rpm factor[0.5, 0.8])";
			};
			
			class IdleOut {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_idle", db-5, 1.0, 100};
				frequency = "1";
				volume = "engineOn*camPos*(rpm factor[0.4, 0])";
			};
			
			class TiresRockOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-rock2", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			
			class TiresSandOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-sand2", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			
			class TiresGrassOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-grass2", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			
			class TiresMudOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-mud2", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			
			class TiresGravelOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-gravel2", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			
			class TiresAsphaltOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-asphalt3", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			
			class NoiseOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\ext\noise2", 0.1, 1.0, 30};
				frequency = "1";
				volume = "camPos*(damper0 max 0.03)*(speed factor[0, 8])";
			};
			
			class EngineLowIn {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_low_x", 0.316228, 1.4};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "(1-camPos)*engineOn*((rpm factor[0.3, 0.4]) min (rpm factor[0.7, 0.45]))";
			};
			
			class EngineHighIn {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_high_x", db0, 0.8};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "(1-camPos)*engineOn*(rpm factor[0.5, 0.8])";
			};
			
			class IdleIn {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_idle_x", 0.316228, 1.0};
				frequency = "1";
				volume = "engineOn*(rpm factor[0.4, 0])*(1-camPos)";
			};
			
			class TiresRockIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-rock2", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			
			class TiresSandIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-sand2", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			
			class TiresGrassIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-grass2", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			
			class TiresMudIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-mud2", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			
			class TiresGravelIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-gravel2", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			
			class TiresAsphaltIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-asphalt3", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			
			class NoiseIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\int\noise2", 0.177828, 1.0};
				frequency = "1";
				volume = "(damper0 max 0.03)*(speed factor[0, 8])*(1-camPos)";
			};
			
			class Movement {
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
		};
		
		class Turrets : Turrets {
			class MainTurret : MainTurret {
				enableManualFire = 1;
				body = "";
				gun = "gatling";
				outGunnerMayFire = true;
				forceHideGunner = true;
				castGunnerShadow = true;
				viewGunnerInExternal = 1;
				gunnerOpticsModel = "\ca\Weapons\optika_empty";
				gunnerForceOptics = false;
				weapons[] = {PKT};
				soundServo[] = {};
				stabilizedInAxes = 0;
				magazines[] = {"100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK"};
				gunnerAction = "HMMWV_Cargo01";
				gunnerInAction = "HMMWV_Cargo01";
				minElev = -5;
				initElev = -5;
				maxElev = 5;
				minTurn = -5;
				maxTurn = 5;
				initTurn = -5;
				commanding = -3;
				gunnerCompartments = "Compartment1";
			};
		};
		
		class Library {
			libTextDesc = "Old Big Pickup";
		};
		
		class Reflectors {
			class Left {
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				brightness = 1.0;
			};
		};
		
		class Damage {
			tex[] = {};
			mat[] = {"origins_pack\vehicles\textures\oldcar_rust.rvmat", "origins_pack\vehicles\textures\oldcar_rust.rvmat", "origins_pack\vehicles\textures\oldcar_rust_de.rvmat"};
		};
		
		class AnimationSources {
			class gatling {
				source = "reload";
				weapon = PKT;
			};
			
			class doorhood {
				source = "user";
				animPeriod = 10;
				initPhase = 0;
			};
			
			class doorhood2 {
				source = "user";
				animPeriod = 10;
				initPhase = 0;
			};
			
			class platform_move {
				source = "user";
				animPeriod = 10;
				initPhase = 0;
			};
			
			class pluhPredni {
				source = "pluhPredni";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class oknaOchrana {
				source = "oknaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class predniOknoOchrana {
				source = "predniOknoOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel {
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel {
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel {
				hitpoint = "HitRBWheel";
			};
		};
		
		class UserActions {
			class platform_on {
				displayName = "Platform Up";
				position = "zamerny";
				radius = 1;
				priority = 3;
				showWindow = 0;
				onlyForPlayer = 0;
				condition = "(alive this) && (this animationPhase ""doorhood""< 0.5) && (player in [gunner this, driver this])";
				statement = "(this animate [""doorhood"", 1]) && (this animate [""doorhood2"", 1]) && (this animate [""platform_move"", 1])";
			};
			
			class platform_off {
				displayName = "Platform Down";
				position = "zamerny";
				radius = 1;
				priority = 3;
				showWindow = 0;
				onlyForPlayer = 0;
				condition = "(alive this) && (this animationPhase ""doorhood"" >= 0.5) && (player in [gunner this, driver this])";
				statement = "(this animate [""doorhood"", 0]) && (this animate [""doorhood2"", 0]) && (this animate [""platform_move"", 0])";
			};
		};
		
		class HitPoints {
			class HitLFWheel {
				armor = 1;
				material = -1;
				name = "levy predni tlumic";
				visual = "";
				passThrough = 0.3;
			};
			
			class HitLBWheel : HitLFWheel {
				name = "levy zadni tlumic";
				visual = "";
			};
			
			class HitRFWheel : HitLFWheel {
				name = "pravy predni tlumic";
				visual = "";
			};
			
			class HitRBWheel : HitLFWheel {
				name = "pravy zadni tlumic";
				visual = "";
			};
			
			class HitBody {
				armor = 1;
				material = -1;
				name = "karoserie";
				visual = "";
				passThrough = true;
			};
			
			class HitFuel {
				armor = 0.3;
				material = -1;
				name = "palivo";
				passThrough = 0.5;
			};
			
			class HitRGlass {
				armor = 0.3;
				material = -1;
				name = "sklo predni P";
				passThrough = false;
			};
			
			class HitLGlass {
				armor = 0.3;
				material = -1;
				name = "sklo predni L";
				passThrough = false;
			};
			
			class HitEngine {
				armor = 0.4;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
		};
	};
	
	class ori_originsmod_pickupoldfuel : UAZ_Unarmed_Base {
		armor = 32;
		mapSize = 6;
		hiddenSelections[] = {"main_body", "clan", "clan_sign"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\cucv_co.paa"};
		transportSoldier = 1;
		vehicleClass = "Car";
		faction = "rth_copter_class";
		crew = "Profiteer2";
		driverAction = "HMMWV_Driver";
		cargoAction[] = {"HMMWV_Cargo01"};
		
		class TransportMagazines {};
		model = "\origins_pack\vehicles\ori_postapocar_fuel";
		maxSpeed = 90;	// max speed on level road, km/h
		hideProxyInCombat = false;
		viewDriverInExternal = 1;
		castDriverShadow = true;
		forceHideDriver = false;
		side = TCivilian;
		scope = public;
		displayName = "Rodina 62 (Fuel truck)";
		icon = "\origins_pack\vehicles\icons\ico_cucv_ca.paa";
		picture = "\origins_pack\vehicles\icons\pic_cucv_ca.paa";
		transportMaxMagazines = 100;
		transportMaxWeapons = 10;
		transportMaxBackpacks = 10;
		soundGear[] = {"", db-85, 1};
		soundGetIn[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_door", db-5, 1};
		soundGetOut[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_door", db-5, 1, 20};
		soundEngineOnInt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_start", 0.177828, 1.0};
		soundEngineOnExt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_start", 0.177828, 1.0, 100};
		soundEngineOffInt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_stop", 0.177828, 1.0};
		soundEngineOffExt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_stop", 0.177828, 1.0, 100};
		buildCrash0[] = {"Ca\sounds\Vehicles\Crash\crash_building_01", 0.707946, 1, 200};
		buildCrash1[] = {"Ca\sounds\Vehicles\Crash\crash_building_02", 0.707946, 1, 200};
		buildCrash2[] = {"Ca\sounds\Vehicles\Crash\crash_building_03", 0.707946, 1, 200};
		buildCrash3[] = {"Ca\sounds\Vehicles\Crash\crash_building_04", 0.707946, 1, 200};
		soundBuildingCrash[] = {"buildCrash0", 0.25, "buildCrash1", 0.25, "buildCrash2", 0.25, "buildCrash3", 0.25};
		WoodCrash0[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_01", 0.707946, 1, 200};
		WoodCrash1[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_02", 0.707946, 1, 200};
		WoodCrash2[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_03", 0.707946, 1, 200};
		WoodCrash3[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_04", 0.707946, 1, 200};
		WoodCrash4[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_05", 0.707946, 1, 200};
		WoodCrash5[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_06", 0.707946, 1, 200};
		soundWoodCrash[] = {"woodCrash0", 0.166, "woodCrash1", 0.166, "woodCrash2", 0.166, "woodCrash3", 0.166, "woodCrash4", 0.166, "woodCrash5", 0.166};
		ArmorCrash0[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_01", 0.707946, 1, 200};
		ArmorCrash1[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_02", 0.707946, 1, 200};
		ArmorCrash2[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_03", 0.707946, 1, 200};
		ArmorCrash3[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_04", 0.707946, 1, 200};
		soundArmorCrash[] = {"ArmorCrash0", 0.25, "ArmorCrash1", 0.25, "ArmorCrash2", 0.25, "ArmorCrash3", 0.25};
		
		class SoundEvents {
			class AccelerationIn {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_accelerate_3_x", db-5, 1.0};
				limit = 0.4;
				expression = "(engineOn*(1-camPos))*gmeterZ";
			};
			
			class AccelerationOut {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_accelerate_3", db-5, 1.0, 200};
				limit = 0.4;
				expression = "(engineOn*camPos)*gmeterZ";
			};
		};
		
		class Sounds {
			class Engine {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_low", 0.177828, 1.4, 100};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "camPos*engineOn*((rpm factor[0.3, 0.4]) min (rpm factor[0.7, 0.5]))";
			};
			
			class EngineHighOut {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_high", db0, 0.8, 300};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "camPos*engineOn*(rpm factor[0.5, 0.8])";
			};
			
			class IdleOut {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_idle", db-5, 1.0, 100};
				frequency = "1";
				volume = "engineOn*camPos*(rpm factor[0.4, 0])";
			};
			
			class TiresRockOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-rock2", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			
			class TiresSandOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-sand2", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			
			class TiresGrassOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-grass2", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			
			class TiresMudOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-mud2", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			
			class TiresGravelOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-gravel2", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			
			class TiresAsphaltOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-asphalt3", 0.316228, 1.0, 30};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			
			class NoiseOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\ext\noise2", 0.1, 1.0, 30};
				frequency = "1";
				volume = "camPos*(damper0 max 0.03)*(speed factor[0, 8])";
			};
			
			class EngineLowIn {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_low_x", 0.316228, 1.4};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "(1-camPos)*engineOn*((rpm factor[0.3, 0.4]) min (rpm factor[0.7, 0.45]))";
			};
			
			class EngineHighIn {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_high_x", db0, 0.8};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "(1-camPos)*engineOn*(rpm factor[0.5, 0.8])";
			};
			
			class IdleIn {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_idle_x", 0.316228, 1.0};
				frequency = "1";
				volume = "engineOn*(rpm factor[0.4, 0])*(1-camPos)";
			};
			
			class TiresRockIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-rock2", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			
			class TiresSandIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-sand2", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			
			class TiresGrassIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-grass2", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			
			class TiresMudIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-mud2", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			
			class TiresGravelIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-gravel2", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			
			class TiresAsphaltIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-asphalt3", 0.316228, 1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			
			class NoiseIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\int\noise2", 0.177828, 1.0};
				frequency = "1";
				volume = "(damper0 max 0.03)*(speed factor[0, 8])*(1-camPos)";
			};
			
			class Movement {
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
		};
		
		class Library {
			libTextDesc = "Old Pickup with tank";
		};
		
		class Reflectors {
			class Left {
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				brightness = 1.0;
			};
		};
		
		class Damage {
			tex[] = {};
			mat[] = {"origins_pack\vehicles\textures\rust_pickup.rvmat", "origins_pack\vehicles\textures\rust_pickup.rvmat", "origins_pack\vehicles\textures\rust_pickup_de.rvmat"};
		};
		
		class AnimationSources {
			class pluhPredni {
				source = "pluhPredni";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class kolaOchrana {
				source = "kolaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class oknaOchrana {
				source = "oknaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class predniOknoOchrana {
				source = "predniOknoOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel {
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel {
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel {
				hitpoint = "HitRBWheel";
			};
		};
		
		class HitPoints {
			class HitLFWheel {
				armor = 0.4;
				material = -1;
				name = "levy predni tlumic";
				visual = "";
				passThrough = 0.3;
			};
			
			class HitLBWheel : HitLFWheel {
				name = "levy zadni tlumic";
				visual = "";
			};
			
			class HitRFWheel : HitLFWheel {
				name = "pravy predni tlumic";
				visual = "";
			};
			
			class HitRBWheel : HitLFWheel {
				name = "pravy zadni tlumic";
				visual = "";
			};
			
			class HitBody {
				armor = 1;
				material = -1;
				name = "karoserie";
				visual = "";
				passThrough = true;
			};
			
			class HitFuel {
				armor = 0.3;
				material = -1;
				name = "palivo";
				passThrough = 0.5;
			};
			
			class HitRGlass {
				armor = 0.3;
				material = -1;
				name = "sklo predni P";
				passThrough = false;
			};
			
			class HitLGlass {
				armor = 0.3;
				material = -1;
				name = "sklo predni L";
				passThrough = false;
			};
			
			class HitEngine {
				armor = 0.4;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
		};
	};
	
	class ori_p85_originsmod_CUCV : UAZ_Unarmed_Base {
		armor = 32;
		mapSize = 6;
		hiddenSelections[] = {"main_body", "clan", "clan_sign"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\cucv_co.paa"};
		transportSoldier = 3;
		vehicleClass = "Car";
		faction = "rth_copter_class";
		crew = "Profiteer2";
		driverAction = "HMMWV_Driver";
		cargoAction[] = {"HMMWV_Cargo01"};
		
		class TransportMagazines {};
		model = "\origins_pack\vehicles\p85_cucv";
		maxSpeed = 90;
		hideProxyInCombat = false;
		viewDriverInExternal = 1;
		castDriverShadow = true;
		forceHideDriver = false;
		side = TCivilian;
		scope = public;
		displayName = "M1008 CUCV";
		icon = "\origins_pack\vehicles\icons\ico_cucv_ca.paa";
		picture = "\origins_pack\vehicles\icons\pic_cucv_ca.paa";
		transportMaxMagazines = 100;
		transportMaxWeapons = 10;
		transportMaxBackpacks = 10;
		
		class Library {
			libTextDesc = "Jeep M38A1";
		};
		
		class Damage {
			tex[] = {"origins_pack\vehicles\textures\glass_ca.paa","ca\wheeled\data\hatchback_glassbr1_ca.paa","ca\wheeled\data\hatchback_glassbr2_ca.paa"};
			mat[] = {"origins_pack\vehicles\textures\cucv.rvmat", "origins_pack\vehicles\textures\cucv.rvmat", "origins_pack\vehicles\textures\cucv_de.rvmat"};
		};
		
		class AnimationSources {
			class pluhPredni {
				source = "pluhPredni";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class kolaOchrana {
				source = "kolaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class oknaOchrana {
				source = "oknaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class predniOknoOchrana {
				source = "predniOknoOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel {
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel {
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel {
				hitpoint = "HitRBWheel";
			};
			
			class HitGlass1 {
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			
			class HitGlass2 : HitGlass1 {
				hitpoint = "HitGlass2";
			};
			
			class HitGlass3 : HitGlass1 {
				hitpoint = "HitGlass3";
			};
			
			class HitGlass4 : HitGlass1 {
				hitpoint = "HitGlass4";
			};
			
			class HitGlass5 : HitGlass1 {
				hitpoint = "HitGlass5";
			};
			
			class HitGlass6 : HitGlass1 {
				hitpoint = "HitGlass6";
			};
			
			class HitGlass7 : HitGlass1 {
				hitpoint = "HitGlass7";
			};
			
			class HitGlass8 : HitGlass1 {
				hitpoint = "HitGlass8";
			};
			
			class HitGlass9 : HitGlass1 {
				hitpoint = "HitGlass9";
			};
			
			class HitGlass10 : HitGlass1 {
				hitpoint = "HitGlass10";
			};
			
			class HitGlass11 : HitGlass1 {
				hitpoint = "HitGlass11";
			};
			
			class HitGlass12 : HitGlass1 {
				hitpoint = "HitGlass12";
			};
		};
		
		class HitPoints {
			class HitGlass1 {
				armor = 0.1;
				material = -1;
				name = "sklo_p";
				visual = "sklo_p";
				passThrough = false;
			};
			
			class HitGlass2 : HitGlass1 {
				name = "sklo_p1";
				visual = "sklo_p1";
			};
			
			class HitGlass3 : HitGlass1 {
				name = "sklo_p2";
				visual = "sklo_p2";
			};
			
			class HitGlass4 : HitGlass1 {
				name = "sklo_p3";
				visual = "sklo_p3";
			};
			
			class HitGlass5 : HitGlass1 {
				name = "sklo_l1";
				visual = "sklo_l1";
			};
			
			class HitGlass6 : HitGlass1 {
				name = "sklo_l2";
				visual = "sklo_l3";
			};
			
			class HitGlass7 : HitGlass1 {
				name = "sklo_l3";
				visual = "glass3";
			};
			
			class HitGlass8 : HitGlass1 {
				name = "sklo_z";
				visual = "sklo_z";
			};
			
			class HitGlass9 : HitGlass1 {
				name = "sklo_pp";
				visual = "sklo_pp";
			};
			
			class HitGlass10 : HitGlass1 {
				name = "sklo_pl";
				visual = "sklo_pl";
			};
			
			class HitGlass11 : HitGlass1 {
				name = "sklo_p4";
				visual = "sklo_p4";
			};
			
			class HitGlass12 : HitGlass1 {
				name = "sklo_l4";
				visual = "sklo_l4";
			};
			
			class HitLFWheel {
				armor = 0.15;
				material = -1;
				name = "levy predni tlumic";
				visual = "";
				passThrough = 0.3;
			};
			
			class HitLBWheel : HitLFWheel {
				name = "levy zadni tlumic";
				visual = "";
			};
			
			class HitRFWheel : HitLFWheel {
				name = "pravy predni tlumic";
				visual = "";
			};
			
			class HitRBWheel : HitLFWheel {
				name = "pravy zadni tlumic";
				visual = "";
			};
			
			class HitBody {
				armor = 1;
				material = -1;
				name = "karoserie";
				visual = "";
				passThrough = true;
			};
			
			class HitFuel {
				armor = 0.3;
				material = -1;
				name = "palivo";
				passThrough = 0.5;
			};
			
			class HitRGlass {
				armor = 0.3;
				material = -1;
				name = "sklo predni P";
				passThrough = false;
			};
			
			class HitLGlass {
				armor = 0.3;
				material = -1;
				name = "sklo predni L";
				passThrough = false;
			};
			
			class HitEngine {
				armor = 0.4;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
		};
	};
	
	class ori_p85_originsmod_cucv_pickup : ori_p85_originsmod_CUCV {
		transportSoldier = 7;
		vehicleClass = "Car";
		faction = "rth_copter_class";
		displayName = "M1008 CUCV (Pickup)";
		icon = "\origins_pack\vehicles\icons\ico_cucvp_ca.paa";
		picture = "\origins_pack\vehicles\icons\pic_cucvp_ca.paa";
		mapSize = 7;
		model = "\origins_pack\vehicles\p85_CUCV_pickup";
	};

	class ori_vil_truck_civ_base : Ural_Base {
		armor = 32;
		vehicleClass = "Car";
		faction = "rth_copter_class";
		armorWheels = 0.8;
		side = 2;
		scope = protected;
		crew = "Profiteer2";
		icon = "\origins_pack\vehicles\icons\ico_truck_ca.paa";
		picture = "\origins_pack\vehicles\icons\pic_truck_ca.paa";
		maxSpeed = 95;	// max speed on level road, km/h
		displayName = "STAR 944";
		hasGunner = "false";
		driverAction = "Kamaz_Driver";
		cargoAction[] = {"HMMWV_Cargo01"};
		
		class TransportMagazines {};
		transportSoldier = 12;
		
		class Library {
			libTextDesc = "STAR-944";
		};
		transportMaxMagazines = 150;
		transportMaxWeapons = 15;
		transportMaxBackpacks = 10;
		
		class AnimationSources {
			class pluhPredni {
				source = "pluhPredni";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class kolaOchrana {
				source = "kolaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class oknaOchrana {
				source = "oknaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class predniOknoOchrana {
				source = "predniOknoOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel {
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel {
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel {
				hitpoint = "HitRBWheel";
			};
			
			class HitGlass1 {
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			
			class HitGlass2 : HitGlass1 {
				hitpoint = "HitGlass2";
			};
			
			class HitGlass3 : HitGlass1 {
				hitpoint = "HitGlass3";
			};
			
			class HitGlass4 : HitGlass1 {
				hitpoint = "HitGlass4";
			};
			
			class HitGlass5 : HitGlass1 {
				hitpoint = "HitGlass5";
			};
			
			class HitGlass6 : HitGlass1 {
				hitpoint = "HitGlass6";
			};
			
			class HitGlass7 : HitGlass1 {
				hitpoint = "HitGlass7";
			};
			
			class HitGlass8 : HitGlass1 {
				hitpoint = "HitGlass8";
			};
		};
		
		class HitPoints {
			class HitGlass1 {
				armor = 0.1;
				material = -1;
				name = "sklo_p";
				visual = "sklo_p";
				passThrough = false;
			};
			
			class HitGlass2 : HitGlass1 {
				name = "sklo_p1";
				visual = "sklo_p1";
			};
			
			class HitGlass3 : HitGlass1 {
				name = "sklo_p2";
				visual = "sklo_p2";
			};
			
			class HitGlass4 : HitGlass1 {
				name = "sklo_p3";
				visual = "sklo_p3";
			};
			
			class HitGlass5 : HitGlass1 {
				name = "sklo_l1";
				visual = "sklo_l1";
			};
			
			class HitGlass6 : HitGlass1 {
				name = "sklo_l2";
				visual = "sklo_l2";
			};
			
			class HitGlass7 : HitGlass1 {
				name = "sklo_l3";
				visual = "sklo_l3";
			};
			
			class HitGlass8 : HitGlass1 {
				name = "sklo_z";
				visual = "sklo_z";
			};
			
			class HitLFWheel {
				armor = 0.15;
				material = -1;
				name = "levy predni tlumic";
				visual = "";
				passThrough = 0.3;
			};
			
			class HitLBWheel : HitLFWheel {
				name = "levy zadni tlumic";
				visual = "";
			};
			
			class HitRFWheel : HitLFWheel {
				name = "pravy predni tlumic";
				visual = "";
			};
			
			class HitRBWheel : HitLFWheel {
				name = "pravy zadni tlumic";
				visual = "";
			};
			
			class HitBody {
				armor = 1;
				material = -1;
				name = "karoserie";
				visual = "";
				passThrough = true;
			};
			
			class HitFuel {
				armor = 0.3;
				material = -1;
				name = "palivo";
				passThrough = 0.5;
			};
			
			class HitRGlass {
				armor = 0.3;
				material = -1;
				name = "sklo predni P";
				passThrough = false;
			};
			
			class HitLGlass {
				armor = 0.3;
				material = -1;
				name = "sklo predni L";
				passThrough = false;
			};
			
			class HitEngine {
				armor = 0.4;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
		};
		
		class Reflectors {
			class Left1 {
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "L svetlo";
				direction = "konec svetla Pl";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				brightness = 0.8;
			};
			
			class Right1 {
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "P svetlo";
				direction = "konec svetla Pp";
				hitpoint = "P svetlo";
				selection = "P svetlo";
				size = 1;
				brightness = 0.8;
			};
		};
		
		class Damage {
			tex[] = {"origins_pack\vehicles\textures\sklo_rysy.paa", "origins_pack\vehicles\textures\sklo_rysy_de.paa", "origins_pack\vehicles\textures\sklo_rysy_de.paa"};
			mat[] = {"origins_pack\vehicles\textures\944_sp.rvmat", "origins_pack\vehicles\textures\944_sp.rvmat", "origins_pack\vehicles\textures\944_sp_de.rvmat"};
		};
		hiddenSelections[] = {"main_body", "back_body"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\midlum_co.paa", "\origins_pack\vehicles\textures\s2000civ_co.paa"};
	};
	
	class ori_vil_originsmod_truck_civ : ori_vil_truck_civ_base {
		model = "\origins_pack\vehicles\vil_truck_civ2.p3d";
		crew = "Profiteer2";
		faction = "rth_copter_class";
		side = 2;
		scope = public;
		accuracy = 1000;	// accuracy needed to recognize type of this target
		transportSoldier = 1;
		vehicleClass = "car";
		displayName = "Ren truck";
		icon = "\origins_pack\vehicles\icons\ico_truck_ca.paa";
		picture = "\origins_pack\vehicles\icons\pic_truck_ca.paa";
		transportMaxMagazines = 150;
		transportMaxWeapons = 15;
		transportMaxBackpacks = 10;
		hiddenSelections[] = {"camo01","camo02"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\truck_w_co.paa", "\origins_pack\vehicles\textures\s2000civ_co.paa"};
		
		class Damage {
			tex[] = {"origins_pack\vehicles\textures\sklo_rysy.paa","origins_pack\vehicles\textures\sklo_rysy_de.paa","origins_pack\vehicles\textures\sklo_rysy_de.paa"};
			mat[] = {"origins_pack\vehicles\textures\midlum.rvmat", "origins_pack\vehicles\textures\midlum.rvmat", "origins_pack\vehicles\textures\midlum_de.rvmat", "origins_pack\vehicles\textures\s2000civ.rvmat", "origins_pack\vehicles\textures\s2000civ.rvmat", "origins_pack\vehicles\textures\s2000civ_de.rvmat", "origins_pack\vehicles\textures\truck.rvmat", "origins_pack\vehicles\textures\truck.rvmat", "origins_pack\vehicles\textures\truck_de.rvmat"};
		};
	};
	
	class ori_vil_originsmod_truck_civ1 : ori_vil_originsmod_truck_civ {
		model = "\origins_pack\vehicles\vil_truck_civ1.p3d";
		displayName = "Ren truck (blue)";
		icon = "\origins_pack\vehicles\icons\ico_truck_ca.paa";
		picture = "\origins_pack\vehicles\icons\pic_truck_ca.paa";
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\truck_b_co.paa", "\origins_pack\vehicles\textures\s2000civ_co.paa"};
	};
	
	class ori_vil_originsmod_truck_civ2 : ori_vil_originsmod_truck_civ {
		model = "\origins_pack\vehicles\vil_truck_civ2.p3d";
		displayName = "Volvo truck (white)";
		icon = "\origins_pack\vehicles\icons\ico_truck_ca.paa";
		picture = "\origins_pack\vehicles\icons\pic_truck2_ca.paa";
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\truck_w_co.paa", "\origins_pack\vehicles\textures\s2000civ_co.paa"};
	};
	
	class ori_vil_originsmod_volvo_fl290 : ori_vil_originsmod_truck_civ {
		model = "\origins_pack\vehicles\vil_volvo_fl290";
		side = TCivilian;
		accuracy = 1000;	// accuracy needed to recognize type of this target
		transportSoldier = 3;
		displayName = "Fire engine (Volvo)";
		icon = "\origins_pack\vehicles\icons\ico_truck_ca.paa";
		picture = "\origins_pack\vehicles\icons\pic_truck2_ca.paa";
		
		class Damage {
			tex[] = {};
			mat[] = {"origins_pack\vehicles\textures\volvo.rvmat", "origins_pack\vehicles\textures\volvo.rvmat", "origins_pack\vehicles\textures\midlum_de.rvmat"};
		};
		hiddenSelections[] = {"main_body"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\volvo_co.paa"};
	};
	
	class ori_vil_lada_2105_rust : Skodabase {
		vehicleClass = "car";
		faction = "rth_copter_class";
		displayName = "Lada 2105";
		model = "\origins_pack\vehicles\vil_lada_2105_rust";
		transportSoldier = 3;
		scope = public;
		driverAction = "HMMWV_Driver";
		cargoAction[] = {"HMMWV_Cargo01"};
		transportMaxMagazines = 100;
		transportMaxWeapons = 10;
		transportMaxBackpacks = 10;
		
		hiddenSelections[] = {"camo01"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\lada5_co.paa"};
		
		class Damage {
			tex[] = {};
			mat[] = {"origins_pack\vehicles\textures\plate.rvmat", "origins_pack\vehicles\textures\plate.rvmat", "origins_pack\vehicles\textures\plate_de.rvmat", "origins_pack\vehicles\textures\lada5.rvmat", "origins_pack\vehicles\textures\lada5.rvmat", "origins_pack\vehicles\textures\lada5_de.rvmat"};
		};
		
		class AnimationSources {
			class pluhPredni {
				source = "pluhPredni";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class kolaOchrana {
				source = "kolaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class oknaOchrana {
				source = "oknaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class predniOknoOchrana {
				source = "predniOknoOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel {
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel {
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel {
				hitpoint = "HitRBWheel";
			};
			
			class HitGlass1 {
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			
			class HitGlass2 : HitGlass1 {
				hitpoint = "HitGlass2";
			};
			
			class HitGlass3 : HitGlass1 {
				hitpoint = "HitGlass3";
			};
			
			class HitGlass4 : HitGlass1 {
				hitpoint = "HitGlass4";
			};
			
			class HitGlass5 : HitGlass1 {
				hitpoint = "HitGlass5";
			};
			
			class HitGlass6 : HitGlass1 {
				hitpoint = "HitGlass6";
			};
			
			class HitGlass7 : HitGlass1 {
				hitpoint = "HitGlass7";
			};
			
			class HitGlass8 : HitGlass1 {
				hitpoint = "HitGlass8";
			};
			
			class Hitarmor1 {
				source = "Hit";
				hitpoint = "";
				raw = 1;
			};
			
			class Hitarmor2 : Hitarmor1 {
				hitpoint = "";
			};
			
			class Hitarmor3 : Hitarmor1 {
				hitpoint = "";
			};
			
			class Hitarmor4 : Hitarmor1 {
				hitpoint = "";
			};
		};
		
		class HitPoints {
			class Hitarmor1 {
				armor = 1;
				material = -1;
				name = "pluhPredni";
				visual = "pluhPredni";
				passThrough = 0.2;
			};
			
			class Hitarmor2 : Hitarmor1 {
				name = "kolaOchrana";
				visual = "kolaOchrana";
			};
			
			class Hitarmor3 : Hitarmor1 {
				name = "oknaOchrana";
				visual = "oknaOchrana";
			};
			
			class Hitarmor4 : Hitarmor1 {
				name = "predniOknoOchrana";
				visual = "predniOknoOchrana";
			};
			
			class HitGlass1 {
				armor = 0.1;
				material = -1;
				name = "sklo_p";
				visual = "sklo_p";
				passThrough = false;
			};
			
			class HitGlass2 : HitGlass1 {
				name = "sklo_p1";
				visual = "sklo_p1";
			};
			
			class HitGlass3 : HitGlass1 {
				name = "sklo_p2";
				visual = "sklo_p2";
			};
			
			class HitGlass4 : HitGlass1 {
				name = "sklo_p3";
				visual = "sklo_p3";
			};
			
			class HitGlass5 : HitGlass1 {
				name = "sklo_l1";
				visual = "sklo_l1";
			};
			
			class HitGlass6 : HitGlass1 {
				name = "sklo_l2";
				visual = "sklo_l3";
			};
			
			class HitGlass7 : HitGlass1 {
				name = "sklo_l3";
				visual = "glass3";
			};
			
			class HitGlass8 : HitGlass1 {
				name = "sklo_z";
				visual = "sklo_z";
			};
			
			class HitLFWheel {
				armor = 0.3;
				material = -1;
				name = "levy predni tlumic";
				visual = "";
				passThrough = 0.2;
			};
			
			class HitLBWheel : HitLFWheel {
				name = "levy zadni tlumic";
				visual = "";
			};
			
			class HitRFWheel : HitLFWheel {
				name = "pravy predni tlumic";
				visual = "";
			};
			
			class HitRBWheel : HitLFWheel {
				name = "pravy zadni tlumic";
				visual = "";
			};
			
			class HitEngine {
				armor = 1.2;
				material = -1;
				name = "motor";
				visual = "motor";
				passThrough = "true";
			};
			
			class HitRGlass {
				armor = 0.5;
				material = 0;
				name = "sklo predni P";
				passThrough = "true";
			};
			
			class HitLGlass {
				armor = 0.5;
				material = 0;
				name = "sklo predni L";
				passThrough = "true";
			};
			
			class HitBody {
				armor = 0.4;
				material = -1;
				name = "karoserie";
				visual = "karoserie";
				passThrough = "true";
			};
			
			class HitFuel {
				armor = 1.4;
				material = -1;
				name = "palivo";
				passThrough = "true";
			};
		};
	};

	class ori_poldek : Skodabase {
		vehicleClass = "car";
		faction = "rth_copter_class";
		displayName = "Polonez 78 (Taxi)";
		model = "\origins_pack\vehicles\vil_poldek_rust";
		scope = public;
		transportSoldier = 3;
		driverAction = "HMMWV_Driver";
		cargoAction[] = {"HMMWV_Cargo01"};
		hiddenSelections[] = {"Camo01", "taxi"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\polonez_rust_co.paa", "\origins_pack\vehicles\textures\polonez_rust_co.paa"};
		transportMaxMagazines = 100;
		transportMaxWeapons = 10;
		transportMaxBackpacks = 10;
		
		class Damage {
			tex[] = {};
			mat[] = {"origins_pack\vehicles\textures\plate.rvmat", "origins_pack\vehicles\textures\plate.rvmat", "origins_pack\vehicles\textures\plate_de.rvmat", "origins_pack\vehicles\textures\polonez.rvmat", "origins_pack\vehicles\textures\polonez.rvmat", "origins_pack\vehicles\textures\polonez_de.rvmat"};
		};
		
		class AnimationSources {
			class pluhPredni {
				source = "pluhPredni";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class kolaOchrana {
				source = "kolaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class oknaOchrana {
				source = "oknaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class predniOknoOchrana {
				source = "predniOknoOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel {
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel {
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel {
				hitpoint = "HitRBWheel";
			};
			
			class HitGlass1 {
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			
			class HitGlass2 : HitGlass1 {
				hitpoint = "HitGlass2";
			};
			
			class HitGlass3 : HitGlass1 {
				hitpoint = "HitGlass3";
			};
			
			class HitGlass4 : HitGlass1 {
				hitpoint = "HitGlass4";
			};
			
			class HitGlass5 : HitGlass1 {
				hitpoint = "HitGlass5";
			};
			
			class HitGlass6 : HitGlass1 {
				hitpoint = "HitGlass6";
			};
			
			class HitGlass7 : HitGlass1 {
				hitpoint = "HitGlass7";
			};
			
			class HitGlass8 : HitGlass1 {
				hitpoint = "HitGlass8";
			};
			
			class Hitarmor1 {
				source = "Hit";
				hitpoint = "";
				raw = 1;
			};
			
			class Hitarmor2 : Hitarmor1 {
				hitpoint = "";
			};
			
			class Hitarmor3 : Hitarmor1 {
				hitpoint = "";
			};
			
			class Hitarmor4 : Hitarmor1 {
				hitpoint = "";
			};
		};
		
		class HitPoints {
			class Hitarmor1 {
				armor = 1;
				material = -1;
				name = "pluhPredni";
				visual = "pluhPredni";
				passThrough = 0.2;
			};
			
			class Hitarmor2 : Hitarmor1 {
				name = "kolaOchrana";
				visual = "kolaOchrana";
			};
			
			class Hitarmor3 : Hitarmor1 {
				name = "oknaOchrana";
				visual = "oknaOchrana";
			};
			
			class Hitarmor4 : Hitarmor1 {
				name = "predniOknoOchrana";
				visual = "predniOknoOchrana";
			};
			
			class HitGlass1 {
				armor = 0.1;
				material = -1;
				name = "sklo_p";
				visual = "sklo_p";
				passThrough = false;
			};
			
			class HitGlass2 : HitGlass1 {
				name = "sklo_p1";
				visual = "sklo_p1";
			};
			
			class HitGlass3 : HitGlass1 {
				name = "sklo_p2";
				visual = "sklo_p2";
			};
			
			class HitGlass4 : HitGlass1 {
				name = "sklo_p3";
				visual = "sklo_p3";
			};
			
			class HitGlass5 : HitGlass1 {
				name = "sklo_l1";
				visual = "sklo_l1";
			};
			
			class HitGlass6 : HitGlass1 {
				name = "sklo_l2";
				visual = "sklo_l3";
			};
			
			class HitGlass7 : HitGlass1 {
				name = "sklo_l3";
				visual = "glass3";
			};
			
			class HitGlass8 : HitGlass1 {
				name = "sklo_z";
				visual = "sklo_z";
			};
			
			class HitLFWheel {
				armor = 0.3;
				material = -1;
				name = "levy predni tlumic";
				visual = "";
				passThrough = 0.2;
			};
			
			class HitLBWheel : HitLFWheel {
				name = "levy zadni tlumic";
				visual = "";
			};
			
			class HitRFWheel : HitLFWheel {
				name = "pravy predni tlumic";
				visual = "";
			};
			
			class HitRBWheel : HitLFWheel {
				name = "pravy zadni tlumic";
				visual = "";
			};
			
			class HitEngine {
				armor = 1.2;
				material = -1;
				name = "motor";
				visual = "motor";
				passThrough = "true";
			};
			
			class HitRGlass {
				armor = 0.5;
				material = 0;
				name = "sklo predni P";
				passThrough = "true";
			};
			
			class HitLGlass {
				armor = 0.5;
				material = 0;
				name = "sklo predni L";
				passThrough = "true";
			};
			
			class HitBody {
				armor = 0.4;
				material = -1;
				name = "karoserie";
				visual = "karoserie";
				passThrough = "true";
			};
			
			class HitFuel {
				armor = 1.4;
				material = -1;
				name = "palivo";
				passThrough = "true";
			};
		};
	};
	
	class ori_poldek_black : ori_poldek {
		displayName = "Polonez 78";
		hiddenSelections[] = {"Camo01", "taxi"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\polonez_rust_2_co.paa", ""};
	};
	
	class ori_survivorBus : Ori_car_turrets2 {
		vehicleClass = "car";
		faction = "rth_copter_class";
		displayName = "Scrap Bus";
		model = "\origins_pack\vehicles\rth_scrapbus_mg";
		icon = "\Ca\wheeled\data\map_ico\icomap_Bus_CA.paa";
		picture = "\Ca\wheeled\data\ico\bus_city_CA.paa";
		mapSize = 7;
		turnCoef = 3.7;
		steerAheadSimul = 0.5;
		steerAheadPlan = 0.38;
		hasGunner = true;
		scope = public;
		transportSoldier = 5;
		driverAction = "Ikarus_Driver";
		cargoAction[] = {"Truck_Cargo01", "Truck_Cargo01", "Truck_Cargo01", "Truck_Cargo01", "Truck_Cargo01", "Truck_Cargo01"};
		transportMaxMagazines = 120;
		transportMaxWeapons = 15;
		transportMaxBackpacks = 10;
		
		hiddenSelections[] = {"camo01"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\skins\ScrapBus\ScrapBus_red_co.paa"};
		
		class Damage {
			tex[] = {"rth_scrapbus\tex\bus_exterior_co.paa", "rth_scrapbus\tex\bus_exterior_co.paa", "rth_scrapbus\tex\damage_co.paa", "rth_scrapbus\tex\partsdiff.paa", "rth_scrapbus\tex\partsdiff.paa", "rth_scrapbus\tex\damage_co.paa"};
			mat[] = {"RTH_ScrapBus\tex\parts.rvmat", "RTH_ScrapBus\tex\parts.rvmat", "RTH_ScrapBus\tex\parts_destruct.rvmat", "ca\wheeled2\ikarus\data\bus_exterior.rvmat", "ca\wheeled2\ikarus\data\bus_exterior.rvmat", "RTH_ScrapBus\tex\parts_destruct.rvmat"};
		};
		
		class SoundEvents {
			class AccelerationIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\BUS\int\int-bus-acce-1", db-5, 1.0};
				limit = 0.15;
				expression = "engineOn*(1-camPos)*2*gmeterZ*((speed factor[1.5, 5]) min (speed factor[5, 1.5]))";
			};
			
			class AccelerationOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\BUS\ext\ext-bus-acce-1", db-5, 1.0, 280};
				limit = 0.15;
				expression = "engineOn*camPos*2*gmeterZ*((speed factor[1.5, 5]) min (speed factor[5, 1.5]))";
			};
		};
		
		class Sounds {
			class Engine {
				sound[] = {"\ca\sounds\Vehicles\Wheeled\BUS\ext\ext-bus-low-2", db0, 1.0, 350};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "engineOn*camPos*(thrust factor[0.7, 0.2])";
			};
			
			class EngineHighOut {
				sound[] = {"\ca\sounds\Vehicles\Wheeled\BUS\ext\ext-bus-high-4", db0, 1.0, 450};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "engineOn*camPos*(thrust factor[0.5, 0.9])";
			};
			
			class IdleOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\BUS\ext\ext-bus-idle-1", 0.316228, 1.0, 150};
				frequency = "1";
				volume = "engineOn*camPos*(rpm factor[0.4, 0])";
			};
			
			class TiresRockOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-rock2", 0.177828, 1.0, 30};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			
			class TiresSandOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-sand2", 0.177828, 1.0, 30};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			
			class TiresGrassOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-grass3", 0.177828, 1.0, 30};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			
			class TiresMudOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-mud2", 0.177828, 1.0, 30};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			
			class TiresGravelOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-gravel2", 0.177828, 1.0, 30};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			
			class TiresAsphaltOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-asphalt3", db-25, 1.0, 30};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			
			class NoiseOut {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\ext\ext-noise3", 0.177828, 1.0, 30};
				frequency = "1";
				volume = "camPos*(damper0 max 0.04)*(speed factor[0, 8])";
			};
			
			class EngineLowIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\BUS\int\int-bus-low-2", db0, 1.0};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "((engineOn*thrust) factor[0.65, 0.2])*(1-camPos)";
			};
			
			class EngineHighIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\BUS\int\int-bus-high-4", db0, 0.95};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "((engineOn*thrust) factor[0.55, 1.0])*(1-camPos)";
			};
			
			class IdleIn {
				sound[] = {"\ca\sounds\Vehicles\Wheeled\BUS\int\int-bus-idle-1", db-5, 1.0};
				frequency = "1";
				volume = "engineOn*(rpm factor[0.3, 0])*(1-camPos)";
			};
			
			class TiresRockIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-rock2", 0.177828, 1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			
			class TiresSandIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-sand2", 0.177828, 1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			
			class TiresGrassIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-grass3", 0.177828, 1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			
			class TiresMudIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-mud2", 0.177828, 1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			
			class TiresGravelIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-gravel2", 0.177828, 1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			
			class TiresAsphaltIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-asphalt3", 0.1, 1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			
			class NoiseIn {
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\int\int-noise3", 0.316228, 1.0};
				frequency = "1";
				volume = "(damper0 max 0.04)*(speed factor[0, 8])*(1-camPos)";
			};
			
			class Movement {
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
		};
		
		class AnimationSources {
			class platform_move {
				source = "user";
				animPeriod = 5;
				initPhase = 0;
			};
			
			class pluhPredni {
				source = "pluhPredni";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class kolaOchrana {
				source = "kolaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class oknaOchrana {
				source = "oknaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class predniOknoOchrana {
				source = "predniOknoOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel {
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel {
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel {
				hitpoint = "HitRBWheel";
			};
			
			class HitGlass1 {
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			
			class HitGlass2 : HitGlass1 {
				hitpoint = "HitGlass2";
			};
			
			class HitGlass3 : HitGlass1 {
				hitpoint = "HitGlass3";
			};
			
			class HitGlass4 : HitGlass1 {
				hitpoint = "HitGlass4";
			};
			
			class HitGlass5 : HitGlass1 {
				hitpoint = "HitGlass5";
			};
			
			class HitGlass6 : HitGlass1 {
				hitpoint = "HitGlass6";
			};
			
			class HitGlass7 : HitGlass1 {
				hitpoint = "HitGlass7";
			};
			
			class HitGlass8 : HitGlass1 {
				hitpoint = "HitGlass8";
			};
			
			class Hitarmor1 {
				source = "Hit";
				hitpoint = "";
				raw = 1;
			};
			
			class Hitarmor2 : Hitarmor1 {
				hitpoint = "";
			};
			
			class Hitarmor3 : Hitarmor1 {
				hitpoint = "";
			};
			
			class Hitarmor4 : Hitarmor1 {
				hitpoint = "";
			};
		};
		
		class HitPoints {
			class Hitarmor1 {
				armor = 1;
				material = -1;
				name = "pluhPredni";
				visual = "pluhPredni";
				passThrough = 0.2;
			};
			
			class Hitarmor2 : Hitarmor1 {
				name = "kolaOchrana";
				visual = "kolaOchrana";
			};
			
			class Hitarmor3 : Hitarmor1 {
				name = "oknaOchrana";
				visual = "oknaOchrana";
			};
			
			class Hitarmor4 : Hitarmor1 {
				name = "predniOknoOchrana";
				visual = "predniOknoOchrana";
			};
			
			class HitGlass1 {
				armor = 0.1;
				material = -1;
				name = "sklo_p";
				visual = "sklo_p";
				passThrough = false;
			};
			
			class HitGlass2 : HitGlass1 {
				name = "sklo_p1";
				visual = "sklo_p1";
			};
			
			class HitGlass3 : HitGlass1 {
				name = "sklo_p2";
				visual = "sklo_p2";
			};
			
			class HitGlass4 : HitGlass1 {
				name = "sklo_p3";
				visual = "sklo_p3";
			};
			
			class HitGlass5 : HitGlass1 {
				name = "sklo_l1";
				visual = "sklo_l1";
			};
			
			class HitGlass6 : HitGlass1 {
				name = "sklo_l2";
				visual = "sklo_l3";
			};
			
			class HitGlass7 : HitGlass1 {
				name = "sklo_l3";
				visual = "glass3";
			};
			
			class HitGlass8 : HitGlass1 {
				name = "sklo_z";
				visual = "sklo_z";
			};
			
			class HitLFWheel {
				armor = 0.3;
				material = -1;
				name = "wheel_1_1_steering";
				visual = "";
				passThrough = 0.2;
			};
			
			class HitLBWheel : HitLFWheel {
				name = "wheel_1_2_steering";
				visual = "";
			};
			
			class HitRFWheel : HitLFWheel {
				name = "wheel_2_1_steering";
				visual = "";
			};
			
			class HitRBWheel : HitLFWheel {
				name = "wheel_2_2_steering";
				visual = "";
			};
			
			class HitEngine {
				armor = 1.2;
				material = -1;
				name = "motor";
				visual = "motor";
				passThrough = "true";
			};
			
			class HitRGlass {
				armor = 0.5;
				material = 0;
				name = "sklo predni P";
				passThrough = "true";
			};
			
			class HitLGlass {
				armor = 0.5;
				material = 0;
				name = "sklo predni L";
				passThrough = "true";
			};
			
			class HitBody {
				armor = 0.4;
				material = -1;
				name = "karoserie";
				visual = "karoserie";
				passThrough = "true";
			};
			
			class HitFuel {
				armor = 1.4;
				material = -1;
				name = "palivo";
				passThrough = "true";
			};
		};
		
		class Turrets : Turrets {
			class MainTurret : MainTurret {
				enableManualFire = 1;
				body = "mainTurret";
				gun = "mainGun";
				outGunnerMayFire = true;
				forceHideGunner = true;
				castGunnerShadow = true;
				viewGunnerInExternal = true;
				gunnerOpticsModel = "\ca\Weapons\optika_empty";
				gunnerForceOptics = false;
				weapons[] = {PKT};
				soundServo[] = {};
				stabilizedInAxes = 0;
				magazines[] = {"100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK"};
				gunnerAction = "Hilux_Gunner";
				gunnerInAction = "Hilux_Gunner";
				ejectDeadGunner = true;
				minElev = -18;
				maxElev = 40;
				minTurn = -360;
				maxTurn = 360;
				initTurn = 0;
			};
		};
		
		class UserActions {
			class platform_on {
				displayName = "Platform Up";
				position = "eye";
				radius = 5;
				onlyForPlayer = 0;
				showWindow = 0;
				condition = "(alive this) && (player in [gunner this, driver this]) && (this animationPhase ""platform_move""< 0.5)";
				statement = "this animate [""platform_move"", 1]";
			};
			
			class platform_off {
				displayName = "Platform Down";
				position = "eye";
				radius = 5;
				showWindow = 0;
				onlyForPlayer = 0;
				condition = "(alive this) && (player in [gunner this, driver this]) && (this animationPhase ""platform_move"" >= 0.5)";
				statement = "this animate [""platform_move"", 0]";
			};
		};
	};
	
	class ori_transit : Pickup_PK_base {
		vehicleClass = "car";
		faction = "rth_copter_class";
		displayName = "Ford Transit MG";
		model = "\origins_pack\vehicles\vil_transit_mg";
		scope = public;
		transportSoldier = 5;
		driverAction = "Skodovka_Driver";
		cargoAction[] = {"HMMWV_Cargo01"};
		transportMaxMagazines = 120;
		transportMaxWeapons = 15;
		transportMaxBackpacks = 10;
		hiddenSelections[] = {"Camo01", "Camo02"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\transit_pd2_co.paa", "\CA\wheeled_e\Ural\Data\ural_plachta_civil_co.paa"};
		
		class Damage {
			tex[] = {};
			mat[] = {"origins_pack\vehicles\textures\plate.rvmat", "origins_pack\vehicles\textures\plate.rvmat", "origins_pack\vehicles\textures\plate_de.rvmat", "origins_pack\vehicles\textures\transitt.rvmat", "origins_pack\vehicles\textures\transitt.rvmat", "origins_pack\vehicles\textures\transitt_de.rvmat", "ca\wheeled\data\detailmapy\ural_plachta.rvmat", "ca\wheeled\data\detailmapy\ural_plachta_damage.rvmat", "ca\wheeled\data\detailmapy\ural_plachta_destruct.rvmat"};
		};
		
		class AnimationSources {
			class pluhPredni {
				source = "pluhPredni";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class kolaOchrana {
				source = "kolaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class oknaOchrana {
				source = "oknaOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class predniOknoOchrana {
				source = "predniOknoOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel {
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel {
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel {
				hitpoint = "HitRBWheel";
			};
			
			class HitGlass1 {
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			
			class HitGlass2 : HitGlass1 {
				hitpoint = "HitGlass2";
			};
			
			class HitGlass3 : HitGlass1 {
				hitpoint = "HitGlass3";
			};
			
			class HitGlass4 : HitGlass1 {
				hitpoint = "HitGlass4";
			};
			
			class HitGlass5 : HitGlass1 {
				hitpoint = "HitGlass5";
			};
			
			class HitGlass6 : HitGlass1 {
				hitpoint = "HitGlass6";
			};
			
			class HitGlass7 : HitGlass1 {
				hitpoint = "HitGlass7";
			};
			
			class HitGlass8 : HitGlass1 {
				hitpoint = "HitGlass8";
			};
			
			class Hitarmor1 {
				source = "Hit";
				hitpoint = "";
				raw = 1;
			};
			
			class Hitarmor2 : Hitarmor1 {
				hitpoint = "";
			};
			
			class Hitarmor3 : Hitarmor1 {
				hitpoint = "";
			};
			
			class Hitarmor4 : Hitarmor1 {
				hitpoint = "";
			};
		};
		
		class HitPoints {
			class Hitarmor1 {
				armor = 1;
				material = -1;
				name = "pluhPredni";
				visual = "pluhPredni";
				passThrough = 0.2;
			};
			
			class Hitarmor2 : Hitarmor1 {
				name = "kolaOchrana";
				visual = "kolaOchrana";
			};
			
			class Hitarmor3 : Hitarmor1 {
				name = "oknaOchrana";
				visual = "oknaOchrana";
			};
			
			class Hitarmor4 : Hitarmor1 {
				name = "predniOknoOchrana";
				visual = "predniOknoOchrana";
			};
			
			class HitGlass1 {
				armor = 0.1;
				material = -1;
				name = "sklo_p";
				visual = "sklo_p";
				passThrough = false;
			};
			
			class HitGlass2 : HitGlass1 {
				name = "sklo_p1";
				visual = "sklo_p1";
			};
			
			class HitGlass3 : HitGlass1 {
				name = "sklo_p2";
				visual = "sklo_p2";
			};
			
			class HitGlass4 : HitGlass1 {
				name = "sklo_p3";
				visual = "sklo_p3";
			};
			
			class HitGlass5 : HitGlass1 {
				name = "sklo_l1";
				visual = "sklo_l1";
			};
			
			class HitGlass6 : HitGlass1 {
				name = "sklo_l2";
				visual = "sklo_l3";
			};
			
			class HitGlass7 : HitGlass1 {
				name = "sklo_l3";
				visual = "glass3";
			};
			
			class HitGlass8 : HitGlass1 {
				name = "sklo_z";
				visual = "sklo_z";
			};
			
			class HitLFWheel {
				armor = 0.3;
				material = -1;
				name = "levy predni tlumic";
				visual = "";
				passThrough = 0.2;
			};
			
			class HitLBWheel : HitLFWheel {
				name = "levy zadni tlumic";
				visual = "";
			};
			
			class HitRFWheel : HitLFWheel {
				name = "pravy predni tlumic";
				visual = "";
			};
			
			class HitRBWheel : HitLFWheel {
				name = "pravy zadni tlumic";
				visual = "";
			};
			
			class HitEngine {
				armor = 1.2;
				material = -1;
				name = "motor";
				visual = "motor";
				passThrough = "true";
			};
			
			class HitRGlass {
				armor = 0.5;
				material = 0;
				name = "sklo predni P";
				passThrough = "true";
			};
			
			class HitLGlass {
				armor = 0.5;
				material = 0;
				name = "sklo predni L";
				passThrough = "true";
			};
			
			class HitBody {
				armor = 0.4;
				material = -1;
				name = "karoserie";
				visual = "karoserie";
				passThrough = "true";
			};
			
			class HitFuel {
				armor = 1.4;
				material = -1;
				name = "palivo";
				passThrough = "true";
			};
		};
	};
	/*
	class ori_transit_blue : ori_transit {
		displayName = "Ford Transit (MG) (Blue)";
		hiddenSelections[] = {"Camo01", "Camo02"};
		hiddenSelectionsTextures[] = {"\origins_pack\vehicles\textures\transit_pd2_co.paa", "\CA\wheeled_e\Ural\Data\ural_plachta_civil_co.paa"};
	};
	*/
	class ori_excavator : Ori_car_turrets2 {
		vehicleClass = "car";
		faction = "rth_copter_class";
		displayName = "Excavator";
		model = "\origins_pack\vehicles\vil_koparka";
		icon = "\origins_pack\vehicles\textures\ico_kopara_CA.paa";
		picture = "\Ca\wheeled\data\ico\bus_city_CA.paa";
		mapSize = 7;
		turnCoef = 3.7;
		armor = 80;
		steerAheadSimul = 0.5;
		steerAheadPlan = 0.38;
		hasGunner = true;
		scope = public;
		transportSoldier = 0;
		transportMaxMagazines = 120;
		transportMaxWeapons = 15;
		transportMaxBackpacks = 10;
		driverAction="Skodovka_Driver";
		gunnerAction="Skodovka_Cargo01";
		memoryPointsGetInDriver = "pos driver";
		memoryPointsGetInDriverDir = "pos driver dir";
		memoryPointsGetInGunner = "pos gunner";
		memoryPointsGetInGunnerDir = "pos gunner dir";
		maxSpeed = 60;

		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction="vyfuk konec";
				effect="ExhaustsEffectBig";
			};
		};
		
		class Reflectors
		{
			class Left1
			{
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				brightness = 0.8;
			};
			
			class Right1
			{
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
				size = 1;
				brightness = 0.8;
			};
		};
		class Damage
		{
			tex[] = {};
			mat[] = {origins_pack\vehicles\textures\koparka.rvmat,origins_pack\vehicles\textures\koparka.rvmat,origins_pack\vehicles\textures\koparka_de.rvmat};
		};
		
		class SoundEvents
		{
		   class AccelerationIn
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Armored_Vehicle\int\int-AV-acce-01",0.562341,1.0};
			limit = "0.15";
			expression = "engineOn*(1-camPos)*2*gmeterZ*((speed factor[1.5, 5]) min (speed factor[5, 1.5]))";
		   };
		   class AccelerationOut
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Armored_Vehicle\ext\ext-AV-acce-01",0.562341,1.0,300};
			limit = "0.15";
			expression = "engineOn*camPos*2*gmeterZ*((speed factor[1.5, 5]) min (speed factor[5, 1.5]))";
		   };
		};
		
		class Sounds
		{
		   class Engine
		   {
			sound[] = {"\ca\sounds\Vehicles\Wheeled\Armored_Vehicle\ext\ext-AV-engine-02low",1.41254,1.0,400};
			frequency = "(randomizer*0.05+0.95)*rpm";
			volume = "engineOn*camPos*(thrust factor[0.7, 0.2])";
		   };
		   class EngineHighOut
		   {
			sound[] = {"\ca\sounds\Vehicles\Wheeled\Armored_Vehicle\ext\ext-AV-engine-02high",1.41254,1.0,500};
			frequency = "(randomizer*0.05+0.95)*rpm";
			volume = "engineOn*camPos*(thrust factor[0.5, 0.9])";
		   };
		   class IdleOut
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Armored_Vehicle\ext\ext-AV-idle-02",0.562341,1.0,200};
			frequency = "1";
			volume = "engineOn*camPos*(rpm factor[0.4, 0])";
		   };
		   class TiresRockOut
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-rock2",0.316228,1.0,50};
			frequency = "1";
			volume = "camPos*rock*(speed factor[2, 20])";
		   };
		   class TiresSandOut
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-sand2",0.316228,1.0,50};
			frequency = "1";
			volume = "camPos*sand*(speed factor[2, 20])";
		   };
		   class TiresGrassOut
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-grass3",0.316228,1.0,50};
			frequency = "1";
			volume = "camPos*grass*(speed factor[2, 20])";
		   };
		   class TiresMudOut
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-mud2",0.316228,1.0,50};
			frequency = "1";
			volume = "camPos*mud*(speed factor[2, 20])";
		   };
		   class TiresGravelOut
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-gravel2",0.316228,1.0,50};
			frequency = "1";
			volume = "camPos*gravel*(speed factor[2, 20])";
		   };
		   class TiresAsphaltOut
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-asphalt3",0.316228,1.0,50};
			frequency = "1";
			volume = "camPos*asphalt*(speed factor[2, 20])";
		   };
		   class NoiseOut
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\ext\noise3",0.562341,1.0,50};
			frequency = "1";
			volume = "camPos*(damper0 max 0.04)*(speed factor[0, 8])";
		   };
		   class EngineLowIn
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Armored_Vehicle\int\int-AV-engine-02low",1.41254,1.0};
			frequency = "(randomizer*0.05+0.95)*rpm";
			volume = "((engineOn*thrust) factor[0.65, 0.2])*(1-camPos)";
		   };
		   class EngineHighIn
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Armored_Vehicle\int\int-AV-engine-02high",1.41254,0.8};
			frequency = "(randomizer*0.05+0.95)*rpm";
			volume = "((engineOn*thrust) factor[0.55, 1.0])*(1-camPos)";
		   };
		   class IdleIn
		   {
			sound[] = {"\ca\sounds\Vehicles\Wheeled\Armored_Vehicle\int\int-AV-idle-02",0.398107,1.0};
			frequency = "1";
			volume = "engineOn*(rpm factor[0.4, 0])*(1-camPos)";
		   };
		   class TiresRockIn
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-rock2",0.177828,1.0};
			frequency = "1";
			volume = "(1-camPos)*rock*(speed factor[2, 20])";
		   };
		   class TiresSandIn
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-sand2",0.177828,1.0};
			frequency = "1";
			volume = "(1-camPos)*sand*(speed factor[2, 20])";
		   };
		   class TiresGrassIn
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-grass3",0.177828,1.0};
			frequency = "1";
			volume = "(1-camPos)*grass*(speed factor[2, 20])";
		   };
		   class TiresMudIn
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-mud2",0.177828,1.0};
			frequency = "1";
			volume = "(1-camPos)*mud*(speed factor[2, 20])";
		   };
		   class TiresGravelIn
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-gravel2",0.177828,1.0};
			frequency = "1";
			volume = "(1-camPos)*gravel*(speed factor[2, 20])";
		   };
		   class TiresAsphaltIn
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-asphalt3",0.177828,1.0};
			frequency = "1";
			volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
		   };
		   class NoiseIn
		   {
			sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\int\noise4",0.562341,1.0};
			frequency = "1";
			volume = "(damper0 max 0.04)*(speed factor[0, 8])*(1-camPos)";
		   };
		};
		
		class AnimationSources
		{
			class noga1
			{
				source = "user";
				animPeriod = 5;
				initPhase = 0;
			};	
			class noga2
			{
				source = "user";
				animPeriod = 5;
				initPhase = 0;
			};				
			class noga2stup
			{
				source = "user";
				animPeriod = 5;
				initPhase = 0;
			};	
			class noga1stup
			{
				source = "user";
				animPeriod = 5;
				initPhase = 0;
			};	
			class ramie1
			{
				source = "user";
				animPeriod = 5;
				initPhase = 1;
			};
			class ramie2
			{
				source = "user";
				animPeriod = 5;
				initPhase = 1;
			};
			class lyzka
			{
				source = "user";
				animPeriod = 5;
				initPhase = 1;
			};
			class lyzkaasist
			{
				source = "user";
				animPeriod = 5;
				initPhase = 1;
			};
			class silownik3
			{
				source = "user";
				animPeriod = 5;
				initPhase = 1;
			};
			class silownik2
			{
				source = "user";
				animPeriod = 5;
				initPhase = 1;
			};
			class silownik1
			{
				source = "user";
				animPeriod = 5;
				initPhase = 1;
			};
			class HitLFWheel
			{
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel
			{
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel
			{
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel
			{
				hitpoint = "HitRBWheel";
			};
			
			class HitGlass1
			{
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			
			class HitGlass2 : HitGlass1
			{
				hitpoint = "HitGlass2";
			};
			
			class HitGlass3 : HitGlass1
			{
				hitpoint = "HitGlass3";
			};
			
			class HitGlass5 : HitGlass1
			{
				hitpoint = "HitGlass5";
			};
			
			class HitGlass6 : HitGlass1
			{
				hitpoint = "HitGlass6";
			};
			
			};
		
		class Turrets : Turrets
		{
			class MainTurret : MainTurret
			{
				enableManualFire = 1;
				soundServo[]={"\ca\Weapons\Data\Sound\gun_elevate",0.001000,0.900000};
				maxhorizontalrotspeed = 1.8;
				gunnerName ="Operator";
				body = "mainTurret";
				gun = "";
				outGunnerMayFire = true;
				forceHideGunner = true;
				castGunnerShadow = true;
				viewGunnerInExternal = true;
				gunnerOpticsModel = "\ca\Weapons\optika_empty";
				gunnerForceOptics = true;
				weapons[] = {};
				stabilizedInAxes = 0;
				magazines[] = {};
				gunnerAction = "Skodovka_Driver";
				gunnerInAction = "Skodovka_Driver";
				ejectDeadGunner = true;
				minElev = -18;
				maxElev = 40;
				minTurn = -360;
				maxTurn = 360;
				initTurn = 0;
				turretAxis = "OsaVeze";
			};
		};
	
	class HitPoints
	{
			class HitGlass1
			{
				armor = 0.1;
				material = -1;
				name = "sklo_p";
				visual = "sklo_p";
				passThrough = false;
			};
			
			class HitGlass2 : HitGlass1
			{
				name = "sklo_p1";
				visual = "sklo_p1";
			};
			
			class HitGlass3 : HitGlass1
			{
				name = "sklo_p2";
				visual = "sklo_p2";
			};
			
			class HitGlass5 : HitGlass1
			{
				name = "sklo_l1";
				visual = "sklo_l1";
			};
			class HitGlass6 : HitGlass1
			{
				name = "sklo_l2";
				visual = "sklo_l2";
			};
			
			class HitLFWheel
			{
				armor = 0.8;
				material = -1;
				name = "levy predni tlumic";
				visual = "";
				passThrough = 0.2;
			};
			
			class HitLBWheel : HitLFWheel
			{
				name = "levy zadni tlumic";
				visual = "";
			};
			
			class HitRFWheel : HitLFWheel
			{
				name = "pravy predni tlumic";
				visual = "";
			};
			
			class HitRBWheel : HitLFWheel
			{
				name = "pravy zadni tlumic";
				visual = "";
			};
			
			class HitEngine
			{
				armor = 1.2;
				material = -1;
				name = "motor";
				visual = "motor";
				passThrough = "true";
			};
			
			class HitRGlass
			{
				armor = 0.5;
				material = 0;
				name = "sklo predni P";
				passThrough = "true";
			};
			
			class HitLGlass
			{
				armor = 0.5;
				material = 0;
				name = "sklo predni L";
				passThrough = "true";
			};
			
			class HitBody
			{
				armor = 0.4;
				material = -1;
				name = "karoserie";
				visual = "karoserie";
				passThrough = "true";
			};
			
			class HitFuel
			{
				armor = 1.4;
				material = -1;
				name = "palivo";
				passThrough = "true";
			};
		};
	};

	class SUV_Special : SUV_Base_EP1 {
		scope = 2;
		faction = "rth_copter_class";
		displayName = "SUV Special";
		hiddenSelectionsTextures[] = {"\dayz\textures\suv\suv_body_special_co.paa"};
	};
	
	
	class ArmoredSUV_Base_Ori: Car
	{
		scope = 1;
		htMin = 60;
		htMax = 1800;
		afMax = 200;
		mfMax = 100;
		mFact = 1;
		tBody = 200;
		expansion = 4;
		displayName = "$STR_PMC_DN_SUV_ARMORED";
		model = "\Ca\Wheeled_PMC\ArmoredSUV\armoredSUV_PMC.p3d";
		icon = "\ca\Wheeled_PMC\data\ui\Icon_suv_minigun_PMC.paa";
		picture = "\ca\Wheeled_PMC\data\ui\Picture_suv_minigun_PMC_ca.paa";
		mapSize = 7;
		maxSpeed = 230;
		accuracy = 0.2;
		armor = 40;
		damageResistance = 0.03099;
		transportSoldier = 3;
		fuelCapacity = 130;
		weapons[] = {"MiniCarHorn"};
		driverAction = "SUV_Driver_EP1";
		cargoAction[] = {"SUV_Cargo_EP1","SUV_Cargo02_EP1","SUV_Cargo01_EP1"};
		outsideSoundFilter = 1;
		insideSoundCoef = 0.8;
		soundGear[] = {"",5.6234134e-005,1};
		soundGetIn[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_door",0.56234133,1};
		soundGetOut[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_door",0.56234133,1,20};
		soundEngineOnInt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_start",0.17782794,1.0};
		soundEngineOnExt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_start",0.17782794,1.0,100};
		soundEngineOffInt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_stop",0.17782794,1.0};
		soundEngineOffExt[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_stop",0.17782794,1.0,100};
		buildCrash0[] = {"Ca\sounds\Vehicles\Crash\crash_building_01",0.70794576,1,200};
		buildCrash1[] = {"Ca\sounds\Vehicles\Crash\crash_building_02",0.70794576,1,200};
		buildCrash2[] = {"Ca\sounds\Vehicles\Crash\crash_building_03",0.70794576,1,200};
		buildCrash3[] = {"Ca\sounds\Vehicles\Crash\crash_building_04",0.70794576,1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_01",0.70794576,1,200};
		WoodCrash1[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_02",0.70794576,1,200};
		WoodCrash2[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_03",0.70794576,1,200};
		WoodCrash3[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_04",0.70794576,1,200};
		WoodCrash4[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_05",0.70794576,1,200};
		WoodCrash5[] = {"Ca\sounds\Vehicles\Crash\crash_mix_wood_06",0.70794576,1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_01",0.70794576,1,200};
		ArmorCrash1[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_02",0.70794576,1,200};
		ArmorCrash2[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_03",0.70794576,1,200};
		ArmorCrash3[] = {"Ca\sounds\Vehicles\Crash\crash_vehicle_04",0.70794576,1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class SoundEvents
		{
			class AccelerationIn
			{
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_accelerate_3_x",0.56234133,1.0};
				limit = "0.4";
				expression = "(engineOn*(1-camPos))*gmeterZ";
			};
			class AccelerationOut
			{
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_accelerate_3",0.56234133,1.0,200};
				limit = "0.4";
				expression = "(engineOn*camPos)*gmeterZ";
			};
		};
		class Sounds
		{
			class Engine
			{
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_low",0.17782794,1.4,100};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "camPos*engineOn*((rpm factor[0.3, 0.4]) min (rpm factor[0.7, 0.5]))";
			};
			class EngineHighOut
			{
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_high",1.0,0.8,300};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "camPos*engineOn*(rpm factor[0.5, 0.8])";
			};
			class IdleOut
			{
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_idle",0.56234133,1.0,100};
				frequency = "1";
				volume = "engineOn*camPos*(rpm factor[0.4, 0])";
			};
			class TiresRockOut
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-rock2",0.31622776,1.0,30};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-sand2",0.31622776,1.0,30};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-grass2",0.31622776,1.0,30};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-mud2",0.31622776,1.0,30};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-gravel2",0.31622776,1.0,30};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\ext\ext-tires-asphalt3",0.31622776,1.0,30};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\ext\noise2",0.1,1.0,30};
				frequency = "1";
				volume = "camPos*(damper0 max 0.03)*(speed factor[0, 8])";
			};
			class EngineLowIn
			{
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_low_x",0.31622776,1.4};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "(1-camPos)*engineOn*((rpm factor[0.3, 0.4]) min (rpm factor[0.7, 0.45]))";
			};
			class EngineHighIn
			{
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_high_x",1.0,0.8};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "(1-camPos)*engineOn*(rpm factor[0.5, 0.8])";
			};
			class IdleIn
			{
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_idle_x",0.31622776,1.0};
				frequency = "1";
				volume = "engineOn*(rpm factor[0.4, 0])*(1-camPos)";
			};
			class TiresRockIn
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-rock2",0.31622776,1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-sand2",0.31622776,1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-grass2",0.31622776,1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-mud2",0.31622776,1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-gravel2",0.31622776,1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Tires\int\int-tires-asphalt3",0.31622776,1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"\ca\SOUNDS\Vehicles\Wheeled\Noises\int\noise2",0.17782794,1.0};
				frequency = "1";
				volume = "(damper0 max 0.03)*(speed factor[0, 8])*(1-camPos)";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
		};
		class Turrets: Turrets
		{
			class MainTurret: Mainturret
			{
				class ViewOptics;
			};
		};
		class AnimationSources;
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.4;
			};
			class HitLBWheel: HitLBWheel
			{
				armor = 0.4;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.4;
			};
			class HitRBWheel: HitRBWheel
			{
				armor = 0.4;
			};
			class HitFuel: HitFuel
			{
				armor = 1;
				passThrough = 1;
			};
			class HitEngine: HitEngine
			{
				armor = 1;
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 1;
			};
			class HitGlass2: HitGlass2
			{
				armor = 1;
			};
			class HitGlass3: HitGlass3
			{
				armor = 1;
			};
			class HitGlass4: HitGlass4
			{
				armor = 1;
			};
		};
		class Damage
		{
			tex[] = {};
			mat[] = {"Ca\Wheeled_PMC\ArmoredSUV\data\SUV_body.rvmat","Ca\Wheeled_PMC\ArmoredSUV\data\SUV_body_damage.rvmat","Ca\Wheeled_PMC\ArmoredSUV\data\SUV_body_destruct.rvmat","Ca\Wheeled_PMC\ArmoredSUV\data\SUV_chrom.rvmat","Ca\Wheeled_PMC\ArmoredSUV\data\SUV_chrom_damage.rvmat","Ca\Wheeled_PMC\ArmoredSUV\data\SUV_chrom_destruct.rvmat","Ca\Wheeled_PMC\ArmoredSUV\data\SUV_glass.rvmat","Ca\Wheeled_PMC\ArmoredSUV\data\SUV_glass_damage.rvmat","Ca\Wheeled_PMC\ArmoredSUV\data\SUV_glass_destruct.rvmat","Ca\Ca_E\data\default.rvmat","Ca\Ca_E\data\default.rvmat","Ca\Ca_E\data\default_destruct.rvmat"};
		};
		class Library
		{
			libTextDesc = "$STR_PMC_LIB_ARMOREDSUV";
		};
	};
	class SUV_MG_Ori: ArmoredSUV_Base_Ori
	{
		scope = 2;
		side = 2;
		displayName = "SUV MG";
		faction = "rth_copter_class";
		crew = "";
		typicalCargo[] = {};
		transportMaxMagazines = 160;
		transportMaxWeapons = 25;
		transportMaxBackpacks = 4;
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				body = "mainTurret";
				gun = "mainGun";
				viewGunnerInExternal = 1;
				minElev = -30;
				maxElev = 45;
				initElev = 0;
				soundServo[] = {"",0.01,1.0};
				animationSourceHatch = "";
				stabilizedInAxes = "StabilizedInAxesNone";
				gunBeg = "muzzle_1";
				gunEnd = "chamber_1";
				weapons[] = {"PKT"};
				magazines[] = {"100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK"};
				maxHorizontalRotSpeed = 1.8;
				maxVerticalRotSpeed = 1.8;
				commanding = -2;
				gunnerAction = "ArmoredSUV_Gunner_PMC";
			};
		};
		
		class AnimationSources: AnimationSources
		{
			class Revolving
			{
				source = "revolving";
				weapon = "PKT";
			};
			class HideGun_01
			{
				source = "user";
				initPhase = 0;
				animPeriod = 1.2;
			};
			class HideGun_02: HideGun_01{};
			class HideGun_03: HideGun_01{};
			class HideGun_04: HideGun_01{};
			class CloseCover1
			{
				source = "user";
				initPhase = 0;
				animPeriod = 0.7;
			};
			class CloseCover2: CloseCover1{};
		};
	};
	
};
