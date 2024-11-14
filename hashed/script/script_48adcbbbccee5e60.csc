#using scripts\core_common\lui_shared;

#namespace interactive_shot;

// Namespace interactive_shot
// Method(s) 7 Total 13
class cinteractive_shot : cluielem {

    // Namespace cinteractive_shot/interactive_shot
    // Params 2, eflags: 0x0
    // Checksum 0xe9b23de4, Offset: 0x338
    // Size: 0x30
    function set_text(localclientnum, value) {
        set_data(localclientnum, "text", value);
    }

    // Namespace cinteractive_shot/interactive_shot
    // Params 1, eflags: 0x0
    // Checksum 0x7df4f754, Offset: 0x300
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"interactive_shot");
    }

    // Namespace cinteractive_shot/interactive_shot
    // Params 1, eflags: 0x0
    // Checksum 0x2dd4505b, Offset: 0x2a8
    // Size: 0x4c
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "text", #"");
    }

    // Namespace cinteractive_shot/interactive_shot
    // Params 1, eflags: 0x0
    // Checksum 0xf9634ff2, Offset: 0x278
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cinteractive_shot/interactive_shot
    // Params 2, eflags: 0x0
    // Checksum 0x50edb24e, Offset: 0x218
    // Size: 0x54
    function setup_clientfields(uid, textcallback) {
        cluielem::setup_clientfields(uid);
        cluielem::function_dcb34c80("string", "text", 1);
    }

}

// Namespace interactive_shot/interactive_shot
// Params 2, eflags: 0x0
// Checksum 0x30b9ac25, Offset: 0xb0
// Size: 0x4c
function register(uid, textcallback) {
    elem = new cinteractive_shot();
    [[ elem ]]->setup_clientfields(uid, textcallback);
    return elem;
}

// Namespace interactive_shot/interactive_shot
// Params 1, eflags: 0x0
// Checksum 0x6cc23690, Offset: 0x108
// Size: 0x40
function register_clientside(uid) {
    elem = new cinteractive_shot();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace interactive_shot/interactive_shot
// Params 1, eflags: 0x0
// Checksum 0x602c561, Offset: 0x150
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace interactive_shot/interactive_shot
// Params 1, eflags: 0x0
// Checksum 0x1a05f74f, Offset: 0x178
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace interactive_shot/interactive_shot
// Params 1, eflags: 0x0
// Checksum 0x86a869f8, Offset: 0x1a0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace interactive_shot/interactive_shot
// Params 2, eflags: 0x0
// Checksum 0x2ac5d9c1, Offset: 0x1c8
// Size: 0x28
function set_text(localclientnum, value) {
    [[ self ]]->set_text(localclientnum, value);
}

