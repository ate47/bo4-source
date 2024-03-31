// Atian COD Tools GSC decompiler test
#using scripts\core_common\encounters\aispawning.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace wave_manager_sys;

// Namespace wave_manager_sys
// Method(s) 2 Total 2
class cwavemanager {

    // Namespace cwavemanager/wave_manager
    // Params 0, eflags: 0x9 linked
    // Checksum 0x14029fc, Offset: 0x228
    // Size: 0x4a
    __constructor() {
        self.var_376c2c29 = [];
        self.var_4417045b = 1;
        self.var_23802722 = [];
        self.var_246fb97f = [];
        self.var_a709a080 = 0;
        self.var_6da7cde5 = 1;
    }

    // Namespace cwavemanager/wave_manager
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x280
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace wave_manager_sys
// Method(s) 2 Total 2
class class_2443998c {

    // Namespace class_2443998c/wave_manager
    // Params 0, eflags: 0x9 linked
    // Checksum 0xd007d7d2, Offset: 0x320
    // Size: 0x1a
    __constructor() {
        self.var_bcd4e683 = 0;
        self.var_bb290b79 = [];
    }

    // Namespace class_2443998c/wave_manager
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x348
    // Size: 0x4
    __destructor() {
        
    }

}

#namespace wave_manager;

// Namespace wave_manager
// Method(s) 2 Total 2
class class_8e39177 {

    // Namespace class_8e39177/wave_manager
    // Params 0, eflags: 0x9 linked
    // Checksum 0xae6e3e41, Offset: 0x5628
    // Size: 0xe
    __constructor() {
        self.a_params = [];
    }

