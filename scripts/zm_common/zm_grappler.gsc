// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_grappler;

// Namespace zm_grappler/zm_grappler
// Params 0, eflags: 0x2
// Checksum 0xd3bed0d4, Offset: 0x120
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_grappler", &__init__, &__main__, undefined);
}

// Namespace zm_grappler/zm_grappler
// Params 0, eflags: 0x1 linked
// Checksum 0x5fda0865, Offset: 0x170
// Size: 0xcc
function __init__() {
    clientfield::register("scriptmover", "grappler_beam_source", 1, getminbitcountfornum(5), "int");
    clientfield::register("scriptmover", "grappler_beam_target", 1, getminbitcountfornum(5), "int");
    level.grapple_ids = [];
    for (id = 1; id < 5; id++) {
        level.grapple_ids[id] = 0;
    }
}

// Namespace zm_grappler/zm_grappler
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x248
// Size: 0x4
function __main__() {
    
}

// Namespace zm_grappler/zm_grappler
// Params 0, eflags: 0x5 linked
// Checksum 0x5caca2a8, Offset: 0x258
// Size: 0x92
function private function_5f5a3405() {
    foreach (key, value in level.grapple_ids) {
        if (value === 0) {
            level.grapple_ids[key] = 1;
            return key;
        }
    }
    return undefined;
}

// Namespace zm_grappler/zm_grappler
// Params 0, eflags: 0x1 linked
// Checksum 0x80aababe, Offset: 0x2f8
// Size: 0x7c
function function_56813755() {
    foreach (value in level.grapple_ids) {
        if (value === 0) {
            return false;
        }
    }
    return true;
}

// Namespace zm_grappler/zm_grappler
// Params 1, eflags: 0x5 linked
// Checksum 0xd0cb1186, Offset: 0x380
// Size: 0x62
function private function_2772f623(id) {
    assert(isdefined(level.grapple_ids[id]) && level.grapple_ids[id] === 1);
    level.grapple_ids[id] = 0;
}

