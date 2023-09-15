// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace full_screen_movie;

// Namespace full_screen_movie
// Method(s) 13 Total 19
class cfull_screen_movie : cluielem {

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 0, eflags: 0x8
    // Checksum 0x8a3213f, Offset: 0x3b8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xb1e92033, Offset: 0x858
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0x99db496b, Offset: 0x820
    // Size: 0x30
    function set_moviekey(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "movieKey", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0xe353861d, Offset: 0x7e8
    // Size: 0x30
    function registerplayer_callout_traversal(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "skippable", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0x570d7d89, Offset: 0x7b0
    // Size: 0x30
    function set_playoutromovie(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "playOutroMovie", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0xb255d71a, Offset: 0x778
    // Size: 0x30
    function set_additive(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "additive", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0xe7b811cb, Offset: 0x740
    // Size: 0x30
    function set_looping(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "looping", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0x4afb6c5b, Offset: 0x708
    // Size: 0x30
    function set_showblackscreen(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "showBlackScreen", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 2, eflags: 0x0
    // Checksum 0xf88e0bb3, Offset: 0x6d0
    // Size: 0x30
    function set_moviename(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "movieName", value);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 1, eflags: 0x0
    // Checksum 0x884ffaae, Offset: 0x698
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"full_screen_movie");
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 1, eflags: 0x0
    // Checksum 0xad0b02b2, Offset: 0x588
    // Size: 0x104
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "movieName", #"hash_0");
        [[ self ]]->set_data(localclientnum, "showBlackScreen", 0);
        [[ self ]]->set_data(localclientnum, "looping", 0);
        [[ self ]]->set_data(localclientnum, "additive", 0);
        [[ self ]]->set_data(localclientnum, "playOutroMovie", 0);
        [[ self ]]->set_data(localclientnum, "skippable", 0);
        [[ self ]]->set_data(localclientnum, "movieKey", #"hash_0");
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 1, eflags: 0x0
    // Checksum 0xb5de22c, Offset: 0x558
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cfull_screen_movie/full_screen_movie
    // Params 8, eflags: 0x0
    // Checksum 0xe1c5b283, Offset: 0x3d8
    // Size: 0x174
    function setup_clientfields(uid, var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9, var_78184b90, var_8ba396cb, var_ea38d488) {
        cluielem::setup_clientfields(uid);
        cluielem::function_dcb34c80("moviefile", "movieName", 1);
        cluielem::add_clientfield("showBlackScreen", 1, 1, "int", var_d5b04ae3);
        cluielem::add_clientfield("looping", 1, 1, "int", var_e4decd0);
        cluielem::add_clientfield("additive", 1, 1, "int", var_e545d4b9);
        cluielem::add_clientfield("playOutroMovie", 1, 1, "int", var_78184b90);
        cluielem::add_clientfield("skippable", 1, 1, "int", var_8ba396cb);
        cluielem::function_dcb34c80("moviefile", "movieKey", 18000);
    }

}

// Namespace full_screen_movie/full_screen_movie
// Params 8, eflags: 0x0
// Checksum 0xaadd2040, Offset: 0x108
// Size: 0x94
function register(uid, var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9, var_78184b90, var_8ba396cb, var_ea38d488) {
    elem = new cfull_screen_movie();
    [[ elem ]]->setup_clientfields(uid, var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9, var_78184b90, var_8ba396cb, var_ea38d488);
    return elem;
}

// Namespace full_screen_movie/full_screen_movie
// Params 1, eflags: 0x0
// Checksum 0x157238f4, Offset: 0x1a8
// Size: 0x40
function register_clientside(uid) {
    elem = new cfull_screen_movie();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace full_screen_movie/full_screen_movie
// Params 1, eflags: 0x0
// Checksum 0xd07721e2, Offset: 0x1f0
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace full_screen_movie/full_screen_movie
// Params 1, eflags: 0x0
// Checksum 0xf10130fa, Offset: 0x218
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace full_screen_movie/full_screen_movie
// Params 1, eflags: 0x0
// Checksum 0xd83c94e4, Offset: 0x240
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0x6f24a61c, Offset: 0x268
// Size: 0x28
function set_moviename(localclientnum, value) {
    [[ self ]]->set_moviename(localclientnum, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0x40dfc805, Offset: 0x298
// Size: 0x28
function set_showblackscreen(localclientnum, value) {
    [[ self ]]->set_showblackscreen(localclientnum, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0x9e169bf8, Offset: 0x2c8
// Size: 0x28
function set_looping(localclientnum, value) {
    [[ self ]]->set_looping(localclientnum, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0x4eb25caa, Offset: 0x2f8
// Size: 0x28
function set_additive(localclientnum, value) {
    [[ self ]]->set_additive(localclientnum, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0xdb2b00fa, Offset: 0x328
// Size: 0x28
function set_playoutromovie(localclientnum, value) {
    [[ self ]]->set_playoutromovie(localclientnum, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0x65d7b289, Offset: 0x358
// Size: 0x28
function registerplayer_callout_traversal(localclientnum, value) {
    [[ self ]]->registerplayer_callout_traversal(localclientnum, value);
}

// Namespace full_screen_movie/full_screen_movie
// Params 2, eflags: 0x0
// Checksum 0xe8b8249b, Offset: 0x388
// Size: 0x28
function set_moviekey(localclientnum, value) {
    [[ self ]]->set_moviekey(localclientnum, value);
}

