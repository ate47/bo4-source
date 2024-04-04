// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace self_revive_visuals;

// Namespace self_revive_visuals
// Method(s) 7 Total 14
class cself_revive_visuals : cluielem {

    var var_47e79fc;

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 2, eflags: 0x1 linked
    // Checksum 0x23eb0acd, Offset: 0x398
    // Size: 0x3c
    function set_revive_progress(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "revive_progress", value);
    }

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 2, eflags: 0x1 linked
    // Checksum 0x33f62f01, Offset: 0x350
    // Size: 0x3c
    function set_self_revive_progress_bar_fill(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "self_revive_progress_bar_fill", value);
    }

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbcf2a8d, Offset: 0x320
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 2, eflags: 0x1 linked
    // Checksum 0x49a803cc, Offset: 0x2d0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "self_revive_visuals", persistent);
    }

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa6d220ab, Offset: 0x250
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("self_revive_progress_bar_fill", 1, 5, "float");
        cluielem::add_clientfield("revive_progress", 1, 5, "float");
    }

}

// Namespace self_revive_visuals/self_revive_visuals
// Params 1, eflags: 0x1 linked
// Checksum 0xdf881ca3, Offset: 0xf8
// Size: 0x40
function register(uid) {
    elem = new cself_revive_visuals();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 2, eflags: 0x1 linked
// Checksum 0x4a4e4b04, Offset: 0x140
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 1, eflags: 0x1 linked
// Checksum 0x90839abf, Offset: 0x180
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 1, eflags: 0x0
// Checksum 0x941631a6, Offset: 0x1a8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 2, eflags: 0x0
// Checksum 0x2e311f5, Offset: 0x1d0
// Size: 0x28
function set_self_revive_progress_bar_fill(player, value) {
    [[ self ]]->set_self_revive_progress_bar_fill(player, value);
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 2, eflags: 0x1 linked
// Checksum 0xbc271f56, Offset: 0x200
// Size: 0x28
function set_revive_progress(player, value) {
    [[ self ]]->set_revive_progress(player, value);
}

