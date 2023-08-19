// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace clientids;

// Namespace clientids/clientids_shared
// Params 0, eflags: 0x2
// Checksum 0x1c08112c, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"clientids", &__init__, undefined, undefined);
}

// Namespace clientids/clientids_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x77175f0e, Offset: 0xc0
// Size: 0x44
function __init__() {
    callback::on_start_gametype(&init);
    callback::on_connect(&on_player_connect);
}

// Namespace clientids/clientids_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6f31350b, Offset: 0x110
// Size: 0x12
function init() {
    level.clientid = 0;
}

// Namespace clientids/clientids_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x494d5936, Offset: 0x130
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

