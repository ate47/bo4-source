#using script_cb32d07c95e5628;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_f0884ae5;

// Namespace namespace_f0884ae5/namespace_1d9375fc
// Params 2, eflags: 0x1 linked
// Checksum 0xf7994eff, Offset: 0x80
// Size: 0x8c
function setup(seedvalue, reset = 1) {
    if (!namespace_65181344::is_enabled()) {
        return;
    }
    function_1f4464c0(seedvalue);
    if (reset) {
        level callback::callback(#"hash_11bd48298bde44a4", undefined);
    }
    namespace_65181344::setup_groups(reset);
}

