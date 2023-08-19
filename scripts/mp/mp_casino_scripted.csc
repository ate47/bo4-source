// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace mp_casino_scripted;

// Namespace mp_casino_scripted/mp_casino_scripted
// Params 0, eflags: 0x2
// Checksum 0x1c5e0727, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_casino_scripted", &__init__, undefined, undefined);
}

// Namespace mp_casino_scripted/mp_casino_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xf3740068, Offset: 0xc0
// Size: 0x44
function __init__() {
    callback::on_gameplay_started(&on_gameplay_started);
    callback::on_end_game(&on_end_game);
}

// Namespace mp_casino_scripted/mp_casino_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0xe62bf29e, Offset: 0x110
// Size: 0x24
function on_gameplay_started(localclientnum) {
    level thread function_5a9c338e(localclientnum);
}

// Namespace mp_casino_scripted/mp_casino_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0xa369f310, Offset: 0x140
// Size: 0x250
function function_5a9c338e(localclientnum) {
    level endon(#"hash_d5c5c322d0ccf8");
    var_377722d[0] = (33, -1286, 292);
    var_377722d[1] = (477, -919, 297);
    var_377722d[2] = (-434, -961, 309);
    a_str_lines = array(#"hash_27b25c569e7a0e52", #"hash_27b25d569e7a1005", #"hash_27b25a569e7a0aec", #"hash_27b25b569e7a0c9f", #"hash_27b258569e7a0786", #"hash_27b259569e7a0939", #"hash_27b256569e7a0420", #"hash_27b257569e7a05d3", #"hash_27b264569e7a1bea", #"hash_27b265569e7a1d9d", #"hash_6e24cf2f49698a0f");
    wait(8);
    foreach (line in a_str_lines) {
        foreach (var_cca85da in var_377722d) {
            playsound(localclientnum, line, var_cca85da);
        }
        wait(randomfloatrange(35, 45));
    }
}

// Namespace mp_casino_scripted/mp_casino_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0xdb84fe40, Offset: 0x398
// Size: 0x20
function on_end_game(localclientnum) {
    level notify(#"hash_d5c5c322d0ccf8");
}

