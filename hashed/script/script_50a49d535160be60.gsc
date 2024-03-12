// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace zm_hint_text;

// Namespace zm_hint_text
// Method(s) 8 Total 14
class czm_hint_text : cluielem {

    // Namespace czm_hint_text/zm_hint_text
    // Params 0, eflags: 0x9 linked
    // Checksum 0x59a48a74, Offset: 0x238
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0xaed64e4d, Offset: 0x4b0
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 2, eflags: 0x1 linked
    // Checksum 0xb887f86e, Offset: 0x478
    // Size: 0x30
    function set_text(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "text", value);
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa2162a98, Offset: 0x3c0
    // Size: 0xac
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"visible" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 1);
            return;
        }
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3bddcb8d, Offset: 0x388
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_hint_text");
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 1, eflags: 0x1 linked
    // Checksum 0xe09d39ef, Offset: 0x310
    // Size: 0x6c
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_state(localclientnum, #"defaultstate");
        [[ self ]]->set_data(localclientnum, "text", #"");
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 1, eflags: 0x1 linked
    // Checksum 0x6ea3a43, Offset: 0x2e0
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 2, eflags: 0x1 linked
    // Checksum 0xf2b1a4b4, Offset: 0x258
    // Size: 0x7c
    function setup_clientfields(uid, textcallback) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 1, "int");
        cluielem::function_dcb34c80("string", "text", 1);
    }

}

// Namespace zm_hint_text/zm_hint_text
// Params 2, eflags: 0x1 linked
// Checksum 0xe5ede5da, Offset: 0xc0
// Size: 0x4c
function register(uid, textcallback) {
    elem = new czm_hint_text();
    [[ elem ]]->setup_clientfields(uid, textcallback);
    return elem;
}

// Namespace zm_hint_text/zm_hint_text
// Params 1, eflags: 0x0
// Checksum 0xaa1958c, Offset: 0x118
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_hint_text();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_hint_text/zm_hint_text
// Params 1, eflags: 0x0
// Checksum 0x9c11e507, Offset: 0x160
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_hint_text/zm_hint_text
// Params 1, eflags: 0x0
// Checksum 0x66c1bc35, Offset: 0x188
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_hint_text/zm_hint_text
// Params 1, eflags: 0x0
// Checksum 0x612c242b, Offset: 0x1b0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_hint_text/zm_hint_text
// Params 2, eflags: 0x0
// Checksum 0xd6158d1d, Offset: 0x1d8
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace zm_hint_text/zm_hint_text
// Params 2, eflags: 0x0
// Checksum 0x2bc07465, Offset: 0x208
// Size: 0x28
function set_text(localclientnum, value) {
    [[ self ]]->set_text(localclientnum, value);
}

