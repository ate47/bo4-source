#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\spawner_shared;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_red_achievement;

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x1 linked
// Checksum 0x8709dc70, Offset: 0x1f0
// Size: 0x6c
function init() {
    level thread function_e502ed82();
    spawner::add_archetype_spawn_function(#"gegenees", &function_b3786a8a);
    callback::on_connect(&function_3aed7ccf);
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x1 linked
// Checksum 0x87720a06, Offset: 0x268
// Size: 0xc4
function function_3aed7ccf() {
    self thread function_ec51ce01();
    self thread function_653f23be();
    self thread function_50e46434();
    self thread function_863d6212();
    self thread function_103e6827();
    self thread function_3c39c720();
    self thread function_74846734();
    self thread function_84d102f2();
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0x6d7fa554, Offset: 0x338
// Size: 0x7c
function private function_ec51ce01() {
    self endon(#"disconnect");
    level waittill(#"hash_71d7e6a55a1ca9e");
    if (zm_utility::is_classic()) {
        /#
            self iprintlnbold("<dev string:x38>");
        #/
        self zm_utility::giveachievement_wrapper("zm_red_tragedy");
    }
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0xdc573321, Offset: 0x3c0
// Size: 0x174
function private function_653f23be() {
    self endon(#"death");
    level endon(#"end_game");
    if (zm_custom::function_901b751c(#"startround") > 1) {
        return;
    }
    level flagsys::wait_till("start_zombie_round_logic");
    if (level.round_number > 1) {
        return;
    }
    var_76f21e6b = array("zone_temple_of_apollo", "zone_temple_of_apollo_left_path", "zone_temple_of_apollo_right_path", "zone_temple_of_apollo_back");
    while (level.round_number <= 20) {
        str_zone = self zm_zonemgr::get_player_zone();
        if (!isdefined(str_zone) || !isinarray(var_76f21e6b, str_zone)) {
            return;
        }
        wait 1;
    }
    /#
        self iprintlnbold("<dev string:x55>");
    #/
    self zm_utility::giveachievement_wrapper("zm_red_follower");
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0xb0879784, Offset: 0x540
// Size: 0x12a
function private function_50e46434() {
    self endon(#"disconnect");
    if (zm_custom::function_901b751c(#"startround") > 1) {
        return;
    }
    while (true) {
        s_result = level waittill(#"hash_751ac3ddacb1c548", #"between_round_over");
        if (s_result._notify == "between_round_over" && level.round_number > 15) {
            return;
        }
        if (!isdefined(level.var_705db276)) {
            continue;
        }
        if (level.var_705db276 >= 5) {
            /#
                self iprintlnbold("<dev string:x75>");
            #/
            self zm_utility::giveachievement_wrapper("zm_red_tribute");
            return;
        }
    }
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0xa35b6469, Offset: 0x678
// Size: 0x11a
function private function_863d6212() {
    self endon(#"disconnect");
    if (!zm_custom::function_901b751c(#"zmwonderweaponisenabled") || zm_utility::is_standard()) {
        return;
    }
    while (true) {
        s_result = self waittill(#"hash_4c8edf52fbfca691");
        if (self flag::get(#"ww_combat_active") || !isdefined(s_result.var_e0ae28d)) {
            continue;
        }
        if (s_result.var_e0ae28d >= 4) {
            /#
                self iprintlnbold("<dev string:x95>");
            #/
            self zm_utility::giveachievement_wrapper("zm_red_mountains");
            return;
        }
    }
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0x79dca48d, Offset: 0x7a0
// Size: 0x122
function private function_103e6827() {
    self endon(#"disconnect");
    if (!zm_custom::function_901b751c(#"zmwonderweaponisenabled") || zm_utility::is_standard()) {
        return;
    }
    while (true) {
        s_result = self waittill(#"hash_175b1370e662293a");
        if (self flag::get(#"ww_combat_active")) {
            continue;
        }
        if (isdefined(s_result.var_b1224954) && s_result.var_b1224954.n_dragged >= 15) {
            /#
                self iprintlnbold("<dev string:xb3>");
            #/
            self zm_utility::giveachievement_wrapper("zm_red_no_obol");
            return;
        }
    }
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0x50005c44, Offset: 0x8d0
// Size: 0x19a
function private function_3c39c720() {
    self endoncallback(&function_a5f404e2, #"disconnect");
    if (!zm_custom::function_901b751c(#"zmwonderweaponisenabled") || zm_utility::is_standard()) {
        return;
    }
    while (true) {
        s_result = self waittill(#"hash_4969a839c4e666dc");
        if (self flag::get(#"ww_combat_active")) {
            continue;
        }
        self.var_ec3e3f82 = 0;
        level callback::on_ai_killed(&function_8a595f5);
        self waittill(#"weapon_change", #"weapon_fired", #"stop_beaming");
        level callback::remove_on_ai_killed(&function_8a595f5);
        if (self.var_ec3e3f82 >= 20) {
            /#
                self iprintlnbold("<dev string:xca>");
            #/
            self zm_utility::giveachievement_wrapper("zm_red_sun");
            return;
        }
        self.var_ec3e3f82 = undefined;
    }
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 1, eflags: 0x1 linked
// Checksum 0xa8a361af, Offset: 0xa78
// Size: 0x70
function function_8a595f5(s_params) {
    if (isplayer(s_params.eattacker) && s_params.weapon == level.w_hand_hemera) {
        if (isdefined(self.var_4dcd7a1c) && self.var_4dcd7a1c) {
            s_params.eattacker.var_ec3e3f82++;
        }
    }
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 1, eflags: 0x5 linked
// Checksum 0x20622574, Offset: 0xaf0
// Size: 0x2c
function private function_a5f404e2(var_c34665fc) {
    level callback::remove_on_ai_killed(&function_8a595f5);
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0xdb213295, Offset: 0xb28
// Size: 0x19a
function private function_74846734() {
    self endoncallback(&function_8828b419, #"disconnect");
    if (!zm_custom::function_901b751c(#"zmwonderweaponisenabled") || zm_utility::is_standard()) {
        return;
    }
    while (true) {
        s_result = self waittill(#"start_beaming");
        if (self flag::get(#"ww_combat_active")) {
            continue;
        }
        self.n_flung = 0;
        level callback::on_ai_killed(&function_c6125761);
        self waittill(#"weapon_change", #"weapon_fired", #"stop_beaming");
        level callback::remove_on_ai_killed(&function_c6125761);
        if (self.n_flung >= 20) {
            /#
                self iprintlnbold("<dev string:xee>");
            #/
            self zm_utility::giveachievement_wrapper("zm_red_wind");
            return;
        }
        self.n_flung = undefined;
    }
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 1, eflags: 0x1 linked
// Checksum 0x77998548, Offset: 0xcd0
// Size: 0x8c
function function_c6125761(s_params) {
    if (isplayer(s_params.eattacker) && s_params.weapon == level.w_hand_ouranos) {
        if (isdefined(self.var_8ac7cc49) && self.var_8ac7cc49 && isdefined(s_params.eattacker.n_flung)) {
            s_params.eattacker.n_flung++;
        }
    }
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 1, eflags: 0x5 linked
// Checksum 0xe38c5d14, Offset: 0xd68
// Size: 0x2c
function private function_8828b419(var_c34665fc) {
    level callback::remove_on_ai_killed(&function_c6125761);
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0xc6d22785, Offset: 0xda0
// Size: 0x184
function private function_84d102f2() {
    self endon(#"disconnect", #"hash_5766f147327163d1");
    while (true) {
        s_result = level waittill(#"hash_4fb1eb2c137a7955", #"hash_1e2d6c34f734996b");
        if (s_result._notify == #"hash_4fb1eb2c137a7955") {
            if (s_result.e_player !== self) {
                return;
            }
            waitframe(1);
            if (level flag::get(#"hash_67695ee69c57c0b2") && level flag::get(#"hash_61de3b8fe6f6a35")) {
                /#
                    self iprintlnbold("<dev string:x10b>");
                #/
                self zm_utility::giveachievement_wrapper("zm_red_eagle");
                self notify(#"hash_5766f147327163d1");
            } else {
                self thread function_9fdcf13f();
            }
        } else if (s_result._notify == #"hash_1e2d6c34f734996b") {
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0x9afeb54d, Offset: 0xf30
// Size: 0x70
function private function_9fdcf13f() {
    self endon(#"disconnect", #"hash_5766f147327163d1", #"hash_4fb1eb2c137a7955");
    self waittill(#"weapon_change");
    level notify(#"hash_1e2d6c34f734996b", {#e_player:self});
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0x4ca88980, Offset: 0xfa8
// Size: 0x1c
function private function_b3786a8a() {
    self thread function_f31369ae();
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0x61adaca5, Offset: 0xfd0
// Size: 0x18c
function private function_f31369ae() {
    e_player = undefined;
    while (isalive(self)) {
        s_result = self waittill(#"damage", #"death");
        if ((s_result.weapon === getweapon(#"zhield_zpear_dw") || s_result.weapon === getweapon(#"zhield_zpear_turret")) && isplayer(s_result.attacker)) {
            if (!isdefined(e_player)) {
                e_player = s_result.attacker;
            } else if (e_player !== s_result.attacker || isdefined(e_player.var_298cc14d) && e_player.var_298cc14d) {
                return;
            }
            continue;
        }
        return;
    }
    if (isdefined(e_player)) {
        e_player.var_298cc14d = 1;
        /#
            e_player iprintlnbold("<dev string:x12c>");
        #/
        e_player zm_utility::giveachievement_wrapper("zm_red_defense");
    }
}

// Namespace zm_red_achievement/zm_red_achievement
// Params 0, eflags: 0x5 linked
// Checksum 0x980347f5, Offset: 0x1168
// Size: 0xdc
function private function_e502ed82() {
    level endon(#"end_game");
    a_flags = array(#"hash_5827ff8b059b77f3", #"hash_786c9a9f60b254f5", #"hash_3b7c39d9b76689fb", #"hash_29ac8ec32d2a389b", #"hash_39100dea955077f2");
    level flagsys::wait_till_all(a_flags);
    /#
        iprintlnbold("<dev string:x15e>");
    #/
    zm_utility::giveachievement_wrapper("zm_red_gods", 1);
}

