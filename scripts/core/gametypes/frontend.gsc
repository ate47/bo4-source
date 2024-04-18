// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace frontend;

// Namespace frontend/frontend
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xb8
// Size: 0x4
function callback_void() {
    
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0x1fc054c9, Offset: 0xc8
// Size: 0x24
function callback_actorspawnedfrontend(spawner) {
    self thread spawner::spawn_think(spawner);
}

// Namespace frontend/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xff77b2fe, Offset: 0xf8
// Size: 0x17c
function event_handler[gametype_init] main(eventstruct) {
    level.callbackstartgametype = &callback_void;
    level.callbackplayerconnect = &callback_playerconnect;
    level.callbackplayerdisconnect = &callback_void;
    level.callbackentityspawned = &callback_void;
    level.callbackactorspawned = &callback_actorspawnedfrontend;
    level.orbis = getdvarstring(#"orbisgame") == "true";
    level.durango = getdvarstring(#"durangogame") == "true";
    level.weaponnone = getweapon(#"none");
    level.teambased = 0;
    gamestate::set_state("pregame");
    /#
        level function_83f052f2();
        level thread function_5f1dd5aa();
        level function_41cd078d();
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x1 linked
// Checksum 0xf16d4d04, Offset: 0x280
// Size: 0x1c
function callback_playerconnect() {
    /#
        self thread dailychallengedevguithink();
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0xbfc31924, Offset: 0x2a8
// Size: 0x14e
function dailychallengedevguiinit() {
    /#
        setdvar(#"daily_challenge_cmd", 0);
        num_rows = tablelookuprowcount(#"gamedata/stats/zm/statsmilestones4.csv");
        for (row_num = 2; row_num < num_rows; row_num++) {
            challenge_name = tablelookupcolumnforrow(#"gamedata/stats/zm/statsmilestones4.csv", row_num, 5);
            display_row_num = row_num - 2;
            devgui_string = "<unknown string>" + "<unknown string>" + (display_row_num > 10 ? display_row_num : "<unknown string>" + display_row_num) + "<unknown string>" + function_9e72a96(challenge_name) + "<unknown string>" + row_num + "<unknown string>";
            adddebugcommand(devgui_string);
        }
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x71243cfb, Offset: 0x400
// Size: 0x4c
function function_83f052f2() {
    /#
        setdvar(#"ct_cmd", "<unknown string>");
        adddebugcommand("<unknown string>");
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0xb25a1563, Offset: 0x458
// Size: 0x100
function function_5f1dd5aa() {
    /#
        self endon(#"disconnect");
        while (true) {
            ct_cmd = getdvarstring(#"ct_cmd", "<unknown string>");
            if (ct_cmd == "<unknown string>") {
                wait(0.25);
                continue;
            }
            if (ct_cmd == "<unknown string>") {
                unlocked = getdvar(#"ui_unlock_all_ct", 0);
                setdvar(#"ui_unlock_all_ct", !unlocked);
            }
            setdvar(#"ct_cmd", "<unknown string>");
        }
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0xcc2e0bc9, Offset: 0x560
// Size: 0x190
function dailychallengedevguithink() {
    /#
        self endon(#"disconnect");
        while (true) {
            daily_challenge_cmd = getdvarint(#"daily_challenge_cmd", 0);
            if (daily_challenge_cmd == 0 || !sessionmodeiszombiesgame()) {
                wait(1);
                continue;
            }
            daily_challenge_row = daily_challenge_cmd;
            daily_challenge_index = tablelookupcolumnforrow(#"gamedata/stats/zm/statsmilestones4.csv", daily_challenge_row, 0);
            daily_challenge_stat = tablelookupcolumnforrow(#"gamedata/stats/zm/statsmilestones4.csv", daily_challenge_row, 4);
            adddebugcommand("<unknown string>" + daily_challenge_stat + "<unknown string>" + "<unknown string>");
            adddebugcommand("<unknown string>" + daily_challenge_index + "<unknown string>");
            adddebugcommand("<unknown string>" + "<unknown string>");
            setdvar(#"daily_challenge_cmd", 0);
        }
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x910a666d, Offset: 0x6f8
// Size: 0x3dc
function function_27d2e95a() {
    /#
        level.var_314051a1 = getscriptbundle("<unknown string>");
        if (!isdefined(level.var_314051a1)) {
            return;
        }
        setdvar(#"callings_cmd", "<unknown string>");
        adddebugcommand("<unknown string>");
        for (seasonid = 1; seasonid <= level.var_314051a1.size; seasonid++) {
            for (var_d49657fd = 0; var_d49657fd < 4; var_d49657fd++) {
                faction = getscriptbundle(level.var_314051a1.factionlist[var_d49657fd].faction);
                factionname = makelocalizedstring(faction.factionname);
                var_662e72f3 = array(0, 1, 3, 6, 12);
                counter = 1;
                foreach (tokens in var_662e72f3) {
                    var_3430f147 = "<unknown string>" + seasonid + "<unknown string>" + var_d49657fd + "<unknown string>" + tokens;
                    devgui_string = "<unknown string>" + seasonid + "<unknown string>" + factionname + "<unknown string>" + tokens + "<unknown string>" + (tokens != 1 ? "<unknown string>" : "<unknown string>") + "<unknown string>" + counter + "<unknown string>" + var_3430f147 + "<unknown string>";
                    adddebugcommand(devgui_string);
                    counter++;
                }
                counter = 1;
                for (var_cab404b1 = 0; var_cab404b1 <= 12; var_cab404b1++) {
                    var_f6c57b = "<unknown string>" + seasonid + "<unknown string>" + var_d49657fd + "<unknown string>" + var_cab404b1;
                    devgui_string = "<unknown string>" + seasonid + "<unknown string>" + factionname + "<unknown string>" + var_cab404b1 + "<unknown string>" + counter + "<unknown string>" + var_f6c57b + "<unknown string>";
                    adddebugcommand(devgui_string);
                    counter++;
                }
            }
            adddebugcommand("<unknown string>" + seasonid + "<unknown string>" + seasonid + "<unknown string>" + seasonid + "<unknown string>");
            seasonid++;
        }
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x20
// Checksum 0x3a31ac2d, Offset: 0xae0
// Size: 0xc4
function function_1c289498(...) {
    /#
        assert(vararg.size > 1);
        if (vararg.size <= 1) {
            return;
        }
        cmd = "<unknown string>";
        for (i = 0; i < vararg.size; i++) {
            cmd += vararg[i] + "<unknown string>";
        }
        cmd += "<unknown string>";
        adddebugcommand(cmd);
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0x869f78f9, Offset: 0xbb0
// Size: 0x212
function function_c209f336(seasonid) {
    /#
        function_1c289498("<unknown string>", seasonid - 1, "<unknown string>");
        function_1c289498("<unknown string>", seasonid - 1, "<unknown string>");
        function_1c289498("<unknown string>", seasonid - 1, "<unknown string>");
        function_1c289498("<unknown string>", seasonid - 1, "<unknown string>");
        for (var_d49657fd = 0; var_d49657fd < 4; var_d49657fd++) {
            function_1c289498("<unknown string>", seasonid - 1, "<unknown string>", var_d49657fd, "<unknown string>");
            function_1c289498("<unknown string>", seasonid - 1, "<unknown string>", var_d49657fd, "<unknown string>");
            function_1c289498("<unknown string>", seasonid - 1, "<unknown string>", var_d49657fd, "<unknown string>");
            for (groupid = 0; groupid < 3; groupid++) {
                for (categoryid = 0; categoryid < 4; categoryid++) {
                    function_1c289498("<unknown string>", seasonid - 1, "<unknown string>", var_d49657fd, "<unknown string>", groupid, "<unknown string>", categoryid, "<unknown string>");
                }
            }
        }
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x82e97db5, Offset: 0xdd0
// Size: 0x2a6
function function_87e397ba() {
    /#
        for (seasonid = 1; seasonid <= level.var_314051a1.size; seasonid++) {
            function_c209f336(seasonid);
        }
        function_1c289498("<unknown string>", "<unknown string>");
        function_1c289498("<unknown string>", "<unknown string>");
        function_1c289498("<unknown string>", "<unknown string>");
        function_1c289498("<unknown string>", "<unknown string>");
        function_1c289498("<unknown string>", "<unknown string>");
        function_1c289498("<unknown string>", "<unknown string>");
        function_1c289498("<unknown string>", "<unknown string>");
        function_1c289498("<unknown string>", "<unknown string>");
        for (i = 0; i < 4; i++) {
            function_1c289498("<unknown string>", "<unknown string>", i, "<unknown string>");
            function_1c289498("<unknown string>", "<unknown string>", i, "<unknown string>");
            function_1c289498("<unknown string>", "<unknown string>", i, "<unknown string>");
            function_1c289498("<unknown string>", "<unknown string>", i, "<unknown string>");
            function_1c289498("<unknown string>", "<unknown string>", i, "<unknown string>");
        }
        for (var_d49657fd = 0; var_d49657fd < 4; var_d49657fd++) {
            function_1c289498("<unknown string>", "<unknown string>", var_d49657fd);
        }
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x81e3496a, Offset: 0x1080
// Size: 0x488
function function_2cdf0184() {
    /#
        if (!isdefined(level.var_314051a1)) {
            return;
        }
        level endon(#"game_ended");
        while (true) {
            callings_cmd = getdvarstring(#"callings_cmd", "<unknown string>");
            if (callings_cmd == "<unknown string>") {
                wait(0.25);
                continue;
            }
            if (callings_cmd == "<unknown string>") {
                function_87e397ba();
            } else if (strstartswith(callings_cmd, "<unknown string>")) {
                str = strreplace(callings_cmd, "<unknown string>", "<unknown string>");
                arr = strtok(str, "<unknown string>");
                seasonid = arr[0];
                var_d49657fd = arr[1];
                tokens = arr[2];
                statpath = "<unknown string>" + int(seasonid) - 1 + "<unknown string>" + var_d49657fd + "<unknown string>" + tokens;
                adddebugcommand("<unknown string>" + statpath + "<unknown string>");
            } else if (strstartswith(callings_cmd, "<unknown string>")) {
                str = strreplace(callings_cmd, "<unknown string>", "<unknown string>");
                seasonid = int(str);
                function_c209f336(seasonid);
            } else if (strstartswith(callings_cmd, "<unknown string>")) {
                str = strreplace(callings_cmd, "<unknown string>", "<unknown string>");
                arr = strtok(str, "<unknown string>");
                seasonid = arr[0];
                var_d49657fd = arr[1];
                tier = arr[2];
                statpath = "<unknown string>" + int(seasonid) - 1 + "<unknown string>" + var_d49657fd + "<unknown string>" + tier;
                adddebugcommand("<unknown string>" + statpath + "<unknown string>");
            } else if (strstartswith(callings_cmd, "<unknown string>")) {
                str = strreplace(callings_cmd, "<unknown string>", "<unknown string>");
                arr = strtok(str, "<unknown string>");
                taskid = arr[0];
                taskid = int(taskid);
                setdvar(#"zm_active_daily_calling", taskid);
                setdvar(#"zm_active_event_calling", 0);
                setdvar(#"hash_acdd08b365cb62f", 1);
            }
            setdvar(#"callings_cmd", "<unknown string>");
        }
    #/
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0xb2b71bbe, Offset: 0x1510
// Size: 0x6c
function function_1fcf4d0e(menu_path, commands) {
    /#
        var_c62ccf1 = "<unknown string>";
        adddebugcommand("<unknown string>" + var_c62ccf1 + menu_path + "<unknown string>" + commands + "<unknown string>");
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0x48b1748b, Offset: 0x1588
// Size: 0x54
function function_8aa5abd4(menu_path) {
    /#
        var_c62ccf1 = "<unknown string>";
        adddebugcommand("<unknown string>" + var_c62ccf1 + menu_path + "<unknown string>");
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x9c378cfa, Offset: 0x15e8
// Size: 0xa4
function function_41cd078d() {
    /#
        function_1fcf4d0e("<unknown string>", "<unknown string>");
        function_1fcf4d0e("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>");
        function_1fcf4d0e("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>");
        level thread function_e4ea0153();
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x7ec70624, Offset: 0x1698
// Size: 0x160
function function_e4ea0153() {
    /#
        setdvar(#"hash_3319d0fd07c9ead8", "<unknown string>");
        while (true) {
            var_8c931e31 = getdvarstring(#"hash_3319d0fd07c9ead8", "<unknown string>");
            if (var_8c931e31 == "<unknown string>") {
                waitframe(1);
                continue;
            }
            if (var_8c931e31 == "<unknown string>") {
                luinotifyevent(#"aar_clear_rewards");
            } else if (var_8c931e31 == "<unknown string>") {
                if (!isdefined(level.var_9c7f7c5d)) {
                    level thread function_daf9ea48();
                    level.var_9c7f7c5d = 1;
                }
            } else if (var_8c931e31 == "<unknown string>") {
                function_9eac333e();
            }
            setdvar(#"hash_3319d0fd07c9ead8", "<unknown string>");
            wait(0.25);
        }
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x8d10d293, Offset: 0x1800
// Size: 0x35e
function function_daf9ea48() {
    /#
        if (isdefined(level.var_9c7f7c5d) && level.var_60e97f7b) {
            return;
        }
        function_8aa5abd4("<unknown string>");
        notif_challenges_devgui_base = "<unknown string>";
        for (i = 1; i <= popups::devgui_notif_getchallengestablecount(); i++) {
            tablename = popups::devgui_notif_getchallengestablename(i);
            rows = tablelookuprowcount(tablename);
            for (j = 1; j < rows; j++) {
                challengeid = tablelookupcolumnforrow(tablename, j, 0);
                if (challengeid != "<unknown string>" && strisint(tablelookupcolumnforrow(tablename, j, 0))) {
                    challengestring = tablelookupcolumnforrow(tablename, j, 5);
                    type = tablelookupcolumnforrow(tablename, j, 3);
                    challengetier = int(tablelookupcolumnforrow(tablename, j, 1));
                    challengetierstring = "<unknown string>" + challengetier;
                    if (challengetier < 10) {
                        challengetierstring = "<unknown string>" + challengetier;
                    }
                    name = tablelookupcolumnforrow(tablename, j, 5);
                    devgui_cmd_challenge_path = notif_challenges_devgui_base + function_9e72a96(type) + "<unknown string>" + function_9e72a96(name) + "<unknown string>" + challengetierstring + "<unknown string>" + challengeid;
                    util::waittill_can_add_debug_command();
                    adddebugcommand(devgui_cmd_challenge_path + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + j + "<unknown string>" + "<unknown string>" + "<unknown string>" + i + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>");
                    if (int(challengeid) % 10) {
                        waitframe(1);
                    }
                }
            }
        }
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0xbca86ece, Offset: 0x1b68
// Size: 0x94
function function_9eac333e() {
    /#
        tablenum = getdvarint(#"hash_2ef0f120f21f3135", 0);
        row = getdvarint(#"hash_7cc425fc91c8c499", 0);
        luinotifyevent(#"hash_405727f8a59698b1", 2, tablenum - 1, row);
    #/
}

