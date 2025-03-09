#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace interactive_shot;

// Namespace interactive_shot
// Method(s) 6 Total 13
class cinteractive_shot : cluielem {

    var _uid;

    // Namespace cinteractive_shot/interactive_shot
    // Params 2, eflags: 0x0
    // Checksum 0x74c2bd8, Offset: 0x2c8
    // Size: 0x3c
    function set_text(player, value) {
        player clientfield::function_9bf78ef8(_uid, "text", value);
    }

    // Namespace cinteractive_shot/interactive_shot
    // Params 1, eflags: 0x0
    // Checksum 0xda8c2bdb, Offset: 0x298
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cinteractive_shot/interactive_shot
    // Params 2, eflags: 0x0
    // Checksum 0xd2fcffd1, Offset: 0x248
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "interactive_shot", persistent);
    }

    // Namespace cinteractive_shot/interactive_shot
    // Params 1, eflags: 0x0
    // Checksum 0x68c01ec9, Offset: 0x1f0
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::function_dcb34c80("string", "text", 1);
    }

}

// Namespace interactive_shot/interactive_shot
// Params 1, eflags: 0x0
// Checksum 0xede8cab7, Offset: 0xc8
// Size: 0x40
function register(uid) {
    elem = new cinteractive_shot();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace interactive_shot/interactive_shot
// Params 2, eflags: 0x0
// Checksum 0xfe6e779e, Offset: 0x110
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace interactive_shot/interactive_shot
// Params 1, eflags: 0x0
// Checksum 0x8c391d05, Offset: 0x150
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace interactive_shot/interactive_shot
// Params 1, eflags: 0x0
// Checksum 0x773f2a0b, Offset: 0x178
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace interactive_shot/interactive_shot
// Params 2, eflags: 0x0
// Checksum 0xb5a857d5, Offset: 0x1a0
// Size: 0x28
function set_text(player, value) {
    [[ self ]]->set_text(player, value);
}

