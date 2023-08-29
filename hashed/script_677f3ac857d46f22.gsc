// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace ct_shared_button_prompt;

// Namespace ct_shared_button_prompt
// Method(s) 6 Total 13
class cct_shared_button_prompt : cluielem {

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 0, eflags: 0x8
    // Checksum 0x5f5d0f30, Offset: 0x1d8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xade6e982, Offset: 0x758
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 2, eflags: 0x0
    // Checksum 0x5d481ad7, Offset: 0x2d0
    // Size: 0x47c
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 0);
        } else if (#"smoke_button" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 1);
        } else if (#"frag_button" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 2);
        } else if (#"hash_321379c3a0d01a39" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 3);
        } else if (#"hash_39ade572f801d7d0" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 4);
        } else if (#"x_button" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 5);
        } else if (#"hash_554e932bc3ab8c3e" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 6);
        } else if (#"hash_15620c895dcec00e" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 7);
        } else if (#"hash_2cb5a2ce94a6ee6d" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 8);
        } else if (#"hash_4df4fd56580d5967" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 9);
        } else if (#"hash_343bc60e8e1af20d" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 10);
        } else if (#"hash_35030aa3c799fe40" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 11);
        } else if (#"hash_2269874f1c7c7493" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 12);
        } else if (#"square_button" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 13);
        } else if (#"hash_72d4665454938ae" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 14);
        } else if (#"hash_1e3e2411c866b2a0" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 15);
        } else if (#"hash_55f9c9d7bfc38059" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 16);
        } else {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
        }
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 1, eflags: 0x0
    // Checksum 0x24af591c, Offset: 0x2a0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 2, eflags: 0x0
    // Checksum 0xb0ad99f0, Offset: 0x250
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_shared_button_prompt", persistent);
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 1, eflags: 0x0
    // Checksum 0x8a2bc4a5, Offset: 0x1f8
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 5, "int");
    }

}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 1, eflags: 0x0
// Checksum 0x5a33a7fe, Offset: 0xd0
// Size: 0x40
function register(uid) {
    elem = new cct_shared_button_prompt();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 2, eflags: 0x0
// Checksum 0x60614eef, Offset: 0x118
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 1, eflags: 0x0
// Checksum 0xf0a338b, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 1, eflags: 0x0
// Checksum 0xa1bcec6b, Offset: 0x180
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 2, eflags: 0x0
// Checksum 0x228fa241, Offset: 0x1a8
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

