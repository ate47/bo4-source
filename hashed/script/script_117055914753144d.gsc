// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace ct_shared_aar;

// Namespace ct_shared_aar
// Method(s) 11 Total 17
class cct_shared_aar : cluielem {

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 0, eflags: 0x8
    // Checksum 0x458129f0, Offset: 0x330
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x86fa6254, Offset: 0x970
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0xcf225402, Offset: 0x938
    // Size: 0x30
    function set_medalthresholds(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "medalThresholds", value);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0x1ea2a59b, Offset: 0x900
    // Size: 0x30
    function set_missionresultmsg(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "missionResultMsg", value);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0x2315508b, Offset: 0x8c8
    // Size: 0x30
    function set_besttimemilliseconds(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "bestTimeMilliseconds", value);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0xd5a20ee6, Offset: 0x890
    // Size: 0x30
    function set_timemilliseconds(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "timeMilliseconds", value);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2, eflags: 0x0
    // Checksum 0x2c98a537, Offset: 0x5a8
    // Size: 0x2dc
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 0);
        } else if (#"success_fadeout" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 1);
        } else if (#"hash_e4c570778eda419" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 2);
        } else if (#"fail" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 3);
        } else if (#"fail_fadeout" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 4);
        } else if (#"win_gold" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 5);
        } else if (#"win_silver" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 6);
        } else if (#"win_bronze" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 7);
        } else if (#"hash_18174a43e0ca3b90" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 8);
        } else if (#"hash_3327faf4ae535f2b" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 9);
        } else if (#"hash_32ceb5e1ecc00d78" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 10);
        } else if (#"hash_71b423d13c228d59" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 11);
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
    // Checksum 0x1f7f7e7d, Offset: 0x570
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"ct_shared_aar");
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 1, eflags: 0x0
    // Checksum 0x903c3b6e, Offset: 0x498
    // Size: 0xcc
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_state(localclientnum, #"defaultstate");
        [[ self ]]->set_data(localclientnum, "timeMilliseconds", 0);
        [[ self ]]->set_data(localclientnum, "bestTimeMilliseconds", 0);
        [[ self ]]->set_data(localclientnum, "missionResultMsg", #"");
        [[ self ]]->set_data(localclientnum, "medalThresholds", #"");
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 1, eflags: 0x0
    // Checksum 0xab58dee, Offset: 0x468
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 5, eflags: 0x0
    // Checksum 0x12ffbb4f, Offset: 0x350
    // Size: 0x10c
    function setup_clientfields(uid, var_fa61efce, var_a2ce4dd8, var_28aefa0, var_30cfd9be) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 4, "int");
        cluielem::add_clientfield("timeMilliseconds", 1, 14, "int", var_fa61efce);
        cluielem::add_clientfield("bestTimeMilliseconds", 1, 14, "int", var_a2ce4dd8);
        cluielem::function_dcb34c80("string", "missionResultMsg", 1);
        cluielem::function_dcb34c80("string", "medalThresholds", 1);
    }

}

// Namespace ct_shared_aar/ct_shared_aar
// Params 5, eflags: 0x0
// Checksum 0x6baf0a55, Offset: 0x108
// Size: 0x70
function register(uid, var_fa61efce, var_a2ce4dd8, var_28aefa0, var_30cfd9be) {
    elem = new cct_shared_aar();
    [[ elem ]]->setup_clientfields(uid, var_fa61efce, var_a2ce4dd8, var_28aefa0, var_30cfd9be);
    return elem;
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 1, eflags: 0x0
// Checksum 0x2039af39, Offset: 0x180
// Size: 0x40
function register_clientside(uid) {
    elem = new cct_shared_aar();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 1, eflags: 0x0
// Checksum 0xaeca93d2, Offset: 0x1c8
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 1, eflags: 0x0
// Checksum 0xbef23e4, Offset: 0x1f0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 1, eflags: 0x0
// Checksum 0x8e64b0e8, Offset: 0x218
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0xd6875125, Offset: 0x240
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0xf036b1c2, Offset: 0x270
// Size: 0x28
function set_timemilliseconds(localclientnum, value) {
    [[ self ]]->set_timemilliseconds(localclientnum, value);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0x75089d9, Offset: 0x2a0
// Size: 0x28
function set_besttimemilliseconds(localclientnum, value) {
    [[ self ]]->set_besttimemilliseconds(localclientnum, value);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0x4b732412, Offset: 0x2d0
// Size: 0x28
function set_missionresultmsg(localclientnum, value) {
    [[ self ]]->set_missionresultmsg(localclientnum, value);
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2, eflags: 0x0
// Checksum 0xcbdec09, Offset: 0x300
// Size: 0x28
function set_medalthresholds(localclientnum, value) {
    [[ self ]]->set_medalthresholds(localclientnum, value);
}

