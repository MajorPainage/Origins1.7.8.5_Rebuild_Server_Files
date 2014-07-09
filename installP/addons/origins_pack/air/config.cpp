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

#define VSoft		0
#define VArmor		1
#define VAir		2

class CfgPatches {
	class vil_ori_autogyro {
		units[] = {"vil_ori_autogyro"};
		weapons[] = {};
		requiredAddons[] = {};
	};
};

class CfgFactionClasses {
	class rth_copter_class {
		displayName = "Dayz: Origins";
		priority = 0;
		side = TWest;
	};
};

class cfgVehicles {
	class Helicopter;	// External class reference
	
	class vil_ori_autogyro : Helicopter {
		scope = public;
		canfloat = true;
		icon = "\origins_pack\air\ico_map\gyro_copter_map_ca.paa";
		picture = "\rth_copter\ico\copter_ico_ca.paa";
		model = "\origins_pack\air\vil_ori_autogyro.p3d";
		faction = "rth_copter_class";
		displayName = "Uni Copter";
		vehicleClass = "Air";
		transportSoldier = 0;
		ejectDamageLimit = 0.85;
		fuelCapacity = 300;
		transportMaxMagazines = 100;
		transportMaxWeapons = 10;
		transportMaxBackpacks = 3;
		cargoIsCoDriver[] = {1, 0};
		side = 2;
		radartype = 0;
		crew = "";
		DriverAction = "Mi8_Pilot";
		maxSpeed = 200;
		armor = 27;
		gearRetracting = false;
		cost = 500000;
		hasGunner = false;
		typicalCargo[] = {"Pilot"};
		weapons[] = {};
		magazines[] = {};
		supplyRadius = 2.5;
		type = VAir;
		enableManualFire = 0;
		viewCargoShadow = false;
		viewDriverShadow = false;
		threat[] = {1, 1, 1};
		crewVulnerable = 1;
		
		class Turrets {};
		memoryPointsGetInDriver = "pos driver";
		memoryPointsGetInDriverDir = "pos driver dir";
		soundGetIn[] = {"ca\sounds\Air\Mi17\ext\ext-Mi17-getin-01", db0, 1, 50};
		soundGetOut[] = {"ca\sounds\Air\Mi17\ext\ext-Mi17-getout-01", db0, 1, 50};
		soundDammage[] = {"ca\sounds\Air\Mi17\int\alarm_loop1", 0.001, 1, 100};
		soundEngineOnInt[] = {"ca\sounds\Air\Mi17\int\int-Mi17-start-1a", 0.562341, 1.0, 180};
		soundEngineOnExt[] = {"ca\sounds\Air\Mi17\ext\ext-Mi17-start-01a", 0.794328, 1.0, 180};
		soundEngineOffInt[] = {"ca\sounds\Air\Mi17\int\int-Mi17-stop-1a", 0.562341, 1.0, 180};
		soundEngineOffExt[] = {"ca\sounds\Air\Mi17\ext\ext-Mi17-stop-01a", 0.794328, 1.0, 180};
		
		class Exhausts {
			class Exhaust1 {
				position = "vyfuk start";
				direction = "vyfuk end";
				effect = "ExhaustsEffectBig";
			};
			
			class Exhaust2 {
				position = "vyfuk start1";
				direction = "vyfuk end1";
				effect = "ExhaustsEffectBig";
			};
		};
		
		class Sounds {
			class Engine {
				sound[] = {"Ca\Sounds_E\Air_E\AH6\ah6_engine_ext_1", db10, 1.0, 180};
				frequency = "rotorSpeed";
				volume = "camPos*((rotorSpeed-0.72)*4)";
			};
			
			class RotorLowOut {
				sound[] = {"Ca\Sounds_E\Air_E\AH6\ah6_rotor_ext_1", db10, 1.0, 180};
				frequency = "rotorSpeed";
				volume = "camPos*(0 max (rotorSpeed-0.1))";
				cone[] = {1.8, 3.14, 2.0, 0.9};
			};
			
			class RotorHighOut {
				sound[] = {"Ca\Sounds_E\Air_E\AH6\ah6_rotor_ext_high_1", db5, 1.0, 200};
				frequency = "rotorSpeed";
				volume = "camPos*10*(0 max (rotorThrust-0.95))";
				cone[] = {1.8, 3.14, 2.0, 0.9};
			};
			
