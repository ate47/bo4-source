#using scripts\core_common\lui_shared.csc;

#namespace luielembar_ct;

// Namespace luielembar_ct
// Method(s) 16 Total 22
class cluielembar_ct : cluielem {

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xe80895c1, Offset: 0xa60
    // Size: 0x30
    function set_bar_percent(localclientnum, value) {
        set_data(localclientnum, "bar_percent", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xee88222a, Offset: 0xa28
    // Size: 0x30
    function set_blue(localclientnum, value) {
        set_data(localclientnum, "blue", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xd281be9a, Offset: 0x9f0
    // Size: 0x30
    function set_green(localclientnum, value) {
        set_data(localclientnum, "green", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xd56186ff, Offset: 0x9b8
    // Size: 0x30
    function set_red(localclientnum, value) {
        set_data(localclientnum, "red", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xe180eda0, Offset: 0x980
    // Size: 0x30
    function set_alpha(localclientnum, value) {
        set_data(localclientnum, "alpha", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0x45e20c67, Offset: 0x948
    // Size: 0x30
    function set_fadeovertime(localclientnum, value) {
        set_data(localclientnum, "fadeOverTime", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0xf690483e, Offset: 0x910
    // Size: 0x30
    function set_height(localclientnum, value) {
        set_data(localclientnum, "height", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0x1eb39f13, Offset: 0x8d8
    // Size: 0x30
    function set_width(localclientnum, value) {
        set_data(localclientnum, "width", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0x32cd2cf9, Offset: 0x8a0
    // Size: 0x30
    function set_y(localclientnum, value) {
        set_data(localclientnum, "y", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 2, eflags: 0x0
    // Checksum 0x7af11fc3, Offset: 0x868
    // Size: 0x30
    function set_x(localclientnum, value) {
        set_data(localclientnum, "x", value);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 1, eflags: 0x0
    // Checksum 0x9e700b97, Offset: 0x830
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"luielembar_ct");
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 1, eflags: 0x0
    // Checksum 0xe101569f, Offset: 0x6c0
    // Size: 0x164
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "x", 0);
        set_data(localclientnum, "y", 0);
        set_data(localclientnum, "width", 0);
        set_data(localclientnum, "height", 0);
        set_data(localclientnum, "fadeOverTime", 0);
        set_data(localclientnum, "alpha", 0);
        set_data(localclientnum, "red", 0);
        set_data(localclientnum, "green", 0);
        set_data(localclientnum, "blue", 0);
        set_data(localclientnum, "bar_percent", 0);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 1, eflags: 0x0
    // Checksum 0xf0ebf426, Offset: 0x690
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cluielembar_ct/luielembar_ct
    // Params 11, eflags: 0x0
    // Checksum 0x6b11f23, Offset: 0x480
    // Size: 0x204
    function setup_clientfields(uid, xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("x", 1, 7, "int", xcallback);
        cluielem::add_clientfield("y", 1, 6, "int", ycallback);
        cluielem::add_clientfield("width", 1, 6, "int", widthcallback);
        cluielem::add_clientfield("height", 1, 6, "int", heightcallback);
        cluielem::add_clientfield("fadeOverTime", 1, 5, "int", fadeovertimecallback);
        cluielem::add_clientfield("alpha", 1, 4, "float", alphacallback);
        cluielem::add_clientfield("red", 1, 4, "float", redcallback);
        cluielem::add_clientfield("green", 1, 4, "float", greencallback);
        cluielem::add_clientfield("blue", 1, 4, "float", bluecallback);
        cluielem::add_clientfield("bar_percent", 1, 6, "float", var_661989d5);
    }

}

// Namespace luielembar_ct/luielembar_ct
// Params 11, eflags: 0x0
// Checksum 0xc78ff3e3, Offset: 0x100
// Size: 0xb8
function register(uid, xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5) {
    elem = new cluielembar_ct();
    [[ elem ]]->setup_clientfields(uid, xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5);
    return elem;
}

// Namespace luielembar_ct/luielembar_ct
// Params 1, eflags: 0x0
// Checksum 0x8a04876a, Offset: 0x1c0
// Size: 0x40
function register_clientside(uid) {
    elem = new cluielembar_ct();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace luielembar_ct/luielembar_ct
// Params 1, eflags: 0x0
// Checksum 0x98c690e6, Offset: 0x208
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace luielembar_ct/luielembar_ct
// Params 1, eflags: 0x0
// Checksum 0x1b4bbce1, Offset: 0x230
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace luielembar_ct/luielembar_ct
// Params 1, eflags: 0x0
// Checksum 0x9c4cc37e, Offset: 0x258
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x9a9d85c8, Offset: 0x280
// Size: 0x28
function set_x(localclientnum, value) {
    [[ self ]]->set_x(localclientnum, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x4dd71f72, Offset: 0x2b0
// Size: 0x28
function set_y(localclientnum, value) {
    [[ self ]]->set_y(localclientnum, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x7f766c93, Offset: 0x2e0
// Size: 0x28
function set_width(localclientnum, value) {
    [[ self ]]->set_width(localclientnum, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x4f79da60, Offset: 0x310
// Size: 0x28
function set_height(localclientnum, value) {
    [[ self ]]->set_height(localclientnum, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0xd9625158, Offset: 0x340
// Size: 0x28
function set_fadeovertime(localclientnum, value) {
    [[ self ]]->set_fadeovertime(localclientnum, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x3f6c09f4, Offset: 0x370
// Size: 0x28
function set_alpha(localclientnum, value) {
    [[ self ]]->set_alpha(localclientnum, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x5f2e3cf1, Offset: 0x3a0
// Size: 0x28
function set_red(localclientnum, value) {
    [[ self ]]->set_red(localclientnum, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x4b217b1d, Offset: 0x3d0
// Size: 0x28
function set_green(localclientnum, value) {
    [[ self ]]->set_green(localclientnum, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0x13aff87d, Offset: 0x400
// Size: 0x28
function set_blue(localclientnum, value) {
    [[ self ]]->set_blue(localclientnum, value);
}

// Namespace luielembar_ct/luielembar_ct
// Params 2, eflags: 0x0
// Checksum 0xfc0c7953, Offset: 0x430
// Size: 0x28
function set_bar_percent(localclientnum, value) {
    [[ self ]]->set_bar_percent(localclientnum, value);
}

