#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm\zm_hms_util.gsc;

#namespace namespace_35b7c648;

// Namespace namespace_35b7c648/namespace_35b7c648
// Params 0, eflags: 0x2
// Checksum 0xa6929804, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_15bfc847a7453be5", &init, undefined, undefined);
}

// Namespace namespace_35b7c648/namespace_35b7c648
// Params 0, eflags: 0x1 linked
// Checksum 0x27a52185, Offset: 0x118
// Size: 0x84
function init() {
    zm_sq::register(#"hash_32f778a60edd89af", #"step_1", #"hash_703e7ca00bf77f59", &function_5d6ee8e9, &function_65937bee);
    zm_sq::start(#"hash_32f778a60edd89af");
}

// Namespace namespace_35b7c648/namespace_35b7c648
// Params 1, eflags: 0x1 linked
// Checksum 0x59deacd3, Offset: 0x1a8
// Size: 0x1c4
function function_5d6ee8e9(var_5ea5c94d) {
    var_21569a93 = getent("morgue_stand_trig", "targetname");
    s_lookat = struct::get("morgue_lookat");
    var_ca7809eb = 20000;
    var_87706f3b = 0;
    if (!var_5ea5c94d) {
        while (!var_87706f3b) {
            s_result = var_21569a93 trigger::wait_till();
            e_player = s_result.who;
            var_2c116c59 = gettime();
            var_ca7809eb = 20000;
            while (isdefined(e_player) && !var_87706f3b && e_player istouching(var_21569a93)) {
                if (e_player util::is_looking_at(s_lookat.origin, 0.99)) {
                    var_ca7809eb -= gettime() - var_2c116c59;
                    var_2c116c59 = gettime();
                    if (var_ca7809eb <= 0) {
                        /#
                            iprintlnbold("<dev string:x38>");
                        #/
                        var_87706f3b = 1;
                        level thread function_e0254b72();
                    }
                } else {
                    var_ca7809eb = 20000;
                }
                waitframe(1);
            }
        }
        return;
    }
    var_21569a93 delete();
}

// Namespace namespace_35b7c648/namespace_35b7c648
// Params 2, eflags: 0x1 linked
// Checksum 0xd3143e13, Offset: 0x378
// Size: 0x64
function function_65937bee(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
    }
    var_21569a93 = getent("morgue_stand_trig", "targetname");
    var_21569a93 delete();
}

// Namespace namespace_35b7c648/namespace_35b7c648
// Params 0, eflags: 0x1 linked
// Checksum 0x4ae18d84, Offset: 0x3e8
// Size: 0xa4
function function_e0254b72() {
    var_8c07f4aa = array(#"hash_3da8a375da1a29c2", #"hash_4350c9d0e319afc3", #"hash_8cf7bf5d41063ec", #"hash_5b57476ff83609ad");
    var_25eaa205 = struct::get(#"morgue_audio");
    zm_hms_util::function_52c3fe8d(var_8c07f4aa, var_25eaa205.origin);
}

