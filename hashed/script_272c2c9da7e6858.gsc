// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace lower_message;

// Namespace lower_message
// Method(s) 8 Total 15
class clower_message : cluielem {

    // Namespace clower_message/lower_message
    // Params 0, eflags: 0x9 linked
    // Checksum 0x32a4acee, Offset: 0x258
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace clower_message/lower_message
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x17ff3373, Offset: 0x538
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace clower_message/lower_message
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6a3610b0, Offset: 0x4f0
    // Size: 0x3c
    function set_countdowntimeseconds(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "countdownTimeSeconds", value);
    }

    // Namespace clower_message/lower_message
    // Params 2, eflags: 0x1 linked
    // Checksum 0x951a891a, Offset: 0x4a8
    // Size: 0x3c
    function set_message(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "message", value);
    }

    // Namespace clower_message/lower_message
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6f3ddf00, Offset: 0x3a0
    // Size: 0xfc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 0);
        } else if (#"visible" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 1);
        } else if (#"hash_45bfcb1cd8c9b50a" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 2);
        } else {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
        }
    }

    // Namespace clower_message/lower_message
    // Params 1, eflags: 0x1 linked
    // Checksum 0x722e2add, Offset: 0x370
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace clower_message/lower_message
    // Params 2, eflags: 0x1 linked
    // Checksum 0x31f200ab, Offset: 0x320
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "lower_message", persistent);
    }

    // Namespace clower_message/lower_message
    // Params 1, eflags: 0x1 linked
    // Checksum 0x9a44ba3e, Offset: 0x278
    // Size: 0x9c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 2, "int");
        cluielem::function_dcb34c80("string", "message", 1);
        cluielem::add_clientfield("countdownTimeSeconds", 1, 5, "int");
    }

}

// Namespace lower_message/lower_message
// Params 1, eflags: 0x1 linked
// Checksum 0xcff5f4a4, Offset: 0xf0
// Size: 0x40
function register(uid) {
    elem = new clower_message();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace lower_message/lower_message
// Params 2, eflags: 0x1 linked
// Checksum 0x29bcbf1e, Offset: 0x138
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace lower_message/lower_message
// Params 1, eflags: 0x0
// Checksum 0x318dcea5, Offset: 0x178
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace lower_message/lower_message
// Params 1, eflags: 0x1 linked
// Checksum 0x865d29b7, Offset: 0x1a0
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace lower_message/lower_message
// Params 2, eflags: 0x1 linked
// Checksum 0x6a1be3ea, Offset: 0x1c8
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace lower_message/lower_message
// Params 2, eflags: 0x1 linked
// Checksum 0xf2ddf70c, Offset: 0x1f8
// Size: 0x28
function set_message(player, value) {
    [[ self ]]->set_message(player, value);
}

// Namespace lower_message/lower_message
// Params 2, eflags: 0x1 linked
// Checksum 0xdabcd213, Offset: 0x228
// Size: 0x28
function set_countdowntimeseconds(player, value) {
    [[ self ]]->set_countdowntimeseconds(player, value);
}
