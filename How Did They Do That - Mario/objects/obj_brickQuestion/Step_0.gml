/// @description Bump?

//Mechanics of the bump
if (b_bump){
    y = ystart - dsin(int_bumpMeasure) * 6;
    if (int_bumpMeasure < 180){
        int_bumpMeasure += 40;
    }else{
        int_bumpMeasure = 0;
        y = ystart;
        b_bump = false;
    }
}

