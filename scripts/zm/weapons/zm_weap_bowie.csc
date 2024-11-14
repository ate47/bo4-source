#using scripts\zm_common\zm_maptable;
#using scripts\core_common\system_shared;

#namespace zm_weap_bowie;

// Namespace zm_weap_bowie/zm_weap_bowie
// Params 0, eflags: 0x2
// Checksum 0x54a035e9, Offset: 0xf8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"bowie_knife", &__init__, &__main__, undefined);
}

// Namespace zm_weap_bowie/zm_weap_bowie
// Params 0, eflags: 0x5 linked
// Checksum 0x80f724d1, Offset: 0x148
// Size: 0x4
function private __init__() {
    
}

// Namespace zm_weap_bowie/zm_weap_bowie
// Params 0, eflags: 0x5 linked
// Checksum 0xbfa561a4, Offset: 0x158
// Size: 0xc6
function private __main__() {
    level.var_8e4168e9 = "bowie_knife";
    level.var_63af3e00 = "bowie_flourish";
    var_57858dd5 = "zombie_fists_bowie";
    if (zm_maptable::get_story() == 1) {
        level.var_8e4168e9 = "bowie_knife_story_1";
        level.var_63af3e00 = "bowie_flourish_story_1";
        var_57858dd5 = "zombie_fists_bowie_story_1";
    }
    level.w_bowie_knife = getweapon(hash(level.var_8e4168e9));
}

