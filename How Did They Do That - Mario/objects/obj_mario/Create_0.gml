/// @description Settings

//No animation right now
image_speed = 0;

//This is the current state of the player
int_state = en_states.idle;

//The form of the character (0 for small mario, 1 for big mario, 2 for fire flower mario)
int_form = 0;

//This is how quickly we move horizontally
int_xSpeed = 0;

//This is the gravity aspect of mario
int_gravity = 1;

//For how many frames have we held the jump (w) key?
int_yHeld = 0;

//We use this growState to dictate of how the growth of mario happens (see alarm[0])
int_powerUpOrDownState = 0;

//When I am invincible, when this number is 0 I am visible, when 1 I am invisible. It flips back and forth until I am vulnerable again
int_invisibilityNum = 0;

//When I touch an enemy, briefly allow the player to be invincible to get away
b_invincible = false;

//Array to assign the sprites of mario [form, state]
spr_marioSprite[0, 0] = spr_marioIdleSm;
spr_marioSprite[0, 1] = spr_marioRunSm;
spr_marioSprite[0, 2] = spr_marioJumpSm;
spr_marioSprite[0, 3] = spr_marioSkidSm;

spr_marioSprite[1, 0] = spr_marioIdleLg;
spr_marioSprite[1, 1] = spr_marioRunLg;
spr_marioSprite[1, 2] = spr_marioJumpLg;
spr_marioSprite[1, 3] = spr_marioSkidLg;
spr_marioSprite[1, 4] = spr_marioDuckLg;

spr_marioSprite[2, 0] = spr_marioIdleFLg;
spr_marioSprite[2, 1] = spr_marioRunFLg;
spr_marioSprite[2, 2] = spr_marioJumpFLg;
spr_marioSprite[2, 3] = spr_marioSkidFLg;
spr_marioSprite[2, 4] = spr_marioDuckFLg;

