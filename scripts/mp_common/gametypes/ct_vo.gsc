// Atian COD Tools GSC decompiler test
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace ct_vo;

// Namespace ct_vo/ct_vo
// Params 0, eflags: 0x2
// Checksum 0x37fc7867, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ct_vo", &__init__, undefined, undefined);
}

// Namespace ct_vo/ct_vo
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0xe8
// Size: 0x4
function __init__() {
    
}

// Namespace ct_vo/ct_vo
// Params 0, eflags: 0x0
// Checksum 0xa1439c41, Offset: 0xf8
// Size: 0x36
function get_player() {
    a_e_allies = util::get_players(#"allies");
    return a_e_allies[0];
}

// Namespace ct_vo/ct_vo
// Params 3, eflags: 0x0
// Checksum 0x26a7a7d4, Offset: 0x138
// Size: 0x9c
function function_41e59aeb(var_3608d414, var_3a78a180 = 1, var_35f78012 = 0) {
    level endon(#"combattraining_logic_finished");
    while (1) {
        if (!function_5d127774()) {
            break;
        }
        waitframe(1);
    }
    function_831e0584(var_3608d414, var_3a78a180, var_35f78012);
}

// Namespace ct_vo/ct_vo
// Params 3, eflags: 0x0
// Checksum 0x68a8e1d5, Offset: 0x1e0
// Size: 0xac
function function_831e0584(var_3608d414, var_3a78a180 = 1, var_35f78012 = 0) {
    level endon(#"combattraining_logic_finished");
    if (!(isdefined(level.var_77e9434e) && level.var_77e9434e)) {
        self thread function_3820390e(var_3608d414, var_3a78a180, var_35f78012);
        waitframe(1);
        function_3ca1b77d(1);
    }
}

// Namespace ct_vo/ct_vo
// Params 3, eflags: 0x0
// Checksum 0xb659ed55, Offset: 0x298
// Size: 0x30c
function function_3820390e(var_3608d414, var_3a78a180 = 1, var_35f78012 = 0) {
    level endon(#"combattraining_logic_finished");
    level notify(#"hash_269c201d6122a737");
    waitframe(1);
    level endoncallback(&function_a13e292b, #"hash_269c201d6122a737");
    e_player = get_player();
    e_player endoncallback(&function_a13e292b, #"death");
    n_time = gettime() / 1000;
    if (level.var_a188abf === n_time) {
        return;
    }
    level.var_a188abf = gettime() / 1000;
    if (!isdefined(var_3608d414)) {
        return;
    }
    if (isdefined(level.var_3f407ec2) && level.var_3f407ec2) {
        return;
    }
    if (!var_35f78012) {
        while (isdefined(level.var_de17b8a3) && level.var_de17b8a3) {
            waitframe(1);
        }
    }
    if (isdefined(e_player.var_8701e993)) {
        e_player stopsound(e_player.var_8701e993);
    }
    var_56402506 = gettime() / 1000;
    n_time = 0;
    while (isdefined(e_player.var_ec53b83b) && e_player.var_ec53b83b && n_time < 0.5) {
        waitframe(1);
        n_time = gettime() / 1000 - var_56402506;
    }
    if (isdefined(e_player.var_ec53b83b) && e_player.var_ec53b83b) {
        e_player.var_ec53b83b = 0;
    }
    e_player.var_a10aaced = var_3608d414.size;
    e_player.var_9e2e6113 = 0;
    foreach (str_vo in var_3608d414) {
        e_player.var_8701e993 = str_vo;
        e_player function_62b6f78a(e_player.var_8701e993, 1);
        e_player.var_a10aaced--;
    }
    function_a13e292b(#"hash_73687ae50a00b952");
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0x6ea1eec5, Offset: 0x5b0
// Size: 0x24
function function_47ece28d(_hash) {
    level thread function_a13e292b(_hash);
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0x49e2b441, Offset: 0x5e0
// Size: 0xe2
function function_a13e292b(_hash) {
    e_player = get_player();
    if (isdefined(e_player) && !(isdefined(e_player.var_ec53b83b) && e_player.var_ec53b83b)) {
        e_player.var_ec53b83b = 1;
        if (isdefined(e_player.var_8701e993)) {
            e_player stopsound(e_player.var_8701e993);
        }
        waitframe(1);
        e_player.var_681d4714 = e_player.var_8701e993;
        e_player.var_8701e993 = undefined;
        e_player.var_9e2e6113 = 0;
        e_player.var_a10aaced = 0;
        e_player.var_ec53b83b = 0;
    }
}

// Namespace ct_vo/ct_vo
// Params 2, eflags: 0x0
// Checksum 0x6974dd59, Offset: 0x6d0
// Size: 0x54
function play_vo(str_vo, var_3a78a180 = 1) {
    self thread function_62b6f78a(str_vo, var_3a78a180);
    waitframe(1);
    function_3ca1b77d();
}

// Namespace ct_vo/ct_vo
// Params 2, eflags: 0x0
// Checksum 0xc99a5758, Offset: 0x730
// Size: 0x16c
function function_62b6f78a(str_vo, var_3a78a180 = 1) {
    level endon(#"combattraining_logic_finished");
    level notify(#"hash_13084191e4b3baf1");
    waitframe(1);
    level endoncallback(&function_d7a1a570, #"hash_13084191e4b3baf1");
    e_player = get_player();
    e_player endoncallback(&function_d7a1a570, #"death");
    e_player.var_9e2e6113++;
    e_player.var_8701e993 = str_vo;
    e_player.var_b9d55f30 = str_vo + "_done";
    e_player.var_27405e0f = soundgetplaybacktime(str_vo) / 1000;
    e_player playsound(e_player.var_8701e993);
    if (var_3a78a180) {
        e_player function_56ed19d9();
    } else {
        e_player thread function_56ed19d9();
    }
}

// Namespace ct_vo/ct_vo
// Params 0, eflags: 0x0
// Checksum 0x97fa6ea9, Offset: 0x8a8
// Size: 0x8e
function function_56ed19d9() {
    self endoncallback(&function_d7a1a570, #"death");
    if (self.var_27405e0f > 0) {
        wait(self.var_27405e0f);
    } else {
        /#
            iprintlnbold("<unknown string>" + self.var_8701e993);
        #/
    }
    self notify(self.var_b9d55f30);
    self.var_9e2e6113--;
    self.var_8701e993 = undefined;
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0x9f8ea49, Offset: 0x940
// Size: 0x24
function function_c72e58c1(_hash) {
    level thread function_d7a1a570(_hash);
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0xabe4d143, Offset: 0x970
// Size: 0xb2
function function_d7a1a570(_hash) {
    e_player = get_player();
    if (isdefined(e_player)) {
        e_player.var_fac6c61 = 1;
        if (isdefined(e_player.var_8701e993)) {
            e_player stopsound(e_player.var_8701e993);
            e_player.var_681d4714 = e_player.var_8701e993;
        }
        e_player.var_8701e993 = undefined;
        e_player.var_9e2e6113 = 0;
        e_player.var_27405e0f = 0;
        e_player.var_fac6c61 = 0;
    }
}

// Namespace ct_vo/ct_vo
// Params 2, eflags: 0x0
// Checksum 0x3f7bbf88, Offset: 0xa30
// Size: 0x32
function function_bdb97813(b_disable, n_delay) {
    if (isdefined(n_delay)) {
        wait(n_delay);
    }
    level.var_3f407ec2 = b_disable;
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0x970356c6, Offset: 0xa70
// Size: 0x1e6
function function_3ca1b77d(var_d9da07d1 = 1) {
    level endon(#"combattraining_logic_finished");
    e_player = getplayers()[0];
    if (isalive(e_player)) {
        e_player endon(#"death");
    } else {
        return;
    }
    wait(0.1);
    n_start_time = gettime() / 1000;
    while (1) {
        if (isdefined(var_d9da07d1) && var_d9da07d1) {
            if ((!isdefined(e_player.var_a10aaced) || e_player.var_a10aaced == 0) && (!isdefined(e_player.var_9e2e6113) || e_player.var_9e2e6113 <= 0)) {
                e_player.var_9e2e6113 = 0;
                waitframe(1);
                break;
            }
        } else if (!isdefined(e_player.var_8701e993) && (!isdefined(e_player.var_9e2e6113) || e_player.var_9e2e6113 <= 0)) {
            e_player.var_9e2e6113 = 0;
            waitframe(1);
            break;
        }
        n_time = gettime() / 1000;
        dt = n_time - n_start_time;
        if (dt > 15 && e_player.var_a10aaced == 0) {
            e_player.var_9e2e6113 = 0;
            break;
        }
        waitframe(1);
    }
    waitframe(1);
}

// Namespace ct_vo/ct_vo
// Params 0, eflags: 0x0
// Checksum 0x2f16d672, Offset: 0xc60
// Size: 0x70
function function_5d127774() {
    e_player = getplayers()[0];
    if (isalive(e_player) && isdefined(e_player.var_9e2e6113) && e_player.var_9e2e6113 > 0) {
        return 1;
    }
    return 0;
}

// Namespace ct_vo/ct_vo
// Params 4, eflags: 0x0
// Checksum 0x55120aa9, Offset: 0xcd8
// Size: 0xf4
function function_261ed63c(str_vo, var_520123e0 = 45, n_wait = 30, var_74e4153b) {
    if (isdefined(var_74e4153b)) {
        level endoncallback(&function_869da1cf, #"combattraining_logic_finished", #"hash_60e26e14a51c5211", var_74e4153b);
    } else {
        level endoncallback(&function_869da1cf, #"combattraining_logic_finished", #"hash_60e26e14a51c5211");
    }
    e_player = get_player();
    e_player thread function_dad9897f(str_vo, var_520123e0, n_wait);
}

// Namespace ct_vo/ct_vo
// Params 3, eflags: 0x0
// Checksum 0xd14c6a3a, Offset: 0xdd8
// Size: 0xee
function function_dad9897f(str_vo, var_520123e0 = 45, n_wait = 30) {
    level endoncallback(&function_869da1cf, #"combattraining_logic_finished", #"hash_60e26e14a51c5211");
    b_first = 1;
    do {
        if (b_first) {
            wait(var_520123e0);
            b_first = 0;
        } else {
            wait(n_wait);
        }
        self function_3ca1b77d();
        self.var_ca6e5bf1 = str_vo;
        self play_vo(str_vo, 1);
        self.var_ca6e5bf1 = undefined;
    } while(1);
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0xcef186f, Offset: 0xed0
// Size: 0x92
function function_869da1cf(_hash) {
    e_player = get_player();
    if (isdefined(e_player.var_ca6e5bf1)) {
        e_player stopsound(e_player.var_ca6e5bf1);
        if (e_player.var_8701e993 === e_player.var_ca6e5bf1) {
            e_player.var_8701e993 = undefined;
        }
        e_player.var_ca6e5bf1 = undefined;
        e_player.var_9e2e6113 = 0;
    }
}

// Namespace ct_vo/ct_vo
// Params 6, eflags: 0x0
// Checksum 0x90567aae, Offset: 0xf70
// Size: 0x20a
function vo_on_damage(str_vo, var_f4b1cabb = 1, n_rest = 10, var_515667fb = #"axis", str_mod, str_weapon) {
    level endon(#"combattraining_logic_finished", #"hash_658f0911fdecfaf8");
    self endon(#"death", #"hash_658f0911fdecfaf8");
    e_player = get_player();
    e_player endon(#"death");
    do {
        s_notify = undefined;
        s_notify = self waittill(#"damage");
        var_17ec8061 = !isdefined(s_notify.attacker) || s_notify.attacker.team == var_515667fb;
        var_d8d43f9a = !isdefined(str_mod) || s_notify.mod === str_mod;
        var_95ea2eec = !isdefined(str_weapon) || getweapon(str_weapon) === s_notify.weapon;
        if (var_17ec8061 && var_d8d43f9a && var_95ea2eec) {
            e_player function_3ca1b77d();
            e_player function_831e0584(array(str_vo));
        }
        wait(n_rest);
    } while(var_f4b1cabb);
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0x676ad34b, Offset: 0x1188
// Size: 0xac
function function_28126982(var_3608d414) {
    level endon(#"combattraining_logic_finished", #"hash_658f0911fdecfaf8");
    self endon(#"hash_658f0911fdecfaf8");
    e_player = get_player();
    self waittill(#"death");
    e_player function_3ca1b77d();
    waitframe(1);
    e_player function_831e0584(var_3608d414);
}

// Namespace ct_vo/ct_vo
// Params 8, eflags: 0x0
// Checksum 0x5807fd00, Offset: 0x1240
// Size: 0x28e
function function_625a37f9(vo, _notify, var_531cd749 = 1, var_cd53c705 = 1, var_dfbbbce6 = 10, var_352fef28 = 0, var_37338add = 1, var_8e9dbdf9 = 1) {
    level endoncallback(&function_dae6df54, #"combattraining_logic_finished", #"hash_4c2e751dd9e2bb57");
    e_player = get_player();
    if (isdefined(var_8e9dbdf9) && var_8e9dbdf9) {
        e_player endoncallback(&function_dae6df54, #"death", #"hash_4c2e751dd9e2bb57");
    }
    var_e8ee1cd1 = 0;
    if (isdefined(var_352fef28) && var_352fef28) {
        var_531cd749 = 0;
    }
    do {
        level waittill(_notify);
        if (isdefined(var_cd53c705) && var_cd53c705) {
            e_player function_3ca1b77d(1);
        }
        if (var_352fef28) {
            str_vo = vo[var_e8ee1cd1];
            e_player function_831e0584(array(str_vo));
            var_e8ee1cd1++;
            if (var_e8ee1cd1 >= vo.size) {
                var_e8ee1cd1 = 0;
                if (var_37338add) {
                    return;
                }
            }
        } else if (isarray(vo)) {
            e_player function_3820390e(vo, 1);
        } else {
            e_player function_3820390e(array(vo), 1);
        }
        wait(var_dfbbbce6);
    } while(!(isdefined(var_531cd749) && var_531cd749));
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0xbdbb5cc1, Offset: 0x14d8
// Size: 0x20
function function_dae6df54(_hash) {
    level notify(#"hash_13084191e4b3baf1");
}

// Namespace ct_vo/ct_vo
// Params 2, eflags: 0x0
// Checksum 0x948b95de, Offset: 0x1500
// Size: 0xf4
function function_8d5bc717(var_772144ec, vo) {
    level endoncallback(&function_fe927bbd, #"combattraining_logic_finished", #"hash_2d2294060e47449f");
    e_player = get_player();
    e_player endoncallback(&function_fe927bbd, #"death", #"hash_2d2294060e47449f");
    trigger::wait_till(var_772144ec);
    if (isstring(vo)) {
        vo = array(vo);
    }
    self function_831e0584(vo);
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0x1be745f1, Offset: 0x1600
// Size: 0x20
function function_fe927bbd(_hash) {
    level notify(#"hash_269c201d6122a737");
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0x5729dccd, Offset: 0x1628
// Size: 0x26
function stop_nag(var_f031f5a) {
    level waittill(var_f031f5a);
    level.var_de17b8a3 = 0;
}

// Namespace ct_vo/ct_vo
// Params 2, eflags: 0x0
// Checksum 0xfefbd3ad, Offset: 0x1658
// Size: 0x1d2
function function_14b08e49(var_3608d414, var_f031f5a) {
    level endon(#"combattraining_logic_finished");
    if (isdefined(var_f031f5a)) {
        level endon(var_f031f5a);
        level thread function_b3c04dfd(var_f031f5a);
    }
    if (isdefined(20)) {
        wait(20);
    }
    level.var_3e17f129 = 1;
    while (1) {
        if (isdefined(level.var_29c997df) && level.var_29c997df) {
            function_731eb7ed();
        }
        while (function_5d127774()) {
            waitframe(1);
        }
        var_cbcad363 = 1;
        n_time = gettime() / 1000;
        if (isdefined(level.var_6ee32682)) {
            dt = n_time - level.var_6ee32682;
            if (dt < 8) {
                var_cbcad363 = 0;
            }
        }
        if (var_cbcad363) {
            level.var_de17b8a3 = 1;
            if (isdefined(var_f031f5a)) {
                level thread stop_nag(var_f031f5a);
                var_f031f5a = undefined;
            }
            function_831e0584(var_3608d414, 1, 1);
            level.var_de17b8a3 = 0;
            level.var_6ee32682 = gettime() / 1000;
        }
        wait(20);
    }
    level.var_3e17f129 = undefined;
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0x59a4d77b, Offset: 0x1838
// Size: 0x26
function function_b3c04dfd(str_endon) {
    level waittill(str_endon);
    level.var_3e17f129 = undefined;
}

// Namespace ct_vo/ct_vo
// Params 0, eflags: 0x0
// Checksum 0x8b4ff1fe, Offset: 0x1868
// Size: 0x16
function function_731eb7ed() {
    level.var_6ee32682 = gettime() / 1000;
}

// Namespace ct_vo/ct_vo
// Params 2, eflags: 0x0
// Checksum 0x82e0a76d, Offset: 0x1888
// Size: 0x106
function function_5172b052(str_vo, str_endon_notify) {
    level endon(#"combattraining_logic_finished", str_endon_notify);
    while (1) {
        e_player = getplayers()[0];
        if (!isalive(e_player)) {
            while (function_5d127774()) {
                waitframe(1);
            }
            function_831e0584(array(str_vo), 1);
            while (1) {
                e_player = getplayers()[0];
                if (isalive(e_player)) {
                    break;
                }
                waitframe(1);
            }
        }
        waitframe(1);
    }
}

// Namespace ct_vo/ct_vo
// Params 5, eflags: 0x0
// Checksum 0x68292378, Offset: 0x1998
// Size: 0x13a
function function_accb34a7(v_target_pos, var_9a9916cf, var_3608d414, str_endon, var_b181ba65) {
    level endon(#"combattraining_logic_finished", str_endon);
    while (1) {
        e_player = getplayers()[0];
        v_eye = e_player util::get_eye();
        n_dist = distance(v_eye, v_target_pos);
        if (n_dist < var_9a9916cf) {
            if (e_player ct_utils::can_see(v_target_pos, 1)) {
                if (isdefined(var_b181ba65)) {
                    e_player = getplayers()[0];
                    e_player thread ct_utils::function_61c3d59c(var_b181ba65, undefined);
                }
                function_41e59aeb(var_3608d414);
                break;
            }
        }
        waitframe(1);
    }
}

// Namespace ct_vo/ct_vo
// Params 2, eflags: 0x0
// Checksum 0x4c7d7b6d, Offset: 0x1ae0
// Size: 0x68
function function_5df1a850(e_entity, var_3608d414) {
    if (!isdefined(level.var_77e9434e)) {
        level.var_77e9434e = 0;
    }
    level.var_77e9434e++;
    e_entity function_b0c62cf3(var_3608d414);
    level.var_77e9434e--;
}

// Namespace ct_vo/ct_vo
// Params 1, eflags: 0x0
// Checksum 0x80318da9, Offset: 0x1b50
// Size: 0xb6
function function_b0c62cf3(var_3608d414) {
    self endon(#"death");
    foreach (str_vo in var_3608d414) {
        self playsoundwithnotify(str_vo, "sound_done");
        self waittill(#"sound_done");
    }
}

// Namespace ct_vo/ct_vo
// Params 0, eflags: 0x0
// Checksum 0xb7d80370, Offset: 0x1c10
// Size: 0x26
function function_b86d3b7d() {
    wait(0.1);
    while (level.var_77e9434e > 0) {
        waitframe(1);
    }
}

// Namespace ct_vo/ct_vo
// Params 0, eflags: 0x0
// Checksum 0xa436a12d, Offset: 0x1c40
// Size: 0x138
function function_dfd7add4() {
    /#
        sessionmode = currentsessionmode();
        setdvar(#"hash_31b5762ac1fb40cf", "<unknown string>");
        if (sessionmode != 4) {
            adddebugcommand("<unknown string>");
        }
        while (1) {
            wait(0.25);
            cmd = getdvarstring(#"hash_31b5762ac1fb40cf", "<unknown string>");
            if (cmd == "<unknown string>") {
                continue;
            }
            e_player = level.players[0];
            switch (cmd) {
            case #"stub":
                break;
            }
            setdvar(#"hash_31b5762ac1fb40cf", "<unknown string>");
        }
    #/
}

