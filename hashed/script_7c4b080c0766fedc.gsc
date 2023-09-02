// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace ct_progressbar_status;

// Namespace ct_progressbar_status
// Method(s) 6 Total 13
class cct_progressbar_status : cluielem {

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 0, eflags: 0x8
    // Checksum 0xc8414d83, Offset: 0x1d8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x501cdd64, Offset: 0x5d8
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 2, eflags: 0x0
    // Checksum 0x36eb9e57, Offset: 0x2d0
    // Size: 0x2fc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 0);
        } else if (#"download_complete" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 1);
        } else if (#"downloading" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 2);
        } else if (#"connection_lost" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 3);
        } else if (#"downloading1" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 4);
        } else if (#"hash_42f8a09c2e0a99e3" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 5);
        } else if (#"awaitingconnection" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 6);
        } else if (#"hash_7f00f68e42b5b8f6" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 7);
        } else if (#"sabotagedata" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 8);
        } else if (#"sabotagedata1" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 9);
        } else if (#"hash_7185fe2194047325" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 10);
        } else {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
        }
    }

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 1, eflags: 0x0
    // Checksum 0x2e4987a8, Offset: 0x2a0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 2, eflags: 0x0
    // Checksum 0xcfe2d5d5, Offset: 0x250
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_progressbar_status", persistent);
    }

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 1, eflags: 0x0
    // Checksum 0x7149227d, Offset: 0x1f8
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 4, "int");
    }

}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 1, eflags: 0x0
// Checksum 0x5c3a8f93, Offset: 0xd0
// Size: 0x40
function register(uid) {
    elem = new cct_progressbar_status();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 2, eflags: 0x0
// Checksum 0x18edd4eb, Offset: 0x118
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 1, eflags: 0x0
// Checksum 0x9b01fb12, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 1, eflags: 0x0
// Checksum 0xd80fd285, Offset: 0x180
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 2, eflags: 0x0
// Checksum 0x5c16bcdd, Offset: 0x1a8
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

