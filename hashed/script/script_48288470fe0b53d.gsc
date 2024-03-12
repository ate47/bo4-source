// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_red_challenges_hud;

// Namespace zm_red_challenges_hud
// Method(s) 13 Total 20
class czm_red_challenges_hud : cluielem {

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 0, eflags: 0x9 linked
    // Checksum 0x924a4a5f, Offset: 0x398
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x91b99d56, Offset: 0x8e0
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0x868e354e, Offset: 0x898
    // Size: 0x3c
    function set_challengefailing(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "challengeFailing", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0xbc9ce00, Offset: 0x850
    // Size: 0x3c
    function set_rewardhidden(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "rewardHidden", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0x88b7c0a8, Offset: 0x808
    // Size: 0x3c
    function set_tributeavailable(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "tributeAvailable", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4ba442a0, Offset: 0x7c8
    // Size: 0x34
    function increment_progress(player) {
        player clientfield::function_bb878fc3(self.var_47e79fc, "progress");
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0xaa45b088, Offset: 0x780
    // Size: 0x3c
    function set_binlocation(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "bInLocation", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa4e318fc, Offset: 0x738
    // Size: 0x3c
    function set_bottomtext(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "bottomText", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa114966d, Offset: 0x6f0
    // Size: 0x3c
    function set_challengetext(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "challengeText", value);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2fcb7e1f, Offset: 0x5a8
    // Size: 0x13c
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 0);
            return;
        }
        if (#"visible" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 1);
            return;
        }
        if (#"visiblepc" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 2);
            return;
        }
        if (#"trials" == state_name) {
            player clientfield::function_9bf78ef8(self.var_47e79fc, "_state", 3);
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
    // Checksum 0xf5f8599f, Offset: 0x578
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 2, eflags: 0x1 linked
    // Checksum 0x4f9a2773, Offset: 0x528
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_red_challenges_hud", persistent);
    }

    // Namespace czm_red_challenges_hud/zm_red_challenges_hud
    // Params 1, eflags: 0x1 linked
    // Checksum 0x150703c5, Offset: 0x3b8
    // Size: 0x164
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 2, "int");
        cluielem::function_dcb34c80("string", "challengeText", 13000);
        cluielem::function_dcb34c80("string", "bottomText", 13000);
        cluielem::add_clientfield("bInLocation", 13000, 1, "int");
        cluielem::add_clientfield("progress", 13000, 1, "counter");
        cluielem::add_clientfield("tributeAvailable", 13000, 3, "int");
        cluielem::add_clientfield("rewardHidden", 15000, 1, "int");
        cluielem::add_clientfield("challengeFailing", 15000, 1, "int");
    }

}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 1, eflags: 0x1 linked
// Checksum 0x26119c0, Offset: 0x148
// Size: 0x40
function register(uid) {
    elem = new czm_red_challenges_hud();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x1 linked
// Checksum 0x6bf68e62, Offset: 0x190
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 1, eflags: 0x1 linked
// Checksum 0x20b05506, Offset: 0x1d0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 1, eflags: 0x1 linked
// Checksum 0x12debb97, Offset: 0x1f8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x1 linked
// Checksum 0xa0929fd0, Offset: 0x220
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x1 linked
// Checksum 0xc6f3f65e, Offset: 0x250
// Size: 0x28
function set_challengetext(player, value) {
    [[ self ]]->set_challengetext(player, value);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x1 linked
// Checksum 0x22e08f7c, Offset: 0x280
// Size: 0x28
function set_bottomtext(player, value) {
    [[ self ]]->set_bottomtext(player, value);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x1 linked
// Checksum 0x25504718, Offset: 0x2b0
// Size: 0x28
function set_binlocation(player, value) {
    [[ self ]]->set_binlocation(player, value);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 1, eflags: 0x1 linked
// Checksum 0x641d0716, Offset: 0x2e0
// Size: 0x1c
function increment_progress(player) {
    [[ self ]]->increment_progress(player);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x1 linked
// Checksum 0xce045de2, Offset: 0x308
// Size: 0x28
function set_tributeavailable(player, value) {
    [[ self ]]->set_tributeavailable(player, value);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x1 linked
// Checksum 0xafa89d48, Offset: 0x338
// Size: 0x28
function set_rewardhidden(player, value) {
    [[ self ]]->set_rewardhidden(player, value);
}

// Namespace zm_red_challenges_hud/zm_red_challenges_hud
// Params 2, eflags: 0x1 linked
// Checksum 0xfb8bfc8b, Offset: 0x368
// Size: 0x28
function set_challengefailing(player, value) {
    [[ self ]]->set_challengefailing(player, value);
}

