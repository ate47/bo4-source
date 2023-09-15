// Atian COD Tools GSC decompiler test
#namespace namespace_6a81d072;

// Namespace namespace_6a81d072/namespace_6a81d072
// Params 0, eflags: 0x1 linked
// Checksum 0x341184d3, Offset: 0x398
// Size: 0x276
function init_pentagon_box_screens() {
    level.var_f6d11e0b = array("p8_zm_off_monitor_security_screen_sale_01", "p8_zm_off_monitor_security_screen_sale_02");
    level.var_1c9068af = array("p8_zm_off_monitor_security_screen_off");
    level.var_944b0c72 = array("p8_zm_off_monitor_security_screen_on");
    level.var_ac5c8c02 = array("p8_zm_off_monitor_security_screen_lobby", "p8_zm_off_monitor_security_screen_lobby_01");
    level.var_da9f6887 = array("p8_zm_off_monitor_security_screen_lobby", "p8_zm_off_monitor_security_screen_lobby_02");
    level.var_ffdbb303 = array("p8_zm_off_monitor_security_screen_lobby", "p8_zm_off_monitor_security_screen_lobby_03");
    level.var_8eaa08d5 = array("p8_zm_off_monitor_security_screen_warroom", "p8_zm_off_monitor_security_screen_warroom_01");
    level.var_a47d347b = array("p8_zm_off_monitor_security_screen_warroom", "p8_zm_off_monitor_security_screen_warroom_02");
    level.var_f32c51dc = array("p8_zm_off_monitor_security_screen_warroom", "p8_zm_off_monitor_security_screen_warroom_03");
    level.var_ae05b855 = array("p8_zm_off_monitor_security_screen_labs", "p8_zm_off_monitor_security_screen_labs_01");
    level.var_680eac7c = array("p8_zm_off_monitor_security_screen_labs", "p8_zm_off_monitor_security_screen_labs_02");
    level.var_37c4cbe9 = array("p8_zm_off_monitor_security_screen_labs", "p8_zm_off_monitor_security_screen_labs_03");
    level.var_be9b9bfc = array("p8_zm_off_monitor_security_screen_logo");
    level.open_chest_location = array(level.var_ac5c8c02, level.var_da9f6887, level.var_ffdbb303, level.var_8eaa08d5, level.var_a47d347b, level.var_f32c51dc, level.var_ae05b855, level.var_680eac7c, level.var_37c4cbe9);
    level._custom_box_monitor = &function_d531af7d;
}

// Namespace namespace_6a81d072/namespace_6a81d072
// Params 2, eflags: 0x1 linked
// Checksum 0x70a95389, Offset: 0x618
// Size: 0x15e
function function_d531af7d(client_num, state) {
    function_349aed4a(client_num);
    if (state == "n") {
        if (level._power_on == 0) {
            screen_to_display = level.var_1c9068af;
        } else {
            screen_to_display = level.var_944b0c72;
        }
    } else if (state == "f") {
        screen_to_display = level.var_f6d11e0b;
    } else {
        array_number = int(state);
        screen_to_display = level.open_chest_location[array_number];
    }
    stop_notify = "stop_tv_swap";
    for (i = 0; i < level.var_c1947c95[client_num].size; i++) {
        tele = level.var_c1947c95[client_num][i];
        tele notify(stop_notify);
        wait(0.2);
        tele thread function_ecd6c9b9(screen_to_display, "stop_tv_swap");
    }
}

// Namespace namespace_6a81d072/namespace_6a81d072
// Params 1, eflags: 0x1 linked
// Checksum 0xd2c2aa99, Offset: 0x780
// Size: 0xf6
function function_349aed4a(client_num) {
    if (!isdefined(level.var_c1947c95)) {
        level.var_c1947c95 = [];
    }
    if (isdefined(level.var_c1947c95[client_num])) {
        return;
    }
    level.var_c1947c95[client_num] = getentarray(client_num, "model_pentagon_box_screens", "script_noteworthy");
    for (i = 0; i < level.var_c1947c95[client_num].size; i++) {
        tele = level.var_c1947c95[client_num][i];
        tele setmodel(level.var_1c9068af[0]);
        wait(0.1);
    }
}

// Namespace namespace_6a81d072/namespace_6a81d072
// Params 2, eflags: 0x1 linked
// Checksum 0x85960f2c, Offset: 0x880
// Size: 0xf0
function function_ecd6c9b9(var_240e555b, endon_notify) {
    self endon(endon_notify);
    while (1) {
        for (i = 0; i < var_240e555b.size; i++) {
            self setmodel(var_240e555b[i]);
            wait(3);
        }
        if (6 > randomint(100) && isdefined(level.var_be9b9bfc)) {
            self setmodel(level.var_be9b9bfc[randomint(level.var_be9b9bfc.size)]);
            wait(2);
        }
        wait(1);
    }
}

