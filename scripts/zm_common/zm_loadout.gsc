#using scripts\core_common\aat_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\bb;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_maptable;
#using scripts\zm_common\zm_melee_weapon;
#using scripts\zm_common\zm_pack_a_punch_util;
#using scripts\zm_common\zm_placeable_mine;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_loadout;

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x2
// Checksum 0xeebbf112, Offset: 0x1b0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_loadout", &__init__, undefined, undefined);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0x34ca6720, Offset: 0x1f8
// Size: 0x44
function __init__() {
    callback::on_connect(&on_player_connect);
    callback::on_spawned(&on_player_spawned);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0xd9708671, Offset: 0x248
// Size: 0x46
function on_player_connect() {
    self.currentweaponstarttime = gettime();
    self.currentweapon = level.weaponnone;
    self.previousweapon = level.weaponnone;
    if (!isdefined(self.var_57c1d146)) {
        self.var_57c1d146 = [];
    }
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0xd2baf4ba, Offset: 0x298
// Size: 0x22
function on_player_spawned() {
    self.class_num = self function_cc90c352();
}

// Namespace zm_loadout/weapon_change
// Params 1, eflags: 0x40
// Checksum 0xa61f98f7, Offset: 0x2c8
// Size: 0x5a
function event_handler[weapon_change] weapon_changed(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    self.currentweaponstarttime = gettime();
    self.currentweapon = eventstruct.weapon;
    self.previousweapon = eventstruct.last_weapon;
}

// Namespace zm_loadout/player_loadoutchanged
// Params 1, eflags: 0x40
// Checksum 0x5881b182, Offset: 0x330
// Size: 0xd4
function event_handler[player_loadoutchanged] loadout_changed(eventstruct) {
    switch (eventstruct.event) {
    case #"give_weapon":
        self function_54cb37a4(eventstruct.weapon);
        break;
    case #"take_weapon":
        self function_ad4c1664(eventstruct.weapon);
        break;
    }
    if (isdefined(self)) {
        self thread zm_player::function_de3936f8(eventstruct.weapon);
        self callback::callback(#"hash_39bf72fd97e248a0", eventstruct);
    }
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x8e72921b, Offset: 0x410
// Size: 0x22c
function function_ad4c1664(weapon) {
    self notify(#"weapon_take", weapon);
    primaryweapons = self getweaponslistprimaries();
    current_weapon = self getcurrentweapon();
    if (zm_equipment::is_equipment(weapon)) {
        self zm_equipment::take(weapon);
    }
    if (function_59b0ef71("melee_weapon", weapon)) {
        self function_6519eea8("melee_weapon", level.weaponnone);
    } else if (function_59b0ef71("hero_weapon", weapon)) {
        self function_6519eea8("hero_weapon", level.weaponnone);
    } else if (function_59b0ef71("lethal_grenade", weapon)) {
        self function_6519eea8("lethal_grenade", level.weaponnone);
    } else if (function_59b0ef71("tactical_grenade", weapon)) {
        self function_6519eea8("tactical_grenade", level.weaponnone);
    } else if (function_59b0ef71("placeable_mine", weapon)) {
        self function_6519eea8("placeable_mine", level.weaponnone);
    }
    if (!is_offhand_weapon(weapon) && primaryweapons.size < 1) {
        self zm_weapons::give_fallback_weapon();
    }
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0xeaaec35f, Offset: 0x648
// Size: 0x56c
function function_54cb37a4(weapon) {
    self notify(#"weapon_give", weapon);
    self endon(#"disconnect");
    primaryweapons = self getweaponslistprimaries();
    initial_current_weapon = self getcurrentweapon();
    current_weapon = self zm_weapons::switch_from_alt_weapon(initial_current_weapon);
    assert(self zm_weapons::player_can_use_content(weapon));
    weapon_limit = zm_utility::get_player_weapon_limit(self);
    if (isdefined(weapon.craftitem) && weapon.craftitem) {
        zm_items::player_pick_up(self, weapon);
        return;
    }
    if (zm_equipment::is_equipment(weapon)) {
        self zm_equipment::give(weapon);
    }
    if (weapon.isriotshield) {
        if (isdefined(self.player_shield_reset_health)) {
            self [[ self.player_shield_reset_health ]](weapon);
        }
    }
    if (function_59b0ef71("melee_weapon", weapon)) {
        had_fallback_weapon = self zm_melee_weapon::take_fallback_weapon();
        self function_6519eea8("melee_weapon", weapon);
        if (had_fallback_weapon) {
            self zm_melee_weapon::give_fallback_weapon();
        }
    } else if (function_59b0ef71("hero_weapon", weapon)) {
        self function_6519eea8("hero_weapon", weapon);
    } else if (function_59b0ef71("lethal_grenade", weapon)) {
        self function_6519eea8("lethal_grenade", weapon);
    } else if (function_59b0ef71("tactical_grenade", weapon)) {
        self function_6519eea8("tactical_grenade", weapon);
    } else if (function_59b0ef71("placeable_mine", weapon)) {
        self function_6519eea8("placeable_mine", weapon);
    }
    if (!is_offhand_weapon(weapon) && !function_2ff6913(weapon) && weapon != self zm_melee_weapon::determine_fallback_weapon()) {
        self zm_weapons::take_fallback_weapon();
    }
    if (primaryweapons.size > weapon_limit) {
        if (is_placeable_mine(current_weapon) || zm_equipment::is_equipment(current_weapon) || self.laststandpistol === weapon) {
            current_weapon = undefined;
        }
        if (isdefined(current_weapon)) {
            if (!is_offhand_weapon(weapon)) {
                self zm_weapons::weapon_take(current_weapon);
                if (isdefined(initial_current_weapon) && current_weapon != initial_current_weapon) {
                    self zm_weapons::weapon_take(initial_current_weapon);
                }
            }
        }
    }
    if (isdefined(level.zombiemode_offhand_weapon_give_override)) {
        if (self [[ level.zombiemode_offhand_weapon_give_override ]](weapon)) {
            return;
        }
    }
    if (is_placeable_mine(weapon)) {
        self thread zm_placeable_mine::setup_for_player(weapon);
        return weapon;
    }
    if (isdefined(level.zombie_weapons_callbacks) && isdefined(level.zombie_weapons_callbacks[weapon])) {
        self thread [[ level.zombie_weapons_callbacks[weapon] ]]();
    }
    self zm_weapons::function_7c5dd4bd(weapon);
    if (isdefined(self.var_57c1d146[weapon]) && self.var_57c1d146[weapon]) {
        self.var_57c1d146[weapon] = undefined;
        return;
    }
    if (!is_offhand_weapon(weapon) && !is_hero_weapon(weapon)) {
        if (!is_melee_weapon(weapon)) {
            self switchtoweapon(weapon);
            return;
        }
        self switchtoweapon(current_weapon);
    }
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x1249e542, Offset: 0xbc0
// Size: 0x60
function function_5a5a742a(slot) {
    if (!isdefined(level.var_d5f9c1d2)) {
        level.var_d5f9c1d2 = [];
    }
    if (!isdefined(level.var_d5f9c1d2[slot])) {
        level.var_d5f9c1d2[slot] = [];
    }
    return level.var_d5f9c1d2[slot];
}

// Namespace zm_loadout/zm_loadout
// Params 2, eflags: 0x1 linked
// Checksum 0x8aec49ad, Offset: 0xc28
// Size: 0x104
function function_e884e095(slot, weapon) {
    if (isstring(weapon) || ishash(weapon)) {
        weapon = getweapon(weapon);
    }
    if (weapon.name == #"none") {
        return;
    }
    if (function_59b0ef71(slot, weapon)) {
        return;
    }
    if (!isdefined(level.var_d5f9c1d2)) {
        level.var_d5f9c1d2 = [];
    }
    if (!isdefined(level.var_d5f9c1d2[slot])) {
        level.var_d5f9c1d2[slot] = [];
    }
    level.var_d5f9c1d2[slot][weapon] = weapon;
}

// Namespace zm_loadout/zm_loadout
// Params 2, eflags: 0x1 linked
// Checksum 0xbf54ecae, Offset: 0xd38
// Size: 0x64
function function_59b0ef71(slot, weapon) {
    if (!isdefined(weapon) || !isdefined(level.var_d5f9c1d2) || !isdefined(level.var_d5f9c1d2[slot])) {
        return false;
    }
    return isdefined(level.var_d5f9c1d2[slot][weapon]);
}

// Namespace zm_loadout/zm_loadout
// Params 2, eflags: 0x1 linked
// Checksum 0xb2add1c3, Offset: 0xda8
// Size: 0x72
function function_393977df(slot, weapon) {
    if (!isdefined(weapon) || weapon == level.weaponnone || !isdefined(self.slot_weapons) || !isdefined(self.slot_weapons[slot])) {
        return false;
    }
    return self.slot_weapons[slot] == weapon;
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x28726cb1, Offset: 0xe28
// Size: 0x98
function function_8f85096(slot) {
    if (!isdefined(self.slot_weapons)) {
        self.slot_weapons = [];
    }
    if (!isdefined(self.slot_weapons[slot])) {
        self.slot_weapons[slot] = level.weaponnone;
    }
    w_ret = level.weaponnone;
    if (isdefined(self.slot_weapons) && isdefined(self.slot_weapons[slot])) {
        w_ret = self.slot_weapons[slot];
    }
    return w_ret;
}

// Namespace zm_loadout/zm_loadout
// Params 2, eflags: 0x1 linked
// Checksum 0xb9ca9188, Offset: 0xec8
// Size: 0x16a
function function_6519eea8(slot, weapon) {
    if (!isdefined(self.slot_weapons)) {
        self.slot_weapons = [];
    }
    if (!isdefined(self.slot_weapons[slot])) {
        self.slot_weapons[slot] = level.weaponnone;
    }
    if (!isdefined(weapon)) {
        weapon = level.weaponnone;
    }
    old_weapon = self function_8f85096(slot);
    self notify(#"hash_4078956b159dd0f3", {#slot:slot, #weapon:weapon});
    self notify("new_" + slot, {#weapon:weapon});
    self.slot_weapons[slot] = level.weaponnone;
    if (old_weapon != level.weaponnone && old_weapon != weapon) {
        if (self hasweapon(old_weapon)) {
            self takeweapon(old_weapon);
        }
    }
    self.slot_weapons[slot] = weapon;
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0xb18617c3, Offset: 0x1040
// Size: 0x24
function register_lethal_grenade_for_level(weaponname) {
    function_e884e095("lethal_grenade", weaponname);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x4387f95d, Offset: 0x1070
// Size: 0x22
function is_lethal_grenade(weapon) {
    return function_59b0ef71("lethal_grenade", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x24572026, Offset: 0x10a0
// Size: 0x2a
function is_player_lethal_grenade(weapon) {
    return self function_393977df("lethal_grenade", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0x65f55156, Offset: 0x10d8
// Size: 0x22
function get_player_lethal_grenade() {
    return self function_8f85096("lethal_grenade");
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0xce7cd9c2, Offset: 0x1108
// Size: 0x2c
function set_player_lethal_grenade(weapon) {
    self function_6519eea8("lethal_grenade", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0x325d31f7, Offset: 0x1140
// Size: 0x17c
function init_player_lethal_grenade() {
    var_cd6fae8c = self get_loadout_item("primarygrenade");
    s_weapon = getunlockableiteminfofromindex(var_cd6fae8c, 1);
    w_weapon = level.zombie_lethal_grenade_player_init;
    if (isdefined(s_weapon) && isdefined(s_weapon.namehash)) {
        w_weapon = getweapon(s_weapon.namehash);
        self zm_weapons::weapon_give(w_weapon, 1, 0);
    } else {
        self zm_weapons::weapon_give(level.zombie_lethal_grenade_player_init, 1, 0);
    }
    if (w_weapon.isgadget) {
        slot = self gadgetgetslot(w_weapon);
        var_aabc1f49 = isdefined(self.firstspawn) ? self.firstspawn : 1;
        if (slot >= 0 && var_aabc1f49) {
            self gadgetpowerreset(slot, 1);
        }
    }
}

// Namespace zm_loadout/zm_loadout
// Params 2, eflags: 0x1 linked
// Checksum 0x627ca289, Offset: 0x12c8
// Size: 0x76
function register_tactical_grenade_for_level(weaponname, var_b1830d98 = 0) {
    function_e884e095("tactical_grenade", weaponname);
    if (var_b1830d98) {
        w_shield = getweapon(weaponname);
        level.var_b115fab2 = w_shield;
    }
}

// Namespace zm_loadout/zm_loadout
// Params 2, eflags: 0x1 linked
// Checksum 0xc002dcdc, Offset: 0x1348
// Size: 0x72
function is_tactical_grenade(weapon, var_9f428637 = 1) {
    if (!var_9f428637 && isdefined(weapon.isriotshield) && weapon.isriotshield) {
        return 0;
    }
    return function_59b0ef71("tactical_grenade", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x686fee5f, Offset: 0x13c8
// Size: 0x2a
function is_player_tactical_grenade(weapon) {
    return self function_393977df("tactical_grenade", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0x22f0f049, Offset: 0x1400
// Size: 0x22
function get_player_tactical_grenade() {
    return self function_8f85096("tactical_grenade");
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x0
// Checksum 0x894f8ba3, Offset: 0x1430
// Size: 0x2c
function set_player_tactical_grenade(weapon) {
    self function_6519eea8("tactical_grenade", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0xcfeb91e1, Offset: 0x1468
// Size: 0x2c
function init_player_tactical_grenade() {
    self function_6519eea8("tactical_grenade", level.zombie_tactical_grenade_player_init);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x7d2d8711, Offset: 0x14a0
// Size: 0x22
function is_placeable_mine(weapon) {
    return function_59b0ef71("placeable_mine", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0xd2e6557f, Offset: 0x14d0
// Size: 0x2a
function is_player_placeable_mine(weapon) {
    return self function_393977df("placeable_mine", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0x37f876c8, Offset: 0x1508
// Size: 0x22
function get_player_placeable_mine() {
    return self function_8f85096("placeable_mine");
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x3a89f9d1, Offset: 0x1538
// Size: 0x2c
function set_player_placeable_mine(weapon) {
    self function_6519eea8("placeable_mine", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0xe866c54f, Offset: 0x1570
// Size: 0x2c
function init_player_placeable_mine() {
    self function_6519eea8("placeable_mine", level.zombie_placeable_mine_player_init);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0xa1dc99b9, Offset: 0x15a8
// Size: 0x24
function register_melee_weapon_for_level(weaponname) {
    function_e884e095("melee_weapon", weaponname);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x31f56fd7, Offset: 0x15d8
// Size: 0x22
function is_melee_weapon(weapon) {
    return function_59b0ef71("melee_weapon", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0xf4c3d43a, Offset: 0x1608
// Size: 0x2a
function is_player_melee_weapon(weapon) {
    return self function_393977df("melee_weapon", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0x46ea7df3, Offset: 0x1640
// Size: 0x22
function get_player_melee_weapon() {
    return self function_8f85096("melee_weapon");
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x37fdeadd, Offset: 0x1670
// Size: 0x6c
function set_player_melee_weapon(weapon) {
    had_fallback_weapon = self zm_melee_weapon::take_fallback_weapon();
    self function_6519eea8("melee_weapon", weapon);
    if (had_fallback_weapon) {
        self zm_melee_weapon::give_fallback_weapon();
    }
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0x529a5a02, Offset: 0x16e8
// Size: 0x2c
function init_player_melee_weapon() {
    self zm_weapons::weapon_give(level.zombie_melee_weapon_player_init, 1, 0);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x12c00858, Offset: 0x1720
// Size: 0x24
function register_hero_weapon_for_level(weaponname) {
    function_e884e095("hero_weapon", weaponname);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x13c00b1, Offset: 0x1750
// Size: 0x22
function is_hero_weapon(weapon) {
    return function_59b0ef71("hero_weapon", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x4d0d7965, Offset: 0x1780
// Size: 0x2a
function is_player_hero_weapon(weapon) {
    return self function_393977df("hero_weapon", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0x6ed5c5b, Offset: 0x17b8
// Size: 0x22
function get_player_hero_weapon() {
    return self function_8f85096("hero_weapon");
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x18d74954, Offset: 0x17e8
// Size: 0x2c
function set_player_hero_weapon(weapon) {
    self function_6519eea8("hero_weapon", weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0xb19e48fe, Offset: 0x1820
// Size: 0x1c
function init_player_hero_weapon() {
    self zm_hero_weapon::hero_weapon_player_init();
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x0
// Checksum 0xb98d6f2c, Offset: 0x1848
// Size: 0x36
function has_player_hero_weapon() {
    current_hero_weapon = get_player_hero_weapon();
    return isdefined(current_hero_weapon) && current_hero_weapon != level.weaponnone;
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0xd746df0b, Offset: 0x1888
// Size: 0x216
function register_offhand_weapons_for_level_defaults() {
    if (isdefined(level.var_54f1e174)) {
        [[ level.var_54f1e174 ]]();
        return;
    }
    if (isdefined(level.var_22fda912)) {
        [[ level.var_22fda912 ]]();
    }
    register_lethal_grenade_for_level(#"claymore");
    register_lethal_grenade_for_level(#"eq_acid_bomb");
    register_lethal_grenade_for_level(#"eq_frag_grenade");
    register_lethal_grenade_for_level(#"eq_molotov");
    register_lethal_grenade_for_level(#"eq_wraith_fire");
    register_lethal_grenade_for_level(#"mini_turret");
    register_lethal_grenade_for_level(#"proximity_grenade");
    register_lethal_grenade_for_level(#"sticky_grenade");
    level.zombie_lethal_grenade_player_init = getweapon(#"eq_frag_grenade");
    register_melee_weapon_for_level(level.weaponbasemelee.name);
    if (zm_maptable::get_story() == 1) {
        register_melee_weapon_for_level(#"bowie_knife_story_1");
    } else {
        register_melee_weapon_for_level(#"bowie_knife");
    }
    level.zombie_melee_weapon_player_init = level.weaponbasemelee;
    level.zombie_equipment_player_init = undefined;
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0xe62be9d9, Offset: 0x1aa8
// Size: 0x64
function init_player_offhand_weapons() {
    init_player_lethal_grenade();
    init_player_tactical_grenade();
    init_player_placeable_mine();
    init_player_melee_weapon();
    init_player_hero_weapon();
    zm_equipment::init_player_equipment();
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x244ef476, Offset: 0x1b18
// Size: 0x28
function function_2ff6913(weapon) {
    return weapon.isperkbottle || weapon.isflourishweapon;
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0xf41c2a6f, Offset: 0x1b48
// Size: 0x9c
function is_offhand_weapon(weapon) {
    return is_lethal_grenade(weapon) || is_tactical_grenade(weapon) || is_placeable_mine(weapon) || is_melee_weapon(weapon) || is_hero_weapon(weapon) || zm_equipment::is_equipment(weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x0
// Checksum 0xdb20d7a4, Offset: 0x1bf0
// Size: 0x9c
function is_player_offhand_weapon(weapon) {
    return self is_player_lethal_grenade(weapon) || self is_player_tactical_grenade(weapon) || self is_player_placeable_mine(weapon) || self is_player_melee_weapon(weapon) || self is_player_hero_weapon(weapon) || self zm_equipment::is_player_equipment(weapon);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0x897832b3, Offset: 0x1c98
// Size: 0x18
function has_powerup_weapon() {
    return isdefined(self.has_powerup_weapon) && self.has_powerup_weapon;
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0xa86d4fc0, Offset: 0x1cb8
// Size: 0x44
function has_hero_weapon() {
    weapon = self getcurrentweapon();
    return isdefined(weapon.isheroweapon) && weapon.isheroweapon;
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x324ec483, Offset: 0x1d08
// Size: 0x1c4
function give_start_weapon(b_switch_weapon) {
    var_9aeb4447 = self get_loadout_item("primary");
    s_weapon = getunlockableiteminfofromindex(var_9aeb4447, 1);
    if (isdefined(s_weapon) && isdefined(s_weapon.namehash) && zm_custom::function_bce642a1(s_weapon) && zm_custom::function_901b751c(#"zmstartingweaponenabled")) {
        self zm_weapons::weapon_give(getweapon(s_weapon.namehash), 1, b_switch_weapon);
        if (zm_custom::function_901b751c(#"zmstartingweaponenabled") && isdefined(self.talisman_weapon_start)) {
            self thread function_d9153457(b_switch_weapon);
        }
        return;
    }
    self zm_weapons::weapon_give(level.start_weapon, 1, b_switch_weapon);
    if (isdefined(s_weapon) && (!zm_custom::function_bce642a1(s_weapon) || !zm_custom::function_901b751c(#"zmstartingweaponenabled"))) {
        self thread zm_custom::function_343353f8();
    }
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x54691fc6, Offset: 0x1ed8
// Size: 0x6a
function get_loadout_item(slot) {
    if (!isdefined(self.class_num)) {
        self.class_num = self function_cc90c352();
    }
    if (!isdefined(self.class_num)) {
        self.class_num = 0;
    }
    return self getloadoutitem(self.class_num, slot);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x722eb26a, Offset: 0x1f50
// Size: 0x6a
function function_439b009a(slot) {
    if (!isdefined(self.class_num)) {
        self.class_num = self function_cc90c352();
    }
    if (!isdefined(self.class_num)) {
        self.class_num = 0;
    }
    return self getloadoutweapon(self.class_num, slot);
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x16054671, Offset: 0x1fc8
// Size: 0xc4
function function_d9153457(b_switch_weapon = 1) {
    self endon(#"death");
    var_19673a84 = getweapon(self.talisman_weapon_start);
    if (var_19673a84 !== level.weaponnone) {
        self zm_weapons::weapon_give(var_19673a84, 1, 0);
        if (b_switch_weapon) {
            level waittill(#"start_zombie_round_logic");
            self switchtoweaponimmediate(var_19673a84, 1);
        }
    }
}

