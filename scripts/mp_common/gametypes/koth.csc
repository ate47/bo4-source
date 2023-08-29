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
function event_handler[gametype_init] main(eventstruct) {
    level.current_zone = [];
    level.current_state = [];
    for (i = 0; i < 4; i++) {
        level.current_zone[i] = 0;
        level.current_state[i] = 0;
    }
    level.hardpoints = [];
    level.visuals = [];
    level.hardpointfx = [];
    clientfield::register("world", "hardpoint", 1, 5, "int", &hardpoint, 0, 0);
    clientfield::register("world", "hardpointteam", 1, 5, "int", &hardpoint_state, 0, 0);
    level._effect[#"zoneedgemarker"] = [];
    level._effect[#"zoneedgemarker"][0] = #"hash_1f447aeb1973f7b6";
    level._effect[#"zoneedgemarker"][1] = #"hash_5c2ae9f4f331d4b9";
    level._effect[#"zoneedgemarker"][2] = #"hash_7d1b0f001ea88b82";
    level._effect[#"zoneedgemarker"][3] = #"hash_7981eb245ea536fc";
    level._effect[#"zoneedgemarkerwndw"] = [];
    level._effect[#"zoneedgemarkerwndw"][0] = #"hash_35ab4f45bbfba6b3";
    level._effect[#"zoneedgemarkerwndw"][1] = #"hash_5565c3fc2c7742fe";
    level._effect[#"zoneedgemarkerwndw"][2] = #"hash_3283b765fe480df7";
    level._effect[#"zoneedgemarkerwndw"][3] = #"hash_6a512c225256a2e9";
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
        setup_hardpoint_fx(localclientnum, level.current_zone[localclientnum], level.current_state[localclientnum]);
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x7cd98e77, Offset: 0x4b8
// Size: 0x222
function get_shoutcaster_fx(local_client_num) {
    effects = [];
    effects[#"zoneedgemarker"] = level._effect[#"zoneedgemarker"];
    effects[#"zoneedgemarkerwndw"] = level._effect[#"zoneedgemarkerwndw"];
    effects[#"zoneedgemarker"][1] = #"hash_b348da50894d2f3";
    effects[#"zoneedgemarker"][2] = #"hash_22f6c3df53586600";
    effects[#"zoneedgemarker"][3] = [];
    effects[#"zoneedgemarker"][3][1] = #"hash_2d6240bcbe378735";
    effects[#"zoneedgemarker"][3][2] = #"hash_1485defdfe47975a";
    effects[#"zoneedgemarkerwndw"][1] = #"hash_18926b1c92d97fb8";
    effects[#"zoneedgemarkerwndw"][2] = #"hash_175505bf60101ef5";
    effects[#"zoneedgemarkerwndw"][3] = [];
    effects[#"zoneedgemarkerwndw"][3][1] = #"hash_3add4ab2008b6ea2";
    effects[#"zoneedgemarkerwndw"][3][2] = #"hash_49751fe881244b5f";
    return effects;
}

// Namespace koth/koth
// Params 3, eflags: 0x0
// Checksum 0x382ff708, Offset: 0x6e8
// Size: 0xbc
function get_fx_state(local_client_num, state, is_shoutcaster) {
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
function get_fx(fx_name, fx_state, effects) {
    return effects[fx_name][fx_state];
}

// Namespace koth/koth
// Params 3, eflags: 0x0
// Checksum 0x602f50a4, Offset: 0x7e8
// Size: 0x31c
function setup_hardpoint_fx(local_client_num, zone_index, state) {
    effects = [];
    if (shoutcaster::is_shoutcaster_using_team_identity(local_client_num)) {
        effects = get_shoutcaster_fx(local_client_num);
    } else {
        effects[#"zoneedgemarker"] = level._effect[#"zoneedgemarker"];
        effects[#"zoneedgemarkerwndw"] = level._effect[#"zoneedgemarkerwndw"];
    }
    if (isdefined(level.hardpointfx[local_client_num])) {
        foreach (fx in level.hardpointfx[local_client_num]) {
            stopfx(local_client_num, fx);
        }
    }
    level.hardpointfx[local_client_num] = [];
    if (zone_index) {
        if (isdefined(level.visuals[zone_index])) {
            fx_state = get_fx_state(local_client_num, state, shoutcaster::is_shoutcaster(local_client_num));
            foreach (visual in level.visuals[zone_index]) {
                if (!isdefined(visual.script_fxid)) {
                    continue;
                }
                fxid = get_fx(visual.script_fxid, fx_state, effects);
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
    thread watch_for_team_change(local_client_num);
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
    level.hardpointfx[local_client_num][level.hardpointfx[local_client_num].size] = fxhandle;
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
    if (level.hardpoints.size == 0) {
        hardpoints = struct::get_array("koth_zone_center", "targetname");
        foreach (point in hardpoints) {
            level.hardpoints[point.script_index] = point;
        }
        foreach (point in level.hardpoints) {
            level.visuals[point.script_index] = struct::get_array(point.target, "targetname");
        }
    }
    level.current_zone[localclientnum] = newval;
    level.current_state[localclientnum] = 0;
    setup_hardpoint_fx(localclientnum, level.current_zone[localclientnum], level.current_state[localclientnum]);
}

// Namespace koth/koth
// Params 7, eflags: 0x0
// Checksum 0xc8058b1, Offset: 0xe78
// Size: 0xa4
function hardpoint_state(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval != level.current_state[localclientnum]) {
        level.current_state[localclientnum] = newval;
        setup_hardpoint_fx(localclientnum, level.current_zone[localclientnum], level.current_state[localclientnum]);
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0xfb59e1e, Offset: 0xf28
// Size: 0x84
function watch_for_team_change(localclientnum) {
    level notify(#"end_team_change_watch");
    level endon(#"end_team_change_watch");
    level waittill(#"team_changed");
    thread setup_hardpoint_fx(localclientnum, level.current_zone[localclientnum], level.current_state[localclientnum]);
}

