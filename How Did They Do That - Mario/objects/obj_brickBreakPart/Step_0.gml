/// @description Fall to the ground

//Gravity
y += int_gravity;

//Terminal velocity
if (int_gravity < 18){
    int_gravity += 1.5;
}

//Rotate pieces as they fall
image_angle += 15 * int_dir;

//Destroy self when I am outside the room
if (y > room_height){
    instance_destroy();
}

