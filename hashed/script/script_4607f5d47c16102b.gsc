// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace luielemimage;

// Namespace luielemimage
// Method(s) 15 Total 22
class cluielemimage : cluielem {

    var var_47e79fc;

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0xa8897088, Offset: 0xbe8
    // Size: 0x3c
    function set_material(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "material", value);
    }

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0xd723aaca, Offset: 0xba0
    // Size: 0x3c
    function set_blue(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "blue", value);
    }

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0x8d2c5ca3, Offset: 0xb58
    // Size: 0x3c
    function set_green(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "green", value);
    }

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0x317080c7, Offset: 0xb10
    // Size: 0x3c
    function set_red(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "red", value);
    }

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0x6c7db9c6, Offset: 0xac8
    // Size: 0x3c
    function set_alpha(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "alpha", value);
    }

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0x65cb6f2e, Offset: 0xa80
    // Size: 0x3c
    function set_fadeovertime(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "fadeOverTime", value);
    }

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0x58608e2b, Offset: 0xa38
    // Size: 0x3c
    function set_height(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "height", value);
    }

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0xe03c410c, Offset: 0x9f0
    // Size: 0x3c
    function set_width(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "width", value);
    }

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0xb57a3365, Offset: 0x9a8
    // Size: 0x3c
    function set_y(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "y", value);
    }

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0xd365d0d5, Offset: 0x960
    // Size: 0x3c
    function set_x(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "x", value);
    }

    // Namespace cluielemimage/luielemimage
    // Params 1, eflags: 0x0
    // Checksum 0x5903f461, Offset: 0x930
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cluielemimage/luielemimage
    // Params 2, eflags: 0x0
    // Checksum 0xb2bad64d, Offset: 0x8e0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "LUIelemImage", persistent);
    }

    // Namespace cluielemimage/luielemimage
    // Params 1, eflags: 0x0
    // Checksum 0x59fc087f, Offset: 0x720
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
        cluielem::function_dcb34c80("material", "material", 1);
    }

}

// Namespace luielemimage/luielemimage
// Params 4, eflags: 0x0
// Checksum 0x283f55bc, Offset: 0x110
// Size: 0x6c
function set_color(player, red, green, blue) {
    self set_red(player, red);
    self set_green(player, green);
    self set_blue(player, blue);
}

// Namespace luielemimage/luielemimage
// Params 3, eflags: 0x0
// Checksum 0x2d0baedd, Offset: 0x188
// Size: 0x7c
function fade(player, var_1a92607f, duration = 0) {
    self set_alpha(player, var_1a92607f);
    self set_fadeovertime(player, int(duration * 10));
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0xf9b4ab03, Offset: 0x210
// Size: 0x44
function show(player, duration = 0) {
    self fade(player, 1, duration);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0xbc7d411, Offset: 0x260
// Size: 0x3c
function hide(player, duration = 0) {
    self fade(player, 0, duration);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0x67ff5a6b, Offset: 0x2a8
// Size: 0x4c
function function_e5898fd7(player, var_c6572d9b) {
    self set_x(player, int(var_c6572d9b / 15));
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0xdd3921af, Offset: 0x300
// Size: 0x4c
function function_58a135d3(player, var_d390c80e) {
    self set_y(player, int(var_d390c80e / 15));
}

// Namespace luielemimage/luielemimage
// Params 3, eflags: 0x0
// Checksum 0x99df5738, Offset: 0x358
// Size: 0x4c
function function_f97e9049(player, var_c6572d9b, var_d390c80e) {
    self function_e5898fd7(player, var_c6572d9b);
    self function_58a135d3(player, var_d390c80e);
}

// Namespace luielemimage/luielemimage
// Params 3, eflags: 0x0
// Checksum 0x54c8e8e0, Offset: 0x3b0
// Size: 0x8c
function function_35f52fe9(player, width, height) {
    self set_width(player, int(width / 4));
    self set_height(player, int(height / 4));
}

// Namespace luielemimage/luielemimage
// Params 1, eflags: 0x0
// Checksum 0xe65702f9, Offset: 0x448
// Size: 0x40
function register(uid) {
    elem = new cluielemimage();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0xfe8ab30e, Offset: 0x490
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace luielemimage/luielemimage
// Params 1, eflags: 0x0
// Checksum 0x51c8b020, Offset: 0x4d0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace luielemimage/luielemimage
// Params 1, eflags: 0x0
// Checksum 0xb1478ac1, Offset: 0x4f8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0x8e06cd3e, Offset: 0x520
// Size: 0x28
function set_x(player, value) {
    [[ self ]]->set_x(player, value);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0xd1032c02, Offset: 0x550
// Size: 0x28
function set_y(player, value) {
    [[ self ]]->set_y(player, value);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0x75c49f24, Offset: 0x580
// Size: 0x28
function set_width(player, value) {
    [[ self ]]->set_width(player, value);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0x81ef7a8e, Offset: 0x5b0
// Size: 0x28
function set_height(player, value) {
    [[ self ]]->set_height(player, value);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0x610af99f, Offset: 0x5e0
// Size: 0x28
function set_fadeovertime(player, value) {
    [[ self ]]->set_fadeovertime(player, value);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0x75ba2e4, Offset: 0x610
// Size: 0x28
function set_alpha(player, value) {
    [[ self ]]->set_alpha(player, value);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0x72b74568, Offset: 0x640
// Size: 0x28
function set_red(player, value) {
    [[ self ]]->set_red(player, value);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0x453c0a98, Offset: 0x670
// Size: 0x28
function set_green(player, value) {
    [[ self ]]->set_green(player, value);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0xe3ec3eb, Offset: 0x6a0
// Size: 0x28
function set_blue(player, value) {
    [[ self ]]->set_blue(player, value);
}

// Namespace luielemimage/luielemimage
// Params 2, eflags: 0x0
// Checksum 0x1fc4b2b6, Offset: 0x6d0
// Size: 0x28
function set_material(player, value) {
    [[ self ]]->set_material(player, value);
}

