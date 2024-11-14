#using scripts\mp_common\item_world_util;
#using scripts\mp_common\item_world;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\struct;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\callbacks_shared;

#namespace namespace_3b8b8298;

// Namespace namespace_3b8b8298/namespace_3b8b8298
// Params 0, eflags: 0x2
// Checksum 0xba11f2fe, Offset: 0xe0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_4fb1e186fac435f4", &__init__, undefined, undefined);
}

// Namespace namespace_3b8b8298/namespace_3b8b8298
// Params 0, eflags: 0x1 linked
// Checksum 0x4f48bdd1, Offset: 0x128
// Size: 0x34
function __init__() {
    level.var_cee10b49 = [];
    callback::on_localclient_connect(&on_localclient_connect);
}

// Namespace namespace_3b8b8298/namespace_3b8b8298
// Params 1, eflags: 0x5 linked
// Checksum 0x285501c8, Offset: 0x168
// Size: 0x74
function private on_localclient_connect(localclientnum) {
    if (isdefined(getgametypesetting(#"wzspectrerising")) && getgametypesetting(#"wzspectrerising")) {
        level thread function_53d906fd(localclientnum);
    }
}

// Namespace namespace_3b8b8298/namespace_3b8b8298
// Params 1, eflags: 0x5 linked
// Checksum 0x2c483cfc, Offset: 0x1e8
// Size: 0x2cc
function private function_53d906fd(localclientnum) {
    level endon(#"game_ended");
    while (true) {
        player = function_5c10bd79(localclientnum);
        show_fx = level clientfield::get("showSpectreSwordBeams");
        if (isdefined(level.var_5b2a8d88) && isdefined(player)) {
            foreach (i, playfx in level.var_5b2a8d88) {
                if (show_fx) {
                    if (item_world_util::function_2c7fc531(i)) {
                        point = function_b1702735(i);
                        if (isdefined(point) && isdefined(point.itementry) && point.itementry.name === #"sig_blade_wz_item") {
                            point function_6b5dfd6c(localclientnum, playfx, 0, i, player);
                        } else {
                            level function_6b5dfd6c(localclientnum, 0, 0, i, player);
                        }
                    } else if (item_world_util::function_da09de95(i)) {
                        if (isdefined(level.item_spawn_drops[i]) && isdefined(level.item_spawn_drops[i].itementry) && level.item_spawn_drops[i].itementry.name === #"sig_blade_wz_item") {
                            level.item_spawn_drops[i] function_6b5dfd6c(localclientnum, playfx, 1, i);
                        } else {
                            level function_6b5dfd6c(localclientnum, 0, 1, i, player);
                        }
                    }
                    continue;
                }
                level function_6b5dfd6c(localclientnum, 0, 0, i, player);
            }
        }
        wait 0.2;
    }
}

// Namespace namespace_3b8b8298/namespace_3b8b8298
// Params 5, eflags: 0x1 linked
// Checksum 0x2be431fa, Offset: 0x4c0
// Size: 0x4ac
function function_6b5dfd6c(localclientnum, playfx, var_484cae2, id, player) {
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(player.var_c1c8ef9c)) {
        player.var_c1c8ef9c = [];
    }
    if (playfx) {
        if (!isdefined(player.var_c1c8ef9c[id])) {
            player.var_c1c8ef9c[id] = {#var_9d888717:0, #fx_id:0, #fxent:undefined};
            if (var_484cae2) {
                player.var_c1c8ef9c[id].var_9d888717 = 1;
                player.var_c1c8ef9c[id].fxent = spawn(localclientnum, self.origin, "script_model");
                player.var_c1c8ef9c[id].fxent setmodel("tag_origin");
                player.var_c1c8ef9c[id].fxent linkto(self);
                player.var_c1c8ef9c[id].fx_id = function_239993de(localclientnum, #"hash_3235e29f5bf57d5a", player.var_c1c8ef9c[id].fxent, "tag_origin");
            } else {
                player.var_c1c8ef9c[id].var_9d888717 = 1;
                player.var_c1c8ef9c[id].fx_id = playfx(localclientnum, #"hash_3235e29f5bf57d5a", self.origin);
            }
        } else if (!(isdefined(player.var_c1c8ef9c[id].var_9d888717) && player.var_c1c8ef9c[id].var_9d888717)) {
            if (var_484cae2) {
                player.var_c1c8ef9c[id].var_9d888717 = 1;
                player.var_c1c8ef9c[id].fxent = spawn(localclientnum, self.origin, "script_model");
                player.var_c1c8ef9c[id].fxent setmodel("tag_origin");
                player.var_c1c8ef9c[id].fxent linkto(self);
                player.var_c1c8ef9c[id].fx_id = function_239993de(localclientnum, #"hash_3235e29f5bf57d5a", player.var_c1c8ef9c[id].fxent, "tag_origin");
            } else {
                player.var_c1c8ef9c[id].var_9d888717 = 1;
                player.var_c1c8ef9c[id].fx_id = playfx(localclientnum, #"hash_3235e29f5bf57d5a", self.origin);
            }
        }
        return;
    }
    if (isdefined(player.var_c1c8ef9c[id]) && isdefined(player.var_c1c8ef9c[id].fx_id)) {
        stopfx(localclientnum, player.var_c1c8ef9c[id].fx_id);
        if (isdefined(player.var_c1c8ef9c[id].fxent)) {
            player.var_c1c8ef9c[id].fxent delete();
        }
        player.var_c1c8ef9c[id] = undefined;
    }
}

