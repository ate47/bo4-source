#using scripts\core_common\lui_shared;
#using scripts\core_common\clientfield_shared;

#namespace cp_skip_scene_menu;

// Namespace cp_skip_scene_menu
// Method(s) 9 Total 16
class ccp_skip_scene_menu : cluielem {

    var var_47e79fc;

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 2, eflags: 0x1 linked
    // Checksum 0xf75feb76, Offset: 0x4e0
    // Size: 0x3c
    function set_sceneskipendtime(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "sceneSkipEndTime", value);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2c8af207, Offset: 0x498
    // Size: 0x3c
    function set_votedtoskip(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "votedToSkip", value);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 2, eflags: 0x1 linked
    // Checksum 0x92e3eb95, Offset: 0x450
    // Size: 0x3c
    function set_hostisskipping(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "hostIsSkipping", value);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 2, eflags: 0x1 linked
    // Checksum 0x81dd097f, Offset: 0x408
    // Size: 0x3c
    function set_showskipbutton(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "showSkipButton", value);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 1, eflags: 0x1 linked
    // Checksum 0xd548bd5c, Offset: 0x3d8
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa5ecdf73, Offset: 0x388
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "cp_skip_scene_menu", persistent);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3395831a, Offset: 0x2b8
    // Size: 0xc4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("showSkipButton", 1, 2, "int");
        cluielem::add_clientfield("hostIsSkipping", 1, 1, "int");
        cluielem::add_clientfield("votedToSkip", 1, 1, "int");
        cluielem::add_clientfield("sceneSkipEndTime", 1, 3, "int");
    }

}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 1, eflags: 0x1 linked
// Checksum 0x74fb03a9, Offset: 0x100
// Size: 0x40
function register(uid) {
    elem = new ccp_skip_scene_menu();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 2, eflags: 0x1 linked
// Checksum 0x9adfa183, Offset: 0x148
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 1, eflags: 0x1 linked
// Checksum 0xfabeb683, Offset: 0x188
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 1, eflags: 0x0
// Checksum 0xb1e41488, Offset: 0x1b0
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 2, eflags: 0x1 linked
// Checksum 0x1c0c8cdc, Offset: 0x1d8
// Size: 0x28
function set_showskipbutton(player, value) {
    [[ self ]]->set_showskipbutton(player, value);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 2, eflags: 0x1 linked
// Checksum 0x8237d3b3, Offset: 0x208
// Size: 0x28
function set_hostisskipping(player, value) {
    [[ self ]]->set_hostisskipping(player, value);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 2, eflags: 0x1 linked
// Checksum 0xead7b66b, Offset: 0x238
// Size: 0x28
function set_votedtoskip(player, value) {
    [[ self ]]->set_votedtoskip(player, value);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 2, eflags: 0x1 linked
// Checksum 0x5a2d00cb, Offset: 0x268
// Size: 0x28
function set_sceneskipendtime(player, value) {
    [[ self ]]->set_sceneskipendtime(player, value);
}

