#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace ct_firebreak_multi_kill;

// Namespace ct_firebreak_multi_kill
// Method(s) 5 Total 12
class cct_firebreak_multi_kill : cluielem {

    // Namespace cct_firebreak_multi_kill/ct_firebreak_multi_kill
    // Params 1, eflags: 0x0
    // Checksum 0x3a18600f, Offset: 0x238
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cct_firebreak_multi_kill/ct_firebreak_multi_kill
    // Params 2, eflags: 0x0
    // Checksum 0xc6761966, Offset: 0x1e8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_firebreak_multi_kill", persistent);
    }

    // Namespace cct_firebreak_multi_kill/ct_firebreak_multi_kill
    // Params 1, eflags: 0x0
    // Checksum 0xf3a7f532, Offset: 0x1b8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace ct_firebreak_multi_kill/ct_firebreak_multi_kill
// Params 1, eflags: 0x0
// Checksum 0x32206d01, Offset: 0xc0
// Size: 0x40
function register(uid) {
    elem = new cct_firebreak_multi_kill();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_firebreak_multi_kill/ct_firebreak_multi_kill
// Params 2, eflags: 0x0
// Checksum 0xeff667d2, Offset: 0x108
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_firebreak_multi_kill/ct_firebreak_multi_kill
// Params 1, eflags: 0x0
// Checksum 0x4a09d81, Offset: 0x148
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_firebreak_multi_kill/ct_firebreak_multi_kill
// Params 1, eflags: 0x0
// Checksum 0x1d173365, Offset: 0x170
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

