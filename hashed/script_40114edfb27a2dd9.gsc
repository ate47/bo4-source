// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace scavenger_icon;

// Namespace scavenger_icon
// Method(s) 7 Total 13
class cscavenger_icon : cluielem {

    // Namespace cscavenger_icon/scavenger_icon
    // Params 0, eflags: 0x9 linked
    // Checksum 0x5a1f9d79, Offset: 0x1f0
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x38e5b514, Offset: 0x398
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 1, eflags: 0x1 linked
    // Checksum 0xe043b1b9, Offset: 0x320
    // Size: 0x6c
    function increment_pulse(localclientnum) {
        var_1ed06bbc = [[ self ]]->get_data(localclientnum, "pulse");
        new_val = (var_1ed06bbc + 1) % 2;
        [[ self ]]->set_data(localclientnum, "pulse", new_val);
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x62dcc94f, Offset: 0x2e8
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"scavenger_icon");
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x8692cda2, Offset: 0x2a0
    // Size: 0x40
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "pulse", 0);
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x584e9e2c, Offset: 0x270
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 2, eflags: 0x1 linked
    // Checksum 0x28ad2964, Offset: 0x210
    // Size: 0x54
    function setup_clientfields(uid, var_bea2552f) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("pulse", 1, 1, "counter", var_bea2552f);
    }

}

// Namespace scavenger_icon/scavenger_icon
// Params 2, eflags: 0x1 linked
// Checksum 0xb31ccee8, Offset: 0xb0
// Size: 0x4c
function register(uid, var_bea2552f) {
    elem = new cscavenger_icon();
    [[ elem ]]->setup_clientfields(uid, var_bea2552f);
    return elem;
}

// Namespace scavenger_icon/scavenger_icon
// Params 1, eflags: 0x0
// Checksum 0xf35d5888, Offset: 0x108
// Size: 0x40
function register_clientside(uid) {
    elem = new cscavenger_icon();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace scavenger_icon/scavenger_icon
// Params 1, eflags: 0x0
// Checksum 0x401a29f5, Offset: 0x150
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace scavenger_icon/scavenger_icon
// Params 1, eflags: 0x0
// Checksum 0xc1539e1f, Offset: 0x178
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace scavenger_icon/scavenger_icon
// Params 1, eflags: 0x0
// Checksum 0x6eaa0a23, Offset: 0x1a0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace scavenger_icon/scavenger_icon
// Params 1, eflags: 0x0
// Checksum 0xc168e99f, Offset: 0x1c8
// Size: 0x1c
function increment_pulse(localclientnum) {
    [[ self ]]->increment_pulse(localclientnum);
}

