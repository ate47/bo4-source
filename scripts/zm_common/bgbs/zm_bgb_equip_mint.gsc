// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_stats.gsc;
#include scripts/zm_common/zm_loadout.gsc;
#include scripts/zm_common/zm_bgb.gsc;
#include scripts/core_common/system_shared.gsc;

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
    var_ac6ee9a0 = self zm_loadout::get_player_lethal_grenade();
    if (var_ac6ee9a0.isgadget) {
        n_slot = self gadgetgetslot(var_ac6ee9a0);
        if (var_ac6ee9a0 == getweapon(#"tomahawk_t8") || var_ac6ee9a0 == getweapon(#"tomahawk_t8_upgraded")) {
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
    var_ac6ee9a0 = self zm_loadout::get_player_lethal_grenade();
    n_stock_size = self getweaponammostock(var_ac6ee9a0);
    n_clip_size = self getweaponammoclipsize(var_ac6ee9a0);
    n_slot = self gadgetgetslot(var_ac6ee9a0);
    n_power = self gadgetpowerget(n_slot);
    if ((var_ac6ee9a0 == getweapon(#"tomahawk_t8") || var_ac6ee9a0 == getweapon(#"tomahawk_t8_upgraded")) && self function_36dfc05f(n_slot)) {
        return 0;
    }
    if (n_stock_size < n_clip_size || n_power < 100) {
        return 1;
    }
    return 0;
}
