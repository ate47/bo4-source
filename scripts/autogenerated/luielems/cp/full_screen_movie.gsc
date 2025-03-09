#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace full_screen_movie;

// Namespace full_screen_movie
// Method(s) 12 Total 19
class cfull_screen_movie : cluielem {

    var _uid;

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0xdc36eb36, Offset: 0x6e8
    // Size: 0x3c
    function set_moviekey(player, value) {
        player clientfield::function_9bf78ef8(_uid, "movieKey", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0x4988a482, Offset: 0x6a0
    // Size: 0x3c
    function registerplayer_callout_traversal(player, value) {
        player clientfield::function_9bf78ef8(_uid, "skippable", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0x8f3613a0, Offset: 0x658
    // Size: 0x3c
    function set_playoutromovie(player, value) {
        player clientfield::function_9bf78ef8(_uid, "playOutroMovie", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0x94bdf6e6, Offset: 0x610
    // Size: 0x3c
    function set_additive(player, value) {
        player clientfield::function_9bf78ef8(_uid, "additive", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0xada264e, Offset: 0x5c8
    // Size: 0x3c
    function set_looping(player, value) {
        player clientfield::function_9bf78ef8(_uid, "looping", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0x3fe28c1b, Offset: 0x580
    // Size: 0x3c
    function set_showblackscreen(player, value) {
        player clientfield::function_9bf78ef8(_uid, "showBlackScreen", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0x4eced0fb, Offset: 0x538
    // Size: 0x3c
    function set_moviename(player, value) {
        player clientfield::function_9bf78ef8(_uid, "movieName", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 1, eflags: 0x0
    // Checksum 0x394ffd5, Offset: 0x508
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0x704c253b, Offset: 0x4b8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "full_screen_movie", persistent);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 1, eflags: 0x0
    // Checksum 0x5553d56b, Offset: 0x370
    // Size: 0x13c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::function_dcb34c80("moviefile", "movieName", 1);
        cluielem::add_clientfield("showBlackScreen", 1, 1, "int");
        cluielem::add_clientfield("looping", 1, 1, "int");
        cluielem::add_clientfield("additive", 1, 1, "int");
        cluielem::add_clientfield("playOutroMovie", 1, 1, "int");
        cluielem::add_clientfield("skippable", 1, 1, "int");
        cluielem::function_dcb34c80("moviefile", "movieKey", 18000);
    }

}

// Namespace full_screen_movie/full_screen_movie
// Params 1, eflags: 0x0
// Checksum 0xf79c536e, Offset: 0x128
// Size: 0x40
function register(uid) {
    elem = new cfull_screen_movie();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0xf6470b0, Offset: 0x170
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace full_screen_movie/full_screen_movie
// Params 1, eflags: 0x0
// Checksum 0xcc4a7a58, Offset: 0x1b0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace full_screen_movie/full_screen_movie
// Params 1, eflags: 0x0
// Checksum 0xf82433d4, Offset: 0x1d8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0x774e6e2f, Offset: 0x200
// Size: 0x28
function set_moviename(player, value) {
    [[ self ]]->set_moviename(player, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0xe85542fe, Offset: 0x230
// Size: 0x28
function set_showblackscreen(player, value) {
    [[ self ]]->set_showblackscreen(player, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0x1316043c, Offset: 0x260
// Size: 0x28
function set_looping(player, value) {
    [[ self ]]->set_looping(player, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0xc7c6ed35, Offset: 0x290
// Size: 0x28
function set_additive(player, value) {
    [[ self ]]->set_additive(player, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0x81478f11, Offset: 0x2c0
// Size: 0x28
function set_playoutromovie(player, value) {
    [[ self ]]->set_playoutromovie(player, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0x635bafca, Offset: 0x2f0
// Size: 0x28
function registerplayer_callout_traversal(player, value) {
    [[ self ]]->registerplayer_callout_traversal(player, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0x54c0c316, Offset: 0x320
// Size: 0x28
function set_moviekey(player, value) {
    [[ self ]]->set_moviekey(player, value);
}

