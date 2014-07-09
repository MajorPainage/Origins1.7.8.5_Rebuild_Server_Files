#define private		0
#define protected		1
#define public		2

class CfgPatches {
	class ivans_lab {
		units[] = {"LAND_ivanslab"};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {};
	};
};

class CfgVehicles {
	class Building;	// External class reference
	
	class LAND_ivanslab : Building {
		scope = protected;
		model = "origins_pack\structures\ivans_lab\ivans_lab";
		armor = 10000;
		accuracy = 1000;	// accuracy needed to recognize type of this target
		ladders[] = {{"start1", "end1"}, {"start2", "end2"}};
		
		class UserActions {
			class door1_close {
				displayNameDefault = $STR_DN_OUT_C_DOOR_DEFAULT;
				displayName = "Close Door";
				position = "door1pos";
				radius = 2;
				onlyForPlayer = 1;
				condition = "this animationPhase ""animDoor1"" > 0";
				statement = "this animate [""animDoor1"", 0]";
			};
			
			class door1_open : door1_close {
				displayNameDefault = $STR_DN_OUT_O_DOOR_DEFAULT;
				displayName = "Open Door";
				condition = "this animationPhase ""animDoor1"" == 0";
				statement = "this animate [""animDoor1"", 1]";
			};
			
			class door2_close : door1_close {
				position = "door2pos";
				condition = "this animationPhase ""animDoor2"" > 0";
				statement = "this animate [""animDoor2"", 0]";
			};
			
			class door2_open : door1_open {
				position = "door2pos";
				condition = "this animationPhase ""animDoor2"" == 0";
				statement = "this animate [""animDoor2"", 1]";
			};
			
			class door3_close : door1_close {
				position = "door3pos";
				condition = "this animationPhase ""animDoor3"" > 0";
				statement = "this animate [""animDoor3"", 0]";
			};
			
			class door3_open : door1_open {
				position = "door3pos";
				condition = "this animationPhase ""animDoor3"" == 0";
				statement = "this animate [""animDoor3"", 1]";
			};
			
			class door4_close : door1_close {
				position = "door4pos";
				condition = "this animationPhase ""animDoor4"" > 0";
				statement = "this animate [""animDoor4"", 0]";
			};
			
			class door4_open : door1_open {
				position = "door4pos";
				condition = "this animationPhase ""animDoor4"" == 0";
				statement = "this animate [""animDoor4"", 1]";
			};
			
			class door5_close : door1_close {
				position = "door5pos";
				condition = "this animationPhase ""animDoor5"" > 0";
				statement = "this animate [""animDoor5"", 0]";
			};
			
			class door5_open : door1_open {
				position = "door5pos";
				condition = "this animationPhase ""animDoor5"" == 0";
				statement = "this animate [""animDoor5"", 1]";
			};
		};
		
		class AnimationSources {
			class door1 {
				source = "user";
				animPeriod = 1;
				initPhase = 0;
			};
			
			class door2 : door1 {};
			
			class door3 : door1 {};
			
			class door4 : door1 {};
			
			class door5 : door1 {};
		};
	};
};
