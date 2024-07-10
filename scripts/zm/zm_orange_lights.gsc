#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_orange_lights;

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x2
// Checksum 0x2ec65e46, Offset: 0x190
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_orange_lights", &__init__, &__main__, undefined);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0x9532a65, Offset: 0x1e0
// Size: 0x46
function __init__() {
    init_clientfields();
    level thread function_3d4e24ea();
    level.var_13a6af33 = &function_35b30784;
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0x8036cbf6, Offset: 0x230
// Size: 0x7c
function __main__() {
    level thread ship_lights_control();
    level thread lighthouse_lights_control();
    level thread facility_lights_control();
    level thread infusion_lights_hot();
    level thread infusion_lights_cold();
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0x8efc9850, Offset: 0x2b8
// Size: 0x124
function init_clientfields() {
    clientfield::register("world", "ship_lights_control", 24000, 1, "int");
    clientfield::register("world", "lighthouse_lights_control", 24000, 1, "int");
    clientfield::register("world", "facility_lights_control", 24000, 1, "int");
    clientfield::register("world", "infusion_lights_hot", 24000, 1, "int");
    clientfield::register("world", "infusion_lights_cold", 24000, 1, "int");
    clientfield::register("world", "orange_deactivate_radiant_exploders_client", 24000, 1, "counter");
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0x49667eab, Offset: 0x3e8
// Size: 0x32
function function_3d4e24ea() {
    level._effect[#"hash_723a7c4a495d1008"] = #"hash_17207501ee73a374";
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0xfec67597, Offset: 0x428
// Size: 0x3c
function ship_lights_control() {
    level waittill(#"power_on2");
    level clientfield::set("ship_lights_control", 1);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0xf2134b0e, Offset: 0x470
// Size: 0x3c
function lighthouse_lights_control() {
    level waittill(#"power_on1");
    level clientfield::set("lighthouse_lights_control", 1);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0x120a031a, Offset: 0x4b8
// Size: 0x3c
function facility_lights_control() {
    level waittill(#"power_on3");
    level clientfield::set("facility_lights_control", 1);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0x4e59d0dd, Offset: 0x500
// Size: 0x84
function infusion_lights_hot() {
    level flag::wait_till(#"hash_57d2cbf7d6c2035a");
    level clientfield::set("infusion_lights_hot", 1);
    level flag::wait_till_clear(#"hash_57d2cbf7d6c2035a");
    level clientfield::set("infusion_lights_hot", 0);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0x628fc982, Offset: 0x590
// Size: 0x84
function infusion_lights_cold() {
    level flag::wait_till(#"hash_238e5c8b416f855");
    level clientfield::set("infusion_lights_cold", 1);
    level flag::wait_till_clear(#"hash_238e5c8b416f855");
    level clientfield::set("infusion_lights_cold", 0);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0xf9779f80, Offset: 0x620
// Size: 0x11c
function function_e9f6e0f7() {
    e_sam = getent("sam", "targetname");
    s_lgt_spawner = struct::get("s_lgt_spawner", "targetname");
    e_sam.tag = util::spawn_model("tag_origin", s_lgt_spawner.origin);
    e_sam.tag.angles = s_lgt_spawner.angles;
    level.registerglass_railing_kickedleader = level._effect[#"hash_723a7c4a495d1008"];
    e_sam.var_82acd734 = playfxontag(level.registerglass_railing_kickedleader, e_sam.tag, "tag_origin");
    e_sam.var_82acd734 linkto(e_sam);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 1, eflags: 0x5 linked
// Checksum 0x79cd4d52, Offset: 0x748
// Size: 0x4c
function private function_35b30784(string) {
    if (!isdefined(level.var_7b4e19aa)) {
        level.var_7b4e19aa = [];
    }
    array::add(level.var_7b4e19aa, string, 0);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0xddb108e9, Offset: 0x7a0
// Size: 0xc4
function function_b1c6d4f2() {
    if (isdefined(level.var_7b4e19aa)) {
        foreach (exploder_id in level.var_7b4e19aa) {
            exploder::kill_exploder(exploder_id);
            wait(0.3);
        }
        level.var_7b4e19aa = undefined;
    }
    level clientfield::increment("orange_deactivate_radiant_exploders_client", 1);
}