// Namespace zm_grappler/zm_grappler
// Params 4, eflags: 0x0
// Checksum 0xc0cf91a7, Offset: 0x3f0
// Size: 0x3ac
function start_grapple(prone_2_run_roll, e_grapplee, n_type, n_speed = 1800) {
    assert(n_type == 2);
    e_source = create_mover(prone_2_run_roll function_f21c3519(), prone_2_run_roll.angles);
    e_beamend = create_mover(prone_2_run_roll function_f21c3519(), prone_2_run_roll.angles * -1);
    thread function_30a5f5c1(e_source, e_beamend);
    if (isdefined(e_beamend)) {
        e_grapplee function_a60cb756(1, 1);
        util::wait_network_frame();
        n_time = function_b9937e84(prone_2_run_roll, e_grapplee, n_speed);
        e_beamend.origin = prone_2_run_roll function_f21c3519();
        var_5f04bf66 = e_grapplee function_f21c3519();
        e_beamend playsound(#"zmb_grapple_start");
        e_beamend moveto(var_5f04bf66, n_time);
        e_beamend waittill(#"movedone");
        var_7fdf7771 = var_5f04bf66 - e_grapplee.origin;
        e_beamend.origin = e_grapplee.origin;
        if (isplayer(e_grapplee)) {
            e_grapplee playerlinkto(e_beamend, "tag_origin");
        } else {
            e_grapplee linkto(e_beamend);
        }
        e_grapplee playsound(#"zmb_grapple_grab");
        var_b7f19309 = prone_2_run_roll function_f21c3519() - var_7fdf7771;
        e_beamend moveto(var_b7f19309, n_time);
        e_beamend playsound(#"zmb_grapple_pull");
        e_beamend waittill(#"movedone");
        function_c43e7cab();
        e_beamend clientfield::set("grappler_beam_target", 0);
        e_grapplee unlink();
        e_grapplee function_a60cb756(0, 1);
        util::wait_network_frame();
        destroy_mover(e_beamend);
        destroy_mover(e_source);
    }
}

// Namespace zm_grappler/zm_grappler
// Params 0, eflags: 0x1 linked
// Checksum 0xe092d991, Offset: 0x7a8
// Size: 0x2e
function function_c43e7cab() {
    while (isdefined(level.var_acec7a44) && level.var_acec7a44) {
        waitframe(1);
    }
}

// Namespace zm_grappler/zm_grappler
// Params 3, eflags: 0x5 linked
// Checksum 0x215d2ac8, Offset: 0x7e0
// Size: 0xbc
function private function_1b905efa(e_source, e_target, id) {
    if (isdefined(e_source) && isdefined(e_target)) {
        util::waittill_any_ents_two(e_source, "death", e_target, "death");
    } else if (isdefined(e_source)) {
        e_source waittill(#"death");
    } else if (isdefined(e_target)) {
        e_target waittill(#"death");
    }
    util::wait_network_frame();
    function_2772f623(id);
}

// Namespace zm_grappler/zm_grappler
// Params 2, eflags: 0x1 linked
// Checksum 0x77b4ff71, Offset: 0x8a8
// Size: 0xea
function function_30a5f5c1(e_source, e_target) {
    function_c43e7cab();
    level.var_acec7a44 = 1;
    grapple_id = function_5f5a3405();
    if (isdefined(e_source)) {
        e_source clientfield::set("grappler_beam_source", grapple_id);
    }
    util::wait_network_frame();
    if (isdefined(e_target)) {
        e_target clientfield::set("grappler_beam_target", grapple_id);
    }
    thread function_1b905efa(e_source, e_target, grapple_id);
    util::wait_network_frame();
    level.var_acec7a44 = 0;
}

// Namespace zm_grappler/zm_grappler
// Params 3, eflags: 0x5 linked
// Checksum 0x2057f273, Offset: 0x9a0
// Size: 0x68
function private function_b9937e84(e_from, e_to, n_speed) {
    n_distance = distance(e_from function_f21c3519(), e_to function_f21c3519());
    return n_distance / n_speed;
}

// Namespace zm_grappler/zm_grappler
// Params 2, eflags: 0x1 linked
// Checksum 0xdb6d3e90, Offset: 0xa10
// Size: 0x194
function function_a60cb756(var_b4666218, var_e9f8c8f3) {
    if (!isdefined(self)) {
        return;
    }
    if (var_b4666218 != (isdefined(self.var_564dec14) && self.var_564dec14)) {
        if (isdefined(var_b4666218) && var_b4666218) {
            self notify(#"hash_3219c34bb024ffb7");
        } else {
            self notify(#"hash_5d85f16cb4fd5a32");
        }
        self.var_564dec14 = var_b4666218;
        if (isplayer(self)) {
            self freezecontrols(var_b4666218);
            self setplayercollision(!var_b4666218);
            if (var_b4666218) {
                self val::set(#"zm_grappler", "ignoreme");
                if (isdefined(var_e9f8c8f3) && var_e9f8c8f3) {
                    self.var_d6723cbc = self enableinvulnerability();
                }
                return;
            }
            self val::reset(#"zm_grappler", "ignoreme");
            if (!(isdefined(self.var_d6723cbc) && self.var_d6723cbc) && isdefined(var_e9f8c8f3) && var_e9f8c8f3) {
                self disableinvulnerability();
            }
        }
    }
}

// Namespace zm_grappler/zm_grappler
// Params 0, eflags: 0x1 linked
// Checksum 0xac5e7ae0, Offset: 0xbb0
// Size: 0x42
function function_f21c3519() {
    if (isdefined(self.grapple_tag)) {
        v_origin = self gettagorigin(self.grapple_tag);
        return v_origin;
    }
    return self.origin;
}

// Namespace zm_grappler/zm_grappler
// Params 2, eflags: 0x1 linked
// Checksum 0x34fbb2b3, Offset: 0xc00
// Size: 0x52
function create_mover(v_origin, v_angles) {
    model = "tag_origin";
    e_ent = util::spawn_model(model, v_origin, v_angles);
    return e_ent;
}

// Namespace zm_grappler/zm_grappler
// Params 1, eflags: 0x1 linked
// Checksum 0x8eb65f1a, Offset: 0xc60
// Size: 0x2c
function destroy_mover(e_beamend) {
    if (isdefined(e_beamend)) {
        e_beamend delete();
    }
}

