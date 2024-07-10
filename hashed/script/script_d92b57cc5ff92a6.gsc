#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace ct_shared_objcounter;

// Namespace ct_shared_objcounter
// Method(s) 9 Total 16
class cct_shared_objcounter : cluielem {

    var var_47e79fc;

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 2, eflags: 0x0
    // Checksum 0xd858d50b, Offset: 0x6a8
    // Size: 0x3c
    function set_objectivetotal(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "objectiveTotal", value);
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 2, eflags: 0x0
    // Checksum 0xc46dcdf1, Offset: 0x660
    // Size: 0x3c
    function set_objectivelabel(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "objectiveLabel", value);
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 2, eflags: 0x0
    // Checksum 0x7b7a794c, Offset: 0x618
    // Size: 0x3c
    function set_objectivecount(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "objectiveCount", value);
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 2, eflags: 0x0
    // Checksum 0x3931b69e, Offset: 0x410
    // Size: 0x1fc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 0);
            return;
        }
        if (#"nototal" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 1);
            return;
        }
        if (#"hash_1895dd9cec027130" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 2);
            return;
        }
        if (#"total" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 3);
            return;
        }
        if (#"total_update" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 4);
            return;
        }
        if (#"hash_5edcadf19882d66f" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 5);
            return;
        }
        if (#"total_init" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 6);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 1, eflags: 0x0
    // Checksum 0x369ba90f, Offset: 0x3e0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 2, eflags: 0x0
    // Checksum 0xf84f6916, Offset: 0x390
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_shared_objcounter", persistent);
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 1, eflags: 0x0
    // Checksum 0x5cff223d, Offset: 0x2c0
    // Size: 0xc4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 3, "int");
        cluielem::add_clientfield("objectiveCount", 1, 5, "int");
        cluielem::function_dcb34c80("string", "objectiveLabel", 1);
        cluielem::add_clientfield("objectiveTotal", 1, 5, "int");
    }

}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 1, eflags: 0x0
// Checksum 0x1ac64b9f, Offset: 0x108
// Size: 0x40
function register(uid) {
    elem = new cct_shared_objcounter();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 2, eflags: 0x0
// Checksum 0x4efa6376, Offset: 0x150
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 1, eflags: 0x0
// Checksum 0xc5d0fd9e, Offset: 0x190
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 1, eflags: 0x0
// Checksum 0x7083bc09, Offset: 0x1b8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 2, eflags: 0x0
// Checksum 0x8db3b6e6, Offset: 0x1e0
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 2, eflags: 0x0
// Checksum 0xd36d4652, Offset: 0x210
// Size: 0x28
function set_objectivecount(player, value) {
    [[ self ]]->set_objectivecount(player, value);
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 2, eflags: 0x0
// Checksum 0x3a83f056, Offset: 0x240
// Size: 0x28
function set_objectivelabel(player, value) {
    [[ self ]]->set_objectivelabel(player, value);
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 2, eflags: 0x0
// Checksum 0x6f552d5c, Offset: 0x270
// Size: 0x28
function set_objectivetotal(player, value) {
    [[ self ]]->set_objectivetotal(player, value);
}

