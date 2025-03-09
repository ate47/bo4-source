#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace zm_weap_ray_gun;

// Namespace zm_weap_ray_gun/zm_weap_ray_gun
// Params 0, eflags: 0x2
// Checksum 0xc6a3a17b, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ray_gun", &__init__, undefined, undefined);
}

// Namespace zm_weap_ray_gun/zm_weap_ray_gun
// Params 0, eflags: 0x0
// Checksum 0xfcc94070, Offset: 0xf8
// Size: 0x244
function __init__() {
    level.var_b21bed72 = [];
    level.var_b21bed72[#"hash_5a4246956faa187e"] = getweapon(#"hash_5a4246956faa187e");
    level.var_b21bed72[#"hash_43989578a576ae26"] = getweapon(#"hash_43989578a576ae26");
    level.var_b21bed72[#"hash_43b39078a58d6d5f"] = getweapon(#"hash_43b39078a58d6d5f");
    arrayremovevalue(level.var_b21bed72, getweapon(#"none"), 1);
    zombie_utility::add_zombie_gib_weapon_callback(#"hash_5a4246956faa187e", &function_215146f5, &function_215146f5);
    zombie_utility::add_zombie_gib_weapon_callback(#"hash_43989578a576ae26", &function_215146f5, &function_215146f5);
    zombie_utility::add_zombie_gib_weapon_callback(#"hash_43b39078a58d6d5f", &function_215146f5, &function_215146f5);
    if (getdvarint(#"raygun_disintegrate", 0)) {
        callback::on_ai_killed(&on_ai_killed);
    }
    clientfield::register("actor", "raygun_disintegrate", 20000, 1, "counter");
}

// Namespace zm_weap_ray_gun/zm_weap_ray_gun
// Params 1, eflags: 0x0
// Checksum 0xea3afdf0, Offset: 0x348
// Size: 0x3c
function on_ai_killed(s_params) {
    if (is_ray_gun(s_params.weapon)) {
        self thread ai_disintegrate();
    }
}

// Namespace zm_weap_ray_gun/zm_weap_ray_gun
// Params 0, eflags: 0x0
// Checksum 0xea5513bc, Offset: 0x390
// Size: 0x5c
function ai_disintegrate() {
    self endon(#"death");
    self clientfield::increment("raygun_disintegrate", 1);
    wait 1;
    self delete();
}

// Namespace zm_weap_ray_gun/zm_weap_ray_gun
// Params 1, eflags: 0x0
// Checksum 0x7d49bcc3, Offset: 0x3f8
// Size: 0x36
function is_ray_gun(w_weapon) {
    if (isdefined(w_weapon)) {
        return isinarray(level.var_b21bed72, w_weapon);
    }
    return 0;
}

// Namespace zm_weap_ray_gun/zm_weap_ray_gun
// Params 1, eflags: 0x0
// Checksum 0x94d382fc, Offset: 0x438
// Size: 0xe
function function_215146f5(damage_percent) {
    return false;
}

