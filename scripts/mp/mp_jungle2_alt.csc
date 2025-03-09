#using scripts\core_common\callbacks_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\load;

#namespace mp_jungle2_alt;

// Namespace mp_jungle2_alt/level_init
// Params 1, eflags: 0x40
// Checksum 0xc1bbb172, Offset: 0x118
// Size: 0x18c
function event_handler[level_init] main(eventstruct) {
    setsaveddvar(#"enable_global_wind", 1);
    setsaveddvar(#"wind_global_vector", "88 0 0");
    setsaveddvar(#"wind_global_low_altitude", 0);
    setsaveddvar(#"wind_global_hi_altitude", 10000);
    setsaveddvar(#"wind_global_low_strength_percent", 100);
    level.draftxcam = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    level.var_7315d934 = 1;
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
    callback::on_localplayer_spawned(&function_b16848c2);
}

// Namespace mp_jungle2_alt/mp_jungle2_alt
// Params 2, eflags: 0x0
// Checksum 0xe0ba7c33, Offset: 0x2b0
// Size: 0xf2
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
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r120";
        } else {
            return "ui/fx_dom_marker_team_r120";
        }
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

// Namespace mp_jungle2_alt/mp_jungle2_alt
// Params 2, eflags: 0x0
// Checksum 0xd4e68efe, Offset: 0x3b0
// Size: 0xf2
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
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r120";
        } else {
            return "ui/fx_dom_cap_indicator_team_r120";
        }
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

// Namespace mp_jungle2_alt/mp_jungle2_alt
// Params 1, eflags: 0x0
// Checksum 0xb4ca90dc, Offset: 0x4b0
// Size: 0x4a
function function_b16848c2(localclientnum) {
    self endon(#"death");
    self.var_ff66174 = self playloopsound(#"hash_300e3315a48607a8");
}

