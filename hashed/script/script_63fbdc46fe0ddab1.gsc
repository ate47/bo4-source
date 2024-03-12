// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace zm_red_challenges_hud;

// Namespace zm_red_challenges_hud
// Method(s) 14 Total 20
class czm_red_challenges_hud : cluielem {

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 0, eflags: 0x9 linked
    // Checksum 0x934443ee, Offset: 0x400
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x59784cca, Offset: 0xa48
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0x75587eca, Offset: 0xa10
    // Size: 0x30
    function set_challengefailing(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "challengeFailing", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0xcb869cf8, Offset: 0x9d8
    // Size: 0x30
    function set_rewardhidden(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "rewardHidden", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0x20e0b5b4, Offset: 0x9a0
    // Size: 0x30
    function set_tributeavailable(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "tributeAvailable", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 1, eflags: 0x1 linked
    // Checksum 0x329e8760, Offset: 0x928
    // Size: 0x6c
    function increment_progress(localclientnum) {
        current_val = [[ self ]]->get_data(localclientnum, "progress");
        new_val = (current_val + 1) % 2;
        [[ self ]]->set_data(localclientnum, "progress", new_val);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa29d17e0, Offset: 0x8f0
    // Size: 0x30
    function set_binlocation(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "bInLocation", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0xad417280, Offset: 0x8b8
    // Size: 0x30
    function set_bottomtext(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "bottomText", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6ec53cab, Offset: 0x880
    // Size: 0x30
    function set_challengetext(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "challengeText", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa6dfe837, Offset: 0x758
    // Size: 0x11c
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"visible" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 1);
            return;
        }
        if (#"visiblepc" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 2);
            return;
        }
        if (#"trials" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 3);
            return;
        }
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4d3404e4, Offset: 0x720
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_red_challenges_hud");
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 1, eflags: 0x1 linked
    // Checksum 0x94fd5f54, Offset: 0x5f8
    // Size: 0x120
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_state(localclientnum, #"defaultstate");
        [[ self ]]->set_data(localclientnum, "challengeText", #"");
        [[ self ]]->set_data(localclientnum, "bottomText", #"");
        [[ self ]]->set_data(localclientnum, "bInLocation", 0);
        [[ self ]]->set_data(localclientnum, "progress", 0);
        [[ self ]]->set_data(localclientnum, "tributeAvailable", 0);
        [[ self ]]->set_data(localclientnum, "rewardHidden", 0);
        [[ self ]]->set_data(localclientnum, "challengeFailing", 0);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc5962bd7, Offset: 0x5c8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 8, eflags: 0x1 linked
    // Checksum 0x9efdb812, Offset: 0x420
    // Size: 0x19c
    function setup_clientfields(uid, var_be2ad4d, var_a7896263, var_4866daed, progresscallback, var_5d7491df, var_26df3d64, var_90359ec7) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 2, "int");
        cluielem::function_dcb34c80("string", "challengeText", 13000);
        cluielem::function_dcb34c80("string", "bottomText", 13000);
        cluielem::add_clientfield("bInLocation", 13000, 1, "int", var_4866daed);
        cluielem::add_clientfield("progress", 13000, 1, "counter", progresscallback);
        cluielem::add_clientfield("tributeAvailable", 13000, 3, "int", var_5d7491df);
        cluielem::add_clientfield("rewardHidden", 15000, 1, "int", var_26df3d64);
        cluielem::add_clientfield("challengeFailing", 15000, 1, "int", var_90359ec7);
    }

}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 8, eflags: 0x1 linked
// Checksum 0x2b9f7578, Offset: 0x128
// Size: 0x94
function register(uid, var_be2ad4d, var_a7896263, var_4866daed, progresscallback, var_5d7491df, var_26df3d64, var_90359ec7) {
    elem = new czm_red_challenges_hud();
    [[ elem ]]->setup_clientfields(uid, var_be2ad4d, var_a7896263, var_4866daed, progresscallback, var_5d7491df, var_26df3d64, var_90359ec7);
    return elem;
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0xc452ca9a, Offset: 0x1c8
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_red_challenges_hud();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0x6dc7b67d, Offset: 0x210
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0xd984dd5b, Offset: 0x238
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0x22a63d97, Offset: 0x260
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0xbded2524, Offset: 0x288
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0xf9af30d, Offset: 0x2b8
// Size: 0x28
function set_challengetext(localclientnum, value) {
    [[ self ]]->set_challengetext(localclientnum, value);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0xe9a30a0b, Offset: 0x2e8
// Size: 0x28
function set_bottomtext(localclientnum, value) {
    [[ self ]]->set_bottomtext(localclientnum, value);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0xefa07981, Offset: 0x318
// Size: 0x28
function set_binlocation(localclientnum, value) {
    [[ self ]]->set_binlocation(localclientnum, value);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0xcfe689a2, Offset: 0x348
// Size: 0x1c
function increment_progress(localclientnum) {
    [[ self ]]->increment_progress(localclientnum);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0xe1b0f16d, Offset: 0x370
// Size: 0x28
function set_tributeavailable(localclientnum, value) {
    [[ self ]]->set_tributeavailable(localclientnum, value);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0xa867a16d, Offset: 0x3a0
// Size: 0x28
function set_rewardhidden(localclientnum, value) {
    [[ self ]]->set_rewardhidden(localclientnum, value);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0x5cc2ff69, Offset: 0x3d0
// Size: 0x28
function set_challengefailing(localclientnum, value) {
    [[ self ]]->set_challengefailing(localclientnum, value);
}

