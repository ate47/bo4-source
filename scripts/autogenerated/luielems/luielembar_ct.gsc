#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace luielembar_ct;

// Namespace luielembar_ct
// Method(s) 15 Total 22
class cluielembar_ct : cluielem {

    var _uid;

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xeb6f5279, Offset: 0xbf0
    // Size: 0x3c
    function set_bar_percent(player, value) {
        player clientfield::function_9bf78ef8(_uid, "bar_percent", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xa446de64, Offset: 0xba8
    // Size: 0x3c
    function set_blue(player, value) {
        player clientfield::function_9bf78ef8(_uid, "blue", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0x7de0dd94, Offset: 0xb60
    // Size: 0x3c
    function set_green(player, value) {
        player clientfield::function_9bf78ef8(_uid, "green", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0x88b698e3, Offset: 0xb18
    // Size: 0x3c
    function set_red(player, value) {
        player clientfield::function_9bf78ef8(_uid, "red", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xfdffa5d3, Offset: 0xad0
    // Size: 0x3c
    function set_alpha(player, value) {
        player clientfield::function_9bf78ef8(_uid, "alpha", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xe565c188, Offset: 0xa88
    // Size: 0x3c
    function set_fadeovertime(player, value) {
        player clientfield::function_9bf78ef8(_uid, "fadeOverTime", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0x8592683d, Offset: 0xa40
    // Size: 0x3c
    function set_height(player, value) {
        player clientfield::function_9bf78ef8(_uid, "height", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0x7091cf0b, Offset: 0x9f8
    // Size: 0x3c
    function set_width(player, value) {
        player clientfield::function_9bf78ef8(_uid, "width", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xbea0a124, Offset: 0x9b0
    // Size: 0x3c
    function set_y(player, value) {
        player clientfield::function_9bf78ef8(_uid, "y", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0x9ae01914, Offset: 0x968
    // Size: 0x3c
    function set_x(player, value) {
        player clientfield::function_9bf78ef8(_uid, "x", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 1, eflags: 0x0
    // Checksum 0x7c3a5041, Offset: 0x938
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0x272f7e96, Offset: 0x8e8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "LUIelemBar_ct", persistent);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 1, eflags: 0x0
    // Checksum 0x553f19e7, Offset: 0x728
    // Size: 0x1b4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("x", 1, 7, "int");
        cluielem::add_clientfield("y", 1, 6, "int");
        cluielem::add_clientfield("width", 1, 6, "int");
        cluielem::add_clientfield("height", 1, 6, "int");
        cluielem::add_clientfield("fadeOverTime", 1, 5, "int");
        cluielem::add_clientfield("alpha", 1, 4, "float");
        cluielem::add_clientfield("red", 1, 4, "float");
        cluielem::add_clientfield("green", 1, 4, "float");
        cluielem::add_clientfield("blue", 1, 4, "float");
        cluielem::add_clientfield("bar_percent", 1, 6, "float");
    }

}

// Namespace luielembar_ct/luielembar_ct
// Params 4, eflags: 0x0
// Checksum 0x7fe53244, Offset: 0x118
// Size: 0x6c
function set_color(player, red, green, blue) {
    self set_red(player, red);
    self set_green(player, green);
    self set_blue(player, blue);
}

// Namespace luielembar_ct/luielembar_ct
// Params 3, eflags: 0x0
// Checksum 0x7a2abff0, Offset: 0x190
// Size: 0x7c
function fade(player, var_1a92607f, duration = 0) {
    self set_alpha(player, var_1a92607f);
    self set_fadeovertime(player, int(duration * 10));
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0xd5b4e639, Offset: 0x218
// Size: 0x44
function show(player, duration = 0) {
    self fade(player, 1, duration);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0xa36ac881, Offset: 0x268
// Size: 0x3c
function hide(player, duration = 0) {
    self fade(player, 0, duration);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x5148e2b7, Offset: 0x2b0
// Size: 0x4c
function function_e5898fd7(player, var_c6572d9b) {
    self set_x(player, int(var_c6572d9b / 15));
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0xe1ceed50, Offset: 0x308
// Size: 0x4c
function function_58a135d3(player, var_d390c80e) {
    self set_y(player, int(var_d390c80e / 15));
}

// Namespace luielembar_ct/luielembar_ct
// Params 3, eflags: 0x0
// Checksum 0x5f039d9e, Offset: 0x360
// Size: 0x4c
function function_f97e9049(player, var_c6572d9b, var_d390c80e) {
    self function_e5898fd7(player, var_c6572d9b);
    self function_58a135d3(player, var_d390c80e);
}

// Namespace luielembar_ct/luielembar_ct
// Params 3, eflags: 0x0
// Checksum 0x4a8c1b8d, Offset: 0x3b8
// Size: 0x8c
function function_35f52fe9(player, width, height) {
    self set_width(player, int(width / 4));
    self set_height(player, int(height / 4));
}

// Namespace luielembar_ct/luielembar_ct
// Params 1, eflags: 0x0
// Checksum 0x9a8d91f2, Offset: 0x450
// Size: 0x40
function register(uid) {
    elem = new cluielembar_ct();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x66ae096c, Offset: 0x498
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace luielembar_ct/luielembar_ct
// Params 1, eflags: 0x0
// Checksum 0xd1e25b03, Offset: 0x4d8
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace luielembar_ct/luielembar_ct
// Params 1, eflags: 0x0
// Checksum 0xadbc8b3c, Offset: 0x500
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x878b3d10, Offset: 0x528
// Size: 0x28
function set_x(player, value) {
    [[ self ]]->set_x(player, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0xfb4b9304, Offset: 0x558
// Size: 0x28
function set_y(player, value) {
    [[ self ]]->set_y(player, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x93ff9059, Offset: 0x588
// Size: 0x28
function set_width(player, value) {
    [[ self ]]->set_width(player, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x791f10a3, Offset: 0x5b8
// Size: 0x28
function set_height(player, value) {
    [[ self ]]->set_height(player, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x4f7ff27d, Offset: 0x5e8
// Size: 0x28
function set_fadeovertime(player, value) {
    [[ self ]]->set_fadeovertime(player, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0xb493ee0, Offset: 0x618
// Size: 0x28
function set_alpha(player, value) {
    [[ self ]]->set_alpha(player, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x9df3bff2, Offset: 0x648
// Size: 0x28
function set_red(player, value) {
    [[ self ]]->set_red(player, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x6c07628a, Offset: 0x678
// Size: 0x28
function set_green(player, value) {
    [[ self ]]->set_green(player, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x72764bfa, Offset: 0x6a8
// Size: 0x28
function set_blue(player, value) {
    [[ self ]]->set_blue(player, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x5fd1f414, Offset: 0x6d8
// Size: 0x28
function set_bar_percent(player, value) {
    [[ self ]]->set_bar_percent(player, value);
}

