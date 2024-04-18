// Atian COD Tools GSC decompiler test
#using scripts\killstreaks\dog_shared.gsc;
#using scripts\killstreaks\ai\state.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\abilities\gadgets\gadget_tripwire.gsc;
#using scripts\mp_common\gametypes\ct_vo.gsc;
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_gadgets.gsc;
#using scripts\mp_common\gametypes\ct_bots.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai\systems\gib.gsc;

#namespace ct_nomad_tutorial;

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x8a7717e7, Offset: 0xd90
// Size: 0x86
function init() {
    level flag::init("objective_failed");
    level flag::init("tripwire_kill");
    level.var_ae120f18 = array(#"hash_3fa88e2600b7db91", "vox_tvoi_tutor_noma_slide_3_1");
    level.var_ed417bb9 = 1;
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2ef7c931, Offset: 0xe20
// Size: 0x482
function function_c9ff0dce() {
    self ct_utils::player_reset();
    self.overrideplayerdamage = &callback_player_damage;
    if (self.team == #"allies") {
        ct_utils::function_8f04870f();
        if (isdefined(level.var_ad7c0539)) {
            switch (level.var_ad7c0539) {
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
                self thread ct_bots::function_fd2d220e(0);
                break;
            }
        } else {
            self val::set(#"spawn_player", "disablegadgets");
        }
        self thread function_6e98aea7();
        self ct_utils::function_d3a4d2f8();
        return;
    }
    self thread ct_utils::function_5149c890(1);
    if (isdefined(level.var_ad7c0539)) {
        switch (level.var_ad7c0539) {
        case 1:
            self thread function_1acda64(0.5);
            self thread function_3b95089d(array("s_collision_off_1"), "stop_first_tripwire_collision", undefined);
            break;
        case 2:
            self thread function_1acda64(0.5);
            self thread function_3b95089d(array("s_collision_off_3"), undefined, 1);
            break;
        case 3:
            level.var_2a5b7055 = self;
            break;
        case 4:
            self thread function_3b95089d(array("s_enemy_last_tripwire_target"), undefined, undefined);
            break;
        case 5:
            self thread function_89eab9e8();
            break;
        case 6:
            self thread function_a657cce9();
            break;
        case 7:
            self thread ct_utils::function_402c2175();
            self thread function_1acda64(0.5);
            if (isdefined(level.var_aadd8b8f)) {
                s_loc = level.var_aadd8b8f[level.var_68e1f6ff];
                level.var_68e1f6ff++;
                if (level.var_68e1f6ff >= level.var_aadd8b8f.size) {
                    level.var_68e1f6ff = 0;
                }
                self thread ct_utils::function_1e7b75f2(s_loc);
                self setorigin(s_loc.origin);
                self setplayerangles(s_loc.angles);
            } else {
                self thread function_47f4423a();
            }
            break;
        case 8:
            self thread function_54f2fd97(0);
            break;
        case 9:
            self thread function_7a427be();
            break;
        }
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 2, eflags: 0x0
// Checksum 0x22732f41, Offset: 0x12b0
// Size: 0x3c
function function_1acda64(n_delay, str_weapon) {
    wait(n_delay);
    self ct_utils::give_weapon(#"ar_accurate_t8");
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 11, eflags: 0x0
// Checksum 0xe47c2deb, Offset: 0x12f8
// Size: 0x266
function callback_player_damage(e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf) {
    if (!isdefined(level.var_ad7c0539)) {
        return n_damage;
    }
    if (self.team == #"allies") {
        if (isdefined(level.var_ad7c0539)) {
            switch (level.var_ad7c0539) {
            case 1:
            case 2:
            case 4:
                if (str_means_of_death !== "MOD_TRIGGER_HURT") {
                    self.health = self.health + 1;
                    n_damage = 1;
                }
                break;
            case 3:
                if (isdefined(weapon) && weapon.name == #"eq_tripwire") {
                    n_damage = self.health + 100;
                }
                break;
            }
        }
    } else if (isdefined(level.var_ad7c0539)) {
        switch (level.var_ad7c0539) {
        case 1:
        case 2:
        case 4:
            gibserverutils::giblegs(self);
            gibserverutils::gibhead(self);
            gibserverutils::gibleftarm(self);
            gibserverutils::gibrightarm(self);
            n_damage = self.health + 100;
            break;
        case 5:
            n_damage = self.health + 100;
            break;
        }
    }
    return n_damage;
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 9, eflags: 0x0
// Checksum 0x58ee0936, Offset: 0x1568
// Size: 0x3ca
function function_72ba0df6(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (self.team == #"allies") {
        if (!isbot(self) && isdefined(level.e_dog) && isalive(level.e_dog) && level.var_ad7c0539 >= 5) {
            level.e_dog abort_dog();
        }
        if (isdefined(level.var_ad7c0539)) {
            switch (level.var_ad7c0539) {
            case 3:
                if (!ct_vo::function_5d127774()) {
                    level thread ct_vo::function_41e59aeb(array(#"hash_625a08ecff2b5842"), 1);
                }
                break;
            case 7:
                level thread ct_vo::function_41e59aeb(array(#"hash_e219524f43ed980"), 1);
                break;
            case 8:
                level thread ct_vo::function_41e59aeb(array(#"hash_605295eab859687c"), 1);
                break;
            case 9:
                level thread ct_vo::function_41e59aeb(array(#"hash_29c415884674152e"), 1);
                break;
            }
        }
        return;
    }
    level notify(#"bot_kill");
    level.var_a86320e8 = gettime() / 1000;
    self.isinuse = 0;
    if (isdefined(weapon) && weapon == getweapon(#"eq_tripwire")) {
        level flag::set("tripwire_kill");
        level notify(#"tripwire_kill");
    }
    if (isdefined(level.var_ad7c0539)) {
        switch (level.var_ad7c0539) {
        case 7:
            if (isdefined(einflictor) && isdefined(level.e_dog) && einflictor == level.e_dog) {
                level thread ct_vo::function_41e59aeb(array(#"hash_14f820c919f35aac"), 1);
            }
            break;
        case 9:
            if (isdefined(weapon) && weapon.name == #"gun_ultimate_turret") {
                level.var_628c0318++;
            }
            break;
        }
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x58588157, Offset: 0x1940
// Size: 0x94c
function function_9b9525e9() {
    level endon(#"combattraining_logic_finished");
    level flag::clear("objective_failed");
    level flag::clear("tripwire_kill");
    level thread ct_gadgets::function_fb68ca34(1);
    level.var_e6db911d = 1;
    level.allowspecialistdialog = 0;
    level.var_12347bf6 = 1;
    level.var_67dc9530 = 1;
    level thread ct_gadgets::function_c3e3d15();
    level thread function_e8009771();
    exploder::exploder("fxexp_wind_constant");
    level thread ct_utils::function_9ab507a9("start_area_collision", "start_start_area_collision", "stop_start_area_collision", 1, 1, 0);
    level thread ct_utils::function_9ab507a9("enter_complex_collision", "start_enter_complex_collision", "stop_enter_complex_collision", 1, 1, 0);
    level thread ct_utils::function_9ab507a9("enter_complex_collision_right", "start_enter_complex_collision_right", "stop_enter_complex_collision_right", 1, 1, 0);
    level thread ct_utils::function_9ab507a9("enter_enemy_tripwire_collision", "start_enter_enemy_tripwire_collision", "stop_enter_enemy_tripwire_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("last_tripwire_collision", "start_last_tripwire_collision", "stop_last_tripwire_collision", 1, 1, 0);
    level thread ct_utils::function_9ab507a9("last_tripwire_collision_enter", "start_last_tripwire_collision_enter", "stop_last_tripwire_collision_enter", 1, 1, 0);
    level thread ct_utils::function_9ab507a9("last_tripwire_collision_exit", "start_last_tripwire_collision_exit", "stop_last_tripwire_collision_exit", 1, 1, 0);
    level thread ct_utils::function_9ab507a9("call_juno_collision", "start_call_juno_collision", "stop_call_juno_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("end_area_enterance_collision", "start_end_area_enterance_collision", "stop_end_area_enterance_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("end_area_collision", "start_end_area_collision", "stop_end_area_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("juno_patrol_collision", "start_juno_patrol_collision", "stop_juno_patrol_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("juno_patrol_temp_collision", "start_juno_patrol_temp_collision", "stop_juno_patrol_temp_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("juno_patrol_enter_collision", "start_juno_patrol_enter_collision", "stop_juno_patrol_enter_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("bomb_start_collision", "start_bomb_start_collision", "stop_bomb_start_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("bomb_defend_collision", "start_bomb_defend_collision", "stop_bomb_defend_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("bomb_diffused_collision", "start_bomb_diffused_collision", "stop_bomb_diffused_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("begin_killstreak_collision", "start_begin_killstreak_collision", "stop_begin_killstreak_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("earn_killstreak_collision", "start_earn_killstreak_collision", "stop_earn_killstreak_collision", undefined, 1, 0);
    a_nodes = getnodearray("disable_node", "script_noteworthy");
    foreach (node in a_nodes) {
        setenablenode(node, 0);
    }
    level thread function_eb021db8();
    wait(0.1);
    e_player = getplayers()[0];
    if (isalive(e_player)) {
        e_player ct_bots::function_26d45f32(1);
    }
    level.var_d4668c34 = 1;
    level.var_bc36b6f4 = 1;
    level.var_ad7c0539 = 1;
    level thread function_ccbcdbce();
    level notify(#"start_enter_complex_collision");
    level notify(#"start_start_area_collision");
    ct_utils::function_e9ab1003("s_nomad_tripwire_obj1_goto");
    level.var_3ef5b3ad = 2;
    function_45d34164(array(#"hash_124f5ec91ed68634"), 50, #"hash_729c4f658ee459e2", 2, array("start_first_tripwire_collision"), 1);
    level.var_3ef5b3ad = undefined;
    level.var_bc36b6f4 = 0;
    level.var_ad7c0539 = 2;
    level thread function_f606c349();
    level notify(#"stop_enter_complex_collision");
    level notify(#"start_enter_complex_collision_right");
    level notify(#"start_enter_enemy_tripwire_collision");
    ct_utils::function_e9ab1003("s_nomad_tripwire_obj2_goto");
    function_45d34164(array(#"s_nomad_tripwire_obj2_goto"), 40, #"hash_72928f658edc721d", 2, array("start_enter_complex_collision"), 1);
    ct_vo::function_831e0584(array(#"hash_73107c81df5c9b57"), 1);
    level.var_bc36b6f4 = 1;
    level.var_ad7c0539 = 3;
    function_eb17793c();
    level.var_ad7c0539 = 4;
    function_afa281f4();
    level.var_ad7c0539 = 5;
    level.var_67dc9530 = 0;
    function_244e4db8();
    level.var_5cb850c9 = undefined;
    level.var_ad7c0539 = 6;
    function_2e9a1486();
    level.var_ad7c0539 = 7;
    function_34696b67();
    level.var_ad7c0539 = 8;
    function_76739a65();
    level.var_ad7c0539 = 9;
    function_eadc9c91();
    ct_utils::onboarding_complete();
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 6, eflags: 0x0
// Checksum 0x36d4b9a0, Offset: 0x2298
// Size: 0x5f0
function function_45d34164(var_2970d97, var_9c8d914, var_af764233, var_f1111d99, var_7d599ca, var_d40d02dc) {
    level endon(#"combattraining_logic_finished");
    level thread function_621ffb5a();
    e_player = ct_utils::get_player();
    level.var_e72728b8 = array(#"ability_dog", #"eq_tripwire");
    if (isdefined(var_2970d97)) {
        foreach (str_s_target in var_2970d97) {
            level thread ct_vo::function_14b08e49(array(#"hash_1912c92a46f64dd7"), "stop_nag");
            ct_utils::function_93c86846(undefined, str_s_target, array(#"ability_dog", #"eq_tripwire"), 0, undefined, var_9c8d914);
            level notify(#"stop_nag");
            waitframe(1);
        }
    }
    ct_utils::function_c2a10fc();
    waitframe(1);
    if (isdefined(var_7d599ca)) {
        foreach (str_notify in var_7d599ca) {
            level notify(str_notify);
        }
    }
    while (true) {
        e_player ct_utils::function_6ad0c151();
        for (i = 0; i < var_f1111d99; i++) {
            str_name = var_af764233 + i + 1;
            s_loc = struct::get(str_name, "targetname");
            level thread ct_vo::function_14b08e49(array(#"hash_4c2430811fce4c2"), "stop_nag");
            function_4f54cf00(s_loc, i);
            level notify(#"stop_nag");
            level notify(#"tripwire_placed");
            if (i == 0) {
                level.var_632734b1 = 3;
            } else {
                level.var_632734b1 = 2;
            }
            wait(0.1);
            ct_vo::function_3ca1b77d();
        }
        if (isdefined(var_d40d02dc) && var_d40d02dc) {
            e_player = getplayers()[0];
            gadget_weapon = e_player getcurrentoffhand();
            if (isdefined(gadget_weapon) && gadget_weapon.name == #"eq_tripwire") {
                e_player ability_player::function_fc4dc54();
            }
        }
        level.var_632734b1 = 2;
        level notify(#"vo_callout");
        level notify(#"hash_622db456eabd4e20");
        if (isdefined(level.var_3ef5b3ad)) {
            wait(level.var_3ef5b3ad);
        } else {
            wait(0.1);
            ct_vo::function_3ca1b77d();
        }
        if (isdefined(var_d40d02dc) && var_d40d02dc) {
            e_player setlowready(1);
            level thread function_e19de01();
            level flag::wait_till_any(array("tripwire_kill", "objective_failed"));
            if (level flag::get("tripwire_kill")) {
                level notify(#"vo_callout");
                function_a710c695();
                level flag::clear("tripwire_kill");
                e_player setlowready(0);
                break;
            }
            level flag::clear("objective_failed");
            level thread function_ee509880();
            continue;
        }
        break;
    }
    ct_utils::function_c2a10fc();
    level notify(#"hash_6ae51860f226eb91");
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2f13b718, Offset: 0x2890
// Size: 0x1d0
function function_b93032f4() {
    level endon(#"combattraining_logic_finished");
    if (!isdefined(level.var_bbecb36c)) {
        level.var_bbecb36c = 0;
    }
    self endoncallback(&function_8b2d617b, #"death");
    while (true) {
        waitresult = self waittill(#"damage");
        attacker = waitresult.attacker;
        attacker util::show_hit_marker(1);
        if (isdefined(waitresult.mod) && waitresult.mod == "MOD_MELEE") {
            level.var_4f54bc60 = 1;
        }
        if (level.var_bbecb36c == 0) {
            if (!ct_vo::function_5d127774()) {
                level thread ct_vo::function_41e59aeb(array(#"hash_400ce53d6acfb07d"), 1);
            }
        } else {
            level thread ct_vo::function_41e59aeb(array(#"hash_400ce43d6acfaeca"), 1);
        }
        level.var_bbecb36c++;
        self gadget_tripwire::function_9e546fb3(attacker, getweapon(#"incendiary_grenade"), undefined, undefined);
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 1, eflags: 0x0
// Checksum 0xbff5bace, Offset: 0x2a68
// Size: 0x84
function function_8b2d617b(_hash) {
    if (isdefined(self.waypoint)) {
        self.waypoint ct_utils::function_f9ed304d();
        self.waypoint = undefined;
    }
    if (isalive(ct_utils::get_player())) {
        level.var_8befe6c5++;
        ct_vo::function_731eb7ed();
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x9f692f54, Offset: 0x2af8
// Size: 0x7d8
function function_eb17793c() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003(undefined);
    level notify(#"stop_enter_enemy_tripwire_collision");
    level notify(#"start_last_tripwire_collision_enter");
    level thread ct_vo::function_14b08e49(array(#"hash_1912c92a46f64dd7"), "stop_nag");
    a_str_vo = array("vox_tvoi_tutor_noma_slide_10_1");
    ct_utils::function_93c86846(a_str_vo, "s_goto_enemy_tripwire_obj", array(#"ability_dog", #"eq_tripwire"), 0, undefined, 45);
    level notify(#"stop_nag");
    level notify(#"start_enter_enemy_tripwire_collision");
    ct_utils::function_e9ab1003("s_goto_enemy_tripwire_obj");
    level notify(#"hash_48afae2c9fea0ec");
    ct_vo::function_3ca1b77d();
    level thread ct_vo::function_14b08e49(array(#"hash_464d77c3e0ec72ce"), "stop_nag");
    level thread function_9d35e9f6();
    b_vo_played = 0;
    while (true) {
        level.var_bbecb36c = 0;
        ct_vo::function_731eb7ed();
        if (!(isdefined(b_vo_played) && b_vo_played)) {
            level thread ct_vo::function_831e0584(array("vox_tvoi_tutor_noma_slide_11_0", "vox_tvoi_tutor_noma_slide_11_2"), 1);
            level notify(#"stop_last_tripwire_collision_enter");
            b_vo_played = 1;
        }
        e_player = getplayers()[0];
        e_player thread ct_utils::function_61c3d59c(#"hash_556abea715c9ba9e", undefined);
        e_player allowprone(0);
        level thread ct_bots::activate_bots(1, #"axis");
        level.var_8befe6c5 = 0;
        var_a663db83 = struct::get_array("s_enemy_tripwire_loc", "targetname");
        foreach (s_loc in var_a663db83) {
            dir = anglestoforward(s_loc.angles);
            dir = vectornormalize(dir);
            velocity = vectorscale(dir, 1000);
            var_9d5f453 = level.var_2a5b7055 magicgrenadeplayer(getweapon(#"eq_tripwire"), s_loc.origin, velocity);
            waitresult = var_9d5f453 waittill(#"stationary");
            var_9d5f453.hitnormal = waitresult.normal;
            var_9d5f453.hitpos = waitresult.position;
            var_9d5f453.owner = level.var_2a5b7055;
            var_9d5f453.team = level.var_2a5b7055.team;
            var_9d5f453 setcandamage(1);
            var_9d5f453.maxhealth = 100000;
            var_9d5f453.health = var_9d5f453.maxhealth;
            var_9d5f453 setteam(level.var_2a5b7055.team);
            var_9d5f453 thread function_59bc0dd3(level.var_2a5b7055);
            var_9d5f453 thread function_b93032f4();
        }
        level.var_2a5b7055 = undefined;
        level thread ct_bots::deactivate_bots();
        ct_vo::function_3ca1b77d();
        e_player = getplayers()[0];
        e_player ct_bots::function_fd2d220e();
        e_player thread ct_utils::function_61c3d59c(#"hash_4a4903aefcea3a7e", undefined);
        level.var_4f54bc60 = undefined;
        while (level.var_8befe6c5 < 2) {
            if (isdefined(level.var_4f54bc60) && level.var_4f54bc60) {
                break;
            }
            e_player = getplayers()[0];
            if (!isalive(e_player)) {
                break;
            }
            waitframe(1);
        }
        function_a710c695();
        if (!(isdefined(level.var_4f54bc60) && level.var_4f54bc60)) {
            if (isalive(e_player)) {
                break;
            }
            while (true) {
                e_player = getplayers()[0];
                if (isalive(e_player)) {
                    break;
                }
                waitframe(1);
            }
        }
    }
    level notify(#"hash_a3fad099edf93d6");
    e_player = getplayers()[0];
    if (isalive(e_player)) {
        e_player ct_bots::function_26d45f32(1);
    }
    e_player allowprone(1);
    level notify(#"stop_nag");
    level notify(#"start_last_tripwire_collision_enter");
    ct_utils::function_c2a10fc();
    waitframe(1);
    wait(1);
    ct_vo::function_3ca1b77d();
    level notify(#"stop_last_tripwire_collision_enter");
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xa31c0606, Offset: 0x32d8
// Size: 0x1bc
function function_9d35e9f6() {
    level endon(#"combattraining_logic_finished", #"hash_a3fad099edf93d6");
    var_9d1c4486 = getent("vol_enemy_tripwire", "targetname");
    while (true) {
        while (true) {
            e_player = getplayers()[0];
            if (e_player istouching(var_9d1c4486)) {
                break;
            }
            waitframe(1);
        }
        e_player = getplayers()[0];
        e_player dodamage(e_player.health + 100, e_player.origin);
        while (level.tripwires.size) {
            for (i = 0; i < level.tripwires.size; i++) {
                mine = level.tripwires[i];
                mine gadget_tripwire::function_9e546fb3(e_player, getweapon(#"incendiary_grenade"), undefined, undefined);
            }
        }
        while (!isalive(e_player)) {
            waitframe(1);
        }
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 1, eflags: 0x0
// Checksum 0xa8f8ca5d, Offset: 0x34a0
// Size: 0x1cc
function function_59bc0dd3(player) {
    self.var_db7f2def = self gettagorigin("tag_fx");
    self.owner = player;
    self.team = player.team;
    self clientfield::set("friendlyequip", 1);
    self influencers::create_entity_enemy_influencer("claymore", player.team);
    self.destroyablebytrophysystem = 0;
    self.detonating = 0;
    wait(level.var_c72e8c51.var_e14f5fca);
    player notify(#"tripwire_spawn", {#tripwire:self});
    self clientfield::set("tripwire_state", 1);
    if (!isdefined(level.tripwires)) {
        level.tripwires = [];
    } else if (!isarray(level.tripwires)) {
        level.tripwires = array(level.tripwires);
    }
    level.tripwires[level.tripwires.size] = self;
    level gadget_tripwire::function_d77f9442();
    self thread gadget_tripwire::function_15de8daf();
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xef5b5137, Offset: 0x3678
// Size: 0x1fa
function function_afa281f4() {
    level endon(#"combattraining_logic_finished");
    level notify(#"start_last_tripwire_collision");
    level notify(#"start_last_tripwire_collision_exit");
    level thread function_4613d123();
    level thread ct_vo::function_14b08e49(array(#"hash_1912c92a46f64dd7"), "stop_nag");
    ct_utils::function_93c86846(undefined, "s_nomad_tripwire_obj3_goto", array(#"ability_dog", #"eq_tripwire"), 0, undefined, 45);
    level notify(#"stop_nag");
    ct_utils::function_e9ab1003("s_nomad_tripwire_obj3_goto");
    level notify(#"start_last_tripwire_collision_enter");
    level notify(#"vo_callout");
    level.var_4255e463 = 0;
    level.var_e882762e = 1;
    function_45d34164(array(#"hash_222b4b892fd765a2"), 40, #"hash_72958f658edea7f4", 2, undefined, 0);
    function_45d34164(undefined, 40, #"hash_72a68f658eed1b27", 2, undefined, 1);
    ct_utils::function_d00e0eeb();
    level.var_e882762e = undefined;
    level.var_4255e463 = undefined;
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xcab8bc33, Offset: 0x3880
// Size: 0x59c
function function_244e4db8() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003(undefined);
    level.var_347a87db = 1;
    level notify(#"stop_last_tripwire_collision_exit");
    level notify(#"start_call_juno_collision");
    level notify(#"start_juno_patrol_enter_collision");
    level notify(#"start_juno_patrol_temp_collision");
    level thread ct_vo::function_14b08e49(array(#"hash_1912c92a46f64dd7"), "stop_nag");
    ct_utils::function_93c86846(undefined, "s_call_juno_obj", array(#"ability_dog", #"eq_tripwire"), 0, undefined, 40);
    level notify(#"stop_nag");
    level notify(#"start_last_tripwire_collision_exit");
    ct_utils::function_e9ab1003("s_call_juno_obj");
    level notify(#"stop_last_tripwire_collision");
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584(array(#"hash_5edca81ea7bbda1"), 1);
    level.var_e72728b8 = undefined;
    wait(0.1);
    e_player = getplayers()[0];
    e_player thread ct_utils::function_61c3d59c(#"hash_49793089f606d707", undefined);
    level thread function_ba6c3061();
    e_player = getplayers()[0];
    var_7b26211b = e_player gamepadusedlast() ? #"hash_2fd411131c53cb1d" : #"hash_122631a880bd0d73";
    e_player thread ct_utils::function_61c3d59c(var_7b26211b, undefined);
    level thread ct_vo::function_14b08e49(array(#"hash_3879189c855ae28"), "stop_nag");
    while (!isdefined(level.e_dog)) {
        waitframe(1);
    }
    level notify(#"stop_nag");
    ct_utils::function_c2a10fc();
    waitframe(1);
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584(array(#"hash_5edc981ea7bbbee"), 1);
    level thread ct_vo::function_14b08e49(array(#"hash_1912c92a46f64dd7"), "stop_nag");
    ct_utils::function_93c86846(undefined, "s_call_juno_obj_2", array(#"ability_dog", #"eq_tripwire"), 0, undefined, 40);
    level notify(#"stop_nag");
    ct_vo::function_831e0584(array(#"hash_d3ce181ee3da6b6"), 1);
    level.var_7b46025 = struct::get_array("s_nomad_dog_target", "targetname");
    level.var_47cd3e56 = 0;
    level thread ct_bots::activate_bots(level.var_7b46025.size, #"axis");
    level notify(#"stop_call_juno_collision");
    e_player = getplayers()[0];
    e_player thread ct_bots::function_fd2d220e(0);
    e_player = getplayers()[0];
    e_player thread ct_utils::function_61c3d59c(#"hash_6b153adcd9c8cfcb", undefined);
    wait(1);
    level notify(#"hash_16cac42598bc6a4");
    while (true) {
        var_e8d6f89 = ct_bots::function_2a8fc6b2();
        if (!var_e8d6f89) {
            break;
        }
        waitframe(1);
    }
    wait(0.1);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xfe54d8c1, Offset: 0x3e28
// Size: 0xc4
function function_ba6c3061() {
    level endon(#"combattraining_logic_finished");
    level waittill(#"bot_kill");
    level thread ct_vo::function_831e0584(array(#"hash_291be681fe8fa375"));
    level waittill(#"bot_kill");
    wait(0.5);
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584(array(#"hash_291be581fe8fa1c2"));
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x18acbac1, Offset: 0x3ef8
// Size: 0x54c
function function_2e9a1486() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003(undefined);
    level notify(#"start_end_area_collision");
    level notify(#"start_bomb_start_collision");
    level thread ct_vo::function_14b08e49(array(#"hash_1912c92a46f64dd7"), "stop_nag");
    ct_utils::function_93c86846(undefined, "s_attack_dog_patrol_obj", undefined, 0, undefined, 50);
    level notify(#"stop_nag");
    level notify(#"start_juno_patrol_collision");
    level notify(#"stop_juno_patrol_temp_collision");
    ct_utils::function_e9ab1003("s_attack_dog_patrol_obj");
    ct_vo::function_3ca1b77d();
    level.var_347a87db = undefined;
    e_player = getplayers()[0];
    var_4a97c467 = e_player gamepadusedlast() ? #"hash_72bca7ad9dae4395" : #"hash_21a511b98e1e87eb";
    e_player thread ct_utils::function_61c3d59c(var_4a97c467, array(#"hash_291be481fe8fa00f"));
    level thread ct_vo::function_14b08e49(array(#"hash_38f30198c1a775ac"), "stop_nag");
    while (true) {
        if (isalive(level.e_dog) && level.e_dog ai_state::is_state(0)) {
            break;
        }
        waitframe(1);
    }
    level notify(#"stop_nag");
    e_player thread ct_utils::function_61c3d59c(#"hash_31e91dea77d85f86", undefined);
    ct_utils::function_c2a10fc();
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584(array(#"hash_291be381fe8f9e5c", #"hash_291be281fe8f9ca9", #"hash_291be181fe8f9af6"), 1);
    level notify(#"stop_juno_patrol_collision");
    level notify(#"stop_juno_patrol_enter_collision");
    level notify(#"start_end_area_enterance_collision");
    level thread ct_vo::function_831e0584(array(#"hash_291bee81fe8fb10d"), 1);
    e_player = getplayers()[0];
    e_player thread ct_utils::function_61c3d59c(#"hash_64c6ddcaa6c7aae1", undefined);
    level.var_7b46025 = struct::get_array("s_juno_final_event_bot", "targetname");
    level.var_47cd3e56 = 0;
    level thread ct_bots::activate_bots(level.var_7b46025.size, #"axis");
    ct_utils::function_9aca2fa0("ct_action2");
    wait(0.1);
    ct_utils::function_d00e0eeb();
    if (isalive(level.e_dog)) {
        level.e_dog abort_dog();
    }
    level.var_e72728b8 = array(#"ability_dog", #"eq_tripwire");
    ct_utils::function_9aca2fa0("ct_action");
    ct_utils::function_c2a10fc();
    waitframe(1);
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584(array(#"hash_227578991948ff6d"), 1);
    wait(0.1);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2cb7cff4, Offset: 0x4450
// Size: 0x114
function function_6d0e5fa5() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    while (true) {
        e_player = ct_utils::get_player();
        if (!e_player ct_utils::can_see(self.origin + (0, 0, 20), 0)) {
            break;
        }
        waitframe(1);
    }
    s_loc = struct::get("s_juno_kill_spot", "targetname");
    self forceteleport(s_loc.origin, self.angles);
    waitframe(1);
    self dodamage(self.health + 100, self.origin);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xd92b38e4, Offset: 0x4570
// Size: 0x914
function function_34696b67() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003("s_defuse_bomb_obj");
    e_player = getplayers()[0];
    e_player thread ct_bots::function_fd2d220e(0);
    level thread ct_vo::function_14b08e49(array(#"hash_1912c92a46f64dd7"), "stop_nag");
    ct_utils::function_93c86846(undefined, "s_defuse_bomb_obj", undefined, 0, undefined, 40);
    level notify(#"stop_nag");
    ct_utils::function_e9ab1003("s_defuse_bomb_obj");
    level notify(#"stop_bomb_start_collision");
    level notify(#"start_bomb_defend_collision");
    level thread ct_vo::function_831e0584(array(#"hash_758836b142ae69e2"), 1);
    ct_utils::function_9aca2fa0("ct_action2");
    s_loc = struct::get("s_defuse_bomb_loc", "targetname");
    e_bomb = util::spawn_model("p8_mp_bomb_crate_whole", s_loc.origin, s_loc.angles);
    level.var_efb41f70 = 0;
    ct_utils::function_9d1fc273(e_bomb, &function_ae12f07c, #"hash_7b74e27a1a2facf8", 5);
    e_bomb.gameobject.onbeginuse = &function_d2b15099;
    e_bomb.gameobject.useweapon = getweapon(#"briefcase_bomb_defuse");
    while (true) {
        level.var_aadd8b8f = undefined;
        s_loc = struct::get("s_bomb_waypoint", "targetname");
        waypoint = ct_utils::create_waypoint(#"hash_43f27b76957da4d2", s_loc.origin, s_loc.angles, #"any", undefined, undefined, undefined);
        s_look = struct::get("s_bomb_waypoint", "targetname");
        var_56fff846 = e_player gamepadusedlast() ? #"hash_6343136e3fbbb0fe" : #"hash_6dc62affb1ccee6e";
        level thread ct_vo::function_accb34a7(s_look.origin, 750, array(#"hash_416a0e7170369747"), "bomb_cleanup", var_56fff846);
        n_bomb_timer = int(gettime() + 1000 + int(60 * 1000));
        setmatchflag("bomb_timer_a", 1);
        setbombtimer("A", n_bomb_timer);
        e_player = getplayers()[0];
        e_player thread ct_utils::function_61c3d59c(#"hash_5097457fdcdb6265", undefined);
        level.var_7b46025 = struct::get_array("s_bomb_first_wave", "targetname");
        level.var_47cd3e56 = 0;
        level thread ct_bots::activate_bots(level.var_7b46025.size, #"axis");
        wait(0.5);
        level.var_aadd8b8f = [];
        level.var_aadd8b8f[level.var_aadd8b8f.size] = struct::get("s_bomb_defend_path1", "targetname");
        level.var_aadd8b8f[level.var_aadd8b8f.size] = struct::get("s_bomb_defend_path2", "targetname");
        level.var_aadd8b8f[level.var_aadd8b8f.size] = struct::get("s_bomb_defend_path3", "targetname");
        level.var_68e1f6ff = 0;
        level.var_7b46025 = struct::get_array("s_bomb_protect_wave", "targetname");
        level.var_47cd3e56 = 0;
        level thread ct_bots::activate_bots(level.var_7b46025.size, #"axis");
        b_timeout = 0;
        while (true) {
            var_f08fde43 = function_4c27be22("A");
            currenttime = gettime();
            if (currenttime > var_f08fde43) {
                b_timeout = 1;
                break;
            }
            if (isdefined(level.var_efb41f70) && level.var_efb41f70) {
                break;
            }
            waitframe(1);
        }
        waypoint ct_utils::function_f9ed304d();
        if (b_timeout) {
            level notify(#"bomb_cleanup");
            ct_utils::function_c561377e();
            level thread ct_vo::function_831e0584(array(#"hash_26c398139ec1094b"), 1);
            e_bomb.gameobject gameobjects::disable_object();
            e_player = getplayers()[0];
            ct_utils::function_a61ebb46(function_8b1a219a() ? #"hash_43778f918c2c137d" : #"hash_1ed0f6809be98e43");
            ct_utils::function_79957328(undefined);
            e_bomb.gameobject gameobjects::enable_object();
            continue;
        }
        break;
    }
    ct_utils::function_9aca2fa0("ct_action");
    level notify(#"bomb_cleanup");
    level notify(#"start_earn_killstreak_collision");
    e_bomb.gameobject gameobjects::function_2efe0342();
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
    ct_utils::function_c2a10fc();
    waitframe(1);
    e_player = getplayers()[0];
    e_player thread ct_utils::function_61c3d59c(#"hash_6eea3c9cbec25afe", undefined);
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584(array(#"hash_1c2ceb0dec89955d", #"hash_1c2cea0dec8993aa"), 1);
    ct_utils::function_c2a10fc();
    wait(0.1);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 1, eflags: 0x0
// Checksum 0x87524c7c, Offset: 0x4e90
// Size: 0x6c
function function_d2b15099(player) {
    player playsound(#"mpl_sd_bomb_defuse");
    player thread setbomboverheatingafterweaponchange(self, 0, 0);
    player playsound(#"fly_bomb_raise_plr");
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 3, eflags: 0x0
// Checksum 0xe6452ccb, Offset: 0x4f08
// Size: 0xc4
function setbomboverheatingafterweaponchange(useobject, overheated, heat) {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
    waitresult = self waittill(#"weapon_change");
    if (waitresult.weapon == useobject.useweapon) {
        self setweaponoverheating(overheated, heat, waitresult.weapon);
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x755b62c7, Offset: 0x4fd8
// Size: 0x6f4
function function_76739a65() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003("s_player_ks_respawn_loc");
    setdvar(#"hash_3e06b14c41136e95", 0);
    ct_vo::function_831e0584(array(#"hash_1c2ce90dec8991f7"), 1);
    n_bomb_timer = int(gettime() + 1000 + int(15 * 1000));
    setmatchflag("bomb_timer_a", 1);
    setbombtimer("A", n_bomb_timer);
    ct_utils::function_9aca2fa0("ct_action2");
    e_player = getplayers()[0];
    e_player thread ct_utils::function_61c3d59c(#"hash_4802bfcab17b969e", undefined);
    wait(3);
    level thread ct_vo::function_831e0584(array(#"hash_e5c99a0bb694ced", #"hash_e5c98a0bb694b3a"), 1);
    wait(15 - 3);
    ct_utils::function_c2a10fc();
    callback::on_player_killed_with_params(&ct_utils::function_944e4110);
    ct_utils::function_e44c5b8e(#"ultimate_turret", 10);
    level.var_28cfc859 = 100;
    e_player = getplayers()[0];
    e_player thread ct_utils::function_68848e5("ultimate_turret");
    e_player thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_KillToEarnNomadKS");
    e_player ct_utils::function_80bf685b(0);
    level.var_a934617 = [];
    level.var_a934617[level.var_a934617.size] = struct::get("s_ks_righ_path1", "targetname");
    level.var_a934617[level.var_a934617.size] = struct::get("s_ks_righ_path2", "targetname");
    level.var_a934617[level.var_a934617.size] = struct::get("s_ks_left_path1", "targetname");
    level.var_a934617[level.var_a934617.size] = struct::get("s_ks_left_path2", "targetname");
    level.n_path_index = 0;
    while (!(isdefined(e_player.var_d5d10814) && e_player.var_d5d10814)) {
        e_player = getplayers()[0];
        e_player thread ct_utils::function_80bf685b(level.var_de284b17);
        var_93781b01 = 0;
        level.var_e6db911d = 0;
        level.var_7b46025 = struct::get_array("s_bomb_killstreak_bots", "targetname");
        level.var_47cd3e56 = 0;
        level thread ct_bots::activate_bots(level.var_7b46025.size, #"axis");
        while (true) {
            e_player = getplayers()[0];
            e_player thread ct_utils::function_80bf685b(level.var_de284b17);
            level.var_a86320e8 = gettime() / 1000;
            if (!isalive(e_player)) {
                while (!isalive(e_player)) {
                    waitframe(1);
                }
                ct_utils::function_e44c5b8e(#"ultimate_turret", 10);
                e_player thread ct_utils::function_68848e5("ultimate_turret");
            }
            if (!var_93781b01 && level.var_de284b17 >= 500) {
                level thread ct_vo::function_831e0584(array(#"hash_59ce377404e907df"), 1);
                var_93781b01 = 1;
            }
            if (isdefined(e_player.var_d5d10814) && e_player.var_d5d10814) {
                break;
            }
            n_time = gettime() / 1000;
            dt = n_time - level.var_a86320e8;
            if (dt > 10) {
                level thread ct_vo::function_41e59aeb(array(#"hash_63b0c7b2095df698"), 1);
                level.var_a86320e8 = n_time + 4;
            }
            waitframe(1);
        }
    }
    level.var_e6db911d = 1;
    waitframe(1);
    ct_utils::function_c561377e();
    setdvar(#"hash_3e06b14c41136e95", 1);
    level.var_28cfc859 = undefined;
    ct_vo::function_831e0584(array(#"hash_66d8097a378fccfb", #"hash_66d8087a378fcb48"), 1);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf6e16f52, Offset: 0x56d8
// Size: 0x7ec
function function_eadc9c91() {
    level endon(#"combattraining_logic_finished");
    e_coll = getent("ending_block_path_collision", "targetname");
    e_coll disconnectpaths();
    var_96265bc2 = 0;
    var_aab830d9 = 0;
    while (!var_aab830d9) {
        e_player = getplayers()[0];
        var_f663fd65 = e_player gamepadusedlast() ? #"hash_3e25c78f422d3e01" : #"hash_27c58526d71a5407";
        e_player thread ct_utils::function_61c3d59c(var_f663fd65, undefined);
        if (!var_96265bc2) {
            setdvar(#"hash_3e06b14c41136e95", 0);
            ct_utils::function_daa27144();
        }
        e_player = getplayers()[0];
        e_player thread ct_utils::function_61c3d59c(#"hash_45c85c60b2048c8b", undefined);
        level thread function_b92c6949();
        level.var_7cf83a79 = [];
        level.var_7cf83a79[level.var_7cf83a79.size] = struct::get("s_ks_righ_path1", "targetname");
        level.var_7cf83a79[level.var_7cf83a79.size] = struct::get("s_ks_righ_path2", "targetname");
        level.var_e4e874ae = 0;
        level.var_9f00392 = [];
        level.var_9f00392[level.var_9f00392.size] = struct::get("s_ks_left_path1", "targetname");
        level.var_9f00392[level.var_9f00392.size] = struct::get("s_ks_left_path2", "targetname");
        level.var_bc487d14 = 0;
        level.var_628c0318 = 0;
        level thread function_1ad0463f();
        while (true) {
            n_bomb_timer = int(gettime() + 1000 + int(60 * 1000));
            setmatchflag("bomb_timer_a", 1);
            setbombtimer("A", n_bomb_timer);
            waitframe(1);
            e_player = getplayers()[0];
            e_player thread ct_utils::function_61c3d59c(#"hash_1ad16d82a0e3a556", undefined);
            if (isdefined(level.var_6aeec601)) {
                wait(level.var_6aeec601);
            }
            level.var_e6db911d = 0;
            level.var_7b46025 = struct::get_array("s_attack_turret_bots", "targetname");
            level.var_47cd3e56 = 0;
            level thread ct_bots::activate_bots(level.var_7b46025.size, #"axis");
            level thread function_c8592985();
            var_5fbb94b8 = 0;
            var_1c2eeef4 = 0;
            while (true) {
                if (isdefined(level.var_81db1765) && !var_5fbb94b8) {
                    e_player = getplayers()[0];
                    e_player thread ct_utils::function_61c3d59c(#"hash_3b92b20f62b78632", undefined);
                    var_5fbb94b8 = 1;
                }
                e_player = getplayers()[0];
                if (!isalive(e_player)) {
                    level.var_e6db911d = 1;
                    ct_utils::function_c561377e();
                    ct_utils::function_c2a10fc();
                    ct_utils::function_fdfeb384();
                    setmatchflag("bomb_timer_a", 0);
                    setbombtimer("A", 0);
                    e_player thread ct_utils::function_8f04870f(undefined);
                    wait(0.1);
                    if (isdefined(e_player.var_85988a58)) {
                        foreach (e_turret in e_player.var_85988a58) {
                            e_turret dodamage(e_turret.health + 100, e_turret.origin);
                        }
                    }
                    ct_utils::function_e44c5b8e(#"ultimate_turret", 0, 1);
                    wait(0.1);
                    ct_utils::function_daa27144();
                    setdvar(#"hash_3e06b14c41136e95", 0);
                    level.var_6aeec601 = 5;
                    var_96265bc2++;
                    var_1c2eeef4 = 0;
                    break;
                }
                var_f08fde43 = function_4c27be22("A");
                currenttime = gettime();
                if (currenttime > var_f08fde43) {
                    var_1c2eeef4 = 1;
                    var_aab830d9 = 1;
                    break;
                }
                waitframe(1);
            }
            level.var_e6db911d = 1;
            ct_utils::function_c2a10fc();
            setbombtimer("A", 0);
            setmatchflag("bomb_timer_a", 0);
            if (isdefined(var_1c2eeef4) && var_1c2eeef4) {
                ct_utils::function_9aca2fa0("ct_endgame");
                break;
            }
        }
        level.var_e6db911d = 1;
        waitframe(1);
        ct_utils::function_c561377e();
    }
    level.var_6aeec601 = undefined;
    ct_vo::function_831e0584(array(#"hash_3892b48206cac33f"), 1);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x8ef41b42, Offset: 0x5ed0
// Size: 0x22
function function_c8592985() {
    level.var_f41807c4 = 1;
    wait(4);
    level.var_f41807c4 = undefined;
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf738b690, Offset: 0x5f00
// Size: 0x9c
function strike_team() {
    level endon(#"combattraining_logic_finished");
    wait(1);
    e_player = getplayers()[0];
    e_player thread ct_utils::function_2b52aef5(0.01);
    wait(10);
    ct_vo::function_41e59aeb(array(#"hash_301efcc982f849ed"), 1);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xa6ea87f6, Offset: 0x5fa8
// Size: 0x6c
function function_1ad0463f() {
    level endon(#"combattraining_logic_finished");
    while (level.var_628c0318 < 3) {
        waitframe(1);
    }
    ct_vo::function_41e59aeb(array(#"hash_47fabed8e8bf606f"), 1);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xbaea70fb, Offset: 0x6020
// Size: 0x180
function function_b92c6949() {
    level endon(#"combattraining_logic_finished");
    level.var_81db1765 = undefined;
    while (true) {
        e_player = getplayers()[0];
        waitresult = e_player waittill(#"ultimate_turret_deployed");
        level.var_81db1765 = waitresult.turret;
        e_player = getplayers()[0];
        e_player thread ct_bots::function_fd2d220e(0);
        var_5e0c05fc = getent("vol_turret_good_loc", "targetname");
        if (level.var_81db1765 istouching(var_5e0c05fc)) {
            ct_vo::function_41e59aeb(array(#"hash_31fd2c9553e91845"), 1);
            continue;
        }
        ct_vo::function_41e59aeb(array(#"hash_3a50289d60d95b93"), 1);
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 1, eflags: 0x0
// Checksum 0xd321f22, Offset: 0x61a8
// Size: 0x30
function function_ae12f07c(player) {
    level.var_efb41f70 = 1;
    level notify(#"start_bomb_diffused_collision");
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x5944f202, Offset: 0x61e0
// Size: 0x6e
function function_6e98aea7() {
    self endon(#"death");
    level endon(#"combattraining_logic_finished");
    while (true) {
        waitresult = self waittill(#"tripwire_spawn");
        level.var_204eb642 = waitresult.tripwire;
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 2, eflags: 0x0
// Checksum 0x1bc81e95, Offset: 0x6258
// Size: 0x23a
function function_4f54cf00(s_loc, var_ebb5bb71) {
    level endon(#"combattraining_logic_finished");
    ct_vo::function_3ca1b77d();
    waitframe(1);
    if (var_ebb5bb71 == 0) {
        level.var_632734b1 = 0;
    } else {
        level.var_632734b1 = 1;
    }
    e_mine = ct_utils::function_9a283f84(s_loc, #"hash_22e8d1ae72884594");
    e_mine setscale(1.5);
    v_loc = (s_loc.origin[0], s_loc.origin[1], s_loc.origin[2] + 10);
    waypoint = ct_utils::create_waypoint(#"hash_43f27b76957da4d2", v_loc, s_loc.angles, #"any", undefined, undefined, undefined);
    level notify(#"vo_callout");
    level.var_e72728b8 = array(#"ability_dog");
    function_432f35f8(s_loc);
    level.var_e72728b8 = array(#"ability_dog", #"eq_tripwire");
    level notify(#"hash_32494c3c40fc33cb");
    level notify(#"hash_6fc151c22f7e43a8");
    e_mine delete();
    waypoint ct_utils::function_f9ed304d();
    waitframe(1);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 1, eflags: 0x0
// Checksum 0x805a52dc, Offset: 0x64a0
// Size: 0x354
function function_432f35f8(v_obj) {
    level endon(#"combattraining_logic_finished");
    level.var_e72728b8 = array(#"ability_dog");
    var_e3df6002 = anglestoup(v_obj.angles);
    b_waiting = 1;
    while (b_waiting) {
        if (isdefined(level.var_204eb642)) {
            var_8167b460 = 0;
            v_dir = anglestoforward(level.var_204eb642.angles);
            if (abs(v_dir[2]) < 0.1) {
                var_8167b460 = 1;
            }
            v_up = anglestoup(level.var_204eb642.angles);
            dp = vectordot(v_up, var_e3df6002);
            if (dp < 0.95) {
                var_8167b460 = 1;
            }
            n_height_diff = abs(level.var_204eb642.origin[2] - v_obj.origin[2]);
            if (n_height_diff > 22) {
                var_8167b460 = 1;
            }
            n_dist = distance(level.var_204eb642.origin, v_obj.origin);
            if (!var_8167b460 && n_dist < 75) {
                level.var_204eb642 notsolid();
                level.var_204eb642 = undefined;
                b_waiting = 0;
                break;
            } else {
                e_player = getplayers()[0];
                level.var_204eb642 gadget_tripwire::function_9e546fb3(e_player, getweapon(#"incendiary_grenade"), undefined, undefined);
                if (!ct_vo::function_5d127774()) {
                    a_str_vo = array("vox_tvoi_tutor_noma_slide_4_miss");
                    level thread ct_vo::function_831e0584(a_str_vo, 1);
                }
            }
        }
        waitframe(1);
    }
    level.var_e72728b8 = array(#"ability_dog", #"eq_tripwire");
    ct_vo::function_3ca1b77d();
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xcfdb8194, Offset: 0x6800
// Size: 0x6c
function function_e19de01() {
    str_name = "s_nomad_easy_enemy_" + level.var_ad7c0539;
    var_40118c33 = struct::get_array(str_name, "targetname");
    level thread ct_bots::activate_bots(var_40118c33.size, #"axis");
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 3, eflags: 0x0
// Checksum 0x606631ea, Offset: 0x6878
// Size: 0x27c
function function_3b95089d(var_df7e07e5, var_7c876c46, var_2e663c1b) {
    self endon(#"death");
    self val::set(#"bot_tripwire", "ignoreall", 1);
    self thread function_b7ff9e87();
    self thread function_dfc80de0();
    str_name = "s_nomad_easy_enemy_" + level.var_ad7c0539;
    var_df04904a = struct::get_array(str_name, "targetname");
    if (var_df04904a.size == 1) {
        var_6048025d = var_df04904a[0];
    } else {
        var_6048025d = var_df04904a[level.var_4255e463];
        level.var_4255e463++;
    }
    self setorigin(var_6048025d.origin);
    self setplayerangles(var_6048025d.angles);
    waitframe(1);
    self clientfield::set("enemy_keyline_render", 1);
    for (i = 0; i < var_df7e07e5.size; i++) {
        if (isdefined(var_2e663c1b) && var_2e663c1b == i) {
            level notify(var_7c876c46);
        }
        s_loc = struct::get(var_df7e07e5[i], "targetname");
        self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
        while (true) {
            n_dist = distance(self.origin, s_loc.origin);
            if (n_dist < 100) {
                break;
            }
            waitframe(1);
        }
    }
    if (isdefined(var_7c876c46)) {
        level notify(var_7c876c46);
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6851a989, Offset: 0x6b00
// Size: 0x11c
function function_dfc80de0() {
    self endon(#"death");
    wait(2);
    var_66a9afd7 = 0;
    var_545d6c28 = self.origin;
    while (true) {
        n_dist = distance(var_545d6c28, self.origin);
        if (n_dist <= 2) {
            var_66a9afd7++;
            if (var_66a9afd7 >= 8) {
                level notify(#"tripwire_kill");
                level flag::set("tripwire_kill");
                level function_f9d20586(self.origin, 500);
                self thread ct_utils::function_3e0767e2(0);
            }
        } else {
            var_66a9afd7 = 0;
        }
        var_545d6c28 = self.origin;
        waitframe(1);
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x295c80d7, Offset: 0x6c28
// Size: 0x44
function function_b7ff9e87() {
    self waittill(#"death");
    self val::reset(#"hash_3ae9db07bc956789", "ignoreall");
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x72334f67, Offset: 0x6c78
// Size: 0x1fc
function function_89eab9e8() {
    self endon(#"death");
    s_loc = level.var_7b46025[level.var_47cd3e56];
    level.var_47cd3e56++;
    if (level.var_47cd3e56 >= level.var_7b46025.size) {
        level.var_47cd3e56 = 0;
    }
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self val::set(#"dog_meat", "ignoreme", 1);
    self val::set(#"dog_meat", "ignoreall", 1);
    s_target = struct::get(s_loc.target, "targetname");
    waitframe(1);
    self clientfield::set("enemy_keyline_render", 1);
    s_path = struct::get(s_target.script_noteworthy, "targetname");
    self thread ct_utils::function_1e7b75f2(s_path);
    level waittill(#"hash_16cac42598bc6a4");
    self val::reset(#"dog_meat", "ignoreme");
    self val::reset(#"dog_meat", "ignoreall");
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x7afcf654, Offset: 0x6e80
// Size: 0xdc
function function_a657cce9() {
    s_loc = level.var_7b46025[level.var_47cd3e56];
    level.var_47cd3e56++;
    if (level.var_47cd3e56 >= level.var_7b46025.size) {
        level.var_47cd3e56 = 0;
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    s_path = struct::get(s_loc.script_noteworthy, "targetname");
    self thread ct_utils::function_1e7b75f2(s_path);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x5e4033c5, Offset: 0x6f68
// Size: 0x1de
function function_47f4423a() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    s_loc = level.var_7b46025[level.var_47cd3e56];
    level.var_47cd3e56++;
    if (level.var_47cd3e56 >= level.var_7b46025.size) {
        level.var_47cd3e56 = 0;
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    self thread ct_utils::function_5b59f3b7(self.origin, self.angles, 32);
    while (true) {
        e_player = getplayers()[0];
        self.var_2925fedc = e_player.origin;
        b_can_see = self ct_utils::can_see(e_player.origin + (0, 0, 40), 1);
        if (b_can_see) {
            break;
        }
        waitframe(1);
    }
    while (true) {
        e_player = getplayers()[0];
        self thread ct_utils::function_5b59f3b7(e_player.origin, e_player.angles, 200);
        wait(1);
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc02597a2, Offset: 0x7150
// Size: 0xb6
function function_a710c695() {
    if (isdefined(level.var_e882762e) && level.var_e882762e) {
        return;
    }
    foreach (tripwire in level.tripwires) {
        if (!isdefined(tripwire)) {
            continue;
        }
        tripwire delete();
    }
    level.tripwires = [];
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x28fe152b, Offset: 0x7210
// Size: 0x154
function function_ccbcdbce() {
    level waittill(#"vo_callout");
    a_str_vo = array("vox_tvoi_tutor_noma_slide_4_0");
    level thread ct_vo::function_831e0584(a_str_vo, 1);
    level waittill(#"vo_callout");
    a_str_vo = array("vox_tvoi_tutor_noma_slide_5_0");
    level thread ct_vo::function_41e59aeb(a_str_vo, 1);
    level waittill(#"vo_callout");
    a_str_vo = array("vox_tvoi_tutor_noma_slide_6_0");
    level thread ct_vo::function_41e59aeb(a_str_vo, 1);
    level waittill(#"vo_callout");
    wait(1);
    a_str_vo = array("vox_tvoi_tutor_noma_slide_7_0");
    ct_vo::function_41e59aeb(a_str_vo, 1);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xacfb2120, Offset: 0x7370
// Size: 0xb4
function function_f606c349() {
    level waittill(#"vo_callout");
    a_str_vo = array(#"hash_7c28af2622f285e4");
    ct_vo::function_831e0584(a_str_vo, 1);
    level waittill(#"hash_622db456eabd4e20");
    a_str_vo = array("vox_tvoi_tutor_noma_slide_9_0");
    ct_vo::function_831e0584(a_str_vo, 1);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xcdb7dbb4, Offset: 0x7430
// Size: 0x184
function function_4613d123() {
    level waittill(#"stop_nag");
    level thread ct_vo::function_831e0584(array(#"hash_1a1b9c4d540e83a2", #"hash_1a1b9d4d540e8555"), 1);
    level waittill(#"stop_nag");
    level thread ct_vo::function_41e59aeb(array(#"hash_1a1b9a4d540e803c"), 1);
    level waittill(#"tripwire_placed");
    level waittill(#"tripwire_placed");
    level thread ct_vo::function_41e59aeb(array(#"hash_1a1b9b4d540e81ef"), 1);
    level waittill(#"tripwire_kill");
    ct_vo::function_831e0584(array(#"hash_3af123c4e08bf1f"), 1);
    level waittill(#"tripwire_kill");
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x28d843bd, Offset: 0x75c0
// Size: 0x64
function function_c37459ae() {
    e_player = getplayers(#"allies")[0];
    e_player thread ct_utils::function_329f9ba6(#"hash_5d87fe6d6b27a8b8", 4, "green", 2);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x37f9d6c7, Offset: 0x7630
// Size: 0x64
function function_ee509880() {
    e_player = getplayers(#"allies")[0];
    e_player thread ct_utils::function_329f9ba6(#"hash_d00efee4664cbdb", 4, "green", 2);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xb978f10f, Offset: 0x76a0
// Size: 0x9e
function function_eb021db8() {
    level endon(#"combattraining_logic_finished");
    while (true) {
        waitresult = level waittill(#"dog_spawned");
        level.e_dog = waitresult.dog;
        if (level.var_ad7c0539 < 7) {
            level.e_dog.health = 1000;
            continue;
        }
        level.e_dog.health = 100;
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 1, eflags: 0x0
// Checksum 0x2ec62c18, Offset: 0x7748
// Size: 0x16c
function function_54f2fd97(b_keyline) {
    self endon(#"death");
    self thread function_1acda64(0.5);
    s_loc = level.var_7b46025[level.var_47cd3e56];
    level.var_47cd3e56++;
    if (level.var_47cd3e56 >= level.var_7b46025.size) {
        level.var_47cd3e56 = 0;
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    s_path = level.var_a934617[level.n_path_index];
    level.n_path_index++;
    if (level.n_path_index >= level.var_a934617.size) {
        level.n_path_index = 0;
    }
    self thread ct_utils::function_1e7b75f2(s_path);
    if (isdefined(b_keyline) && b_keyline) {
        waitframe(1);
        self clientfield::set("enemy_keyline_render", 1);
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x9b83ea7d, Offset: 0x78c0
// Size: 0x234
function function_7a427be() {
    self endon(#"death");
    self thread function_1acda64(0.5);
    s_loc = level.var_7b46025[level.var_47cd3e56];
    level.var_47cd3e56++;
    if (level.var_47cd3e56 >= level.var_7b46025.size) {
        level.var_47cd3e56 = 0;
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    if (s_loc.script_noteworthy == #"right") {
        s_path = level.var_7cf83a79[level.var_e4e874ae];
        level.var_e4e874ae++;
        if (level.var_e4e874ae >= level.var_7cf83a79.size) {
            level.var_e4e874ae = 0;
        }
    } else {
        s_path = level.var_9f00392[level.var_bc487d14];
        level.var_bc487d14++;
        if (level.var_bc487d14 >= level.var_9f00392.size) {
            level.var_bc487d14 = 0;
        }
    }
    wait(0.2);
    self clientfield::set("enemy_keyline_render", 1);
    if (isdefined(level.var_f41807c4) && level.var_f41807c4) {
        self thread ct_utils::function_5b59f3b7(self.origin, self.angles, 32);
        while (isdefined(level.var_f41807c4) && level.var_f41807c4) {
            waitframe(1);
        }
    }
    self thread ct_utils::function_1e7b75f2(s_path);
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6a50148f, Offset: 0x7b00
// Size: 0xd2
function function_e8009771() {
    level endon(#"combattraining_logic_finished");
    while (true) {
        waitresult = level waittill(#"tripwire_detonation");
        var_2249999 = waitresult.entity;
        wait(0.1);
        if (isalive(var_2249999)) {
            var_2249999 thread ct_utils::function_3e0767e2(0);
            level flag::set("tripwire_kill");
            level notify(#"tripwire_kill");
        }
        waitframe(1);
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0x9f42258b, Offset: 0x7be0
// Size: 0x2a8
function function_621ffb5a() {
    level endon(#"hash_6ae51860f226eb91");
    switch (level.var_ad7c0539) {
    case 1:
        var_e0c4ac7b = #"hash_7e28358c078ebb60";
        var_8e7430e4 = #"hash_62b72cf84f007831";
        str_objective = #"hash_7a2e2caa5f180ee3";
        break;
    case 2:
        var_e0c4ac7b = #"hash_3bd663865bd0aed0";
        var_8e7430e4 = #"hash_72f46a598530d181";
        str_objective = #"hash_682b9ed55c6bee93";
        break;
    case 4:
        var_e0c4ac7b = #"hash_463b560d5cd8df69";
        var_8e7430e4 = #"hash_2c401f882edd1300";
        str_objective = #"hash_22835225646d5f24";
        break;
    }
    level.var_448ce02 = 2;
    level.var_632734b1 = 2;
    while (true) {
        if (level.var_448ce02 != level.var_632734b1) {
            e_player = getplayers()[0];
            switch (level.var_632734b1) {
            case 0:
                e_player thread ct_utils::function_61c3d59c(var_8e7430e4, undefined);
                break;
            case 1:
                e_player thread ct_utils::function_61c3d59c(str_objective, undefined);
                break;
            case 3:
                if (!(isdefined(level.var_bc36b6f4) && level.var_bc36b6f4)) {
                    e_player thread ct_utils::function_61c3d59c(var_e0c4ac7b, undefined);
                } else {
                    ct_utils::function_c2a10fc();
                }
                break;
            case 2:
                ct_utils::function_c2a10fc();
                break;
            }
            level.var_448ce02 = level.var_632734b1;
        }
        waitframe(1);
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 2, eflags: 0x0
// Checksum 0x25487c4b, Offset: 0x7e90
// Size: 0xee
function function_f9d20586(v_origin, n_radius) {
    waitframe(1);
    while (level.tripwires.size) {
        for (i = 0; i < level.tripwires.size; i++) {
            mine = level.tripwires[i];
            n_dist = distance(mine.origin, v_origin);
            if (n_dist <= n_radius) {
                mine gadget_tripwire::function_9e546fb3(undefined, getweapon(#"incendiary_grenade"), undefined, undefined);
                break;
            }
        }
    }
}

// Namespace ct_nomad_tutorial/ct_nomad_tutorial
// Params 0, eflags: 0x0
// Checksum 0xbce38fc3, Offset: 0x7f88
// Size: 0x26
function abort_dog() {
    level.e_dog delete();
    level.e_dog = undefined;
}

