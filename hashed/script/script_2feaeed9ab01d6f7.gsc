// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace full_screen_black;

// Namespace full_screen_black
// Method(s) 13 Total 19
class cfull_screen_black : cluielem {

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa96a7069, Offset: 0x810
    // Size: 0x30
    function set_drawhud(localclientnum, value) {
        set_data(localclientnum, "drawHUD", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x1 linked
    // Checksum 0x762135ca, Offset: 0x7d8
    // Size: 0x30
    function set_endalpha(localclientnum, value) {
        set_data(localclientnum, "endAlpha", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2f79870b, Offset: 0x7a0
    // Size: 0x30
    function set_startalpha(localclientnum, value) {
        set_data(localclientnum, "startAlpha", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x1 linked
    // Checksum 0x780c8161, Offset: 0x768
    // Size: 0x30
    function set_fadeovertime(localclientnum, value) {
        set_data(localclientnum, "fadeOverTime", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x1 linked
    // Checksum 0x51e86f79, Offset: 0x730
    // Size: 0x30
    function set_blue(localclientnum, value) {
        set_data(localclientnum, "blue", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x1 linked
    // Checksum 0x87efab85, Offset: 0x6f8
    // Size: 0x30
    function set_green(localclientnum, value) {
        set_data(localclientnum, "green", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 2, eflags: 0x1 linked
    // Checksum 0x59bf51d1, Offset: 0x6c0
    // Size: 0x30
    function set_red(localclientnum, value) {
        set_data(localclientnum, "red", value);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1f1f9b49, Offset: 0x688
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"full_screen_black");
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 1, eflags: 0x1 linked
    // Checksum 0xd53fce31, Offset: 0x570
    // Size: 0x110
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "red", 0);
        set_data(localclientnum, "green", 0);
        set_data(localclientnum, "blue", 0);
        set_data(localclientnum, "fadeOverTime", 0);
        set_data(localclientnum, "startAlpha", 0);
        set_data(localclientnum, "endAlpha", 0);
        set_data(localclientnum, "drawHUD", 0);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 1, eflags: 0x1 linked
    // Checksum 0x805bb644, Offset: 0x540
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cfull_screen_black/full_screen_black
    // Params 8, eflags: 0x1 linked
    // Checksum 0xb7350a45, Offset: 0x3c0
    // Size: 0x174
    function setup_clientfields(uid, redcallback, greencallback, bluecallback, fadeovertimecallback, var_b046940, var_34291db, var_32445b2) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("red", 1, 3, "float", redcallback);
        cluielem::add_clientfield("green", 1, 3, "float", greencallback);
        cluielem::add_clientfield("blue", 1, 3, "float", bluecallback);
        cluielem::add_clientfield("fadeOverTime", 1, 12, "int", fadeovertimecallback);
        cluielem::add_clientfield("startAlpha", 1, 5, "float", var_b046940);
        cluielem::add_clientfield("endAlpha", 1, 5, "float", var_34291db);
        cluielem::add_clientfield("drawHUD", 1, 1, "int", var_32445b2);
    }

}

// Namespace full_screen_black/full_screen_black
// Params 8, eflags: 0x1 linked
// Checksum 0x320d2459, Offset: 0xf0
// Size: 0x94
function register(uid, redcallback, greencallback, bluecallback, fadeovertimecallback, var_b046940, var_34291db, var_32445b2) {
    elem = new cfull_screen_black();
    [[ elem ]]->setup_clientfields(uid, redcallback, greencallback, bluecallback, fadeovertimecallback, var_b046940, var_34291db, var_32445b2);
    return elem;
}

// Namespace full_screen_black/full_screen_black
// Params 1, eflags: 0x0
// Checksum 0x9ec43f2d, Offset: 0x190
// Size: 0x40
function register_clientside(uid) {
    elem = new cfull_screen_black();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace full_screen_black/full_screen_black
// Params 1, eflags: 0x0
// Checksum 0xb631f30b, Offset: 0x1d8
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace full_screen_black/full_screen_black
// Params 1, eflags: 0x0
// Checksum 0x131fb4bd, Offset: 0x200
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace full_screen_black/full_screen_black
// Params 1, eflags: 0x0
// Checksum 0xe1a3a1e5, Offset: 0x228
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0x7056e8b8, Offset: 0x250
// Size: 0x28
function set_red(localclientnum, value) {
    [[ self ]]->set_red(localclientnum, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0x9c50f715, Offset: 0x280
// Size: 0x28
function set_green(localclientnum, value) {
    [[ self ]]->set_green(localclientnum, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0xd20ab2cd, Offset: 0x2b0
// Size: 0x28
function set_blue(localclientnum, value) {
    [[ self ]]->set_blue(localclientnum, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0x4371ce57, Offset: 0x2e0
// Size: 0x28
function set_fadeovertime(localclientnum, value) {
    [[ self ]]->set_fadeovertime(localclientnum, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0x558d1c5a, Offset: 0x310
// Size: 0x28
function set_startalpha(localclientnum, value) {
    [[ self ]]->set_startalpha(localclientnum, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0x9254a5b7, Offset: 0x340
// Size: 0x28
function set_endalpha(localclientnum, value) {
    [[ self ]]->set_endalpha(localclientnum, value);
}

// Namespace full_screen_black/full_screen_black
// Params 2, eflags: 0x0
// Checksum 0xbbd2d0cf, Offset: 0x370
// Size: 0x28
function set_drawhud(localclientnum, value) {
    [[ self ]]->set_drawhud(localclientnum, value);
}

