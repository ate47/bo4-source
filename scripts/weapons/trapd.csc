// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace trapd;

// Namespace trapd/trapd
// Params 0, eflags: 0x2
// Checksum 0x8966b341, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"trapd", &__init__, undefined, undefined);
}

// Namespace trapd/trapd
// Params 0, eflags: 0x0
// Checksum 0xe712f420, Offset: 0xe8
// Size: 0x64
function __init__() {
    callback::add_weapon_type(#"mine_trapd", &function_9f6d38cf);
    callback::add_weapon_type(#"claymore_trapd", &function_9f6d38cf);
}

// Namespace trapd/trapd
// Params 1, eflags: 0x0
// Checksum 0x1b84f2a0, Offset: 0x158
// Size: 0x24
function function_9f6d38cf(localclientnum) {
    self thread fx_think(localclientnum);
}

// Namespace trapd/trapd
// Params 1, eflags: 0x0
// Checksum 0xf5cc7f15, Offset: 0x188
// Size: 0xf8
function fx_think(localclientnum) {
    self notify(#"light_disable");
    self endon(#"light_disable");
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    for (;;) {
        self stop_light_fx(localclientnum);
        localplayer = function_5c10bd79(localclientnum);
        self start_light_fx(localclientnum);
        util::server_wait(localclientnum, 0.3, 0.01, "player_switch");
        self util::waittill_dobj(localclientnum);
    }
}

// Namespace trapd/trapd
// Params 1, eflags: 0x0
// Checksum 0xf5c615ef, Offset: 0x288
// Size: 0x4a
function start_light_fx(localclientnum) {
    self.fx = util::playfxontag(localclientnum, level._effect[#"grenade_light"], self, "tag_fx");
}

// Namespace trapd/trapd
// Params 1, eflags: 0x0
// Checksum 0xa515550d, Offset: 0x2e0
// Size: 0x4e
function stop_light_fx(localclientnum) {
    if (isdefined(self.fx) && self.fx != 0) {
        stopfx(localclientnum, self.fx);
        self.fx = undefined;
    }
}

