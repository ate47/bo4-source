#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;

#namespace zm_orange_ee_misc;

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x1 linked
// Checksum 0xdd20af3f, Offset: 0xc0
// Size: 0x2c
function preload() {
    init_clientfields();
    level thread pareidolia_ee();
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0xf8
// Size: 0x4
function main() {
    
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x1 linked
// Checksum 0x31894aa6, Offset: 0x108
// Size: 0xb4
function init_clientfields() {
    clientfield::register("toplayer", "" + #"hash_12114abc7407913b", 24000, 1, "counter", &function_30ed45c9, 0, 0);
    clientfield::register("toplayer", "" + #"hash_5e38e846ce88405b", 24000, 1, "counter", &function_48a634b7, 0, 0);
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 7, eflags: 0x1 linked
// Checksum 0x8f529cf6, Offset: 0x1c8
// Size: 0x8c
function function_30ed45c9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self thread postfx::playpostfxbundle(#"hash_34d554b44dfcb81d");
        playsound(localclientnum, #"hash_750bc40787e0e29f", (0, 0, 0));
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 7, eflags: 0x1 linked
// Checksum 0xd7cfa717, Offset: 0x260
// Size: 0x8c
function function_48a634b7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self thread postfx::playpostfxbundle(#"hash_34d551b44dfcb304");
        playsound(localclientnum, #"hash_750bc50787e0e452", (0, 0, 0));
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x1 linked
// Checksum 0x5f6e41f0, Offset: 0x2f8
// Size: 0x8c
function pareidolia_ee() {
    t_pareidolia = getent(0, "t_pareidolia", "targetname");
    waitresult = t_pareidolia waittill(#"trigger");
    playsound(0, #"mus_pareidolia", (-7053, -24906, 222));
}

