//Custom Spawns file//
/*
Custom group spawns Eg.

[[953.237,4486.48,0.001], //position
4,						  //Number Of units
1,					      //Skill level 0-1 or skill array number if using custom skills "Random" for random Skill array.
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Bandit2_1DZ",			  //Skin "" for random or classname here.
"Random"                  //Gearset number. "Random" for random gear set.
] call spawn_group;

Place your custom group spawns below

[[8141.1,21200,0],4,0,"Random",3,"","Bandit2_1DZ","Random"] call spawn_group;
[[11300,1000,0],4,0,"Random",3,"","Bandit2_1DZ","Random"] call spawn_group;
[[3600,7400,0],4,0,"Random",3,"","Bandit2_1DZ","Random"] call spawn_group;
[[2487,17207,0],6,0,"Random",3,"","Bandit2_1DZ","Random"] call spawn_group;


[[6296.44,13364.2,0],3,1,"Random",5,"","Bandit2_1DZ","Random"] call spawn_group;
[[6824.11,12794.3,0],3,1,"Random",5,"","Bandit2_1DZ","Random"] call spawn_group;
[[6386.42,13266.6,0.003],3,1,"Random",5,"","Bandit2_1DZ","Random"] call spawn_group;
[[6756.49,12996.3,0],3,1,"Random",5,"","Bandit2_1DZ","Random"] call spawn_group;
*/

/*
Custom static weapon spawns Eg. (with one position)

[[[911.21545,4532.7612,2.6292224]], //position(s) (can be multiple).
"SectorMG_Ori",             //Classname of turret
0.5,					  //Skill level 0-1. Has no effect if using custom skills
"Bandit2_1DZ",			  //Skin "" for random or classname here.
1,						  //Primary gun set number. "Random" for random weapon set. (not needed if ai_static_useweapon = False)
2,						  //Number of magazines. (not needed if ai_static_useweapon = False)
"",						  //Backpack "" for random or classname here. (not needed if ai_static_useweapon = False)
"Random"				  //Gearset number. "Random" for random gear set. (not needed if ai_static_useweapon = False)
] call spawn_static;

Custom static weapon spawns Eg. (with mutiple positions)

[[[911.21545,4532.7612,2.6292224],[921.21545,4532.7612,2.6292224]], //position(s) (can be multiple).
"SectorMG_Ori",             //Classname of turret
0.5,					  //Skill level 0-1. Has no effect if using custom skills
"Bandit2_1DZ",			  //Skin "" for random or classname here. 
1,						  //Primary gun set number. "Random" for random weapon set. (not needed if ai_static_useweapon = False)
2,						  //Number of magazines. (not needed if ai_static_useweapon = False)
"",						  //Backpack "" for random or classname here. (not needed if ai_static_useweapon = False)
"Random"				  //Gearset number. "Random" for random gear set. (not needed if ai_static_useweapon = False)
] call spawn_static;

Place your custom static weapon spawns below

[[[6386.42,13266.6,0.003]],"SectorMG_Ori",1,"Bandit2_1DZ",1,2,"","Random"] call spawn_static;
[[[6756.49,12996.3,0]],"SectorMG_Ori",1,"Bandit2_1DZ",1,2,"","Random"] call spawn_static;
*/


/*
Custom Chopper Patrol spawn Eg.

[[725.391,4526.06,0],    //Position to patrol
[0,0,0],	             // Position to spawn chopper at
2000,					//Radius of patrol
10,                     //Number of waypoints to give
"UH1H_Ori",		        //Classname of vehicle (make sure it has driver and two gunners)
1						//Skill level of units 
] spawn heli_patrol;

Place your heli patrols below

[[7000,8100,0],[13400,12800,0],4000,10,"UH1H_Ori",0] spawn heli_patrol;
[[13500,11700,0],[13400,12800,0],4000,10,"UH1H_Ori",0] spawn heli_patrol;
*/


/* 
Custom Vehicle patrol spawns Eg. (Watch out they are stupid)

[[725.391,4526.06,0],   //Position to patrol
[725.391,4526.06,0],	// Position to spawn at
200,					//Radius of patrol
10,                     //Number of waypoints to give
"UAZ_MG_Ori",		//Classname of vehicle (make sure it has driver and gunner)
1						//Skill level of units 
] spawn vehicle_patrol;

Place your vehicle patrols below this line
*/




/*
Paradropped unit custom spawn Eg.

[[911.21545,4532.7612,2.6292224],  //Position that units will be dropped by
[0,0,0],                           //Starting position of the heli
400,                               //Radius from drop position a player has to be to spawn chopper
"UH1H_Ori",                         //Classname of chopper (Make sure it has 2 gunner seats!)
5,                                 //Number of units to be para dropped
1,                                 //Skill level 0-1 or skill array number if using custom skills "Random" for random Skill array.
"Random",                          //Primary gun set number. "Random" for random weapon set.
4,                                 //Number of magazines
"",                                //Backpack "" for random or classname here.
"Bandit2_1DZ",                      //Skin "" for random or classname here.
"Random",                          //Gearset number. "Random" for random gear set.
True                               //True: Heli will stay at position and fight. False: Heli will leave if not under fire. 
] spawn heli_para;

Place your paradrop spawns under this line

[[11192,13794,2.6292224],[12000,13600,0,0],600,"UH1H_Ori",6,0,"Random",3,"","Bandit2_5DZ","Random",False] spawn heli_para;
*/