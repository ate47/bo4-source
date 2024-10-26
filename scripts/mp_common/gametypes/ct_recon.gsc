#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\ct_ai_blight_father.gsc;
#using scripts\mp_common\gametypes\ct_ai_zombie.gsc;
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_gadgets.gsc;
#using scripts\mp_common\gametypes\ct_recon_tutorial.gsc;
#using scripts\mp_common\gametypes\ct_core.gsc;
#using scripts\mp_common\gametypes\ct_bots.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_6385c57b560a995b;
#using script_4c89d1237266da29;

#namespace ct_recon;

// Namespace ct_recon/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x74e36e5d, Offset: 0x218
// Size: 0x2e4
function event_handler[gametype_init] main(eventstruct) {
    ct_core::function_46e95cc7();
    level.select_character = ct_utils::get_roleindex(#"prt_mp_recon");
    level.var_820c5561 = "RECON";
    ct_utils::function_be3a76b7(level.var_820c5561);
    ct_core::function_fa03fc55();
    clientfield::register("scriptmover", "blood_splat", 1, 1, "int");
    level.ct_recon_enemy_reinforcement = ct_recon_enemy_reinforcement::register("ct_recon_enemy_reinforcement");
    level.ct_recon_melee_vip = ct_recon_melee_vip::register("ct_recon_melee_vip");
    level.var_4c2ecc6f = &function_9fd72af3;
    level.var_c01b7f8b = &function_b5955e0e;
    level.var_49240db3 = &function_633915de;
    level.var_8b9d690e = &function_fb0c03bc;
    level.onspawnplayer = &function_6e336363;
    player::function_cf3aa03d(&function_53d38216);
    level.var_cdb8ae2c = &ct_utils::function_a8da260c;
    level.resurrect_override_spawn = &ct_utils::function_78469779;
    level.var_e31c5d7a = &ct_bots::function_e31c5d7a;
    callback::on_game_playing(&ct_core::function_1e84c767);
    globallogic_spawn::addsupportedspawnpointtype("ct");
    ct_utils::function_6046a5e3(#"ar_stealth_t8", array(#"acog", #"suppressed", #"stalker", #"stalker2"));
    ct_utils::function_c3e647e2(#"pistol_standard_t8");
    level flag::init("combat_training_started");
    if (level.ctdifficulty == 0) {
        level ct_recon_tutorial::init();
    }
}

// Namespace ct_recon/ct_recon
// Params 1, eflags: 0x0
// Checksum 0xee46d5fc, Offset: 0x508
// Size: 0x104
function function_6e336363(predictedspawn) {
    self thread ct_core::function_d2845186();
    spawning::onspawnplayer(predictedspawn);
    if (level.ctdifficulty == 0) {
        self ct_recon_tutorial::function_c9ff0dce();
        return;
    }
    self ct_core::function_45a4f027();
    if (isbot(self)) {
        if (isdefined(level.var_e31c5d7a)) {
            self [[ level.var_e31c5d7a ]]();
        }
        if (isdefined(self.var_9a79d89d)) {
            self setorigin(self.var_9a79d89d);
            self setplayerangles(self.var_5ab7c19c);
        }
    }
}

// Namespace ct_recon/ct_recon
// Params 9, eflags: 0x0
// Checksum 0x83cdb3f, Offset: 0x618
// Size: 0x234
function function_53d38216(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (level.ctdifficulty == 0) {
        self ct_recon_tutorial::function_72ba0df6(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
        return;
    }
    if (self.team == #"allies") {
        self.var_6b6241ac = undefined;
        self.var_45cac770 = undefined;
        self thread ct_utils::function_ee4639dd(-5);
        return;
    }
    if (isdefined(level.var_a8f06531) && level.var_a8f06531) {
        potm::bookmark(#"ct_recon", gettime(), attacker);
        if (isdefined(smeansofdeath) && smeansofdeath == "MOD_MELEE_WEAPON_BUTT") {
            level flag::set("ct_player_success");
        } else {
            level flag::set("ct_fail_objective_killed");
        }
        return;
    }
    if (self !== level.ai_vip) {
        if (isplayer(einflictor)) {
            einflictor thread function_cf613da7();
            einflictor thread ct_utils::function_785eb2ca();
            var_e8d6f89 = ct_bots::function_2a8fc6b2();
            if (var_e8d6f89 > 1) {
                einflictor ct_utils::function_d471f8fa(10, undefined, 1);
                return;
            }
            ct_utils::function_c314f6b1(10);
        }
    }
}

// Namespace ct_recon/ct_recon
// Params 0, eflags: 0x0
// Checksum 0x812171e3, Offset: 0x858
// Size: 0x34
function function_cf613da7() {
    if (!self util::gadget_is_in_use(2)) {
        level thread ct_utils::function_bfa522d1(0);
    }
}

// Namespace ct_recon/ct_recon
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x898
// Size: 0x4
function function_9fd72af3() {
    
}

// Namespace ct_recon/ct_recon
// Params 1, eflags: 0x0
// Checksum 0xc5af6a9a, Offset: 0x8a8
// Size: 0x9c
function function_b5955e0e(mode) {
    ct_utils::function_4f9718b6();
    level.var_a8f06531 = undefined;
    if (isdefined(level.var_1ecfe3a2)) {
        self.var_71a70093 = level.var_1ecfe3a2;
    }
    self thread ct_gadgets::function_19181566();
    var_61ca8276 = 420000;
    self function_9270ab93(0, var_61ca8276);
    self loadout::function_cdb86a18();
}

// Namespace ct_recon/ct_recon
// Params 2, eflags: 0x0
// Checksum 0x8ca2b814, Offset: 0x950
// Size: 0x284
function function_9270ab93(var_db89c655, var_27875ecd) {
    var_e7cc5e43 = [];
    var_e7cc5e43[#"mp_frenetic"][1] = 360000;
    var_e7cc5e43[#"mp_frenetic"][2] = 240000;
    var_e7cc5e43[#"mp_frenetic"][3] = 120000;
    var_e7cc5e43[#"mp_offshore"][1] = 360000;
    var_e7cc5e43[#"mp_offshore"][2] = 240000;
    var_e7cc5e43[#"mp_offshore"][3] = 120000;
    var_e7cc5e43[#"mp_seaside"][1] = 360000;
    var_e7cc5e43[#"mp_seaside"][2] = 240000;
    var_e7cc5e43[#"mp_seaside"][3] = 120000;
    var_e7cc5e43[#"mp_silo"][1] = 360000;
    var_e7cc5e43[#"mp_silo"][2] = 240000;
    var_e7cc5e43[#"mp_silo"][3] = 120000;
    var_e7cc5e43[#"mp_urban"][1] = 360000;
    var_e7cc5e43[#"mp_urban"][2] = 240000;
    var_e7cc5e43[#"mp_urban"][3] = 120000;
    str_map = hash(getrootmapname());
    ct_utils::function_7a21ac57(var_db89c655, var_27875ecd, var_e7cc5e43[str_map][1], var_e7cc5e43[str_map][2], var_e7cc5e43[str_map][3]);
}

// Namespace ct_recon/ct_recon
// Params 1, eflags: 0x0
// Checksum 0x1c1de01d, Offset: 0xbe0
// Size: 0x130
function function_633915de(gamedifficulty) {
    level endon(#"combattraining_logic_finished");
    level.var_b78ecdad = gettime();
    level.var_e6db911d = 1;
    level.usingscorestreaks = 0;
    level.disablescoreevents = 1;
    level.disablemomentum = 1;
    if (gamedifficulty == 0) {
        ct_recon_tutorial::function_9b9525e9();
    } else {
        j_fore_le_01();
    }
    if (level flag::get("ct_player_success")) {
        b_success = 1;
        level notify(#"combattraining_logic_finished", {#success:1});
        return;
    }
    b_success = 0;
    level notify(#"combattraining_logic_finished", {#success:0});
}

// Namespace ct_recon/ct_recon
// Params 1, eflags: 0x0
// Checksum 0xf8bd0620, Offset: 0xd18
// Size: 0x68
function function_fb0c03bc(b_success) {
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
    level.var_38c87b5 = b_success;
    var_cd803a6b = gettime() - level.var_b78ecdad;
    return var_cd803a6b;
}

// Namespace ct_recon/ct_recon
// Params 0, eflags: 0x0
// Checksum 0x33443fff, Offset: 0xd88
// Size: 0x24c
function j_fore_le_01() {
    level endon(#"combattraining_logic_finished");
    level thread ct_bots::activate_bots(11, #"axis");
    level thread function_98783e17();
    n_bomb_timer = int(gettime() + 1000 + int(360 * 1000));
    setmatchflag("bomb_timer_a", 1);
    setbombtimer("A", n_bomb_timer);
    e_player = getplayers(#"allies")[0];
    n_enemies = 10;
    e_player ct_utils::objcounter_init(undefined, n_enemies, n_enemies, 0, 0);
    while (true) {
        if (level flag::get("ct_player_success") || level flag::get("ct_fail_objective_killed")) {
            break;
        }
        var_f08fde43 = function_4c27be22("A");
        currenttime = gettime();
        if (currenttime > var_f08fde43) {
            level flag::set("ct_fail_timeover");
            level notify(#"combattraining_logic_finished", {#success:0});
            break;
        }
        waitframe(1);
    }
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
}

// Namespace ct_recon/ct_recon
// Params 0, eflags: 0x0
// Checksum 0x621672e7, Offset: 0xfe0
// Size: 0x192
function function_98783e17() {
    level flag::wait_till("combat_training_started");
    wait 1;
    var_1411e20e = getplayers(#"axis");
    foreach (bot in var_1411e20e) {
        bot clientfield::set("set_vip", 1);
    }
    waitframe(1);
    var_1411e20e = bot::get_bots();
    var_1411e20e = array::randomize(var_1411e20e);
    foreach (bot in var_1411e20e) {
        if (isalive(bot)) {
            bot thread function_7e7652be();
            return;
        }
    }
}

// Namespace ct_recon/ct_recon
// Params 0, eflags: 0x0
// Checksum 0xb2f27161, Offset: 0x1180
// Size: 0x19c
function function_7e7652be() {
    self endon(#"death");
    level endon(#"game_ended");
    level.ai_vip = self;
    self clientfield::set("set_vip", 2);
    self thread function_78a1b9ef();
    for (var_70ff5c3a = ct_utils::function_4a23fd2b(); var_70ff5c3a > 1; var_70ff5c3a = ct_utils::function_4a23fd2b()) {
        waitframe(1);
    }
    if (level flag::get("ct_fail_timeover")) {
        return;
    }
    e_player = getplayers(#"allies")[0];
    e_player thread function_2c6e57ee();
    if (true) {
        self thread function_2015250b();
    }
    level.var_a8f06531 = 1;
    level flag::wait_till_any(array("ct_fail_objective_killed", "ct_player_success", "ct_fail_timeover"));
    self clientfield::set("set_vip", 1);
}

// Namespace ct_recon/ct_recon
// Params 0, eflags: 0x0
// Checksum 0x4475901c, Offset: 0x1328
// Size: 0x8c
function function_78a1b9ef() {
    level endon(#"ct_fail_objective_killed", #"ct_player_success", #"ct_fail_timeover");
    self waittill(#"death");
    if (!level flag::get("ct_player_success")) {
        level flag::set("ct_fail_objective_killed");
    }
}

// Namespace ct_recon/ct_recon
// Params 0, eflags: 0x0
// Checksum 0xffcf3c41, Offset: 0x13c0
// Size: 0xdc
function function_2015250b() {
    self endon(#"death");
    while (true) {
        waitresult = self waittill(#"damage");
        if (isdefined(waitresult.mod) && waitresult.mod == "MOD_MELEE_WEAPON_BUTT") {
            e_player = getplayers(#"allies")[0];
            self dodamage(300, self.origin, e_player, undefined, "none", "MOD_MELEE_WEAPON_BUTT");
            break;
        }
    }
}

// Namespace ct_recon/ct_recon
// Params 1, eflags: 0x0
// Checksum 0x986a9c12, Offset: 0x14a8
// Size: 0x114
function function_eb0c2a6a(n_delay) {
    var_70ff5c3a = ct_utils::function_4a23fd2b();
    if (var_70ff5c3a >= 17) {
        return;
    }
    wait n_delay;
    level thread function_cf02ad5c();
    entities = bot::get_bots();
    foreach (entity in entities) {
        if (!isdefined(entity.bot) || entity.sessionstate == "spectator") {
            continue;
        }
        entity ct_bots::function_3895c193();
        break;
    }
}

// Namespace ct_recon/ct_recon
// Params 0, eflags: 0x0
// Checksum 0x4ac5de68, Offset: 0x15c8
// Size: 0x7c
function function_cf02ad5c() {
    e_player = getplayers(#"allies")[0];
    e_player endon(#"death");
    level.ct_recon_enemy_reinforcement ct_recon_enemy_reinforcement::open(e_player);
    wait 3;
    level.ct_recon_enemy_reinforcement ct_recon_enemy_reinforcement::close(e_player);
}

// Namespace ct_recon/ct_recon
// Params 0, eflags: 0x0
// Checksum 0x7ebb4a49, Offset: 0x1650
// Size: 0x44
function function_2c6e57ee() {
    self endon(#"death");
    ct_utils::function_329f9ba6(#"hash_10cd4e849e292519", 6, "green");
}

