// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace prototype_defend_timer;

// Namespace prototype_defend_timer
// Method(s) 5 Total 12
class cprototype_defend_timer : cluielem {

    // Namespace cprototype_defend_timer/prototype_defend_timer
    // Params 1, eflags: 0x0
    // Checksum 0x626b8e2b, Offset: 0x238
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cprototype_defend_timer/prototype_defend_timer
    // Params 2, eflags: 0x0
    // Checksum 0x8d1b3fab, Offset: 0x1e8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "prototype_defend_timer", persistent);
    }

    // Namespace cprototype_defend_timer/prototype_defend_timer
    // Params 1, eflags: 0x0
    // Checksum 0x411c30da, Offset: 0x1b8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace prototype_defend_timer/prototype_defend_timer
// Params 1, eflags: 0x0
// Checksum 0x35260454, Offset: 0xc0
// Size: 0x40
function register(uid) {
    elem = new cprototype_defend_timer();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace prototype_defend_timer/prototype_defend_timer
// Params 2, eflags: 0x0
// Checksum 0x964a7991, Offset: 0x108
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace prototype_defend_timer/prototype_defend_timer
// Params 1, eflags: 0x0
// Checksum 0x6d8a90e9, Offset: 0x148
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace prototype_defend_timer/prototype_defend_timer
// Params 1, eflags: 0x0
// Checksum 0x7af12fc4, Offset: 0x170
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

