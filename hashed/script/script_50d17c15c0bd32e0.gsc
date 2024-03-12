// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace player_insertion_choice;

// Namespace player_insertion_choice
// Method(s) 6 Total 13
class cplayer_insertion_choice : cluielem {

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 0, eflags: 0x8
    // Checksum 0x416897f9, Offset: 0x1d8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x37b3756, Offset: 0x418
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 2, eflags: 0x0
    // Checksum 0xc60874c, Offset: 0x2d0
    // Size: 0x13c
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 0);
            return;
        }
        if (#"groundvehicle" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 1);
            return;
        }
        if (#"halojump" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 2);
            return;
        }
        if (#"heli" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 3);
            return;
        }
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 1, eflags: 0x0
    // Checksum 0x33e0f342, Offset: 0x2a0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 2, eflags: 0x0
    // Checksum 0xec0be477, Offset: 0x250
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "player_insertion_choice", persistent);
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 1, eflags: 0x0
    // Checksum 0xff882a3c, Offset: 0x1f8
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 2, "int");
    }

}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1, eflags: 0x0
// Checksum 0x289cfca3, Offset: 0xd0
// Size: 0x40
function register(uid) {
    elem = new cplayer_insertion_choice();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 2, eflags: 0x0
// Checksum 0x58e7239d, Offset: 0x118
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1, eflags: 0x0
// Checksum 0x88b3a92, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1, eflags: 0x0
// Checksum 0xb1260aa3, Offset: 0x180
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 2, eflags: 0x0
// Checksum 0xd6608380, Offset: 0x1a8
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

