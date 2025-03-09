#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace full_screen_black;

// Namespace full_screen_black
// Method(s) 12 Total 19
class cfull_screen_black : cluielem {

    var _uid;

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x0
    // Checksum 0x5ba0ab8b, Offset: 0x6d0
    // Size: 0x3c
    function set_drawhud(player, value) {
        player clientfield::function_9bf78ef8(_uid, "drawHUD", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x0
    // Checksum 0x811f9f36, Offset: 0x688
    // Size: 0x3c
    function set_endalpha(player, value) {
        player clientfield::function_9bf78ef8(_uid, "endAlpha", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x0
    // Checksum 0x9e5efddd, Offset: 0x640
    // Size: 0x3c
    function set_startalpha(player, value) {
        player clientfield::function_9bf78ef8(_uid, "startAlpha", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x0
    // Checksum 0x48606386, Offset: 0x5f8
    // Size: 0x3c
    function set_fadeovertime(player, value) {
        player clientfield::function_9bf78ef8(_uid, "fadeOverTime", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x0
    // Checksum 0xb645405c, Offset: 0x5b0
    // Size: 0x3c
    function set_blue(player, value) {
        player clientfield::function_9bf78ef8(_uid, "blue", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x0
    // Checksum 0x3ea3e646, Offset: 0x568
    // Size: 0x3c
    function set_green(player, value) {
        player clientfield::function_9bf78ef8(_uid, "green", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x0
    // Checksum 0xc1c03da9, Offset: 0x520
    // Size: 0x3c
    function set_red(player, value) {
        player clientfield::function_9bf78ef8(_uid, "red", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 1, eflags: 0x0
    // Checksum 0xe999f1f1, Offset: 0x4f0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x0
    // Checksum 0x7430c660, Offset: 0x4a0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "full_screen_black", persistent);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 1, eflags: 0x0
    // Checksum 0xb966d78b, Offset: 0x358
    // Size: 0x13c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("red", 1, 3, "float");
        cluielem::add_clientfield("green", 1, 3, "float");
        cluielem::add_clientfield("blue", 1, 3, "float");
        cluielem::add_clientfield("fadeOverTime", 1, 12, "int");
        cluielem::add_clientfield("startAlpha", 1, 5, "float");
        cluielem::add_clientfield("endAlpha", 1, 5, "float");
        cluielem::add_clientfield("drawHUD", 1, 1, "int");
    }

}

// Namespace full_screen_black/full_screen_black
// Params 1, eflags: 0x0
// Checksum 0xf1263c65, Offset: 0x110
// Size: 0x40
function register(uid) {
    elem = new cfull_screen_black();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0x9ad0a281, Offset: 0x158
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace full_screen_black/full_screen_black
// Params 1, eflags: 0x0
// Checksum 0xb1efb1ce, Offset: 0x198
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace full_screen_black/full_screen_black
// Params 1, eflags: 0x0
// Checksum 0x6426584c, Offset: 0x1c0
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0xc79397a5, Offset: 0x1e8
// Size: 0x28
function set_red(player, value) {
    [[ self ]]->set_red(player, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0x325f92c7, Offset: 0x218
// Size: 0x28
function set_green(player, value) {
    [[ self ]]->set_green(player, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0x766c5795, Offset: 0x248
// Size: 0x28
function set_blue(player, value) {
    [[ self ]]->set_blue(player, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0xa409c164, Offset: 0x278
// Size: 0x28
function set_fadeovertime(player, value) {
    [[ self ]]->set_fadeovertime(player, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0xbb08f74a, Offset: 0x2a8
// Size: 0x28
function set_startalpha(player, value) {
    [[ self ]]->set_startalpha(player, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0x9aa7315, Offset: 0x2d8
// Size: 0x28
function set_endalpha(player, value) {
    [[ self ]]->set_endalpha(player, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0x99782cd0, Offset: 0x308
// Size: 0x28
function set_drawhud(player, value) {
    [[ self ]]->set_drawhud(player, value);
}

