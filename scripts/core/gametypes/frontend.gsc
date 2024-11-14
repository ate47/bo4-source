#using scripts\core_common\util_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\popups_shared;
#using scripts\core_common\gamestate;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\animation_shared;

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

/#

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0xbfc31924, Offset: 0x2a8
    // Size: 0x14e
    function dailychallengedevguiinit() {
        setdvar(#"daily_challenge_cmd", 0);
        num_rows = tablelookuprowcount(#"gamedata/stats/zm/statsmilestones4.csv");
        for (row_num = 2; row_num < num_rows; row_num++) {
            challenge_name = tablelookupcolumnforrow(#"gamedata/stats/zm/statsmilestones4.csv", row_num, 5);
            display_row_num = row_num - 2;
            devgui_string = "<dev string:x38>" + "<dev string:x47>" + (display_row_num > 10 ? display_row_num : "<dev string:x5e>" + display_row_num) + "<dev string:x62>" + function_9e72a96(challenge_name) + "<dev string:x66>" + row_num + "<dev string:x80>";
            adddebugcommand(devgui_string);
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x71243cfb, Offset: 0x400
    // Size: 0x4c
    function function_83f052f2() {
        setdvar(#"ct_cmd", "<dev string:x86>");
        adddebugcommand("<dev string:x89>");
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0xb25a1563, Offset: 0x458
    // Size: 0x100
    function function_5f1dd5aa() {
        self endon(#"disconnect");
        while (true) {
            ct_cmd = getdvarstring(#"ct_cmd", "<dev string:x86>");
            if (ct_cmd == "<dev string:x86>") {
                wait 0.25;
                continue;
            }
            if (ct_cmd == "<dev string:xe5>") {
                unlocked = getdvar(#"ui_unlock_all_ct", 0);
                setdvar(#"ui_unlock_all_ct", !unlocked);
            }
            setdvar(#"ct_cmd", "<dev string:x86>");
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0xcc2e0bc9, Offset: 0x560
    // Size: 0x190
    function dailychallengedevguithink() {
        self endon(#"disconnect");
        while (true) {
            daily_challenge_cmd = getdvarint(#"daily_challenge_cmd", 0);
            if (daily_challenge_cmd == 0 || !sessionmodeiszombiesgame()) {
                wait 1;
                continue;
            }
            daily_challenge_row = daily_challenge_cmd;
            daily_challenge_index = tablelookupcolumnforrow(#"gamedata/stats/zm/statsmilestones4.csv", daily_challenge_row, 0);
            daily_challenge_stat = tablelookupcolumnforrow(#"gamedata/stats/zm/statsmilestones4.csv", daily_challenge_row, 4);
            adddebugcommand("<dev string:xfc>" + daily_challenge_stat + "<dev string:x11c>" + "<dev string:x130>");
            adddebugcommand("<dev string:x135>" + daily_challenge_index + "<dev string:x130>");
            adddebugcommand("<dev string:x17a>" + "<dev string:x130>");
            setdvar(#"daily_challenge_cmd", 0);
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x910a666d, Offset: 0x6f8
    // Size: 0x3dc
    function function_27d2e95a() {
        level.var_314051a1 = getscriptbundle("<dev string:x1c2>");
        if (!isdefined(level.var_314051a1)) {
            return;
        }
        setdvar(#"callings_cmd", "<dev string:x86>");
        adddebugcommand("<dev string:x1d9>");
        for (seasonid = 1; seasonid <= level.var_314051a1.size; seasonid++) {
            for (var_d49657fd = 0; var_d49657fd < 4; var_d49657fd++) {
                faction = getscriptbundle(level.var_314051a1.factionlist[var_d49657fd].faction);
                factionname = makelocalizedstring(faction.factionname);
                var_662e72f3 = array(0, 1, 3, 6, 12);
                counter = 1;
                foreach (tokens in var_662e72f3) {
                    var_3430f147 = "<dev string:x22d>" + seasonid + "<dev string:x23c>" + var_d49657fd + "<dev string:x23c>" + tokens;
                    devgui_string = "<dev string:x240>" + seasonid + "<dev string:x275>" + factionname + "<dev string:x27a>" + tokens + "<dev string:x27e>" + (tokens != 1 ? "<dev string:x287>" : "<dev string:x86>") + "<dev string:x28b>" + counter + "<dev string:x28f>" + var_3430f147 + "<dev string:x2a2>";
                    adddebugcommand(devgui_string);
                    counter++;
                }
                counter = 1;
                for (var_cab404b1 = 0; var_cab404b1 <= 12; var_cab404b1++) {
                    var_f6c57b = "<dev string:x2a7>" + seasonid + "<dev string:x23c>" + var_d49657fd + "<dev string:x23c>" + var_cab404b1;
                    devgui_string = "<dev string:x2bd>" + seasonid + "<dev string:x275>" + factionname + "<dev string:x2fa>" + var_cab404b1 + "<dev string:x28b>" + counter + "<dev string:x28f>" + var_f6c57b + "<dev string:x2a2>";
                    adddebugcommand(devgui_string);
                    counter++;
                }
            }
            adddebugcommand("<dev string:x303>" + seasonid + "<dev string:x28b>" + seasonid + "<dev string:x33b>" + seasonid + "<dev string:x2a2>");
            seasonid++;
        }
    }

    // Namespace frontend/frontend
    // Params 1, eflags: 0x20 variadic
    // Checksum 0x3a31ac2d, Offset: 0xae0
    // Size: 0xc4
    function function_1c289498(...) {
        assert(vararg.size > 1);
        if (vararg.size <= 1) {
            return;
        }
        cmd = "<dev string:x35c>";
        for (i = 0; i < vararg.size; i++) {
            cmd += vararg[i] + "<dev string:x62>";
        }
        cmd += "<dev string:x36c>";
        adddebugcommand(cmd);
    }

    // Namespace frontend/frontend
    // Params 1, eflags: 0x0
    // Checksum 0x869f78f9, Offset: 0xbb0
    // Size: 0x212
    function function_c209f336(seasonid) {
        function_1c289498("<dev string:x371>", seasonid - 1, "<dev string:x388>");
        function_1c289498("<dev string:x371>", seasonid - 1, "<dev string:x39d>");
        function_1c289498("<dev string:x371>", seasonid - 1, "<dev string:x3b2>");
        function_1c289498("<dev string:x371>", seasonid - 1, "<dev string:x3c7>");
        for (var_d49657fd = 0; var_d49657fd < 4; var_d49657fd++) {
            function_1c289498("<dev string:x371>", seasonid - 1, "<dev string:x3d9>", var_d49657fd, "<dev string:x3e4>");
            function_1c289498("<dev string:x371>", seasonid - 1, "<dev string:x3d9>", var_d49657fd, "<dev string:x3ed>");
            function_1c289498("<dev string:x371>", seasonid - 1, "<dev string:x3d9>", var_d49657fd, "<dev string:x3fe>");
            for (groupid = 0; groupid < 3; groupid++) {
                for (categoryid = 0; categoryid < 4; categoryid++) {
                    function_1c289498("<dev string:x371>", seasonid - 1, "<dev string:x3d9>", var_d49657fd, "<dev string:x40b>", groupid, "<dev string:x41d>", categoryid, "<dev string:x430>");
                }
            }
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x82e97db5, Offset: 0xdd0
    // Size: 0x2a6
    function function_87e397ba() {
        for (seasonid = 1; seasonid <= level.var_314051a1.size; seasonid++) {
            function_c209f336(seasonid);
        }
        function_1c289498("<dev string:x43c>", "<dev string:x44c>");
        function_1c289498("<dev string:x43c>", "<dev string:x45a>");
        function_1c289498("<dev string:x43c>", "<dev string:x468>");
        function_1c289498("<dev string:x43c>", "<dev string:x480>");
        function_1c289498("<dev string:x43c>", "<dev string:x490>");
        function_1c289498("<dev string:x43c>", "<dev string:x49f>");
        function_1c289498("<dev string:x43c>", "<dev string:x4b4>");
        function_1c289498("<dev string:x43c>", "<dev string:x4cf>");
        for (i = 0; i < 4; i++) {
            function_1c289498("<dev string:x43c>", "<dev string:x4e5>", i, "<dev string:x4f0>");
            function_1c289498("<dev string:x43c>", "<dev string:x4e5>", i, "<dev string:x4f8>");
            function_1c289498("<dev string:x43c>", "<dev string:x503>", i, "<dev string:x510>");
            function_1c289498("<dev string:x43c>", "<dev string:x503>", i, "<dev string:x51a>");
            function_1c289498("<dev string:x43c>", "<dev string:x503>", i, "<dev string:x4f0>");
        }
        for (var_d49657fd = 0; var_d49657fd < 4; var_d49657fd++) {
            function_1c289498("<dev string:x43c>", "<dev string:x529>", var_d49657fd);
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x81e3496a, Offset: 0x1080
    // Size: 0x488
    function function_2cdf0184() {
        if (!isdefined(level.var_314051a1)) {
            return;
        }
        level endon(#"game_ended");
        while (true) {
            callings_cmd = getdvarstring(#"callings_cmd", "<dev string:x86>");
            if (callings_cmd == "<dev string:x86>") {
                wait 0.25;
                continue;
            }
            if (callings_cmd == "<dev string:x53c>") {
                function_87e397ba();
            } else if (strstartswith(callings_cmd, "<dev string:x22d>")) {
                str = strreplace(callings_cmd, "<dev string:x22d>", "<dev string:x86>");
                arr = strtok(str, "<dev string:x23c>");
                seasonid = arr[0];
                var_d49657fd = arr[1];
                tokens = arr[2];
                statpath = "<dev string:x54e>" + int(seasonid) - 1 + "<dev string:x566>" + var_d49657fd + "<dev string:x573>" + tokens;
                adddebugcommand("<dev string:x35c>" + statpath + "<dev string:x130>");
            } else if (strstartswith(callings_cmd, "<dev string:x57e>")) {
                str = strreplace(callings_cmd, "<dev string:x57e>", "<dev string:x86>");
                seasonid = int(str);
                function_c209f336(seasonid);
            } else if (strstartswith(callings_cmd, "<dev string:x2a7>")) {
                str = strreplace(callings_cmd, "<dev string:x2a7>", "<dev string:x86>");
                arr = strtok(str, "<dev string:x23c>");
                seasonid = arr[0];
                var_d49657fd = arr[1];
                tier = arr[2];
                statpath = "<dev string:x54e>" + int(seasonid) - 1 + "<dev string:x566>" + var_d49657fd + "<dev string:x58f>" + tier;
                adddebugcommand("<dev string:x35c>" + statpath + "<dev string:x130>");
            } else if (strstartswith(callings_cmd, "<dev string:x5a2>")) {
                str = strreplace(callings_cmd, "<dev string:x5a2>", "<dev string:x86>");
                arr = strtok(str, "<dev string:x23c>");
                taskid = arr[0];
                taskid = int(taskid);
                setdvar(#"zm_active_daily_calling", taskid);
                setdvar(#"zm_active_event_calling", 0);
                setdvar(#"hash_acdd08b365cb62f", 1);
            }
            setdvar(#"callings_cmd", "<dev string:x86>");
        }
    }

    // Namespace frontend/frontend
    // Params 2, eflags: 0x0
    // Checksum 0xb2b71bbe, Offset: 0x1510
    // Size: 0x6c
    function function_1fcf4d0e(menu_path, commands) {
        var_c62ccf1 = "<dev string:x5bc>";
        adddebugcommand("<dev string:x38>" + var_c62ccf1 + menu_path + "<dev string:x5c6>" + commands + "<dev string:x2a2>");
    }

    // Namespace frontend/frontend
    // Params 1, eflags: 0x0
    // Checksum 0x48b1748b, Offset: 0x1588
    // Size: 0x54
    function function_8aa5abd4(menu_path) {
        var_c62ccf1 = "<dev string:x5bc>";
        adddebugcommand("<dev string:x5cc>" + var_c62ccf1 + menu_path + "<dev string:x2a2>");
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x9c378cfa, Offset: 0x15e8
    // Size: 0xa4
    function function_41cd078d() {
        function_1fcf4d0e("<dev string:x5de>", "<dev string:x5ea>");
        function_1fcf4d0e("<dev string:x62e>", "<dev string:x63e>" + "<dev string:x645>" + "<dev string:x65a>");
        function_1fcf4d0e("<dev string:x66f>", "<dev string:x63e>" + "<dev string:x645>" + "<dev string:x68c>");
        level thread function_e4ea0153();
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x7ec70624, Offset: 0x1698
    // Size: 0x160
    function function_e4ea0153() {
        setdvar(#"hash_3319d0fd07c9ead8", "<dev string:x86>");
        while (true) {
            var_8c931e31 = getdvarstring(#"hash_3319d0fd07c9ead8", "<dev string:x86>");
            if (var_8c931e31 == "<dev string:x86>") {
                waitframe(1);
                continue;
            }
            if (var_8c931e31 == "<dev string:x6ae>") {
                luinotifyevent(#"aar_clear_rewards");
            } else if (var_8c931e31 == "<dev string:x6c2>") {
                if (!isdefined(level.var_9c7f7c5d)) {
                    level thread function_daf9ea48();
                    level.var_9c7f7c5d = 1;
                }
            } else if (var_8c931e31 == "<dev string:x6e3>") {
                function_9eac333e();
            }
            setdvar(#"hash_3319d0fd07c9ead8", "<dev string:x86>");
            wait 0.25;
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0x8d10d293, Offset: 0x1800
    // Size: 0x35e
    function function_daf9ea48() {
        if (isdefined(level.var_9c7f7c5d) && level.var_60e97f7b) {
            return;
        }
        function_8aa5abd4("<dev string:x66f>");
        notif_challenges_devgui_base = "<dev string:x6ff>";
        for (i = 1; i <= popups::devgui_notif_getchallengestablecount(); i++) {
            tablename = popups::devgui_notif_getchallengestablename(i);
            rows = tablelookuprowcount(tablename);
            for (j = 1; j < rows; j++) {
                challengeid = tablelookupcolumnforrow(tablename, j, 0);
                if (challengeid != "<dev string:x86>" && strisint(tablelookupcolumnforrow(tablename, j, 0))) {
                    challengestring = tablelookupcolumnforrow(tablename, j, 5);
                    type = tablelookupcolumnforrow(tablename, j, 3);
                    challengetier = int(tablelookupcolumnforrow(tablename, j, 1));
                    challengetierstring = "<dev string:x86>" + challengetier;
                    if (challengetier < 10) {
                        challengetierstring = "<dev string:x5e>" + challengetier;
                    }
                    name = tablelookupcolumnforrow(tablename, j, 5);
                    devgui_cmd_challenge_path = notif_challenges_devgui_base + function_9e72a96(type) + "<dev string:x27a>" + function_9e72a96(name) + "<dev string:x27a>" + challengetierstring + "<dev string:x720>" + challengeid;
                    util::waittill_can_add_debug_command();
                    adddebugcommand(devgui_cmd_challenge_path + "<dev string:x728>" + "<dev string:x72d>" + "<dev string:x731>" + "<dev string:x739>" + "<dev string:x62>" + j + "<dev string:x731>" + "<dev string:x751>" + "<dev string:x62>" + i + "<dev string:x731>" + "<dev string:x645>" + "<dev string:x76b>" + "<dev string:x80>");
                    if (int(challengeid) % 10) {
                        waitframe(1);
                    }
                }
            }
        }
    }

    // Namespace frontend/frontend
    // Params 0, eflags: 0x0
    // Checksum 0xbca86ece, Offset: 0x1b68
    // Size: 0x94
    function function_9eac333e() {
        tablenum = getdvarint(#"hash_2ef0f120f21f3135", 0);
        row = getdvarint(#"hash_7cc425fc91c8c499", 0);
        luinotifyevent(#"hash_405727f8a59698b1", 2, tablenum - 1, row);
    }

#/
