#using scripts\core_common\system_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\clientfield_shared;

#namespace zm_weap_snowball;

// Namespace zm_weap_snowball/zm_weap_snowball
// Params 0, eflags: 0x2
// Checksum 0x49fd6603, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"snowball", &__init__, undefined, undefined);
}

// Namespace zm_weap_snowball/zm_weap_snowball
// Params 0, eflags: 0x1 linked
// Checksum 0x785fd05c, Offset: 0x118
// Size: 0xb4
function __init__() {
    clientfield::register("toplayer", "" + #"hash_78aa1dc141a3e27", 24000, 1, "int", &function_25101093, 0, 0);
    clientfield::register("toplayer", "" + #"hash_2fafddfa9f85b8aa", 24000, 1, "int", &function_43d8c5f8, 0, 0);
}

// Namespace zm_weap_snowball/zm_weap_snowball
// Params 7, eflags: 0x1 linked
// Checksum 0x62ba6596, Offset: 0x1d8
// Size: 0xa4
function function_25101093(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self postfx::stoppostfxbundle("pstfx_wz_snowball_hit");
        self postfx::playpostfxbundle("pstfx_wz_snowball_hit");
        return;
    }
    self postfx::exitpostfxbundle("pstfx_wz_snowball_hit");
}

// Namespace zm_weap_snowball/zm_weap_snowball
// Params 7, eflags: 0x1 linked
// Checksum 0xb20ce94f, Offset: 0x288
// Size: 0xa4
function function_43d8c5f8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self postfx::stoppostfxbundle("pstfx_wz_snowball_hit_yellow");
        self postfx::playpostfxbundle("pstfx_wz_snowball_hit_yellow");
        return;
    }
    self postfx::exitpostfxbundle("pstfx_wz_snowball_hit_yellow");
}

