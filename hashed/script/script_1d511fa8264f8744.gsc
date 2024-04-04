// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace zm_arcade_keys;

// Namespace zm_arcade_keys
// Method(s) 7 Total 13
class czm_arcade_keys : cluielem {

    // Namespace czm_arcade_keys/zm_arcade_keys
    // Params 2, eflags: 0x0
    // Checksum 0x6d6b9620, Offset: 0x328
    // Size: 0x30
    function set_key_count(localclientnum, value) {
        set_data(localclientnum, "key_count", value);
    }

    // Namespace czm_arcade_keys/zm_arcade_keys
    // Params 1, eflags: 0x0
    // Checksum 0xa90e618e, Offset: 0x2f0
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_arcade_keys");
    }

    // Namespace czm_arcade_keys/zm_arcade_keys
    // Params 1, eflags: 0x0
    // Checksum 0x24775388, Offset: 0x2a8
    // Size: 0x40
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "key_count", 0);
    }

    // Namespace czm_arcade_keys/zm_arcade_keys
    // Params 1, eflags: 0x0
    // Checksum 0x25d01136, Offset: 0x278
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_arcade_keys/zm_arcade_keys
    // Params 2, eflags: 0x0
    // Checksum 0x35c4422b, Offset: 0x218
    // Size: 0x54
    function setup_clientfields(uid, var_dddbc7e5) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("key_count", 1, 4, "int", var_dddbc7e5);
    }

}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 2, eflags: 0x0
// Checksum 0xb16cfb60, Offset: 0xb0
// Size: 0x4c
function register(uid, var_dddbc7e5) {
    elem = new czm_arcade_keys();
    [[ elem ]]->setup_clientfields(uid, var_dddbc7e5);
    return elem;
}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 1, eflags: 0x0
// Checksum 0xe2e883fb, Offset: 0x108
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_arcade_keys();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 1, eflags: 0x0
// Checksum 0x870fb7b, Offset: 0x150
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 1, eflags: 0x0
// Checksum 0x1d472012, Offset: 0x178
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 1, eflags: 0x0
// Checksum 0x7beff18, Offset: 0x1a0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 2, eflags: 0x0
// Checksum 0x75b41968, Offset: 0x1c8
// Size: 0x28
function set_key_count(localclientnum, value) {
    [[ self ]]->set_key_count(localclientnum, value);
}

