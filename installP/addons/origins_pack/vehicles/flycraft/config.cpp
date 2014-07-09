class CfgPatches
{
	class ori_flying_fortress
	{
		units[] = {"ori_flying_fortress"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"CAWater2","CAWheeled","CAWheeled_E"};
	};
};
class CfgFactionClasses
{
	class rth_copter_class
	{
		displayName = "Dayz: Origins";
		priority = 0;
		side = 3;
	};
};

class CfgMovesBasic
{
	class DefaultDie;
	class ManActions
	{
		vil_flymachine_gunner = "vil_flymachine_gunner";
	};
};
class CfgMovesMaleSdr: CfgMovesBasic
{
	class States
	{
		class Crew;
		class KIA_vil_flymachine_gunner: DefaultDie
		{
			actions = "DeadActions";
			file = "\origins_pack\vehicles\flycraft\vil_flyship_gunner.rtm";
			terminal = 1;
			soundEnabled = 0;
			connectTo[] = {"DeadState",0.1};
			speed = 0.5;
			looped = 0;
		};
		class vil_flymachine_gunner: Crew
		{
			file = "\origins_pack\vehicles\flycraft\vil_flyship_gunner.rtm";
			interpolateTo[] = {"KIA_vil_flymachine_gunner",1};
		};
	};
};
class CfgMovesWomen: CfgMovesBasic
{
	class ManActions
	{
		vil_flymachine_gunner = "";
	};
};

class NewTurret; 
class CfgVehicles
{
	class Air ;

	class Helicopter : Air	{

		class AnimationSources;
		class ViewPilot;
		class HitPoints;
		class Turrets
		{
			class MainTurret : NewTurret
			{
				class HitPoints
				{
					class HitTurret;
					class HitGun;
				};
			};
		};
	};

	class ORI_gunship_helicopter : Helicopter
	{
		displayName="Flying Fortress";
		Icon = "\origins_pack\vehicles\flycraft\fortress_ico_CA.paa";
		vehicleClass = "Air";
		faction = "rth_copter_class";
		model = "\origins_pack\vehicles\flycraft\flycraft";

		destrType="DestructWreck";
		crew = "Profiteer2";
		mapSize = 20;
		armor = 30;
		rotorBig = "rotor1"; 
		rotorBigBlend = "engine_blur"; 
		selectionHRotorStill = "engine_static"; 
		selectionHRotorMove = "engine_blur"; 
		class Sounds {
			class Engine { sound[] = {"ca\sounds\air\Mi17\ext\ext-sovietheli-engine-6", 5.62341, 1.0, 900}; frequency = "rotorSpeed"; volume = "camPos*((rotorSpeed-0.72)*4)"; };
			class RotorLowOut { sound[] = {"ca\sounds\air\Mi17\ext\ext-Mi17-rotor-low-2", db5, 1.0, 1400}; frequency = "rotorSpeed"; volume = "camPos*(0 max (rotorSpeed-0.1))"; cone[] = {1.6, 3.14, 2.0, 0.95}; };
			class RotorHighOut { sound[] = {"ca\sounds\air\Mi17\ext\ext-Mi17-rotor-high-2", db10, 1.0, 1700}; frequency = "rotorSpeed"; volume = "camPos*10*(0 max (rotorThrust-0.9))"; cone[] = {1.6, 3.14, 2.0, 0.95}; };
			class EngineIn { sound[] = {"ca\sounds\air\Mi17\int\int-sovietheli-engine-3", db0, 1.0}; frequency = "rotorSpeed"; volume = "(1-camPos)*((rotorSpeed-0.75)*4)";
			};
			class RotorLowIn { sound[] = {"ca\sounds\air\Mi17\int\int-Mi17-rotor-low-2", db5, 1.0}; frequency = "rotorSpeed"; volume = "(1-camPos)*(0 max (rotorSpeed-0.1))"; };
			class RotorHighIn { sound[] = {"ca\sounds\air\Mi17\int\int-Mi17-rotor-high-2", db5, 1.0}; frequency = "rotorSpeed"; volume = "(1-camPos)*3*(rotorThrust-0.9)";
			}; 
		};
		scope = 2;
		SIDE=3;
		accuracy = 1;
		maxSpeed = 210;
		driverAction = "Mi8_Pilot";
		cargoIsCoDriver[] = {1, 0};
		gunnerAction= "Mi8_pilot";
		gunnerinAction= "Mi8_pilot";
		cargoAction[] = {"Mi8_pilot", "Mi8_pilot","Mi8_pilot", "Mi8_pilot","Mi8_pilot","AH6_Pilot","AH6_Pilot","AH6_Pilot","AH6_Pilot"};
		enableSweep = false;
		transportAmmo = 0;
		supplyRadius = 2.5;
		class Damage { tex[] = {}; 
			mat[] = {"origins_pack\vehicles\flycraft\airship.rvmat", "origins_pack\vehicles\flycraft\airship.rvmat","origins_pack\vehicles\flycraft\airship_de.rvmat"}; };		

		class AnimationSources {
			class HitRotor1 {
				source = "Hit";
				hitpoint = "HitRotor1";
				raw = 1;
			};
			
