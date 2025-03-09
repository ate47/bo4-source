#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace luielembar;

// Namespace luielembar
// Method(s) 15 Total 22
class cluielembar : cluielem {

    var _uid;

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0x3023f565, Offset: 0xbe8
    // Size: 0x3c
    function set_bar_percent(player, value) {
        player clientfield::function_9bf78ef8(_uid, "bar_percent", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0x12adc59c, Offset: 0xba0
    // Size: 0x3c
    function set_blue(player, value) {
        player clientfield::function_9bf78ef8(_uid, "blue", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0xb30bad0c, Offset: 0xb58
    // Size: 0x3c
    function set_green(player, value) {
        player clientfield::function_9bf78ef8(_uid, "green", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0x1c2a8, Offset: 0xb10
    // Size: 0x3c
    function set_red(player, value) {
        player clientfield::function_9bf78ef8(_uid, "red", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0x37f9990f, Offset: 0xac8
    // Size: 0x3c
    function set_alpha(player, value) {
        player clientfield::function_9bf78ef8(_uid, "alpha", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0x2b63a693, Offset: 0xa80
    // Size: 0x3c
    function set_fadeovertime(player, value) {
        player clientfield::function_9bf78ef8(_uid, "fadeOverTime", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0xb89270d4, Offset: 0xa38
    // Size: 0x3c
    function set_height(player, value) {
        player clientfield::function_9bf78ef8(_uid, "height", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0xed9fff82, Offset: 0x9f0
    // Size: 0x3c
    function set_width(player, value) {
        player clientfield::function_9bf78ef8(_uid, "width", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0xbfc92ecc, Offset: 0x9a8
    // Size: 0x3c
    function set_y(player, value) {
        player clientfield::function_9bf78ef8(_uid, "y", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0xe91b164c, Offset: 0x960
    // Size: 0x3c
    function set_x(player, value) {
        player clientfield::function_9bf78ef8(_uid, "x", value);
    }

    // Namespace cluielembar/luielembar
    // Params 1, eflags: 0x0
    // Checksum 0xde576393, Offset: 0x930
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x0
    // Checksum 0x86e81213, Offset: 0x8e0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "LUIelemBar", persistent);
    }

    // Namespace cluielembar/luielembar
    // Params 1, eflags: 0x0
    // Checksum 0xf04c8ef, Offset: 0x720
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

// Namespace luielembar/luielembar
// Params 4, eflags: 0x0
// Checksum 0xbb552664, Offset: 0x110
// Size: 0x6c
function set_color(player, red, green, blue) {
    self set_red(player, red);
    self set_green(player, green);
    self set_blue(player, blue);
}

// Namespace luielembar/luielembar
// Params 3, eflags: 0x0
// Checksum 0x838ff959, Offset: 0x188
// Size: 0x7c
function fade(player, var_1a92607f, duration = 0) {
    self set_alpha(player, var_1a92607f);
    self set_fadeovertime(player, int(duration * 10));
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0xda5f2429, Offset: 0x210
// Size: 0x44
function show(player, duration = 0) {
    self fade(player, 1, duration);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0xb71a439b, Offset: 0x260
// Size: 0x3c
function hide(player, duration = 0) {
    self fade(player, 0, duration);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0xdb2dc95, Offset: 0x2a8
// Size: 0x4c
function function_e5898fd7(player, var_c6572d9b) {
    self set_x(player, int(var_c6572d9b / 15));
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x345e3ab8, Offset: 0x300
// Size: 0x4c
function function_58a135d3(player, var_d390c80e) {
    self set_y(player, int(var_d390c80e / 15));
}

// Namespace luielembar/luielembar
// Params 3, eflags: 0x0
// Checksum 0x12d2ed2f, Offset: 0x358
// Size: 0x4c
function function_f97e9049(player, var_c6572d9b, var_d390c80e) {
    self function_e5898fd7(player, var_c6572d9b);
    self function_58a135d3(player, var_d390c80e);
}

// Namespace luielembar/luielembar
// Params 3, eflags: 0x0
// Checksum 0xc804ff11, Offset: 0x3b0
// Size: 0x8c
function function_35f52fe9(player, width, height) {
    self set_width(player, int(width / 4));
    self set_height(player, int(height / 4));
}

// Namespace luielembar/luielembar
// Params 1, eflags: 0x0
// Checksum 0x3d8405a8, Offset: 0x448
// Size: 0x40
function register(uid) {
    elem = new cluielembar();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x5d7e346e, Offset: 0x490
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace luielembar/luielembar
// Params 1, eflags: 0x0
// Checksum 0x77d29e05, Offset: 0x4d0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace luielembar/luielembar
// Params 1, eflags: 0x0
// Checksum 0x8008bd42, Offset: 0x4f8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0xadc9ff71, Offset: 0x520
// Size: 0x28
function set_x(player, value) {
    [[ self ]]->set_x(player, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x266c89a, Offset: 0x550
// Size: 0x28
function set_y(player, value) {
    [[ self ]]->set_y(player, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x5c1ac7eb, Offset: 0x580
// Size: 0x28
function set_width(player, value) {
    [[ self ]]->set_width(player, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0xd2638470, Offset: 0x5b0
// Size: 0x28
function set_height(player, value) {
    [[ self ]]->set_height(player, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x3057448b, Offset: 0x5e0
// Size: 0x28
function set_fadeovertime(player, value) {
    [[ self ]]->set_fadeovertime(player, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x52c7aff8, Offset: 0x610
// Size: 0x28
function set_alpha(player, value) {
    [[ self ]]->set_alpha(player, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x4a25cb24, Offset: 0x640
// Size: 0x28
function set_red(player, value) {
    [[ self ]]->set_red(player, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x1e46b737, Offset: 0x670
// Size: 0x28
function set_green(player, value) {
    [[ self ]]->set_green(player, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x765c5729, Offset: 0x6a0
// Size: 0x28
function set_blue(player, value) {
    [[ self ]]->set_blue(player, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0xb4f3976, Offset: 0x6d0
// Size: 0x28
function set_bar_percent(player, value) {
    [[ self ]]->set_bar_percent(player, value);
}

