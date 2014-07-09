class CfgPatches {
	class origins_pack_cars {
		units[] = {"ori_rth_originsmod_bathmobile"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"CAWheeled"};
	};
};

class CfgFactionClasses {
	class rth_copter_class {
		displayName = "Dayz: Origins";
		priority = 0;
		side = 1;
	};
};

class CfgVehicles {
	class Car;	// External class reference
	
	class ori_rth_originsmod_bathmobile : Car {
		weapons[] = {"TruckHorn"};
		faction = "rth_copter_class";
		scope = 2;
		side = 3;
		vehicleClass = "Car";
		model = "origins_pack\vehicles\bathmobile\bathmobile";
		icon = "origins_pack\vehicles\bathmobile\map_ico\bathmobile_ca.paa";
		picture = "origins_pack\vehicles\bathmobile\ico\bathmobile_ca.paa";
		mapSize = 7;
		crew = "Citizen1";
		typicalCargo[] = {"Profiteer2"};
		displayName = "Bathmobile";
		armor = 45;
		damperSize = 0.2;
		damperForce = 1.5;
		damperDamping = 2;
		steerAheadSimul = 0.2;
		steerAheadPlan = 0.3;
		predictTurnSimul = 0.9;
		predictTurnPlan = 1.0;
		fuelCapacity = 200;
		memoryPointsGetInDriver = "pos driver";
		memoryPointsGetInDriverDir = "pos driver dir";
		memoryPointsGetInCargo = "pos cargo";
		memoryPointsGetInCargoDir = "pos cargo dir";
		preferRoads = 0;
		crewVulnerable = 1;
		
		class Exhausts {
			class Exhaust1 {
				position = "vyfuk start";
				direction = "vyfuk finish";
				effect = "ExhaustsEffect";
			};
			
			class Exhaust2 {
				position = "vyfuk start2";
				direction = "vyfuk finish2";
				effect = "ExhaustsEffect";
			};
		};
		wheelCircumference = 2.06089;
		maxSpeed = 200;
		driverAction = "Golf_Driver";
		transportSoldier = 1;
		cargoAction[] = {"Truck_Cargo02"};
		hasGunner = 0;
		terrainCoef = 2.0;
		turnCoef = 1.0;
		
		class Turrets {};
		rarityUrban = 0.9;
		transportMaxMagazines = 100;
		transportMaxWeapons = 10;
		transportMaxBackpacks = 10;
		viewCargoShadow = 1;
		viewDriverShadow = 1;
		soundGear[] = {"", 5.62341e-005, 1};
		soundGetIn[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_door", 0.562341, 1};
		soundGetOut[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_door", 0.562341, 1, 20};
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
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_accelerate_3_x", 0.562341, 1.0};
				limit = 0.4;
				expression = "(engineOn*(1-camPos))*gmeterZ";
			};
			
			class AccelerationOut {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_accelerate_3", 0.562341, 1.0, 200};
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
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_high", 1.0, 0.8, 300};
				frequency = "(randomizer*0.05+0.95)*rpm";
				volume = "camPos*engineOn*(rpm factor[0.5, 0.8])";
			};
			
			class IdleOut {
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_ext_idle", 0.562341, 1.0, 100};
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
				sound[] = {"ca\Sounds_E\Wheeled_E\SUV\SUV_int_high_x", 1.0, 0.8};
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
		
		class AnimationSources {
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			
			class HitRFWheel : HitLFWheel {
				source = "Hit";
				hitpoint = "HitRFWheel";
			};
			
			class HitLBWheel : HitLFWheel {
				source = "Hit";
				hitpoint = "HitLBWheel";
			};
			
			class HitRBWheel : HitLFWheel {
				source = "Hit";
				hitpoint = "HitRBWheel";
			};
			
			class oknaOchrana {
				AnimPeriod = 0;
				source = "oknaOchrana";
				InitPhase = 1;
			};
			
			class kolaOchrana {
				AnimPeriod = 0;
				source = "kolaOchrana";
				InitPhase = 1;
			};
			
			class pluhPredni {
				AnimPeriod = 0;
				source = "pluhPredni";
				InitPhase = 1;
			};
		};
		
		class HitPoints {
			class HitEngine {
				armor = 1.2;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0;
			};
			
			class HitBody {
				armor = 1;
				material = -1;
				name = "karoserie";
				visual = "";
				passThrough = 0;
			};
			
			class HitFuel {
				armor = 0.3;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0;
			};
			
			class HitLFWheel {
				armor = 0.15;
				material = -1;
				name = "wheel_1_1_steering";
				visual = "";
				passThrough = 0;
			};
			
			class HitLBWheel {
				armor = 0.15;
				material = -1;
				name = "wheel_1_2_steering";
				visual = "";
				passThrough = 0;
			};
			
			class HitRFWheel {
				armor = 0.15;
				material = -1;
				name = "wheel_2_1_steering";
				visual = "";
				passThrough = 0;
			};
			
			class HitRBWheel {
				armor = 0.15;
				material = -1;
				name = "wheel_2_2_steering";
				visual = "";
				passThrough = 0;
			};
		};
		
		class Damage {
			tex[] = {};
			mat[] = {"origins_pack\vehicles\bathmobile\textures\car.rvmat", "origins_pack\vehicles\bathmobile\textures\car.rvmat", "origins_pack\vehicles\bathmobile\textures\car_destruct.rvmat", "origins_pack\vehicles\bathmobile\textures\engine.rvmat", "origins_pack\vehicles\bathmobile\textures\engine.rvmat", "origins_pack\vehicles\bathmobile\textures\engine_destruct.rvmat", "origins_pack\vehicles\bathmobile\textures\exhaust.rvmat", "origins_pack\vehicles\bathmobile\textures\exhaust.rvmat", "origins_pack\vehicles\bathmobile\textures\exhaust_destruct.rvmat", "origins_pack\vehicles\bathmobile\textures\parts.rvmat", "origins_pack\vehicles\bathmobile\textures\parts.rvmat", "origins_pack\vehicles\bathmobile\textures\parts_destruct.rvmat"};
		};
		hiddenSelections[] = {"main_body", "back_body", "pluhPredni"};
		hiddenSelectionsTextures[] = {"\rth_scrapbuggy\tex\partsdiffuse.paa", "\rth_scrapbuggy\tex\framediffuse.paa", "\rth_scrapbuggy\tex\framediffuse.paa"};
	};
};
