// Atian COD Tools GSC decompiler test
#using scripts\zm\perk\zm_perk_widows_wine.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_placeable_mine.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_powerup_full_ammo;

// Namespace zm_powerup_full_ammo/zm_powerup_full_ammo
// Params 0, eflags: 0x2
// Checksum 0x5e99b6c6, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_full_ammo", &__init__, undefined, undefined);
}

// Namespace zm_powerup_full_ammo/zm_powerup_full_ammo
// Params 0, eflags: 0x1 linked
// Checksum 0x8a9622d3, Offset: 0x160
// Size: 0x84
function __init__() {
    zm_powerups::register_powerup("full_ammo", &grab_full_ammo);
    if (zm_powerups::function_cc33adc8()) {
        zm_powerups::add_zombie_powerup("full_ammo", "p7_zm_power_up_max_ammo", #"zombie/powerup_max_ammo", &function_b695b971, 0, 0, 0);
    }
}

// Namespace zm_powerup_full_ammo/zm_powerup_full_ammo
// Params 1, eflags: 0x1 linked
// Checksum 0xc33e2117, Offset: 0x1f0
// Size: 0x8c
function grab_full_ammo(player) {
    if (zm_powerups::function_cfd04802(#"full_ammo")) {
        level thread function_dae1df4d(self, player);
    } else {
        level thread full_ammo_powerup(self, player);
    }
    player thread zm_powerups::powerup_vo("full_ammo");
}

// Namespace zm_powerup_full_ammo/zm_powerup_full_ammo
// Params 2, eflags: 0x1 linked
// Checksum 0xbff3f14b, Offset: 0x288
// Size: 0x2c4
function function_dae1df4d(e_powerup, player) {
    if (isdefined(level.check_player_is_ready_for_ammo)) {
        if ([[ level.check_player_is_ready_for_ammo ]](player) == 0) {
            return;
        }
    }
    a_w_weapons = player getweaponslist(0);
    player.var_655c0753 = undefined;
    player notify(#"zmb_max_ammo");
    player zm_placeable_mine::disable_all_prompts_for_player();
    foreach (w_weapon in a_w_weapons) {
        if (level.headshots_only && zm_loadout::is_lethal_grenade(w_weapon)) {
            continue;
        }
        if (isdefined(level.zombie_include_equipment) && isdefined(level.zombie_include_equipment[w_weapon]) && !(isdefined(level.zombie_equipment[w_weapon].refill_max_ammo) && level.zombie_equipment[w_weapon].refill_max_ammo)) {
            continue;
        }
        if (isdefined(level.zombie_weapons_no_max_ammo) && isdefined(level.zombie_weapons_no_max_ammo[w_weapon.name])) {
            continue;
        }
        if (zm_loadout::is_hero_weapon(w_weapon)) {
            continue;
        }
        if (player hasweapon(w_weapon)) {
            if (zm_loadout::is_lethal_grenade(w_weapon)) {
                player thread function_3ecbd9d(w_weapon);
            } else {
                player zm_weapons::ammo_give(w_weapon, 0);
            }
        }
    }
    if (player hasperk(#"specialty_widowswine")) {
        player zm_perk_widows_wine::reset_charges();
    }
    player playsoundtoplayer(#"zmb_full_ammo", player);
    if (isdefined(e_powerup)) {
        player zm_utility::function_7a35b1d7(e_powerup.hint);
    }
}

// Namespace zm_powerup_full_ammo/zm_powerup_full_ammo
// Params 2, eflags: 0x1 linked
// Checksum 0x7bc6851a, Offset: 0x558
// Size: 0x34c
function full_ammo_powerup(drop_item, player) {
    players = getplayers(player.team);
    if (isdefined(level.var_73345bfd)) {
        players = [[ level.var_73345bfd ]](player);
    }
    level notify(#"zmb_max_ammo_level");
    foreach (player in players) {
        if (isdefined(level.check_player_is_ready_for_ammo)) {
            jumpiffalse([[ level.check_player_is_ready_for_ammo ]](player) == 0) LOC_0000010c;
        } else {
        LOC_0000010c:
            a_w_weapons = player getweaponslist(0);
            player.var_655c0753 = undefined;
            player notify(#"zmb_max_ammo");
            player zm_placeable_mine::disable_all_prompts_for_player();
            foreach (w_weapon in a_w_weapons) {
                if (level.headshots_only && zm_loadout::is_lethal_grenade(w_weapon)) {
                    continue;
                }
                if (isdefined(level.zombie_include_equipment) && isdefined(level.zombie_include_equipment[w_weapon]) && !(isdefined(level.zombie_equipment[w_weapon].refill_max_ammo) && level.zombie_equipment[w_weapon].refill_max_ammo)) {
                    continue;
                }
                if (isdefined(level.zombie_weapons_no_max_ammo) && isdefined(level.zombie_weapons_no_max_ammo[w_weapon.name])) {
                    continue;
                }
                if (zm_loadout::is_hero_weapon(w_weapon)) {
                    continue;
                }
                if (player hasweapon(w_weapon)) {
                    if (zm_loadout::is_lethal_grenade(w_weapon)) {
                        player thread function_3ecbd9d(w_weapon);
                    } else {
                        player zm_weapons::ammo_give(w_weapon, 0);
                    }
                }
            }
            if (player hasperk(#"specialty_widowswine")) {
                player zm_perk_widows_wine::reset_charges();
            }
        }
    }
    level thread full_ammo_on_hud(drop_item, player.team);
}

// Namespace zm_powerup_full_ammo/zm_powerup_full_ammo
// Params 1, eflags: 0x1 linked
// Checksum 0xc19910af, Offset: 0x8b0
// Size: 0x10c
function function_3ecbd9d(w_weapon) {
    self endon(#"disconnect");
    n_slot = self gadgetgetslot(w_weapon);
    if (w_weapon == getweapon(#"tomahawk_t8") || w_weapon == getweapon(#"tomahawk_t8_upgraded")) {
        while (self function_36dfc05f(n_slot)) {
            waitframe(1);
        }
        self notify(#"hash_3d73720d4588203c");
        self gadgetpowerset(n_slot, 100);
    } else {
        self gadgetpowerset(n_slot, 100);
    }
}

// Namespace zm_powerup_full_ammo/zm_powerup_full_ammo
// Params 2, eflags: 0x1 linked
// Checksum 0xfe8030ea, Offset: 0x9c8
// Size: 0x94
function full_ammo_on_hud(drop_item, player_team) {
    players = getplayers(player_team);
    players[0] playsoundtoteam("zmb_full_ammo", player_team);
    if (isdefined(drop_item) && isdefined(drop_item.hint)) {
        level zm_utility::function_7a35b1d7(drop_item.hint);
    }
}

// Namespace zm_powerup_full_ammo/zm_powerup_full_ammo
// Params 0, eflags: 0x1 linked
// Checksum 0x82267f78, Offset: 0xa68
// Size: 0x12
function function_b695b971() {
    return level.zm_genesis_robot_pay_towardsreactswordstart <= 0;
}

