// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_maptable.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_weap_bowie;

// Namespace zm_weap_bowie/zm_weap_bowie
// Params 0, eflags: 0x2
// Checksum 0xf122812, Offset: 0x130
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"bowie_knife", &__init__, &__main__, undefined);
}

// Namespace zm_weap_bowie/zm_weap_bowie
// Params 0, eflags: 0x5 linked
// Checksum 0xe113d4e9, Offset: 0x180
// Size: 0x24
function private __init__() {
    zm_loadout::register_melee_weapon_for_level(#"bowie_knife");
}

// Namespace zm_weap_bowie/zm_weap_bowie
// Params 0, eflags: 0x5 linked
// Checksum 0x627fbf5f, Offset: 0x1b0
// Size: 0x19e
function private __main__() {
    if (isdefined(level.bowie_cost)) {
        cost = level.bowie_cost;
    } else {
        cost = 3000;
    }
    if (function_8b1a219a()) {
        prompt = #"hash_2791ecebb85142c4";
    } else {
        prompt = #"hash_60606b68e93a29c8";
    }
    level.var_8e4168e9 = "bowie_knife";
    level.var_63af3e00 = "bowie_flourish";
    var_57858dd5 = "zombie_fists_bowie";
    if (zm_maptable::get_story() == 1) {
        level.var_8e4168e9 = "bowie_knife_story_1";
        level.var_63af3e00 = "bowie_flourish_story_1";
        var_57858dd5 = "zombie_fists_bowie_story_1";
    }
    zm_melee_weapon::init(level.var_8e4168e9, level.var_63af3e00, cost, "bowie_upgrade", prompt, "bowie", undefined);
    zm_melee_weapon::set_fallback_weapon(level.var_8e4168e9, var_57858dd5);
    level.w_bowie_knife = getweapon(hash(level.var_8e4168e9));
}

// Namespace zm_weap_bowie/zm_weap_bowie
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x358
// Size: 0x4
function init() {
    
}

