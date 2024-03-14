// Atian COD Tools GSC decompiler test
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_hms_util;

// Namespace zm_hms_util/zm_hms_util
// Params 0, eflags: 0x2
// Checksum 0xc6fab11e, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_hms_util", &__init__, undefined, undefined);
}

// Namespace zm_hms_util/zm_hms_util
// Params 0, eflags: 0x1 linked
// Checksum 0xbd20b477, Offset: 0xc0
// Size: 0x4c
function __init__() {
    /#
        if (getdvarint(#"hash_79f58c97fc43e423", 0)) {
            callback::on_localplayer_spawned(&function_774b42ac);
        }
    #/
}

// Namespace zm_hms_util/zm_hms_util
// Params 0, eflags: 0x0
// Checksum 0xd91216bd, Offset: 0x118
// Size: 0xa6
function function_774b42ac() {
    /#
        localclientnum = self getlocalclientnumber();
        if (!isdefined(localclientnum)) {
            return;
        }
        while (true) {
            a_ents = getentarray(localclientnum);
            debug2dtext((5, 1035, 0), "<unknown string>" + a_ents.size, (1, 1, 0), 1, (0, 0, 0), 0.5, 1, 30);
            waitframe(30);
        }
    #/
}

