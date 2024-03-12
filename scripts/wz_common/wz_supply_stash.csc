// Atian COD Tools GSC decompiler test
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\flagsys_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace wz_supply_stash;

// Namespace wz_supply_stash/wz_supply_stash
// Params 0, eflags: 0x2
// Checksum 0x61612cb2, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_supply_stash", &__init__, undefined, undefined);
}

// Namespace wz_supply_stash/wz_supply_stash
// Params 0, eflags: 0x0
// Checksum 0x1308362f, Offset: 0x160
// Size: 0x34
function __init__() {
    level.var_cee10b49 = [];
    callback::on_localclient_connect(&on_localclient_connect);
}

// Namespace wz_supply_stash/wz_supply_stash
// Params 1, eflags: 0x4
// Checksum 0x2bde5eb2, Offset: 0x1a0
// Size: 0x124
function private on_localclient_connect(localclientnum) {
    if (isdefined(getgametypesetting(#"wzenablebountyhuntervehicles")) && getgametypesetting(#"wzenablebountyhuntervehicles") || isdefined(getgametypesetting(#"hash_23e09b48546a7e3b")) && getgametypesetting(#"hash_23e09b48546a7e3b")) {
        level thread function_53d906fd(localclientnum);
        return;
    }
    if (isdefined(getgametypesetting("infectionMode")) && getgametypesetting("infectionMode")) {
        level thread function_fd3f6235(localclientnum);
    }
}

// Namespace wz_supply_stash/wz_supply_stash
// Params 1, eflags: 0x4
// Checksum 0x6c428957, Offset: 0x2d0
// Size: 0x2bc
function private function_53d906fd(localclientnum) {
    while (1) {
        player = function_5c10bd79(localclientnum);
        playfx = 0;
        if (isdefined(player) && isalive(player)) {
            vehicle = getplayervehicle(player);
            playfx = isdefined(vehicle) && vehicle.scriptvehicletype === "player_muscle";
        }
        foreach (stash in level.item_spawn_stashes) {
            if (function_8a8a409b(stash)) {
                if (stash.var_aa9f8f87 === #"supply_stash_parent_dlc1" || stash.var_aa9f8f87 === #"supply_stash_parent") {
                    stash update_fx(localclientnum, playfx, function_ffdbe8c2(stash));
                }
            }
        }
        foreach (drop in level.var_624588d5) {
            if (isdefined(drop) && isdefined(drop.var_3a55f5cf) && drop.var_3a55f5cf) {
                state = 0;
                if (drop getanimtime("p8_fxanim_wz_supply_stash_04_used_anim") > 0) {
                    state = 2;
                } else if (drop getanimtime("p8_fxanim_wz_supply_stash_04_open_anim") > 0) {
                    state = 1;
                }
                drop update_fx(localclientnum, playfx, state);
            }
        }
        wait(0.2);
    }
}

// Namespace wz_supply_stash/wz_supply_stash
// Params 1, eflags: 0x4
// Checksum 0x24d5c1c7, Offset: 0x598
// Size: 0x19c
function private function_fd3f6235(localclientnum) {
    while (1) {
        player = function_5c10bd79(localclientnum);
        playfx = 0;
        if (player clientfield::get_to_player("infected") != 1) {
            playfx = 1;
        }
        foreach (drop in level.var_624588d5) {
            if (isdefined(drop) && isdefined(drop.var_3a55f5cf) && drop.var_3a55f5cf) {
                state = 0;
                if (drop getanimtime("p8_fxanim_wz_supply_stash_04_used_anim") > 0) {
                    state = 2;
                } else if (drop getanimtime("p8_fxanim_wz_supply_stash_04_open_anim") > 0) {
                    state = 1;
                }
                drop update_fx(localclientnum, playfx, state);
            }
        }
        wait(0.2);
    }
}

// Namespace wz_supply_stash/wz_supply_stash
// Params 3, eflags: 0x0
// Checksum 0x31e3e982, Offset: 0x740
// Size: 0xae
function update_fx(localclientnum, playfx, state) {
    if (playfx && state == 0) {
        if (!isdefined(self.var_d3d42148)) {
            self.var_d3d42148 = playfx(localclientnum, #"hash_6bcc939010112ea", self.origin);
        }
        return;
    }
    if (isdefined(self.var_d3d42148)) {
        stopfx(localclientnum, self.var_d3d42148);
        self.var_d3d42148 = undefined;
    }
}

