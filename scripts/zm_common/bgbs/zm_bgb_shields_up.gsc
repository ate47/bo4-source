// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_bgb_shields_up;

// Namespace zm_bgb_shields_up/zm_bgb_shields_up
// Params 0, eflags: 0x2
// Checksum 0xbff8431c, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_bgb_shields_up", &__init__, undefined, "bgb");
}

// Namespace zm_bgb_shields_up/zm_bgb_shields_up
// Params 0, eflags: 0x1 linked
// Checksum 0x56224796, Offset: 0xf8
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_shields_up", "activated", 1, undefined, undefined, &validation, &activation);
}

// Namespace zm_bgb_shields_up/zm_bgb_shields_up
// Params 0, eflags: 0x1 linked
// Checksum 0x5bcc4b26, Offset: 0x178
// Size: 0x1c
function activation() {
    self give_shield();
}

// Namespace zm_bgb_shields_up/zm_bgb_shields_up
// Params 0, eflags: 0x1 linked
// Checksum 0x5de0a5bc, Offset: 0x1a0
// Size: 0xac
function validation() {
    if (isdefined(self.weaponriotshield) && self.weaponriotshield != level.weaponnone) {
        w_shield = self.weaponriotshield;
        n_health_max = int(w_shield.weaponstarthitpoints);
        var_9428def3 = self damageriotshield(0);
        if (var_9428def3 < n_health_max) {
            return 1;
        }
        return 0;
    }
    if (isdefined(level.var_b115fab2)) {
        return 1;
    }
    return 0;
}

// Namespace zm_bgb_shields_up/zm_bgb_shields_up
// Params 0, eflags: 0x1 linked
// Checksum 0x186592db, Offset: 0x258
// Size: 0x13c
function give_shield() {
    if (!(isdefined(self.hasriotshield) && self.hasriotshield)) {
        if (isdefined(self.var_5ba94c1e) && self.var_5ba94c1e && isdefined(level.var_70f7eb75)) {
            self zm_weapons::weapon_give(level.var_70f7eb75);
            self zm_weapons::ammo_give(level.var_70f7eb75, 0);
        } else if (!self hasweapon(level.var_b115fab2)) {
            self zm_weapons::weapon_give(level.var_b115fab2);
            self zm_weapons::ammo_give(level.var_b115fab2, 0);
        }
    } else if (isdefined(self.hasriotshield) && self.hasriotshield && isdefined(self.player_shield_reset_health)) {
        self [[ self.player_shield_reset_health ]]();
        self zm_weapons::ammo_give(self.weaponriotshield, 0);
    }
}

