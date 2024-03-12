// Atian COD Tools GSC decompiler test
#using scripts\core_common\array_shared.gsc;

#namespace match_record;

// Namespace match_record/match_record
// Params 2, eflags: 0x0
// Checksum 0x172dc815, Offset: 0x70
// Size: 0x38
function function_d92cb558(result, vararg) {
    /#
        pathstr = "<unknown string>";
        if (isdefined(result)) {
        }
        return pathstr;
    #/
}

// Namespace match_record/match_record
// Params 1, eflags: 0x21 linked
// Checksum 0xc852de7a, Offset: 0xb0
// Size: 0x80
function get_stat(...) {
    /#
        assert(vararg.size > 0);
    #/
    if (vararg.size == 0) {
        return undefined;
    }
    result = readmatchstat(vararg);
    /#
        function_d92cb558(result, vararg);
    #/
    return result;
}

// Namespace match_record/match_record
// Params 1, eflags: 0x21 linked
// Checksum 0xe452cc60, Offset: 0x138
// Size: 0xc0
function set_stat(...) {
    /#
        assert(vararg.size > 1);
    #/
    if (vararg.size <= 1) {
        return;
    }
    value = vararg[vararg.size - 1];
    arrayremoveindex(vararg, vararg.size - 1);
    result = writematchstat(vararg, value);
    /#
        function_d92cb558(result, vararg);
    #/
    return result;
}

// Namespace match_record/match_record
// Params 1, eflags: 0x21 linked
// Checksum 0x3180a589, Offset: 0x200
// Size: 0x144
function function_7a93acec(...) {
    vec = vararg[vararg.size - 1];
    arrayremoveindex(vararg, vararg.size - 1);
    vec_0 = set_stat(vararg, 0, int(vec[0]));
    vec_1 = set_stat(vararg, 1, int(vec[1]));
    vec_2 = set_stat(vararg, 2, int(vec[2]));
    return isdefined(vec_0) && vec_0 && isdefined(vec_1) && vec_1 && isdefined(vec_2) && vec_2;
}

// Namespace match_record/match_record
// Params 1, eflags: 0x21 linked
// Checksum 0x6228ee8b, Offset: 0x350
// Size: 0xc0
function inc_stat(...) {
    /#
        assert(vararg.size > 1);
    #/
    if (vararg.size <= 1) {
        return;
    }
    value = vararg[vararg.size - 1];
    arrayremoveindex(vararg, vararg.size - 1);
    result = incrementmatchstat(vararg, value);
    /#
        function_d92cb558(result, vararg);
    #/
    return result;
}

// Namespace match_record/match_record
// Params 0, eflags: 0x1 linked
// Checksum 0xae0758a8, Offset: 0x418
// Size: 0x78
function get_player_index() {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (isplayer(player) && isdefined(player.clientid)) {
        return player.clientid;
    }
}

// Namespace match_record/match_record
// Params 1, eflags: 0x21 linked
// Checksum 0x6455dd54, Offset: 0x498
// Size: 0x8c
function get_player_stat(...) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (isplayer(player)) {
        return get_stat(#"players", player.clientid, vararg);
    }
}

// Namespace match_record/match_record
// Params 1, eflags: 0x21 linked
// Checksum 0x2708e3bc, Offset: 0x530
// Size: 0xcc
function set_player_stat(...) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (isplayer(player)) {
        value = vararg[vararg.size - 1];
        arrayremoveindex(vararg, vararg.size - 1);
        return set_stat(#"players", player.clientid, vararg, value);
    }
}

// Namespace match_record/match_record
// Params 1, eflags: 0x20
// Checksum 0x9acef3dd, Offset: 0x608
// Size: 0x196
function function_ded5f5b6(...) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (isplayer(player)) {
        vec = vararg[vararg.size - 1];
        arrayremoveindex(vararg, vararg.size - 1);
        vec_0 = set_player_stat(vararg, 0, int(vec[0]));
        vec_1 = set_player_stat(vararg, 1, int(vec[1]));
        vec_2 = set_player_stat(vararg, 2, int(vec[2]));
        return (isdefined(vec_0) && vec_0 && isdefined(vec_1) && vec_1 && isdefined(vec_2) && vec_2);
    }
}

// Namespace match_record/match_record
// Params 1, eflags: 0x21 linked
// Checksum 0xf4a8584d, Offset: 0x7a8
// Size: 0xcc
function function_34800eec(...) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (isplayer(player)) {
        value = vararg[vararg.size - 1];
        arrayremoveindex(vararg, vararg.size - 1);
        return inc_stat(#"players", player.clientid, vararg, value);
    }
}

