// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace multi_stage_target_lockon;

// Namespace multi_stage_target_lockon
// Method(s) 7 Total 14
class cmulti_stage_target_lockon : cluielem {

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 0, eflags: 0x9 linked
    // Checksum 0x3fc03c28, Offset: 0x218
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0xd21e4499, Offset: 0x3c8
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0x4866878c, Offset: 0x380
    // Size: 0x3c
    function set_targetstate(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "targetState", value);
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2ba01ba, Offset: 0x338
    // Size: 0x3c
    function set_entnum(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "entNum", value);
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa9385b01, Offset: 0x308
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa4592743, Offset: 0x2b8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "multi_stage_target_lockon", persistent);
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 1, eflags: 0x1 linked
    // Checksum 0xf53b3506, Offset: 0x238
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("entNum", 1, 6, "int");
        cluielem::add_clientfield("targetState", 1, 3, "int");
    }

}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 1, eflags: 0x1 linked
// Checksum 0xab55f47d, Offset: 0xe0
// Size: 0x40
function register(uid) {
    elem = new cmulti_stage_target_lockon();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 2, eflags: 0x1 linked
// Checksum 0x9614f25, Offset: 0x128
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 1, eflags: 0x1 linked
// Checksum 0xb4a25293, Offset: 0x168
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 1, eflags: 0x1 linked
// Checksum 0x981c3cdb, Offset: 0x190
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 2, eflags: 0x1 linked
// Checksum 0xb1a39de0, Offset: 0x1b8
// Size: 0x28
function set_entnum(player, value) {
    [[ self ]]->set_entnum(player, value);
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 2, eflags: 0x1 linked
// Checksum 0xda55d0c1, Offset: 0x1e8
// Size: 0x28
function set_targetstate(player, value) {
    [[ self ]]->set_targetstate(player, value);
}

