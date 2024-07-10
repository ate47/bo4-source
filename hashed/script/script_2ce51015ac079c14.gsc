#using scripts\core_common\lui_shared.csc;

#namespace player_insertion_choice;

// Namespace player_insertion_choice
// Method(s) 7 Total 13
class cplayer_insertion_choice : cluielem {

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 2, eflags: 0x0
    // Checksum 0x377cbabc, Offset: 0x318
    // Size: 0x11c
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"groundvehicle" == state_name) {
            set_data(localclientnum, "_state", 1);
            return;
        }
        if (#"halojump" == state_name) {
            set_data(localclientnum, "_state", 2);
            return;
        }
        if (#"heli" == state_name) {
            set_data(localclientnum, "_state", 3);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 1, eflags: 0x0
    // Checksum 0xb13b8397, Offset: 0x2e0
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"player_insertion_choice");
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 1, eflags: 0x0
    // Checksum 0xa97b09d0, Offset: 0x290
    // Size: 0x44
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_state(localclientnum, #"defaultstate");
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 1, eflags: 0x0
    // Checksum 0xeea51478, Offset: 0x260
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 1, eflags: 0x0
    // Checksum 0xf414cbd7, Offset: 0x208
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 2, "int");
    }

}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1, eflags: 0x0
// Checksum 0x9722cbc, Offset: 0xb0
// Size: 0x40
function register(uid) {
    elem = new cplayer_insertion_choice();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1, eflags: 0x0
// Checksum 0xc9810098, Offset: 0xf8
// Size: 0x40
function register_clientside(uid) {
    elem = new cplayer_insertion_choice();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1, eflags: 0x0
// Checksum 0xe2cf2395, Offset: 0x140
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1, eflags: 0x0
// Checksum 0x49eda822, Offset: 0x168
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1, eflags: 0x0
// Checksum 0xf8b0bf5, Offset: 0x190
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 2, eflags: 0x0
// Checksum 0x3d7e8ecd, Offset: 0x1b8
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

