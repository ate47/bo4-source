// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace zm_game_over;

// Namespace zm_game_over
// Method(s) 8 Total 14
class czm_game_over : cluielem {

    // Namespace czm_game_over/zm_game_over
    // Params 0, eflags: 0x9 linked
    // Checksum 0x3d67b3f7, Offset: 0x230
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace czm_game_over/zm_game_over
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x39e2c2b0, Offset: 0x498
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace czm_game_over/zm_game_over
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6c3857f, Offset: 0x460
    // Size: 0x30
    function set_rounds(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "rounds", value);
    }

    // Namespace czm_game_over/zm_game_over
    // Params 2, eflags: 0x1 linked
    // Checksum 0x5d583da3, Offset: 0x3a8
    // Size: 0xac
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"gatewayopened" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 1);
            return;
        }
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    }

    // Namespace czm_game_over/zm_game_over
    // Params 1, eflags: 0x1 linked
    // Checksum 0x71b81b92, Offset: 0x370
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_game_over");
    }

    // Namespace czm_game_over/zm_game_over
    // Params 1, eflags: 0x1 linked
    // Checksum 0x22e8d048, Offset: 0x308
    // Size: 0x60
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_state(localclientnum, #"defaultstate");
        [[ self ]]->set_data(localclientnum, "rounds", 0);
    }

    // Namespace czm_game_over/zm_game_over
    // Params 1, eflags: 0x1 linked
    // Checksum 0x26d0c695, Offset: 0x2d8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_game_over/zm_game_over
    // Params 2, eflags: 0x1 linked
    // Checksum 0x36a6d6b2, Offset: 0x250
    // Size: 0x7c
    function setup_clientfields(uid, var_ddbc37b7) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 1, "int");
        cluielem::add_clientfield("rounds", 1, 8, "int", var_ddbc37b7);
    }

}

// Namespace zm_game_over/zm_game_over
// Params 2, eflags: 0x1 linked
// Checksum 0x434d8df, Offset: 0xb8
// Size: 0x4c
function register(uid, var_ddbc37b7) {
    elem = new czm_game_over();
    [[ elem ]]->setup_clientfields(uid, var_ddbc37b7);
    return elem;
}

// Namespace zm_game_over/zm_game_over
// Params 1, eflags: 0x0
// Checksum 0x3a0e1a2c, Offset: 0x110
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_game_over();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_game_over/zm_game_over
// Params 1, eflags: 0x0
// Checksum 0x31a5580f, Offset: 0x158
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_game_over/zm_game_over
// Params 1, eflags: 0x0
// Checksum 0x69393cfe, Offset: 0x180
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_game_over/zm_game_over
// Params 1, eflags: 0x0
// Checksum 0x99111d29, Offset: 0x1a8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_game_over/zm_game_over
// Params 2, eflags: 0x0
// Checksum 0x475aa62, Offset: 0x1d0
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace zm_game_over/zm_game_over
// Params 2, eflags: 0x0
// Checksum 0x43f67659, Offset: 0x200
// Size: 0x28
function set_rounds(localclientnum, value) {
    [[ self ]]->set_rounds(localclientnum, value);
}

