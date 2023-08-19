// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace remote_missile_target_lockon;

// Namespace remote_missile_target_lockon
// Method(s) 10 Total 16
class cremote_missile_target_lockon : cluielem {

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 0, eflags: 0x9 linked
    // Checksum 0x5d3f96a7, Offset: 0x2d0
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0xceebe99d, Offset: 0x5c8
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0x8b048036, Offset: 0x590
    // Size: 0x30
    function set_killed(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "killed", value);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0x29af8ff5, Offset: 0x558
    // Size: 0x30
    function set_ishawktag(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "isHawkTag", value);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6142c403, Offset: 0x520
    // Size: 0x30
    function set_target_locked(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "target_locked", value);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa46a954c, Offset: 0x4e8
    // Size: 0x30
    function set_clientnum(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "clientnum", value);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1197d043, Offset: 0x4b0
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"remote_missile_target_lockon");
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa45d9768, Offset: 0x410
    // Size: 0x94
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "clientnum", 0);
        [[ self ]]->set_data(localclientnum, "target_locked", 0);
        [[ self ]]->set_data(localclientnum, "isHawkTag", 0);
        [[ self ]]->set_data(localclientnum, "killed", 0);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x87355005, Offset: 0x3e0
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 5, eflags: 0x1 linked
    // Checksum 0x6223c699, Offset: 0x2f0
    // Size: 0xe4
    function setup_clientfields(uid, var_c05c67e2, var_486334bd, var_683d075d, var_a334a5eb) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("clientnum", 1, 7, "int", var_c05c67e2);
        cluielem::add_clientfield("target_locked", 1, 1, "int", var_486334bd);
        cluielem::add_clientfield("isHawkTag", 13000, 1, "int", var_683d075d);
        cluielem::add_clientfield("killed", 13000, 1, "int", var_a334a5eb);
    }

}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 5, eflags: 0x0
// Checksum 0xee59b854, Offset: 0xd8
// Size: 0x70
function register(uid, var_c05c67e2, var_486334bd, var_683d075d, var_a334a5eb) {
    elem = new cremote_missile_target_lockon();
    [[ elem ]]->setup_clientfields(uid, var_c05c67e2, var_486334bd, var_683d075d, var_a334a5eb);
    return elem;
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 1, eflags: 0x1 linked
// Checksum 0x19ac3dd9, Offset: 0x150
// Size: 0x40
function register_clientside(uid) {
    elem = new cremote_missile_target_lockon();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 1, eflags: 0x1 linked
// Checksum 0xff29abf1, Offset: 0x198
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 1, eflags: 0x1 linked
// Checksum 0x5c606733, Offset: 0x1c0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 1, eflags: 0x1 linked
// Checksum 0xb6497e11, Offset: 0x1e8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 2, eflags: 0x1 linked
// Checksum 0xd2dbcbcd, Offset: 0x210
// Size: 0x28
function set_clientnum(localclientnum, value) {
    [[ self ]]->set_clientnum(localclientnum, value);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 2, eflags: 0x1 linked
// Checksum 0x2434d575, Offset: 0x240
// Size: 0x28
function set_target_locked(localclientnum, value) {
    [[ self ]]->set_target_locked(localclientnum, value);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 2, eflags: 0x1 linked
// Checksum 0x6bbf3fae, Offset: 0x270
// Size: 0x28
function set_ishawktag(localclientnum, value) {
    [[ self ]]->set_ishawktag(localclientnum, value);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 2, eflags: 0x0
// Checksum 0x45b5a4e2, Offset: 0x2a0
// Size: 0x28
function set_killed(localclientnum, value) {
    [[ self ]]->set_killed(localclientnum, value);
}

