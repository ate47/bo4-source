// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace scavenger_icon;

// Namespace scavenger_icon
// Method(s) 6 Total 13
class cscavenger_icon : cluielem {

    // Namespace cscavenger_icon/scavenger_icon
    // Params 0, eflags: 0x9 linked
    // Checksum 0x17567ab1, Offset: 0x1c8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x6f82f3c6, Offset: 0x300
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x86c117da, Offset: 0x2c0
    // Size: 0x34
    function increment_pulse(player) {
        player clientfield::function_bb878fc3(self.var_47e79fc, "pulse");
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4e07157c, Offset: 0x290
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 2, eflags: 0x1 linked
    // Checksum 0x46d70449, Offset: 0x240
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "scavenger_icon", persistent);
    }

    // Namespace cscavenger_icon/scavenger_icon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1839f8e1, Offset: 0x1e8
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("pulse", 1, 1, "counter");
    }

}

// Namespace scavenger_icon/scavenger_icon
// Params 1, eflags: 0x1 linked
// Checksum 0x4c9b8ab9, Offset: 0xc8
// Size: 0x40
function register(uid) {
    elem = new cscavenger_icon();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace scavenger_icon/scavenger_icon
// Params 2, eflags: 0x1 linked
// Checksum 0x92cd2583, Offset: 0x110
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace scavenger_icon/scavenger_icon
// Params 1, eflags: 0x0
// Checksum 0xc5b8b9e0, Offset: 0x150
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace scavenger_icon/scavenger_icon
// Params 1, eflags: 0x1 linked
// Checksum 0x687fd122, Offset: 0x178
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace scavenger_icon/scavenger_icon
// Params 1, eflags: 0x1 linked
// Checksum 0x4173e362, Offset: 0x1a0
// Size: 0x1c
function increment_pulse(player) {
    [[ self ]]->increment_pulse(player);
}

