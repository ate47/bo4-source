#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace spectrerisingindicator;

// Namespace spectrerisingindicator
// Method(s) 7 Total 14
class cspectrerisingindicator : cluielem {

    var var_47e79fc;

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1c0d9c0f, Offset: 0x378
    // Size: 0x3c
    function set_isalive(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "isAlive", value);
    }

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1dd15873, Offset: 0x330
    // Size: 0x3c
    function set_clientnum(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "clientnum", value);
    }

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 1, eflags: 0x1 linked
    // Checksum 0x9e112e61, Offset: 0x300
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 2, eflags: 0x1 linked
    // Checksum 0x53f7ad35, Offset: 0x2b0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "SpectreRisingIndicator", persistent);
    }

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1b16609f, Offset: 0x230
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("clientnum", 1, 7, "int");
        cluielem::add_clientfield("isAlive", 1, 1, "int");
    }

}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 1, eflags: 0x1 linked
// Checksum 0xb86bbf16, Offset: 0xd8
// Size: 0x40
function register(uid) {
    elem = new cspectrerisingindicator();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 2, eflags: 0x1 linked
// Checksum 0x4c7439eb, Offset: 0x120
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 1, eflags: 0x1 linked
// Checksum 0xd19b3746, Offset: 0x160
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 1, eflags: 0x1 linked
// Checksum 0x1a0b48db, Offset: 0x188
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 2, eflags: 0x1 linked
// Checksum 0xf82bbd76, Offset: 0x1b0
// Size: 0x28
function set_clientnum(player, value) {
    [[ self ]]->set_clientnum(player, value);
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 2, eflags: 0x1 linked
// Checksum 0x9a235b41, Offset: 0x1e0
// Size: 0x28
function set_isalive(player, value) {
    [[ self ]]->set_isalive(player, value);
}

