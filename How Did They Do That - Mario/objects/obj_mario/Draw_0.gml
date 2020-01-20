/// @description Draw items

//When I am invincible I will flash very rapidly, my image_alpha will also be hampered
if (b_invincible){
    image_alpha = .7;
    int_invisibilityNum = 1 - int_invisibilityNum;
    if (int_invisibilityNum){
        draw_self();
    }
}else{
    image_alpha = 1;
    draw_self();
}

