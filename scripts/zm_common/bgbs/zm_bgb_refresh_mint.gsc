// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_stats.gsc;
#include scripts/zm_common/zm_perks.gsc;
#include scripts/zm_common/zm_loadout.gsc;
#include scripts/zm_common/zm_bgb.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace zm_bgb_refresh_mint;

// Namespace zm_bgb_refresh_mint/zm_bgb_refresh_mint
// Params 0, eflags: 0x2
// Checksum 0xe0bdc005, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_bgb_refresh_mint", &__init__, undefined, "bgb");
}

// Namespace zm_bgb_refresh_mint/zm_bgb_refresh_mint
// Params 0, eflags: 0x1 linked
// Checksum 0xebb22844, Offset: 0xf8
// Size: 0x64
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_refresh_mint", "activated", 1, undefined, undefined, undefined, &activation);
}

// Namespace zm_bgb_refresh_mint/zm_bgb_refresh_mint
// Params 0, eflags: 0x1 linked
// Checksum 0x75455573, Offset: 0x168
// Size: 0x21a
function activation() {
    a_players = util::get_players();
    foreach (player in a_players) {
        var_ac6ee9a0 = player zm_loadout::get_player_lethal_grenade();
        if (var_ac6ee9a0.isgadget) {
            n_slot = player gadgetgetslot(var_ac6ee9a0);
            if (var_ac6ee9a0 == getweapon(#"tomahawk_t8") || var_ac6ee9a0 == getweapon(#"tomahawk_t8_upgraded")) {
                if (!player function_36dfc05f(n_slot)) {
                    player notify(#"hash_3d73720d4588203c");
                    player gadgetpowerset(n_slot, 100);
                }
            } else {
                player gadgetpowerreset(n_slot, 0);
            }
        }
        player thread function_556e219();
        for (i = 0; i < 4; i++) {
            player zm_perks::function_9b641809(i);
        }
        for (i = 0; i < player.var_67ba1237.size; i++) {
            player zm_perks::function_9829d4a9(i);
        }
    }
}

// Namespace zm_bgb_refresh_mint/zm_bgb_refresh_mint
// Params 0, eflags: 0x1 linked
// Checksum 0xe4f7b404, Offset: 0x390
// Size: 0x64
function function_556e219() {
    self endon(#"death");
    if (isdefined(self.var_1f23fe79) && self.var_1f23fe79) {
        self waittill(#"hash_3eaa776332738598");
    }
    self gadgetpowerset(level.var_a53a05b5, 100);
}

