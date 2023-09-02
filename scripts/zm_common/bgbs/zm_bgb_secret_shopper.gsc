// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_bgb_secret_shopper;

// Namespace zm_bgb_secret_shopper/zm_bgb_secret_shopper
// Params 0, eflags: 0x2
// Checksum 0x2563fb1, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_secret_shopper", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_secret_shopper/zm_bgb_secret_shopper
// Params 0, eflags: 0x1 linked
// Checksum 0x394f93de, Offset: 0x108
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_secret_shopper", "time", 600, &enable, &disable, undefined, undefined);
}

// Namespace zm_bgb_secret_shopper/zm_bgb_secret_shopper
// Params 0, eflags: 0x1 linked
// Checksum 0xe284e212, Offset: 0x188
// Size: 0x54
function enable() {
    self endon(#"disconnect", #"bled_out", #"bgb_update");
    level thread function_bdbf3da2(self);
}

// Namespace zm_bgb_secret_shopper/zm_bgb_secret_shopper
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1e8
// Size: 0x4
function disable() {
    
}

// Namespace zm_bgb_secret_shopper/zm_bgb_secret_shopper
// Params 1, eflags: 0x1 linked
// Checksum 0x5459abfc, Offset: 0x1f8
// Size: 0x20e
function function_bdbf3da2(player) {
    self notify("6daba2448119ac03");
    self endon("6daba2448119ac03");
    player endon(#"bgb_update", #"disconnect");
    while (1) {
        is_melee = player meleebuttonpressed();
        if (!is_melee) {
            waitframe(1);
            continue;
        }
        if (!isdefined(player.useholdent)) {
            waitframe(1);
            continue;
        }
        if (player.useholdent.targetname !== "weapon_upgrade") {
            waitframe(1);
            continue;
        }
        if (!player bgb::is_enabled(#"zm_bgb_secret_shopper")) {
            waitframe(1);
            continue;
        }
        if (player isswitchingweapons()) {
            waitframe(1);
            continue;
        }
        w_current = player.currentweapon;
        if (isdefined(w_current.ammoregen) && w_current.ammoregen) {
            waitframe(1);
            continue;
        }
        n_ammo_cost = player zm_weapons::get_ammo_cost_for_weapon(w_current);
        var_67807dc5 = 0;
        if (player zm_score::can_player_purchase(n_ammo_cost)) {
            var_67807dc5 = player zm_weapons::ammo_give(w_current);
        }
        if (var_67807dc5) {
            player zm_score::minus_to_player_score(n_ammo_cost);
            player bgb::do_one_shot_use(1);
        } else {
            player bgb::function_b57e693f();
        }
        waitframe(1);
    }
}

