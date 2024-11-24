#using scripts\core_common\perks;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_weapons;

#namespace zm_bgb_stock_option;

// Namespace zm_bgb_stock_option/zm_bgb_stock_option
// Params 0, eflags: 0x2
// Checksum 0x7e9447df, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_stock_option", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_stock_option/zm_bgb_stock_option
// Params 0, eflags: 0x1 linked
// Checksum 0x921b9dd7, Offset: 0x108
// Size: 0xa4
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_stock_option", "time", 120, &enable, &disable, &validation);
    bgb::function_1fee6b3(#"zm_bgb_stock_option", 35);
}

// Namespace zm_bgb_stock_option/zm_bgb_stock_option
// Params 0, eflags: 0x1 linked
// Checksum 0xe4e3c6aa, Offset: 0x1b8
// Size: 0x16c
function enable() {
    self thread function_1ff1beff();
    w_previous = self.previousweapon;
    if (w_previous.isprimary) {
        n_clip = self getweaponammoclip(w_previous);
        n_clip_size = w_previous.clipsize;
        n_stock_size = self getweaponammostock(w_previous);
        var_97c3ac3d = n_clip_size - n_clip;
        if (var_97c3ac3d > 0 && n_stock_size > 0) {
            if (n_stock_size >= var_97c3ac3d) {
                self setweaponammoclip(w_previous, n_clip_size);
                var_88f48290 = n_stock_size - var_97c3ac3d;
                self setweaponammostock(w_previous, var_88f48290);
                return;
            }
            var_3a347a66 = n_clip + n_stock_size;
            self setweaponammoclip(w_previous, var_3a347a66);
            self setweaponammostock(w_previous, 0);
        }
    }
}

// Namespace zm_bgb_stock_option/zm_bgb_stock_option
// Params 0, eflags: 0x1 linked
// Checksum 0x98916c32, Offset: 0x330
// Size: 0x74
function disable() {
    self endon(#"disconnect");
    self notify(#"hash_120ea24fd48cb17a");
    wait 0.1;
    if (self hasperk("specialty_ammodrainsfromstockfirst")) {
        self perks::perk_unsetperk("specialty_ammodrainsfromstockfirst");
    }
}

// Namespace zm_bgb_stock_option/zm_bgb_stock_option
// Params 0, eflags: 0x1 linked
// Checksum 0x3bb553db, Offset: 0x3b0
// Size: 0x68
function validation() {
    w_current = self getcurrentweapon();
    if (isdefined(w_current.isheroweapon) && w_current.isheroweapon || zm_weapons::is_wonder_weapon(w_current)) {
        return false;
    }
    return true;
}

// Namespace zm_bgb_stock_option/zm_bgb_stock_option
// Params 0, eflags: 0x1 linked
// Checksum 0x7ab17eac, Offset: 0x420
// Size: 0x1b0
function function_1ff1beff() {
    self endon(#"disconnect", #"player_downed", #"hash_120ea24fd48cb17a");
    w_current = self getcurrentweapon();
    if (!(isdefined(w_current.isheroweapon) && w_current.isheroweapon) && !zm_weapons::is_wonder_weapon(w_current)) {
        self perks::perk_setperk("specialty_ammodrainsfromstockfirst");
    }
    while (true) {
        s_notify = self waittill(#"weapon_change");
        w_check = s_notify.weapon;
        if (isdefined(w_check.isheroweapon) && w_check.isheroweapon || zm_weapons::is_wonder_weapon(w_check)) {
            if (self hasperk("specialty_ammodrainsfromstockfirst")) {
                self perks::perk_unsetperk("specialty_ammodrainsfromstockfirst");
            }
            continue;
        }
        if (!self hasperk("specialty_ammodrainsfromstockfirst")) {
            self perks::perk_setperk("specialty_ammodrainsfromstockfirst");
        }
    }
}