			class HitRotor2 : HitRotor1{
				hitpoint = "HitRotor2";
			};
			
			class HitRotor3 : HitRotor1 {
				hitpoint = "HitRotor3";
			};
			
			class HitRotor4 : HitRotor1 {
				hitpoint = "HitRotor4";
			};
		};	
		
		class HitPoints : HitPoints {
			class HitHull {
				armor = 1.2;
				material = 51;
				name = "NEtrup";
				visual = "trup";
				passThrough = 1;
			};
			class HitRotor1 {
				armor = 2.4;
				material = -1;
				name = "motor1";
				visual = "motor1";
				passThrough = 1;
			};
			class HitRotor2 {
				armor = 2.4;
				material = -1;
				name = "motor2";
				visual = "motor2";
				passThrough = 1;
			};
			class HitRotor3 {
				armor = 2.4;
				material = -1;
				name = "motor3";
				visual = "motor3";
				passThrough = 1;
			};
			class HitRotor4 {
				armor = 2.4;
				material = -1;
				name = "motor4";
				visual = "motor4";
				passThrough = 1;
			};
			class HitEngine {
				armor = 60;
				material = -1;
				name = "motor";
				visual = "motor";
				passThrough = 0.5;
			};
			class HitAvionics {
				armor = 1.75;
				material = -1;
				name = "elektronika";
				visual = "elektronika";
				passThrough = 1;
			};
			class HitVRotor {
				armor = 60;
				material = -1;
				name = "mala vrtule";
				visual = "mala vrtule staticka";
				passThrough = 0.5;
			};
		};
		class UserActions {};	
		radarType=4;
		LockDetectionSystem=8;
		IncommingMisslieDetectionSystem=16;
		threat[]={0.8,1,0.6};
		damageResistance=0.00138;
		initCargoAngleY=10;
		minCargoAngleY=-60;
		maxCargoAngleY=120;
		gunnerUsesPilotView=0;
		enableManualFire = 0;
		transportMaxBackpacks = 20;
		transportSoldier = 9;
		driverCanSee=31;
		gunnerCanSee=31;
		memoryPointsGetInCargo[]={"pos cargo"};
		memoryPointsGetInCargoDir[]={"pos cargo dir"};
		transportMaxMagazines = 100;
		transportMaxWeapons = 10;
		class Reflectors {
			class Left1 {
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "svetlo1";
				direction = "svetlo1dir";
				hitpoint = "svetlo1";
				selection = "svetlo1";
				size = 1;
				brightness = 0.8;
			};
			class Left2 {
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "svetlo2";
				direction = "svetlo2dir";
				hitpoint = "svetlo2";
				selection = "svetlo2";
				size = 1;
				brightness = 0.8;
			};
			class Left3 {
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "svetlo3";
				direction = "svetlo3dir";
				hitpoint = "svetlo3";
				selection = "svetlo3";
				size = 1;
				brightness = 0.8;
			};
			class Left4 {
				color[] = {0.8, 0.8, 1.0, 1.0};
				ambient[] = {0.07, 0.07, 0.07, 1.0};
				position = "svetlo4";
				direction = "svetlo4dir";
				hitpoint = "svetlo4";
				selection = "svetlo4";
				size = 1;
				brightness = 0.8;
			};
		};
		class Turrets:Turrets {
			class MainTurret : MainTurret {
				body = "mainTurret4";
				gun = "mainGun4";
				selectionFireAnim = "zasleh4";
				animationSourceBody = "mainTurret4";
				animationSourceGun = "mainGun4";
				gunBeg = "ustihlavne4";
				gunEnd = "konechlavne4";
				startEngine = 0;
				outGunnerMayFire = 1;
				primary = 1;
				memoryPointGun = "machinegun4";
				memoryPointGunnerOptics = "gunnerview4";
				gunnerAction= "vil_flymachine_gunner";
				gunnerinAction= "vil_flymachine_gunner";
				gunnerGetInAction = "GetInHigh";
				gunnerGetOutAction = "GetOutHigh";
				weapons[] = {"PKT"};
				magazines[] = {"100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK"};
				gunnerName = "Front Gunner";
				gunnerOpticsColor[] = {1, 1, 1, 1};
				gunnerOpticsModel = "\ca\weapons\optika_empty";
				gunnerForceOptics = 0;
				minElev = -45;
				maxElev = 15;
				initElev = -10;
				minTurn = -50;
				maxTurn = 50;
				initTurn = 0;
				enableManualFire = 0;

