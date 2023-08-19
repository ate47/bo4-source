// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace ct_shared_ingame_objective;

// Namespace ct_shared_ingame_objective
// Method(s) 8 Total 15
class cct_shared_ingame_objective : cluielem {

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 0, eflags: 0x8
    // Checksum 0x1a07d927, Offset: 0x260
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xd8c43f4, Offset: 0xe80
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2, eflags: 0x0
    // Checksum 0xd72c1375, Offset: 0xe38
    // Size: 0x3c
    function set_objpoints(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "objpoints", value);
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2, eflags: 0x0
    // Checksum 0x32a6fe86, Offset: 0xdf0
    // Size: 0x3c
    function set_objectivetext(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "objectiveText", value);
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2, eflags: 0x0
    // Checksum 0xa21b9a61, Offset: 0x3a8
    // Size: 0xa3c
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 0);
        } else if (#"fadeout" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 1);
        } else if (#"timer_on" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 2);
        } else if (#"hash_7b45e6511e6e3303" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 3);
        } else if (#"dynobj_killtoearnhellstorm" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 4);
        } else if (#"hash_1f92740e023d0e37" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 5);
        } else if (#"dynobj_killtoearnrcxd" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 6);
        } else if (#"hash_2ad0da501b5586a4" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 7);
        } else if (#"dynobj_killtoearnswat" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 8);
        } else if (#"hash_4de4402f8698c768" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 9);
        } else if (#"hash_63d3d0d871ba1adb" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 10);
        } else if (#"hash_2f0272e755f4abf7" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 11);
        } else if (#"dynobj_killtoearnlightningstrike" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 12);
        } else if (#"hash_71743ffed428ea2f" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 13);
        } else if (#"hash_519ed82ca27249dd" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 14);
        } else if (#"hash_7d5a07e3680ec561" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 15);
        } else if (#"hash_80668531e9e4db6" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 16);
        } else if (#"hash_5ba30c4069a3b28" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 17);
        } else if (#"dynobj_killmantises" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 18);
        } else if (#"hash_83700757d6b9194" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 19);
        } else if (#"hash_6dfb08308c7640b0" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 20);
        } else if (#"hash_2a4442540584316a" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 21);
        } else if (#"hash_7917ffb178e31e9c" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 22);
        } else if (#"hash_1a051da4d150816" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 23);
        } else if (#"hash_347a715457b3ba72" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 24);
        } else if (#"hash_21962bee0a15424" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 25);
        } else if (#"dynobj_killzombies" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 26);
        } else if (#"hash_29a3c52abd286a3d" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 27);
        } else if (#"hash_6b6581d0506c0b19" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 28);
        } else if (#"hash_34061eae676df48d" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 29);
        } else if (#"hash_2937fe33c735a583" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 30);
        } else if (#"hash_4bfdec8101cde9e7" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 31);
        } else if (#"dynobj_killspawnbeacons" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 32);
        } else if (#"hash_1a4b4231363359c4" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 33);
        } else if (#"dynobj_killwiretrappedenemies" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 34);
        } else if (#"hash_5c25a457d21d00a3" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 35);
        } else if (#"oneline" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 36);
        } else if (#"hash_6e90224596225271" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 37);
        } else if (#"hash_52e0c66ed90c5996" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 38);
        } else if (#"hash_75d2922ca26f2a88" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 39);
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
    // Checksum 0x1dbd82bc, Offset: 0x378
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2, eflags: 0x0
    // Checksum 0xf84c5283, Offset: 0x328
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_shared_ingame_objective", persistent);
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 1, eflags: 0x0
    // Checksum 0x6311e365, Offset: 0x280
    // Size: 0x9c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 6, "int");
        cluielem::function_dcb34c80("string", "objectiveText", 1);
        cluielem::add_clientfield("objpoints", 1, 11, "int");
    }

}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1, eflags: 0x0
// Checksum 0xb7a53e0e, Offset: 0xf8
// Size: 0x40
function register(uid) {
    elem = new cct_shared_ingame_objective();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2, eflags: 0x0
// Checksum 0x16f98f1b, Offset: 0x140
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1, eflags: 0x0
// Checksum 0x1ccb13cf, Offset: 0x180
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1, eflags: 0x0
// Checksum 0x8c9ef8be, Offset: 0x1a8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2, eflags: 0x0
// Checksum 0x3b23477e, Offset: 0x1d0
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2, eflags: 0x0
// Checksum 0x330cc44a, Offset: 0x200
// Size: 0x28
function set_objectivetext(player, value) {
    [[ self ]]->set_objectivetext(player, value);
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2, eflags: 0x0
// Checksum 0xa6d15dd0, Offset: 0x230
// Size: 0x28
function set_objpoints(player, value) {
    [[ self ]]->set_objpoints(player, value);
}

