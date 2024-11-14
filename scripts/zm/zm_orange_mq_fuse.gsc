#using scripts\zm\zm_orange_pablo;
#using scripts\zm\zm_orange_util;
#using scripts\zm\zm_hms_util;
#using script_ab862743b3070a;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_zonemgr;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_audio;
#using script_3e5ec44cfab7a201;
#using scripts\zm_common\zm_sq;
#using scripts\core_common\animation_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\struct;

#namespace zm_orange_mq_fuse;

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x843da4d5, Offset: 0x3b0
// Size: 0x144
function preload() {
    namespace_617a54f4::function_d8383812(#"little_bird_1", 24000, "little_bird_1", &is_soul_capture, &soul_captured, 1);
    namespace_617a54f4::function_d8383812(#"little_bird_2", 24000, "little_bird_2", &is_soul_capture, &soul_captured, 1);
    namespace_617a54f4::function_d8383812(#"little_bird_3", 24000, "little_bird_3", &is_soul_capture, &soul_captured, 1);
    clientfield::register("scriptmover", "elemental_shard_glow", 24000, 1, "int");
    level flag::init(#"hash_4923165da58bf5cf");
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x723e7a27, Offset: 0x500
// Size: 0x4c
function main() {
    level init_transformers();
    level function_6bd2a719();
    level init_fuse();
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x85f1d13f, Offset: 0x558
// Size: 0x84
function init_fuse() {
    level.s_fuse = struct::get("tin_foil", "targetname");
    level.s_fuse.e_model = getent(level.s_fuse.target, "targetname");
    level.s_fuse.e_model hide();
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0xc8aa132a, Offset: 0x5e8
// Size: 0x86
function init_transformers() {
    level.var_d02bca0 = 2;
    level flag::init(#"hash_5630cdbbb58f1b1e");
    level.var_9d5b2598 = getent("big_bird_wing_n", "targetname");
    level.var_e48733ef = getent("big_bird_wing_s", "targetname");
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x6056d0d4, Offset: 0x678
// Size: 0x174
function function_6bd2a719() {
    level.var_6b43507a = 3;
    a_s_generators = struct::get_array("little_bird", "targetname");
    for (i = 0; i < a_s_generators.size; i++) {
        a_s_generators[i].var_7944be4a = 0;
        a_s_generators[i].var_b9989e12 = hash(a_s_generators[i].script_noteworthy);
        a_s_generators[i].e_vol = getent(a_s_generators[i].target, "targetname");
    }
    level.a_s_generators = a_s_generators;
    e_shard = getent("chicken_nugget", "targetname");
    e_shard playloopsound(#"hash_52058ae478647502");
    e_shard setscale(0.5);
    e_shard clientfield::set("elemental_shard_glow", 1);
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 1, eflags: 0x1 linked
// Checksum 0x9fee2ec5, Offset: 0x7f8
// Size: 0x1ac
function function_742dfdb5(var_a276c861) {
    if (!var_a276c861) {
        level function_95dff91b();
        level.s_fuse.e_model show();
        if (level.var_98138d6b > 1) {
            wait 2;
            level.var_1c53964e zm_hms_util::function_6a0d675d("vox_fuse_lighthouse", 0, 0, 1);
        }
        level.var_9d5b2598 setcandamage(1);
        level.var_9d5b2598 val::set("mq_fuse_step", "allowDeath", 0);
        level.var_9d5b2598 thread function_d6a4619a();
        level.var_e48733ef setcandamage(1);
        level.var_e48733ef val::set("mq_fuse_step", "allowDeath", 0);
        level.var_e48733ef thread function_d6a4619a();
        while (level.var_d02bca0 > 0) {
            wait 1;
        }
        if (level.var_98138d6b > 1) {
            level.var_1c53964e zm_hms_util::function_6a0d675d("vox_fuse_partial_charge", 0, 0, 1);
        }
    }
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0xe69d2ad4, Offset: 0x9b0
// Size: 0x74
function function_95dff91b() {
    s_unitrigger = level.s_fuse zm_unitrigger::create("", 96);
    level.s_fuse function_afa2f621();
    level.s_fuse zm_unitrigger::unregister_unitrigger(s_unitrigger);
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x168a563e, Offset: 0xa30
// Size: 0x54
function function_afa2f621() {
    s_activation = self waittill(#"trigger_activated");
    playsoundatposition(#"hash_fdb4c0b271c6e36", self.origin);
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0xafd8db5c, Offset: 0xa90
// Size: 0x74
function setup_door_interact() {
    s_unitrigger = level.s_fuse zm_unitrigger::create("", 96);
    level.s_fuse door_think();
    level.s_fuse zm_unitrigger::unregister_unitrigger(s_unitrigger);
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x85d789c7, Offset: 0xb10
// Size: 0x7c
function door_think() {
    s_activation = self waittill(#"trigger_activated");
    level function_206702d8();
    if (level.var_98138d6b > 1) {
        level.var_1c53964e thread zm_hms_util::function_6a0d675d("vox_shard_reveal", 0, 0, 1);
    }
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x646e5964, Offset: 0xb98
// Size: 0xfc
function function_206702d8() {
    level flag::set(#"hash_778a2b8282d704f");
    e_door = getent("grover", "targetname");
    playsoundatposition("zmb_lighthouse_double_door", (-472, 1172, 315));
    e_door rotateyaw(148, 0.5, 0.1, 0.1);
    var_cee2ebbb = getent(e_door.target, "targetname");
    if (isdefined(var_cee2ebbb)) {
        var_cee2ebbb delete();
    }
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x28f3717d, Offset: 0xca0
// Size: 0x84
function function_16386d70() {
    e_shard = getent("chicken_nugget", "targetname");
    s_unitrigger = e_shard zm_unitrigger::create("", 96);
    e_shard shard_think();
    e_shard zm_unitrigger::unregister_unitrigger(s_unitrigger);
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x9b6eb719, Offset: 0xd30
// Size: 0x8c
function shard_think() {
    s_activation = self waittill(#"trigger_activated");
    playsoundatposition(#"hash_2e9ec816b70bb70e", self.origin);
    self delete();
    level shard_vo(s_activation.e_who);
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 1, eflags: 0x1 linked
// Checksum 0xf7a0805b, Offset: 0xdc8
// Size: 0x34
function shard_vo(e_who) {
    e_who zm_orange_util::function_51b752a9("vox_shard_place", -1, 1, 0);
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0xbee2765f, Offset: 0xe08
// Size: 0x178
function function_d6a4619a() {
    for (b_hidden = 0; !b_hidden; b_hidden = 1) {
        s_result = self waittill(#"damage");
        if (s_result.weapon.name === #"ww_tesla_sniper_t8" || s_result.weapon.name === #"ww_tesla_sniper_upgraded_t8") {
            if (self.targetname == "big_bird_wing_n") {
                exploder::exploder("fxexp_electric_arcs_fx_to_lighthouse_left");
            } else {
                exploder::exploder("fxexp_electric_arcs_fx_to_lighthouse_right");
            }
            self playsound(#"hash_47433d730d8027ed");
            e_target = getent(self.target, "targetname");
            level.var_d02bca0 -= 1;
            e_target hide();
            self setcandamage(0);
        }
    }
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 2, eflags: 0x1 linked
// Checksum 0x3fd11495, Offset: 0xf88
// Size: 0x134
function function_9e34b0d4(var_a276c861, var_19e802fa) {
    if (var_a276c861 || var_19e802fa) {
        exploder::stop_exploder("fxexp_electric_arcs_fx_to_lighthouse_left");
        exploder::stop_exploder("fxexp_electric_arcs_fx_to_lighthouse_right");
        level.var_9d5b2598 setcandamage(0);
        level.var_9d5b2598 hide();
        level.var_e48733ef setcandamage(0);
        level.var_e48733ef hide();
        level.var_d02bca0 = 0;
        level.s_fuse.e_model show();
        return;
    }
    wait 3;
    exploder::stop_exploder("fxexp_electric_arcs_fx_to_lighthouse_left");
    exploder::stop_exploder("fxexp_electric_arcs_fx_to_lighthouse_right");
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 1, eflags: 0x1 linked
// Checksum 0xf1097fd4, Offset: 0x10c8
// Size: 0x184
function function_c723e684(var_a276c861) {
    if (!var_a276c861) {
        foreach (var_b4602d24 in level.a_s_generators) {
            level thread namespace_617a54f4::function_3f808d3d(var_b4602d24.var_b9989e12);
        }
        while (level.var_6b43507a > 0) {
            wait 1;
        }
        if (level.var_98138d6b > 1) {
            level.var_1c53964e thread zm_hms_util::function_6a0d675d("vox_fuse_complete_charge", 0, 0, 1);
        }
        wait 3;
        level exploder::stop_exploder("fxexp_electric_arcs_fx_to_lighthouse_base_1");
        level exploder::stop_exploder("fxexp_electric_arcs_fx_to_lighthouse_base_2");
        level exploder::stop_exploder("fxexp_electric_arcs_fx_to_lighthouse_base_3");
        level setup_door_interact();
        level function_16386d70();
    }
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 2, eflags: 0x1 linked
// Checksum 0xb07d2c04, Offset: 0x1258
// Size: 0xe0
function is_soul_capture(var_88206a50, ent) {
    if (isdefined(ent) && ent.var_9fde8624 === #"zombie_electric") {
        b_killed_by_player = isdefined(ent.attacker) && isplayer(ent.attacker) || isdefined(ent.damageinflictor) && isplayer(ent.damageinflictor);
        var_e93788f1 = var_88206a50.e_vol;
        return (b_killed_by_player && ent istouching(var_e93788f1));
    }
    return false;
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 2, eflags: 0x1 linked
// Checksum 0xb3ed4b54, Offset: 0x1340
// Size: 0x94
function soul_captured(var_f0e6c7a2, ent) {
    n_souls_required = 1;
    var_f0e6c7a2.var_7944be4a++;
    /#
        if (level flag::get(#"soul_fill")) {
            var_f0e6c7a2.var_7944be4a = n_souls_required;
        }
    #/
    if (var_f0e6c7a2.var_7944be4a >= n_souls_required) {
        var_f0e6c7a2 function_a66f0de2();
    }
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x2e3959b7, Offset: 0x13e0
// Size: 0x116
function function_a66f0de2() {
    switch (self.script_noteworthy) {
    case #"little_bird_1":
        level exploder::exploder("fxexp_electric_arcs_fx_to_lighthouse_base_2");
        break;
    case #"little_bird_2":
        level exploder::exploder("fxexp_electric_arcs_fx_to_lighthouse_base_3");
        break;
    case #"little_bird_3":
        level exploder::exploder("fxexp_electric_arcs_fx_to_lighthouse_base_1");
        break;
    }
    namespace_617a54f4::function_2a94055d(self.var_b9989e12);
    playsoundatposition(#"hash_7cef2cb8d950a50", self.origin);
    level.var_6b43507a -= 1;
    self notify(#"hash_1f9b852104ab2c13");
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 2, eflags: 0x1 linked
// Checksum 0x3a6e8032, Offset: 0x1500
// Size: 0x7c
function function_3d5a45fb(var_a276c861, var_19e802fa) {
    if (var_a276c861 || var_19e802fa) {
        level.var_6b43507a = 0;
        level function_206702d8();
        getent("chicken_nugget", "targetname") delete();
    }
}

