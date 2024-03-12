// Atian COD Tools GSC decompiler test
#using scripts\weapons\smokegrenade.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\shoutcaster.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using script_4daa124bc391e7ed;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\abilities\gadgets\gadget_vision_pulse.csc;

#namespace player;

// Namespace player/player
// Params 0, eflags: 0x2
// Checksum 0x1a8c2afe, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"player_mp", &__init__, undefined, "renderoverridebundle");
}

// Namespace player/player
// Params 0, eflags: 0x0
// Checksum 0x6af426d1, Offset: 0x140
// Size: 0x1bc
function __init__() {
    callback::on_spawned(&on_player_spawned);
    callback::on_player_corpse(&on_player_corpse);
    callback::function_930e5d42(&function_930e5d42);
    callback::on_weapon_change(&function_585458);
    callback::on_localclient_connect(&shoutcaster::function_981be10f);
    level.var_15ab9bbd = 1;
    renderoverridebundle::function_f72f089c(#"hash_27554b8df2b9e92b", sessionmodeiscampaigngame() ? #"hash_1cbf6d26721c59a7" : #"hash_1c90592671f4c6e9", &function_6803f977, undefined, undefined, 1);
    renderoverridebundle::function_f72f089c(#"hash_757cb7d3be0afb26", sessionmodeiscampaigngame() ? #"hash_1cbf6d26721c59a7" : #"hash_7a8f0ff83c7ba2be", &function_972e0565);
    renderoverridebundle::function_f72f089c(#"hash_2f86d28434166be7", #"hash_71fbf1094f57b910", &function_fac25f84);
}

// Namespace player/player
// Params 2, eflags: 0x0
// Checksum 0xb140a2df, Offset: 0x308
// Size: 0xe6
function function_972e0565(local_client_num, bundle) {
    util::waitforclient(local_client_num);
    if (shoutcaster::is_shoutcaster(local_client_num)) {
        return 0;
    }
    localplayer = function_5c10bd79(local_client_num);
    if (self == localplayer) {
        curweapon = self function_d2c2b168();
        blade = getweapon(#"sig_blade");
        if (isthirdperson(local_client_num) && curweapon == blade) {
            return 1;
        }
    }
    return 0;
}

// Namespace player/player
// Params 2, eflags: 0x0
// Checksum 0x6cffef8c, Offset: 0x3f8
// Size: 0xbc
function function_a25e8ff(localclientnum, var_21818d51) {
    if (!var_21818d51 && shoutcaster::is_shoutcaster(localclientnum)) {
        self shoutcaster::function_a0b844f1(localclientnum, #"hash_2f86d28434166be7", #"hash_71fbf1094f57b910");
        return;
    }
    if (self function_21c0fa55()) {
        self function_3752300d(localclientnum);
        return;
    }
    self function_bcc9c79c(localclientnum);
}

// Namespace player/player
// Params 1, eflags: 0x0
// Checksum 0x86014d1b, Offset: 0x4c0
// Size: 0xd4
function on_player_spawned(localclientnum) {
    if (shoutcaster::is_shoutcaster(localclientnum)) {
        if (self postfx::function_556665f2("pstfx_radiation_dot")) {
            self postfx::exitpostfxbundle("pstfx_radiation_dot");
        }
        if (self postfx::function_556665f2("pstfx_burn_loop")) {
            self postfx::exitpostfxbundle("pstfx_burn_loop");
        }
    }
    function_a25e8ff(localclientnum, 0);
    self namespace_9bcd7d72::function_bdda909b();
}

// Namespace player/player
// Params 1, eflags: 0x4
// Checksum 0x597f79b6, Offset: 0x5a0
// Size: 0xe0
function private function_5d6c2a78(localclientnum) {
    foreach (player in getplayers(localclientnum)) {
        if (player function_21c0fa55()) {
            player function_3752300d(localclientnum);
            continue;
        }
        if (player.team == self.team) {
            player function_bcc9c79c(localclientnum);
        }
    }
}

// Namespace player/player
// Params 1, eflags: 0x0
// Checksum 0x1eaa2ca5, Offset: 0x688
// Size: 0x4c
function function_930e5d42(localclientnum) {
    if (self function_da43934d()) {
        level notify(#"hash_21eba590bb904092");
        self function_5d6c2a78(localclientnum);
    }
}

// Namespace player/player
// Params 2, eflags: 0x0
// Checksum 0xec4846e0, Offset: 0x6e0
// Size: 0xec
function on_player_corpse(localclientnum, params) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    self function_a25e8ff(localclientnum, 1);
    self renderoverridebundle::stop_bundle(#"friendly", sessionmodeiscampaigngame() ? #"hash_1cbf6d26721c59a7" : #"hash_1c90592671f4c6e9", 0);
    if (shoutcaster::is_shoutcaster(localclientnum)) {
        self stoprenderoverridebundle(#"hash_71fbf1094f57b910");
    }
}

// Namespace player/player
// Params 1, eflags: 0x0
// Checksum 0x36090d86, Offset: 0x7d8
// Size: 0xac
function function_585458(params) {
    if (self == level) {
        local_client_num = params.localclientnum;
        var_a6426655 = function_5778f82(local_client_num, #"hash_410c46b5ff702c96");
        if (var_a6426655) {
            localplayer = function_5c10bd79(local_client_num);
            localplayer function_3752300d(local_client_num);
            localplayer smokegrenade::function_4fc900e1(local_client_num);
        }
    }
}

// Namespace player/player
// Params 1, eflags: 0x0
// Checksum 0xff310b37, Offset: 0x890
// Size: 0x44
function function_3752300d(local_client_num) {
    self renderoverridebundle::function_c8d97b8e(local_client_num, #"local", #"hash_757cb7d3be0afb26");
}

// Namespace player/player
// Params 1, eflags: 0x0
// Checksum 0x32aace74, Offset: 0x8e0
// Size: 0x44
function function_bcc9c79c(local_client_num) {
    self renderoverridebundle::function_c8d97b8e(local_client_num, #"friendly", #"hash_27554b8df2b9e92b");
}

// Namespace player/player
// Params 2, eflags: 0x0
// Checksum 0x7c5a2e9f, Offset: 0x930
// Size: 0x8a
function function_fac25f84(local_client_num, bundle) {
    if (level.gameended) {
        return 0;
    }
    if (!shoutcaster::is_shoutcaster(local_client_num)) {
        return 0;
    }
    player = function_5c10bd79(local_client_num);
    if (self == player && !shoutcaster::function_2e6e4ee0(local_client_num)) {
        return 0;
    }
    return 1;
}

// Namespace player/player
// Params 2, eflags: 0x0
// Checksum 0xf375fad0, Offset: 0x9c8
// Size: 0x112
function function_6803f977(local_client_num, bundle) {
    if (!function_2f9b4fe8(local_client_num, #"specialty_friendliesthroughwalls")) {
        return 0;
    }
    if (level.gameended) {
        return 0;
    }
    if (self function_da43934d()) {
        return 0;
    }
    player = function_5c10bd79(local_client_num);
    if (self == player) {
        return 0;
    }
    if (function_1cbf351b(local_client_num) && !player function_4e0ca360()) {
        return 0;
    }
    if (gadget_vision_pulse::is_active(local_client_num)) {
        return 0;
    }
    if (player.var_33b61b6f === 1) {
        return 0;
    }
    return renderoverridebundle::function_6803f977(local_client_num, bundle);
}

