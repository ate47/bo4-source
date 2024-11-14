#using scripts\core_common\lui_shared;

#namespace bountyhunterbuy;

// Namespace bountyhunterbuy
// Method(s) 6 Total 12
class cbountyhunterbuy : cluielem {

    // Namespace cbountyhunterbuy/bountyhunterbuy
    // Params 1, eflags: 0x0
    // Checksum 0x7fd1aba6, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"bountyhunterbuy");
    }

    // Namespace cbountyhunterbuy/bountyhunterbuy
    // Params 1, eflags: 0x0
    // Checksum 0x4b8940ad, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace cbountyhunterbuy/bountyhunterbuy
    // Params 1, eflags: 0x0
    // Checksum 0xaa0c1b60, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cbountyhunterbuy/bountyhunterbuy
    // Params 1, eflags: 0x0
    // Checksum 0xae47eba5, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace bountyhunterbuy/bountyhunterbuy
// Params 1, eflags: 0x0
// Checksum 0x55dfb1e7, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new cbountyhunterbuy();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace bountyhunterbuy/bountyhunterbuy
// Params 1, eflags: 0x0
// Checksum 0x9e262003, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new cbountyhunterbuy();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace bountyhunterbuy/bountyhunterbuy
// Params 1, eflags: 0x0
// Checksum 0xf3588e57, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace bountyhunterbuy/bountyhunterbuy
// Params 1, eflags: 0x0
// Checksum 0x62aa4057, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace bountyhunterbuy/bountyhunterbuy
// Params 1, eflags: 0x0
// Checksum 0x4c981268, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

