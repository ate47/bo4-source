// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace zm_hint_text;

// Namespace zm_hint_text
// Method(s) 7 Total 14
class czm_hint_text : cluielem {

    // Namespace czm_hint_text/zm_hint_text
    // Params 0, eflags: 0x9 linked
    // Checksum 0xf06bebf1, Offset: 0x208
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0xa37c67bb, Offset: 0x438
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 2, eflags: 0x1 linked
    // Checksum 0xf4f330c9, Offset: 0x3f0
    // Size: 0x3c
    function set_text(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "text", value);
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 2, eflags: 0x1 linked
    // Checksum 0x72955b7b, Offset: 0x328
    // Size: 0xbc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 0);
        } else if (#"visible" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 1);
        } else {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
        }
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 1, eflags: 0x1 linked
    // Checksum 0x52e0c176, Offset: 0x2f8
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 2, eflags: 0x1 linked
    // Checksum 0x3c71c8e0, Offset: 0x2a8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_hint_text", persistent);
    }

    // Namespace czm_hint_text/zm_hint_text
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3fecf46b, Offset: 0x228
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 1, "int");
        cluielem::function_dcb34c80("string", "text", 1);
    }

}

// Namespace zm_hint_text/zm_hint_text
// Params 1, eflags: 0x1 linked
// Checksum 0x204ad7b4, Offset: 0xd0
// Size: 0x40
function register(uid) {
    elem = new czm_hint_text();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_hint_text/zm_hint_text
// Params 2, eflags: 0x1 linked
// Checksum 0x3eac8f23, Offset: 0x118
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_hint_text/zm_hint_text
// Params 1, eflags: 0x1 linked
// Checksum 0xa0cdc4ba, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_hint_text/zm_hint_text
// Params 1, eflags: 0x1 linked
// Checksum 0x1cf802c2, Offset: 0x180
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_hint_text/zm_hint_text
// Params 2, eflags: 0x1 linked
// Checksum 0x7674d3ea, Offset: 0x1a8
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace zm_hint_text/zm_hint_text
// Params 2, eflags: 0x1 linked
// Checksum 0xc8f53f0d, Offset: 0x1d8
// Size: 0x28
function set_text(player, value) {
    [[ self ]]->set_text(player, value);
}

