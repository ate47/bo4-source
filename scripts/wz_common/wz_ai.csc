// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace wz_ai;

// Namespace wz_ai/wz_ai
// Params 0, eflags: 0x2
// Checksum 0x7a2ed462, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_ai", &__init__, undefined, undefined);
}

// Namespace wz_ai/wz_ai
// Params 0, eflags: 0x5 linked
// Checksum 0x516d429d, Offset: 0xf8
// Size: 0x94
function private __init__() {
    clientfield::register("vehicle", "enable_on_radar", 1, 1, "int", &function_c85f904d, 1, 1);
    clientfield::register("actor", "enable_on_radar", 1, 1, "int", &function_c85f904d, 1, 1);
}

// Namespace wz_ai/wz_ai
// Params 7, eflags: 0x1 linked
// Checksum 0x12aa450e, Offset: 0x198
// Size: 0x54
function function_c85f904d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self enableonradar();
}

