#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_weapons;

#namespace nesting_doll_grenade;

// Namespace nesting_doll_grenade/zm_equip_nesting_doll_grenade
// Params 0, eflags: 0x2
// Checksum 0x174779b7, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"nesting_doll_grenade", &__init__, undefined, undefined);
}

// Namespace nesting_doll_grenade/zm_equip_nesting_doll_grenade
// Params 0, eflags: 0x0
// Checksum 0x99fd494a, Offset: 0x118
// Size: 0x32c
function __init__() {
    level.var_a3e665cc = getweapon(#"hash_166200a2e04510f4");
    level.var_7f6e8568 = getweapon(#"hash_3fec64a2af587850");
    level.var_cf62bc7a = getweapon(#"hash_1b92c0a29a45b07c");
    level.var_e724fe4e = getweapon(#"hash_a2556a2905fd952");
    level.a_w_nesting_doll_grenades = array(getweapon(#"eq_nesting_doll_grenade"), getweapon(#"eq_nesting_doll_grenade_niko"), getweapon(#"eq_nesting_doll_grenade_rich"), getweapon(#"eq_nesting_doll_grenade_takeo"));
    level.var_e027f904 = array(level.var_a3e665cc, level.var_7f6e8568, level.var_cf62bc7a, level.var_e724fe4e);
    callback::on_grenade_fired(&on_grenade_fired);
    zm_loadout::register_lethal_grenade_for_level(#"eq_nesting_doll_grenade");
    zm_loadout::register_lethal_grenade_for_level(#"eq_nesting_doll_grenade_niko");
    zm_loadout::register_lethal_grenade_for_level(#"eq_nesting_doll_grenade_rich");
    zm_loadout::register_lethal_grenade_for_level(#"eq_nesting_doll_grenade_takeo");
    zm::function_84d343d(#"eq_nesting_doll_grenade", &function_23cf8077);
    zm::function_84d343d(#"hash_166200a2e04510f4", &function_23cf8077);
    zm::function_84d343d(#"hash_3fec64a2af587850", &function_23cf8077);
    zm::function_84d343d(#"hash_1b92c0a29a45b07c", &function_23cf8077);
    zm::function_84d343d(#"hash_a2556a2905fd952", &function_23cf8077);
    level thread function_ba2049f5();
}

// Namespace nesting_doll_grenade/zm_equip_nesting_doll_grenade
// Params 0, eflags: 0x0
// Checksum 0x5b963aba, Offset: 0x450
// Size: 0x6c
function function_ba2049f5() {
    level endon(#"end_game");
    level flag::wait_till("magicbox_initialized");
    w_doll = array::random(level.a_w_nesting_doll_grenades);
    zm_weapons::function_603af7a8(w_doll);
}

// Namespace nesting_doll_grenade/zm_equip_nesting_doll_grenade
// Params 12, eflags: 0x0
// Checksum 0x7ddce58a, Offset: 0x4c8
// Size: 0xea
function function_23cf8077(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (meansofdeath === "MOD_IMPACT") {
        return 0;
    }
    var_b1c1c5cf = zm_equipment::function_7d948481(0.1, 0.25, 1, 1);
    var_5d7b4163 = zm_equipment::function_379f6b5d(damage, var_b1c1c5cf, 1, 4, 40);
    return var_5d7b4163;
}

// Namespace nesting_doll_grenade/zm_equip_nesting_doll_grenade
// Params 1, eflags: 0x0
// Checksum 0x6b767185, Offset: 0x5c0
// Size: 0x44
function on_grenade_fired(s_params) {
    if (is_nesting_doll_grenade(s_params.weapon)) {
        s_params.projectile thread function_a1b7b263(self);
    }
}

// Namespace nesting_doll_grenade/zm_equip_nesting_doll_grenade
// Params 1, eflags: 0x0
// Checksum 0xa17b4ae, Offset: 0x610
// Size: 0x184
function function_a1b7b263(e_player) {
    self endon(#"death");
    e_player endon(#"death");
    var_51dacd00 = 0;
    var_4da5977e = (0, randomfloatrange(0, 360), 0);
    s_waitresult = self waittill(#"stationary");
    wait 1;
    while (var_51dacd00 < 6) {
        var_5543f2a9 = array::random(level.var_e027f904);
        e_player magicgrenadetype(var_5543f2a9, self getcentroid(), get_launch_velocity(var_4da5977e), 1);
        self playsound(#"hash_23ebdfd906eaff00");
        var_4da5977e += (0, randomfloatrange(60, 180), 0);
        var_51dacd00++;
        wait 0.4;
    }
    wait 1;
    self detonate(e_player);
}

// Namespace nesting_doll_grenade/zm_equip_nesting_doll_grenade
// Params 1, eflags: 0x0
// Checksum 0xada58355, Offset: 0x7a0
// Size: 0x74
function get_launch_velocity(var_4da5977e) {
    v_angles = var_4da5977e + (randomfloatrange(-75, -55), 0, 0);
    v_launch = randomfloatrange(350, 400) * anglestoforward(v_angles);
    return v_launch;
}

// Namespace nesting_doll_grenade/zm_equip_nesting_doll_grenade
// Params 1, eflags: 0x0
// Checksum 0x52720ef6, Offset: 0x820
// Size: 0x2a
function is_nesting_doll_grenade(w_grenade) {
    return isinarray(level.a_w_nesting_doll_grenades, w_grenade);
}