				class ViewOptics {initAngleX = 0; minAngleX = -30;maxAngleX = 30;initAngleY = 0;minAngleY = -100;maxAngleY = 100;initFov = 0.5;
					minFov = 0.3;maxFov = 1.0;};
				class ViewGunner {initAngleX = 5;minAngleX = -65;maxAngleX = 85;initAngleY = 0;minAngleY = -150;maxAngleY = 150;
					initFov = 0.5;minFov = 0.3;maxFov = 0.8;};

			};
			class MainTurret2 : MainTurret {
				body = "mainTurret2";
				gun = "mainGun2";
				gunnerName = "Right Gunner";
				selectionFireAnim = "zasleh2";
				animationSourceBody = "mainTurret2";
				animationSourceGun = "mainGun2";
				gunBeg = "ustihlavne2";
				gunEnd = "konechlavne2";
				startEngine = 0;
				outGunnerMayFire = 1;
				proxyIndex = 2;
				memoryPointGun = "machinegun2";
				memoryPointGunnerOptics = "gunnerview2";
				gunnerAction= "vil_flymachine_gunner";
				gunnerinAction= "vil_flymachine_gunner";
				gunnerGetInAction = "GetInHigh";
				gunnerGetOutAction = "GetOutHigh";
				weapons[] = {"PKT"};
				magazines[] = {"100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK"};

				gunnerOpticsColor[] = {1, 1, 1, 1};
				gunnerOpticsModel = "\ca\weapons\optika_empty";
				gunnerForceOptics = 0;
				minElev = -45;
				maxElev = 15;
				initElev = 0;
				minTurn = 220;
				maxTurn = 320;
				initTurn = 270;
				enableManualFire = 0;

				class ViewOptics {initAngleX = 0; minAngleX = -30;maxAngleX = 30;initAngleY = 0;minAngleY = -100;maxAngleY = 100;initFov = 0.5;
					minFov = 0.3;maxFov = 1.0;};
				class ViewGunner {initAngleX = 5;minAngleX = -65;maxAngleX = 85;initAngleY = 0;minAngleY = -150;maxAngleY = 150;
					initFov = 0.5;minFov = 0.3;maxFov = 0.8;};

			};
			class MainTurret3 : MainTurret {
				body = "mainTurret3";
				gun = "mainGun3";
				gunnerName = "Left Gunner";
				selectionFireAnim = "zasleh3";
				animationSourceBody = "mainTurret3";
				animationSourceGun = "mainGun3";
				gunBeg = "ustihlavne3";
				gunEnd = "konechlavne3";
				startEngine = 0;
				outGunnerMayFire = 1;
				proxyIndex = 3;
				memoryPointGun = "machinegun3";
				memoryPointGunnerOptics = "gunnerview3";
				gunnerAction= "vil_flymachine_gunner";
				gunnerinAction= "vil_flymachine_gunner";
				gunnerGetInAction = "GetInHigh";
				gunnerGetOutAction = "GetOutHigh";
				weapons[] = {"PKT"};
				magazines[] = {"100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK"};

				gunnerOpticsColor[] = {1, 1, 1, 1};
				gunnerOpticsModel = "\ca\weapons\optika_empty";
				gunnerForceOptics = 0;
				minElev = -45;
				maxElev = 15;
				initElev = 0;
				minTurn = 40;
				maxTurn = 140;
				initTurn = 90;
				enableManualFire = 0;

				class ViewOptics {initAngleX = 0; minAngleX = -30;maxAngleX = 30;initAngleY = 0;minAngleY = -100;maxAngleY = 100;initFov = 0.5;
					minFov = 0.3;maxFov = 1.0;};
				class ViewGunner {initAngleX = 5;minAngleX = -65;maxAngleX = 85;initAngleY = 0;minAngleY = -150;maxAngleY = 150;
					initFov = 0.5;minFov = 0.3;maxFov = 0.8;};

			};

			class MainTurret4 : MainTurret {
				body = "mainTurret";
				gun = "mainGun";
				gunnerName = "Rear Gunner";
				selectionFireAnim = "zasleh";
				animationSourceBody = "mainTurret";
				animationSourceGun = "mainGun";
				gunBeg = "ustihlavne";
				gunEnd = "konechlavne";
				startEngine = 0;
				outGunnerMayFire = 1;
				proxyIndex = 4;
				memoryPointGun = "machinegun";
				memoryPointGunnerOptics = "gunnerview";
				gunnerAction= "vil_flymachine_gunner";
				gunnerinAction= "vil_flymachine_gunner";
				gunnerGetInAction = "GetInHigh";
				gunnerGetOutAction = "GetOutHigh";
				weapons[] = {"PKT"};
				magazines[] = {"100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK"};

				gunnerOpticsColor[] = {1, 1, 1, 1};
				gunnerOpticsModel = "\ca\weapons\optika_empty";
				gunnerForceOptics = 0;
				minElev = -45;
				maxElev = 15;
				initElev = 0;
				minTurn = 130;
				maxTurn = 230;
				initTurn = 180;
				enableManualFire = 0;

				class ViewOptics {initAngleX = 0; minAngleX = -30;maxAngleX = 30;initAngleY = 0;minAngleY = -100;maxAngleY = 100;initFov = 0.5;
					minFov = 0.3;maxFov = 1.0;};
				class ViewGunner {initAngleX = 5;minAngleX = -65;maxAngleX = 85;initAngleY = 0;minAngleY = -150;maxAngleY = 150;
					initFov = 0.5;minFov = 0.3;maxFov = 0.8;};

			};


		};
		driverIsCommander=1;
		hasCommander=0;

	};

};