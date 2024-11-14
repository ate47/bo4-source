#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_bgb;
#using scripts\core_common\system_shared;

#namespace zm_bgb_equip_mint;

// Namespace zm_bgb_equip_mint/zm_bgb_equip_mint
// Params 0, eflags: 0x2
// Checksum 0xe30baa5d, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_bgb_equip_mint", &__init__, undefined, "bgb");
}

// Namespace zm_bgb_equip_mint/zm_bgb_equip_mint
// Params 0, eflags: 0x1 linked
// Checksum 0x72885549, Offset: 0xe8
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_equip_mint", "activated", 1, undefined, undefined, &validation, &activation);
}

// Namespace zm_bgb_equip_mint/zm_bgb_equip_mint
// Params 0, eflags: 0x1 linked
// Checksum 0x48e35a7b, Offset: 0x168
// Size: 0x11c
function activation() {
    w_lethal = self zm_loadout::get_player_lethal_grenade();
    if (w_lethal.isgadget) {
        n_slot = self gadgetgetslot(w_lethal);
        if (w_lethal == getweapon(#"tomahawk_t8") || w_lethal == getweapon(#"tomahawk_t8_upgraded")) {
            self notify(#"hash_3d73720d4588203c");
            self gadgetpowerset(n_slot, 100);
        } else {
            self gadgetpowerreset(n_slot, 0);
        }
    }
    self zm_stats::increment_challenge_stat(#"hash_47646e52fcbb190e");
}

// Namespace zm_bgb_equip_mint/zm_bgb_equip_mint
// Params 0, eflags: 0x1 linked
// Checksum 0xbb5c41a1, Offset: 0x290
// Size: 0x142
function validation() {
    w_lethal = self zm_loadout::get_player_lethal_grenade();
    n_stock_size = self getweaponammostock(w_lethal);
    n_clip_size = self getweaponammoclipsize(w_lethal);
    n_slot = self gadgetgetslot(w_lethal);
    n_power = self gadgetpowerget(n_slot);
    if ((w_lethal == getweapon(#"tomahawk_t8") || w_lethal == getweapon(#"tomahawk_t8_upgraded")) && self function_36dfc05f(n_slot)) {
        return false;
    }
    if (n_stock_size < n_clip_size || n_power < 100) {
        return true;
    }
    return false;
}

