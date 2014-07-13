if (isServer) then {

"dayzDeath"      	addPublicVariableEventHandler {(_this select 1) call server_playerDied};
"DOgNo_Se"  	addPublicVariableEventHandler {(_this select 1) call server_playerSync;};
"oriWverOtkr"	addPublicVariableEventHandler {(_this select 1) call server_pubOriObj};
"dayUpdateVehlcle" 	addPublicVariableEventHandler {(_this select 1) call server_updatObiect};
"oriUdalkaObj"    	addPublicVariableEventHandler {(_this select 1) call server_udalitObj};
"DOdowndblink"      	addPublicVariableEventHandler {(_this select 1) call DO_cperg};
"dayzOrigingsL2"		addPublicVariableEventHandler {(_this select 1) call serverDO_plSp};

"dayzLoginRecord"  	addPublicVariableEventHandler {(_this select 1) call dayz_recordLogin};


"dayzDiscoAdd"		addPublicVariableEventHandler {dayz_disco set [count dayz_disco,(_this select 1)];};
"dayzDiscoRem"		addPublicVariableEventHandler {dayz_disco = dayz_disco - [(_this select 1)];};


"dayzGutBody"		addPublicVariableEventHandler {(_this select 1) spawn local_gutObject};

"wantbbplz"			addPublicVariableEventHandler {(_this select 1) call server_wantbbplz};
"verbb_pas"			addPublicVariableEventHandler {(_this select 1) call serv_verbb_pas};
};

