#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zodt8_achievements;

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x2ad7089e, Offset: 0x188
// Size: 0x74
function init() {
    level thread function_55aa3c20();
    level thread function_6b34cb92();
    callback::on_connect(&on_player_connect);
    callback::on_ai_killed(&on_ai_killed);
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0xc78aada2, Offset: 0x208
// Size: 0xac
function on_player_connect() {
    self thread function_25c39229();
    self thread function_d814403c();
    self thread function_1b454689();
    self thread function_46c56964();
    self thread function_ec3040dd();
    self thread function_52f9045f();
    self thread function_b97662b6();
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 1, eflags: 0x0
// Checksum 0x838cf89b, Offset: 0x2c0
// Size: 0x18c
function on_ai_killed(params) {
    if (isplayer(params.eattacker)) {
        params.eattacker thread function_e7750e06(params);
        if (self.archetype == #"zombie" || self.archetype == #"catalyst") {
            if (self clientfield::get("sndActorUnderwater")) {
                params.eattacker thread function_9ac35f47();
            }
            if (isdefined(params.einflictor) && params.einflictor.archetype === #"catalyst" && isdefined(params.einflictor.var_85387c5b) && params.einflictor.var_85387c5b) {
                params.eattacker thread function_4060b2c6();
            }
            return;
        }
        if (self.archetype == #"stoker") {
            if (isdefined(self.var_6f3ba226) && self.var_6f3ba226) {
                params.eattacker thread function_79182658();
            }
        }
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x49303a05, Offset: 0x458
// Size: 0x7c
function function_55aa3c20() {
    level endon(#"end_game");
    level flagsys::wait_till(#"hash_25d8c88ff3f91ee5");
    /#
        iprintlnbold("<dev string:x38>");
    #/
    zm_utility::giveachievement_wrapper("ZM_ZODT8_ARTIFACT", 1);
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x42e0f8c, Offset: 0x4e0
// Size: 0x11e
function function_25c39229() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self.var_6ab98264 = 0;
    self thread function_934d3464();
    while (true) {
        self waittill(#"hash_7ba738379777a068");
        self.var_6ab98264 = 1;
        b_success = self function_6e60e5b8();
        if (isdefined(b_success) && b_success) {
            /#
                iprintlnbold("<dev string:x6b>" + self getentnum());
            #/
            self zm_utility::giveachievement_wrapper("ZM_ZODT8_STOWAWAY", 0);
            self notify(#"hash_10404a179a65cd64");
            return;
        }
        self.var_6ab98264 = 0;
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0xe6ae2de3, Offset: 0x608
// Size: 0xb8
function function_6e60e5b8() {
    level endon(#"end_game");
    self endon(#"death", #"hash_5a83ec4a73b3dc6");
    level waittill(#"start_of_round");
    var_980ea73 = level.round_number;
    while (true) {
        level waittill(#"end_of_round");
        if (level.round_number - var_980ea73 >= 5) {
            return 1;
        }
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0xe10964f0, Offset: 0x6c8
// Size: 0x134
function function_934d3464() {
    level endon(#"end_game");
    self endon(#"hash_10404a179a65cd64", #"disconnect");
    var_6bf54ff2 = array(#"zone_cargo");
    while (true) {
        if (isdefined(self.zone_name)) {
            var_d5a6219e = isstring(self.zone_name) ? hash(self.zone_name) : self.zone_name;
            if (isinarray(var_6bf54ff2, var_d5a6219e)) {
                if (!self.var_6ab98264) {
                    self notify(#"hash_7ba738379777a068");
                }
            } else if (self.var_6ab98264) {
                self notify(#"hash_5a83ec4a73b3dc6");
            }
        }
        wait 0.5;
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0xae4a0115, Offset: 0x808
// Size: 0xc2
function function_6b34cb92() {
    level endon(#"end_game", #"hash_5c62047f5c8fdbdd", #"hash_6cd15a5470217958");
    while (true) {
        level waittill(#"end_of_round");
        if (level.round_number >= 20) {
            wait 2;
            /#
                iprintlnbold("<dev string:x8e>");
            #/
            zm_utility::giveachievement_wrapper("ZM_ZODT8_DEEP_END", 1);
            return;
        }
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x5a822fb2, Offset: 0x8d8
// Size: 0x1f4
function function_d814403c() {
    level endon(#"end_game");
    self endon(#"disconnect");
    while (true) {
        self waittill(#"pap_taken");
        if (isdefined(level.s_pap_quest) && isdefined(level.s_pap_quest.var_88aa74e)) {
            if (!isdefined(self.var_6ba87fa)) {
                self.var_6ba87fa = [];
            }
            if (!isinarray(self.var_6ba87fa, level.s_pap_quest.var_88aa74e.prefabname)) {
                if (!isdefined(self.var_6ba87fa)) {
                    self.var_6ba87fa = [];
                } else if (!isarray(self.var_6ba87fa)) {
                    self.var_6ba87fa = array(self.var_6ba87fa);
                }
                if (!isinarray(self.var_6ba87fa, level.s_pap_quest.var_88aa74e.prefabname)) {
                    self.var_6ba87fa[self.var_6ba87fa.size] = level.s_pap_quest.var_88aa74e.prefabname;
                }
                if (self.var_6ba87fa.size > 3) {
                    wait 1;
                    if (isdefined(self)) {
                        /#
                            iprintlnbold("<dev string:xbd>" + self getentnum());
                        #/
                        self zm_utility::giveachievement_wrapper("ZM_ZODT8_LITTLE_PACK", 0);
                        self.var_6ba87fa = undefined;
                        return;
                    }
                }
            }
        }
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x8ba8d7cf, Offset: 0xad8
// Size: 0x1cc
function function_1b454689() {
    level endon(#"end_game");
    self endon(#"disconnect");
    while (true) {
        self waittill(#"fasttravel_bought");
        if (isdefined(self.var_5817f611)) {
            if (!isdefined(self.var_b5982a89)) {
                self.var_b5982a89 = [];
            }
            if (!isinarray(self.var_b5982a89, self.var_5817f611)) {
                if (!isdefined(self.var_b5982a89)) {
                    self.var_b5982a89 = [];
                } else if (!isarray(self.var_b5982a89)) {
                    self.var_b5982a89 = array(self.var_b5982a89);
                }
                if (!isinarray(self.var_b5982a89, self.var_5817f611)) {
                    self.var_b5982a89[self.var_b5982a89.size] = self.var_5817f611;
                }
                if (self.var_b5982a89.size > 7) {
                    self waittill(#"fasttravel_finished", #"death");
                    wait 1;
                    if (isdefined(self)) {
                        /#
                            iprintlnbold("<dev string:xed>" + self getentnum());
                        #/
                        self zm_utility::giveachievement_wrapper("ZM_ZODT8_SHORTCUT", 0);
                        self.var_b5982a89 = undefined;
                        return;
                    }
                }
            }
        }
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0xe74186fc, Offset: 0xcb0
// Size: 0xea
function function_46c56964() {
    level endon(#"end_game");
    self endon(#"disconnect", #"hash_7ef6edd06b06d480");
    self.var_574b5261 = 0;
    while (true) {
        /#
            if (self.var_574b5261) {
                iprintln("<dev string:x119>" + self.var_574b5261);
            }
        #/
        waitresult = self waittill(#"weapon_fired", #"weapon_switch_started", #"offhand_fire", #"grenade_pullback");
        self.var_574b5261 = 0;
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 1, eflags: 0x0
// Checksum 0x69b3ec39, Offset: 0xda8
// Size: 0x194
function function_e7750e06(params) {
    if (zm_weapons::is_wonder_weapon(params.weapon)) {
        switch (params.weapon.name) {
        case #"ww_tricannon_fire_t8":
        case #"ww_tricannon_earth_t8":
        case #"ww_tricannon_t8_upgraded":
        case #"ww_tricannon_air_t8_upgraded":
        case #"ww_tricannon_earth_t8_upgraded":
        case #"ww_tricannon_fire_t8_upgraded":
        case #"ww_tricannon_water_t8_upgraded":
        case #"ww_tricannon_water_t8":
        case #"ww_tricannon_t8":
        case #"ww_tricannon_air_t8":
            if (self.var_574b5261 >= 0) {
                self.var_574b5261++;
            }
            break;
        }
        if (self.var_574b5261 >= 9) {
            /#
                iprintlnbold("<dev string:x130>" + self getentnum());
            #/
            self zm_utility::giveachievement_wrapper("ZM_ZODT8_TENTACLE", 0);
            self notify(#"hash_7ef6edd06b06d480");
            self.var_574b5261 = -1;
            return;
        }
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x72113c50, Offset: 0xf48
// Size: 0xd6
function function_ec3040dd() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self.var_5b0772a7 = undefined;
    self.var_7f491224 = 0;
    while (true) {
        if (self.var_7f491224 >= 3) {
            /#
                iprintlnbold("<dev string:x15d>" + self getentnum());
            #/
            self zm_utility::giveachievement_wrapper("ZM_ZODT8_STOKING", 0);
            self.var_8c5df11c = 1;
            return;
        }
        wait 2;
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x60fc3e8e, Offset: 0x1028
// Size: 0xa4
function function_79182658() {
    if (isdefined(self.var_8c5df11c) && self.var_8c5df11c) {
        return;
    }
    if (!isdefined(self.var_5b0772a7)) {
        self.var_5b0772a7 = level.round_number;
    }
    if (self.var_5b0772a7 != level.round_number) {
        self.var_5b0772a7 = level.round_number;
        self.var_7f491224 = 0;
    }
    self.var_7f491224++;
    /#
        iprintln("<dev string:x18a>" + self.var_7f491224);
    #/
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x976d3a30, Offset: 0x10d8
// Size: 0x110
function function_52f9045f() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self.var_2b642048 = 0;
    /#
        var_1c5c067e = 0;
    #/
    while (true) {
        /#
            if (self.var_2b642048 != var_1c5c067e) {
                iprintln("<dev string:x1a2>" + self.var_2b642048);
                var_1c5c067e = self.var_2b642048;
            }
        #/
        if (self.var_2b642048 >= 9) {
            /#
                iprintlnbold("<dev string:x1b9>" + self getentnum());
            #/
            self zm_utility::giveachievement_wrapper("ZM_ZODT8_ROCK_PAPER", 0);
            return;
        }
        wait 2;
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x2686b2b5, Offset: 0x11f0
// Size: 0x10
function function_4060b2c6() {
    self.var_2b642048++;
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x8c51d986, Offset: 0x1208
// Size: 0x110
function function_b97662b6() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self.var_9e1be4c6 = 0;
    /#
        var_1c5c067e = 0;
    #/
    while (true) {
        /#
            if (self.var_9e1be4c6 != var_1c5c067e) {
                iprintln("<dev string:x1e5>" + self.var_9e1be4c6);
                var_1c5c067e = self.var_9e1be4c6;
            }
        #/
        if (self.var_9e1be4c6 >= 50) {
            /#
                iprintlnbold("<dev string:x1fa>" + self getentnum());
            #/
            self zm_utility::giveachievement_wrapper("ZM_ZODT8_SWIMMING", 0);
            return;
        }
        wait 2;
    }
}

// Namespace zodt8_achievements/zm_zodt8_achievements
// Params 0, eflags: 0x0
// Checksum 0x773ca6ff, Offset: 0x1320
// Size: 0x10
function function_9ac35f47() {
    self.var_9e1be4c6++;
}

