// Atian COD Tools GSC decompiler test
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using script_84f5590d2ac48f8;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\mp\mp_nuketown_4_sound.csc;
#using scripts\mp\mp_nuketown_4_fx.csc;
#using scripts\mp_common\util.csc;
#using scripts\mp_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace mp_nuketown_4;

// Namespace mp_nuketown_4/level_init
// Params 1, eflags: 0x40
// Checksum 0xfc9ad12, Offset: 0x278
// Size: 0x1c6
function event_handler[level_init] main(eventstruct) {
    level.var_227e5947 = 0;
    full_screen_movie::register("full_screen_movie");
    level.draftxcam = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
    level.nuketown_population = 0;
    clientfield::register("world", "nuketown_population", 8000, 7, "int", &function_379a5c89, 0, 0);
    clientfield::register("world", "nuketown_missile_scene", 8000, 1, "int", &function_2372d00, 0, 0);
    mp_nuketown_4_fx::main();
    mp_nuketown_4_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
    level.endgamexcamname = "ui_cam_endgame_mp_common";
}

// Namespace mp_nuketown_4/gametype_start
// Params 1, eflags: 0x40
// Checksum 0x7a7ffa3, Offset: 0x448
// Size: 0x1a
function event_handler[gametype_start] codecallback_startgametype(eventstruct) {
    level.var_1765ad79 = 0;
}

// Namespace mp_nuketown_4/mp_nuketown_4
// Params 1, eflags: 0x1 linked
// Checksum 0x576798f, Offset: 0x470
// Size: 0x7c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
    exploder::exploder("fxexp_alarm_lights");
    if (isdefined(level.var_227e5947) && level.var_227e5947) {
        exploder::exploder("fxexp_portal_idle");
    }
}

// Namespace mp_nuketown_4/mp_nuketown_4
// Params 7, eflags: 0x1 linked
// Checksum 0x1c72de74, Offset: 0x4f8
// Size: 0xac
function function_2372d00(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.var_227e5947 = 1;
    if (newval == 1) {
        function_e7647ecd("ee_occluders", 0);
    } else {
        function_e7647ecd("ee_occluders", 1);
    }
    level thread function_446c6000();
}

// Namespace mp_nuketown_4/mp_nuketown_4
// Params 7, eflags: 0x1 linked
// Checksum 0x735e05c4, Offset: 0x5b0
// Size: 0x4a
function function_379a5c89(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.nuketown_population = newval;
}

// Namespace mp_nuketown_4/mp_nuketown_4
// Params 1, eflags: 0x1 linked
// Checksum 0xf22295f5, Offset: 0x608
// Size: 0x44
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
    level thread nuked_population_sign_think(localclientnum);
}

// Namespace mp_nuketown_4/mp_nuketown_4
// Params 2, eflags: 0x1 linked
// Checksum 0x79d8f627, Offset: 0x658
// Size: 0x6a
function set_dvar_float_if_unset(dvar, value) {
    if (getdvarstring(dvar) == "") {
        setdvar(dvar, value);
    }
    return getdvarfloat(dvar, 0);
}

// Namespace mp_nuketown_4/mp_nuketown_4
// Params 1, eflags: 0x1 linked
// Checksum 0xe106ae5e, Offset: 0x6d0
// Size: 0x4a0
function nuked_population_sign_think(localclientnum) {
    var_80ac8621 = getent(localclientnum, "counter_tens", "targetname");
    var_3c0c17f2 = getent(localclientnum, "counter_ones", "targetname");
    zone = getent(localclientnum, "nuketown_island_zone", "targetname");
    time = set_dvar_float_if_unset("scr_dial_rotate_time", "0.5");
    /#
        level thread function_102a701c(var_80ac8621, var_3c0c17f2);
    #/
    step = 36;
    ones = 0;
    tens = 0;
    var_80ac8621 rotateroll(step, 0.05);
    var_3c0c17f2 rotateroll(step, 0.05);
    for (;;) {
        wait(1);
        var_c510abcc = 0;
        mannequins = getentarray(localclientnum, "mannequin", "targetname");
        players = [];
        foreach (player in getplayers(localclientnum)) {
            if (isalive(player)) {
                if (!isdefined(players)) {
                    players = [];
                } else if (!isarray(players)) {
                    players = array(players);
                }
                players[players.size] = player;
            }
        }
        foreach (mannequin in mannequins) {
            if (isalive(mannequin)) {
                if (!isdefined(players)) {
                    players = [];
                } else if (!isarray(players)) {
                    players = array(players);
                }
                players[players.size] = mannequin;
            }
        }
        for (dial = ones + tens * 10; level.nuketown_population < dial; dial = ones + tens * 10) {
            ones--;
            if (ones < 0) {
                ones = 9;
                var_80ac8621 rotateroll(0 - step, time);
                tens--;
            }
            var_3c0c17f2 rotateroll(0 - step, time);
            var_3c0c17f2 waittill(#"rotatedone");
        }
        while (level.nuketown_population > dial) {
            ones++;
            if (ones > 9) {
                ones = 0;
                var_80ac8621 rotateroll(step, time);
                tens++;
            }
            var_3c0c17f2 rotateroll(step, time);
            var_3c0c17f2 waittill(#"rotatedone");
            dial = ones + tens * 10;
        }
    }
}

/#

    // Namespace mp_nuketown_4/mp_nuketown_4
    // Params 2, eflags: 0x0
    // Checksum 0x406157a, Offset: 0xb78
    // Size: 0x4e
    function function_102a701c(tens, ones) {
        while (!isdefined(tens) || !isdefined(ones)) {
            iprintlnbold("<unknown string>");
            wait(2);
        }
    }

#/

// Namespace mp_nuketown_4/mp_nuketown_4
// Params 2, eflags: 0x1 linked
// Checksum 0xfe281b53, Offset: 0xbd0
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

// Namespace mp_nuketown_4/mp_nuketown_4
// Params 2, eflags: 0x1 linked
// Checksum 0x6edfa07d, Offset: 0xcd0
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

// Namespace mp_nuketown_4/mp_nuketown_4
// Params 0, eflags: 0x1 linked
// Checksum 0xb8ad7f25, Offset: 0xdd0
// Size: 0x54
function function_446c6000() {
    looper = struct::get("amb_silo", "script_sound");
    soundstoploopemitter(looper.script_sound, looper.origin);
}

