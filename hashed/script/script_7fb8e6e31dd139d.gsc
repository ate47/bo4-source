// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace mp_prop_controls;

// Namespace mp_prop_controls
// Method(s) 5 Total 12
class cmp_prop_controls : cluielem {

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 0, eflags: 0x8
    // Checksum 0xf50f004e, Offset: 0x190
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xb028c754, Offset: 0x260
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 1, eflags: 0x0
    // Checksum 0xa516b94d, Offset: 0x230
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 2, eflags: 0x0
    // Checksum 0x8561cbd3, Offset: 0x1e0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "mp_prop_controls", persistent);
    }

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 1, eflags: 0x0
    // Checksum 0x614cc737, Offset: 0x1b0
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace mp_prop_controls/mp_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x6c8cd372, Offset: 0xb8
// Size: 0x40
function register(uid) {
    elem = new cmp_prop_controls();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace mp_prop_controls/mp_prop_controls
// Params 2, eflags: 0x0
// Checksum 0xd85fcbd3, Offset: 0x100
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace mp_prop_controls/mp_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xe16a8476, Offset: 0x140
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace mp_prop_controls/mp_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x9b8d57cd, Offset: 0x168
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

