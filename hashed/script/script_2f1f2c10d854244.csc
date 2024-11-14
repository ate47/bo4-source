#using scripts\core_common\lui_shared;

#namespace multi_stage_friendly_lockon;

// Namespace multi_stage_friendly_lockon
// Method(s) 8 Total 14
class cmulti_stage_friendly_lockon : cluielem {

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0x78a487ef, Offset: 0x3f0
    // Size: 0x30
    function set_targetstate(localclientnum, value) {
        set_data(localclientnum, "targetState", value);
    }

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 2, eflags: 0x1 linked
    // Checksum 0xae2bca6, Offset: 0x3b8
    // Size: 0x30
    function set_entnum(localclientnum, value) {
        set_data(localclientnum, "entNum", value);
    }

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x371ea463, Offset: 0x380
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"multi_stage_friendly_lockon");
    }

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbece18ad, Offset: 0x318
    // Size: 0x5c
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "entNum", 0);
        set_data(localclientnum, "targetState", 0);
    }

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 1, eflags: 0x1 linked
    // Checksum 0x57ea0df2, Offset: 0x2e8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cmulti_stage_friendly_lockon/multi_stage_friendly_lockon
    // Params 3, eflags: 0x1 linked
    // Checksum 0x12d27a01, Offset: 0x258
    // Size: 0x84
    function setup_clientfields(uid, var_5a7b4b38, var_29786c92) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("entNum", 1, 10, "int", var_5a7b4b38);
        cluielem::add_clientfield("targetState", 1, 3, "int", var_29786c92);
    }

}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 3, eflags: 0x0
// Checksum 0x6935df08, Offset: 0xb8
// Size: 0x58
function register(uid, var_5a7b4b38, var_29786c92) {
    elem = new cmulti_stage_friendly_lockon();
    [[ elem ]]->setup_clientfields(uid, var_5a7b4b38, var_29786c92);
    return elem;
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 1, eflags: 0x0
// Checksum 0xb8186af5, Offset: 0x118
// Size: 0x40
function register_clientside(uid) {
    elem = new cmulti_stage_friendly_lockon();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 1, eflags: 0x0
// Checksum 0x2784d7ba, Offset: 0x160
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 1, eflags: 0x0
// Checksum 0x77fa8e33, Offset: 0x188
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 1, eflags: 0x0
// Checksum 0x42b35af2, Offset: 0x1b0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 2, eflags: 0x0
// Checksum 0xbf97144c, Offset: 0x1d8
// Size: 0x28
function set_entnum(localclientnum, value) {
    [[ self ]]->set_entnum(localclientnum, value);
}

// Namespace multi_stage_friendly_lockon/multi_stage_friendly_lockon
// Params 2, eflags: 0x0
// Checksum 0x6fce3e0f, Offset: 0x208
// Size: 0x28
function set_targetstate(localclientnum, value) {
    [[ self ]]->set_targetstate(localclientnum, value);
}

