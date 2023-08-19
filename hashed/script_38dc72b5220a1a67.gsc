// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace luielembar;

// Namespace luielembar
// Method(s) 16 Total 22
class cluielembar : cluielem {

    // Namespace cluielembar/luielembar
    // Params 0, eflags: 0x9 linked
    // Checksum 0x64657531, Offset: 0x460
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cluielembar/luielembar
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x3159a9fe, Offset: 0xa98
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x1 linked
    // Checksum 0x8347c90d, Offset: 0xa60
    // Size: 0x30
    function set_bar_percent(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "bar_percent", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x1 linked
    // Checksum 0x257ed69e, Offset: 0xa28
    // Size: 0x30
    function set_blue(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "blue", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x1 linked
    // Checksum 0x289a8f28, Offset: 0x9f0
    // Size: 0x30
    function set_green(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "green", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x1 linked
    // Checksum 0x20c35710, Offset: 0x9b8
    // Size: 0x30
    function set_red(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "red", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x1 linked
    // Checksum 0xdbe54fe1, Offset: 0x980
    // Size: 0x30
    function set_alpha(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "alpha", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x1 linked
    // Checksum 0x469078a5, Offset: 0x948
    // Size: 0x30
    function set_fadeovertime(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "fadeOverTime", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x1 linked
    // Checksum 0x47084c23, Offset: 0x910
    // Size: 0x30
    function set_height(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "height", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x1 linked
    // Checksum 0x95fa2214, Offset: 0x8d8
    // Size: 0x30
    function set_width(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "width", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x1 linked
    // Checksum 0x9639eaa3, Offset: 0x8a0
    // Size: 0x30
    function set_y(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "y", value);
    }

    // Namespace cluielembar/luielembar
    // Params 2, eflags: 0x1 linked
    // Checksum 0x8da49e60, Offset: 0x868
    // Size: 0x30
    function set_x(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "x", value);
    }

    // Namespace cluielembar/luielembar
    // Params 1, eflags: 0x1 linked
    // Checksum 0x9a6252f5, Offset: 0x830
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"luielembar");
    }

    // Namespace cluielembar/luielembar
    // Params 1, eflags: 0x1 linked
    // Checksum 0x42078469, Offset: 0x6c0
    // Size: 0x164
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "x", 0);
        [[ self ]]->set_data(localclientnum, "y", 0);
        [[ self ]]->set_data(localclientnum, "width", 0);
        [[ self ]]->set_data(localclientnum, "height", 0);
        [[ self ]]->set_data(localclientnum, "fadeOverTime", 0);
        [[ self ]]->set_data(localclientnum, "alpha", 0);
        [[ self ]]->set_data(localclientnum, "red", 0);
        [[ self ]]->set_data(localclientnum, "green", 0);
        [[ self ]]->set_data(localclientnum, "blue", 0);
        [[ self ]]->set_data(localclientnum, "bar_percent", 0);
    }

    // Namespace cluielembar/luielembar
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb6712a86, Offset: 0x690
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cluielembar/luielembar
    // Params b, eflags: 0x1 linked
    // Checksum 0xfa112cf3, Offset: 0x480
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

// Namespace luielembar/luielembar
// Params 11, eflags: 0x0
// Checksum 0xd181de7c, Offset: 0x100
// Size: 0xb8
function register(uid, xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5) {
    elem = new cluielembar();
    [[ elem ]]->setup_clientfields(uid, xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5);
    return elem;
}

// Namespace luielembar/luielembar
// Params 1, eflags: 0x0
// Checksum 0x7bcb3df, Offset: 0x1c0
// Size: 0x40
function register_clientside(uid) {
    elem = new cluielembar();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace luielembar/luielembar
// Params 1, eflags: 0x0
// Checksum 0x4dd9a799, Offset: 0x208
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace luielembar/luielembar
// Params 1, eflags: 0x0
// Checksum 0x9d5f684, Offset: 0x230
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace luielembar/luielembar
// Params 1, eflags: 0x0
// Checksum 0xfd4c96c6, Offset: 0x258
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x60e14ab7, Offset: 0x280
// Size: 0x28
function set_x(localclientnum, value) {
    [[ self ]]->set_x(localclientnum, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x86b41c20, Offset: 0x2b0
// Size: 0x28
function set_y(localclientnum, value) {
    [[ self ]]->set_y(localclientnum, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x334ceee8, Offset: 0x2e0
// Size: 0x28
function set_width(localclientnum, value) {
    [[ self ]]->set_width(localclientnum, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x6d19a727, Offset: 0x310
// Size: 0x28
function set_height(localclientnum, value) {
    [[ self ]]->set_height(localclientnum, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x66b1979c, Offset: 0x340
// Size: 0x28
function set_fadeovertime(localclientnum, value) {
    [[ self ]]->set_fadeovertime(localclientnum, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x37edd464, Offset: 0x370
// Size: 0x28
function set_alpha(localclientnum, value) {
    [[ self ]]->set_alpha(localclientnum, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x4f5e219, Offset: 0x3a0
// Size: 0x28
function set_red(localclientnum, value) {
    [[ self ]]->set_red(localclientnum, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x864e9f3, Offset: 0x3d0
// Size: 0x28
function set_green(localclientnum, value) {
    [[ self ]]->set_green(localclientnum, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x29228cf7, Offset: 0x400
// Size: 0x28
function set_blue(localclientnum, value) {
    [[ self ]]->set_blue(localclientnum, value);
}

// Namespace luielembar/luielembar
// Params 2, eflags: 0x0
// Checksum 0x8bbe23c1, Offset: 0x430
// Size: 0x28
function set_bar_percent(localclientnum, value) {
    [[ self ]]->set_bar_percent(localclientnum, value);
}

