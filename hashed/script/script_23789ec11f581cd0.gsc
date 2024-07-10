#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace multi_stage_friendly_lockon;

// Namespace multi_stage_friendly_lockon
// Method(s) 7 Total 14
class cmulti_stage_friendly_lockon : cluielem {

    var var_47e79fc;

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0x49761082, Offset: 0x380
    // Size: 0x3c
    function set_targetstate(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "targetState", value);
    }

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0xd3b9cc65, Offset: 0x338
    // Size: 0x3c
    function set_entnum(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "entNum", value);
    }

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x6782e11d, Offset: 0x308
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0x20984371, Offset: 0x2b8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "multi_stage_friendly_lockon", persistent);
    }

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1c56b2ed, Offset: 0x238
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("entNum", 1, 10, "int");
        cluielem::add_clientfield("targetState", 1, 3, "int");
    }

}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 1, eflags: 0x0
// Checksum 0x3d8c5bb6, Offset: 0xe0
// Size: 0x40
function register(uid) {
    elem = new cmulti_stage_friendly_lockon();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 2, eflags: 0x0
// Checksum 0xcbaaf3e9, Offset: 0x128
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 1, eflags: 0x0
// Checksum 0x1c4eb67d, Offset: 0x168
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 1, eflags: 0x0
// Checksum 0xb0f849a9, Offset: 0x190
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 2, eflags: 0x0
// Checksum 0xd70d5f28, Offset: 0x1b8
// Size: 0x28
function set_entnum(player, value) {
    [[ self ]]->set_entnum(player, value);
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 2, eflags: 0x0
// Checksum 0xc12003de, Offset: 0x1e8
// Size: 0x28
function set_targetstate(player, value) {
    [[ self ]]->set_targetstate(player, value);
}

