#using scripts\zm\zm_lightning_chain.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_weap_tesla_gun_t8;

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 0, eflags: 0x2
// Checksum 0xad1d1458, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"tesla_gun", &__init__, undefined, undefined);
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 0, eflags: 0x1 linked
// Checksum 0x4c1ce5ca, Offset: 0x120
// Size: 0x1cc
function __init__() {
    level.w_tesla_gun_t8 = getweapon(#"ww_tesla_gun_t8");
    level.w_tesla_gun_t8_upgraded = getweapon(#"ww_tesla_gun_t8_upgraded");
    level.s_tesla_gun = spawnstruct();
    level.s_tesla_gun.base = spawnstruct();
    level.s_tesla_gun.upgraded = spawnstruct();
    level.s_tesla_gun.base.var_38cd3d0e = lightning_chain::create_lightning_chain_params();
    level.s_tesla_gun.upgraded.var_38cd3d0e = lightning_chain::create_lightning_chain_params();
    zm::function_84d343d(#"ww_tesla_gun_t8", &function_5ff12a45);
    zm::function_84d343d(#"ww_tesla_gun_t8_upgraded", &function_52d66433);
    callback::on_weapon_change(&on_weapon_change);
    clientfield::register("toplayer", "" + #"hash_611f27e5d51d036f", 28000, 1, "int");
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 12, eflags: 0x1 linked
// Checksum 0x6286cafe, Offset: 0x2f8
// Size: 0xa0
function function_5ff12a45(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    self function_de59b16a(attacker, meansofdeath, level.s_tesla_gun.base.var_38cd3d0e);
    return damage;
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 12, eflags: 0x1 linked
// Checksum 0x20e9ebce, Offset: 0x3a0
// Size: 0xa0
function function_52d66433(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    self function_de59b16a(attacker, meansofdeath, level.s_tesla_gun.upgraded.var_38cd3d0e);
    return damage;
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 1, eflags: 0x1 linked
// Checksum 0xf11a83a2, Offset: 0x448
// Size: 0xa4
function on_weapon_change(s_params) {
    if (is_tesla_gun(s_params.weapon)) {
        clientfield::set_to_player("" + #"hash_611f27e5d51d036f", 1);
        return;
    }
    if (is_tesla_gun(s_params.last_weapon)) {
        clientfield::set_to_player("" + #"hash_611f27e5d51d036f", 0);
    }
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 3, eflags: 0x1 linked
// Checksum 0x892c1fba, Offset: 0x4f8
// Size: 0xac
function function_de59b16a(e_source, str_mod, var_8e05c280) {
    if (isplayer(e_source) && (str_mod == "MOD_PROJECTILE" || str_mod == "MOD_PROJECTILE_SPLASH") && !self ai::is_stunned()) {
        e_source.tesla_enemies_hit = 1;
        self lightning_chain::arc_damage(self, e_source, 1, var_8e05c280);
    }
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 1, eflags: 0x1 linked
// Checksum 0x39a4d06a, Offset: 0x5b0
// Size: 0x3c
function is_tesla_gun(w_weapon) {
    return isdefined(w_weapon) && (w_weapon == level.w_tesla_gun_t8 || w_weapon == level.w_tesla_gun_t8_upgraded);
}

