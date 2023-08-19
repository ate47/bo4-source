// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace zm_office_debris_buys;

// Namespace zm_office_debris_buys/zm_office_debris_buys
// Params 0, eflags: 0x2
// Checksum 0x2bd2c8ee, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_office_debris_buys", &init, undefined, undefined);
}

// Namespace zm_office_debris_buys/zm_office_debris_buys
// Params 0, eflags: 0x1 linked
// Checksum 0xb0629edb, Offset: 0xf8
// Size: 0x5c
function init() {
    clientfield::register("zbarrier", "" + #"hash_7e15d8abc4d6c79a", 1, 1, "int", &function_32f95e3f, 0, 0);
}

// Namespace zm_office_debris_buys/zm_office_debris_buys
// Params 7, eflags: 0x1 linked
// Checksum 0x9583b5a3, Offset: 0x160
// Size: 0x126
function function_32f95e3f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        for (i = 0; i < self getnumzbarrierpieces(); i++) {
            var_a6b8d2c2 = self zbarriergetpiece(i);
            var_a6b8d2c2 playrenderoverridebundle("rob_zm_office_debris_clear");
        }
    } else {
        for (i = 0; i < self getnumzbarrierpieces(); i++) {
            var_a6b8d2c2 = self zbarriergetpiece(i);
            var_a6b8d2c2 stoprenderoverridebundle("rob_zm_office_debris_clear");
        }
    }
}

