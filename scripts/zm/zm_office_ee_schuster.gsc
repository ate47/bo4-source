#using scripts\zm\zm_hms_util.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_characters.gsc;

#namespace zm_office_ee_schuster;

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 0, eflags: 0x2
// Checksum 0xfc8d0cf7, Offset: 0x138
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_office_ee_schuster", &__init__, &__main__, undefined);
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 0, eflags: 0x1 linked
// Checksum 0xf92f0896, Offset: 0x188
// Size: 0x34
function __init__() {
    clientfield::register("toplayer", "audio_log_ball_fx", 1, 3, "int");
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 0, eflags: 0x1 linked
// Checksum 0x7cbfe58c, Offset: 0x1c8
// Size: 0x194
function __main__() {
    level flag::wait_till("all_players_spawned");
    var_66ef9199 = struct::get_array("office_audio_log_schuster");
    foreach (var_9dc0380f in var_66ef9199) {
        var_5ee87ca5 = getentarray(var_9dc0380f.target, "targetname");
        array::run_all(var_5ee87ca5, &hide);
    }
    level flag::init(#"hash_519e40d088b134");
    zm_sq::register(#"ee_schuster", #"step_1", #"ee_schuster_step1", &ee_schuster_step1_setup, &ee_schuster_step1_cleanup);
    zm_sq::start(#"ee_schuster");
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 1, eflags: 0x1 linked
// Checksum 0xe748f31f, Offset: 0x368
// Size: 0x49c
function ee_schuster_step1_setup(var_5ea5c94d) {
    var_66ef9199 = struct::get_array("office_audio_log_schuster");
    a_e_players = getplayers();
    foreach (e_player in a_e_players) {
        if (e_player zm_characters::is_character(array(#"hash_59f3598ad57dadd8", #"hash_2bcebdf1bef33311", #"hash_5a715cb0a6e071ae"))) {
            foreach (var_9dc0380f in var_66ef9199) {
                if (var_9dc0380f.var_614bfc5c == 0) {
                    thread function_84471080(var_9dc0380f, e_player);
                    var_9dc0380f.var_efeb107b = e_player;
                    var_9dc0380f function_488e39dc();
                }
            }
            continue;
        }
        if (e_player zm_characters::is_character(array(#"hash_1aa57ef704f24fa5", #"hash_36bc80636f0fdac4"))) {
            foreach (var_9dc0380f in var_66ef9199) {
                if (var_9dc0380f.var_614bfc5c == 1) {
                    thread function_84471080(var_9dc0380f, e_player);
                    var_9dc0380f.var_efeb107b = e_player;
                    var_9dc0380f function_488e39dc();
                }
            }
            continue;
        }
        if (e_player zm_characters::is_character(array(#"hash_305f156156d37e34", #"hash_6df0037e3f390b15"))) {
            foreach (var_9dc0380f in var_66ef9199) {
                if (var_9dc0380f.var_614bfc5c == 2) {
                    thread function_84471080(var_9dc0380f, e_player);
                    var_9dc0380f.var_efeb107b = e_player;
                    var_9dc0380f function_488e39dc();
                }
            }
            continue;
        }
        if (e_player zm_characters::is_character(array(#"hash_22e6f7e13c3a99ef", #"hash_46b92e1337b43236"))) {
            foreach (var_9dc0380f in var_66ef9199) {
                if (var_9dc0380f.var_614bfc5c == 3) {
                    thread function_84471080(var_9dc0380f, e_player);
                    var_9dc0380f.var_efeb107b = e_player;
                    var_9dc0380f function_488e39dc();
                }
            }
        }
    }
    level.var_18ee515d = 0;
    if (!var_5ea5c94d) {
        level flag::wait_till(#"hash_519e40d088b134");
    }
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 2, eflags: 0x1 linked
// Checksum 0x4c2b1672, Offset: 0x810
// Size: 0xf0
function ee_schuster_step1_cleanup(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        level flag::set(#"hash_519e40d088b134");
        var_66ef9199 = struct::get_array("office_audio_log_schuster");
        foreach (var_9dc0380f in var_66ef9199) {
            if (isdefined(var_9dc0380f.var_b53bedef)) {
                array::delete_all(var_9dc0380f.var_b53bedef);
            }
        }
    }
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 2, eflags: 0x1 linked
// Checksum 0x11731e2f, Offset: 0x908
// Size: 0x94
function function_84471080(var_9dc0380f, e_player) {
    var_5ee87ca5 = getentarray(var_9dc0380f.target, "targetname");
    array::run_all(var_5ee87ca5, &showtoplayer, e_player);
    e_player clientfield::set_to_player("audio_log_ball_fx", var_9dc0380f.var_614bfc5c + 1);
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 0, eflags: 0x1 linked
// Checksum 0x5cf7ff30, Offset: 0x9a8
// Size: 0xe0
function function_488e39dc() {
    self.var_b53bedef = getentarray(self.target, "targetname");
    foreach (e_trig in self.var_b53bedef) {
        e_trig.var_6a633cb2 = self;
        if (e_trig.classname == "trigger_use_touch_new") {
            e_trig thread function_20b4f09a();
            continue;
        }
        e_trig thread function_938d4207();
    }
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 0, eflags: 0x1 linked
// Checksum 0x804c23fe, Offset: 0xa90
// Size: 0xac
function function_20b4f09a() {
    self endon(#"death");
    self usetriggerrequirelookat();
    self setcursorhint("HINT_NOICON");
    self sethintstring("");
    s_notify = self waittill(#"trigger");
    self.var_6a633cb2 thread function_8c80503();
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 0, eflags: 0x1 linked
// Checksum 0x6a1cbd6c, Offset: 0xb48
// Size: 0x54
function function_938d4207() {
    self endon(#"death");
    s_notify = self waittill(#"damage");
    self.var_6a633cb2 thread function_8c80503();
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 0, eflags: 0x1 linked
// Checksum 0x6acd7508, Offset: 0xba8
// Size: 0x1a4
function function_8c80503() {
    array::delete_all(self.var_b53bedef);
    switch (self.var_614bfc5c) {
    case 0:
        zm_hms_util::function_e308175e(#"hash_4b69ecaac4c5093c", self.origin, self.var_efeb107b);
        break;
    case 1:
        zm_hms_util::function_e308175e(#"hash_259620656585faec", self.origin, self.var_efeb107b);
        break;
    case 2:
        zm_hms_util::function_e308175e(#"hash_6ca16c0ef0c1e133", self.origin, self.var_efeb107b);
        break;
    case 3:
        zm_hms_util::function_e308175e(#"hash_43d44ec9f7a17e4b", self.origin, self.var_efeb107b);
        break;
    }
    self.var_b21e0263 = 0;
    level.var_18ee515d++;
    if (level.var_18ee515d == 4) {
        level flag::set(#"hash_519e40d088b134");
    }
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 0, eflags: 0x0
// Checksum 0xd2208461, Offset: 0xd58
// Size: 0xe8
function function_d4c6dc0d() {
    self.var_b21e0263 = 1;
    var_4ca5f5d0 = getent(self.target2, "targetname");
    var_df4e73a7 = getentarray(var_4ca5f5d0.target, "targetname");
    while (self.var_b21e0263 && var_df4e73a7.size > 0) {
        var_df4e73a7[0] rotatepitch(45, 1);
        wait(0.1);
        var_df4e73a7[1] rotatepitch(60, 1);
        wait(0.9);
    }
}

