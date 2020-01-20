/// @description Break apart (mario form 1)
/// @function Break apart 
/// @param mario form 1

//Create the 4 pieces of the brick, give each part a different image_index
for(var a = 0;a <= 3;a ++){
    with(instance_create(x, y, obj_brickBreakPart)){
        direction = 22.5 + a * 45;
        speed = 5;
        image_index = 0;
    }
}

//Destroy self
instance_destroy();
    

