// Atian COD Tools GSC decompiler test
#include script_28a20e497bd69c36;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/shoutcaster.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace koth;

// Namespace koth/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x9c86fd9b, Offset: 0xf0
// Size: 0x32c
function event<gametype_init> main(eventstruct) {
    level.current_zone = [];
    level.current_state = [];
    for (i = 0; i < 4; i++) {
        level.current_zone[i] = 0;
        level.current_state[i] = 0;
    }
    level.var_e49c081c = [];
    level.visuals = [];
    level.var_49201ac2 = [];
    clientfield::register("world", "hardpoint", 1, 5, "int", &hardpoint, 0, 0);
    clientfield::register("world", "hardpointteam", 1, 5, "int", &function_f43ee1d3, 0, 0);
    level._effect[#"hash_62dd73d4603d4fb8"] = [];
    level._effect[#"hash_62dd73d4603d4fb8"][0] = #"hash_1f447aeb1973f7b6";
    level._effect[#"hash_62dd73d4603d4fb8"][1] = #"hash_5c2ae9f4f331d4b9";
    level._effect[#"hash_62dd73d4603d4fb8"][2] = #"hash_7d1b0f001ea88b82";
    level._effect[#"hash_62dd73d4603d4fb8"][3] = #"hash_7981eb245ea536fc";
    level._effect[#"hash_685f1cf10641e640"] = [];
    level._effect[#"hash_685f1cf10641e640"][0] = #"hash_35ab4f45bbfba6b3";
    level._effect[#"hash_685f1cf10641e640"][1] = #"hash_5565c3fc2c7742fe";
    level._effect[#"hash_685f1cf10641e640"][2] = #"hash_3283b765fe480df7";
    level._effect[#"hash_685f1cf10641e640"][3] = #"hash_6a512c225256a2e9";
    callback::on_spawned(&function_df78674f);
    if (util::function_8570168d()) {
        namespace_9096c917::init();
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x5b73a8a6, Offset: 0x428
// Size: 0x84
function function_df78674f() {
    localclientnum = self getlocalclientnumber();
    if (isdefined(localclientnum) && isdefined(level.current_zone) && isdefined(level.current_state)) {
        function_474f199c(localclientnum, level.current_zone[localclientnum], level.current_state[localclientnum]);
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x7cd98e77, Offset: 0x4b8
// Size: 0x222
function function_12a1f978(local_client_num) {
    effects = [];
    effects[#"hash_62dd73d4603d4fb8"] = level._effect[#"hash_62dd73d4603d4fb8"];
    effects[#"hash_685f1cf10641e640"] = level._effect[#"hash_685f1cf10641e640"];
    effects[#"hash_62dd73d4603d4fb8"][1] = #"hash_b348da50894d2f3";
    effects[#"hash_62dd73d4603d4fb8"][2] = #"hash_22f6c3df53586600";
    effects[#"hash_62dd73d4603d4fb8"][3] = [];
    effects[#"hash_62dd73d4603d4fb8"][3][1] = #"hash_2d6240bcbe378735";
    effects[#"hash_62dd73d4603d4fb8"][3][2] = #"hash_1485defdfe47975a";
    effects[#"hash_685f1cf10641e640"][1] = #"hash_18926b1c92d97fb8";
    effects[#"hash_685f1cf10641e640"][2] = #"hash_175505bf60101ef5";
    effects[#"hash_685f1cf10641e640"][3] = [];
    effects[#"hash_685f1cf10641e640"][3][1] = #"hash_3add4ab2008b6ea2";
    effects[#"hash_685f1cf10641e640"][3][2] = #"hash_49751fe881244b5f";
    return effects;
}

// Namespace koth/koth
// Params 3, eflags: 0x0
// Checksum 0x382ff708, Offset: 0x6e8
// Size: 0xbc
function function_46b3ecd3(local_client_num, state, is_shoutcaster) {
    if (is_shoutcaster) {
        return state;
    }
    if (state == 1) {
        if (function_9b3f0ed1(local_client_num) == #"allies") {
            return 1;
        } else {
            return 2;
        }
    } else if (state == 2) {
        if (function_9b3f0ed1(local_client_num) == #"axis") {
            return 1;
        } else {
            return 2;
        }
    }
    return state;
}

// Namespace koth/koth
// Params 3, eflags: 0x0
// Checksum 0xad27a4e, Offset: 0x7b0
// Size: 0x2c
function function_95f997c5(fx_name, var_11cad3ba, effects) {
    return effects[fx_name][var_11cad3ba];
}

// Namespace koth/koth
// Params 3, eflags: 0x0
// Checksum 0x602f50a4, Offset: 0x7e8
// Size: 0x31c
function function_474f199c(local_client_num, zone_index, state) {
    effects = [];
    if (shoutcaster::is_shoutcaster_using_team_identity(local_client_num)) {
        effects = function_12a1f978(local_client_num);
    } else {
        effects[#"hash_62dd73d4603d4fb8"] = level._effect[#"hash_62dd73d4603d4fb8"];
        effects[#"hash_685f1cf10641e640"] = level._effect[#"hash_685f1cf10641e640"];
    }
    if (isdefined(level.var_49201ac2[local_client_num])) {
        foreach (fx in level.var_49201ac2[local_client_num]) {
            stopfx(local_client_num, fx);
        }
    }
    level.var_49201ac2[local_client_num] = [];
    if (zone_index) {
        if (isdefined(level.visuals[zone_index])) {
            var_11cad3ba = function_46b3ecd3(local_client_num, state, shoutcaster::is_shoutcaster(local_client_num));
            foreach (visual in level.visuals[zone_index]) {
                if (!isdefined(visual.script_fxid)) {
                    continue;
                }
                fxid = function_95f997c5(visual.script_fxid, var_11cad3ba, effects);
                if (isarray(fxid)) {
                    state = 1;
                    function_ca8ebccf(local_client_num, visual, fxid[state], state);
                    state = 2;
                    function_ca8ebccf(local_client_num, visual, fxid[state], state);
                } else {
                    function_ca8ebccf(local_client_num, visual, fxid, state);
                }
            }
        }
    }
    thread function_40370b(local_client_num);
}

// Namespace koth/koth
// Params 4, eflags: 0x4
// Checksum 0x81eea565, Offset: 0xb10
// Size: 0x15c
function private function_ca8ebccf(local_client_num, visual, fxid, state) {
    if (isdefined(visual.angles)) {
        forward = anglestoforward(visual.angles);
    } else {
        forward = (0, 0, 0);
    }
    fxhandle = playfx(local_client_num, fxid, visual.origin, forward);
    level.var_49201ac2[local_client_num][level.var_49201ac2[local_client_num].size] = fxhandle;
    if (isdefined(fxhandle)) {
        if (state == 1) {
            setfxteam(local_client_num, fxhandle, #"allies");
        } else if (state == 2) {
            setfxteam(local_client_num, fxhandle, #"axis");
        } else {
            setfxteam(local_client_num, fxhandle, "free");
        }
    }
}

// Namespace koth/koth
// Params 7, eflags: 0x0
// Checksum 0x8a006cce, Offset: 0xc78
// Size: 0x1f4
function hardpoint(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (level.var_e49c081c.size == 0) {
        var_e49c081c = struct::get_array("koth_zone_center", "targetname");
        foreach (point in var_e49c081c) {
            level.var_e49c081c[point.script_index] = point;
        }
        foreach (point in level.var_e49c081c) {
            level.visuals[point.script_index] = struct::get_array(point.target, "targetname");
        }
    }
    level.current_zone[localclientnum] = newval;
    level.current_state[localclientnum] = 0;
    function_474f199c(localclientnum, level.current_zone[localclientnum], level.current_state[localclientnum]);
}

// Namespace koth/koth
// Params 7, eflags: 0x0
// Checksum 0xc8058b1, Offset: 0xe78
// Size: 0xa4
function function_f43ee1d3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval != level.current_state[localclientnum]) {
        level.current_state[localclientnum] = newval;
        function_474f199c(localclientnum, level.current_zone[localclientnum], level.current_state[localclientnum]);
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0xfb59e1e, Offset: 0xf28
// Size: 0x84
function function_40370b(localclientnum) {
    level notify(#"hash_464c43f8a91b82b3");
    level endon(#"hash_464c43f8a91b82b3");
    level waittill(#"team_changed");
    thread function_474f199c(localclientnum, level.current_zone[localclientnum], level.current_state[localclientnum]);
}

