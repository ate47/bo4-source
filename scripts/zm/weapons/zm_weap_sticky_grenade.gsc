#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm;
#using scripts\core_common\system_shared;
#using scripts\core_common\struct;

#namespace sticky_grenade;

// Namespace sticky_grenade/zm_weap_sticky_grenade
// Params 0, eflags: 0x2
// Checksum 0x467ae17f, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"sticky_grenade", &__init__, undefined, undefined);
}

// Namespace sticky_grenade/zm_weap_sticky_grenade
// Params 0, eflags: 0x1 linked
// Checksum 0x9be6f731, Offset: 0xe0
// Size: 0x64
function __init__() {
    zm::function_84d343d(#"eq_acid_bomb", &function_140f2522);
    zm::function_84d343d(#"eq_acid_bomb_extra", &function_140f2522);
}

// Namespace sticky_grenade/zm_weap_sticky_grenade
// Params 12, eflags: 0x1 linked
// Checksum 0xa3c0004b, Offset: 0x150
// Size: 0xea
function function_140f2522(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (meansofdeath === "MOD_IMPACT") {
        return 0;
    }
    var_b1c1c5cf = zm_equipment::function_7d948481(0.1, 0.25, 1, 1);
    var_5d7b4163 = zm_equipment::function_379f6b5d(damage, var_b1c1c5cf, 1, 4, 40);
    return var_5d7b4163;
}

