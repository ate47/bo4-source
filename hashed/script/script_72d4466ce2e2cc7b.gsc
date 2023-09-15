// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_1e38a8f6;

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 0, eflags: 0x1 linked
// Checksum 0x69c4c16a, Offset: 0x700
// Size: 0xcc
function init() {
    clientfield::register("toplayer", "RGB_keyboard_manager", 1, 3, "int", &function_f5866497, 0, 0);
    if (ispc() && getdvarint(#"hash_cca6902a7ce5273", 0) == 1) {
        callback::on_localclient_connect(&localclient_connect);
        callback::on_gameplay_started(&function_9b08184);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0xd45ed482, Offset: 0x7d8
// Size: 0xa4
function function_9b08184(localclientnum) {
    player = function_5c10bd79(localclientnum);
    player thread function_9ac87769(localclientnum);
    level.var_4e740db2 = 1;
    callback::on_spawned(&function_9ac87769);
    callback::remove_callback(#"on_gameplay_started", &function_9b08184);
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0x1b8c1390, Offset: 0x888
// Size: 0xcc
function localclient_connect(localclientnum) {
    function_13861db4(12);
    function_4d990c6a();
    function_d9a960f2(4, 12, 8698, 2500, 750, 750, 0);
    if (!util::is_frontend_map()) {
        thread function_ba24f324(localclientnum);
        thread function_1d13e2db(localclientnum);
    }
    if (sessionmodeiswarzonegame()) {
        thread function_1d13e2db(localclientnum);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0xb073cc88, Offset: 0x960
// Size: 0x25c
function function_9ac87769(localclientnum) {
    self endon(#"round_ended");
    player = function_5c10bd79(localclientnum);
    if (!isdefined(player) || self != player || function_1cbf351b(localclientnum) || function_65b9eb0f(localclientnum)) {
        return;
    }
    function_4d990c6a();
    player thread function_43a84577();
    player thread function_cfd06f57(localclientnum);
    player thread function_1edfdbc1(localclientnum);
    player thread function_161106e1(localclientnum);
    player thread function_a78bbf22(localclientnum);
    player thread function_1183b860(localclientnum);
    if (!sessionmodeiswarzonegame() && !sessionmodeiszombiesgame()) {
        player thread function_af712255(localclientnum);
    }
    if (sessionmodeiszombiesgame()) {
        player thread function_88dc3170(localclientnum);
    }
    if (isdefined(level.playerinsertion) && level.playerinsertion) {
        if (!isdefined(level.var_51e99b46) || level.var_51e99b46 != 2) {
            player thread function_9d6500b(localclientnum);
        }
    }
    player waittill(#"death");
    function_13861db4(12);
    function_4d990c6a();
    function_d9a960f2(1, 12, 255);
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 0, eflags: 0x1 linked
// Checksum 0x367c5618, Offset: 0xbc8
// Size: 0x208
function function_43a84577() {
    level endon(#"game_ended");
    var_48c05b87 = array("+forward", "+moveleft", "+moveright", "+back");
    foreach (key in var_48c05b87) {
        function_b4c6383f(self function_c2a5ba97(key), 1, 16777215);
    }
    function_b4c6383f(self function_c2a5ba97("chatmodelast"), 1, 16187136);
    if (isdefined(level.playerinsertion) && level.playerinsertion) {
        var_81fa6e00 = array("togglemap", "+map", "+inventory", "toggleinventory");
        foreach (key in var_81fa6e00) {
            function_b4c6383f(self function_c2a5ba97(key), 1, 65535);
        }
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0xa4165bf5, Offset: 0xdd8
// Size: 0x100
function function_1183b860(localclientnum) {
    self endon(#"death");
    level endon(#"game_ended");
    player = function_5c10bd79(localclientnum);
    while (!(isdefined(level.gameended) && level.gameended)) {
        player waittill(#"weapon_fired");
        cooldowntime = 66;
        if (isdefined(player.weapon.firetime)) {
            cooldowntime = int(player.weapon.firetime * 1000);
        }
        function_d9a960f2(2, 1, 65535, 8698, cooldowntime);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0x4d2c62e8, Offset: 0xee0
// Size: 0x100
function function_cfd06f57(localclientnum) {
    self endon(#"death");
    while (!(isdefined(level.gameended) && level.gameended)) {
        if (isdefined(level.var_d081e853) && level.var_d081e853) {
            function_d9a960f2(4, 12, 16646058, 300, 200, 200, 0);
        } else if (isswimming(localclientnum)) {
            function_d9a960f2(4, 12, 16711680, 300, 200, 200, 0);
        } else {
            function_d9a960f2(1, 12, 8698);
        }
        wait(0.5);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0xcefd27f1, Offset: 0xfe8
// Size: 0x248
function function_1edfdbc1(localclientnum) {
    self endon(#"death");
    self endon(#"disconnect");
    var_7beb3a32 = array("key_f1", "key_f2", "key_f3", "key_f4");
    while (!(isdefined(level.gameended) && level.gameended)) {
        var_38d92d79 = function_5c10bd79(localclientnum);
        if (!isdefined(var_38d92d79)) {
            break;
        }
        current_health = renderhealthoverlayhealth(localclientnum);
        basehealth = var_38d92d79 getplayerspawnhealth();
        n_health = current_health * basehealth;
        if (n_health > 125) {
            function_815076cb(var_7beb3a32, 65280);
        } else if (n_health > 100) {
            function_815076cb(var_7beb3a32, 65535);
        } else if (n_health > 75) {
            function_815076cb(var_7beb3a32, 13209);
        } else if (n_health > 50) {
            function_815076cb(var_7beb3a32, 255);
        } else if (n_health > 25) {
            function_119b3b6b(var_7beb3a32, 255, 300, 200, 200, 0);
        } else if (n_health > 0) {
            function_119b3b6b(var_7beb3a32, 255, 200, 50, 50, 0);
        } else {
            function_815076cb(var_7beb3a32, 0);
        }
        wait(0.5);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0xb9781832, Offset: 0x1238
// Size: 0x1a4
function function_161106e1(localclientnum) {
    self endon(#"death");
    var_834a617c = array("key_f8", "key_f7", "key_f6", "key_f5");
    while (!(isdefined(level.gameended) && level.gameended)) {
        w_currentweapon = getcurrentweapon(localclientnum);
        var_4c47f204 = getweaponammoclip(localclientnum, w_currentweapon);
        n_clipsize = w_currentweapon.clipsize;
        if (n_clipsize > 0) {
            var_102d6996 = var_4c47f204 / n_clipsize;
        } else {
            var_102d6996 = 0;
        }
        for (var_ef80e13b = 0; var_ef80e13b < var_834a617c.size; var_ef80e13b++) {
            if (var_102d6996 > var_ef80e13b / var_834a617c.size) {
                function_b4c6383f(var_834a617c[var_ef80e13b], 1, 9408399);
            } else {
                function_b4c6383f(var_834a617c[var_ef80e13b], 1, 855309);
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0x6224236d, Offset: 0x13e8
// Size: 0x3d4
function function_a78bbf22(localclientnum) {
    self endon(#"death");
    level endon(#"keybind_change");
    if (isdefined(level.playerinsertion) && level.playerinsertion) {
        a_keys = array(self function_c2a5ba97("+frag"), self function_c2a5ba97("+smoke"));
        self.var_9623f1d5 = array(0, 0);
    } else if (sessionmodeiszombiesgame()) {
        a_keys = array(self function_c2a5ba97("+smoke"), self function_c2a5ba97("+frag"), self function_c2a5ba97("+weapoffhandspecial"));
        self.var_9623f1d5 = array(0, 0, 0);
    } else {
        a_keys = array(self function_c2a5ba97("+frag"), self function_c2a5ba97("+smoke"), self function_c2a5ba97("+weapoffhandspecial"));
        self.var_9623f1d5 = array(0, 0, 0);
    }
    function_815076cb(a_keys, 855309);
    if (sessionmodeiszombiesgame()) {
        function_5e0ffde3(self function_c2a5ba97("+smoke"));
    }
    while (!(isdefined(level.gameended) && level.gameended)) {
        for (ga = 0; ga < a_keys.size; ga++) {
            gadgetpower = getgadgetpower(localclientnum, ga);
            if (sessionmodeiszombiesgame()) {
                if (ga == 0) {
                    continue;
                } else if (ga == 1) {
                    gadgetpower = gadgetisready(localclientnum, ga);
                }
            }
            if (isdefined(gadgetpower) && gadgetpower == 1 && isdefined(self.var_9623f1d5[ga]) && !self.var_9623f1d5[ga]) {
                self.var_9623f1d5[ga] = 1;
                self thread function_c6bcf243(a_keys[ga], ga, localclientnum);
            } else if (isdefined(gadgetpower) && gadgetpower != 1) {
                function_b4c6383f(a_keys[ga], 1, 855309);
                self.var_9623f1d5[ga] = 0;
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 3, eflags: 0x1 linked
// Checksum 0x29f35ffe, Offset: 0x17c8
// Size: 0x13c
function function_c6bcf243(var_35a126c, var_b742c891, localclientnum) {
    self endon(#"death");
    level endon(#"game_ended", #"keybind_change");
    function_b4c6383f(var_35a126c, 3, 63487, 855309, 275, 0);
    for (i = 0; i < 160; i++) {
        if (isdefined(getgadgetpower(localclientnum, var_b742c891)) && getgadgetpower(localclientnum, var_b742c891)) {
            waitframe(1);
        } else {
            function_b4c6383f(var_35a126c, 1, 8698);
            self.var_9623f1d5[var_b742c891] = 0;
            return;
        }
    }
    function_b4c6383f(var_35a126c, 1, 63487);
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0x542afdd6, Offset: 0x1910
// Size: 0x180
function function_ba24f324(localclientnum) {
    level endon(#"game_ended");
    while (!(isdefined(level.gameended) && level.gameended)) {
        self waittill(#"keybind_change");
        function_4d990c6a();
        player = function_27673a7(localclientnum);
        player function_43a84577();
        player thread function_a78bbf22(localclientnum);
        if (!sessionmodeiswarzonegame() && !sessionmodeiszombiesgame()) {
            player thread function_af712255(localclientnum);
        }
        if (sessionmodeiszombiesgame()) {
            player thread function_88dc3170(localclientnum);
        }
        if (isdefined(level.playerinsertion) && level.playerinsertion) {
            if (!isdefined(level.var_51e99b46) || level.var_51e99b46 != 2) {
                player thread function_9d6500b();
            }
        }
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 2, eflags: 0x1 linked
// Checksum 0xbe2ac300, Offset: 0x1a98
// Size: 0x1d8
function function_218c905c(localclientnum, winningteam) {
    self endon(#"death");
    player = function_5c10bd79(localclientnum);
    var_a4b49a65 = array("key_f9", "key_f10", "key_f11", "key_f12");
    color = undefined;
    if (!isalive(player) && !isdefined(player) || self != player || function_1cbf351b(localclientnum) || function_65b9eb0f(localclientnum)) {
        return;
    }
    if (winningteam == "tie") {
        color = 9408399;
    } else if (winningteam == player.team) {
        color = 16187136;
    } else if (winningteam != player.team) {
        color = 255;
    }
    if (isdefined(color)) {
        foreach (key in var_a4b49a65) {
            function_b4c6383f(key, 1, color);
        }
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0xbb598632, Offset: 0x1c78
// Size: 0x744
function function_1d13e2db(localclientnum) {
    level endon(#"game_ended");
    var_1953ea4a = array("key_escape", "key_f1", "key_f2", "key_f3", "key_f4", "key_f5", "key_f6", "key_f7", "key_f8", "key_f9", "key_f10", "key_f11", "key_f12", "key_sysrq", "key_scroll", "key_pause");
    var_d3aa0bca = array("key_grave", "key_numlock", "key_multiply", "key_divide", "key_subtract", "key_1", "key_2", "key_3", "key_4", "key_5", "key_6", "key_7", "key_8", "key_9", "key_0", "key_minus", "key_equals", "key_back", "key_insert", "key_home", "key_prior");
    var_58bfadf9 = array("key_numpad9", "key_numpad8", "key_numpad7", "key_add", "key_tab", "key_q", "key_w", "key_e", "key_r", "key_t", "key_y", "key_u", "key_i", "key_o", "key_p", "key_lbracket", "key_rbracket", "key_backslash", "key_delete", "key_end", "key_next");
    var_cae37ef = array("key_numpad6", "key_numpad5", "key_numpad4", "key_capital", "key_a", "key_s", "key_d", "key_f", "key_g", "key_h", "key_j", "key_k", "key_l", "key_semicolon", "key_apostrophe", "key_return");
    var_d3f32152 = array("key_numpad3", "key_numpad2", "key_numpad1", "key_lshift", "key_z", "key_x", "key_c", "key_v", "key_b", "key_n", "key_m", "key_comma", "key_period", "key_slash", "key_rshift", "key_numpadenter", "key_up");
    var_1a5105a9 = array("key_numpad0", "key_decimal", "key_left", "key_down", "key_right", "key_lcontrol", "key_rcontrol", "key_lwin", "key_lmenu", "key_rmenu", "key_apps", "key_fn");
    controllermodel = getuimodelforcontroller(localclientnum);
    parentmodel = createuimodel(getglobaluimodel(), "PositionDraft");
    var_7f1c5ce2 = createuimodel(parentmodel, "timeRemaining");
    var_f4ae48e2 = createuimodel(controllermodel, "PositionDraft");
    var_a5976120 = createuimodel(var_f4ae48e2, "stage");
    previoustime = 0;
    while (!(isdefined(level.gameended) && level.gameended)) {
        _town_mansion_primary_weapons = getuimodelvalue(var_a5976120);
        var_20ef87f3 = getuimodelvalue(var_7f1c5ce2);
        if (isdefined(_town_mansion_primary_weapons) && isdefined(var_20ef87f3)) {
            if (_town_mansion_primary_weapons == 6 && var_20ef87f3 != previoustime) {
                if (!sessionmodeiswarzonegame()) {
                    function_d9a960f2(1, 12, 8698);
                    function_815076cb(var_1953ea4a, 0);
                }
                if (var_20ef87f3 == 5) {
                    if (sessionmodeiswarzonegame()) {
                        function_d9a960f2(1, 12, 8698);
                        function_815076cb(var_1953ea4a, 0);
                    }
                    function_ed8d6d5e(var_d3aa0bca, 8698, 0, 750);
                } else if (var_20ef87f3 == 4) {
                    function_ed8d6d5e(var_58bfadf9, 8698, 0, 750);
                } else if (var_20ef87f3 == 3) {
                    function_ed8d6d5e(var_cae37ef, 8698, 0, 750);
                } else if (var_20ef87f3 == 2) {
                    function_ed8d6d5e(var_d3f32152, 8698, 0, 750);
                } else if (var_20ef87f3 == 1) {
                    function_d9a960f2(2, 12, 8698, 0, 750);
                }
                previoustime = var_20ef87f3;
            } else if (_town_mansion_primary_weapons == 0 && previoustime == 1) {
                previoustime = 0;
                function_13861db4(3);
                break;
            }
        }
        wait(0.3);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0xd1704d63, Offset: 0x23c8
// Size: 0x32c
function function_af712255(localclientnum) {
    self endon(#"death");
    level endon(#"game_ended", #"keybind_change");
    controllermodel = getuimodelforcontroller(localclientnum);
    parentmodel = createuimodel(controllermodel, "killstreaks");
    var_f15e30b1 = createuimodel(parentmodel, "momentumPercentage");
    var_2163222 = createuimodel(parentmodel, "killstreak0");
    var_e6eb8fc9 = createuimodel(parentmodel, "killstreak1");
    var_7bb0cd4 = createuimodel(parentmodel, "killstreak2");
    var_57e596e3 = createuimodel(parentmodel, "killstreak3");
    var_a74def26 = array(var_2163222, var_e6eb8fc9, var_7bb0cd4, var_57e596e3);
    var_80324f69 = array(self function_c2a5ba97("scorestreak1"), self function_c2a5ba97("scorestreak2"), self function_c2a5ba97("scorestreak3"), self function_c2a5ba97("scorestreak4"));
    while (!(isdefined(level.gameended) && level.gameended)) {
        var_e1c5622e = getuimodelvalue(var_f15e30b1);
        for (i = 0; i < var_a74def26.size; i++) {
            var_c36aee76 = createuimodel(var_a74def26[i], "rewardAmmo");
            var_40e153d9 = getuimodelvalue(var_c36aee76);
            if (isdefined(var_40e153d9) && var_40e153d9 > 0) {
                function_b4c6383f(var_80324f69[i], 3, 63487, 0, 275, 0);
            } else {
                function_b4c6383f(var_80324f69[i], 1, 1513239);
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0xd0ed32b8, Offset: 0x2700
// Size: 0x3d4
function function_88dc3170(localclientnum) {
    self endon(#"death");
    level endon(#"game_ended", #"keybind_change");
    parentmodel = createuimodel(getuimodelforcontroller(localclientnum), "zmhud.bgb_carousel");
    var_3e4e5ffe = createuimodel(parentmodel, "0");
    var_af86a313 = createuimodel(parentmodel, "1");
    var_9c05084e = createuimodel(parentmodel, "2");
    var_3904e6a2 = createuimodel(parentmodel, "3");
    if (util::get_game_type() == "ztutorial") {
        level waittill(#"hash_7d7ad8f95ddcdcbd");
    }
    var_fdbf663f = array(var_3e4e5ffe, var_af86a313, var_9c05084e, var_3904e6a2);
    var_524f546 = array(self function_c2a5ba97("usebgb1"), self function_c2a5ba97("usebgb2"), self function_c2a5ba97("usebgb3"), self function_c2a5ba97("usebgb4"));
    while (!(isdefined(level.gameended) && level.gameended)) {
        for (i = 0; i < var_fdbf663f.size; i++) {
            var_c4b36180 = createuimodel(var_fdbf663f[i], "state");
            var_7b9c75e7 = createuimodel(var_fdbf663f[i], "lockdown");
            var_11c51eba = createuimodel(var_fdbf663f[i], "unavailable");
            var_c64ee587 = getuimodelvalue(var_c4b36180);
            var_59015958 = getuimodelvalue(var_7b9c75e7);
            var_7ba921c3 = getuimodelvalue(var_11c51eba);
            if (isdefined(var_c64ee587) && var_c64ee587 == 0 && isdefined(var_59015958) && var_59015958 != 1 && isdefined(var_7ba921c3) && var_7ba921c3 == 0) {
                function_b4c6383f(var_524f546[i], 1, 63487);
            } else {
                function_b4c6383f(var_524f546[i], 1, 1513239);
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x1 linked
// Checksum 0x6d379de7, Offset: 0x2ae0
// Size: 0x14a
function function_9d6500b(localclientnum) {
    self endon(#"death", #"freefallend");
    level endon(#"keybind_change");
    if (isdefined(level.var_51e99b46) && level.var_51e99b46 == 2) {
        return;
    }
    if (!isdefined(level.var_51e99b46)) {
        level.var_51e99b46 = 0;
    }
    if (level.var_51e99b46 == 0) {
        level waittill(#"hash_5975d5f569535c41");
        level.var_51e99b46 = 1;
    }
    var_da854aa8 = self function_c2a5ba97("+activate");
    function_b4c6383f(var_da854aa8, 3, 63487, 855309, 275, 0);
    level waittill(#"hash_413d64e47311dcf8");
    function_5e0ffde3(var_da854aa8);
    level.var_51e99b46 = 2;
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 7, eflags: 0x1 linked
// Checksum 0x923c8be6, Offset: 0x2c38
// Size: 0x17a
function function_f5866497(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    player = function_5c10bd79(localclientnum);
    if (!isdefined(level) && !isdefined(level.var_4e740db2) && level.var_4e740db2 == 0) {
        return;
    }
    switch (newval) {
    case 1:
        function_218c905c(localclientnum, "tie");
        break;
    case 2:
        function_218c905c(localclientnum, "allies");
        break;
    case 3:
        function_218c905c(localclientnum, "axis");
        break;
    case 4:
        level notify(#"hash_7d7ad8f95ddcdcbd");
        break;
    default:
        break;
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 2, eflags: 0x1 linked
// Checksum 0xf01a20b6, Offset: 0x2dc0
// Size: 0x90
function function_815076cb(var_fa8995f4, color) {
    foreach (key in var_fa8995f4) {
        function_b4c6383f(key, 1, color);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 4, eflags: 0x1 linked
// Checksum 0x2b0db3a8, Offset: 0x2e58
// Size: 0xa8
function function_ed8d6d5e(var_fa8995f4, startcolor, endcolor, fadetime) {
    foreach (key in var_fa8995f4) {
        function_b4c6383f(key, 2, startcolor, endcolor, fadetime);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 6, eflags: 0x1 linked
// Checksum 0xd1d3d73f, Offset: 0x2f08
// Size: 0xc0
function function_119b3b6b(var_fa8995f4, color, var_276aa694, fadetime, var_109ec056, offset) {
    foreach (key in var_fa8995f4) {
        function_b4c6383f(key, 4, color, var_276aa694, fadetime, var_109ec056, offset);
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 1, eflags: 0x0
// Checksum 0xbef1d37b, Offset: 0x2fd0
// Size: 0x80
function function_6f501c4(var_fa8995f4) {
    foreach (key in var_fa8995f4) {
        function_5e0ffde3(key);
    }
}

