// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace clientids;

// Namespace clientids/clientids
// Params 0, eflags: 0x2
// Checksum 0x7c47e173, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"clientids", &__init__, undefined, undefined);
}

// Namespace clientids/clientids
// Params 0, eflags: 0x1 linked
// Checksum 0xb3d058f7, Offset: 0xc8
// Size: 0x44
function __init__() {
    callback::on_start_gametype(&init);
    callback::on_connect(&on_player_connect);
}

// Namespace clientids/clientids
// Params 0, eflags: 0x1 linked
// Checksum 0x1ece2313, Offset: 0x118
// Size: 0x12
function init() {
    level.clientid = 0;
}

// Namespace clientids/clientids
// Params 0, eflags: 0x1 linked
// Checksum 0xe32d0c6, Offset: 0x138
// Size: 0x9c
function on_player_connect() {
    self.clientid = matchrecordnewplayer(self);
    if (!isdefined(self.clientid) || self.clientid == -1) {
        self.clientid = level.clientid;
        level.clientid++;
    }
    /#
        println("<unknown string>" + self.name + "<unknown string>" + self.clientid);
    #/
}

