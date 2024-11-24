#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace ct_shared_aar_medals;

// Namespace ct_shared_aar_medals
// Method(s) 9 Total 16
class cct_shared_aar_medals : cluielem {

    var var_47e79fc;

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 2, eflags: 0x0
    // Checksum 0x4e966a6d, Offset: 0x638
    // Size: 0x3c
    function set_medalbronzethreshold(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "medalBronzeThreshold", value);
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 2, eflags: 0x0
    // Checksum 0x28684ab2, Offset: 0x5f0
    // Size: 0x3c
    function set_medalsilverthreshold(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "medalSilverThreshold", value);
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 2, eflags: 0x0
    // Checksum 0x1ace2c05, Offset: 0x5a8
    // Size: 0x3c
    function set_medalgoldthreshold(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "medalGoldThreshold", value);
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 2, eflags: 0x0
    // Checksum 0xf05766b1, Offset: 0x420
    // Size: 0x17c
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 0);
            return;
        }
        if (#"medal_gold" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 1);
            return;
        }
        if (#"medal_silver" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 2);
            return;
        }
        if (#"medal_bronze" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 3);
            return;
        }
        if (#"medal_none" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 4);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 1, eflags: 0x0
    // Checksum 0xea417c6f, Offset: 0x3f0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 2, eflags: 0x0
    // Checksum 0x3bb2c160, Offset: 0x3a0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_shared_aar_medals", persistent);
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 1, eflags: 0x0
    // Checksum 0x31da638e, Offset: 0x2d0
    // Size: 0xc4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 3, "int");
        cluielem::function_dcb34c80("string", "medalGoldThreshold", 1);
        cluielem::function_dcb34c80("string", "medalSilverThreshold", 1);
        cluielem::function_dcb34c80("string", "medalBronzeThreshold", 1);
    }

}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 1, eflags: 0x0
// Checksum 0xa6b936ee, Offset: 0x118
// Size: 0x40
function register(uid) {
    elem = new cct_shared_aar_medals();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 2, eflags: 0x0
// Checksum 0x584c0fa4, Offset: 0x160
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 1, eflags: 0x0
// Checksum 0x61b576b3, Offset: 0x1a0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 1, eflags: 0x0
// Checksum 0xad3bb3a, Offset: 0x1c8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 2, eflags: 0x0
// Checksum 0x37d761fe, Offset: 0x1f0
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 2, eflags: 0x0
// Checksum 0x63952835, Offset: 0x220
// Size: 0x28
function set_medalgoldthreshold(player, value) {
    [[ self ]]->set_medalgoldthreshold(player, value);
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 2, eflags: 0x0
// Checksum 0x90bc229e, Offset: 0x250
// Size: 0x28
function set_medalsilverthreshold(player, value) {
    [[ self ]]->set_medalsilverthreshold(player, value);
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 2, eflags: 0x0
// Checksum 0x595b977e, Offset: 0x280
// Size: 0x28
function set_medalbronzethreshold(player, value) {
    [[ self ]]->set_medalbronzethreshold(player, value);
}

