/// @description Hit by mario

//Check to see if I have been hit
if (image_index == 0){   
    instance_create(x + 16, y + 16, OI_myTreasure);
}
    
//Switch to the 'already hit brick'
image_index = 1;

//I was bumped
b_bump = true;

