// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace cp_skip_scene_menu;

// Namespace cp_skip_scene_menu
// Method(s) 10 Total 16
class ccp_skip_scene_menu : cluielem {

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 0, eflags: 0x9 linked
    // Checksum 0xd1bd8fa3, Offset: 0x2e0
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x70b5e9e7, Offset: 0x5d8
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6ea23ef9, Offset: 0x5a0
    // Size: 0x30
    function set_sceneskipendtime(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "sceneSkipEndTime", value);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 2, eflags: 0x1 linked
    // Checksum 0x53c891d3, Offset: 0x568
    // Size: 0x30
    function set_votedtoskip(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "votedToSkip", value);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 2, eflags: 0x1 linked
    // Checksum 0x75f74e29, Offset: 0x530
    // Size: 0x30
    function set_hostisskipping(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "hostIsSkipping", value);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 2, eflags: 0x1 linked
    // Checksum 0xf627e7de, Offset: 0x4f8
    // Size: 0x30
    function set_showskipbutton(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "showSkipButton", value);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 1, eflags: 0x1 linked
    // Checksum 0xfebcd382, Offset: 0x4c0
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"cp_skip_scene_menu");
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc0500e7b, Offset: 0x420
    // Size: 0x94
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "showSkipButton", 0);
        [[ self ]]->set_data(localclientnum, "hostIsSkipping", 0);
        [[ self ]]->set_data(localclientnum, "votedToSkip", 0);
        [[ self ]]->set_data(localclientnum, "sceneSkipEndTime", 0);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 1, eflags: 0x1 linked
    // Checksum 0x175a237a, Offset: 0x3f0
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace ccp_skip_scene_menu/cp_skip_scene_menu
    // Params 5, eflags: 0x1 linked
    // Checksum 0xa8bea594, Offset: 0x300
    // Size: 0xe4
    function setup_clientfields(uid, var_792f3702, var_69bfc3be, var_b2a12719, var_266fe805) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("showSkipButton", 1, 2, "int", var_792f3702);
        cluielem::add_clientfield("hostIsSkipping", 1, 1, "int", var_69bfc3be);
        cluielem::add_clientfield("votedToSkip", 1, 1, "int", var_b2a12719);
        cluielem::add_clientfield("sceneSkipEndTime", 1, 3, "int", var_266fe805);
    }

}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 5, eflags: 0x1 linked
// Checksum 0xe217ba1f, Offset: 0xe8
// Size: 0x70
function register(uid, var_792f3702, var_69bfc3be, var_b2a12719, var_266fe805) {
    elem = new ccp_skip_scene_menu();
    [[ elem ]]->setup_clientfields(uid, var_792f3702, var_69bfc3be, var_b2a12719, var_266fe805);
    return elem;
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 1, eflags: 0x0
// Checksum 0x1d5dfdbe, Offset: 0x160
// Size: 0x40
function register_clientside(uid) {
    elem = new ccp_skip_scene_menu();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 1, eflags: 0x0
// Checksum 0x6d31b745, Offset: 0x1a8
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 1, eflags: 0x0
// Checksum 0xfca6a545, Offset: 0x1d0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 1, eflags: 0x0
// Checksum 0xaa8c5706, Offset: 0x1f8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 2, eflags: 0x0
// Checksum 0x7370161, Offset: 0x220
// Size: 0x28
function set_showskipbutton(localclientnum, value) {
    [[ self ]]->set_showskipbutton(localclientnum, value);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 2, eflags: 0x0
// Checksum 0x7089a29c, Offset: 0x250
// Size: 0x28
function set_hostisskipping(localclientnum, value) {
    [[ self ]]->set_hostisskipping(localclientnum, value);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 2, eflags: 0x0
// Checksum 0x1fba3a56, Offset: 0x280
// Size: 0x28
function set_votedtoskip(localclientnum, value) {
    [[ self ]]->set_votedtoskip(localclientnum, value);
}

// Namespace cp_skip_scene_menu/cp_skip_scene_menu
// Params 2, eflags: 0x0
// Checksum 0xb3872ffb, Offset: 0x2b0
// Size: 0x28
function set_sceneskipendtime(localclientnum, value) {
    [[ self ]]->set_sceneskipendtime(localclientnum, value);
}

