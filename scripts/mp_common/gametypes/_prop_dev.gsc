#using scripts\core_common\bots\bot;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\hostmigration_shared;
#using scripts\core_common\hud_util_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\util_shared;
#using scripts\killstreaks\mp\killstreaks;
#using scripts\mp_common\gametypes\_prop_controls;
#using scripts\mp_common\gametypes\dogtags;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\gametypes\globallogic_audio;
#using scripts\mp_common\gametypes\globallogic_score;
#using scripts\mp_common\gametypes\globallogic_spawn;
#using scripts\mp_common\gametypes\globallogic_utils;
#using scripts\mp_common\gametypes\prop;
#using scripts\mp_common\gametypes\spawning;
#using scripts\mp_common\gametypes\spawnlogic;
#using scripts\mp_common\util;

#namespace prop_dev;

/#

    // Namespace prop_dev/_prop_dev
    // Params 2, eflags: 0x0
    // Checksum 0x35850b2, Offset: 0x100
    // Size: 0x94
    function adddevguicommand(path, var_c669188) {
        pathstr = "<dev string:x38>" + path + "<dev string:x38>";
        cmdstr = "<dev string:x38>" + var_c669188 + "<dev string:x3c>";
        debugcommand = "<dev string:x41>" + pathstr + "<dev string:x4f>" + cmdstr;
        adddebugcommand(debugcommand);
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x578ab1c, Offset: 0x1a0
    // Size: 0x1866
    function propdevgui() {
        var_6631295a = 0;
        var_e68b7091 = 0;
        var_28c934a0 = 0;
        var_27e85424 = 0;
        var_e535ed97 = 0;
        var_f4098dd1 = 0;
        var_94dbbfd9 = 0;
        var_b948ae6c = 0;
        minigame_on = getdvarint(#"scr_prop_minigame", 1);
        server_hud = getdvarint(#"scr_ph_useprophudserver", 1);
        var_f6fe53f9 = getdvarfloat(#"player_swimdamage", 10);
        util::set_dvar_int_if_unset("<dev string:x53>", 0);
        util::set_dvar_int_if_unset("<dev string:x68>", 0);
        util::set_dvar_int_if_unset("<dev string:x7c>", 0);
        util::set_dvar_int_if_unset("<dev string:x91>", 0);
        util::set_dvar_int_if_unset("<dev string:xa4>", 0);
        util::set_dvar_int_if_unset("<dev string:xb7>", 0);
        util::set_dvar_int_if_unset("<dev string:xce>", 0);
        util::set_dvar_int_if_unset("<dev string:xe9>", 0);
        util::set_dvar_int_if_unset("<dev string:x102>", 0);
        util::set_dvar_int_if_unset("<dev string:x117>", 0);
        util::set_dvar_int_if_unset("<dev string:x12b>", 0);
        util::set_dvar_int_if_unset("<dev string:x145>", 1);
        util::set_dvar_int_if_unset("<dev string:x167>", 1);
        util::set_dvar_int_if_unset("<dev string:x181>", 0);
        util::set_dvar_int_if_unset("<dev string:x198>", 0);
        util::set_dvar_int_if_unset("<dev string:x1ae>", 0);
        util::set_dvar_int_if_unset("<dev string:x1c7>", 0);
        util::set_dvar_int_if_unset("<dev string:x1df>", 0);
        util::set_dvar_int_if_unset("<dev string:x1f3>", 0);
        util::set_dvar_int_if_unset("<dev string:x20d>", 0);
        util::set_dvar_int_if_unset("<dev string:x227>", 0);
        setdvar(#"hash_4424a07b5272599a", 0);
        setdvar(#"hash_34a3e2c00f7cd27f", 0);
        setdvar(#"hash_3fd977c7de8de72b", 0);
        setdvar(#"hash_5fea18fb5a6e0027", 0);
        setdvar(#"hash_69637702c083dc28", 0);
        setdvar(#"hash_2a03924a528ff9a8", 0);
        setdvar(#"hash_740b6f4a4aa58f21", 0);
        setdvar(#"hash_7115842bdfa67a2b", 0);
        if (getdvarint(#"hash_70c6c4a3e9254926", 0) != 0) {
            adddebugcommand("<dev string:x244>");
        }
        adddevguicommand("<dev string:x263>", "<dev string:x285>");
        adddevguicommand("<dev string:x2a7>", "<dev string:x2c2>");
        adddevguicommand("<dev string:x301>", "<dev string:x31c>" + 4 + "<dev string:x33a>");
        adddevguicommand("<dev string:x35d>", "<dev string:x31c>" + 0.25 + "<dev string:x33a>");
        adddevguicommand("<dev string:x379>", "<dev string:x39f>");
        adddevguicommand("<dev string:x3be>", "<dev string:x3e3>");
        adddevguicommand("<dev string:x406>", "<dev string:x429>");
        adddevguicommand("<dev string:x448>", "<dev string:x46c>");
        adddevguicommand("<dev string:x48c>", "<dev string:x4b0>");
        adddevguicommand("<dev string:x4d0>", "<dev string:x4f2>");
        adddevguicommand("<dev string:x510>", "<dev string:x532>");
        adddevguicommand("<dev string:x550>", "<dev string:x56b>");
        adddevguicommand("<dev string:x58a>", "<dev string:x5a5>");
        adddevguicommand("<dev string:x5c4>", "<dev string:x5dc>");
        adddevguicommand("<dev string:x5f7>", "<dev string:x60f>");
        adddevguicommand("<dev string:x62a>", "<dev string:x63f>");
        adddevguicommand("<dev string:x68e>", "<dev string:x6a6>");
        adddevguicommand("<dev string:x6c5>", "<dev string:x6dc>");
        adddevguicommand("<dev string:x6fb>", "<dev string:x713>");
        adddevguicommand("<dev string:x72d>", "<dev string:x74e>");
        adddevguicommand("<dev string:x768>", "<dev string:x788>");
        adddevguicommand("<dev string:x7a1>", "<dev string:x7bc>");
        adddevguicommand("<dev string:x7de>", "<dev string:x7f8>");
        adddevguicommand("<dev string:x819>", "<dev string:x837>");
        adddevguicommand("<dev string:x85c>", "<dev string:x875>");
        adddevguicommand("<dev string:x89a>", "<dev string:x8b7>");
        adddevguicommand("<dev string:x8d6>", "<dev string:x902>");
        adddevguicommand("<dev string:x924>", "<dev string:x953>");
        adddevguicommand("<dev string:x971>", "<dev string:x9a3>");
        adddevguicommand("<dev string:x9c4>", "<dev string:x9f1>");
        adddevguicommand("<dev string:xa14>", "<dev string:xa30>");
        adddevguicommand("<dev string:xa55>", "<dev string:xa70>");
        adddevguicommand("<dev string:xa8f>", "<dev string:xab5>");
        while (true) {
            if (isdefined(level.prematch_over) && level.prematch_over) {
                level.allow_teamchange = getdvarint(#"hash_7f436a7b31a003f3", 0);
                level.var_a7997034 = getdvarint(#"hash_4819c54cbad5ed87", 0) != 0;
            }
            if (getdvarint(#"scr_ph_useprophudserver", 0) != server_hud && isdefined(level.players)) {
                server_hud = getdvarint(#"scr_ph_useprophudserver", 0);
                if (!isdefined(level.players[0].changepropkey)) {
                    iprintlnbold("<dev string:xadf>");
                } else {
                    foreach (player in level.players) {
                        if (isdefined(player.team) && player util::isprop()) {
                            player prop_controls::propabilitykeysvisible(server_hud, 1);
                        }
                    }
                    level.elim_hud.alpha = server_hud;
                }
            }
            if (getdvarint(#"hash_2c678eea20875ddd", 0) != var_28c934a0 && isdefined(level.players)) {
                foreach (player in level.players) {
                    if (player util::isprop()) {
                        var_28c934a0 = getdvarint(#"hash_2c678eea20875ddd", 0);
                        player.var_f18a4260 = !(isdefined(player.var_f18a4260) && player.var_f18a4260);
                        player iprintlnbold(player.var_f18a4260 ? "<dev string:xaf9>" : "<dev string:xb0d>");
                    }
                }
            }
            if (getdvarint(#"hash_4aab269ba89e7cb6", 0) != var_27e85424 && isdefined(level.players)) {
                foreach (player in level.players) {
                    if (player util::isprop()) {
                        var_27e85424 = getdvarint(#"hash_4aab269ba89e7cb6", 0);
                        player.var_7ddbf78d = !(isdefined(player.var_7ddbf78d) && player.var_7ddbf78d);
                        player iprintlnbold(player.var_7ddbf78d ? "<dev string:xb1e>" : "<dev string:xb31>");
                    }
                }
            }
            if (getdvarint(#"hash_53ee83feb4db4606", 0) != var_e535ed97 && isdefined(level.players)) {
                foreach (player in level.players) {
                    if (player util::isprop()) {
                        var_e535ed97 = getdvarint(#"hash_53ee83feb4db4606", 0);
                        player.var_d0e95c44 = !(isdefined(player.var_d0e95c44) && player.var_d0e95c44);
                        player iprintlnbold(player.var_d0e95c44 ? "<dev string:xb41>" : "<dev string:xb55>");
                    }
                }
            }
            if (getdvarint(#"hash_62162f1f94cbba77", 0) != var_f4098dd1) {
                var_f4098dd1 = getdvarint(#"hash_62162f1f94cbba77", 0);
                if (var_f4098dd1) {
                    setdvar(#"doublejump_time_before_recharge", 1);
                    setdvar(#"doublejump_time_before_recharge_fast", 1);
                    setdvar(#"playerenergy_restrate", 10000);
                } else {
                    setdvar(#"doublejump_time_before_recharge", 1600);
                    setdvar(#"doublejump_time_before_recharge_fast", 1000);
                    setdvar(#"playerenergy_restrate", 400);
                    iprintlnbold(var_f4098dd1 ? "<dev string:xb66>" : "<dev string:xb78>");
                }
            }
            if (getdvarint(#"hash_618be616410fad95", 0) != var_94dbbfd9 && isdefined(level.players)) {
                foreach (player in level.players) {
                    if (player prop::function_84793f03()) {
                        var_94dbbfd9 = getdvarint(#"hash_618be616410fad95", 0);
                        player.var_8df5658d = !(isdefined(player.var_8df5658d) && player.var_8df5658d);
                        player iprintlnbold(player.var_8df5658d ? "<dev string:xb87>" : "<dev string:xb99>");
                    }
                }
            }
            isremoved = getdvarint(#"hash_21d7ba8da36d4023", 0);
            if (isremoved != var_6631295a) {
                var_6631295a = isremoved;
                function_ad983215(!isremoved);
            }
            var_90cd8304 = getdvarint(#"hash_34a3e2c00f7cd27f", 0);
            if (var_90cd8304 != var_e68b7091) {
                var_e68b7091 = var_90cd8304;
                result = function_fd3c3ed0(var_90cd8304);
                if (!result) {
                    var_e68b7091 = !var_90cd8304;
                }
                if (var_e68b7091) {
                    level.drown_damage = 0;
                } else {
                    level.drown_damage = var_f6fe53f9;
                }
            }
            if (getdvarint(#"hash_3fd977c7de8de72b", 0) != 0) {
                function_cb8ecc99();
                setdvar(#"hash_3fd977c7de8de72b", 0);
            }
            if (getdvarint(#"hash_5fea18fb5a6e0027", 0) != 0) {
                function_2b23b2b6();
                setdvar(#"hash_5fea18fb5a6e0027", 0);
            }
            if (getdvarint(#"hash_69637702c083dc28", 0) != 0) {
                function_f2e19297();
                setdvar(#"hash_69637702c083dc28", 0);
            }
            if (getdvarint(#"hash_7115842bdfa67a2b", 0) != 0) {
                if (isdefined(level.players) && isdefined(level.players[0])) {
                    level thread prop::function_c4aeb146(#"score_last_alive", level.players[0]);
                }
                setdvar(#"hash_7115842bdfa67a2b", 0);
            }
            if (getdvarint(#"hash_34e9a7fac83d28a6", 0) != 0) {
                showhealth();
            }
            if (getdvarint(#"hash_7b2608d6176b79f4", 0)) {
                function_38964c72();
            }
            if (getdvarint(#"hash_4424a07b5272599a", 0) != 0) {
                showmodels();
                setdvar(#"hash_4424a07b5272599a", 0);
            }
            if (getdvarint(#"hash_84008139ad85e21", 0) != 0) {
                if (isdefined(level.players) && isdefined(level.players[0])) {
                    level.players[0] prop_controls::canlock();
                }
            }
            if (getdvarint(#"hash_2fa05819a4eeb99b", 0) != 0 || getdvarint(#"hash_84008139ad85e21", 0) != 0) {
                function_1f3923fa();
            }
            if (getdvarint(#"hash_2a03924a528ff9a8", 0) != 0) {
                function_5e0d41c4();
                setdvar(#"hash_2a03924a528ff9a8", 0);
            }
            if (getdvarint(#"hash_740b6f4a4aa58f21", 0) != 0) {
                function_5646cd5c();
                setdvar(#"hash_740b6f4a4aa58f21", 0);
            }
            if (getdvarint(#"hash_2441330d88677536", 0) != 0 && isdefined(level.players)) {
                level notify(#"cancelcountdown");
                setdvar(#"hash_2441330d88677536", 0);
            }
            if (getdvarint(#"hash_7da18bcec6fafe7f", 0) != 0) {
                function_34a7562e();
            }
            if (getdvarint(#"hash_745b5ef88dd291e1", 0) != 0) {
                showplayers();
            }
            if (getdvarint(#"hash_3c0e90252ca92099", 0) != 0) {
                showtargets();
            }
            if (getdvarint(#"scr_prop_minigame", 1) != minigame_on && isdefined(level.players) && level.players.size > 0) {
                minigame_on = getdvarint(#"scr_prop_minigame", 1);
                iprintlnbold(minigame_on ? "<dev string:xba8>" : "<dev string:xbb6>");
            }
            if (getdvarint(#"hash_6132db0becb8f98", 0) != var_b948ae6c && isdefined(level.players) && level.players.size > 0) {
                var_b948ae6c = getdvarint(#"hash_6132db0becb8f98", 0);
                if (var_b948ae6c == 2) {
                    iprintlnbold("<dev string:xbc5>");
                } else if (var_b948ae6c == 1) {
                    iprintlnbold("<dev string:xbda>");
                } else {
                    iprintlnbold("<dev string:xbf0>");
                }
            }
            waitframe(1);
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0xcfc46a28, Offset: 0x1a10
    // Size: 0xf4
    function function_ad983215(enabled) {
        setdvar(#"com_statmon", enabled);
        setdvar(#"con_minicon", enabled);
        setdvar(#"cg_drawfps", enabled);
        setdvar(#"cg_drawtime", enabled);
        setdvar(#"cg_drawviewpos", enabled);
        setdvar(#"hash_173fd7265ae0b7b1", enabled);
        setdvar(#"hash_2d3acd259cd6aca6", enabled);
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0x33d3be64, Offset: 0x1b10
    // Size: 0xe2
    function function_fd3c3ed0(enabled) {
        if (!isdefined(level.players) || level.players.size == 0) {
            return 0;
        }
        player = level.players[0];
        if (!isdefined(player) || !isalive(player) || isdefined(player.placementoffset) || !isdefined(player.prop)) {
            return 0;
        }
        if (enabled) {
            player function_673195f3();
        } else {
            player function_401f47cd();
        }
        return 1;
    }

    // Namespace prop_dev/_prop_dev
    // Params 5, eflags: 0x0
    // Checksum 0x91301f3f, Offset: 0x1c00
    // Size: 0x88
    function function_9cd2eb63(color, label, value, text, var_e1fb743e) {
        hudelem = prop_controls::addupperrighthudelem(label, value, text, var_e1fb743e);
        hudelem.alpha = 0.5;
        hudelem.color = color;
        return hudelem;
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x8b3bdb4, Offset: 0x1c90
    // Size: 0x1c4
    function function_673195f3() {
        self prop_controls::cleanuppropcontrolshud();
        self prop_controls::function_1e25f968();
        if (self issplitscreen()) {
            self.currenthudy = -10;
        } else {
            self.currenthudy = -80;
        }
        self.var_5f51d2ee = function_1eca597a(self.prop.info.modelname);
        white = (1, 1, 1);
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0.5, 1);
        self.var_28df7051 = array(self.placementmodel, self.var_3634d14e, self.var_a2614669, self.var_5ee5df03, self.var_66df6677, self.var_ec9a93, self.var_811d1afa, self.var_d7336ed8, self.var_334e2710, self.var_faa235b5, self.var_35eb52f1, self.var_a2f59097);
        self.placementindex = 0;
        self function_8d3ffd86();
        self thread function_c3c92269();
        self thread function_4a5dac11();
        self thread function_1e509052();
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x2b25134b, Offset: 0x1e60
    // Size: 0x184
    function function_401f47cd() {
        self notify(#"hash_3ecc0277d544b441");
        prop_controls::safedestroy(self.placementmodel);
        prop_controls::safedestroy(self.var_3634d14e);
        prop_controls::safedestroy(self.var_a2614669);
        prop_controls::safedestroy(self.var_5ee5df03);
        prop_controls::safedestroy(self.var_66df6677);
        prop_controls::safedestroy(self.var_ec9a93);
        prop_controls::safedestroy(self.var_811d1afa);
        prop_controls::safedestroy(self.var_d7336ed8);
        prop_controls::safedestroy(self.var_334e2710);
        prop_controls::safedestroy(self.var_faa235b5);
        prop_controls::safedestroy(self.var_35eb52f1);
        prop_controls::safedestroy(self.var_a2f59097);
        self function_cc5afb75();
        self prop_controls::propcontrolshud();
        self prop_controls::setupkeybindings();
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0xb2c939e1, Offset: 0x1ff0
    // Size: 0x6c
    function function_1e509052() {
        self endon(#"game_ended", #"disconnect", #"hash_3ecc0277d544b441");
        self waittill(#"death");
        setdvar(#"hash_34a3e2c00f7cd27f", 0);
    }

    // Namespace prop_dev/_prop_dev
    // Params 6, eflags: 0x0
    // Checksum 0x27b1a0f7, Offset: 0x2068
    // Size: 0x13c
    function debugaxis(origin, angles, size, alpha, depthtest, duration) {
        axisx = anglestoforward(angles) * size;
        axisy = anglestoright(angles) * size;
        axisz = anglestoup(angles) * size;
        line(origin, origin + axisx, (1, 0, 0), alpha, 0, duration);
        line(origin, origin + axisy, (0, 1, 0), alpha, 0, duration);
        line(origin, origin + axisz, (0, 0, 1), alpha, 0, duration);
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0xe9bff6d1, Offset: 0x21b0
    // Size: 0xae
    function function_c3c92269() {
        self endon(#"hash_3ecc0277d544b441");
        while (true) {
            debugaxis(self.origin, self.angles, 100, 1, 0, 1);
            box(self.origin, self getmins(), self getmaxs(), self.angles[1], (1, 0, 1), 1, 0, 1);
            waitframe(1);
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x4b766d30, Offset: 0x2268
    // Size: 0x1a8
    function function_4a5dac11() {
        self endon(#"hash_3ecc0277d544b441");
        self function_ea8e45a8(0);
        while (true) {
            waitresult = self waittill(#"up", #"down", #"left", #"right", #"shot");
            msg = waitresult._notify;
            if (!isdefined(msg)) {
                continue;
            }
            if (msg == "<dev string:xc07>") {
                self function_92f23bcd(-1);
                continue;
            }
            if (msg == "<dev string:xc0c>") {
                self function_92f23bcd(1);
                continue;
            }
            if (msg == "<dev string:xc13>") {
                self function_cdf89a29(1);
                continue;
            }
            if (msg == "<dev string:xc1b>") {
                self function_cdf89a29(-1);
                continue;
            }
            if (msg == "<dev string:xc22>") {
                function_77511c75();
            }
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0xc56962d8, Offset: 0x2418
    // Size: 0x68
    function function_92f23bcd(val) {
        self endon(#"letgo");
        function_ea8e45a8(val);
        wait 0.5;
        while (true) {
            function_ea8e45a8(val);
            wait 0.05;
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0x992cf273, Offset: 0x2488
    // Size: 0xea
    function function_ea8e45a8(val) {
        hudelem = self.var_28df7051[self.placementindex];
        hudelem.alpha = 0.5;
        hudelem.fontscale = 1;
        self.placementindex += val;
        if (self.placementindex >= self.var_28df7051.size) {
            self.placementindex = 0;
        } else if (self.placementindex < 0) {
            self.placementindex = self.var_28df7051.size - 1;
        }
        hudelem = self.var_28df7051[self.placementindex];
        hudelem.alpha = 1;
        hudelem.fontscale = 1.3;
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0xe770e8e2, Offset: 0x2580
    // Size: 0x68
    function function_cdf89a29(val) {
        self endon(#"letgo");
        function_75154360(val);
        wait 0.05;
        while (true) {
            function_75154360(val);
            wait 0.05;
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0x275ca93c, Offset: 0x25f0
    // Size: 0x72
    function function_5ee4d3a8(inval) {
        tempindex = self.var_5f51d2ee + inval;
        if (tempindex >= level.propindex.size) {
            tempindex = 0;
        } else if (tempindex < 0) {
            tempindex = level.propindex.size - 1;
        }
        self.var_5f51d2ee = tempindex;
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0xe1307dd4, Offset: 0x2670
    // Size: 0x88
    function function_1eca597a(var_8ba3b403) {
        for (index = 0; index < level.propindex.size; index++) {
            if (level.proplist[level.propindex[index][0]][level.propindex[index][1]].modelname == var_8ba3b403) {
                return index;
            }
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0xe7cced59, Offset: 0x2700
    // Size: 0xefc
    function function_75154360(val) {
        hudelem = self.var_28df7051[self.placementindex];
        if (hudelem == self.placementmodel) {
            function_5ee4d3a8(val);
            self.prop.info = level.proplist[level.propindex[self.var_5f51d2ee][0]][level.propindex[self.var_5f51d2ee][1]];
            prop_controls::propchangeto(self.prop.info);
            self.placementmodel settext("<dev string:xc29>" + self.var_5f51d2ee + "<dev string:xc33>" + self.prop.info.modelname);
            self.var_3634d14e settext("<dev string:xc39>" + self.prop.info.propsizetext);
            self.var_a2614669 setvalue(self.prop.info.propsize);
            self.var_5ee5df03 setvalue(self.prop.info.propscale);
            self.var_66df6677 setvalue(self.prop.info.xyzoffset[0]);
            self.var_ec9a93 setvalue(self.prop.info.xyzoffset[1]);
            self.var_811d1afa setvalue(self.prop.info.xyzoffset[2]);
            self.var_d7336ed8 setvalue(self.prop.info.anglesoffset[0]);
            self.var_334e2710 setvalue(self.prop.info.anglesoffset[1]);
            self.var_faa235b5 setvalue(self.prop.info.anglesoffset[2]);
            self.var_35eb52f1 setvalue(self.prop.info.propheight);
            self.var_a2f59097 setvalue(self.prop.info.proprange);
            return;
        }
        if (hudelem == self.var_3634d14e || hudelem == self.var_a2614669) {
            sizes = array("<dev string:xc42>", "<dev string:xc4b>", "<dev string:xc53>", "<dev string:xc5c>", "<dev string:xc64>", "<dev string:xc6d>");
            index = 0;
            for (i = 0; i < sizes.size; i++) {
                if (sizes[i] == self.prop.info.propsizetext) {
                    index = i;
                    break;
                }
            }
            index += val;
            if (index < 0) {
                index = sizes.size - 1;
            } else if (index >= sizes.size) {
                index = 0;
            }
            self.prop.info.propsizetext = sizes[index];
            self.prop.info.propsize = prop::getpropsize(self.prop.info.propsizetext);
            self.var_3634d14e settext("<dev string:xc39>" + self.prop.info.propsizetext);
            self.var_a2614669 setvalue(self.prop.info.propsize);
            self.health = self.prop.info.propsize;
            self.maxhealth = self.health;
            return;
        }
        if (hudelem == self.var_5ee5df03) {
            var_dfa19677 = 0.1;
            var_34b4cc47 = 10;
            var_59913b42 = 0.01;
            self.prop.info.propscale += var_59913b42 * val;
            self.prop.info.propscale = math::clamp(self.prop.info.propscale, var_dfa19677, var_34b4cc47);
            self.prop setscale(self.prop.info.propscale);
            self.var_5ee5df03 setvalue(self.prop.info.propscale);
            return;
        }
        if (hudelem == self.var_66df6677) {
            self.prop unlink();
            self.prop.info.xyzoffset = (self.prop.info.xyzoffset[0] + val, self.prop.info.xyzoffset[1], self.prop.info.xyzoffset[2]);
            self.prop.xyzoffset = self.prop.info.xyzoffset;
            self.var_66df6677 setvalue(self.prop.info.xyzoffset[0]);
            function_c2ab2206();
            return;
        }
        if (hudelem == self.var_ec9a93) {
            self.prop unlink();
            self.prop.info.xyzoffset = (self.prop.info.xyzoffset[0], self.prop.info.xyzoffset[1] + val, self.prop.info.xyzoffset[2]);
            self.prop.xyzoffset = self.prop.info.xyzoffset;
            self.var_ec9a93 setvalue(self.prop.info.xyzoffset[1]);
            function_c2ab2206();
            return;
        }
        if (hudelem == self.var_811d1afa) {
            self.prop unlink();
            self.prop.info.xyzoffset = (self.prop.info.xyzoffset[0], self.prop.info.xyzoffset[1], self.prop.info.xyzoffset[2] + val);
            self.prop.xyzoffset = self.prop.info.xyzoffset;
            self.var_811d1afa setvalue(self.prop.info.xyzoffset[2]);
            function_c2ab2206();
            return;
        }
        if (hudelem == self.var_d7336ed8) {
            self.prop unlink();
            self.prop.info.anglesoffset = (self.prop.info.anglesoffset[0] + val, self.prop.info.anglesoffset[1], self.prop.info.anglesoffset[2]);
            self.prop.anglesoffset = self.prop.info.anglesoffset;
            self.var_d7336ed8 setvalue(self.prop.info.anglesoffset[0]);
            function_c2ab2206();
            return;
        }
        if (hudelem == self.var_334e2710) {
            self.prop unlink();
            self.prop.info.anglesoffset = (self.prop.info.anglesoffset[0], self.prop.info.anglesoffset[1] + val, self.prop.info.anglesoffset[2]);
            self.prop.anglesoffset = self.prop.info.anglesoffset;
            self.var_334e2710 setvalue(self.prop.info.anglesoffset[1]);
            function_c2ab2206();
            return;
        }
        if (hudelem == self.var_faa235b5) {
            self.prop unlink();
            self.prop.info.anglesoffset = (self.prop.info.anglesoffset[0], self.prop.info.anglesoffset[1], self.prop.info.anglesoffset[2] + val);
            self.prop.anglesoffset = self.prop.info.anglesoffset;
            self.var_faa235b5 setvalue(self.prop.info.anglesoffset[2]);
            function_c2ab2206();
            return;
        }
        if (hudelem == self.var_35eb52f1) {
            adjust = 10;
            self.prop.info.propheight += adjust * val;
            self.prop.info.propheight = math::clamp(self.prop.info.propheight, -30, 40);
            self.thirdpersonheightoffset = self.prop.info.propheight;
            self setclientthirdperson(1);
            self.var_35eb52f1 setvalue(self.prop.info.propheight);
            return;
        }
        if (hudelem == self.var_a2f59097) {
            adjust = 10;
            self.prop.info.proprange += adjust * val;
            self.prop.info.proprange = math::clamp(self.prop.info.proprange, 50, 360);
            self.thirdpersonrange = self.prop.info.proprange;
            self setclientthirdperson(1);
            self.var_a2f59097 setvalue(self.prop.info.proprange);
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x807f28d, Offset: 0x3608
    // Size: 0x74
    function function_c2ab2206() {
        self.prop.origin = self.propent.origin;
        self prop::applyxyzoffset();
        self prop::applyanglesoffset();
        self.prop linkto(self.propent);
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0xd615cbf1, Offset: 0x3688
    // Size: 0x1e4
    function function_8d3ffd86() {
        self prop_controls::notifyonplayercommand("<dev string:xc07>", "<dev string:xc76>");
        self prop_controls::notifyonplayercommand("<dev string:xc0c>", "<dev string:xc86>");
        self prop_controls::notifyonplayercommand("<dev string:xc1b>", "<dev string:xc96>");
        self prop_controls::notifyonplayercommand("<dev string:xc13>", "<dev string:xca6>");
        self prop_controls::notifyonplayercommand("<dev string:xcb6>", "<dev string:xcbe>");
        self prop_controls::notifyonplayercommand("<dev string:xcb6>", "<dev string:xcce>");
        self prop_controls::notifyonplayercommand("<dev string:xcb6>", "<dev string:xcde>");
        self prop_controls::notifyonplayercommand("<dev string:xcb6>", "<dev string:xcee>");
        self prop_controls::notifyonplayercommand("<dev string:xc22>", "<dev string:xcfe>");
        self prop_controls::notifyonplayercommand("<dev string:xd08>", "<dev string:xd12>");
        self prop_controls::notifyonplayercommand("<dev string:xd1d>", "<dev string:xd26>");
        self prop_controls::notifyonplayercommand("<dev string:xd1d>", "<dev string:xd33>");
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x7c5f4a60, Offset: 0x3878
    // Size: 0x1e4
    function function_cc5afb75() {
        self prop_controls::notifyonplayercommandremove("<dev string:xc07>", "<dev string:xc76>");
        self prop_controls::notifyonplayercommandremove("<dev string:xc0c>", "<dev string:xc86>");
        self prop_controls::notifyonplayercommandremove("<dev string:xc1b>", "<dev string:xc96>");
        self prop_controls::notifyonplayercommandremove("<dev string:xc13>", "<dev string:xca6>");
        self prop_controls::notifyonplayercommandremove("<dev string:xcb6>", "<dev string:xcbe>");
        self prop_controls::notifyonplayercommandremove("<dev string:xcb6>", "<dev string:xcce>");
        self prop_controls::notifyonplayercommandremove("<dev string:xcb6>", "<dev string:xcde>");
        self prop_controls::notifyonplayercommandremove("<dev string:xcb6>", "<dev string:xcee>");
        self prop_controls::notifyonplayercommandremove("<dev string:xc22>", "<dev string:xcfe>");
        self prop_controls::notifyonplayercommandremove("<dev string:xd08>", "<dev string:xd12>");
        self prop_controls::notifyonplayercommandremove("<dev string:xd1d>", "<dev string:xd26>");
        self prop_controls::notifyonplayercommandremove("<dev string:xd1d>", "<dev string:xd33>");
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0xc7749026, Offset: 0x3a68
    // Size: 0x50
    function function_cbef3d63(vec) {
        return isdefined(vec) && (vec[0] != 0 || vec[1] != 0 || vec[2] != 0);
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0x5b73bc09, Offset: 0x3ac0
    // Size: 0x48
    function function_a840713e(propinfo) {
        return isdefined(propinfo.propheight) && propinfo.propheight != prop::getthirdpersonheightoffsetforsize(propinfo.propsize);
    }

    // Namespace prop_dev/_prop_dev
    // Params 1, eflags: 0x0
    // Checksum 0xb4764f12, Offset: 0x3b10
    // Size: 0x48
    function function_7a3672a6(propinfo) {
        return isdefined(propinfo.proprange) && propinfo.proprange != prop::getthirdpersonrangeforsize(propinfo.propsize);
    }

    // Namespace prop_dev/_prop_dev
    // Params 2, eflags: 0x0
    // Checksum 0xfffdd2a, Offset: 0x3b60
    // Size: 0x264
    function function_2dc5c497(file, propinfo) {
        propstr = "<dev string:xd3f>" + propinfo.modelname + "<dev string:xd42>" + propinfo.propsizetext + "<dev string:xd42>" + propinfo.propscale;
        if (function_cbef3d63(propinfo.xyzoffset)) {
            propstr += "<dev string:xd42>" + propinfo.xyzoffset[0] + "<dev string:xd42>" + propinfo.xyzoffset[1] + "<dev string:xd42>" + propinfo.xyzoffset[2];
        } else {
            propstr += "<dev string:xd46>";
        }
        if (function_cbef3d63(propinfo.anglesoffset)) {
            propstr += "<dev string:xd42>" + propinfo.anglesoffset[0] + "<dev string:xd42>" + propinfo.anglesoffset[1] + "<dev string:xd42>" + propinfo.anglesoffset[2];
        } else {
            propstr += "<dev string:xd46>";
        }
        if (function_a840713e(propinfo)) {
            propstr += "<dev string:xd42>" + propinfo.propheight;
        } else {
            propstr += "<dev string:xd42>" + prop::getthirdpersonheightoffsetforsize(propinfo.propsize);
        }
        if (function_7a3672a6(propinfo)) {
            propstr += "<dev string:xd42>" + propinfo.proprange;
        } else {
            propstr += "<dev string:xd42>" + prop::getthirdpersonrangeforsize(propinfo.propsize);
        }
        fprintln(file, propstr);
    }

    // Namespace prop_dev/_prop_dev
    // Params 2, eflags: 0x0
    // Checksum 0x16714008, Offset: 0x3dd0
    // Size: 0x5c
    function function_8639a7b0(file, propinfo) {
        propstr = "<dev string:xd4f>" + propinfo.modelname + "<dev string:xd67>";
        fprintln(file, propstr);
    }

    // Namespace prop_dev/_prop_dev
    // Params 2, eflags: 0x0
    // Checksum 0x7bb0ee86, Offset: 0x3e38
    // Size: 0x10c
    function function_62b9b9ac(file, propsizetext) {
        foreach (sizetype in level.proplist) {
            foreach (propinfo in sizetype) {
                if (propinfo.propsizetext == propsizetext) {
                    function_2dc5c497(file, propinfo);
                }
            }
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 2, eflags: 0x0
    // Checksum 0x9edd8097, Offset: 0x3f50
    // Size: 0x10c
    function plaza_dom_point_neutral_b_secured(file, propsizetext) {
        foreach (sizetype in level.proplist) {
            foreach (propinfo in sizetype) {
                if (propinfo.propsizetext == propsizetext) {
                    function_8639a7b0(file, propinfo);
                }
            }
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 2, eflags: 0x0
    // Checksum 0xf31e84ec, Offset: 0x4068
    // Size: 0x314
    function function_79d57521(file, var_7723a9cd) {
        var_7e52c89c = var_7723a9cd + "<dev string:xd6e>";
        var_44c49e4e = var_7723a9cd + "<dev string:xd75>";
        var_473e8b8d = var_7723a9cd + "<dev string:xd7c>";
        var_ca180226 = level.script + "<dev string:xd84>";
        var_19494914 = level.script + "<dev string:xd8c>";
        var_155d523d = "<dev string:xd93>";
        var_7770e500 = "<dev string:xdae>";
        var_d6ade535 = "<dev string:xdcc>";
        fprintln(file, "<dev string:xdf2>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:xe9a>");
        fprintln(file, "<dev string:xea4>" + var_7e52c89c + "<dev string:xebd>");
        fprintln(file, "<dev string:xed1>" + var_44c49e4e + "<dev string:xebd>");
        fprintln(file, "<dev string:xeea>" + var_473e8b8d + "<dev string:xeff>" + var_155d523d);
        fprintln(file, "<dev string:xf06>" + var_7e52c89c + "<dev string:xeff>" + var_d6ade535);
        fprintln(file, "<dev string:xf1b>" + var_44c49e4e + "<dev string:xeff>" + var_7770e500);
        fprintln(file, "<dev string:xf30>");
        fprintln(file, "<dev string:xf53>" + var_ca180226 + "<dev string:xf70>" + var_7723a9cd);
        fprintln(file, "<dev string:xf7d>" + var_19494914 + "<dev string:xf9a>" + var_44c49e4e + "<dev string:xfb2>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:xfb6>");
        fprintln(file, "<dev string:xd3f>");
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x2549cffe, Offset: 0x4388
    // Size: 0x3ac
    function function_cb8ecc99() {
        platform = "<dev string:xfe8>";
        if (level.orbis) {
            platform = "<dev string:xfed>";
        } else if (level.durango) {
            platform = "<dev string:xff5>";
        }
        var_7723a9cd = level.script + "<dev string:xfff>";
        var_7e52c89c = var_7723a9cd + "<dev string:xd6e>";
        var_b522696f = "<dev string:x1005>" + platform + "<dev string:x100d>";
        var_d6ade535 = "<dev string:xdcc>";
        file = openfile(var_7e52c89c, "<dev string:x101c>");
        if (file == -1) {
            iprintlnbold("<dev string:x1024>" + var_b522696f + var_7e52c89c + "<dev string:x1039>");
            println("<dev string:x1024>" + var_b522696f + var_7e52c89c + "<dev string:x1039>");
            return;
        }
        function_79d57521(file, var_7723a9cd);
        fprintln(file, "<dev string:x1048>");
        function_62b9b9ac(file, "<dev string:xc42>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x105d>");
        function_62b9b9ac(file, "<dev string:xc4b>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x106c>");
        function_62b9b9ac(file, "<dev string:xc53>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x107c>");
        function_62b9b9ac(file, "<dev string:xc5c>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x108b>");
        function_62b9b9ac(file, "<dev string:xc64>");
        iprintlnbold("<dev string:x10a0>" + var_b522696f + var_7e52c89c + "<dev string:x10a9>" + var_d6ade535);
        println("<dev string:x10a0>" + var_b522696f + var_7e52c89c + "<dev string:x10a9>" + var_d6ade535);
        closefile(file);
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0xb31015ca, Offset: 0x4740
    // Size: 0x394
    function function_2b23b2b6() {
        platform = "<dev string:xfe8>";
        if (level.orbis) {
            platform = "<dev string:xfed>";
        } else if (level.durango) {
            platform = "<dev string:xff5>";
        }
        var_7723a9cd = level.script + "<dev string:xfff>";
        var_7e52c89c = var_7723a9cd + "<dev string:xd75>";
        var_b522696f = "<dev string:x1005>" + platform + "<dev string:x100d>";
        var_d6ade535 = "<dev string:xdae>";
        file = openfile(var_7e52c89c, "<dev string:x101c>");
        if (file == -1) {
            iprintlnbold("<dev string:x1024>" + var_b522696f + var_7e52c89c + "<dev string:x1039>");
            println("<dev string:x1024>" + var_b522696f + var_7e52c89c + "<dev string:x1039>");
            return;
        }
        fprintln(file, "<dev string:x10b6>");
        plaza_dom_point_neutral_b_secured(file, "<dev string:xc42>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x10cd>");
        plaza_dom_point_neutral_b_secured(file, "<dev string:xc4b>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x10de>");
        plaza_dom_point_neutral_b_secured(file, "<dev string:xc53>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x10f0>");
        plaza_dom_point_neutral_b_secured(file, "<dev string:xc5c>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x1101>");
        plaza_dom_point_neutral_b_secured(file, "<dev string:xc64>");
        iprintlnbold("<dev string:x10a0>" + var_b522696f + var_7e52c89c + "<dev string:x10a9>" + var_d6ade535);
        println("<dev string:x10a0>" + var_b522696f + var_7e52c89c + "<dev string:x10a9>" + var_d6ade535);
        closefile(file);
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x56f6cd86, Offset: 0x4ae0
    // Size: 0xc34
    function function_f2e19297() {
        platform = "<dev string:xfe8>";
        if (level.orbis) {
            platform = "<dev string:xfed>";
        } else if (level.durango) {
            platform = "<dev string:xff5>";
        }
        var_7723a9cd = level.script + "<dev string:xfff>";
        var_7e52c89c = var_7723a9cd + "<dev string:xd6e>";
        var_44c49e4e = var_7723a9cd + "<dev string:xd75>";
        var_473e8b8d = var_7723a9cd + "<dev string:xd7c>";
        var_ca180226 = level.script + "<dev string:xd84>";
        var_19494914 = level.script + "<dev string:xd8c>";
        var_b522696f = "<dev string:x1005>" + platform + "<dev string:x100d>";
        var_155d523d = "<dev string:xd93>";
        var_7770e500 = "<dev string:xdae>";
        var_d6ade535 = "<dev string:xdcc>";
        file = openfile(var_7e52c89c, "<dev string:x101c>");
        if (file == -1) {
            iprintlnbold("<dev string:x1024>" + var_b522696f + var_7e52c89c + "<dev string:x1039>");
            println("<dev string:x1024>" + var_b522696f + var_7e52c89c + "<dev string:x1039>");
            return;
        }
        function_79d57521(file, var_7723a9cd);
        fprintln(file, "<dev string:x1048>");
        fprintln(file, "<dev string:x1118>");
        fprintln(file, "<dev string:x1118>");
        fprintln(file, "<dev string:x1118>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x105d>");
        fprintln(file, "<dev string:x1133>");
        fprintln(file, "<dev string:x1133>");
        fprintln(file, "<dev string:x1133>");
        fprintln(file, "<dev string:x1133>");
        fprintln(file, "<dev string:x1133>");
        fprintln(file, "<dev string:x1133>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x106c>");
        fprintln(file, "<dev string:x114c>");
        fprintln(file, "<dev string:x114c>");
        fprintln(file, "<dev string:x114c>");
        fprintln(file, "<dev string:x114c>");
        fprintln(file, "<dev string:x114c>");
        fprintln(file, "<dev string:x114c>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x107c>");
        fprintln(file, "<dev string:x1167>");
        fprintln(file, "<dev string:x1167>");
        fprintln(file, "<dev string:x1167>");
        fprintln(file, "<dev string:x1167>");
        fprintln(file, "<dev string:x1167>");
        fprintln(file, "<dev string:x1167>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x108b>");
        fprintln(file, "<dev string:x1180>");
        fprintln(file, "<dev string:x1180>");
        fprintln(file, "<dev string:x1180>");
        closefile(file);
        file = openfile(var_44c49e4e, "<dev string:x101c>");
        if (file == -1) {
            iprintlnbold("<dev string:x1024>" + var_b522696f + var_44c49e4e + "<dev string:x1039>");
            println("<dev string:x1024>" + var_b522696f + var_44c49e4e + "<dev string:x1039>");
            return;
        }
        fprintln(file, "<dev string:x10b6>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x10cd>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x10de>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x10f0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:xd3f>");
        fprintln(file, "<dev string:x1101>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        fprintln(file, "<dev string:x11a0>");
        closefile(file);
        file = openfile(var_473e8b8d, "<dev string:x101c>");
        if (file == -1) {
            iprintlnbold("<dev string:x1024>" + var_b522696f + var_473e8b8d + "<dev string:x1039>");
            println("<dev string:x1024>" + var_b522696f + var_473e8b8d + "<dev string:x1039>");
            return;
        }
        fprintln(file, "<dev string:x11bc>" + var_7e52c89c);
        fprintln(file, "<dev string:x11de>" + var_44c49e4e);
        closefile(file);
        iprintlnbold("<dev string:x11f4>" + var_b522696f);
        println("<dev string:x11f4>" + var_b522696f);
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x16d36e91, Offset: 0x5720
    // Size: 0x3c2
    function function_77511c75() {
        player = level.players[0];
        if (!isdefined(player) || !isalive(player) || !(isdefined(player.hasspawned) && player.hasspawned)) {
            return;
        }
        if (isdefined(level.players[1])) {
            enemybot = level.players[1];
        } else {
            enemybot = bot::add_bot(util::getotherteam(player.team));
        }
        if (!isdefined(enemybot.pers[#"participation"])) {
            enemybot.pers[#"participation"] = 0;
        }
        if (!isdefined(enemybot.hits)) {
            enemybot.hits = 0;
        }
        setdvar(#"bot_allowattack", 0);
        setdvar(#"bot_allowmovement", 0);
        player.health = player.maxhealth;
        weapon = getweapon("<dev string:x120d>");
        end = player.origin;
        dir = anglestoforward(player.angles);
        start = end + dir * 100 + (0, 0, 30);
        magicbullet(weapon, start, end, enemybot);
        dirback = -1 * dir;
        start = end + dirback * 100 + (0, 0, 30);
        magicbullet(weapon, start, end, enemybot);
        dirright = anglestoright(player.angles);
        start = end + dirright * 100 + (0, 0, 30);
        magicbullet(weapon, start, end, enemybot);
        dirleft = -1 * dirright;
        start = end + dirleft * 100 + (0, 0, 30);
        magicbullet(weapon, start, end, enemybot);
        start = end + (0, 0, 100);
        magicbullet(weapon, start, end, enemybot);
        player waittilltimeout(0.3, #"damage");
        wait 0.05;
        player.health = player.maxhealth;
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x3e8d76e8, Offset: 0x5af0
    // Size: 0xf0
    function showhealth() {
        if (!isdefined(level.players)) {
            return;
        }
        foreach (player in level.players) {
            if (isdefined(player) && isdefined(player.team) && player.team == game.defenders) {
                print3d(player.origin + (0, 0, 50), "<dev string:xd3f>" + player.health);
            }
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x5b7f82dc, Offset: 0x5be8
    // Size: 0x110
    function function_34a7562e() {
        if (!isdefined(level.players)) {
            return;
        }
        foreach (player in level.players) {
            velocity = player getvelocity();
            var_a79358cf = (velocity[0], velocity[1], 0);
            speed = length(var_a79358cf);
            print3d(player.origin + (0, 0, 50), "<dev string:xd3f>" + speed);
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x91349624, Offset: 0x5d00
    // Size: 0xb8
    function function_38964c72() {
        if (!isdefined(level.players)) {
            return;
        }
        foreach (player in level.players) {
            if (isdefined(player) && isdefined(player.prop)) {
                player prop_controls::get_ground_normal(player.prop, 1);
            }
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 3, eflags: 0x0
    // Checksum 0xe1923699, Offset: 0x5dc0
    // Size: 0x2c0
    function function_ed0598d(propinfo, origin, angles) {
        propent = spawn("<dev string:x121c>", origin);
        propent setcontents(0);
        propent notsolid();
        propent setplayercollision(0);
        prop = spawn("<dev string:x121c>", propent.origin);
        prop.angles = angles;
        prop setmodel(propinfo.modelname);
        prop setscale(propinfo.propscale);
        prop setcandamage(1);
        prop.xyzoffset = propinfo.xyzoffset;
        prop.anglesoffset = propinfo.anglesoffset;
        prop.health = 1;
        prop setplayercollision(0);
        forward = anglestoforward(angles) * prop.xyzoffset[0];
        right = anglestoright(angles) * prop.xyzoffset[1];
        up = anglestoup(angles) * prop.xyzoffset[2];
        prop.origin += forward;
        prop.origin += right;
        prop.origin += up;
        prop.angles += prop.anglesoffset;
        prop linkto(propent);
        propent.prop = prop;
        propent.propinfo = propinfo;
        return propent;
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x4ad3a648, Offset: 0x6088
    // Size: 0x226
    function showmodels() {
        player = level.players[0];
        angles = player.angles;
        dir = anglestoforward(angles);
        origin = player.origin + (0, 0, 100);
        if (!isdefined(level.var_98714fa7)) {
            level.var_98714fa7 = [];
            foreach (category in level.proplist) {
                foreach (propinfo in category) {
                    level.var_98714fa7[level.var_98714fa7.size] = function_ed0598d(propinfo, origin, angles);
                    origin += dir * 60;
                }
            }
            return;
        }
        foreach (propent in level.var_98714fa7) {
            propent.origin = origin;
            origin += dir * 60;
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x69078329, Offset: 0x62b8
    // Size: 0x344
    function function_1f3923fa() {
        if (!isdefined(level.var_f8f7808e)) {
            return;
        }
        color = (0, 1, 0);
        if (!level.var_f8f7808e.success) {
            color = (1, 0, 0);
        }
        print3d(level.var_f8f7808e.playerorg + (0, 0, 50), level.var_f8f7808e.type);
        box(level.var_f8f7808e.playerorg, level.var_f8f7808e.playermins, level.var_f8f7808e.playermaxs, level.var_f8f7808e.playerangles[1], color);
        if (isdefined(level.var_f8f7808e.origin1)) {
            sphere(level.var_f8f7808e.origin1, 5, color);
            line(level.var_f8f7808e.playerorg, level.var_f8f7808e.origin1);
            if (isdefined(level.var_f8f7808e.text1)) {
                print3d(level.var_f8f7808e.origin1 + (0, 0, -10), level.var_f8f7808e.text1);
            }
        }
        if (isdefined(level.var_f8f7808e.origin2)) {
            sphere(level.var_f8f7808e.origin2, 5, color);
            line(level.var_f8f7808e.playerorg, level.var_f8f7808e.origin2);
            if (isdefined(level.var_f8f7808e.text2)) {
                print3d(level.var_f8f7808e.origin2 + (0, 0, 10), level.var_f8f7808e.text2);
            }
        }
        if (isdefined(level.var_f8f7808e.origin3)) {
            sphere(level.var_f8f7808e.origin3, 5, color);
            line(level.var_f8f7808e.playerorg, level.var_f8f7808e.origin3);
            if (isdefined(level.var_f8f7808e.text3)) {
                print3d(level.var_f8f7808e.origin3 + (0, 0, 30), level.var_f8f7808e.text3);
            }
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 4, eflags: 0x0
    // Checksum 0x87946ba2, Offset: 0x6608
    // Size: 0x16c
    function function_cded003e(propinfo, origin, angles, team) {
        var_6e55957c = spawn("<dev string:x121c>", origin);
        var_6e55957c.targetname = "<dev string:x122b>";
        var_6e55957c setmodel(propinfo.modelname);
        var_6e55957c setscale(propinfo.propscale);
        var_6e55957c.angles = angles;
        var_6e55957c setcandamage(1);
        var_6e55957c.fakehealth = 50;
        var_6e55957c.health = 99999;
        var_6e55957c.maxhealth = 99999;
        var_6e55957c thread prop::function_aa8db165(&prop_controls::damageclonewatch);
        var_6e55957c setplayercollision(0);
        var_6e55957c makesentient();
        var_6e55957c setteam(team);
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0xe571f973, Offset: 0x6780
    // Size: 0x236
    function function_5646cd5c() {
        player = level.players[0];
        angles = player.angles;
        dir = anglestoforward(angles);
        origin = player.origin + (0, 0, 100);
        if (isdefined(level.var_2ebdcb74)) {
            foreach (clone in level.var_2ebdcb74) {
                clone prop_controls::function_d1a1cc8d();
            }
        }
        level.var_2ebdcb74 = [];
        foreach (category in level.proplist) {
            foreach (propinfo in category) {
                level.var_2ebdcb74[level.var_2ebdcb74.size] = function_cded003e(propinfo, origin, angles, util::getotherteam(player.team));
                origin += dir * 60;
            }
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x83780679, Offset: 0x69c0
    // Size: 0x10a
    function function_5e0d41c4() {
        player = level.players[0];
        angles = player.angles;
        dir = anglestoforward(angles);
        origin = player.origin + dir * (0, 0, 100);
        propinfo = prop::getnextprop(player);
        if (!isdefined(level.var_2ebdcb74)) {
            level.var_2ebdcb74 = [];
        }
        level.var_2ebdcb74[level.var_2ebdcb74.size] = function_cded003e(propinfo, origin, angles, util::getotherteam(player.team));
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x7dc6d40d, Offset: 0x6ad8
    // Size: 0xd8
    function showplayers() {
        if (!isdefined(level.players)) {
            return;
        }
        foreach (player in level.players) {
            box(player.origin, player getmins(), player getmaxs(), player.angles[1], (1, 0, 1), 1, 0, 1);
        }
    }

    // Namespace prop_dev/_prop_dev
    // Params 0, eflags: 0x0
    // Checksum 0x1823cc51, Offset: 0x6bb8
    // Size: 0xd6
    function showtargets() {
        if (!isdefined(level.var_1103f74e) || !isdefined(level.var_1103f74e.targets)) {
            return;
        }
        for (i = 0; i < level.var_1103f74e.targets.size; i++) {
            target = level.var_1103f74e.targets[i];
            if (isdefined(target)) {
                print3d(target.origin + (0, 0, 30), "<dev string:xd3f>" + target.fakehealth);
            }
        }
    }

#/
