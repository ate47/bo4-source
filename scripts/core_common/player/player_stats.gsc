// Atian COD Tools GSC decompiler test
#using scripts\weapons\weapons.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace stats;

// Namespace stats/player_stats
// Params 2, eflags: 0x0
// Checksum 0x2860bb99, Offset: 0x88
// Size: 0x124
function function_d92cb558(result, vararg) {
    /#
        if (!isdefined(result)) {
            pathstr = ishash(vararg[0]) ? function_9e72a96(vararg[0]) : vararg[0];
            if (!isdefined(pathstr)) {
                return;
            }
            for (i = 1; i < vararg.size; i++) {
                pathstr = pathstr + "<unknown string>" + (ishash(vararg[i]) ? function_9e72a96(vararg[i]) : vararg[i]);
            }
            println("<unknown string>" + pathstr);
        }
    #/
}

// Namespace stats/player_stats
// Params 0, eflags: 0x1 linked
// Checksum 0x4d970cf8, Offset: 0x1b8
// Size: 0x144
function function_f94325d3() {
    player = self;
    /#
        assert(isplayer(player), "<unknown string>");
    #/
    if (isbot(player) || isdefined(level.disablestattracking) && level.disablestattracking) {
        return 0;
    }
    if (sessionmodeiswarzonegame()) {
        if (getdvarint(#"scr_disable_merits", 0) == 1) {
            return 0;
        }
        if (!isdefined(game.state) || game.state == "pregame") {
            return 0;
        }
        if (!isdedicated() && getdvarint(#"wz_stat_testing", 0) == 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace stats/player_stats
// Params 0, eflags: 0x1 linked
// Checksum 0x72901f5a, Offset: 0x308
// Size: 0xe
function function_8921af36() {
    return level.var_12323003;
}

// Namespace stats/player_stats
// Params 1, eflags: 0x21 linked
// Checksum 0xfe68475f, Offset: 0x320
// Size: 0xc0
function get_stat(...) {
    /#
        assert(vararg.size > 0);
    #/
    if (vararg.size == 0) {
        return 0;
    }
    result = 0;
    if (isdefined(self)) {
        /#
            assert(isplayer(self), "<unknown string>");
        #/
        result = self readstat(vararg);
        /#
            function_d92cb558(result, vararg);
        #/
    }
    return result;
}

// Namespace stats/player_stats
// Params 1, eflags: 0x21 linked
// Checksum 0x822f6119, Offset: 0x3e8
// Size: 0xc0
function function_6d50f14b(...) {
    /#
        assert(vararg.size > 0);
    #/
    if (vararg.size == 0) {
        return 0;
    }
    result = 0;
    if (isdefined(self)) {
        /#
            assert(isplayer(self), "<unknown string>");
        #/
        result = self function_c3462d90(vararg);
        /#
            function_d92cb558(result, vararg);
        #/
    }
    return result;
}

// Namespace stats/player_stats
// Params 1, eflags: 0x21 linked
// Checksum 0xe6beaab2, Offset: 0x4b0
// Size: 0xc0
function function_ff8f4f17(...) {
    /#
        assert(vararg.size > 0);
    #/
    if (vararg.size == 0) {
        return 0;
    }
    result = 0;
    if (isdefined(self)) {
        /#
            assert(isplayer(self), "<unknown string>");
        #/
        result = self function_24c32cb1(vararg);
        /#
            function_d92cb558(result, vararg);
        #/
    }
    return result;
}

// Namespace stats/player_stats
// Params 1, eflags: 0x21 linked
// Checksum 0x33a78da4, Offset: 0x578
// Size: 0x12a
function set_stat(...) {
    /#
        assert(vararg.size > 1);
    #/
    if (vararg.size <= 1) {
        return 0;
    }
    if (!function_f94325d3()) {
        return 0;
    }
    result = 0;
    if (isdefined(self)) {
        /#
            assert(isplayer(self), "<unknown string>");
        #/
        value = vararg[vararg.size - 1];
        arrayremoveindex(vararg, vararg.size - 1);
        result = self writestat(vararg, value);
        /#
            function_d92cb558(result, vararg);
        #/
    }
    return isdefined(result) && result;
}

// Namespace stats/player_stats
// Params 1, eflags: 0x21 linked
// Checksum 0xa4b264c2, Offset: 0x6b0
// Size: 0x152
function inc_stat(...) {
    /#
        assert(vararg.size > 1);
    #/
    if (vararg.size <= 1) {
        return;
    }
    if (!function_f94325d3()) {
        return;
    }
    player = self;
    /#
        assert(isplayer(player), "<unknown string>");
    #/
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    value = vararg[vararg.size - 1];
    arrayremoveindex(vararg, vararg.size - 1);
    result = player incrementstat(vararg, value);
    /#
        function_d92cb558(result, vararg);
    #/
    return isdefined(result) && result;
}

// Namespace stats/player_stats
// Params 2, eflags: 0x5 linked
// Checksum 0xaec2ffa4, Offset: 0x810
// Size: 0x104
function private function_e6106f3b(statname, value) {
    self set_stat(#"playerstatsbygametype", function_8921af36(), statname, #"statvalue", value);
    self set_stat(#"playerstatsbygametype", function_8921af36(), statname, #"challengevalue", value);
    self set_stat(#"playerstatslist", statname, #"statvalue", value);
    self set_stat(#"playerstatslist", statname, #"challengevalue", value);
}

// Namespace stats/player_stats
// Params 2, eflags: 0x5 linked
// Checksum 0xba2028ef, Offset: 0x920
// Size: 0x70
function private function_1d354b96(statname, value) {
    var_44becfa9 = self inc_stat(#"playerstatslist", statname, #"statvalue", value);
    self addgametypestat(statname, value);
    return var_44becfa9;
}

// Namespace stats/player_stats
// Params 1, eflags: 0x1 linked
// Checksum 0xaf661531, Offset: 0x998
// Size: 0x52
function function_ed81f25e(statname) {
    return self get_stat(#"playerstatsbygametype", util::get_gametype_name(), statname, #"statvalue");
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0xfb3c752c, Offset: 0x9f8
// Size: 0x7a
function function_baa25a23(statname, value) {
    if (!function_f94325d3()) {
        return 0;
    }
    if (sessionmodeiswarzonegame()) {
        function_e6106f3b(statname, value);
    } else {
        self addgametypestat(statname, value);
        return 1;
    }
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0xfdc7263a, Offset: 0xa80
// Size: 0x7a
function function_d40764f3(statname, value) {
    if (!function_f94325d3()) {
        return 0;
    }
    if (sessionmodeiswarzonegame()) {
        return function_1d354b96(statname, value);
    } else {
        self addgametypestat(statname, value);
        return 1;
    }
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0xa6f3ddfb, Offset: 0xb08
// Size: 0x52
function function_7a850245(statname, value) {
    if (!function_f94325d3()) {
        return 0;
    }
    return self set_stat(#"afteractionreportstats", statname, value);
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0x9bbca73c, Offset: 0xb68
// Size: 0x1e6
function function_62b271d8(statname, value) {
    teammates = getplayers(self.team);
    foreach (player in teammates) {
        if (!player function_f94325d3()) {
            continue;
        }
        teammatecount = get_stat(#"afteractionreportstats", #"teammatecount");
        if (!isdefined(teammatecount)) {
            return;
        }
        playerxuid = int(self getxuid(1));
        for (i = 0; i < teammatecount; i++) {
            var_bd8d01a8 = player get_stat(#"afteractionreportstats", #"teammates", i, #"xuid");
            if (var_bd8d01a8 === playerxuid) {
                player set_stat(#"afteractionreportstats", #"teammates", i, statname, value);
                break;
            }
        }
    }
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0xb7775fed, Offset: 0xd58
// Size: 0x1e6
function function_b7f80d87(statname, value) {
    teammates = getplayers(self.team);
    foreach (player in teammates) {
        if (!player function_f94325d3()) {
            continue;
        }
        teammatecount = get_stat(#"afteractionreportstats", #"teammatecount");
        if (!isdefined(teammatecount)) {
            return;
        }
        playerxuid = int(self getxuid(1));
        for (i = 0; i < teammatecount; i++) {
            var_bd8d01a8 = player get_stat(#"afteractionreportstats", #"teammates", i, #"xuid");
            if (var_bd8d01a8 === playerxuid) {
                player inc_stat(#"afteractionreportstats", #"teammates", i, statname, value);
                break;
            }
        }
    }
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0x7c8ac546, Offset: 0xf48
// Size: 0xea
function function_81f5c0fe(statname, value) {
    if (!function_f94325d3() || sessionmodeiswarzonegame()) {
        return 0;
    }
    gametype = level.var_12323003;
    map = util::get_map_name();
    mapstats = isarenamode() ? #"mapstatsarena" : #"mapstats";
    return self inc_stat(mapstats, map, #"permode", gametype, statname, value);
}

// Namespace stats/player_stats
// Params 3, eflags: 0x1 linked
// Checksum 0xa3431346, Offset: 0x1040
// Size: 0xea
function set_stat_global(statname, value, var_b6d36336 = 0) {
    if (!function_f94325d3()) {
        return 0;
    }
    if (sessionmodeiswarzonegame()) {
        return function_e6106f3b(statname, value);
    }
    if (isarenamode() && !var_b6d36336) {
        return self set_stat(#"playerstatslist", statname, #"arenavalue", value);
    }
    return self set_stat(#"playerstatslist", statname, #"statvalue", value);
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0xcb48dd6b, Offset: 0x1138
// Size: 0xa2
function get_stat_global(statname, var_b6d36336 = 0) {
    if (isarenamode() && !var_b6d36336) {
        return self get_stat(#"playerstatslist", statname, #"arenavalue");
    }
    return self get_stat(#"playerstatslist", statname, #"statvalue");
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0x774c9e55, Offset: 0x11e8
// Size: 0x5a
function set_stat_challenge(statname, value) {
    if (!function_f94325d3()) {
        return 0;
    }
    return self set_stat(#"playerstatslist", statname, #"challengevalue", value);
}

// Namespace stats/player_stats
// Params 1, eflags: 0x1 linked
// Checksum 0x249d9d92, Offset: 0x1250
// Size: 0x3a
function get_stat_challenge(statname) {
    return self get_stat(#"playerstatslist", statname, #"challengevalue");
}

// Namespace stats/player_stats
// Params 1, eflags: 0x1 linked
// Checksum 0xc7f22abc, Offset: 0x1298
// Size: 0x3a
function function_af5584ca(statname) {
    return self get_stat(#"playerstatslist", statname, #"challengetier");
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0x2b3e299a, Offset: 0x12e0
// Size: 0x5a
function function_8e071909(statname, value) {
    if (!function_f94325d3()) {
        return 0;
    }
    return self set_stat(#"playerstatslist", statname, #"challengetier", value);
}

// Namespace stats/player_stats
// Params 1, eflags: 0x0
// Checksum 0xd26fae90, Offset: 0x1348
// Size: 0x52
function function_878e75b7(statname) {
    return self get_stat(#"playerstatsbygametype", util::get_gametype_name(), statname, #"challengevalue");
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0xc09322fb, Offset: 0x13a8
// Size: 0xca
function function_dad108fa(statname, value) {
    if (!function_f94325d3()) {
        return 0;
    }
    if (sessionmodeiswarzonegame()) {
        return function_1d354b96(statname, value);
    }
    if (isarenamode()) {
        return self inc_stat(#"playerstatslist", statname, #"arenavalue", value);
    }
    return self inc_stat(#"playerstatslist", statname, #"statvalue", value);
}

// Namespace stats/player_stats
// Params 2, eflags: 0x1 linked
// Checksum 0x757d42f9, Offset: 0x1480
// Size: 0x82
function function_bb7eedf0(statname, value) {
    if (sessionmodeiswarzonegame()) {
        return self function_1d354b96(statname, value);
    }
    setglobal = self function_dad108fa(statname, value);
    return self addgametypestat(statname, value);
}

// Namespace stats/player_stats
// Params 6, eflags: 0x1 linked
// Checksum 0x6d2278fc, Offset: 0x1510
// Size: 0x17a
function function_eec52333(weapon, statname, value, classnum, pickedup, forceads) {
    if (sessionmodeiswarzonegame() && game.state == "pregame") {
        return;
    }
    if (sessionmodeiszombiesgame() && level.zm_disable_recording_stats === 1) {
        return;
    }
    if (isdefined(level.var_b10e134d)) {
        [[ level.var_b10e134d ]](self, weapon, statname, value);
    }
    self addweaponstat(weapon, statname, value, classnum, pickedup, forceads);
    switch (statname) {
    case #"shots":
    case #"used":
        self function_f95ea9b6(weapon);
        break;
    case #"kills":
        if (weapon.var_ff0b00ba) {
            self function_dad108fa(#"kills_equipment", 1);
        }
        break;
    }
}

// Namespace stats/player_stats
// Params 3, eflags: 0x1 linked
// Checksum 0x23f47b90, Offset: 0x1698
// Size: 0x44
function function_e24eec31(weapon, statname, value) {
    self function_eec52333(weapon, statname, value, undefined, undefined, undefined);
}

