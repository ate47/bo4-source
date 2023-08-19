// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace lower_message;

// Namespace lower_message
// Method(s) 9 Total 15
class clower_message : cluielem {

    // Namespace clower_message/lower_message
    // Params 0, eflags: 0x9 linked
    // Checksum 0xcc7571c3, Offset: 0x288
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace clower_message/lower_message
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x878b6a4d, Offset: 0x5b8
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace clower_message/lower_message
    // Params 2, eflags: 0x1 linked
    // Checksum 0xbb90478d, Offset: 0x580
    // Size: 0x30
    function set_countdowntimeseconds(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "countdownTimeSeconds", value);
    }

    // Namespace clower_message/lower_message
    // Params 2, eflags: 0x1 linked
    // Checksum 0xd86f47be, Offset: 0x548
    // Size: 0x30
    function set_message(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "message", value);
    }

    // Namespace clower_message/lower_message
    // Params 2, eflags: 0x1 linked
    // Checksum 0xd573b218, Offset: 0x458
    // Size: 0xe4
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 0);
        } else if (#"visible" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 1);
        } else if (#"hash_45bfcb1cd8c9b50a" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 2);
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
    // Checksum 0x46af73a2, Offset: 0x420
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"lower_message");
    }

    // Namespace clower_message/lower_message
    // Params 1, eflags: 0x1 linked
    // Checksum 0xfcbb23d0, Offset: 0x390
    // Size: 0x88
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_state(localclientnum, #"defaultstate");
        [[ self ]]->set_data(localclientnum, "message", #"hash_0");
        [[ self ]]->set_data(localclientnum, "countdownTimeSeconds", 0);
    }

    // Namespace clower_message/lower_message
    // Params 1, eflags: 0x1 linked
    // Checksum 0x28c8fc2f, Offset: 0x360
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace clower_message/lower_message
    // Params 3, eflags: 0x1 linked
    // Checksum 0x8753d1c6, Offset: 0x2a8
    // Size: 0xac
    function setup_clientfields(uid, var_9af44e2b, var_7a5253d3) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 2, "int");
        cluielem::function_dcb34c80("string", "message", 1);
        cluielem::add_clientfield("countdownTimeSeconds", 1, 5, "int", var_7a5253d3);
    }

}

// Namespace lower_message/lower_message
// Params 3, eflags: 0x1 linked
// Checksum 0x2fb6d8f, Offset: 0xd8
// Size: 0x58
function register(uid, var_9af44e2b, var_7a5253d3) {
    elem = new clower_message();
    [[ elem ]]->setup_clientfields(uid, var_9af44e2b, var_7a5253d3);
    return elem;
}

// Namespace lower_message/lower_message
// Params 1, eflags: 0x0
// Checksum 0x407355b7, Offset: 0x138
// Size: 0x40
function register_clientside(uid) {
    elem = new clower_message();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace lower_message/lower_message
// Params 1, eflags: 0x0
// Checksum 0x45d35d8e, Offset: 0x180
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace lower_message/lower_message
// Params 1, eflags: 0x0
// Checksum 0x1cc53293, Offset: 0x1a8
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace lower_message/lower_message
// Params 1, eflags: 0x0
// Checksum 0xce69b8e2, Offset: 0x1d0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace lower_message/lower_message
// Params 2, eflags: 0x0
// Checksum 0x6e001bf4, Offset: 0x1f8
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace lower_message/lower_message
// Params 2, eflags: 0x0
// Checksum 0x315923c0, Offset: 0x228
// Size: 0x28
function set_message(localclientnum, value) {
    [[ self ]]->set_message(localclientnum, value);
}

// Namespace lower_message/lower_message
// Params 2, eflags: 0x0
// Checksum 0xd36cfbb8, Offset: 0x258
// Size: 0x28
function set_countdowntimeseconds(localclientnum, value) {
    [[ self ]]->set_countdowntimeseconds(localclientnum, value);
}

