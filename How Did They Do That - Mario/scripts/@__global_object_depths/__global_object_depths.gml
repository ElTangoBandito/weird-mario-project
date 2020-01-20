// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 100; // obj_controlLV1
global.__objectDepths[1] = 0; // par_brick
global.__objectDepths[2] = 0; // obj_brickBottom
global.__objectDepths[3] = 0; // obj_brickBottom2
global.__objectDepths[4] = 0; // obj_brickBreak
global.__objectDepths[5] = 0; // obj_brickBreakPart
global.__objectDepths[6] = 0; // obj_brickQuestion
global.__objectDepths[7] = 0; // obj_pipeSm
global.__objectDepths[8] = 0; // obj_pipeMed
global.__objectDepths[9] = 0; // obj_pipeLg
global.__objectDepths[10] = 5; // obj_mushroom
global.__objectDepths[11] = 5; // obj_fireFlower
global.__objectDepths[12] = 5; // obj_coin
global.__objectDepths[13] = 0; // obj_fireball
global.__objectDepths[14] = -10; // obj_fireballExpl
global.__objectDepths[15] = -5; // obj_mario
global.__objectDepths[16] = 0; // par_enemy
global.__objectDepths[17] = -10; // obj_goomba
global.__objectDepths[18] = -10; // obj_koopa
global.__objectDepths[19] = 0; // obj_cloud
global.__objectDepths[20] = 0; // obj_grass
global.__objectDepths[21] = 0; // obj_mountain


global.__objectNames[0] = "obj_controlLV1";
global.__objectNames[1] = "par_brick";
global.__objectNames[2] = "obj_brickBottom";
global.__objectNames[3] = "obj_brickBottom2";
global.__objectNames[4] = "obj_brickBreak";
global.__objectNames[5] = "obj_brickBreakPart";
global.__objectNames[6] = "obj_brickQuestion";
global.__objectNames[7] = "obj_pipeSm";
global.__objectNames[8] = "obj_pipeMed";
global.__objectNames[9] = "obj_pipeLg";
global.__objectNames[10] = "obj_mushroom";
global.__objectNames[11] = "obj_fireFlower";
global.__objectNames[12] = "obj_coin";
global.__objectNames[13] = "obj_fireball";
global.__objectNames[14] = "obj_fireballExpl";
global.__objectNames[15] = "obj_mario";
global.__objectNames[16] = "par_enemy";
global.__objectNames[17] = "obj_goomba";
global.__objectNames[18] = "obj_koopa";
global.__objectNames[19] = "obj_cloud";
global.__objectNames[20] = "obj_grass";
global.__objectNames[21] = "obj_mountain";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for