// Atian COD Tools GSC decompiler test
#using scripts\mp\mp_hacienda_alt_sound.gsc;
#using scripts\mp\mp_hacienda_alt_fx.gsc;
#using scripts\mp_common\load.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\draft.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace mp_hacienda_alt;

// Namespace mp_hacienda_alt/level_init
// Params 1, eflags: 0x40
// Checksum 0x21e17453, Offset: 0x418
// Size: 0x124
function event_handler[level_init] main(eventstruct) {
    callback::on_game_playing(&on_game_playing);
    mp_hacienda_alt_fx::main();
    mp_hacienda_alt_sound::main();
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((-236, -232, -1), (560, -2500, 8), (-1266, -1345, 5.75), (-692.75, 2258, 8), (820, 926, 9));
    function_2cdcf5c3();
    function_d839264a();
    function_d99e105f();
    function_f5a4a3eb();
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 0, eflags: 0x1 linked
// Checksum 0x4e85f098, Offset: 0x548
// Size: 0x12c
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    wait(getdvarfloat(#"hash_205d729c5c415715", 0.3));
    if (util::isfirstround()) {
        level util::delay(getdvarfloat(#"hash_187afb4d5f703a4a", 0.2), undefined, &scene::play, "p8_fxanim_mp_hacienda_helicopter_flyover_bundle", "Shot 2");
        exploder::stop_exploder("fxexp_sprinklers");
        level util::delay(1.5, undefined, &exploder::exploder, "fxexp_sprinklers");
        return;
    }
    wait(1);
    exploder::stop_exploder("fxexp_heli_leaves_idle");
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 0, eflags: 0x1 linked
// Checksum 0x309b453a, Offset: 0x680
// Size: 0x9c
function function_2cdcf5c3() {
    if (util::isfirstround()) {
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        exploder::exploder("fxexp_sprinklers");
        level thread scene::play("p8_fxanim_mp_hacienda_helicopter_flyover_bundle", "Shot 1");
        return;
    }
    wait(1);
    exploder::exploder("fxexp_sprinklers");
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 0, eflags: 0x1 linked
// Checksum 0x43a44ad0, Offset: 0x728
// Size: 0x32c
function function_d839264a() {
    a_s_buttons = struct::get_array("car_platform_button");
    var_a43a7410 = getent("car_platform", "targetname");
    var_90fcac95 = getent("car_platform_clip", "targetname");
    var_a9f61c2f = getentarray("car_platform", "script_linkto");
    var_ebd977d = getentarray("car_platform_panel", "script_interact_group");
    var_a43a7410.var_8090ebe4 = getnodearray("car_platform_traverse", "targetname");
    var_90fcac95 linkto(var_a43a7410);
    var_90fcac95 disconnectpaths();
    foreach (var_41e76654 in var_a43a7410.var_8090ebe4) {
        linktraversal(var_41e76654);
    }
    foreach (s_button in a_s_buttons) {
        s_button.mdl_gameobject.a_s_buttons = a_s_buttons;
        s_button.mdl_gameobject.var_a43a7410 = var_a43a7410;
        s_button.mdl_gameobject.var_ebd977d = var_ebd977d;
        if (getgametypesetting(#"allowmapscripting")) {
            level thread function_9940fbb9(s_button.mdl_gameobject.var_ebd977d);
            s_button.mdl_gameobject gameobjects::set_onuse_event(&function_45cfd64e);
        } else {
            level thread function_9940fbb9(s_button.mdl_gameobject.var_ebd977d, "busy");
            s_button.mdl_gameobject gameobjects::destroy_object(1, 0);
        }
    }
    array::run_all(var_a9f61c2f, &linkto, var_a43a7410);
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 1, eflags: 0x1 linked
// Checksum 0xf7f30e5c, Offset: 0xa60
// Size: 0x29c
function function_45cfd64e(e_activator) {
    array::thread_all(self.a_s_buttons, &gameobjects::disable_object);
    level thread function_9940fbb9(self.var_ebd977d, "busy");
    foreach (var_41e76654 in self.var_a43a7410.var_8090ebe4) {
        unlinktraversal(var_41e76654);
    }
    self.var_a43a7410 rotateyaw(360, getdvarfloat(#"hash_42b74e55d98810b6", 20));
    self.var_a43a7410 playsound("amb_car_platform_start");
    self.var_a43a7410 playloopsound("amb_car_platform_loop", 0.5);
    self.var_a43a7410 waittill(#"rotatedone");
    self.var_a43a7410 playsound("amb_car_platform_stop");
    self.var_a43a7410 stoploopsound(0.5);
    foreach (var_41e76654 in self.var_a43a7410.var_8090ebe4) {
        linktraversal(var_41e76654);
    }
    wait(getdvarfloat(#"hash_1760dea2c00cbd93", 5));
    level thread function_9940fbb9(self.var_ebd977d);
    array::thread_all(self.a_s_buttons, &gameobjects::enable_object);
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 0, eflags: 0x1 linked
// Checksum 0xf4acabdc, Offset: 0xd08
// Size: 0x1c8
function function_d99e105f() {
    var_b70abd9d = array("fxexp_top_fountain_01", "");
    a_s_buttons = struct::get_array("fountain_button");
    var_ebd977d = getentarray("fountain_button_panel", "script_interact_group");
    foreach (s_button in a_s_buttons) {
        s_button.mdl_gameobject.a_s_buttons = a_s_buttons;
        s_button.mdl_gameobject.var_ebd977d = var_ebd977d;
        if (getgametypesetting(#"allowmapscripting")) {
            level thread function_9940fbb9(s_button.mdl_gameobject.var_ebd977d);
            s_button.mdl_gameobject gameobjects::set_onuse_event(&function_393b459a);
        } else {
            level thread function_9940fbb9(s_button.mdl_gameobject.var_ebd977d, "busy");
            s_button.mdl_gameobject gameobjects::destroy_object(1, 0);
        }
    }
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 1, eflags: 0x1 linked
// Checksum 0x9ca7da44, Offset: 0xed8
// Size: 0x224
function function_393b459a(e_activator) {
    var_b70abd9d = array("fxexp_top_fountain_01", "fxexp_top_fountain_02", "fxexp_top_fountain_03", "fxexp_top_fountain_04", "fxexp_fountain_jet_01", "fxexp_fountain_jet_02", "fxexp_fountain_jet_03", "fxexp_fountain_jet_04", "fxexp_fountain_jet_05", "fxexp_fountain_jet_06", "fxexp_fountain_jet_07", "fxexp_fountain_jet_08");
    array::thread_all(self.a_s_buttons, &gameobjects::disable_object);
    level thread function_9940fbb9(self.var_ebd977d, "busy");
    for (i = 0; i < 5; i++) {
        foreach (str_exploder in var_b70abd9d) {
            util::delay(randomfloat(0.6), undefined, &exploder::exploder, str_exploder);
        }
        wait(1.4);
    }
    wait(getdvarfloat(#"hash_3201af3906143d06", 5) + 0.6);
    level thread function_9940fbb9(self.var_ebd977d);
    array::thread_all(self.a_s_buttons, &gameobjects::enable_object);
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 0, eflags: 0x1 linked
// Checksum 0x12a641a6, Offset: 0x1108
// Size: 0x338
function function_f5a4a3eb() {
    a_s_buttons = struct::get_array("hidden_door_button");
    var_2151fb35 = getentarray("hidden_door", "targetname");
    var_ebd977d = getentarray("hidden_room", "script_interact_group");
    array::thread_all(var_2151fb35, &function_670cd4a3);
    foreach (s_button in a_s_buttons) {
        s_button.mdl_gameobject.a_s_buttons = a_s_buttons;
        s_button.mdl_gameobject.var_2151fb35 = var_2151fb35;
        s_button.mdl_gameobject.var_ebd977d = var_ebd977d;
        if (getgametypesetting(#"allowmapscripting")) {
            level thread function_9940fbb9(s_button.mdl_gameobject.var_ebd977d);
            s_button.mdl_gameobject gameobjects::set_onuse_event(&function_886f3928);
        } else {
            level thread function_9940fbb9(s_button.mdl_gameobject.var_ebd977d, "busy");
            s_button.mdl_gameobject gameobjects::destroy_object(1, 0);
        }
    }
    foreach (mdl_door in var_2151fb35) {
        s_open = struct::get(mdl_door.target);
        mdl_door.v_forward = s_open.angles;
        mdl_door.v_close = mdl_door.origin;
        mdl_door.var_3acc3ac3 = s_open.origin + vectorscale(anglestoforward(mdl_door.v_forward) * -1, 2);
        mdl_door.var_2aba91c4 = 1;
        mdl_door disconnectpaths();
        if (1) {
            mdl_door thread function_dd0b407b();
        }
    }
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 1, eflags: 0x1 linked
// Checksum 0xd8cfdf3b, Offset: 0x1448
// Size: 0x114
function function_886f3928(e_activator) {
    array::thread_all(self.a_s_buttons, &gameobjects::disable_object);
    level thread function_9940fbb9(self.var_ebd977d, "busy");
    array::thread_all(self.var_2151fb35, &function_dd0b407b);
    array::wait_till(self.var_2151fb35, "hidden_door_moved");
    wait(getdvarfloat(#"hash_5b883b04d5499fd6", 5));
    level thread function_9940fbb9(self.var_ebd977d);
    array::thread_all(self.a_s_buttons, &gameobjects::enable_object);
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 0, eflags: 0x1 linked
// Checksum 0x4d38d8fa, Offset: 0x1568
// Size: 0x206
function function_dd0b407b() {
    var_2aba91c4 = self.var_2aba91c4;
    if (var_2aba91c4) {
        v_moveto = self.var_3acc3ac3;
        self.var_2aba91c4 = 0;
        self connectpaths();
    } else {
        v_moveto = self.v_close + vectorscale(anglestoforward(self.v_forward) * -1, 2);
        self.var_2aba91c4 = 1;
        self disconnectpaths();
    }
    if (var_2aba91c4) {
        var_1db0beb5 = self.origin + vectorscale(anglestoforward(self.v_forward) * -1, 2);
        self moveto(var_1db0beb5, 0.75);
        self waittill(#"movedone");
    }
    self thread function_e0954c11();
    self moveto(v_moveto, 1.2);
    str_sound = "amb_stone_door_open";
    if (self.var_af2d1e6 === 2) {
        str_sound = "amb_wood_door_open";
    }
    self playsound(str_sound);
    self waittill(#"movedone");
    if (!var_2aba91c4) {
        self moveto(self.v_close, 0.75);
        self waittill(#"movedone");
    }
    self notify(#"hash_795deea49e0ec32a");
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 0, eflags: 0x1 linked
// Checksum 0xe5c08087, Offset: 0x1778
// Size: 0x80
function function_670cd4a3() {
    self endon(#"death");
    self.var_19fde5b7 = [];
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"grenade_stuck");
        if (isdefined(waitresult.projectile)) {
            array::add(self.var_19fde5b7, waitresult.projectile);
        }
    }
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 0, eflags: 0x1 linked
// Checksum 0x405b8607, Offset: 0x1800
// Size: 0xb0
function function_e0954c11() {
    if (!isdefined(self.var_7c9174d1)) {
        return;
    }
    foreach (var_221be278 in self.var_7c9174d1) {
        if (!isdefined(var_221be278)) {
            continue;
        }
        var_221be278 dodamage(500, self.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
    }
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 2, eflags: 0x1 linked
// Checksum 0x593201d3, Offset: 0x18b8
// Size: 0x170
function function_9940fbb9(var_344a6a1a, var_2a7cd391 = "use") {
    foreach (var_6d1ba563 in var_344a6a1a) {
        if (var_6d1ba563.var_83f44c == var_2a7cd391) {
            if (var_6d1ba563 ishidden()) {
                var_6d1ba563 show();
            }
        }
    }
    waitframe(3);
    foreach (var_716b4ead in var_344a6a1a) {
        if (var_716b4ead.var_83f44c != var_2a7cd391) {
            if (!var_716b4ead ishidden()) {
                var_716b4ead hide();
            }
        }
    }
}

// Namespace mp_hacienda_alt/mp_hacienda_alt
// Params 0, eflags: 0x0
// Checksum 0xea355c63, Offset: 0x1a30
// Size: 0x74
function init_devgui() {
    /#
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
    #/
}

