#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace zm_white_private_mannequin;

// Namespace zm_white_private_mannequin/zm_white_private_mannequin
// Params 0, eflags: 0x2
// Checksum 0x4a29c8f7, Offset: 0xc0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_white_private_mannequin", &__init__, &__main__, undefined);
}

// Namespace zm_white_private_mannequin/zm_white_private_mannequin
// Params 0, eflags: 0x0
// Checksum 0x488985fd, Offset: 0x110
// Size: 0x5c
function __init__() {
    clientfield::register("world", "" + #"hash_681de2aa531ffcd0", 20000, 1, "int", &function_a1ee0828, 0, 0);
}

// Namespace zm_white_private_mannequin/zm_white_private_mannequin
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x178
// Size: 0x4
function __main__() {
    
}

// Namespace zm_white_private_mannequin/zm_white_private_mannequin
// Params 7, eflags: 0x0
// Checksum 0xc41fb4c9, Offset: 0x188
// Size: 0x7c
function function_a1ee0828(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel("c_t8_zmb_dlc3_mannequin_male_damage_ally_ready_pose");
        return;
    }
    stopforcestreamingxmodel("c_t8_zmb_dlc3_mannequin_male_damage_ally_ready_pose");
}

