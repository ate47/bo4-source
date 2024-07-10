#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace luielemtext;

// Namespace luielemtext
// Method(s) 15 Total 22
class cluielemtext : cluielem {

    var var_47e79fc;

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x86ad5162, Offset: 0xb68
    // Size: 0x3c
    function set_horizontal_alignment(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "horizontal_alignment", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0xf3351ec2, Offset: 0xb20
    // Size: 0x3c
    function set_text(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "text", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1f70e891, Offset: 0xad8
    // Size: 0x3c
    function set_blue(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "blue", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0xb2ec60a3, Offset: 0xa90
    // Size: 0x3c
    function set_green(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "green", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0xc851ca97, Offset: 0xa48
    // Size: 0x3c
    function set_red(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "red", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa694fd16, Offset: 0xa00
    // Size: 0x3c
    function set_alpha(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "alpha", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x306b53cc, Offset: 0x9b8
    // Size: 0x3c
    function set_fadeovertime(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "fadeOverTime", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x88d3b37a, Offset: 0x970
    // Size: 0x3c
    function set_height(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "height", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1a55e49e, Offset: 0x928
    // Size: 0x3c
    function set_y(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "y", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0xadb407bc, Offset: 0x8e0
    // Size: 0x3c
    function set_x(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "x", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 1, eflags: 0x1 linked
    // Checksum 0x8cfd21cc, Offset: 0x8b0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x4754aad2, Offset: 0x860
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "LUIelemText", persistent);
    }

    // Namespace cluielemtext/luielemtext
    // Params 1, eflags: 0x1 linked
    // Checksum 0xf758a3a7, Offset: 0x6a0
    // Size: 0x1b4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("x", 1, 7, "int");
        cluielem::add_clientfield("y", 1, 6, "int");
        cluielem::add_clientfield("height", 1, 2, "int");
        cluielem::add_clientfield("fadeOverTime", 1, 5, "int");
        cluielem::add_clientfield("alpha", 1, 4, "float");
        cluielem::add_clientfield("red", 1, 4, "float");
        cluielem::add_clientfield("green", 1, 4, "float");
        cluielem::add_clientfield("blue", 1, 4, "float");
        cluielem::function_dcb34c80("string", "text", 1);
        cluielem::add_clientfield("horizontal_alignment", 1, 2, "int");
    }

}

// Namespace luielemtext/luielemtext
// Params 4, eflags: 0x0
// Checksum 0xedac895, Offset: 0x128
// Size: 0x6c
function set_color(player, red, green, blue) {
    self set_red(player, red);
    self set_green(player, green);
    self set_blue(player, blue);
}

// Namespace luielemtext/luielemtext
// Params 3, eflags: 0x1 linked
// Checksum 0x96c0e923, Offset: 0x1a0
// Size: 0x7c
function fade(player, var_1a92607f, duration = 0) {
    self set_alpha(player, var_1a92607f);
    self set_fadeovertime(player, int(duration * 10));
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0x46633c7b, Offset: 0x228
// Size: 0x44
function show(player, duration = 0) {
    self fade(player, 1, duration);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0x86d6e7c, Offset: 0x278
// Size: 0x3c
function hide(player, duration = 0) {
    self fade(player, 0, duration);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x1 linked
// Checksum 0x3e49abe2, Offset: 0x2c0
// Size: 0x4c
function function_e5898fd7(player, var_c6572d9b) {
    self set_x(player, int(var_c6572d9b / 15));
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x1 linked
// Checksum 0x23f2a554, Offset: 0x318
// Size: 0x4c
function function_58a135d3(player, var_d390c80e) {
    self set_y(player, int(var_d390c80e / 15));
}

// Namespace luielemtext/luielemtext
// Params 3, eflags: 0x0
// Checksum 0xc7766d26, Offset: 0x370
// Size: 0x4c
function function_f97e9049(player, var_c6572d9b, var_d390c80e) {
    self function_e5898fd7(player, var_c6572d9b);
    self function_58a135d3(player, var_d390c80e);
}

// Namespace luielemtext/luielemtext
// Params 1, eflags: 0x0
// Checksum 0x6a06acb2, Offset: 0x3c8
// Size: 0x40
function register(uid) {
    elem = new cluielemtext();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0xc0f66c4a, Offset: 0x410
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace luielemtext/luielemtext
// Params 1, eflags: 0x0
// Checksum 0x32cce914, Offset: 0x450
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace luielemtext/luielemtext
// Params 1, eflags: 0x0
// Checksum 0xf6874acb, Offset: 0x478
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x1 linked
// Checksum 0x2dc1344f, Offset: 0x4a0
// Size: 0x28
function set_x(player, value) {
    [[ self ]]->set_x(player, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x1 linked
// Checksum 0x58e62611, Offset: 0x4d0
// Size: 0x28
function set_y(player, value) {
    [[ self ]]->set_y(player, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0x83de11de, Offset: 0x500
// Size: 0x28
function set_height(player, value) {
    [[ self ]]->set_height(player, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x1 linked
// Checksum 0x4f302cbd, Offset: 0x530
// Size: 0x28
function set_fadeovertime(player, value) {
    [[ self ]]->set_fadeovertime(player, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x1 linked
// Checksum 0x37ea2fa8, Offset: 0x560
// Size: 0x28
function set_alpha(player, value) {
    [[ self ]]->set_alpha(player, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x1 linked
// Checksum 0x68f834fb, Offset: 0x590
// Size: 0x28
function set_red(player, value) {
    [[ self ]]->set_red(player, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x1 linked
// Checksum 0x6c9486a5, Offset: 0x5c0
// Size: 0x28
function set_green(player, value) {
    [[ self ]]->set_green(player, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x1 linked
// Checksum 0x36e08a6d, Offset: 0x5f0
// Size: 0x28
function set_blue(player, value) {
    [[ self ]]->set_blue(player, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0x63bd16f8, Offset: 0x620
// Size: 0x28
function set_text(player, value) {
    [[ self ]]->set_text(player, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0xa898bdb4, Offset: 0x650
// Size: 0x28
function set_horizontal_alignment(player, value) {
    [[ self ]]->set_horizontal_alignment(player, value);
}

