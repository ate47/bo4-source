// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_bgb_join_the_party;

// Namespace zm_bgb_join_the_party/zm_bgb_join_the_party
// Params 0, eflags: 0x2
// Checksum 0x2addad88, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_join_the_party", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_join_the_party/zm_bgb_join_the_party
// Params 0, eflags: 0x1 linked
// Checksum 0x253644d3, Offset: 0xf0
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_join_the_party", "activated", 1, undefined, undefined, &validation, &activation);
}

// Namespace zm_bgb_join_the_party/zm_bgb_join_the_party
// Params 0, eflags: 0x1 linked
// Checksum 0x6049c46b, Offset: 0x170
// Size: 0x148
function activation() {
    foreach (player in getplayers()) {
        if (player util::is_spectating()) {
            player thread zm_player::spectator_respawn_player();
        }
        can_revive = 0;
        if (isdefined(level.var_a538e6dc) && self [[ level.var_a538e6dc ]](player, 1, 1)) {
            can_revive = 1;
        } else if (self zm_laststand::can_revive(player, 1, 1)) {
            can_revive = 1;
        }
        if (can_revive) {
            player thread bgb::bgb_revive_watcher();
            player zm_laststand::auto_revive(self);
        }
    }
}

// Namespace zm_bgb_join_the_party/zm_bgb_join_the_party
// Params 0, eflags: 0x1 linked
// Checksum 0xb7a9dfbb, Offset: 0x2c0
// Size: 0x11a
function validation() {
    foreach (player in getplayers()) {
        if (player util::is_spectating()) {
            return 1;
        }
        if (isdefined(player.var_bdeb0f02) && player.var_bdeb0f02) {
            continue;
        }
        if (isdefined(level.var_a538e6dc) && self [[ level.var_a538e6dc ]](player, 1, 1)) {
            return 1;
        }
        if (self zm_laststand::can_revive(player, 1, 1)) {
            return 1;
        }
    }
    return 0;
}

