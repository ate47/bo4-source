// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\perks.gsc;

#namespace zm_bgb_free_fire;

// Namespace zm_bgb_free_fire/zm_bgb_free_fire
// Params 0, eflags: 0x2
// Checksum 0x1b099ed8, Offset: 0xa8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_free_fire", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_free_fire/zm_bgb_free_fire
// Params 0, eflags: 0x1 linked
// Checksum 0x4c4f431b, Offset: 0xf8
// Size: 0x84
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_free_fire", "time", 30, &enable, &disable, &validation, undefined);
}

// Namespace zm_bgb_free_fire/zm_bgb_free_fire
// Params 0, eflags: 0x1 linked
// Checksum 0x22cae6af, Offset: 0x188
// Size: 0x54
function enable() {
    self thread function_1ff1beff();
    w_current = self getcurrentweapon();
    self function_9d347621(w_current);
}

// Namespace zm_bgb_free_fire/zm_bgb_free_fire
// Params 0, eflags: 0x1 linked
// Checksum 0xbe46133c, Offset: 0x1e8
// Size: 0x74
function disable() {
    self endon(#"disconnect");
    self notify(#"hash_1b878c77be2d017b");
    wait(0.1);
    if (self hasperk("specialty_freefire")) {
        self perks::perk_unsetperk("specialty_freefire");
    }
}

// Namespace zm_bgb_free_fire/zm_bgb_free_fire
// Params 0, eflags: 0x1 linked
// Checksum 0xa3edf05c, Offset: 0x268
// Size: 0x68
function validation() {
    w_current = self getcurrentweapon();
    if (isdefined(w_current.isheroweapon) && w_current.isheroweapon || zm_weapons::is_wonder_weapon(w_current)) {
        return false;
    }
    return true;
}

// Namespace zm_bgb_free_fire/zm_bgb_free_fire
// Params 0, eflags: 0x1 linked
// Checksum 0x8ed67f99, Offset: 0x2d8
// Size: 0x1c8
function function_1ff1beff() {
    self endon(#"disconnect", #"player_downed", #"hash_1b878c77be2d017b");
    w_current = self getcurrentweapon();
    if (!(isdefined(w_current.isheroweapon) && w_current.isheroweapon) && !zm_weapons::is_wonder_weapon(w_current)) {
        self perks::perk_setperk("specialty_freefire");
    }
    while (true) {
        s_notify = self waittill(#"weapon_change");
        w_check = s_notify.weapon;
        if (isdefined(w_check.isheroweapon) && w_check.isheroweapon || zm_weapons::is_wonder_weapon(w_check)) {
            if (self hasperk("specialty_freefire")) {
                self perks::perk_unsetperk("specialty_freefire");
            }
            continue;
        }
        if (!self hasperk("specialty_freefire")) {
            self perks::perk_setperk("specialty_freefire");
        }
        self function_9d347621(w_check);
    }
}

// Namespace zm_bgb_free_fire/zm_bgb_free_fire
// Params 1, eflags: 0x1 linked
// Checksum 0xca54cac1, Offset: 0x4a8
// Size: 0x9c
function function_9d347621(w_check) {
    n_ammo_total = 0;
    n_ammo_stock = self getweaponammostock(w_check);
    n_ammo_clip = self getweaponammoclip(w_check);
    n_ammo_total = n_ammo_total + n_ammo_stock + n_ammo_clip;
    if (n_ammo_total == 0) {
        self setweaponammoclip(w_check, 1);
    }
}

