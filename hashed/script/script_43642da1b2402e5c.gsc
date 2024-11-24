#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace namespace_a9e73d8d;

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 0, eflags: 0x2
// Checksum 0x2cf16a42, Offset: 0x128
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_1f1fd12b1b87ef2c", &__init__, undefined, undefined);
}

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 0, eflags: 0x1 linked
// Checksum 0x89007523, Offset: 0x170
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_3ad5e71a03ad70c1", &on_begin, &on_end);
}

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 0, eflags: 0x5 linked
// Checksum 0x4038cf6e, Offset: 0x1d8
// Size: 0x16c
function private on_begin() {
    level.var_375482b5 = 1;
    callback::on_ai_killed(&on_ai_killed);
    callback::function_33f0ddd3(&function_33f0ddd3);
    callback::on_weapon_change(&zm_trial_util::function_79518194);
    foreach (player in getplayers()) {
        player thread zm_trial_util::function_bf710271(1, 1, 1, 0, 0);
        player thread zm_trial_util::function_dc9ab223(1, 0);
        player thread lock_shield();
        player thread function_29ee24dd();
    }
    level zm_trial::function_25ee130(1);
}

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 1, eflags: 0x5 linked
// Checksum 0x50c94472, Offset: 0x350
// Size: 0xa4
function private on_end(round_reset) {
    level.var_375482b5 = undefined;
    callback::remove_on_ai_killed(&on_ai_killed);
    callback::function_824d206(&function_33f0ddd3);
    callback::remove_on_weapon_change(&zm_trial_util::function_79518194);
    level zm_trial::function_25ee130(0);
    level thread refill_ammo();
}

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 0, eflags: 0x5 linked
// Checksum 0x42bd558b, Offset: 0x400
// Size: 0x214
function private refill_ammo() {
    self notify("416a437667c7c600");
    self endon("416a437667c7c600");
    while (is_active()) {
        waitframe(1);
    }
    foreach (player in getplayers()) {
        player thread zm_trial_util::function_dc0859e();
        a_w_weapons = player getweaponslist(0);
        foreach (w_weapon in a_w_weapons) {
            if (zm_loadout::is_lethal_grenade(w_weapon) || zm_loadout::is_melee_weapon(w_weapon) || zm_loadout::is_hero_weapon(w_weapon)) {
                continue;
            }
            if (isdefined(level.zombie_include_equipment) && isdefined(level.zombie_include_equipment[w_weapon]) && !(isdefined(level.zombie_equipment[w_weapon].refill_max_ammo) && level.zombie_equipment[w_weapon].refill_max_ammo)) {
                continue;
            }
            player zm_weapons::ammo_give(w_weapon, 0);
        }
    }
}

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 0, eflags: 0x5 linked
// Checksum 0x3836240f, Offset: 0x620
// Size: 0x118
function private lock_shield() {
    foreach (weapon in zm_loadout::function_5a5a742a("tactical_grenade")) {
        self lockweapon(weapon, 1, 1);
        if (weapon.dualwieldweapon != level.weaponnone) {
            self lockweapon(weapon.dualwieldweapon, 1, 1);
        }
        if (weapon.altweapon != level.weaponnone) {
            self lockweapon(weapon.altweapon, 1, 1);
        }
    }
}

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 1, eflags: 0x5 linked
// Checksum 0xcee7b4c4, Offset: 0x740
// Size: 0x184
function private function_33f0ddd3(s_event) {
    if (s_event.event === "give_weapon") {
        if (s_event.weapon.inventorytype === "item") {
            return;
        }
        if (zm_loadout::is_lethal_grenade(s_event.weapon) || zm_loadout::is_tactical_grenade(s_event.weapon, 1)) {
            self lockweapon(s_event.weapon, 1, 1);
            if (s_event.weapon.dualwieldweapon != level.weaponnone) {
                self lockweapon(s_event.weapon.dualwieldweapon, 1, 1);
            }
            if (s_event.weapon.altweapon != level.weaponnone) {
                self lockweapon(s_event.weapon.altweapon, 1, 1);
            }
            return;
        }
        waitframe(1);
        self setweaponammostock(s_event.weapon, 0);
    }
}

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 0, eflags: 0x5 linked
// Checksum 0xe35582f0, Offset: 0x8d0
// Size: 0x1f4
function private function_29ee24dd() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    a_w_weapons = self getweaponslist(0);
    self reset_ammo(1);
    while (true) {
        s_waitresult = self waittill(#"zmb_max_ammo", #"hash_278526d0bbdb4ce7", #"melee_reload", #"wallbuy_done");
        w_current = self getcurrentweapon();
        if (s_waitresult._notify == "melee_reload") {
            self setweaponammoclip(w_current, w_current.clipsize);
            continue;
        }
        a_weapons = self getweaponslist(0);
        foreach (weapon in a_weapons) {
            if (!(zm_loadout::is_lethal_grenade(weapon) || zm_loadout::is_hero_weapon(weapon))) {
                self setweaponammostock(weapon, 0);
            }
        }
    }
}

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 0, eflags: 0x1 linked
// Checksum 0x6a381480, Offset: 0xad0
// Size: 0x32
function is_active() {
    s_challenge = zm_trial::function_a36e8c38(#"hash_3ad5e71a03ad70c1");
    return isdefined(s_challenge);
}

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 1, eflags: 0x5 linked
// Checksum 0xa7843761, Offset: 0xb10
// Size: 0x60
function private on_ai_killed(params) {
    if (isplayer(params.eattacker) && params.smeansofdeath === "MOD_MELEE") {
        params.eattacker notify(#"melee_reload");
    }
}

// Namespace namespace_a9e73d8d/namespace_a9e73d8d
// Params 1, eflags: 0x5 linked
// Checksum 0x38076a49, Offset: 0xb78
// Size: 0x1b0
function private reset_ammo(var_f2c84b6b) {
    self notify("70d94e798e24bb1e");
    self endon("70d94e798e24bb1e");
    self endon(#"disconnect");
    if (!self zm_laststand::laststand_has_players_weapons_returned()) {
        self waittill(#"hash_9b426cce825928d");
    }
    if (isdefined(self.var_9b0383f5) && self.var_9b0383f5) {
        self waittill(#"hash_1ac4338b0d419091");
    }
    a_weapons = self getweaponslist(0);
    foreach (weapon in a_weapons) {
        if (zm_loadout::is_hero_weapon(weapon) || zm_loadout::is_lethal_grenade(weapon)) {
            continue;
        }
        self setweaponammostock(weapon, 0);
        if (isdefined(var_f2c84b6b)) {
            self setweaponammoclip(weapon, weapon.clipsize);
            continue;
        }
        self setweaponammoclip(weapon, 0);
    }
}

