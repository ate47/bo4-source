// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace ct_shared_aar;

// Namespace ct_shared_aar
// Method(s) 10 Total 17
class cct_shared_aar : cluielem {

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 0, eflags: 0x8
    // Checksum 0x6ada78a9, Offset: 0x2e8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x75188f7a, Offset: 0x8e8
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0x575dd738, Offset: 0x8a0
    // Size: 0x3c
    function set_medalthresholds(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "medalThresholds", value);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0x95d6c8ea, Offset: 0x858
    // Size: 0x3c
    function set_missionresultmsg(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "missionResultMsg", value);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0x12735d8e, Offset: 0x810
    // Size: 0x3c
    function set_besttimemilliseconds(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "bestTimeMilliseconds", value);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0x72f42b4c, Offset: 0x7c8
    // Size: 0x3c
    function set_timemilliseconds(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "timeMilliseconds", value);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0xa6d10e28, Offset: 0x480
    // Size: 0x33c
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 0);
        } else if (#"success_fadeout" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 1);
        } else if (#"hash_e4c570778eda419" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 2);
        } else if (#"fail" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 3);
        } else if (#"fail_fadeout" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 4);
        } else if (#"win_gold" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 5);
        } else if (#"win_silver" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 6);
        } else if (#"win_bronze" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 7);
        } else if (#"hash_18174a43e0ca3b90" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 8);
        } else if (#"hash_3327faf4ae535f2b" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 9);
        } else if (#"hash_32ceb5e1ecc00d78" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 10);
        } else if (#"hash_71b423d13c228d59" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 11);
        } else {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
        }
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 1, eflags: 0x0
    // Checksum 0x9ce38524, Offset: 0x450
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0x1c53dec8, Offset: 0x400
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_shared_aar", persistent);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 1, eflags: 0x0
    // Checksum 0xeb2ef562, Offset: 0x308
    // Size: 0xec
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 4, "int");
        cluielem::add_clientfield("timeMilliseconds", 1, 14, "int");
        cluielem::add_clientfield("bestTimeMilliseconds", 1, 14, "int");
        cluielem::function_dcb34c80("string", "missionResultMsg", 1);
        cluielem::function_dcb34c80("string", "medalThresholds", 1);
    }

}

// Namespace ct_shared_aar/ct_shared_aar
// Params 1, eflags: 0x0
// Checksum 0x63f838f2, Offset: 0x120
// Size: 0x40
function register(uid) {
    elem = new cct_shared_aar();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0xb1fcaf2a, Offset: 0x168
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 1, eflags: 0x0
// Checksum 0x5c203699, Offset: 0x1a8
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 1, eflags: 0x0
// Checksum 0x348a786c, Offset: 0x1d0
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0x8aa3e1e1, Offset: 0x1f8
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0x443b6d4d, Offset: 0x228
// Size: 0x28
function set_timemilliseconds(player, value) {
    [[ self ]]->set_timemilliseconds(player, value);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0x392203df, Offset: 0x258
// Size: 0x28
function set_besttimemilliseconds(player, value) {
    [[ self ]]->set_besttimemilliseconds(player, value);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0xf30d7adb, Offset: 0x288
// Size: 0x28
function set_missionresultmsg(player, value) {
    [[ self ]]->set_missionresultmsg(player, value);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0x6db80e2d, Offset: 0x2b8
// Size: 0x28
function set_medalthresholds(player, value) {
    [[ self ]]->set_medalthresholds(player, value);
}

