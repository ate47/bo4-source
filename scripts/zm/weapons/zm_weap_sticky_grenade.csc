// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/math_shared.csc;
#include scripts/core_common/struct.csc;

#namespace sticky_grenade;

// Namespace sticky_grenade/zm_weap_sticky_grenade
// Params 0, eflags: 0x2
// Checksum 0x51280699, Offset: 0xb0
// Size: 0x34
function autoexec __init__system__() {
    system::register(#"sticky_grenade", undefined, &__main__, undefined);
}

// Namespace sticky_grenade/zm_weap_sticky_grenade
// Params 0, eflags: 0x1 linked
// Checksum 0x425605af, Offset: 0xf0
// Size: 0x32
function __main__() {
    level._effect[#"grenade_light"] = #"weapon/fx8_equip_light_os";
}

// Namespace sticky_grenade/zm_weap_sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0xce8d4ad6, Offset: 0x130
// Size: 0x3c
function spawned(localclientnum) {
    if (self isgrenadedud()) {
        return;
    }
    self thread fx_think(localclientnum);
}

// Namespace sticky_grenade/zm_weap_sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x25c6241, Offset: 0x178
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
        util::server_wait(localclientnum, interval, 0.01, "player_switch");
        interval = math::clamp(interval / 1.2, 0.08, 0.3);
    }
}

// Namespace sticky_grenade/zm_weap_sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x54299ba3, Offset: 0x2b8
// Size: 0x4a
function start_light_fx(localclientnum) {
    self.fx = util::playfxontag(localclientnum, level._effect[#"grenade_light"], self, "tag_fx");
}

// Namespace sticky_grenade/zm_weap_sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x18536842, Offset: 0x310
// Size: 0x4e
function stop_light_fx(localclientnum) {
    if (isdefined(self.fx) && self.fx != 0) {
        stopfx(localclientnum, self.fx);
        self.fx = undefined;
    }
}

// Namespace sticky_grenade/zm_weap_sticky_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0xc81d2770, Offset: 0x368
// Size: 0xc4
function fullscreen_fx(localclientnum) {
    if (function_1cbf351b(localclientnum)) {
        return;
    } else if (util::is_player_view_linked_to_entity(localclientnum)) {
        return;
    }
    if (self function_e9fc6a64()) {
        return;
    }
    parent = self getparententity();
    if (isdefined(parent) && parent function_21c0fa55()) {
        parent playrumbleonentity(localclientnum, "buzz_high");
    }
}

