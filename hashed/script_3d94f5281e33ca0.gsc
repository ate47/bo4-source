// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace ct_shared_ingame_objective;

// Namespace ct_shared_ingame_objective
// Method(s) 9 Total 15
class cct_shared_ingame_objective : cluielem {

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 0, eflags: 0x8
    // Checksum 0x64ecce70, Offset: 0x280
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x967aef80, Offset: 0xdc8
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2, eflags: 0x0
    // Checksum 0x26abd408, Offset: 0xd90
    // Size: 0x30
    function set_objpoints(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "objpoints", value);
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2, eflags: 0x0
    // Checksum 0xa607e24a, Offset: 0xd58
    // Size: 0x30
    function set_objectivetext(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "objectiveText", value);
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2, eflags: 0x0
    // Checksum 0x942b967e, Offset: 0x450
    // Size: 0x8fc
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 0);
        } else if (#"fadeout" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 1);
        } else if (#"timer_on" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 2);
        } else if (#"hash_7b45e6511e6e3303" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 3);
        } else if (#"dynobj_killtoearnhellstorm" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 4);
        } else if (#"hash_1f92740e023d0e37" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 5);
        } else if (#"dynobj_killtoearnrcxd" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 6);
        } else if (#"hash_2ad0da501b5586a4" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 7);
        } else if (#"dynobj_killtoearnswat" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 8);
        } else if (#"hash_4de4402f8698c768" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 9);
        } else if (#"hash_63d3d0d871ba1adb" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 10);
        } else if (#"hash_2f0272e755f4abf7" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 11);
        } else if (#"dynobj_killtoearnlightningstrike" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 12);
        } else if (#"hash_71743ffed428ea2f" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 13);
        } else if (#"hash_519ed82ca27249dd" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 14);
        } else if (#"hash_7d5a07e3680ec561" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 15);
        } else if (#"hash_80668531e9e4db6" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 16);
        } else if (#"hash_5ba30c4069a3b28" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 17);
        } else if (#"dynobj_killmantises" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 18);
        } else if (#"hash_83700757d6b9194" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 19);
        } else if (#"hash_6dfb08308c7640b0" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 20);
        } else if (#"hash_2a4442540584316a" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 21);
        } else if (#"hash_7917ffb178e31e9c" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 22);
        } else if (#"hash_1a051da4d150816" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 23);
        } else if (#"hash_347a715457b3ba72" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 24);
        } else if (#"hash_21962bee0a15424" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 25);
        } else if (#"dynobj_killzombies" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 26);
        } else if (#"hash_29a3c52abd286a3d" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 27);
        } else if (#"hash_6b6581d0506c0b19" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 28);
        } else if (#"hash_34061eae676df48d" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 29);
        } else if (#"hash_2937fe33c735a583" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 30);
        } else if (#"hash_4bfdec8101cde9e7" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 31);
        } else if (#"dynobj_killspawnbeacons" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 32);
        } else if (#"hash_1a4b4231363359c4" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 33);
        } else if (#"dynobj_killwiretrappedenemies" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 34);
        } else if (#"hash_5c25a457d21d00a3" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 35);
        } else if (#"oneline" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 36);
        } else if (#"hash_6e90224596225271" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 37);
        } else if (#"hash_52e0c66ed90c5996" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 38);
        } else if (#"hash_75d2922ca26f2a88" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 39);
        } else {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
        }
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 1, eflags: 0x0
    // Checksum 0xe131f252, Offset: 0x418
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"ct_shared_ingame_objective");
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 1, eflags: 0x0
    // Checksum 0xb6455a91, Offset: 0x388
    // Size: 0x88
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_state(localclientnum, #"defaultstate");
        [[ self ]]->set_data(localclientnum, "objectiveText", #"hash_0");
        [[ self ]]->set_data(localclientnum, "objpoints", 0);
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 1, eflags: 0x0
    // Checksum 0x97961506, Offset: 0x358
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 3, eflags: 0x0
    // Checksum 0x3fd7b63e, Offset: 0x2a0
    // Size: 0xac
    function setup_clientfields(uid, var_a584bc49, var_ea26adc8) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 6, "int");
        cluielem::function_dcb34c80("string", "objectiveText", 1);
        cluielem::add_clientfield("objpoints", 1, 11, "int", var_ea26adc8);
    }

}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 3, eflags: 0x0
// Checksum 0xcb3d755, Offset: 0xd0
// Size: 0x58
function register(uid, var_a584bc49, var_ea26adc8) {
    elem = new cct_shared_ingame_objective();
    [[ elem ]]->setup_clientfields(uid, var_a584bc49, var_ea26adc8);
    return elem;
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1, eflags: 0x0
// Checksum 0x12ae69f9, Offset: 0x130
// Size: 0x40
function register_clientside(uid) {
    elem = new cct_shared_ingame_objective();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1, eflags: 0x0
// Checksum 0x74944b72, Offset: 0x178
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1, eflags: 0x0
// Checksum 0x7a2c9511, Offset: 0x1a0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1, eflags: 0x0
// Checksum 0xa1e98f8a, Offset: 0x1c8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2, eflags: 0x0
// Checksum 0xf162d5ab, Offset: 0x1f0
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2, eflags: 0x0
// Checksum 0x5691abe4, Offset: 0x220
// Size: 0x28
function set_objectivetext(localclientnum, value) {
    [[ self ]]->set_objectivetext(localclientnum, value);
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2, eflags: 0x0
// Checksum 0x91a06e5f, Offset: 0x250
// Size: 0x28
function set_objpoints(localclientnum, value) {
    [[ self ]]->set_objpoints(localclientnum, value);
}

