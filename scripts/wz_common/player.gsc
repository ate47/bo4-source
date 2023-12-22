// Atian COD Tools GSC decompiler test
#using scripts\mp_common\item_supply_drop.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace wz_player;

// Namespace wz_player/player
// Params 0, eflags: 0x2
// Checksum 0xc4fbe99d, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_player", &__init__, undefined, undefined);
}

// Namespace wz_player/player
// Params 0, eflags: 0x1 linked
// Checksum 0x83b4b058, Offset: 0xc8
// Size: 0x24
function __init__() {
    callback::on_spawned(&on_player_spawned);
}

// Namespace wz_player/player
// Params 0, eflags: 0x1 linked
// Checksum 0x34345af, Offset: 0xf8
// Size: 0x24
function on_player_spawned() {
    self callback::on_grenade_fired(&on_grenade_fired);
}

// Namespace wz_player/player
// Params 1, eflags: 0x1 linked
// Checksum 0x4d69926e, Offset: 0x128
// Size: 0xfa
function on_grenade_fired(params) {
    grenade = params.projectile;
    weapon = params.weapon;
    switch (weapon.name) {
    case #"flare_gun":
        grenade function_4861487f(weapon, self);
        grenade thread function_cd8ee3c5();
        break;
    case #"flare_gun_veh":
        grenade function_4861487f(weapon, self);
        grenade thread function_f3edce9a();
    default:
        break;
    }
}

// Namespace wz_player/player
// Params 2, eflags: 0x1 linked
// Checksum 0x5faa724f, Offset: 0x230
// Size: 0x56
function function_4861487f(weapon, player) {
    if (!isdefined(self)) {
        return;
    }
    if (!self grenade_safe_to_throw(player, weapon)) {
        self thread makegrenadedudanddestroy();
        return;
    }
}

// Namespace wz_player/player
// Params 0, eflags: 0x1 linked
// Checksum 0xffe0fc7, Offset: 0x290
// Size: 0x124
function function_cd8ee3c5() {
    self endon(#"grenade_dud");
    waitresult = undefined;
    waitresult = self waittill(#"explode", #"death");
    if (waitresult._notify == #"explode") {
        trace = groundtrace(waitresult.position, waitresult.position + vectorscale((0, 0, -1), 20000), 0, self, 0);
        if (isdefined(trace[#"position"]) && trace[#"surfacetype"] != #"none") {
            org = trace[#"position"];
            item_supply_drop::drop_supply_drop(org, 1);
        }
    }
}

// Namespace wz_player/player
// Params 0, eflags: 0x1 linked
// Checksum 0x1eda065e, Offset: 0x3c0
// Size: 0x1cc
function function_f3edce9a() {
    self endon(#"grenade_dud");
    waitresult = undefined;
    waitresult = self waittill(#"explode", #"death");
    if (waitresult._notify == #"explode") {
        position = isdefined(waitresult.position) ? waitresult.position : waitresult.attacker.origin;
        trace = groundtrace(position, position + vectorscale((0, 0, -1), 20000), 0, self, 0);
        if (isdefined(trace[#"position"]) && trace[#"surfacetype"] != #"none") {
            org = trace[#"position"];
            vehicletypes = array(#"vehicle_t8_mil_tank_wz_black", #"vehicle_t8_mil_tank_wz_green", #"vehicle_t8_mil_tank_wz_grey", #"vehicle_t8_mil_tank_wz_tan");
            item_supply_drop::drop_supply_drop(org, 1, 1, vehicletypes[randomint(vehicletypes.size)]);
        }
    }
}

// Namespace wz_player/player
// Params 2, eflags: 0x1 linked
// Checksum 0xe49c317b, Offset: 0x598
// Size: 0x18
function grenade_safe_to_throw(player, weapon) {
    return 1;
}

// Namespace wz_player/player
// Params 0, eflags: 0x1 linked
// Checksum 0x124a5fc8, Offset: 0x5b8
// Size: 0x64
function makegrenadedudanddestroy() {
    self endon(#"death");
    self notify(#"grenade_dud");
    self makegrenadedud();
    wait(3);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace wz_player/player
// Params 3, eflags: 0x0
// Checksum 0xb5186428, Offset: 0x628
// Size: 0x84
function debug_star(origin, seconds, color) {
    /#
        if (!isdefined(seconds)) {
            seconds = 1;
        }
        if (!isdefined(color)) {
            color = (1, 0, 0);
        }
        frames = int(20 * seconds);
        debugstar(origin, frames, color);
    #/
}

