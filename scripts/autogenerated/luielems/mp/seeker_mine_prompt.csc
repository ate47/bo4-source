#using scripts\core_common\lui_shared;

#namespace seeker_mine_prompt;

// Namespace seeker_mine_prompt
// Method(s) 8 Total 14
class cseeker_mine_prompt : cluielem {

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 2, eflags: 0x0
    // Checksum 0x71f37fe4, Offset: 0x408
    // Size: 0x30
    function set_promptstate(localclientnum, value) {
        set_data(localclientnum, "promptState", value);
    }

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 2, eflags: 0x0
    // Checksum 0x25d3d40, Offset: 0x3d0
    // Size: 0x30
    function set_progress(localclientnum, value) {
        set_data(localclientnum, "progress", value);
    }

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 1, eflags: 0x0
    // Checksum 0xadc7a8e0, Offset: 0x398
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"seeker_mine_prompt");
    }

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 1, eflags: 0x0
    // Checksum 0x9f597f96, Offset: 0x328
    // Size: 0x64
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "progress", 0);
        set_data(localclientnum, "promptState", 0);
    }

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 1, eflags: 0x0
    // Checksum 0x92c22d06, Offset: 0x2f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 3, eflags: 0x0
    // Checksum 0x6363c40f, Offset: 0x268
    // Size: 0x84
    function setup_clientfields(uid, progresscallback, var_ca3086f0) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("progress", 1, 5, "float", progresscallback);
        cluielem::add_clientfield("promptState", 1, 2, "int", var_ca3086f0);
    }

}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 3, eflags: 0x0
// Checksum 0xd0638e0c, Offset: 0xc8
// Size: 0x58
function register(uid, progresscallback, var_ca3086f0) {
    elem = new cseeker_mine_prompt();
    [[ elem ]]->setup_clientfields(uid, progresscallback, var_ca3086f0);
    return elem;
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 1, eflags: 0x0
// Checksum 0x845bdba5, Offset: 0x128
// Size: 0x40
function register_clientside(uid) {
    elem = new cseeker_mine_prompt();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 1, eflags: 0x0
// Checksum 0xed78596a, Offset: 0x170
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 1, eflags: 0x0
// Checksum 0x1052fb7f, Offset: 0x198
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 1, eflags: 0x0
// Checksum 0xf9ed2318, Offset: 0x1c0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 2, eflags: 0x0
// Checksum 0x43a19034, Offset: 0x1e8
// Size: 0x28
function set_progress(localclientnum, value) {
    [[ self ]]->set_progress(localclientnum, value);
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 2, eflags: 0x0
// Checksum 0x4a520742, Offset: 0x218
// Size: 0x28
function set_promptstate(localclientnum, value) {
    [[ self ]]->set_promptstate(localclientnum, value);
}

