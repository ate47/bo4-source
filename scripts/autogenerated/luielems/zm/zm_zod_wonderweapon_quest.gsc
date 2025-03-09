#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace zm_zod_wonderweapon_quest;

// Namespace zm_zod_wonderweapon_quest
// Method(s) 9 Total 16
class czm_zod_wonderweapon_quest : cluielem {

    var _uid;

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 2, eflags: 0x0
    // Checksum 0xa75eeb4a, Offset: 0x4d0
    // Size: 0x3c
    function set_decay(player, value) {
        player clientfield::function_9bf78ef8(_uid, "decay", value);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 2, eflags: 0x0
    // Checksum 0xec16543e, Offset: 0x488
    // Size: 0x3c
    function set_purity(player, value) {
        player clientfield::function_9bf78ef8(_uid, "purity", value);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 2, eflags: 0x0
    // Checksum 0x301f9088, Offset: 0x440
    // Size: 0x3c
    function set_plasma(player, value) {
        player clientfield::function_9bf78ef8(_uid, "plasma", value);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 2, eflags: 0x0
    // Checksum 0xac90d776, Offset: 0x3f8
    // Size: 0x3c
    function set_radiance(player, value) {
        player clientfield::function_9bf78ef8(_uid, "radiance", value);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 1, eflags: 0x0
    // Checksum 0x9df4bb6b, Offset: 0x3c8
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 2, eflags: 0x0
    // Checksum 0x3d78babf, Offset: 0x378
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_zod_wonderweapon_quest", persistent);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 1, eflags: 0x0
    // Checksum 0xfab28428, Offset: 0x2a8
    // Size: 0xc4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("radiance", 1, 1, "int");
        cluielem::add_clientfield("plasma", 1, 1, "int");
        cluielem::add_clientfield("purity", 1, 1, "int");
        cluielem::add_clientfield("decay", 1, 1, "int");
    }

}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 1, eflags: 0x0
// Checksum 0xec263a18, Offset: 0xf0
// Size: 0x40
function register(uid) {
    elem = new czm_zod_wonderweapon_quest();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 2, eflags: 0x0
// Checksum 0xd87b8aa2, Offset: 0x138
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 1, eflags: 0x0
// Checksum 0xb3ad1d5e, Offset: 0x178
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 1, eflags: 0x0
// Checksum 0xf3a522b, Offset: 0x1a0
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 2, eflags: 0x0
// Checksum 0x71bd35fe, Offset: 0x1c8
// Size: 0x28
function set_radiance(player, value) {
    [[ self ]]->set_radiance(player, value);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 2, eflags: 0x0
// Checksum 0xfe874a47, Offset: 0x1f8
// Size: 0x28
function set_plasma(player, value) {
    [[ self ]]->set_plasma(player, value);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 2, eflags: 0x0
// Checksum 0x944268fb, Offset: 0x228
// Size: 0x28
function set_purity(player, value) {
    [[ self ]]->set_purity(player, value);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 2, eflags: 0x0
// Checksum 0x6f5df670, Offset: 0x258
// Size: 0x28
function set_decay(player, value) {
    [[ self ]]->set_decay(player, value);
}

