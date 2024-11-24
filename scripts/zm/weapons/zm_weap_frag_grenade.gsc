#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_powerups;

#namespace frag_grenade;

// Namespace frag_grenade/zm_weap_frag_grenade
// Params 0, eflags: 0x2
// Checksum 0xe4ab97a5, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"frag_grenade", &__init__, undefined, undefined);
}

// Namespace frag_grenade/zm_weap_frag_grenade
// Params 0, eflags: 0x1 linked
// Checksum 0xc8c5dfda, Offset: 0xf8
// Size: 0x64
function __init__() {
    zm::function_84d343d(#"eq_frag_grenade", &function_719b774a);
    zm::function_84d343d(#"eq_frag_grenade_extra", &function_719b774a);
}

// Namespace frag_grenade/zm_weap_frag_grenade
// Params 12, eflags: 0x1 linked
// Checksum 0xfc89659c, Offset: 0x168
// Size: 0xea
function function_719b774a(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (meansofdeath === "MOD_IMPACT") {
        return 0;
    }
    var_b1c1c5cf = zm_equipment::function_7d948481(0.1, 0.25, 1, 1);
    var_5d7b4163 = zm_equipment::function_379f6b5d(damage, var_b1c1c5cf, 1, 4, 40);
    return var_5d7b4163;
}

