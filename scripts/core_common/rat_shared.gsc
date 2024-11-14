#using scripts\core_common\scene_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\util_shared;

#namespace rat;

/#

    // Namespace rat/rat_shared
    // Params 0, eflags: 0x0
    // Checksum 0x5b6d1f75, Offset: 0x88
    // Size: 0x62c
    function init() {
        if (!isdefined(level.rat)) {
            level.rat = spawnstruct();
            level.rat.common = spawnstruct();
            level.rat.script_command_list = [];
            level.rat.playerskilled = 0;
            level.rat.var_cd4fd549 = 0;
            callback::on_player_killed(&function_cecf7c3d);
            addratscriptcmd("<dev string:x38>", &function_5fd1a95b);
            addratscriptcmd("<dev string:x4d>", &rscteleport);
            addratscriptcmd("<dev string:x58>", &function_51706559);
            addratscriptcmd("<dev string:x67>", &function_b2fe8b5a);
            addratscriptcmd("<dev string:x73>", &function_bff535fb);
            addratscriptcmd("<dev string:x82>", &function_220d66d8);
            addratscriptcmd("<dev string:x8e>", &function_be6e2f9f);
            addratscriptcmd("<dev string:x99>", &function_ff0fa082);
            addratscriptcmd("<dev string:xa9>", &function_aecb1023);
            addratscriptcmd("<dev string:xbd>", &function_90282828);
            addratscriptcmd("<dev string:xd0>", &function_3b51dc31);
            addratscriptcmd("<dev string:xde>", &function_a6d4d86b);
            addratscriptcmd("<dev string:xef>", &function_54b7f226);
            addratscriptcmd("<dev string:x103>", &function_1b77bedd);
            addratscriptcmd("<dev string:x116>", &rscsimulatescripterror);
            addratscriptcmd("<dev string:x12c>", &function_1f00a502);
            addratscriptcmd("<dev string:x140>", &function_696e6dd3);
            addratscriptcmd("<dev string:x14c>", &function_dec22d87);
            addratscriptcmd("<dev string:x162>", &function_e3ab4393);
            addratscriptcmd("<dev string:x17a>", &function_cb62ece6);
            addratscriptcmd("<dev string:x187>", &function_d197a150);
            addratscriptcmd("<dev string:x199>", &function_c4336b49);
            addratscriptcmd("<dev string:x1a8>", &function_ccc178f3);
            addratscriptcmd("<dev string:x1bf>", &function_2fa64525);
            addratscriptcmd("<dev string:x1ce>", &function_6fb461e2);
            addratscriptcmd("<dev string:x1e1>", &function_f52fc58b);
            addratscriptcmd("<dev string:x1f5>", &function_dbc9b57c);
            addratscriptcmd("<dev string:x206>", &function_4f3a7675);
            addratscriptcmd("<dev string:x215>", &function_458913b0);
            addratscriptcmd("<dev string:x22b>", &function_191d6974);
            addratscriptcmd("<dev string:x237>", &function_d1b632ff);
            addratscriptcmd("<dev string:x248>", &function_7d9a084b);
            addratscriptcmd("<dev string:x25e>", &function_1ac5a32b);
            addratscriptcmd("<dev string:x276>", &function_7992a479);
            addratscriptcmd("<dev string:x283>", &function_9efe300c);
        }
    }

    // Namespace rat/rat_shared
    // Params 0, eflags: 0x0
    // Checksum 0x4d221221, Offset: 0x6c0
    // Size: 0x24
    function function_7d22c1c9() {
        level flagsys::set("<dev string:x295>");
    }

    // Namespace rat/rat_shared
    // Params 0, eflags: 0x0
    // Checksum 0x16b4d8cf, Offset: 0x6f0
    // Size: 0x24
    function function_65e13d0f() {
        level flagsys::clear("<dev string:x295>");
    }

    // Namespace rat/rat_shared
    // Params 0, eflags: 0x0
    // Checksum 0x784ae5e5, Offset: 0x720
    // Size: 0x24
    function function_b4f2a076() {
        level flagsys::set("<dev string:x2b2>");
    }

    // Namespace rat/rat_shared
    // Params 0, eflags: 0x0
    // Checksum 0x6f3c8f57, Offset: 0x750
    // Size: 0x24
    function function_6aa20375() {
        level flagsys::clear("<dev string:x2b2>");
    }

    // Namespace rat/rat_shared
    // Params 2, eflags: 0x0
    // Checksum 0xf831813c, Offset: 0x780
    // Size: 0x4a
    function addratscriptcmd(commandname, functioncallback) {
        init();
        level.rat.script_command_list[commandname] = functioncallback;
    }

    // Namespace rat/rat_scriptcommand
    // Params 1, eflags: 0x40
    // Checksum 0xd146d540, Offset: 0x7d8
    // Size: 0x114
    function event_handler[rat_scriptcommand] codecallback_ratscriptcommand(params) {
        init();
        assert(isdefined(params._cmd));
        assert(isdefined(params._id));
        assert(isdefined(level.rat.script_command_list[params._cmd]), "<dev string:x2cd>" + params._cmd);
        callback = level.rat.script_command_list[params._cmd];
        ret = level [[ callback ]](params);
        ratreportcommandresult(params._id, 1, ret);
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xa50a306c, Offset: 0x8f8
    // Size: 0x154
    function getplayer(params) {
        if (isdefined(params._xuid)) {
            xuid = int(params._xuid);
            foreach (player in getplayers()) {
                if (!isdefined(player.bot)) {
                    player_xuid = int(player getxuid(1));
                    if (xuid == player_xuid) {
                        return player;
                    }
                }
            }
            ratreportcommandresult(params._id, 0, "<dev string:x2eb>");
            wait 1;
            return;
        }
        return util::gethostplayer();
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x9fa344f7, Offset: 0xa58
    // Size: 0x98
    function function_5fd1a95b(params) {
        foreach (cmd, func in level.rat.script_command_list) {
            function_55e20e75(params._id, cmd);
        }
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xa090265d, Offset: 0xaf8
    // Size: 0x6c
    function function_7992a479(params) {
        player = getplayer(params);
        weapon = getweapon(params.weaponname);
        player giveweapon(weapon);
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x55807528, Offset: 0xb70
    // Size: 0x2c
    function function_1b77bedd(params) {
        if (isdefined(level.inprematchperiod)) {
            return level.inprematchperiod;
        }
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x790bc406, Offset: 0xba8
    // Size: 0x124
    function rscteleport(params) {
        player = getplayer(params);
        pos = (float(params.x), float(params.y), float(params.z));
        player setorigin(pos);
        if (isdefined(params.ax)) {
            angles = (float(params.ax), float(params.ay), float(params.az));
            player setplayerangles(angles);
        }
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xf9ed3bf9, Offset: 0xcd8
    // Size: 0x4c
    function function_696e6dd3(params) {
        player = getplayer(params);
        player setstance(params.stance);
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x45983b40, Offset: 0xd30
    // Size: 0x44
    function function_b2fe8b5a(params) {
        player = getplayer(params);
        return player getstance();
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x2a9cccd, Offset: 0xd80
    // Size: 0x44
    function function_cb62ece6(params) {
        player = getplayer(params);
        return player ismeleeing();
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x78d226df, Offset: 0xdd0
    // Size: 0x44
    function function_bff535fb(params) {
        player = getplayer(params);
        return player playerads();
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x2a9bf25a, Offset: 0xe20
    // Size: 0x3c
    function function_220d66d8(params) {
        player = getplayer(params);
        return player.health;
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xab445188, Offset: 0xe68
    // Size: 0xac
    function function_be6e2f9f(params) {
        player = getplayer(params);
        if (isdefined(params.amount)) {
            player dodamage(int(params.amount), player getorigin());
            return;
        }
        player dodamage(1, player getorigin());
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x1adcb24a, Offset: 0xf20
    // Size: 0x6c
    function function_ff0fa082(params) {
        player = getplayer(params);
        currentweapon = player getcurrentweapon();
        if (isdefined(currentweapon.name)) {
            return currentweapon.name;
        }
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xf9368d8e, Offset: 0xf98
    // Size: 0x6c
    function function_7d9a084b(params) {
        player = getplayer(params);
        currentweapon = player getcurrentweapon();
        if (isdefined(currentweapon.name)) {
            return currentweapon.reloadtime;
        }
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xd75339a5, Offset: 0x1010
    // Size: 0x64
    function function_aecb1023(params) {
        player = getplayer(params);
        currentweapon = player getcurrentweapon();
        return player getammocount(currentweapon);
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xc19d7951, Offset: 0x1080
    // Size: 0x64
    function function_90282828(params) {
        player = getplayer(params);
        currentweapon = player getcurrentweapon();
        return player getweaponammoclip(currentweapon);
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x65aa20b2, Offset: 0x10f0
    // Size: 0x64
    function function_3b51dc31(params) {
        player = getplayer(params);
        currentweapon = player getcurrentweapon();
        return player getweaponammoclipsize(currentweapon);
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xf6124809, Offset: 0x1160
    // Size: 0xac
    function function_54b7f226(params) {
        player = getplayer(params);
        origin = player getorigin();
        function_55e20e75(params._id, origin);
        angles = player getplayerangles();
        function_55e20e75(params._id, angles);
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x175ae8a3, Offset: 0x1218
    // Size: 0x4c
    function function_a6d4d86b(params) {
        if (isdefined(params.var_185699f8)) {
            return getnumconnectedplayers(1);
        }
        return getnumconnectedplayers(0);
    }

    // Namespace rat/rat_shared
    // Params 0, eflags: 0x0
    // Checksum 0xc6af1e45, Offset: 0x1270
    // Size: 0x6a
    function function_cecf7c3d() {
        if (isdefined(self.bot)) {
            level.rat.var_cd4fd549 += 1;
            return;
        }
        level.rat.playerskilled += 1;
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x284fffb2, Offset: 0x12e8
    // Size: 0x24
    function function_d197a150(params) {
        return level.rat.playerskilled;
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x8fbf1b4, Offset: 0x1318
    // Size: 0x24
    function function_c4336b49(params) {
        return level.rat.var_cd4fd549;
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xbc04a6f8, Offset: 0x1348
    // Size: 0x18c
    function function_51706559(params) {
        foreach (player in level.players) {
            if (!isdefined(player.bot)) {
                continue;
            }
            pos = (float(params.x), float(params.y), float(params.z));
            player setorigin(pos);
            if (isdefined(params.ax)) {
                angles = (float(params.ax), float(params.ay), float(params.az));
                player setplayerangles(angles);
            }
            if (!isdefined(params.all)) {
                break;
            }
        }
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x78ee7156, Offset: 0x14e0
    // Size: 0x190
    function function_dec22d87(params) {
        player = getplayer(params);
        forward = anglestoforward(player.angles);
        distance = 50;
        if (isdefined(params.distance)) {
            distance = float(params.distance);
        }
        spawn = player.origin + forward * distance;
        foreach (other_player in level.players) {
            if (other_player == player) {
                continue;
            }
            if (isdefined(params.var_5d792f96) && int(params.var_5d792f96) && !isdefined(other_player.bot)) {
                continue;
            }
            other_player setorigin(spawn);
        }
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xbbce2841, Offset: 0x1678
    // Size: 0x1ec
    function function_e3ab4393(params) {
        player = getplayer(params);
        forward = anglestoforward(player.angles);
        distance = 50;
        if (isdefined(params.distance)) {
            distance = float(params.distance);
        }
        spawn = player.origin + forward * distance;
        foreach (other_player in level.players) {
            if (isdefined(params.bot) && int(params.bot) && !isdefined(other_player.bot)) {
                continue;
            }
            if (player getteam() != other_player getteam()) {
                other_player setorigin(spawn);
                other_player setplayerangles(player.angles);
                return;
            }
        }
        ratreportcommandresult(params._id, 0, "<dev string:x312>");
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x6bcd7d96, Offset: 0x1870
    // Size: 0xd4
    function function_1ac5a32b(params) {
        player = getplayer(params);
        forward = anglestoforward(player.angles);
        distance = 50;
        if (isdefined(params.distance)) {
            distance = float(params.distance);
        }
        front = player.origin + forward * distance;
        player setorigin(front);
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x9ef0ddf2, Offset: 0x1950
    // Size: 0x44
    function function_ccc178f3(params) {
        player = getplayer(params);
        return player isplayinganimscripted();
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xada6f1d8, Offset: 0x19a0
    // Size: 0x46
    function function_6fb461e2(params) {
        player = getplayer(params);
        return !player arecontrolsfrozen();
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xb4f9c9c8, Offset: 0x19f0
    // Size: 0x3c
    function function_2fa64525(params) {
        if (isdefined(params.flag)) {
            return flagsys::get(params.flag);
        }
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xa9a7dbce, Offset: 0x1a38
    // Size: 0xa6
    function function_1f00a502(params) {
        foreach (player in getplayers()) {
            if (isbot(player)) {
                return player.health;
            }
        }
        return -1;
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x2678ee1, Offset: 0x1ae8
    // Size: 0x42
    function function_4f3a7675(params) {
        if (isdefined(level.var_5efad16e)) {
            level [[ level.var_5efad16e ]]();
            return 1;
        }
        return 0;
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xdcd38f4, Offset: 0x1b38
    // Size: 0x64
    function function_d04e8397(name) {
        level flagsys::set("<dev string:x342>");
        level scene::play(name);
        level flagsys::clear("<dev string:x342>");
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xe965df62, Offset: 0x1ba8
    // Size: 0x64
    function function_191d6974(params) {
        if (isdefined(params.name)) {
            level thread function_d04e8397(params.name);
            return;
        }
        ratreportcommandresult(params._id, 0, "<dev string:x34e>");
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x152fdc19, Offset: 0x1c18
    // Size: 0x2c
    function function_d1b632ff(params) {
        return flagsys::get("<dev string:x342>");
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xffb1395d, Offset: 0x1c50
    // Size: 0x5e
    function rscsimulatescripterror(params) {
        if (params.errorlevel == "<dev string:x367>") {
            assertmsg("<dev string:x36f>");
            return;
        }
        thisdoesntexist.orthis = 0;
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x55ce7749, Offset: 0x1cb8
    // Size: 0x154
    function rscrecteleport(params) {
        println("<dev string:x38a>");
        player = [[ level.rat.common.gethostplayer ]]();
        pos = player getorigin();
        angles = player getplayerangles();
        cmd = "<dev string:x3ae>" + pos[0] + "<dev string:x3c1>" + pos[1] + "<dev string:x3c7>" + pos[2] + "<dev string:x3cd>" + angles[0] + "<dev string:x3d4>" + angles[1] + "<dev string:x3db>" + angles[2];
        ratrecordmessage(0, "<dev string:x3e2>", cmd);
        setdvar(#"rat_record_teleport_request", 0);
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x9b941762, Offset: 0x1e18
    // Size: 0x84
    function function_f52fc58b(params) {
        num = 0;
        if (isdefined(params)) {
            if (isdefined(params.num)) {
                num = int(params.num);
            }
        }
        if (num > 0) {
            adddebugcommand("<dev string:x3f1>" + num);
        }
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xfb6272db, Offset: 0x1ea8
    // Size: 0x84
    function function_dbc9b57c(params) {
        num = 0;
        if (isdefined(params)) {
            if (isdefined(params.num)) {
                num = int(params.num);
            }
        }
        if (num > 0) {
            adddebugcommand("<dev string:x410>" + num);
        }
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0xe96e429d, Offset: 0x1f38
    // Size: 0x44
    function function_458913b0(params) {
        player = getplayer(params);
        toggleplayercontrol(player);
    }

    // Namespace rat/rat_shared
    // Params 1, eflags: 0x0
    // Checksum 0x2979b60b, Offset: 0x1f88
    // Size: 0x13c
    function function_9efe300c(params) {
        player = getplayer(params);
        spawn = 0;
        team = "<dev string:x42c>";
        if (isdefined(params) && isdefined(params.spawn)) {
            if (isdefined(params.spawn)) {
                spawn = int(params.spawn);
            }
            if (isdefined(params.team)) {
                team = params.team;
            }
        }
        if (isdefined(level.spawn_start) && isdefined(level.spawn_start[team])) {
            player setorigin(level.spawn_start[team][spawn].origin);
            player setplayerangles(level.spawn_start[team][spawn].angles);
        }
    }

#/
