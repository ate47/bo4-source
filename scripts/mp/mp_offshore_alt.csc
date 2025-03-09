#using scripts\core_common\util_shared;
#using scripts\mp\mp_offshore_alt_fx;
#using scripts\mp\mp_offshore_alt_player_rain;
#using scripts\mp\mp_offshore_alt_sound;
#using scripts\mp_common\load;

#namespace mp_offshore_alt;

// Namespace mp_offshore_alt/level_init
// Params 1, eflags: 0x40
// Checksum 0x46fa6a1e, Offset: 0x138
// Size: 0xce
function event_handler[level_init] main(eventstruct) {
    level.draftxcam = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    mp_offshore_alt_fx::main();
    mp_offshore_alt_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
    level.endgamexcamname = "ui_cam_endgame_mp_common";
}

// Namespace mp_offshore_alt/mp_offshore_alt
// Params 2, eflags: 0x0
// Checksum 0x554d1a5f, Offset: 0x210
// Size: 0xc2
function dom_flag_base_fx_override(flag, team) {
    switch (flag.name) {
    case #"a":
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r120";
        } else {
            return "ui/fx_dom_marker_team_r120";
        }
        break;
    case #"b":
        break;
    case #"c":
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r120";
        } else {
            return "ui/fx_dom_marker_team_r120";
        }
        break;
    }
}

// Namespace mp_offshore_alt/mp_offshore_alt
// Params 2, eflags: 0x0
// Checksum 0xdd232fb6, Offset: 0x2e0
// Size: 0xc2
function dom_flag_cap_fx_override(flag, team) {
    switch (flag.name) {
    case #"a":
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r120";
        } else {
            return "ui/fx_dom_cap_indicator_team_r120";
        }
        break;
    case #"b":
        break;
    case #"c":
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r120";
        } else {
            return "ui/fx_dom_cap_indicator_team_r120";
        }
        break;
    }
}

// Namespace mp_offshore_alt/mp_offshore_alt
// Params 1, eflags: 0x0
// Checksum 0xf9286ad7, Offset: 0x3b0
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_offshore_alt/mp_offshore_alt
// Params 1, eflags: 0x0
// Checksum 0x126767e3, Offset: 0x3e8
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

