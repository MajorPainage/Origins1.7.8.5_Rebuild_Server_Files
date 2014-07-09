#define private		0
#define protected		1
#define public		2

class CfgPatches {
	class structures {
		units[] = {"rth_car_garage", "rth_garage", "rth_gun_rack", "rth_nixie"};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {};
	};
};

class CfgVehicles {
	class House;	// External class reference
	
	class rth_car_garage : House {
		scope = public;
		model = "origins_pack\structures\car_garage.p3d";
	};
	
	class rth_garage : House {
		scope = public;
		model = "origins_pack\structures\garage.p3d";
	};
	
	class rth_gun_rack : House {
		scope = public;
		model = "origins_pack\structures\gun_rack.p3d";
		faction = "rth_copter_class";
	};
	
	class rth_nixie : House {
		scope = public;
		model = "origins_pack\structures\nixie.p3d";
		faction = "rth_copter_class";
	};
};
