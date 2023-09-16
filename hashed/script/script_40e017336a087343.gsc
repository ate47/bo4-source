// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace luielemtext;

// Namespace luielemtext
// Method(s) 16 Total 22
class cluielemtext : cluielem {

    // Namespace cluielemtext/luielemtext
    // Params 0, eflags: 0x9 linked
    // Checksum 0x5322ee49, Offset: 0x470
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cluielemtext/luielemtext
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0xb5a12f58, Offset: 0xaa8
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x570af1fc, Offset: 0xa70
    // Size: 0x30
    function set_horizontal_alignment(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "horizontal_alignment", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0xeb88dc49, Offset: 0xa38
    // Size: 0x30
    function set_text(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "text", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x106334a7, Offset: 0xa00
    // Size: 0x30
    function set_blue(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "blue", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x3b29e600, Offset: 0x9c8
    // Size: 0x30
    function set_green(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "green", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x45747ada, Offset: 0x990
    // Size: 0x30
    function set_red(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "red", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x8ce82786, Offset: 0x958
    // Size: 0x30
    function set_alpha(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "alpha", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0xcaa8b5e2, Offset: 0x920
    // Size: 0x30
    function set_fadeovertime(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "fadeOverTime", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x71987773, Offset: 0x8e8
    // Size: 0x30
    function set_height(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "height", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0xb8de9e74, Offset: 0x8b0
    // Size: 0x30
    function set_y(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "y", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 2, eflags: 0x1 linked
    // Checksum 0x202ac311, Offset: 0x878
    // Size: 0x30
    function set_x(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "x", value);
    }

    // Namespace cluielemtext/luielemtext
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc0cf9f7f, Offset: 0x840
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"luielemtext");
    }

    // Namespace cluielemtext/luielemtext
    // Params 1, eflags: 0x1 linked
    // Checksum 0xce3a691a, Offset: 0x6d0
    // Size: 0x168
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "x", 0);
        [[ self ]]->set_data(localclientnum, "y", 0);
        [[ self ]]->set_data(localclientnum, "height", 0);
        [[ self ]]->set_data(localclientnum, "fadeOverTime", 0);
        [[ self ]]->set_data(localclientnum, "alpha", 0);
        [[ self ]]->set_data(localclientnum, "red", 0);
        [[ self ]]->set_data(localclientnum, "green", 0);
        [[ self ]]->set_data(localclientnum, "blue", 0);
        [[ self ]]->set_data(localclientnum, "text", #"");
        [[ self ]]->set_data(localclientnum, "horizontal_alignment", 0);
    }

    // Namespace cluielemtext/luielemtext
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc7afaa4c, Offset: 0x6a0
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cluielemtext/luielemtext
    // Params b, eflags: 0x1 linked
    // Checksum 0x9b9cd1e0, Offset: 0x490
    // Size: 0x204
    function setup_clientfields(uid, xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("x", 1, 7, "int", xcallback);
        cluielem::add_clientfield("y", 1, 6, "int", ycallback);
        cluielem::add_clientfield("height", 1, 2, "int", heightcallback);
        cluielem::add_clientfield("fadeOverTime", 1, 5, "int", fadeovertimecallback);
        cluielem::add_clientfield("alpha", 1, 4, "float", alphacallback);
        cluielem::add_clientfield("red", 1, 4, "float", redcallback);
        cluielem::add_clientfield("green", 1, 4, "float", greencallback);
        cluielem::add_clientfield("blue", 1, 4, "float", bluecallback);
        cluielem::function_dcb34c80("string", "text", 1);
        cluielem::add_clientfield("horizontal_alignment", 1, 2, "int", horizontal_alignmentcallback);
    }

}

// Namespace luielemtext/luielemtext
// Params 11, eflags: 0x0
// Checksum 0x294dd550, Offset: 0x110
// Size: 0xb8
function register(uid, xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback) {
    elem = new cluielemtext();
    [[ elem ]]->setup_clientfields(uid, xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback);
    return elem;
}

// Namespace luielemtext/luielemtext
// Params 1, eflags: 0x0
// Checksum 0x73da1f93, Offset: 0x1d0
// Size: 0x40
function register_clientside(uid) {
    elem = new cluielemtext();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace luielemtext/luielemtext
// Params 1, eflags: 0x0
// Checksum 0x6a4407a1, Offset: 0x218
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace luielemtext/luielemtext
// Params 1, eflags: 0x0
// Checksum 0xa83da7d4, Offset: 0x240
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace luielemtext/luielemtext
// Params 1, eflags: 0x0
// Checksum 0x1648c9aa, Offset: 0x268
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0xdba61060, Offset: 0x290
// Size: 0x28
function set_x(localclientnum, value) {
    [[ self ]]->set_x(localclientnum, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0xd620528, Offset: 0x2c0
// Size: 0x28
function set_y(localclientnum, value) {
    [[ self ]]->set_y(localclientnum, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0xc4c1b80, Offset: 0x2f0
// Size: 0x28
function set_height(localclientnum, value) {
    [[ self ]]->set_height(localclientnum, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0xd59a67c6, Offset: 0x320
// Size: 0x28
function set_fadeovertime(localclientnum, value) {
    [[ self ]]->set_fadeovertime(localclientnum, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0xe436257e, Offset: 0x350
// Size: 0x28
function set_alpha(localclientnum, value) {
    [[ self ]]->set_alpha(localclientnum, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0x11f87b37, Offset: 0x380
// Size: 0x28
function set_red(localclientnum, value) {
    [[ self ]]->set_red(localclientnum, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0x997375a8, Offset: 0x3b0
// Size: 0x28
function set_green(localclientnum, value) {
    [[ self ]]->set_green(localclientnum, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0x1dd09b2a, Offset: 0x3e0
// Size: 0x28
function set_blue(localclientnum, value) {
    [[ self ]]->set_blue(localclientnum, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0x41e47ec7, Offset: 0x410
// Size: 0x28
function set_text(localclientnum, value) {
    [[ self ]]->set_text(localclientnum, value);
}

// Namespace luielemtext/luielemtext
// Params 2, eflags: 0x0
// Checksum 0x7ccf3952, Offset: 0x440
// Size: 0x28
function set_horizontal_alignment(localclientnum, value) {
    [[ self ]]->set_horizontal_alignment(localclientnum, value);
}

