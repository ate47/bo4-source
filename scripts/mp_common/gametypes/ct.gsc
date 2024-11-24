#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\spawning_shared;
#using scripts\mp_common\gametypes\ct_ai;
#using scripts\mp_common\gametypes\ct_bots;
#using scripts\mp_common\gametypes\ct_core;
#using scripts\mp_common\gametypes\ct_gadgets;
#using scripts\mp_common\gametypes\ct_utils;
#using scripts\mp_common\gametypes\globallogic_spawn;
#using scripts\mp_common\player\player_loadout;
#using scripts\mp_common\player\player_utils;

#namespace ct;

// Namespace ct/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xefd450e, Offset: 0xf8
// Size: 0x1c4
function event_handler[gametype_init] main(eventstruct) {
    ct_core::function_46e95cc7();
    level.select_character = ct_utils::get_roleindex(#"prt_mp_mercenary");
    level.var_820c5561 = "RUIN";
    ct_utils::function_be3a76b7(level.var_820c5561);
    level.var_d6d98fbe = 1;
    level.debugbots = 1;
    ct_core::function_fa03fc55();
    level.var_4c2ecc6f = &function_6db6572b;
    level.var_c01b7f8b = &function_ba542258;
    level.var_49240db3 = &function_b89106ad;
    level.var_8b9d690e = &function_cf3224fe;
    level.onspawnplayer = &function_7c4ef26b;
    player::function_cf3aa03d(&function_9d65db70);
    level.var_cdb8ae2c = &ct_utils::function_a8da260c;
    level.var_e31c5d7a = &ct_bots::function_e31c5d7a;
    callback::on_game_playing(&ct_core::function_1e84c767);
    globallogic_spawn::addsupportedspawnpointtype("ct");
    level flag::init("combat_training_started");
}

// Namespace ct/ct
// Params 1, eflags: 0x0
// Checksum 0x7fc25a9b, Offset: 0x2c8
// Size: 0x1b8
function function_7c4ef26b(predictedspawn) {
    setdvar(#"custom_killstreak_mode", 2);
    if (isdefined(level.killstreakindices)) {
        if (isdefined(level.killstreakindices[#"uav"])) {
            setdvar(#"custom_killstreak1", level.killstreakindices[#"uav"]);
        }
        if (isdefined(level.killstreakindices[#"satellite"])) {
            setdvar(#"custom_killstreak2", level.killstreakindices[#"satellite"]);
        }
        if (isdefined(level.killstreakindices[#"remote_missile"])) {
            setdvar(#"custom_killstreak3", level.killstreakindices[#"remote_missile"]);
        }
    }
    self thread ct_core::function_d2845186();
    spawning::onspawnplayer(predictedspawn);
    if (isbot(self)) {
        if (isdefined(level.var_e31c5d7a)) {
            self [[ level.var_e31c5d7a ]]();
        }
    }
}

// Namespace ct/ct
// Params 9, eflags: 0x0
// Checksum 0x62b0fb17, Offset: 0x488
// Size: 0x4c
function function_9d65db70(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    
}

// Namespace ct/ct
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x4e0
// Size: 0x4
function function_6db6572b() {
    
}

// Namespace ct/ct
// Params 1, eflags: 0x0
// Checksum 0x290b27c7, Offset: 0x4f0
// Size: 0x5c
function function_ba542258(mode) {
    if (isdefined(level.var_1ecfe3a2)) {
        self.var_71a70093 = level.var_1ecfe3a2;
    }
    self thread ct_gadgets::function_19181566();
    self loadout::function_cdb86a18();
}

// Namespace ct/ct
// Params 1, eflags: 0x0
// Checksum 0x6cdc227c, Offset: 0x558
// Size: 0xa8
function function_b89106ad(gamedifficulty) {
    level endon(#"combattraining_logic_finished");
    level notify(#"hash_2a473e02881ca991");
    level.usingscorestreaks = 0;
    level.disablescoreevents = 1;
    level.disablemomentum = 1;
    j_fore_le_01();
    level notify(#"combattraining_logic_finished", {#success:1});
}

// Namespace ct/ct
// Params 1, eflags: 0x0
// Checksum 0xb8b94901, Offset: 0x608
// Size: 0x1e
function function_cf3224fe(b_success) {
    var_cd803a6b = gettime();
    return var_cd803a6b;
}

// Namespace ct/ct
// Params 0, eflags: 0x0
// Checksum 0xb8cd60b2, Offset: 0x630
// Size: 0xa8
function function_377cd9ae() {
    level endon(#"combattraining_logic_finished");
    while (!level.gameended) {
        while (!self actionslotfourbuttonpressed()) {
            waitframe(1);
        }
        if (!self isinmovemode("ufo", "noclip")) {
            level.var_105dad71++;
            if (level.var_105dad71 > 17) {
                level.var_105dad71 = 17;
            }
        }
        waitframe(1);
    }
}

// Namespace ct/ct
// Params 0, eflags: 0x0
// Checksum 0xfeb3ae0c, Offset: 0x6e0
// Size: 0xa4
function function_78aff698() {
    level endon(#"combattraining_logic_finished");
    while (!level.gameended) {
        while (!self actionslotthreebuttonpressed()) {
            waitframe(1);
        }
        if (!self isinmovemode("ufo", "noclip")) {
            level.var_105dad71--;
            if (level.var_105dad71 < 0) {
                level.var_105dad71 = 0;
            }
        }
        waitframe(1);
    }
}

// Namespace ct/ct
// Params 0, eflags: 0x0
// Checksum 0xa85372a8, Offset: 0x790
// Size: 0x18e
function j_fore_le_01() {
    level endon(#"combattraining_logic_finished");
    level.var_105dad71 = 1;
    level.var_200077ef = 0;
    e_player = getplayers(#"allies")[0];
    e_player thread function_377cd9ae();
    e_player thread function_78aff698();
    while (!level.gameended) {
        while (!e_player actionslotonebuttonpressed()) {
            waitframe(1);
        }
        if (!e_player isinmovemode("ufo", "noclip")) {
            level thread ct_bots::activate_bots(level.var_105dad71, #"axis");
            level thread spawn_robot(e_player);
        }
        waitframe(1);
        while (!e_player actionslottwobuttonpressed()) {
            waitframe(1);
        }
        if (!e_player isinmovemode("ufo", "noclip")) {
            level thread ct_bots::deactivate_bots();
        }
        waitframe(1);
    }
}

// Namespace ct/ct
// Params 1, eflags: 0x0
// Checksum 0xb289864e, Offset: 0x928
// Size: 0x4c
function spawn_robot(e_player) {
    var_16e591d7 = e_player.origin;
    wait 3;
    ct_ai::spawn_zombie(var_16e591d7, 1, 0);
}

