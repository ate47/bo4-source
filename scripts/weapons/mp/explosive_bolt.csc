// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/math_shared.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace explosive_bolt;

// Namespace explosive_bolt/explosive_bolt
// Params 0, eflags: 0x2
// Checksum 0x3a91df19, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"explosive_bolt", &__init__, undefined, undefined);
}

// Namespace explosive_bolt/explosive_bolt
// Params 0, eflags: 0x1 linked
// Checksum 0x819cce11, Offset: 0x100
// Size: 0x64
function __init__() {
    level._effect[#"hash_15c48c730d20d9ee"] = #"weapon/fx8_equip_light_os";
    callback::add_weapon_type(#"explosive_bolt", &spawned);
}

// Namespace explosive_bolt/explosive_bolt
// Params 1, eflags: 0x1 linked
// Checksum 0x841e1b0b, Offset: 0x170
// Size: 0x3c
function spawned(localclientnum) {
    if (self isgrenadedud()) {
        return;
    }
    self thread fx_think(localclientnum);
}

// Namespace explosive_bolt/explosive_bolt
// Params 1, eflags: 0x1 linked
// Checksum 0x4c5f0e3, Offset: 0x1b8
// Size: 0x132
function fx_think(localclientnum) {
    self notify(#"light_disable");
    self endon(#"death");
    self endon(#"light_disable");
    self util::waittill_dobj(localclientnum);
    interval = 0.3;
    for (;;) {
        self stop_light_fx(localclientnum);
        self start_light_fx(localclientnum);
        self fullscreen_fx(localclientnum);
        self playsound(localclientnum, #"wpn_semtex_alert");
        util::server_wait(localclientnum, interval, 0.016, "player_switch");
        interval = math::clamp(interval / 1.2, 0.08, 0.3);
    }
}

// Namespace explosive_bolt/explosive_bolt
// Params 1, eflags: 0x1 linked
// Checksum 0x3ba37d8d, Offset: 0x2f8
// Size: 0x4a
function start_light_fx(localclientnum) {
    self.fx = util::playfxontag(localclientnum, level._effect[#"hash_15c48c730d20d9ee"], self, "tag_origin");
}

// Namespace explosive_bolt/explosive_bolt
// Params 1, eflags: 0x1 linked
// Checksum 0x34317a36, Offset: 0x350
// Size: 0x4e
function stop_light_fx(localclientnum) {
    if (isdefined(self.fx) && self.fx != 0) {
        stopfx(localclientnum, self.fx);
        self.fx = undefined;
    }
}

// Namespace explosive_bolt/explosive_bolt
// Params 1, eflags: 0x1 linked
// Checksum 0xe5a9c980, Offset: 0x3a8
// Size: 0xbc
function fullscreen_fx(localclientnum) {
    if (function_1cbf351b(localclientnum)) {
        return;
    }
    if (util::is_player_view_linked_to_entity(localclientnum)) {
        return;
    }
    if (self function_4e0ca360()) {
        return;
    }
    parent = self getparententity();
    if (isdefined(parent) && parent function_21c0fa55()) {
        parent playrumbleonentity(localclientnum, "buzz_high");
    }
}

