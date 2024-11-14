#using scripts\core_common\lui_shared;
#using scripts\core_common\clientfield_shared;

#namespace ct_shared_desc;

// Namespace ct_shared_desc
// Method(s) 6 Total 13
class cct_shared_desc : cluielem {

    var var_47e79fc;

    // Namespace cct_shared_desc/ct_shared_desc
    // Params 2, eflags: 0x0
    // Checksum 0x9bb75ee3, Offset: 0x2c8
    // Size: 0xfc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 0);
            return;
        }
        if (#"hash_3319eaa2c590a2ac" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 1);
            return;
        }
        if (#"hash_2ac3b79c708dcfd5" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 2);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace cct_shared_desc/ct_shared_desc
    // Params 1, eflags: 0x0
    // Checksum 0x21b1789b, Offset: 0x298
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cct_shared_desc/ct_shared_desc
    // Params 2, eflags: 0x0
    // Checksum 0x515ef379, Offset: 0x248
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_shared_desc", persistent);
    }

    // Namespace cct_shared_desc/ct_shared_desc
    // Params 1, eflags: 0x0
    // Checksum 0x1be91feb, Offset: 0x1f0
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 2, "int");
    }

}

// Namespace ct_shared_desc/ct_shared_desc
// Params 1, eflags: 0x0
// Checksum 0x3476698f, Offset: 0xc8
// Size: 0x40
function register(uid) {
    elem = new cct_shared_desc();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_shared_desc/ct_shared_desc
// Params 2, eflags: 0x0
// Checksum 0xfdd383e0, Offset: 0x110
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_shared_desc/ct_shared_desc
// Params 1, eflags: 0x0
// Checksum 0xdd868f6f, Offset: 0x150
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_desc/ct_shared_desc
// Params 1, eflags: 0x0
// Checksum 0xcbba9445, Offset: 0x178
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace ct_shared_desc/ct_shared_desc
// Params 2, eflags: 0x0
// Checksum 0x422f37b7, Offset: 0x1a0
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

