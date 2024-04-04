// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_white_mee.gsc;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_white_eyes_open;

// Namespace zm_trial_white_eyes_open/zm_trial_white_eyes_open
// Params 0, eflags: 0x2
// Checksum 0x74a3ecf9, Offset: 0x128
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_white_eyes_open", &__init__, undefined, undefined);
}

// Namespace zm_trial_white_eyes_open/zm_trial_white_eyes_open
// Params 0, eflags: 0x1 linked
// Checksum 0xee53b2db, Offset: 0x170
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"eyes_open", &on_begin, &on_end);
}

// Namespace zm_trial_white_eyes_open/zm_trial_white_eyes_open
// Params 0, eflags: 0x5 linked
// Checksum 0x2e77dcf0, Offset: 0x1d8
// Size: 0x5ac
function private on_begin() {
    spawner = getent("weeping_spawner", "script_noteworthy");
    level.disable_nuke_delay_spawning = 1;
    level flag::clear("spawn_zombies");
    level thread lui::screen_flash(0.2, 1.3, 0.5, 1, "black");
    wait(0.2);
    foreach (player in getplayers()) {
        player setmovespeedscale(0);
        player thread teleport_player();
    }
    wait(0.1);
    foreach (player in getplayers()) {
        player.e_weeper = zombie_utility::spawn_zombie(spawner, spawner.targetname, undefined, level.round_number);
        var_9d88bc68 = anglestoforward(player.angles);
        var_9d88bc68 = 50 * vectornormalize(var_9d88bc68);
        goal_pos = player.origin + var_9d88bc68;
        goal_pos = getclosestpointonnavmesh(goal_pos, 128, 32);
        player.e_weeper forceteleport(goal_pos, player.angles - (0, 180, 0), 1);
        player.e_weeper.var_72411ccf = &function_660c908;
        player.e_weeper.favoriteenemy = player;
        player.e_weeper val::set(#"mee_2", "takedamage", 0);
        player.e_weeper val::set(#"mee_2", "ignoreme", 1);
        player.e_weeper.team = #"team3";
        wait(0.1);
    }
    level.e_weeper = zombie_utility::spawn_zombie(spawner, spawner.targetname, undefined, level.round_number);
    level.e_weeper.var_72411ccf = &function_660c908;
    level.e_weeper val::set(#"mee_2", "takedamage", 0);
    level.e_weeper val::set(#"mee_2", "ignoreme", 1);
    level.e_weeper.team = #"team3";
    wait(1.5);
    level.disable_nuke_delay_spawning = 0;
    level flag::set("spawn_zombies");
    foreach (player in getplayers()) {
        player setmovespeedscale(1);
        player.e_weeper.var_72411ccf = undefined;
        player.e_weeper zombie_utility::set_zombie_run_cycle("super_sprint");
        player callback::on_player_damage(&on_player_damage);
        player.e_weeper thread zm_white_mee::function_d10bf985();
    }
    level.e_weeper.var_72411ccf = undefined;
    level.e_weeper zombie_utility::set_zombie_run_cycle("super_sprint");
    level.e_weeper thread zm_white_mee::function_d10bf985();
}

// Namespace zm_trial_white_eyes_open/zm_trial_white_eyes_open
// Params 1, eflags: 0x5 linked
// Checksum 0x9d086fac, Offset: 0x790
// Size: 0x244
function private on_end(round_reset) {
    foreach (player in getplayers()) {
        player callback::remove_on_player_damage(&on_player_damage);
        player.e_weeper val::reset(#"mee_2", "takedamage");
        player.e_weeper val::reset(#"mee_2", "ignoreme");
        player.e_weeper.team = #"axis";
        if (isdefined(player.e_weeper.kill_brush)) {
            player.e_weeper.kill_brush delete();
        }
        player.e_weeper kill();
    }
    level.e_weeper val::reset(#"mee_2", "takedamage");
    level.e_weeper val::reset(#"mee_2", "ignoreme");
    level.e_weeper.team = #"axis";
    if (isdefined(level.e_weeper.kill_brush)) {
        level.e_weeper.kill_brush delete();
    }
    level.e_weeper kill();
}

// Namespace zm_trial_white_eyes_open/zm_trial_white_eyes_open
// Params 0, eflags: 0x1 linked
// Checksum 0x3e63cece, Offset: 0x9e0
// Size: 0x64
function teleport_player() {
    if (isalive(self)) {
        if (self isusingoffhand()) {
            self forceoffhandend();
        }
        self zm_bgb_anywhere_but_here::activation(0);
    }
}

// Namespace zm_trial_white_eyes_open/zm_trial_white_eyes_open
// Params 1, eflags: 0x5 linked
// Checksum 0xd28f975c, Offset: 0xa50
// Size: 0xec
function private on_player_damage(params) {
    if ((isai(params.eattacker) || isai(params.einflictor)) && (params.idamage > 0 || isdefined(self.armor) && self.armor > 0) && params.eattacker.archetype === #"weeping_angel") {
        var_57807cdc = [];
        array::add(var_57807cdc, self, 0);
        zm_trial::fail(#"hash_41122a695bc6065d", var_57807cdc);
    }
}

// Namespace zm_trial_white_eyes_open/zm_trial_white_eyes_open
// Params 1, eflags: 0x5 linked
// Checksum 0xdfeafb94, Offset: 0xb48
// Size: 0x2c
function private function_660c908(behaviortreeentity) {
    behaviortreeentity setgoal(behaviortreeentity.origin);
}