			class EngineIn {
				sound[] = {"Ca\Sounds_E\Air_E\AH6\ah6_engine_ext_1", db2, 1.0, 200};
				frequency = "rotorSpeed";
				volume = "(1-camPos)*((rotorSpeed-0.75)*4)";
			};
			
			class RotorLowIn {
				sound[] = {"Ca\Sounds_E\Air_E\AH6\ah6_rotor_ext_1", db2, 1.0, 200};
				frequency = "rotorSpeed";
				volume = "2*(1-camPos)*((rotorSpeed factor[0.3, 1.1]) min (rotorSpeed factor[1.1, 0.3]))";
			};
			
			class RotorHighIn {
				sound[] = {"Ca\Sounds_E\Air_E\AH6\ah6_rotor_ext_high_1", db6, 1.0, 200};
				frequency = "rotorSpeed";
				volume = "(1-camPos)*3*(rotorThrust-0.9)";
			};
		};
		
		class AnimationSources{
			class predniOknoOchrana
			{
				source = "predniOknoOchrana";
				animPeriod = 1;
				initPhase = 0;
			};
		};
		
		class HitPoints {
			class HitHull {
				armor = 1;
				material = 51;
				name = "trup";
				visual = "trup";
				passThrough = true;
			};
			
			class HitEngine {
				armor = 0.7;
				material = 51;
				name = "motor";
				visual = "motor";
				passThrough = true;
			};
			
			class HitAvionics {
				armor = 0.5;
				material = 51;
				name = "elektronika";
				visual = "elektronika";
				passThrough = true;
			};
			
			class HitVRotor {
				armor = 0.5;
				material = 51;
				name = "mala vrtule";
				visual = "mala vrtule staticka";
				passThrough = 0.3;
			};
			
			class HitHRotor {
				armor = 0.5;
				material = 51;
				name = "velka vrtule";
				visual = "velka vrtule staticka";
				passThrough = 0.1;
			};
		};
		
		class Damage {
			tex[] = {"ca\structures\data\metal\metal_universal_dirty_co.paa", "ca\structures\data\metal\metal_universal_dirty_co.paa", "rth_copter\tex\damage_co.paa", "ca\structures\data\metal\metal_plates3_co.paa", "ca\structures\data\metal\metal_plates3_co.paa", "rth_copter\tex\damage_co.paa", "CA\structures\Data\Metal\metalclean1_co.paa", "CA\structures\Data\Metal\metalclean1_co.paa", "rth_copter\tex\damage_co.paa", "ca\structures\data\metal\metalcoloured_co.paa", "ca\structures\data\metal\metalcoloured_co.paa", "rth_copter\tex\damage_co.paa", "ca\structures\data\metal\metalrust1_co.paa", "ca\structures\data\metal\metalrust1_co.paa", "rth_copter\tex\damage_co.paa", "ca\structures\data\metal\metalthread_co.paa", "ca\structures\data\metal\metalthread_co.paa", "rth_copter\tex\damage_co.paa", "ca\structures\data\roof\roof_ethernit_co.paa", "ca\structures\data\roof\roof_ethernit_co.paa", "rth_copter\tex\damage_co.paa", "CA\structures\Data\Wood\wood_barkstripped_co.paa", "CA\structures\Data\Wood\wood_barkstripped_co.paa", "rth_copter\tex\damage_co.paa", "ca\structures\data\wood\woodpainted_01_co.paa", "ca\structures\data\wood\woodpainted_01_co.paa", "rth_copter\tex\damage_co.paa", "taviana\budovy\tex\metal_co.paa", "taviana\budovy\tex\metal_co.paa", "rth_copter\tex\damage_co.paa", "taviana\budovy\tex\metal_yellow_co.paa", "taviana\budovy\tex\metal_yellow_co.paa", "rth_copter\tex\damage_co.paa", "ca\structures\data\metal\metalcoloured1_co.paa", "ca\structures\data\metal\metalcoloured1_co.paa", "rth_copter\tex\damage_co.paa"};
			mat[] = {};
		};
		
		class Library {
			libTextDesc = "Homemade uni helicopter";
		};
	};
};
