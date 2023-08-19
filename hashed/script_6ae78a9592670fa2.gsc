// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace multi_stage_target_lockon;

// Namespace multi_stage_target_lockon
// Method(s) 8 Total 14
class cmulti_stage_target_lockon : cluielem {

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 0, eflags: 0x8
    // Checksum 0x5568c6bd, Offset: 0x238
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x968b1252, Offset: 0x428
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 2, eflags: 0x0
    // Checksum 0x5f71e01d, Offset: 0x3f0
    // Size: 0x30
    function set_targetstate(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "targetState", value);
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 2, eflags: 0x0
    // Checksum 0x685d4a5e, Offset: 0x3b8
    // Size: 0x30
    function set_entnum(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "entNum", value);
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 1, eflags: 0x0
    // Checksum 0xc565287e, Offset: 0x380
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"multi_stage_target_lockon");
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 1, eflags: 0x0
    // Checksum 0x1ef80c26, Offset: 0x318
    // Size: 0x5c
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "entNum", 0);
        [[ self ]]->set_data(localclientnum, "targetState", 0);
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 1, eflags: 0x0
    // Checksum 0x38c59015, Offset: 0x2e8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cmulti_stage_target_lockon/multi_stage_target_lockon
    // Params 3, eflags: 0x0
    // Checksum 0xfc42ba4, Offset: 0x258
    // Size: 0x84
    function setup_clientfields(uid, var_5a7b4b38, var_29786c92) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("entNum", 1, 6, "int", var_5a7b4b38);
        cluielem::add_clientfield("targetState", 1, 3, "int", var_29786c92);
    }

}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 3, eflags: 0x0
// Checksum 0xc1cd047, Offset: 0xb8
// Size: 0x58
function register(uid, var_5a7b4b38, var_29786c92) {
    elem = new cmulti_stage_target_lockon();
    [[ elem ]]->setup_clientfields(uid, var_5a7b4b38, var_29786c92);
    return elem;
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 1, eflags: 0x0
// Checksum 0x3bc24de7, Offset: 0x118
// Size: 0x40
function register_clientside(uid) {
    elem = new cmulti_stage_target_lockon();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 1, eflags: 0x0
// Checksum 0x805fd78f, Offset: 0x160
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 1, eflags: 0x0
// Checksum 0xdf513089, Offset: 0x188
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 1, eflags: 0x0
// Checksum 0x357536bc, Offset: 0x1b0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 2, eflags: 0x0
// Checksum 0x625b55e, Offset: 0x1d8
// Size: 0x28
function set_entnum(localclientnum, value) {
    [[ self ]]->set_entnum(localclientnum, value);
}

// Namespace multi_stage_target_lockon/multi_stage_target_lockon
// Params 2, eflags: 0x0
// Checksum 0x5cbb75d1, Offset: 0x208
// Size: 0x28
function set_targetstate(localclientnum, value) {
    [[ self ]]->set_targetstate(localclientnum, value);
}

