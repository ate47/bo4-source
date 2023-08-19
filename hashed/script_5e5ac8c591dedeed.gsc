// Atian COD Tools GSC decompiler test
#include script_68c78107b4aa059c;
#include scripts/core_common/struct.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace namespace_f0884ae5;

// Namespace namespace_f0884ae5/namespace_1d9375fc
// Params 3, eflags: 0x1 linked
// Checksum 0xaca18e52, Offset: 0x80
// Size: 0xa4
function setup(localclientnum, var_582cb7bb, reset = 1) {
    if (!namespace_65181344::is_enabled()) {
        return;
    }
    level.var_8c615e33 = [];
    function_1f4464c0(var_582cb7bb);
    if (reset) {
        level callback::callback(#"hash_11bd48298bde44a4", undefined);
    }
    namespace_65181344::setup_groups(reset);
}

