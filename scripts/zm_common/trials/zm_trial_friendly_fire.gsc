#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_pack_a_punch_util;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm;
#using scripts\core_common\bots\bot_action;
#using scripts\core_common\bots\bot_util;
#using scripts\core_common\bots\bot;
#using scripts\core_common\values_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\aat_shared;

#namespace zm_trial_friendly_fire;

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 0, eflags: 0x2
// Checksum 0x8a42e52, Offset: 0x150
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_trial_friendly_fire", &__init__, &__main__, undefined);
}

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 0, eflags: 0x0
// Checksum 0x533d41f1, Offset: 0x1a0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"friendly_fire", &on_begin, &on_end);
}

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 0, eflags: 0x0
// Checksum 0xdfa61850, Offset: 0x208
// Size: 0x2c
function __main__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    register_bot_weapons();
}

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 0, eflags: 0x0
// Checksum 0xc8826201, Offset: 0x240
// Size: 0xc4
function register_bot_weapons() {
    bot_action::register_bulletweapon(#"ar_accurate_t8_upgraded");
    bot_action::register_bulletweapon(#"ar_fastfire_t8_upgraded");
    bot_action::register_bulletweapon(#"ar_stealth_t8_upgraded");
    bot_action::register_bulletweapon(#"ar_modular_t8_upgraded");
    bot_action::register_bulletweapon(#"smg_capacity_t8_upgraded");
    bot_action::register_bulletweapon(#"tr_powersemi_t8_upgraded");
}

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 1, eflags: 0x4
// Checksum 0x2a4d080d, Offset: 0x310
// Size: 0x2a4
function private on_begin(var_9e0a2a85 = 1) {
    level endon(#"hash_7646638df88a3656");
    if (ishash(var_9e0a2a85)) {
        var_9e0a2a85 = zm_trial::function_5769f26a(var_9e0a2a85);
    }
    level.var_3c2226ce = zm_custom::function_901b751c(#"zmfriendlyfiretype");
    zm_custom::function_928be07c(var_9e0a2a85);
    callback::on_player_damage(&on_player_damage);
    level.var_edae191d = 1;
    var_6a94fd5e = 4 - getplayers().size;
    var_be33ceec = #"allies";
    level notify(#"hash_d3e36871aa6829f");
    for (i = 0; i < var_6a94fd5e; i++) {
        do {
            bot = bot::add_bot(var_be33ceec);
        } while (!isdefined(bot));
        bot.var_247fdf5 = 1;
        wait 1;
        if (bot util::is_spectating()) {
            bot zm_player::spectator_respawn_player();
        }
    }
    foreach (player in getplayers()) {
        if (isbot(player)) {
            player thread function_e2c5e34c();
            player thread function_6aa8dd73();
        }
    }
    level.var_cd0fc105 = level.zm_bots_scale;
    level.zm_bots_scale = 0;
    zm::register_actor_damage_callback(&function_c4e6367a);
}

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 1, eflags: 0x4
// Checksum 0xbfaa496f, Offset: 0x5c0
// Size: 0x1ee
function private on_end(round_reset) {
    zm_custom::function_928be07c(level.var_3c2226ce);
    level.var_3c2226ce = undefined;
    callback::remove_on_player_damage(&on_player_damage);
    level.var_edae191d = undefined;
    foreach (player in getplayers()) {
        if (isbot(player)) {
            player val::reset("zm_trial_friendly_fire", "ignoreall");
            player val::reset("zm_trial_friendly_fire", "ignoreme");
        }
        if (isdefined(player.var_247fdf5) && player.var_247fdf5) {
            bot::remove_bot(player);
        }
    }
    level thread bot::populate_bots();
    if (isinarray(level.actor_damage_callbacks, &function_c4e6367a)) {
        arrayremovevalue(level.actor_damage_callbacks, &function_c4e6367a, 0);
    }
    level.zm_bots_scale = level.var_cd0fc105;
    level.var_cd0fc105 = undefined;
}

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 1, eflags: 0x4
// Checksum 0x6e69faf9, Offset: 0x7b8
// Size: 0x19e
function private on_player_damage(params) {
    if (isplayer(params.eattacker) && !isbot(params.eattacker) && params.idamage >= self.health && params.eattacker != self) {
        zm_trial::fail(#"hash_6e2a00b7d2d6e510", array(params.eattacker));
        return;
    }
    if (isbot(self) && isdefined(params.einflictor) && isplayer(params.einflictor.activated_by_player) && !isbot(params.einflictor.activated_by_player) && params.idamage >= self.health) {
        zm_trial::fail(#"hash_6e2a00b7d2d6e510", array(params.einflictor.activated_by_player));
        return;
    }
}

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 0, eflags: 0x4
// Checksum 0xb21e1757, Offset: 0x960
// Size: 0xc0
function private function_e2c5e34c() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    while (true) {
        self val::reset("zm_trial_friendly_fire", "ignoreme");
        wait randomintrange(3, 5);
        if (function_e1378d07()) {
            self val::set("zm_trial_friendly_fire", "ignoreme", 1);
        }
        wait randomintrange(5, 10);
    }
}

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 0, eflags: 0x4
// Checksum 0xd920edfe, Offset: 0xa28
// Size: 0xbe
function private function_e1378d07() {
    foreach (player in getplayers()) {
        if (isalive(player) && !isbot(player) && !player laststand::player_is_in_laststand()) {
            return true;
        }
    }
    return false;
}

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 12, eflags: 0x4
// Checksum 0xf941fcda, Offset: 0xaf0
// Size: 0xd2
function private function_c4e6367a(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (isplayer(attacker) && isbot(attacker) && level.round_number <= 20) {
        damage = int(damage * 0.5);
    }
    return damage;
}

// Namespace zm_trial_friendly_fire/zm_trial_friendly_fire
// Params 0, eflags: 0x0
// Checksum 0xf5cbc1d7, Offset: 0xbd0
// Size: 0x434
function function_6aa8dd73() {
    self endon(#"disconnect");
    if (self laststand::player_is_in_laststand() || !isalive(self) || self util::is_spectating()) {
        self waittill(#"player_revived", #"spawned");
    }
    if (level.round_number >= 20) {
        self zm_hero_weapon::function_1bb7f7b1(3);
        var_98cb6e9 = array::randomize(array(#"ar_accurate_t8_upgraded", #"ar_fastfire_t8_upgraded", #"ar_stealth_t8_upgraded", #"ar_modular_t8_upgraded", #"smg_capacity_t8_upgraded", #"tr_powersemi_t8_upgraded"));
        n_repacks = 4;
        self zm_perks::function_cc24f525();
    } else if (level.round_number >= 10) {
        self zm_hero_weapon::function_1bb7f7b1(2);
        var_98cb6e9 = array::randomize(array(#"ar_accurate_t8_upgraded", #"ar_fastfire_t8_upgraded", #"ar_stealth_t8_upgraded", #"ar_modular_t8_upgraded", #"smg_capacity_t8_upgraded", #"tr_powersemi_t8_upgraded"));
        n_repacks = 2;
    } else {
        self zm_hero_weapon::function_1bb7f7b1(1);
        var_98cb6e9 = array::randomize(array(#"ar_accurate_t8", #"ar_fastfire_t8", #"ar_stealth_t8", #"ar_modular_t8", #"smg_capacity_t8", #"tr_powersemi_t8"));
    }
    foreach (w_primary in self getweaponslistprimaries()) {
        self takeweapon(w_primary);
    }
    for (i = 0; i < zm_utility::get_player_weapon_limit(self); i++) {
        weapon = getweapon(var_98cb6e9[i]);
        weapon = self zm_weapons::give_build_kit_weapon(weapon);
        if (isdefined(level.aat_in_use) && level.aat_in_use && zm_weapons::weapon_supports_aat(weapon) && isdefined(n_repacks)) {
            self thread aat::acquire(weapon);
            self zm_pap_util::repack_weapon(weapon, n_repacks);
        }
    }
    self switchtoweapon(weapon);
}

