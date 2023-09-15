// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace mp_prop_controls;

// Namespace mp_prop_controls
// Method(s) 6 Total 12
class cmp_prop_controls : cluielem {

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 0, eflags: 0x8
    // Checksum 0x63aa1f20, Offset: 0x1a8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xe7b05356, Offset: 0x290
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 1, eflags: 0x0
    // Checksum 0x2fcee046, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"mp_prop_controls");
    }

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 1, eflags: 0x0
    // Checksum 0x6d7cbf1c, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 1, eflags: 0x0
    // Checksum 0x2b93f434, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cmp_prop_controls/mp_prop_controls
    // Params 1, eflags: 0x0
    // Checksum 0x5aee92ad, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace mp_prop_controls/mp_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x669e19ff, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new cmp_prop_controls();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace mp_prop_controls/mp_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x5374e98c, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new cmp_prop_controls();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace mp_prop_controls/mp_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xba0eb0a, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace mp_prop_controls/mp_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xcfee9815, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace mp_prop_controls/mp_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x470aceb6, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

