// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace zm_towers_pap_hud;

// Namespace zm_towers_pap_hud
// Method(s) 10 Total 16
class czm_towers_pap_hud : cluielem {

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 0, eflags: 0x8
    // Checksum 0x3722fd30, Offset: 0x2d8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x352c067d, Offset: 0x5d0
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 2, eflags: 0x0
    // Checksum 0x81955f91, Offset: 0x598
    // Size: 0x30
    function set_odin_acquired(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "odin_acquired", value);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 2, eflags: 0x0
    // Checksum 0x530a0e0e, Offset: 0x560
    // Size: 0x30
    function set_zeus_acquired(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "zeus_acquired", value);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 2, eflags: 0x0
    // Checksum 0xc2e0b81a, Offset: 0x528
    // Size: 0x30
    function set_ra_acquired(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "ra_acquired", value);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 2, eflags: 0x0
    // Checksum 0xbbcec54c, Offset: 0x4f0
    // Size: 0x30
    function set_danu_acquired(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "danu_acquired", value);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 1, eflags: 0x0
    // Checksum 0x49e889f8, Offset: 0x4b8
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_towers_pap_hud");
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 1, eflags: 0x0
    // Checksum 0xe9e939fb, Offset: 0x418
    // Size: 0x94
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "danu_acquired", 0);
        [[ self ]]->set_data(localclientnum, "ra_acquired", 0);
        [[ self ]]->set_data(localclientnum, "zeus_acquired", 0);
        [[ self ]]->set_data(localclientnum, "odin_acquired", 0);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 1, eflags: 0x0
    // Checksum 0x99d99eef, Offset: 0x3e8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 5, eflags: 0x0
    // Checksum 0x6901522b, Offset: 0x2f8
    // Size: 0xe4
    function setup_clientfields(uid, var_54a6819c, var_6d3f4678, var_fad0d5ca, var_84879db6) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("danu_acquired", 1, 1, "int", var_54a6819c);
        cluielem::add_clientfield("ra_acquired", 1, 1, "int", var_6d3f4678);
        cluielem::add_clientfield("zeus_acquired", 1, 1, "int", var_fad0d5ca);
        cluielem::add_clientfield("odin_acquired", 1, 1, "int", var_84879db6);
    }

}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 5, eflags: 0x0
// Checksum 0x583c44bc, Offset: 0xe0
// Size: 0x70
function register(uid, var_54a6819c, var_6d3f4678, var_fad0d5ca, var_84879db6) {
    elem = new czm_towers_pap_hud();
    [[ elem ]]->setup_clientfields(uid, var_54a6819c, var_6d3f4678, var_fad0d5ca, var_84879db6);
    return elem;
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 1, eflags: 0x0
// Checksum 0x4409f7ac, Offset: 0x158
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_towers_pap_hud();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 1, eflags: 0x0
// Checksum 0x640b7803, Offset: 0x1a0
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 1, eflags: 0x0
// Checksum 0x19150bdd, Offset: 0x1c8
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 1, eflags: 0x0
// Checksum 0xfb1ceae, Offset: 0x1f0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 2, eflags: 0x0
// Checksum 0xe90b348b, Offset: 0x218
// Size: 0x28
function set_danu_acquired(localclientnum, value) {
    [[ self ]]->set_danu_acquired(localclientnum, value);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 2, eflags: 0x0
// Checksum 0x21d519ca, Offset: 0x248
// Size: 0x28
function set_ra_acquired(localclientnum, value) {
    [[ self ]]->set_ra_acquired(localclientnum, value);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 2, eflags: 0x0
// Checksum 0x6403b8ba, Offset: 0x278
// Size: 0x28
function set_zeus_acquired(localclientnum, value) {
    [[ self ]]->set_zeus_acquired(localclientnum, value);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 2, eflags: 0x0
// Checksum 0x87809a0e, Offset: 0x2a8
// Size: 0x28
function set_odin_acquired(localclientnum, value) {
    [[ self ]]->set_odin_acquired(localclientnum, value);
}

