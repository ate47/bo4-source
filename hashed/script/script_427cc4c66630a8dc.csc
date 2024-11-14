#using scripts\core_common\lui_shared;

#namespace prototype_self_revive;

// Namespace prototype_self_revive
// Method(s) 6 Total 12
class cprototype_self_revive : cluielem {

    // Namespace cprototype_self_revive/prototype_self_revive
    // Params 1, eflags: 0x0
    // Checksum 0xbe90dcd7, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"prototype_self_revive");
    }

    // Namespace cprototype_self_revive/prototype_self_revive
    // Params 1, eflags: 0x0
    // Checksum 0x3f59e0f6, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace cprototype_self_revive/prototype_self_revive
    // Params 1, eflags: 0x0
    // Checksum 0x845371cf, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cprototype_self_revive/prototype_self_revive
    // Params 1, eflags: 0x0
    // Checksum 0x464d55a9, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace prototype_self_revive/prototype_self_revive
// Params 1, eflags: 0x0
// Checksum 0xf274ffba, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new cprototype_self_revive();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace prototype_self_revive/prototype_self_revive
// Params 1, eflags: 0x0
// Checksum 0xd8d7a5d5, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new cprototype_self_revive();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace prototype_self_revive/prototype_self_revive
// Params 1, eflags: 0x0
// Checksum 0xdb1323e5, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace prototype_self_revive/prototype_self_revive
// Params 1, eflags: 0x0
// Checksum 0xe8edda12, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace prototype_self_revive/prototype_self_revive
// Params 1, eflags: 0x0
// Checksum 0x571dc3fc, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

