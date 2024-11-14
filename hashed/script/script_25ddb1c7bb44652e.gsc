#using scripts\core_common\lui_shared;
#using scripts\core_common\clientfield_shared;

#namespace zm_tut_hint_text;

// Namespace zm_tut_hint_text
// Method(s) 7 Total 14
class czm_tut_hint_text : cluielem {

    var var_47e79fc;

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 2, eflags: 0x0
    // Checksum 0xe0d368c2, Offset: 0x3f8
    // Size: 0x3c
    function set_text(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "text", value);
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 2, eflags: 0x0
    // Checksum 0x587cfc0e, Offset: 0x330
    // Size: 0xbc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 0);
            return;
        }
        if (#"visible" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 1);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 1, eflags: 0x0
    // Checksum 0x6af2363f, Offset: 0x300
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 2, eflags: 0x0
    // Checksum 0x52408ad9, Offset: 0x2b0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_tut_hint_text", persistent);
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 1, eflags: 0x0
    // Checksum 0xc73b4407, Offset: 0x230
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 1, "int");
        cluielem::function_dcb34c80("string", "text", 1);
    }

}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 1, eflags: 0x0
// Checksum 0xfdf849c2, Offset: 0xd8
// Size: 0x40
function register(uid) {
    elem = new czm_tut_hint_text();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 2, eflags: 0x0
// Checksum 0x1933f22d, Offset: 0x120
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 1, eflags: 0x0
// Checksum 0xb3b9eb07, Offset: 0x160
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 1, eflags: 0x0
// Checksum 0xc0ddcea, Offset: 0x188
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 2, eflags: 0x0
// Checksum 0xca048372, Offset: 0x1b0
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 2, eflags: 0x0
// Checksum 0x5ba9c4d1, Offset: 0x1e0
// Size: 0x28
function set_text(player, value) {
    [[ self ]]->set_text(player, value);
}

