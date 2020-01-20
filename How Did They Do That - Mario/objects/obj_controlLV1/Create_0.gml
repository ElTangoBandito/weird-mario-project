/// @description Settings

//For all text purposes
draw_set_colour(c_white);

//Create the global surface, this important because we don't need every block object to exist in memory, only those at the surface beneath marios feet
global.surf_overWorld = surface_create(room_width, room_height);

//Destroy all blocks underneath the surface blocks (make these blocks draw to a surface instead and delete themelves)

//Mark the bricks for destruction and redraw
with(obj_brickBottom){
    if (position_meeting(x, y - 1, obj_brickBottom)){
        b_destroyMe = true;
    }else{
        b_destroyMe = false;
    }
}

//Destroy these objects after drawing them to a surface
surface_set_target(global.surf_overWorld);
with(obj_brickBottom){
    if (b_destroyMe){
        draw_sprite(sprite_index, 0, x, y);
        //instance_destroy();
    }
}
with(obj_cloud){
    draw_sprite(sprite_index, 0, x, y);
    instance_destroy();
}
with(obj_grass){
    draw_sprite(sprite_index, 0, x, y);
    instance_destroy();
}
with(obj_mountain){
    draw_sprite(sprite_index, 0, x, y);
    instance_destroy();
}
surface_reset_target();

//Create states of the player
enum en_states{
    idle, 
    run, 
    jump, 
    fall,
    duck,
    powerupOrDown,
    death
}