    // Namespace class_8e39177/wave_manager
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x5640
    // Size: 0x4
    __destructor() {
        
    }

}

#namespace wave_manager_sys;

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x2
// Checksum 0x592f3965, Offset: 0x1e0
// Size: 0x3c
function autoexec __init__system__() {
    system::register("wave_manager", &__init__, &__main__, undefined);
}

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x5 linked
// Checksum 0x4331bcfc, Offset: 0x3e8
// Size: 0x5c
function private __init__() {
    level.var_ca74a4bc = [];
    level.a_s_wave_managers = [];
    /#
        setdvar(#"hash_1feb7de8a9fa6573", -1);
        level thread debug_think();
    #/
}

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x5 linked
// Checksum 0x8dc2fce5, Offset: 0x450
// Size: 0xec
function private __main__() {
    level.a_s_wave_managers = struct::get_script_bundle_instances("wave_manager");
    foreach (s_wave_manager in level.a_s_wave_managers) {
        s_wave_manager flag::init("wave_manager_started");
        s_wave_manager function_51ce850d();
    }
    level function_374e4d47();
    level function_ad40f5b3();
}

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x4
// Checksum 0x156e9f5d, Offset: 0x548
// Size: 0x1a4
function private update_devgui() {
    /#
        if (!isdefined(level.var_a44d1e7)) {
            level.var_a44d1e7 = 0;
        }
        level.var_a44d1e7++;
        str_map_name = util::get_map_name();
        foreach (var_dcd6c23 in level.var_ca74a4bc) {
            var_29b80910 = var_dcd6c23.var_cf3bea8a;
            str_team = var_dcd6c23.m_str_team;
            str_name = var_dcd6c23.var_556afb3d;
            cmd = "<unknown string>" + str_map_name + "<unknown string>" + str_team + "<unknown string>" + "<unknown string>" + var_29b80910 + "<unknown string>" + str_name + "<unknown string>" + var_29b80910 + "<unknown string>";
            adddebugcommand(cmd);
        }
        cmd = "<unknown string>" + str_map_name + "<unknown string>";
        adddebugcommand(cmd);
    #/
}

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x4
// Checksum 0xf00141fc, Offset: 0x6f8
// Size: 0xe5a
function private debug_think() {
    /#
        while (true) {
            n_wave_manager_id = getdvarint(#"hash_1feb7de8a9fa6573", 0);
            if (n_wave_manager_id != -1) {
                if (isdefined(level.var_ca74a4bc[n_wave_manager_id])) {
                    n_y_offset = 22;
                    var_90fbd845 = 22;
                    var_c708e6e1 = 120;
                    var_dcd6c23 = level.var_ca74a4bc[n_wave_manager_id];
                    var_29b80910 = var_dcd6c23.var_cf3bea8a;
                    str_name = var_dcd6c23.var_556afb3d;
                    if (var_dcd6c23 flag::get("<unknown string>")) {
                        /#
                            var_c708e6e1 = var_c708e6e1 + n_y_offset;
                            str_text = str_name + "<unknown string>";
                            debug2dtext((800, var_c708e6e1, 0), str_text, (1, 1, 0), 1, (0, 0, 0), 0.9, 1, 1);
                            var_c708e6e1 = var_c708e6e1 + n_y_offset;
                            debug2dtext((800, var_c708e6e1, 0), "<unknown string>", (0, 1, 1), 1, (0, 0, 0), 0.9, 1, 1);
                        #/
                        waitframe(1);
                        continue;
                    }
                    if (isdefined(var_dcd6c23.var_f68bc980) && var_dcd6c23.var_f68bc980 && var_dcd6c23.var_4417045b > var_dcd6c23.var_592f8f7f) {
                        waitframe(1);
                        continue;
                    }
                    str_team = var_dcd6c23.m_str_team;
                    /#
                        var_c708e6e1 = var_c708e6e1 + n_y_offset;
                        debug2dtext((800, var_c708e6e1, 0), "<unknown string>", (0, 1, 1), 1, (0, 0, 0), 0.9, 1, 1);
                    #/
                    if (isdefined(var_dcd6c23.var_f68bc980) && var_dcd6c23.var_f68bc980) {
                        str_status = "<unknown string>";
                    } else if (function_e43e16d2(var_dcd6c23)) {
                        str_status = "<unknown string>";
                    } else {
                        str_status = "<unknown string>";
                    }
                    /#
                        var_c708e6e1 = var_c708e6e1 + n_y_offset;
                        str_text = str_name + "<unknown string>" + str_status + "<unknown string>";
                        debug2dtext((800, var_c708e6e1, 0), str_text, (1, 1, 0), 1, (0, 0, 0), 0.9, 1, 1);
                        var_c708e6e1 = var_c708e6e1 + n_y_offset;
                        debug2dtext((800, var_c708e6e1, 0), "<unknown string>", (0, 1, 1), 1, (0, 0, 0), 0.9, 1, 1);
                    #/
                    if (function_a2115dc4(var_dcd6c23, var_dcd6c23.var_4417045b)) {
                        str_status = "<unknown string>";
                    } else if (function_e43e16d2(var_dcd6c23, var_dcd6c23.var_4417045b)) {
                        str_status = "<unknown string>";
                    } else {
                        str_status = "<unknown string>";
                    }
                    /#
                        str_text = "<unknown string>" + var_dcd6c23.var_4417045b + "<unknown string>" + var_dcd6c23.var_592f8f7f + "<unknown string>" + str_status + "<unknown string>";
                        var_c708e6e1 = var_c708e6e1 + n_y_offset;
                        debug2dtext((800, var_c708e6e1, 0), str_text, (0, 1, 0), 1, (0, 0, 0), 0.9, 1, 1);
                    #/
                    n_total_count = 0;
                    var_a549e716 = 0;
                    foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
                        n_total_count = n_total_count + var_c21b798e.var_23791f08;
                        var_a549e716 = var_a549e716 + var_c21b798e.var_a4202481;
                    }
                    /#
                        str_text = "<unknown string>" + n_total_count + "<unknown string>" + var_a549e716 + "<unknown string>";
                        var_c708e6e1 = var_c708e6e1 + n_y_offset;
                        debug2dtext((800, var_c708e6e1, 0), str_text, (0, 1, 0), 1, (0, 0, 0), 0.9, 1, 1);
                        var_c708e6e1 = var_c708e6e1 + n_y_offset;
                        debug2dtext((800, var_c708e6e1, 0), "<unknown string>", (0, 1, 1), 1, (0, 0, 0), 0.9, 1, 1);
                    #/
                    if (isdefined(var_dcd6c23.var_376c2c29)) {
                        var_c708e6e1 = var_c708e6e1 + n_y_offset;
                        var_1d3b29d6 = 1;
                        foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
                            if (function_f77ad8a3(var_c21b798e)) {
                                str_status = "<unknown string>";
                            } else if (function_9e2b33f4(var_c21b798e)) {
                                str_status = "<unknown string>";
                            } else {
                                str_status = "<unknown string>";
                            }
                            /#
                                str_text = "<unknown string>" + var_1d3b29d6 + "<unknown string>" + var_c21b798e.var_bcd4e683 + "<unknown string>" + var_c21b798e.var_23791f08 + "<unknown string>" + str_status + "<unknown string>";
                                debug2dtext((800, var_c708e6e1, 0), str_text, (1, 1, 1), 1, (0, 0, 0), 0.9, 1, 1);
                                var_c708e6e1 = var_c708e6e1 + var_90fbd845;
                            #/
                            var_1d3b29d6++;
                        }
                    }
                    if (isdefined(var_dcd6c23.var_376c2c29)) {
                        var_1d3b29d6 = 1;
                        foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
                            foreach (ai in var_c21b798e.var_bb290b79) {
                                if (isdefined(ai)) {
                                    /#
                                        sphere(ai.origin, 4, (0, 0, 1), 1, 0, 8, 1);
                                        print3d(ai.origin + vectorscale((0, 0, 1), 10), "<unknown string>" + var_dcd6c23.var_4417045b + "<unknown string>" + var_1d3b29d6, (0, 0, 1), 1, 0.5, 1);
                                    #/
                                    if (isdefined(var_dcd6c23.var_3844e966)) {
                                        /#
                                            line(ai.origin + vectorscale((0, 0, 1), 30), var_dcd6c23.var_3844e966.origin, (0, 0, 1), 1, 0, 1);
                                        #/
                                        continue;
                                    }
                                    if (isdefined(level.players[0])) {
                                        /#
                                            origin = level.players[0].origin + vectorscale(anglestoforward(level.players[0].angles), 100);
                                            line(ai.origin + vectorscale((0, 0, 1), 30), origin, (0, 0, 1), 1, 0, 1);
                                        #/
                                    }
                                }
                            }
                            var_1d3b29d6++;
                        }
                    }
                    if (isdefined(var_dcd6c23.var_419edb9f)) {
                        foreach (var_c082553f, v in var_dcd6c23.var_419edb9f) {
                            foreach (ai in v) {
                                if (isdefined(ai)) {
                                    /#
                                        sphere(ai.origin, 4, (1, 0, 0), 1, 0, 8, 1);
                                        print3d(ai.origin + vectorscale((0, 0, 1), 10), "<unknown string>" + var_c082553f, (1, 0, 0), 1, 0.5, 1);
                                    #/
                                    if (isdefined(var_dcd6c23.var_3844e966)) {
                                        /#
                                            line(ai.origin + vectorscale((0, 0, 1), 30), var_dcd6c23.var_3844e966.origin, (1, 0, 0), 1, 0, 1);
                                        #/
                                        continue;
                                    }
                                    if (isdefined(level.players[0])) {
                                        /#
                                            origin = level.players[0].origin + vectorscale(anglestoforward(level.players[0].angles), 100);
                                            line(ai.origin + vectorscale((0, 0, 1), 30), origin, (1, 0, 0), 1, 0, 1);
                                        #/
                                    }
                                }
                            }
                        }
                    }
                    if (isdefined(var_dcd6c23.var_3844e966)) {
                        /#
                            sphere(var_dcd6c23.var_3844e966.origin, 30, (0, 0, 1), 1, 0, 20, 1);
                        #/
                    }
                    if (isdefined(var_dcd6c23.var_246fb97f) && isarray(var_dcd6c23.var_246fb97f)) {
                        foreach (var_fa24a14b in var_dcd6c23.var_246fb97f) {
                            /#
                                sphere(var_fa24a14b.origin, 4, (0, 1, 0), 1, 0, 8, 1);
                                print3d(var_fa24a14b.origin + vectorscale((0, 0, 1), 10), function_9e72a96(var_fa24a14b.archetype), (0, 1, 0), 1, 0.5, 1);
                                line(var_fa24a14b.origin, var_fa24a14b.origin + vectorscale((0, 0, 1), 45), (0, 1, 0), 1, 0, 1);
                            #/
                        }
                    }
                }
            }
            waitframe(1);
        }
    #/
}

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x5 linked
// Checksum 0x80d5fd94, Offset: 0x1560
// Size: 0x15c
function private function_51ce850d() {
    self namespace_2e6206f9::register_callback("script_enable_on_success", &wave_manager::start);
    self namespace_2e6206f9::register_callback("script_enable_on_failure", &wave_manager::start);
    self namespace_2e6206f9::register_callback("script_enable_no_specialist", &wave_manager::start);
    self namespace_2e6206f9::register_callback("script_disable_on_success", &wave_manager::stop);
    self namespace_2e6206f9::register_callback("script_disable_on_failure", &wave_manager::stop);
    self namespace_2e6206f9::register_custom_callback("breadcrumb", "script_enable_on_success", &function_710cbc75);
    self namespace_2e6206f9::register_custom_callback("breadcrumb", "script_enable_on_failure", &function_710cbc75);
    self namespace_2e6206f9::register_custom_callback("breadcrumb", "script_enable_no_specialist", &function_710cbc75);
}

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x5 linked
// Checksum 0x74c3a017, Offset: 0x16c8
// Size: 0x148
function private function_374e4d47() {
    foreach (var_7418aa09 in trigger::get_all()) {
        var_a40eadd = [];
        foreach (s_wave_manager in level.a_s_wave_managers) {
            if (isdefined(var_7418aa09.target) && var_7418aa09.target === s_wave_manager.targetname) {
                array::add(var_a40eadd, s_wave_manager);
            }
        }
        if (var_a40eadd.size) {
            var_7418aa09 thread function_be478e08(var_a40eadd);
        }
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x5217e063, Offset: 0x1818
// Size: 0xa8
function private function_be478e08(var_a40eadd) {
    self endon(#"death");
    self trigger::wait_till();
    foreach (s_wave_manager in var_a40eadd) {
        s_wave_manager wave_manager::start();
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x5 linked
// Checksum 0xa5aad17c, Offset: 0x18c8
// Size: 0x1d8
function private function_ad40f5b3() {
    foreach (s_wave_manager in level.a_s_wave_managers) {
        if (isdefined(level.var_28c22d88) && isdefined(s_wave_manager.script_enable_on_skipto)) {
            foreach (var_d3440450 in level.var_28c22d88) {
                if (var_d3440450 == s_wave_manager.script_enable_on_skipto) {
                    s_wave_manager wave_manager::start();
                    s_wave_manager.var_f50b617f = 1;
                }
            }
        }
    }
    foreach (s_wave_manager in level.a_s_wave_managers) {
        if (isdefined(s_wave_manager.script_enable_on_start) && s_wave_manager.script_enable_on_start && !(isdefined(s_wave_manager.var_f50b617f) && s_wave_manager.var_f50b617f)) {
            s_wave_manager wave_manager::start();
        }
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 3, eflags: 0x5 linked
// Checksum 0xbf532dc8, Offset: 0x1aa8
// Size: 0x34
function private function_710cbc75(e_player, var_1ad9db60, b_branch) {
    start_internal(self);
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0xfc13e085, Offset: 0x1ae8
// Size: 0x14e
function private init_flags(var_dcd6c23) {
    /#
        assert(isdefined(var_dcd6c23));
    #/
    var_dcd6c23 flag::init("complete");
    var_dcd6c23 flag::init("cleared");
    var_dcd6c23 flag::init("paused");
    var_dcd6c23 flag::init("stopped");
    var_dcd6c23 flag::init("all_dead");
    for (n_wave = 1; n_wave <= var_dcd6c23.var_592f8f7f; n_wave++) {
        var_dcd6c23 flag::init("wave" + n_wave + "_complete");
        var_dcd6c23 flag::init("wave" + n_wave + "_cleared");
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x69c615bd, Offset: 0x1c40
// Size: 0xfe
function private reset(var_dcd6c23) {
    /#
        assert(isdefined(var_dcd6c23));
    #/
    var_dcd6c23 flag::clear("complete");
    var_dcd6c23 flag::clear("cleared");
    for (n_wave = 1; n_wave <= var_dcd6c23.var_592f8f7f; n_wave++) {
        var_dcd6c23 flag::clear("wave" + n_wave + "_complete");
        var_dcd6c23 flag::clear("wave" + n_wave + "_cleared");
    }
    var_dcd6c23.var_4417045b = 1;
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0xfa97935, Offset: 0x1d48
// Size: 0x7c
function private function_68766ec1(var_dcd6c23) {
    var_dcd6c23 flag::set("wave" + var_dcd6c23.var_4417045b + "_complete");
    if (var_dcd6c23.var_4417045b == var_dcd6c23.var_592f8f7f) {
        var_dcd6c23 flag::set("complete");
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 2, eflags: 0x4
// Checksum 0xf63ecc6a, Offset: 0x1dd0
// Size: 0x6c
function private function_e43e16d2(var_dcd6c23, n_wave) {
    if (isdefined(n_wave)) {
        return var_dcd6c23 flag::get("wave" + n_wave + "_complete");
    }
    return var_dcd6c23 flag::get("complete");
}

// Namespace wave_manager_sys/wave_manager
// Params 2, eflags: 0x5 linked
// Checksum 0xff528571, Offset: 0x1e48
// Size: 0x6c
function private function_aa6a8e4a(var_dcd6c23, n_wave) {
    if (isdefined(n_wave)) {
        var_dcd6c23 flag::wait_till("wave" + n_wave + "_complete");
        return;
    }
    var_dcd6c23 flag::wait_till("complete");
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x57b887, Offset: 0x1ec0
// Size: 0x74
function private function_2bba6468(var_dcd6c23) {
    var_dcd6c23 flag::set("wave" + var_dcd6c23.var_4417045b + "_cleared");
    if (var_dcd6c23.var_4417045b == var_dcd6c23.var_592f8f7f) {
        function_d9af887b(var_dcd6c23);
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 2, eflags: 0x4
// Checksum 0x60a25c29, Offset: 0x1f40
// Size: 0x6c
function private function_a2115dc4(var_dcd6c23, n_wave) {
    if (isdefined(n_wave)) {
        return var_dcd6c23 flag::get("wave" + n_wave + "_cleared");
    }
    return var_dcd6c23 flag::get("cleared");
}

// Namespace wave_manager_sys/wave_manager
// Params 3, eflags: 0x5 linked
// Checksum 0x1e6e1f0, Offset: 0x1fb8
// Size: 0x9c
function private function_55525f13(var_dcd6c23, n_wave, var_b8b3e39d) {
    if (isdefined(n_wave)) {
        var_dcd6c23 flag::wait_till("wave" + n_wave + "_cleared");
        return;
    }
    if (var_b8b3e39d) {
        var_dcd6c23 flag::wait_till("all_dead");
        return;
    }
    var_dcd6c23 flag::wait_till("cleared");
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x8de3e2c4, Offset: 0x2060
// Size: 0x258
function private function_d9af887b(var_dcd6c23) {
    var_dcd6c23 flag::set("cleared");
    if (isdefined(var_dcd6c23.var_f68bc980) && var_dcd6c23.var_f68bc980) {
        return;
    }
    var_dcd6c23 flag::set("stopped");
    var_dcd6c23.var_3844e966 = undefined;
    var_dcd6c23.m_s_bundle = undefined;
    var_dcd6c23.var_376c2c29 = undefined;
    var_dcd6c23.var_4417045b = undefined;
    var_dcd6c23.var_592f8f7f = undefined;
    var_dcd6c23.var_23802722 = undefined;
    var_dcd6c23.var_246fb97f = undefined;
    if (isdefined(var_dcd6c23.var_419edb9f)) {
        if (var_dcd6c23.var_a709a080) {
            foreach (var_13528014 in var_dcd6c23.var_419edb9f) {
                var_13528014 = array::remove_dead(var_13528014);
                array::thread_all(var_13528014, &util::auto_delete);
            }
        }
        thread function_30956db0(var_dcd6c23);
        if (var_dcd6c23.var_6da7cde5) {
            a_spawners = getspawnerarray(var_dcd6c23.var_27eacb34, "targetname");
            if (isdefined(a_spawners) && a_spawners.size) {
                foreach (spawner in a_spawners) {
                    if (isdefined(spawner)) {
                        spawner delete();
                    }
                }
            }
        }
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 2, eflags: 0x5 linked
// Checksum 0x9661876e, Offset: 0x22c0
// Size: 0x19e
function private stop_internal(var_dcd6c23, var_4bb2faf8) {
    if (var_dcd6c23 flag::get("stopped") || var_dcd6c23 flag::get("cleared") && !(isdefined(var_dcd6c23.var_f68bc980) && var_dcd6c23.var_f68bc980)) {
        return;
    }
    if (var_4bb2faf8) {
        var_dcd6c23.var_a709a080 = 1;
    }
    function_68ed489(var_dcd6c23);
    var_dcd6c23 flag::set("stopped");
    var_dcd6c23 flag::set("complete");
    for (n_wave = 1; n_wave <= var_dcd6c23.var_592f8f7f; n_wave++) {
        var_dcd6c23 flag::set("wave" + n_wave + "_complete");
        if (var_dcd6c23.var_4417045b < n_wave) {
            var_dcd6c23 flag::set("wave" + n_wave + "_cleared");
        }
    }
    var_dcd6c23.var_592f8f7f = var_dcd6c23.var_4417045b;
}

// Namespace wave_manager_sys/wave_manager
// Params 6, eflags: 0x5 linked
// Checksum 0x8cb860ad, Offset: 0x2468
// Size: 0x450
function private start_internal(s_wave_manager_struct, str_team, b_looping, str_wavemanager, var_e4db2502, var_e8332bc1) {
    var_dcd6c23 = new cwavemanager();
    var_dcd6c23.m_s_bundle = struct::get_script_bundle("wave_manager", isdefined(str_wavemanager) ? str_wavemanager : s_wave_manager_struct.scriptbundlename);
    var_dcd6c23.var_cf3bea8a = get_unique_id();
    var_dcd6c23.var_556afb3d = var_dcd6c23.m_s_bundle.name;
    if (isdefined(s_wave_manager_struct)) {
        var_dcd6c23.var_3844e966 = s_wave_manager_struct;
        s_wave_manager_struct.var_dcd6c23 = var_dcd6c23;
        if (isdefined(s_wave_manager_struct.target)) {
            var_dcd6c23.var_27eacb34 = s_wave_manager_struct.target;
        }
        var_dcd6c23.m_str_team = util::get_team_mapping(s_wave_manager_struct.script_team);
        var_dcd6c23.var_f68bc980 = isdefined(s_wave_manager_struct.script_looping) && s_wave_manager_struct.script_looping;
        var_dcd6c23.var_a709a080 = isdefined(s_wave_manager_struct.script_auto_delete) && s_wave_manager_struct.script_auto_delete;
        if (isdefined(s_wave_manager_struct.var_a69f424f)) {
            foreach (var_7635207b in s_wave_manager_struct.var_a69f424f) {
                if (!isdefined(var_dcd6c23.var_23802722)) {
                    var_dcd6c23.var_23802722 = [];
                } else if (!isarray(var_dcd6c23.var_23802722)) {
                    var_dcd6c23.var_23802722 = array(var_dcd6c23.var_23802722);
                }
                if (!isinarray(var_dcd6c23.var_23802722, var_7635207b)) {
                    var_dcd6c23.var_23802722[var_dcd6c23.var_23802722.size] = var_7635207b;
                }
            }
        }
    } else {
        var_dcd6c23.m_str_team = str_team;
        var_dcd6c23.var_f68bc980 = b_looping;
        if (isdefined(var_e4db2502)) {
            var_dcd6c23.var_27eacb34 = var_e4db2502;
        }
    }
    var_dcd6c23.var_592f8f7f = var_dcd6c23.m_s_bundle.wavecount;
    if (isdefined(var_e8332bc1)) {
        if (!isdefined(var_dcd6c23.var_23802722)) {
            var_dcd6c23.var_23802722 = [];
        } else if (!isarray(var_dcd6c23.var_23802722)) {
            var_dcd6c23.var_23802722 = array(var_dcd6c23.var_23802722);
        }
        if (!isinarray(var_dcd6c23.var_23802722, var_e8332bc1)) {
            var_dcd6c23.var_23802722[var_dcd6c23.var_23802722.size] = var_e8332bc1;
        }
    }
    level.var_ca74a4bc[var_dcd6c23.var_cf3bea8a] = var_dcd6c23;
    init_flags(var_dcd6c23);
    thread think(var_dcd6c23);
    /#
        update_devgui();
    #/
    if (isdefined(s_wave_manager_struct)) {
        s_wave_manager_struct flag::set("wave_manager_started");
    }
    return var_dcd6c23;
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x517e104b, Offset: 0x28c0
// Size: 0x662
function private think(var_dcd6c23) {
    while (true) {
        if (var_dcd6c23 flag::get("stopped")) {
            break;
        }
        if (var_dcd6c23.var_4417045b > var_dcd6c23.var_592f8f7f) {
            if (isdefined(var_dcd6c23.var_f68bc980) && var_dcd6c23.var_f68bc980) {
                reset(var_dcd6c23);
            } else {
                break;
            }
        }
        var_ed407c11 = var_dcd6c23.m_s_bundle.waves[var_dcd6c23.var_4417045b - 1];
        var_4e56e285 = isdefined(var_ed407c11.transitioncount) ? var_ed407c11.transitioncount : 0;
        var_b7681e7b = isdefined(var_ed407c11.transitiondelaymin) ? var_ed407c11.transitiondelaymin : 0;
        var_711b891b = isdefined(var_ed407c11.transitiondelaymax) ? var_ed407c11.transitiondelaymax : 0;
        if (var_b7681e7b < var_711b891b) {
            var_791750f5 = randomfloatrange(var_b7681e7b, var_711b891b);
        } else {
            var_791750f5 = var_b7681e7b;
        }
        var_dcd6c23.var_376c2c29 = [];
        for (var_f5d6a44e = 0; var_f5d6a44e < var_ed407c11.spawns.size; var_f5d6a44e++) {
            var_a2b4b991 = var_ed407c11.spawns[var_f5d6a44e];
            if (function_d081cf72(var_a2b4b991)) {
                var_c21b798e = new class_2443998c();
                var_c21b798e.var_4fb3156c = var_a2b4b991;
                var_c21b798e.var_ef327d57 = var_f5d6a44e;
                if (!isdefined(var_dcd6c23.var_376c2c29)) {
                    var_dcd6c23.var_376c2c29 = [];
                } else if (!isarray(var_dcd6c23.var_376c2c29)) {
                    var_dcd6c23.var_376c2c29 = array(var_dcd6c23.var_376c2c29);
                }
                var_dcd6c23.var_376c2c29[var_dcd6c23.var_376c2c29.size] = var_c21b798e;
                thread function_8f5ed189(var_dcd6c23, var_c21b798e);
                continue;
            }
            /#
                println("<unknown string>" + var_f5d6a44e + 1 + "<unknown string>");
                iprintln("<unknown string>" + var_f5d6a44e + 1 + "<unknown string>");
            #/
        }
        while (true) {
            b_transition_into_next_wave = 1;
            b_wave_complete = 1;
            b_wave_cleared = 1;
            foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
                if (!function_9e2b33f4(var_c21b798e)) {
                    b_wave_complete = 0;
                    break;
                }
            }
            if (!isdefined(var_4e56e285) || var_4e56e285 == 0) {
                foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
                    if (!function_f77ad8a3(var_c21b798e)) {
                        b_wave_cleared = 0;
                        b_transition_into_next_wave = 0;
                        break;
                    }
                }
            } else if (b_wave_complete) {
                var_179ea866 = 0;
                foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
                    if (isdefined(var_c21b798e.var_bb290b79)) {
                        var_179ea866 = var_179ea866 + var_c21b798e.var_bb290b79.size;
                    }
                }
                if (var_179ea866 > var_4e56e285) {
                    b_wave_cleared = 0;
                    b_transition_into_next_wave = 0;
                }
            } else {
                foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
                    if (!function_f77ad8a3(var_c21b798e)) {
                        b_wave_cleared = 0;
                        b_transition_into_next_wave = 0;
                        break;
                    }
                }
            }
            if (b_wave_complete) {
                function_68766ec1(var_dcd6c23);
            }
            if (b_wave_cleared) {
                function_68ed489(var_dcd6c23);
                function_2bba6468(var_dcd6c23);
            }
            if (b_transition_into_next_wave) {
                break;
            }
            wait(0.1);
        }
        if (isdefined(var_dcd6c23.var_4417045b)) {
            var_dcd6c23.var_4417045b++;
        }
        wait(var_791750f5 + 0.1);
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 2, eflags: 0x5 linked
// Checksum 0x81f29aec, Offset: 0x2f30
// Size: 0x100
function private function_ff49692b(var_dcd6c23, ai) {
    /#
        assert(isdefined(var_dcd6c23), "<unknown string>");
    #/
    /#
        assert(isdefined(ai), "<unknown string>");
    #/
    if (isdefined(var_dcd6c23.var_23802722)) {
        foreach (var_e8332bc1 in var_dcd6c23.var_23802722) {
            if (isdefined(var_e8332bc1.var_964c77e1)) {
                util::single_thread_argarray(ai, var_e8332bc1.var_964c77e1, var_e8332bc1.a_params);
            }
        }
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x2ba55a6e, Offset: 0x3038
// Size: 0x284
function private function_68ed489(var_dcd6c23) {
    if (!isdefined(var_dcd6c23.var_419edb9f)) {
        var_dcd6c23.var_419edb9f = [];
    }
    foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
        var_c21b798e.var_bb290b79 = array::remove_dead(var_c21b798e.var_bb290b79);
        if (var_c21b798e.var_bb290b79.size) {
            if (!isdefined(var_dcd6c23.var_419edb9f[var_dcd6c23.var_4417045b])) {
                var_dcd6c23.var_419edb9f[var_dcd6c23.var_4417045b] = [];
            }
            foreach (ai in var_c21b798e.var_bb290b79) {
                if (!isdefined(var_dcd6c23.var_419edb9f[var_dcd6c23.var_4417045b])) {
                    var_dcd6c23.var_419edb9f[var_dcd6c23.var_4417045b] = [];
                } else if (!isarray(var_dcd6c23.var_419edb9f[var_dcd6c23.var_4417045b])) {
                    var_dcd6c23.var_419edb9f[var_dcd6c23.var_4417045b] = array(var_dcd6c23.var_419edb9f[var_dcd6c23.var_4417045b]);
                }
                if (!isinarray(var_dcd6c23.var_419edb9f[var_dcd6c23.var_4417045b], ai)) {
                    var_dcd6c23.var_419edb9f[var_dcd6c23.var_4417045b][var_dcd6c23.var_419edb9f[var_dcd6c23.var_4417045b].size] = ai;
                }
            }
        }
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x5b62b84, Offset: 0x32c8
// Size: 0x56
function private function_30956db0(var_dcd6c23) {
    while (function_4b7647f(var_dcd6c23)) {
        wait(1);
    }
    var_dcd6c23 flag::set("all_dead");
    var_dcd6c23.var_419edb9f = undefined;
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x9b30ec52, Offset: 0x3328
// Size: 0x9c
function private function_4b7647f(var_dcd6c23) {
    foreach (a_ai in var_dcd6c23.var_419edb9f) {
        a_ai = array::remove_dead(a_ai);
        if (a_ai.size) {
            return true;
        }
    }
    return false;
}

// Namespace wave_manager_sys/wave_manager
// Params 3, eflags: 0x5 linked
// Checksum 0xb618d0db, Offset: 0x33d0
// Size: 0x55a
function private function_7909260f(var_dcd6c23, n_wave, var_bced2a83) {
    n_spawns = 0;
    if (var_dcd6c23 flag::get("stopped")) {
        if (var_bced2a83) {
            if (isdefined(var_dcd6c23.var_419edb9f)) {
                if (isdefined(n_wave)) {
                    if (isdefined(var_dcd6c23.var_419edb9f[n_wave])) {
                        var_dcd6c23.var_419edb9f[n_wave] = array::remove_dead(var_dcd6c23.var_419edb9f[n_wave]);
                        foreach (ai in var_dcd6c23.var_419edb9f[n_wave]) {
                            n_spawns++;
                        }
                    }
                } else {
                    foreach (var_13528014 in var_dcd6c23.var_419edb9f) {
                        var_13528014 = array::remove_dead(var_13528014);
                        foreach (ai in var_13528014) {
                            n_spawns++;
                        }
                    }
                }
            }
        }
    } else {
        for (i = 1; i <= var_dcd6c23.var_592f8f7f; i++) {
            if (isdefined(n_wave)) {
                if (i < n_wave) {
                    continue;
                } else if (i > n_wave) {
                    break;
                }
            }
            if (i < var_dcd6c23.var_4417045b) {
                if (var_bced2a83) {
                    if (isdefined(var_dcd6c23.var_419edb9f)) {
                        if (isdefined(var_dcd6c23.var_419edb9f[i])) {
                            var_dcd6c23.var_419edb9f[i] = array::remove_dead(var_dcd6c23.var_419edb9f[i]);
                            foreach (ai in var_dcd6c23.var_419edb9f[i]) {
                                n_spawns++;
                            }
                        }
                    }
                }
                continue;
            }
            if (i == var_dcd6c23.var_4417045b) {
                foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
                    var_1c88138f = var_c21b798e.var_23791f08 - var_c21b798e.var_bcd4e683;
                    if (isdefined(var_c21b798e.var_bb290b79)) {
                        var_c21b798e.var_bb290b79 = array::remove_dead(var_c21b798e.var_bb290b79);
                        var_1c88138f = var_1c88138f + var_c21b798e.var_bb290b79.size;
                    }
                    n_spawns = n_spawns + var_1c88138f;
                }
            } else {
                foreach (var_a2b4b991 in var_dcd6c23.m_s_bundle.waves[i - 1].spawns) {
                    n_spawns = n_spawns + (isdefined(var_a2b4b991.totalcount) ? var_a2b4b991.totalcount : 1);
                }
            }
            if (!var_bced2a83) {
                if (isdefined(var_dcd6c23.m_s_bundle.waves[i - 1].transitioncount)) {
                    n_spawns = n_spawns - var_dcd6c23.m_s_bundle.waves[i - 1].transitioncount;
                }
            }
        }
    }
    return n_spawns;
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x9a55866c, Offset: 0x3938
// Size: 0x9c
function private function_60fa5e02(var_c21b798e) {
    /#
        assert(isdefined(var_c21b798e), "<unknown string>");
    #/
    var_c21b798e flag::init("spawn_set_" + var_c21b798e.var_ef327d57 + "_complete");
    var_c21b798e flag::init("spawn_set_" + var_c21b798e.var_ef327d57 + "_cleared");
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x9e26b265, Offset: 0x39e0
// Size: 0x44
function private complete_spawn_set(var_c21b798e) {
    var_c21b798e flag::set("spawn_set_" + var_c21b798e.var_ef327d57 + "_complete");
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x50c451a8, Offset: 0x3a30
// Size: 0x42
function private function_9e2b33f4(var_c21b798e) {
    return var_c21b798e flag::get("spawn_set_" + var_c21b798e.var_ef327d57 + "_complete");
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x201764b5, Offset: 0x3a80
// Size: 0x44
function private function_d652a051(var_c21b798e) {
    var_c21b798e flag::set("spawn_set_" + var_c21b798e.var_ef327d57 + "_cleared");
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x9ced449f, Offset: 0x3ad0
// Size: 0x42
function private function_f77ad8a3(var_c21b798e) {
    return var_c21b798e flag::get("spawn_set_" + var_c21b798e.var_ef327d57 + "_cleared");
}

// Namespace wave_manager_sys/wave_manager
// Params 2, eflags: 0x5 linked
// Checksum 0xd66b703f, Offset: 0x3b20
// Size: 0x1024
function private function_8f5ed189(var_dcd6c23, var_c21b798e) {
    function_60fa5e02(var_c21b798e);
    var_a2b4b991 = var_c21b798e.var_4fb3156c;
    var_c165240a = function_ed819a97(var_a2b4b991);
    var_c21b798e.var_a4202481 = isdefined(var_a2b4b991.activecount) ? var_a2b4b991.activecount : 1;
    var_c21b798e.var_23791f08 = isdefined(var_a2b4b991.totalcount) ? var_a2b4b991.totalcount : 1;
    var_ac751707 = isdefined(var_a2b4b991.groupsizemin) ? var_a2b4b991.groupsizemin : 1;
    var_777f23ac = isdefined(var_a2b4b991.groupsizemax) ? var_a2b4b991.groupsizemax : 1;
    if (var_ac751707 < var_777f23ac) {
        var_ff8eea0d = 1;
    } else {
        var_ff8eea0d = 0;
        n_group_size = var_ac751707;
    }
    var_393f60f2 = isdefined(var_a2b4b991.var_5794c814) ? var_a2b4b991.var_5794c814 : 1;
    var_58b22097 = isdefined(var_a2b4b991.var_455e5daf) ? var_a2b4b991.var_455e5daf : 0;
    var_685248c4 = isdefined(var_a2b4b991.var_6d514904) ? var_a2b4b991.var_6d514904 : 0;
    if (var_58b22097 < var_685248c4) {
        n_start_delay = randomfloatrange(var_58b22097, var_685248c4);
    } else {
        n_start_delay = var_58b22097;
    }
    var_4e06036b = isdefined(var_a2b4b991.spawndelaymin) ? var_a2b4b991.spawndelaymin : 0;
    var_d18f896 = isdefined(var_a2b4b991.spawndelaymax) ? var_a2b4b991.spawndelaymax : 0;
    if (var_4e06036b < var_d18f896) {
        var_178b2076 = 1;
    } else {
        var_178b2076 = 0;
        n_spawn_delay = var_4e06036b;
    }
    var_88f8dfe3 = gettime();
    var_e7bc5a90 = 1;
    var_a9e6e26a = 1;
    while (true) {
        if (var_dcd6c23 flag::get("stopped")) {
            break;
        }
        if (var_dcd6c23 flag::get("paused")) {
            wait(0.1);
            continue;
        }
        if (var_c165240a.size == 0) {
            break;
        }
        if (var_c21b798e.var_bcd4e683 >= var_c21b798e.var_23791f08) {
            break;
        }
        var_a9dc13fe = 0;
        var_a5f569fc = undefined;
        if (isdefined(var_c21b798e.var_bb290b79)) {
            var_c21b798e.var_bb290b79 = array::remove_dead(var_c21b798e.var_bb290b79);
        }
        foreach (var_40b0c36 in var_c165240a) {
            var_40b0c36.var_a33f2319 = array::remove_dead(var_40b0c36.var_a33f2319);
        }
        var_303d0ec5 = var_c21b798e.var_23791f08 - var_c21b798e.var_bcd4e683;
        if (var_e7bc5a90) {
            if (var_ff8eea0d) {
                var_ac751707 = math::clamp(var_ac751707, 1, var_303d0ec5);
                var_777f23ac = math::clamp(var_777f23ac, 1, var_303d0ec5);
                if (var_ac751707 == var_777f23ac) {
                    n_group_size = var_ac751707;
                } else {
                    n_group_size = randomintrange(var_ac751707, var_777f23ac + 1);
                }
            } else {
                n_group_size = math::clamp(n_group_size, 1, var_303d0ec5);
            }
            if (var_a9e6e26a) {
                var_cfe8c244 = n_start_delay;
                var_a9e6e26a = 0;
            } else {
                if (var_178b2076) {
                    n_spawn_delay = randomfloatrange(var_4e06036b, var_d18f896);
                }
                var_cfe8c244 = n_spawn_delay;
            }
        }
        var_e7bc5a90 = 0;
        if (!isdefined(var_c21b798e.var_bb290b79) || var_c21b798e.var_bb290b79.size < var_c21b798e.var_a4202481) {
            var_a5f569fc = var_c21b798e.var_a4202481 - var_c21b798e.var_bb290b79.size;
            var_db4208eb = function_d8cca6d5(var_c165240a);
            if (var_a5f569fc >= n_group_size && var_db4208eb.size) {
                var_7c275302 = gettime() - var_88f8dfe3;
                var_1b5feb05 = float(var_7c275302);
                if (var_1b5feb05 >= int(var_cfe8c244 * 1000)) {
                    var_a9dc13fe = 1;
                }
            }
        }
        if (!var_a9dc13fe) {
            wait(0.1);
            continue;
        }
        var_6a60a2e6 = 0;
        /#
            assert(isdefined(var_a5f569fc), "<unknown string>");
        #/
        var_13027679 = undefined;
        var_26413beb = undefined;
        var_549391b8 = undefined;
        while (var_6a60a2e6 < n_group_size) {
            if (n_group_size <= 1) {
                var_549391b8 = undefined;
            }
            if (var_dcd6c23 flag::get("stopped")) {
                break;
            }
            if (var_dcd6c23 flag::get("paused")) {
                wait(0.1);
                continue;
            }
            var_db4208eb = function_d8cca6d5(var_c165240a);
            if (!var_db4208eb.size) {
                /#
                    println("<unknown string>" + var_dcd6c23.var_556afb3d + "<unknown string>" + var_c21b798e.var_ef327d57 + 1 + "<unknown string>");
                    iprintln("<unknown string>" + var_dcd6c23.var_556afb3d + "<unknown string>" + var_c21b798e.var_ef327d57 + 1 + "<unknown string>");
                #/
                break;
            }
            if (!(isdefined(var_393f60f2) && var_393f60f2) && isdefined(var_13027679)) {
                if (!isinarray(var_db4208eb, var_26413beb)) {
                    /#
                        println("<unknown string>" + var_26413beb + "<unknown string>" + var_dcd6c23.var_556afb3d + "<unknown string>" + var_c21b798e.var_ef327d57 + 1 + "<unknown string>");
                        iprintln("<unknown string>" + var_26413beb + "<unknown string>" + var_dcd6c23.var_556afb3d + "<unknown string>" + var_c21b798e.var_ef327d57 + 1 + "<unknown string>");
                    #/
                    break;
                }
                var_aea390b6 = var_13027679;
                var_82706add = var_26413beb;
            } else {
                var_82706add = var_db4208eb[randomint(var_db4208eb.size)];
            }
            spawner::global_spawn_throttle();
            if (!isdefined(var_549391b8) || !isdefined(var_549391b8[#"spawner"]) || var_549391b8[#"spawner"].count < 1 && !(isdefined(var_549391b8[#"spawner"].spawnflags) && (var_549391b8[#"spawner"].spawnflags & 64) == 64)) {
                s_spawn_point = aispawningutility::function_e312ad4d(var_dcd6c23.m_str_team, var_dcd6c23.var_27eacb34, var_82706add);
                if (!isdefined(s_spawn_point)) {
                    /#
                        println("<unknown string>" + var_82706add + "<unknown string>" + var_dcd6c23.var_556afb3d + "<unknown string>");
                        iprintln("<unknown string>" + var_82706add + "<unknown string>" + var_dcd6c23.var_556afb3d + "<unknown string>");
                    #/
                    arrayremoveindex(var_c165240a, var_82706add, 1);
                    if (var_c165240a.size > 0 && isdefined(var_393f60f2) && var_393f60f2) {
                        continue;
                    }
                    break;
                }
            }
            v_origin = isdefined(s_spawn_point) ? s_spawn_point[#"origin"] : (0, 0, 0);
            v_angles = isdefined(s_spawn_point) ? s_spawn_point[#"angles"] : (0, 0, 0);
            var_c8fa21da = isdefined(s_spawn_point) ? s_spawn_point[#"spawner"] : undefined;
            if (n_group_size > 1) {
                var_549391b8 = s_spawn_point;
            }
            if (isdefined(var_c8fa21da)) {
                b_infinite_spawn = isdefined(var_c8fa21da.spawnflags) && (var_c8fa21da.spawnflags & 64) == 64;
                b_force_spawn = isdefined(var_c8fa21da.spawnflags) && (var_c8fa21da.spawnflags & 16) == 16;
            }
            var_ae2df0a1 = isdefined(var_c8fa21da.aitype) && function_e949cfd7(var_c8fa21da.aitype);
            if (var_ae2df0a1) {
                if (isdefined(var_c8fa21da)) {
                    ai = var_c8fa21da spawnfromspawner(s_spawn_point[#"spawner"].targetname, b_force_spawn, 0, b_infinite_spawn);
                    if (!isdefined(var_dcd6c23.var_246fb97f)) {
                        var_dcd6c23.var_246fb97f = [];
                    } else if (!isarray(var_dcd6c23.var_246fb97f)) {
                        var_dcd6c23.var_246fb97f = array(var_dcd6c23.var_246fb97f);
                    }
                    if (!isinarray(var_dcd6c23.var_246fb97f, var_c8fa21da)) {
                        var_dcd6c23.var_246fb97f[var_dcd6c23.var_246fb97f.size] = var_c8fa21da;
                    }
                }
            } else if (isdefined(var_c8fa21da)) {
                ai = var_c8fa21da spawnfromspawner(s_spawn_point[#"spawner"].targetname, b_force_spawn, 0, b_infinite_spawn);
                if (!isdefined(var_dcd6c23.var_246fb97f)) {
                    var_dcd6c23.var_246fb97f = [];
                } else if (!isarray(var_dcd6c23.var_246fb97f)) {
                    var_dcd6c23.var_246fb97f = array(var_dcd6c23.var_246fb97f);
                }
                if (!isinarray(var_dcd6c23.var_246fb97f, var_c8fa21da)) {
                    var_dcd6c23.var_246fb97f[var_dcd6c23.var_246fb97f.size] = var_c8fa21da;
                }
            }
            if (isdefined(ai)) {
                function_ff49692b(var_dcd6c23, ai);
                if (!isdefined(var_c21b798e.var_bb290b79)) {
                    var_c21b798e.var_bb290b79 = [];
                } else if (!isarray(var_c21b798e.var_bb290b79)) {
                    var_c21b798e.var_bb290b79 = array(var_c21b798e.var_bb290b79);
                }
                var_c21b798e.var_bb290b79[var_c21b798e.var_bb290b79.size] = ai;
                if (!isdefined(var_c165240a[var_82706add].var_a33f2319)) {
                    var_c165240a[var_82706add].var_a33f2319 = [];
                } else if (!isarray(var_c165240a[var_82706add].var_a33f2319)) {
                    var_c165240a[var_82706add].var_a33f2319 = array(var_c165240a[var_82706add].var_a33f2319);
                }
                var_c165240a[var_82706add].var_a33f2319[var_c165240a[var_82706add].var_a33f2319.size] = ai;
                var_88f8dfe3 = gettime();
                var_e7bc5a90 = 1;
                var_c21b798e.var_bcd4e683++;
                var_6a60a2e6++;
            }
            var_13027679 = var_aea390b6;
            var_26413beb = var_82706add;
            wait(0.1);
        }
        wait(0.1);
    }
    complete_spawn_set(var_c21b798e);
    while (true) {
        var_c21b798e.var_bb290b79 = array::remove_dead(var_c21b798e.var_bb290b79);
        if (!var_c21b798e.var_bb290b79.size) {
            function_d652a051(var_c21b798e);
            return;
        }
        wait(0.1);
    }
}

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x5 linked
// Checksum 0x57d41ba2, Offset: 0x4b50
// Size: 0x48
function private get_unique_id() {
    if (!isdefined(level.n_wave_manager_id)) {
        level.n_wave_manager_id = 0;
    }
    id = level.n_wave_manager_id;
    level.n_wave_manager_id++;
    return id;
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0xb836ba97, Offset: 0x4ba0
// Size: 0x98
function private function_d081cf72(var_a2b4b991) {
    if (isdefined(var_a2b4b991.spawntypes)) {
        foreach (s_spawn_type in var_a2b4b991.spawntypes) {
            if (isdefined(s_spawn_type.variant)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0xb9b7bdc5, Offset: 0x4c40
// Size: 0x12e
function private function_ed819a97(var_a2b4b991) {
    var_c165240a = [];
    if (isdefined(var_a2b4b991.spawntypes)) {
        foreach (s_spawn_type in var_a2b4b991.spawntypes) {
            if (isdefined(s_spawn_type.variant)) {
                var_2f2d7675 = isdefined(s_spawn_type.var_34ceb858) ? s_spawn_type.var_34ceb858 : 0;
                var_40b0c36 = {#var_2f2d7675:var_2f2d7675, #var_a33f2319:[], #name:s_spawn_type.variant};
                var_c165240a[s_spawn_type.variant] = var_40b0c36;
            }
        }
    }
    return var_c165240a;
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x6ec003d2, Offset: 0x4d78
// Size: 0x130
function private function_d8cca6d5(var_c165240a) {
    var_db4208eb = [];
    foreach (v in var_c165240a) {
        var_2f2d7675 = v.var_2f2d7675;
        if (var_2f2d7675 == 0 || v.var_a33f2319.size < var_2f2d7675) {
            if (!isdefined(var_db4208eb)) {
                var_db4208eb = [];
            } else if (!isarray(var_db4208eb)) {
                var_db4208eb = array(var_db4208eb);
            }
            if (!isinarray(var_db4208eb, v.name)) {
                var_db4208eb[var_db4208eb.size] = v.name;
            }
        }
    }
    return var_db4208eb;
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x125f8e84, Offset: 0x4eb0
// Size: 0x318
function private function_32b947df(kvp) {
    var_fed53aae = [];
    if (isdefined(kvp)) {
        str_key = "targetname";
        str_value = kvp;
        if (isarray(kvp)) {
            str_key = kvp[0];
            str_value = kvp[1];
        }
        a_s_wave_managers = struct::get_array(str_value, str_key);
        a_s_wave_managers = array::filter(a_s_wave_managers, 0, &function_5b3b889f);
        foreach (s_wave_manager in a_s_wave_managers) {
            if (isdefined(s_wave_manager.var_dcd6c23)) {
                if (!isdefined(var_fed53aae)) {
                    var_fed53aae = [];
                } else if (!isarray(var_fed53aae)) {
                    var_fed53aae = array(var_fed53aae);
                }
                if (!isinarray(var_fed53aae, s_wave_manager.var_dcd6c23)) {
                    var_fed53aae[var_fed53aae.size] = s_wave_manager.var_dcd6c23;
                }
            }
        }
        /#
            assert(a_s_wave_managers.size, "<unknown string>" + str_key + "<unknown string>" + str_value + "<unknown string>");
        #/
    } else {
        var_666d249b = self;
        if (!isdefined(var_666d249b)) {
            var_666d249b = [];
        } else if (!isarray(var_666d249b)) {
            var_666d249b = array(var_666d249b);
        }
        foreach (var_989041ce in var_666d249b) {
            var_dcd6c23 = var_989041ce function_fa056daa();
            if (isdefined(var_dcd6c23)) {
                if (!isdefined(var_fed53aae)) {
                    var_fed53aae = [];
                } else if (!isarray(var_fed53aae)) {
                    var_fed53aae = array(var_fed53aae);
                }
                var_fed53aae[var_fed53aae.size] = var_dcd6c23;
            }
        }
    }
    return var_fed53aae;
}

// Namespace wave_manager_sys/wave_manager
// Params 2, eflags: 0x5 linked
// Checksum 0x742a2024, Offset: 0x51d0
// Size: 0x178
function private function_63e08195(kvp, b_assert = 1) {
    a_s_wave_managers = [];
    if (isdefined(kvp)) {
        if (isarray(kvp)) {
            str_value = kvp[0];
            str_key = kvp[1];
        } else {
            str_value = kvp;
            str_key = "targetname";
        }
        a_s_wave_managers = struct::get_array(str_value, str_key);
    } else {
        a_s_wave_managers = self;
        if (!isdefined(a_s_wave_managers)) {
            a_s_wave_managers = [];
        } else if (!isarray(a_s_wave_managers)) {
            a_s_wave_managers = array(a_s_wave_managers);
        }
    }
    a_s_wave_managers = array::filter(a_s_wave_managers, 0, &function_5b3b889f);
    if (b_assert) {
        /#
            assert(a_s_wave_managers.size, isdefined(kvp) ? "<unknown string>" + str_key + "<unknown string>" + str_value + "<unknown string>" : "<unknown string>");
        #/
    }
    return a_s_wave_managers;
}

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x5 linked
// Checksum 0x7a4aff75, Offset: 0x5350
// Size: 0x7e
function private function_fa056daa() {
    if (isinarray(level.a_s_wave_managers, self)) {
        if (isdefined(self.var_dcd6c23)) {
            return self.var_dcd6c23;
        } else {
            return undefined;
        }
    } else if (self function_e0bfee59()) {
        return self;
    }
    /#
        assertmsg("<unknown string>");
    #/
    return undefined;
}

// Namespace wave_manager_sys/wave_manager
// Params 0, eflags: 0x5 linked
// Checksum 0xf16a66cc, Offset: 0x53d8
// Size: 0x32
function private function_e0bfee59() {
    if (isdefined(self.var_cf3bea8a) && level.var_ca74a4bc[self.var_cf3bea8a] == self) {
        return true;
    }
    return false;
}

// Namespace wave_manager_sys/wave_manager
// Params 1, eflags: 0x5 linked
// Checksum 0x169c6de5, Offset: 0x5418
// Size: 0x2a
function private function_5b3b889f(var_ac1d69cd) {
    return isinarray(level.a_s_wave_managers, var_ac1d69cd);
}

// Namespace wave_manager_sys/wave_manager
// Params 2, eflags: 0x5 linked
// Checksum 0xc46706c3, Offset: 0x5450
// Size: 0x1ce
function private function_bf55c711(n_wave, var_bced2a83) {
    s_bundle = struct::get_script_bundle("wave_manager", self.scriptbundlename);
    n_ai_count = 0;
    foreach (n_index, s_wave in s_bundle.waves) {
        if (isdefined(n_wave)) {
            if (n_index < n_wave - 1) {
                continue;
            } else if (n_index > n_wave - 1) {
                break;
            }
        }
        var_b4d30f09 = 0;
        foreach (var_a2b4b991 in s_wave.spawns) {
            var_b4d30f09 = var_b4d30f09 + (isdefined(var_a2b4b991.totalcount) ? var_a2b4b991.totalcount : 1);
        }
        if (!var_bced2a83 && isdefined(s_wave.transitioncount)) {
            var_b4d30f09 = var_b4d30f09 - s_wave.transitioncount;
        }
        n_ai_count = n_ai_count + var_b4d30f09;
    }
    return n_ai_count;
}

#namespace wave_manager;

// Namespace wave_manager/wave_manager
// Params 3, eflags: 0x21 linked
// Checksum 0xefca3a76, Offset: 0x56e0
// Size: 0xf8
function start(kvp, var_964c77e1, ...) {
    a_s_wave_managers = self wave_manager_sys::function_63e08195(kvp);
    foreach (s_wave_manager in a_s_wave_managers) {
        var_e8332bc1 = new class_8e39177();
        var_e8332bc1.var_964c77e1 = var_964c77e1;
        var_e8332bc1.a_params = vararg;
        wave_manager_sys::start_internal(s_wave_manager, undefined, undefined, undefined, undefined, var_e8332bc1);
    }
}

// Namespace wave_manager/wave_manager
// Params 6, eflags: 0x20
// Checksum 0x33d4fd6b, Offset: 0x57e0
// Size: 0xa2
function function_be3a34f(var_b6ee6116, str_team, b_looping = 0, var_e4db2502, var_964c77e1, ...) {
    var_e8332bc1 = new class_8e39177();
    var_e8332bc1.var_964c77e1 = var_964c77e1;
    var_e8332bc1.a_params = vararg;
    return wave_manager_sys::start_internal(undefined, str_team, b_looping, var_b6ee6116, var_e4db2502, var_e8332bc1);
}

// Namespace wave_manager/wave_manager
// Params 1, eflags: 0x0
// Checksum 0x8ab95be7, Offset: 0x5890
// Size: 0x130
function wait_till_complete(n_wave) {
    var_666d249b = self;
    if (!isdefined(var_666d249b)) {
        var_666d249b = [];
    } else if (!isarray(var_666d249b)) {
        var_666d249b = array(var_666d249b);
    }
    foreach (var_989041ce in var_666d249b) {
        if (wave_manager_sys::function_5b3b889f(var_989041ce)) {
            var_989041ce flag::wait_till("wave_manager_started");
        }
        var_dcd6c23 = var_989041ce wave_manager_sys::function_fa056daa();
        if (isdefined(var_dcd6c23)) {
            wave_manager_sys::function_aa6a8e4a(var_dcd6c23, n_wave);
        }
    }
}

// Namespace wave_manager/wave_manager
// Params 2, eflags: 0x0
// Checksum 0xeb2ef546, Offset: 0x59c8
// Size: 0x148
function wait_till_cleared(n_wave, var_b8b3e39d = 0) {
    var_666d249b = self;
    if (!isdefined(var_666d249b)) {
        var_666d249b = [];
    } else if (!isarray(var_666d249b)) {
        var_666d249b = array(var_666d249b);
    }
    foreach (var_989041ce in var_666d249b) {
        if (wave_manager_sys::function_5b3b889f(var_989041ce)) {
            var_989041ce flag::wait_till("wave_manager_started");
        }
        var_dcd6c23 = var_989041ce wave_manager_sys::function_fa056daa();
        if (isdefined(var_dcd6c23)) {
            wave_manager_sys::function_55525f13(var_dcd6c23, n_wave, var_b8b3e39d);
        }
    }
}

// Namespace wave_manager/wave_manager
// Params 0, eflags: 0x0
// Checksum 0x1f533558, Offset: 0x5b18
// Size: 0x130
function function_fa5a19de() {
    var_666d249b = self;
    if (!isdefined(var_666d249b)) {
        var_666d249b = [];
    } else if (!isarray(var_666d249b)) {
        var_666d249b = array(var_666d249b);
    }
    foreach (var_989041ce in var_666d249b) {
        if (wave_manager_sys::function_5b3b889f(var_989041ce)) {
            var_989041ce flag::wait_till("wave_manager_started");
        }
        var_dcd6c23 = var_989041ce wave_manager_sys::function_fa056daa();
        if (isdefined(var_dcd6c23)) {
            var_dcd6c23 flag::wait_till("stopped");
        }
    }
}

// Namespace wave_manager/wave_manager
// Params 0, eflags: 0x0
// Checksum 0xd6b7cd0b, Offset: 0x5c50
// Size: 0x80
function is_looping() {
    var_dcd6c23 = self wave_manager_sys::function_fa056daa();
    if (isdefined(var_dcd6c23)) {
        return (isdefined(var_dcd6c23.var_f68bc980) && var_dcd6c23.var_f68bc980);
    }
    if (wave_manager_sys::function_5b3b889f(self)) {
        return (isdefined(self.script_looping) && self.script_looping);
    }
    return false;
}

// Namespace wave_manager/wave_manager
// Params 2, eflags: 0x0
// Checksum 0xa294a82d, Offset: 0x5cd8
// Size: 0x1c6
function function_1c556906(kvp, var_b3a058ca) {
    var_fed53aae = self wave_manager_sys::function_32b947df(kvp);
    foreach (var_dcd6c23 in var_fed53aae) {
        /#
            assert(isdefined(var_b3a058ca));
        #/
        a_sp_new = getspawnerteamarray(var_dcd6c23.m_str_team);
        var_91504a05 = 0;
        if (isdefined(a_sp_new) && isarray(a_sp_new) && a_sp_new.size) {
            foreach (sp_new in a_sp_new) {
                if (sp_new.targetname === var_b3a058ca) {
                    var_91504a05 = 1;
                    break;
                }
            }
        }
        /#
            assert(var_91504a05, "<unknown string>" + var_b3a058ca);
        #/
        var_dcd6c23.var_27eacb34 = var_b3a058ca;
    }
}

// Namespace wave_manager/wave_manager
// Params 2, eflags: 0x0
// Checksum 0x4d14abd4, Offset: 0x5ea8
// Size: 0x206
function function_a3469200(kvp, var_4b054c7f) {
    a_ai = [];
    var_fed53aae = self wave_manager_sys::function_32b947df(kvp);
    if (isdefined(var_4b054c7f)) {
        var_4b054c7f--;
    }
    foreach (var_dcd6c23 in var_fed53aae) {
        if (isdefined(var_dcd6c23.var_376c2c29)) {
            if (isdefined(var_4b054c7f) && var_4b054c7f > 0) {
                if (isdefined(var_dcd6c23.var_376c2c29[var_4b054c7f])) {
                    a_ai = var_dcd6c23.var_376c2c29[var_4b054c7f].var_bb290b79;
                }
            } else {
                foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
                    foreach (ai in var_c21b798e.var_bb290b79) {
                        a_ai[a_ai.size] = ai;
                    }
                }
            }
            a_ai = array::remove_dead(a_ai);
        }
    }
    return a_ai;
}

// Namespace wave_manager/wave_manager
// Params 2, eflags: 0x0
// Checksum 0x53ee9915, Offset: 0x60b8
// Size: 0x3f6
function function_77941ace(kvp, n_wave) {
    a_ai = [];
    var_fed53aae = self wave_manager_sys::function_32b947df(kvp);
    foreach (var_dcd6c23 in var_fed53aae) {
        if (isdefined(var_dcd6c23.var_376c2c29)) {
            if (!isdefined(n_wave) || n_wave === var_dcd6c23.var_4417045b) {
                foreach (var_c21b798e in var_dcd6c23.var_376c2c29) {
                    foreach (ai in var_c21b798e.var_bb290b79) {
                        a_ai[a_ai.size] = ai;
                    }
                }
            }
        }
        if (isdefined(var_dcd6c23.var_419edb9f)) {
            if (isdefined(n_wave)) {
                if (isdefined(var_dcd6c23.var_419edb9f[n_wave])) {
                    foreach (ai in var_dcd6c23.var_419edb9f[n_wave]) {
                        if (!isdefined(a_ai)) {
                            a_ai = [];
                        } else if (!isarray(a_ai)) {
                            a_ai = array(a_ai);
                        }
                        if (!isinarray(a_ai, ai)) {
                            a_ai[a_ai.size] = ai;
                        }
                    }
                }
            } else {
                foreach (var_13528014 in var_dcd6c23.var_419edb9f) {
                    foreach (ai in var_13528014) {
                        if (!isdefined(a_ai)) {
                            a_ai = [];
                        } else if (!isarray(a_ai)) {
                            a_ai = array(a_ai);
                        }
                        if (!isinarray(a_ai, ai)) {
                            a_ai[a_ai.size] = ai;
                        }
                    }
                }
            }
        }
        a_ai = array::remove_dead(a_ai);
    }
    return a_ai;
}

// Namespace wave_manager/wave_manager
// Params 3, eflags: 0x0
// Checksum 0x9f6c380b, Offset: 0x64b8
// Size: 0x128
function function_6893f05b(kvp, n_wave, var_bced2a83 = 1) {
    a_s_wave_managers = [];
    a_s_wave_managers = self wave_manager_sys::function_63e08195(kvp);
    var_a1f4e09d = 0;
    foreach (s_wave_manager in a_s_wave_managers) {
        if (isdefined(s_wave_manager.var_dcd6c23)) {
            var_a1f4e09d = var_a1f4e09d + wave_manager_sys::function_7909260f(s_wave_manager.var_dcd6c23, n_wave, var_bced2a83);
            continue;
        }
        var_a1f4e09d = var_a1f4e09d + s_wave_manager wave_manager_sys::function_bf55c711(n_wave, var_bced2a83);
    }
    return var_a1f4e09d;
}

// Namespace wave_manager/wave_manager
// Params 3, eflags: 0x20
// Checksum 0x1f3a5052, Offset: 0x65e8
// Size: 0x37a
function add_spawn_function(kvp, var_964c77e1, ...) {
    /#
        assert(isdefined(var_964c77e1));
    #/
    a_s_wave_managers = self wave_manager_sys::function_63e08195(kvp, 0);
    if (a_s_wave_managers.size) {
        foreach (s_wave_manager in a_s_wave_managers) {
            var_e8332bc1 = new class_8e39177();
            var_e8332bc1.var_964c77e1 = var_964c77e1;
            var_e8332bc1.a_params = vararg;
            if (isdefined(s_wave_manager.var_dcd6c23)) {
                if (!isdefined(s_wave_manager.var_dcd6c23.var_23802722)) {
                    s_wave_manager.var_dcd6c23.var_23802722 = [];
                } else if (!isarray(s_wave_manager.var_dcd6c23.var_23802722)) {
                    s_wave_manager.var_dcd6c23.var_23802722 = array(s_wave_manager.var_dcd6c23.var_23802722);
                }
                if (!isinarray(s_wave_manager.var_dcd6c23.var_23802722, var_e8332bc1)) {
                    s_wave_manager.var_dcd6c23.var_23802722[s_wave_manager.var_dcd6c23.var_23802722.size] = var_e8332bc1;
                }
                continue;
            }
            if (!isdefined(s_wave_manager.var_a69f424f)) {
                s_wave_manager.var_a69f424f = [];
            } else if (!isarray(s_wave_manager.var_a69f424f)) {
                s_wave_manager.var_a69f424f = array(s_wave_manager.var_a69f424f);
            }
            if (!isinarray(s_wave_manager.var_a69f424f, var_e8332bc1)) {
                s_wave_manager.var_a69f424f[s_wave_manager.var_a69f424f.size] = var_e8332bc1;
            }
        }
        return;
    }
    if (self wave_manager_sys::function_e0bfee59()) {
        var_e8332bc1 = new class_8e39177();
        var_e8332bc1.var_964c77e1 = var_964c77e1;
        var_e8332bc1.a_params = vararg;
        if (!isdefined(self.var_23802722)) {
            self.var_23802722 = [];
        } else if (!isarray(self.var_23802722)) {
            self.var_23802722 = array(self.var_23802722);
        }
        if (!isinarray(self.var_23802722, var_e8332bc1)) {
            self.var_23802722[self.var_23802722.size] = var_e8332bc1;
        }
    }
}

// Namespace wave_manager/wave_manager
// Params 2, eflags: 0x0
// Checksum 0x89b7330f, Offset: 0x6970
// Size: 0x2ee
function remove_spawn_function(kvp, var_964c77e1) {
    /#
        assert(isdefined(var_964c77e1));
    #/
    a_s_wave_managers = self wave_manager_sys::function_63e08195(kvp, 0);
    if (a_s_wave_managers.size) {
        foreach (s_wave_manager in a_s_wave_managers) {
            if (isdefined(s_wave_manager.var_dcd6c23)) {
                var_dcd6c23 = s_wave_manager.var_dcd6c23;
                foreach (var_e8332bc1 in var_dcd6c23.var_23802722) {
                    if (var_e8332bc1.var_964c77e1 === var_964c77e1) {
                        var_dcd6c23.var_23802722 = array::exclude(var_dcd6c23.var_23802722, var_e8332bc1);
                    }
                }
            }
            if (isdefined(s_wave_manager.var_a69f424f)) {
                foreach (var_e8332bc1 in s_wave_manager.var_a69f424f) {
                    if (var_e8332bc1.var_964c77e1 === var_964c77e1) {
                        s_wave_manager.var_a69f424f = array::exclude(s_wave_manager.var_a69f424f, var_e8332bc1);
                        if (!s_wave_manager.var_a69f424f.size) {
                            s_wave_manager.var_a69f424f = undefined;
                        }
                    }
                }
            }
        }
        return;
    }
    if (self wave_manager_sys::function_e0bfee59()) {
        foreach (var_e8332bc1 in self.var_23802722) {
            if (var_e8332bc1.var_964c77e1 === var_964c77e1) {
                self.var_23802722 = array::exclude(self.var_23802722, var_e8332bc1);
            }
        }
    }
}

// Namespace wave_manager/wave_manager
// Params 2, eflags: 0x1 linked
// Checksum 0xf1720192, Offset: 0x6c68
// Size: 0xc0
function stop(kvp, var_4bb2faf8 = 0) {
    var_fed53aae = self wave_manager_sys::function_32b947df(kvp);
    foreach (var_dcd6c23 in var_fed53aae) {
        wave_manager_sys::stop_internal(var_dcd6c23, var_4bb2faf8);
    }
}

// Namespace wave_manager/wave_manager
// Params 2, eflags: 0x0
// Checksum 0x26287926, Offset: 0x6d30
// Size: 0xc0
function pause(kvp, var_4bb2faf8 = 0) {
    var_fed53aae = self wave_manager_sys::function_32b947df(kvp);
    foreach (var_dcd6c23 in var_fed53aae) {
        var_dcd6c23 flag::set("paused");
    }
}

// Namespace wave_manager/wave_manager
// Params 2, eflags: 0x0
// Checksum 0xe1ae538f, Offset: 0x6df8
// Size: 0xc0
function resume(kvp, var_4bb2faf8 = 0) {
    var_fed53aae = self wave_manager_sys::function_32b947df(kvp);
    foreach (var_dcd6c23 in var_fed53aae) {
        var_dcd6c23 flag::clear("paused");
    }
}

