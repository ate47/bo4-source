// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace counteruav;

// Namespace counteruav/counteruav
// Params 0, eflags: 0x2
// Checksum 0x532a54b4, Offset: 0xa8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"counteruav", &__init__, undefined, #"killstreaks");
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x0
// Checksum 0x4cbaf8a5, Offset: 0xf8
// Size: 0x5a
function __init__() {
    clientfield::register("toplayer", "counteruav", 1, 1, "int", &counteruavchanged, 0, 1);
    level.var_8c4291cb = [];
}

// Namespace counteruav/counteruav
// Params 7, eflags: 0x0
// Checksum 0x95c1f610, Offset: 0x160
// Size: 0x11e
function counteruavchanged(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    player = function_5c10bd79(localclientnum);
    /#
        assert(isdefined(player));
    #/
    player setenemyglobalscrambler(newval);
    if (isdefined(level.var_8c4291cb[localclientnum])) {
        function_d48752e(localclientnum, level.var_8c4291cb[localclientnum], 1);
        localclientnum = [];
    }
    if (newval) {
        level.var_8c4291cb[localclientnum] = function_604c9983(localclientnum, "mpl_cuav_static");
    }
}

