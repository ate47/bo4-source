#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace tracker;

// Namespace tracker/tracker_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x78afeb72, Offset: 0xd8
// Size: 0x8c
function init_shared() {
    register_clientfields();
    level.trackerperk = spawnstruct();
    level.var_c8241070 = &function_c8241070;
    thread function_a7e7bda0();
    level.trackerperk.var_75492b09 = [];
    callback::on_spawned(&onplayerspawned);
}

// Namespace tracker/tracker_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb0ad8cce, Offset: 0x170
// Size: 0x34
function register_clientfields() {
    clientfield::register("clientuimodel", "huditems.isExposedOnMinimap", 1, 1, "int");
}

// Namespace tracker/tracker_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xf667125b, Offset: 0x1b0
// Size: 0x24
function onplayerspawned() {
    self clientfield::set_player_uimodel("huditems.isExposedOnMinimap", 0);
}

// Namespace tracker/tracker_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xdccde482, Offset: 0x1e0
// Size: 0x186
function function_c8241070(player, weapon) {
    if (!isdefined(level.trackerperk.var_75492b09[player.clientid])) {
        level.trackerperk.var_75492b09[player.clientid] = spawnstruct();
    }
    level.trackerperk.var_75492b09[player.clientid].var_80ec1137 = gettime();
    level.trackerperk.var_75492b09[player.clientid].var_2e0b3c25 = player.origin;
    level.trackerperk.var_75492b09[player.clientid].var_2672a259 = weapon;
    level.trackerperk.var_75492b09[player.clientid].var_851de005 = player;
    level.trackerperk.var_75492b09[player.clientid].expiretime = gettime() + float(getdvarint(#"hash_6f3f10e68d2fedba", 0)) / 1000;
}

// Namespace tracker/tracker_shared
// Params 1, eflags: 0x0
// Checksum 0x6a61390f, Offset: 0x370
// Size: 0x18a
function function_43084f6c(player) {
    if (level.teambased) {
        otherteam = util::getotherteam(player.team);
        foreach (var_f53fe24c in getplayers(otherteam)) {
            if (var_f53fe24c function_d210981e(player.origin)) {
                return true;
            }
        }
    } else {
        enemies = getplayers();
        foreach (enemy in enemies) {
            if (enemy == player) {
                continue;
            }
            if (enemy function_d210981e(player.origin)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace tracker/tracker_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb40b09ef, Offset: 0x508
// Size: 0x62
function function_2c77961d(player) {
    if (!isdefined(level.trackerperk.var_75492b09[player.clientid])) {
        return false;
    }
    if (gettime() > level.trackerperk.var_75492b09[player.clientid].expiretime) {
        return false;
    }
    return true;
}

// Namespace tracker/tracker_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xaa6fe56e, Offset: 0x578
// Size: 0xb0
function function_796e0334(player) {
    if (1 && globallogic_player::function_eddea888(player)) {
        return true;
    }
    if (1 && globallogic_player::function_43084f6c(player)) {
        return true;
    }
    if (1 && function_2c77961d(player)) {
        return true;
    }
    if (1 && globallogic_player::function_ce33e204(player)) {
        return true;
    }
    return false;
}

// Namespace tracker/tracker_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x3047d9b5, Offset: 0x630
// Size: 0x1c0
function function_a7e7bda0() {
    if (getgametypesetting(#"hardcoremode")) {
        return;
    }
    while (true) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (!player hasperk(#"specialty_detectedicon")) {
                continue;
            }
            if (function_796e0334(player)) {
                if (!isdefined(player.var_7241f6e3)) {
                    player.var_7241f6e3 = gettime() + 100;
                }
                if (player.var_7241f6e3 <= gettime()) {
                    player clientfield::set_player_uimodel("huditems.isExposedOnMinimap", 1);
                    player.var_99811216 = gettime() + 100;
                }
                continue;
            }
            if (isdefined(player.var_99811216) && gettime() > player.var_99811216 && player clientfield::get_player_uimodel("huditems.isExposedOnMinimap")) {
                player clientfield::set_player_uimodel("huditems.isExposedOnMinimap", 0);
                player.var_7241f6e3 = undefined;
            }
        }
        wait 0.1;
    }
}

