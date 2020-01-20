/// @description Meat and potatoes

//What to do if I am touching the player
if (place_meeting(x, y, obj_mario)){
    instance_destroy();
}

//Analyze my current state
switch(int_state){
    //Move up and out of the block
    case 0:
    y -= 5;
    break;
    //Now do nothing but wait
    case 1:
    break;
}

