#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;

#namespace zm_orange_pap;

// Namespace zm_orange_pap/zm_orange_pap
// Params 0, eflags: 0x0
// Checksum 0x10d5a108, Offset: 0x138
// Size: 0x72
function init() {
    init_clientfields();
    level._effect[#"hash_604a40ef1ed899a4"] = #"hash_7d36c353ea2640ad";
    level._effect[#"hash_74f5897234e8d579"] = #"hash_59c49f21e6675534";
}

// Namespace zm_orange_pap/zm_orange_pap
// Params 0, eflags: 0x0
// Checksum 0x600410d, Offset: 0x1b8
// Size: 0x94
function init_clientfields() {
    clientfield::register("world", "zm_orange_extinguish_fire", 24000, 2, "counter", &function_f65638a4, 0, 0);
    clientfield::register("scriptmover", "zm_orange_pap_rock_glow", 24000, 1, "int", &function_50758ed4, 0, 0);
}

// Namespace zm_orange_pap/zm_orange_pap
// Params 7, eflags: 0x0
// Checksum 0x49ad9cb0, Offset: 0x258
// Size: 0x154
function function_f65638a4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        s_fx = struct::get("fire_extinguisher_l_fx_struct", "targetname");
        playfx(localclientnum, level._effect[#"hash_604a40ef1ed899a4"], s_fx.origin, anglestoforward(s_fx.angles));
        return;
    }
    if (newval == 2) {
        s_fx = struct::get("fire_extinguisher_r_fx_struct", "targetname");
        playfx(localclientnum, level._effect[#"hash_604a40ef1ed899a4"], s_fx.origin, anglestoforward(s_fx.angles));
    }
}

// Namespace zm_orange_pap/zm_orange_pap
// Params 7, eflags: 0x0
// Checksum 0x988730e9, Offset: 0x3b8
// Size: 0x74
function function_50758ed4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_74f5897234e8d579"], self, "tag_origin");
}

