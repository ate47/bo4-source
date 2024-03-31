// Atian COD Tools GSC decompiler test
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\status_effects\status_effect_explosive_damage.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\abilities\gadgets\gadget_health_regen.gsc;

#namespace healthoverlay;

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x2
// Checksum 0x2c171865, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"healthoverlay", &__init__, undefined, undefined);
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0x4299c17b, Offset: 0x130
// Size: 0x294
function __init__() {
    callback::on_start_gametype(&init);
    level.new_health_model = getdvarint(#"new_health_model", 1) > 0;
    level.var_a7985066 = getdvarint(#"hash_1b8e30b9cc6b8dbc", 50);
    level.var_9b350462 = getdvarint(#"hash_3dfb7b6187d80898", 70);
    if (level.new_health_model) {
        callback::on_joined_team(&function_5c4a1c21);
        callback::on_joined_spectate(&function_5c4a1c21);
        callback::on_spawned(&player_health_regen);
        callback::on_disconnect(&end_health_regen);
        callback::on_player_killed(&end_health_regen);
        level.start_player_health_regen = &player_health_regen;
    } else {
        callback::on_joined_team(&function_5c4a1c21);
        callback::on_joined_spectate(&function_5c4a1c21);
        callback::on_spawned(&player_health_regen_t7);
        callback::on_disconnect(&end_health_regen);
        callback::on_player_killed(&end_health_regen);
        level.start_player_health_regen = &player_health_regen_t7;
    }
    if (sessionmodeismultiplayergame()) {
        level.specialisthealspeed = getgametypesetting(#"specialisthealspeed_allies_1");
    }
    level thread function_b506b922();
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0xcc155681, Offset: 0x3d0
// Size: 0x16
function init() {
    level.healthoverlaycutoff = 0.55;
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0x97071313, Offset: 0x3f0
// Size: 0x30
function restart_player_health_regen() {
    self end_health_regen();
    self thread [[ level.start_player_health_regen ]]();
}

// Namespace healthoverlay/healthoverlay
// Params 1, eflags: 0x1 linked
// Checksum 0x579d6a77, Offset: 0x428
// Size: 0x26
function function_5c4a1c21(params) {
    self.var_4d9b2bc3 = 0;
    self notify(#"end_healthregen");
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0x2d67adc2, Offset: 0x458
// Size: 0x1e
function end_health_regen() {
    self.var_4d9b2bc3 = 0;
    self notify(#"end_healthregen");
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0x89f5e021, Offset: 0x480
// Size: 0x4c6
function player_health_regen_t7() {
    self endon(#"end_healthregen");
    if (self.health <= 0) {
        /#
            assert(!isalive(self));
        #/
        return;
    }
    maxhealth = self.health;
    oldhealth = maxhealth;
    player = self;
    regenrate = 0.1;
    usetrueregen = 0;
    veryhurt = 0;
    player.breathingstoptime = -10000;
    thread player_breathing_sound(maxhealth * 0.35);
    thread player_heartbeat_sound(maxhealth * 0.35);
    lastsoundtime_recover = 0;
    hurttime = 0;
    newhealth = 0;
    for (;;) {
        waitframe(1);
        if (isdefined(player.regenrate)) {
            regenrate = player.regenrate;
            usetrueregen = 1;
        }
        if (player.health == maxhealth) {
            veryhurt = 0;
            if (isdefined(self.atbrinkofdeath)) {
                self notify(#"challenge_survived_from_death");
                self.atbrinkofdeath = undefined;
            }
            continue;
        }
        if (player.health <= 0) {
            return;
        }
        if (isdefined(player.laststand) && player.laststand) {
            continue;
        }
        wasveryhurt = veryhurt;
        ratio = player.health / maxhealth;
        if (ratio <= level.healthoverlaycutoff) {
            veryhurt = 1;
            self.atbrinkofdeath = 1;
            self.isneardeath = 1;
            if (!wasveryhurt) {
                hurttime = gettime();
            }
        } else {
            self.isneardeath = 0;
        }
        if (player.health >= oldhealth) {
            regentime = 5000;
            if (player hasperk(#"specialty_healthregen")) {
                regentime = int(regentime / getdvarfloat(#"perk_healthregenmultiplier", 0));
            }
            if (gettime() - hurttime < regentime) {
                continue;
            }
            if (regentime <= 0) {
                continue;
            }
            if (gettime() - lastsoundtime_recover > regentime) {
                lastsoundtime_recover = gettime();
                self notify(#"snd_breathing_better");
            }
            if (veryhurt) {
                newhealth = ratio;
                veryhurttime = 3000;
                if (player hasperk(#"specialty_healthregen")) {
                    veryhurttime = int(veryhurttime / getdvarfloat(#"perk_healthregenmultiplier", 0));
                }
                if (gettime() > hurttime + veryhurttime) {
                    newhealth = newhealth + regenrate;
                }
            } else if (usetrueregen) {
                newhealth = ratio + regenrate;
            } else {
                newhealth = 1;
            }
            if (newhealth >= 1) {
                self player::reset_attacker_list();
                newhealth = 1;
            }
            if (newhealth <= 0) {
                return;
            }
            player setnormalhealth(newhealth);
            change = player.health - oldhealth;
            if (change > 0) {
                player decay_player_damages(change);
            }
            oldhealth = player.health;
            continue;
        }
        oldhealth = player.health;
        hurttime = gettime();
        player.breathingstoptime = hurttime + 6000;
    }
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0xfeba8ec, Offset: 0x950
// Size: 0x4e
function function_f7a21c4() {
    self endon(#"hash_2d775ef016d5c651");
    while (true) {
        if (!isdefined(self)) {
            return;
        }
        level visionset_mgr::set_state_active(self, 1);
        waitframe(1);
    }
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0xdaf1e678, Offset: 0x9a8
// Size: 0x74
function function_8335b12() {
    if (getdvarint(#"new_blood_version", 3) != 3) {
        self visionset_mgr::activate("visionset", "crithealth", self, 0.5, &function_f7a21c4, 0.5);
    }
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0xba9521c1, Offset: 0xa28
// Size: 0x6c
function function_306c4d60() {
    if (getdvarint(#"new_blood_version", 3) != 3) {
        self notify(#"hash_2d775ef016d5c651");
        self visionset_mgr::deactivate_per_player("visionset", "crithealth", self);
    }
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0x1dfa4d14, Offset: 0xaa0
// Size: 0x4c
function function_c48cb1fc() {
    self thread function_8335b12();
    self.var_61e6c24d = 1;
    self clientfield::set_to_player("sndCriticalHealth", 1);
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0xe94cfbd0, Offset: 0xaf8
// Size: 0x44
function function_df115fb1() {
    self thread function_306c4d60();
    self.var_61e6c24d = 0;
    self clientfield::set_to_player("sndCriticalHealth", 0);
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x5 linked
// Checksum 0x3e03976a, Offset: 0xb48
// Size: 0x24
function private function_2eee85c1() {
    if (self.var_61e6c24d) {
        self function_df115fb1();
    }
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x5 linked
// Checksum 0x6bc55283, Offset: 0xb78
// Size: 0x6c
function private function_df99db2() {
    player = self;
    if (player.health <= 0) {
        return false;
    }
    if (player isremotecontrolling()) {
        return false;
    }
    if (isdefined(player.laststand) && player.laststand) {
        return false;
    }
    return true;
}

// Namespace healthoverlay/healthoverlay
// Params 2, eflags: 0x5 linked
// Checksum 0xabaa67a4, Offset: 0xbf0
// Size: 0xac
function private should_heal(var_dc77251f, regen_delay) {
    if (isdefined(self.disable_health_regen_delay) && self.disable_health_regen_delay) {
        var_dc77251f.var_ba47a7a3 = 1;
    }
    if (!(isdefined(self.ignore_health_regen_delay) && self.ignore_health_regen_delay) && var_dc77251f.time_now - var_dc77251f.var_ba47a7a3 < regen_delay) {
        return false;
    }
    if (regen_delay <= 0) {
        return false;
    }
    if (self.health >= self.var_66cb03ad) {
        return false;
    }
    return true;
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x5 linked
// Checksum 0x60111e58, Offset: 0xca8
// Size: 0x19e
function private function_8ca62ae3() {
    if (self.heal.enabled == 0) {
        return 0;
    }
    regen_rate = self.heal.rate;
    if (regen_rate == 0) {
        regen_rate = isdefined(self.n_regen_rate) ? self.n_regen_rate : self.playerrole.healthhealrate;
        if (self hasperk(#"specialty_quickrevive")) {
            regen_rate = regen_rate * 1.5;
        }
        if (isdefined(self.var_5762241e)) {
            regen_rate = regen_rate + self.var_5762241e;
        }
        regen_rate = regen_rate * self function_4e64ede5();
    }
    if (isdefined(level.specialisthealspeed)) {
        switch (level.specialisthealspeed) {
        case 0:
            regen_rate = regen_rate * 0.5;
            break;
        case 1:
        default:
            break;
        case 2:
            regen_rate = regen_rate * 2;
            break;
        case 3:
            regen_rate = 2147483647;
            break;
        }
    }
    return regen_rate;
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x5 linked
// Checksum 0xd302505d, Offset: 0xe50
// Size: 0x10a
function private function_f8139729() {
    /#
        assert(isdefined(self.var_66cb03ad));
    #/
    /#
        assert(isdefined(self.maxhealth));
    #/
    /#
        assert(isplayer(self));
    #/
    var_bc840360 = isdefined(self.heal) && isdefined(self.heal.var_bc840360) ? self.heal.var_bc840360 : 0;
    if (var_bc840360 == 0) {
        var_bc840360 = self.var_66cb03ad;
    }
    var_bc840360 = math::clamp(var_bc840360, 0, max(self.maxhealth, self.var_66cb03ad));
    return var_bc840360;
}

// Namespace healthoverlay/healthoverlay
// Params 1, eflags: 0x5 linked
// Checksum 0xb633d2ed, Offset: 0xf68
// Size: 0x52c
function private heal(var_dc77251f) {
    player = self;
    if (!isdefined(player) || !isdefined(player.heal)) {
        return;
    }
    healing_enabled = player.heal.enabled == 1;
    regen_delay = 1;
    if (healing_enabled && player.heal.var_c8777194 === 1) {
        regen_delay = isdefined(player.n_regen_delay) ? player.n_regen_delay : player.healthregentime;
        regen_delay = int(int(regen_delay * 1000));
        specialty_healthregen_enabled = 0;
        if (specialty_healthregen_enabled && player hasperk(#"specialty_healthregen") || player hasperk(#"specialty_quickrevive")) {
            regen_delay = int(regen_delay / getdvarfloat(#"perk_healthregenmultiplier", 0));
        }
    }
    if (!should_heal(var_dc77251f, regen_delay)) {
        return;
    }
    if (var_dc77251f.time_now - var_dc77251f.var_7cb44c56 > regen_delay) {
        var_dc77251f.var_7cb44c56 = var_dc77251f.time_now;
        self notify(#"snd_breathing_better");
    }
    var_bc840360 = player function_f8139729();
    /#
        assert(var_bc840360 > 0);
    #/
    if (isdefined(player.var_44d52546) && player.var_44d52546) {
        regen_amount = 1;
    } else {
        regen_rate = player function_8ca62ae3();
        regen_amount = regen_rate * float(var_dc77251f.time_elapsed) / 1000 / var_bc840360;
    }
    if (regen_amount == 0) {
        return;
    }
    var_dc77251f.var_ec8863bf = math::clamp(var_dc77251f.ratio + regen_amount, 0, 1);
    if (var_dc77251f.var_ec8863bf <= 0) {
        return;
    }
    if (player.var_61e6c24d && var_dc77251f.var_ec8863bf > var_dc77251f.var_dae4d7ea) {
        player function_df115fb1();
    }
    new_health = var_dc77251f.var_ec8863bf * var_bc840360 + var_dc77251f.var_e65dca8d;
    player.health = int(math::clamp(floor(new_health), 0, max(self.maxhealth, self.var_66cb03ad)));
    var_dc77251f.var_e65dca8d = new_health - player.health;
    if (player.health >= var_bc840360 && var_dc77251f.old_health < var_bc840360) {
        player player::function_c6fe9951();
    }
    if (player.health >= player.var_66cb03ad && var_dc77251f.old_health < player.var_66cb03ad) {
        player player::reset_attacker_list();
        player player::function_d1768e8e();
        return;
    }
    change = player.health - var_dc77251f.old_health;
    if (change > 0) {
        player decay_player_damages(change);
        if (sessionmodeismultiplayergame()) {
            player stats::function_dad108fa(#"total_heals", change);
        }
    }
}

// Namespace healthoverlay/healthoverlay
// Params 1, eflags: 0x5 linked
// Checksum 0xf7b56eed, Offset: 0x14a0
// Size: 0xae
function private check_max_health(var_dc77251f) {
    player = self;
    var_66cb03ad = player.var_66cb03ad < 0 ? player.var_66cb03ad : player.maxhealth;
    if (player.health >= var_66cb03ad) {
        if (isdefined(self.atbrinkofdeath)) {
            self notify(#"challenge_survived_from_death");
            self.atbrinkofdeath = undefined;
        }
        var_dc77251f.old_health = player.health;
        return true;
    }
    return false;
}

// Namespace healthoverlay/healthoverlay
// Params 1, eflags: 0x5 linked
// Checksum 0x3d2487ee, Offset: 0x1558
// Size: 0x4a
function private function_69e7b01c(ratio) {
    if (ratio <= level.healthoverlaycutoff) {
        self.atbrinkofdeath = 1;
        self.isneardeath = 1;
        return;
    }
    self.isneardeath = 0;
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x1 linked
// Checksum 0x8a5b0d30, Offset: 0x15b0
// Size: 0x154
function player_health_regen() {
    if (self.health <= 0) {
        /#
            assert(!isalive(self));
        #/
        self.var_4d9b2bc3 = 0;
        return;
    }
    player = self;
    player.var_4d9b2bc3 = 1;
    player.breathingstoptime = -10000;
    player.var_dc77251f = {#var_d1e06a5f:gettime(), #var_7cb44c56:0, #old_health:player.health, #var_dae4d7ea:0, #var_215539de:0, #var_e65dca8d:0, #var_ec8863bf:0, #ratio:0, #time_elapsed:0, #time_now:0, #var_ba47a7a3:0};
    player function_df115fb1();
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x5 linked
// Checksum 0x5eae3328, Offset: 0x1710
// Size: 0x362
function private function_8f2722f6() {
    player = self;
    if (!(isdefined(player.var_4d9b2bc3) && player.var_4d9b2bc3)) {
        return;
    }
    if (player.maxhealth == 0) {
        return;
    }
    if (!isalive(player)) {
        return;
    }
    var_dc77251f = player.var_dc77251f;
    if (player check_max_health(var_dc77251f)) {
        var_dc77251f.var_e65dca8d = 0;
        player function_2eee85c1();
        return;
    }
    if (!player function_df99db2()) {
        var_dc77251f.var_e65dca8d = 0;
        player function_2eee85c1();
        return;
    }
    var_bc840360 = player function_f8139729();
    if (var_bc840360 <= player.health) {
        player.health = var_bc840360;
        var_dc77251f.var_e65dca8d = 0;
        player function_2eee85c1();
        return;
    }
    var_dc77251f.ratio = player.health / var_bc840360;
    var_dc77251f.var_ec8863bf = var_dc77251f.ratio;
    player function_69e7b01c(player.health / player.maxhealth);
    var_dc77251f.time_now = gettime();
    if (player.health < var_dc77251f.old_health) {
        player.breathingstoptime = var_dc77251f.time_now + 6000;
        var_dc77251f.var_ba47a7a3 = var_dc77251f.time_now;
    } else {
        var_dc77251f.time_elapsed = var_dc77251f.time_now - var_dc77251f.var_d1e06a5f;
        player heal(var_dc77251f);
        if (var_dc77251f.var_ec8863bf <= 0) {
            player.var_4d9b2bc3 = 0;
            return;
        }
    }
    var_dc77251f.var_a83bd8fd = level.var_a7985066 / player.maxhealth;
    var_dc77251f.var_dae4d7ea = level.var_9b350462 / player.maxhealth;
    if (!player.var_61e6c24d && var_dc77251f.var_ec8863bf <= var_dc77251f.var_a83bd8fd) {
        player function_c48cb1fc();
    } else if (player.var_61e6c24d && var_dc77251f.var_ec8863bf > var_dc77251f.var_dae4d7ea) {
        player function_df115fb1();
    }
    var_dc77251f.old_health = player.health;
}

// Namespace healthoverlay/healthoverlay
// Params 0, eflags: 0x5 linked
// Checksum 0x1cd2f9d2, Offset: 0x1a80
// Size: 0x122
function private function_b506b922() {
    level endon(#"game_ended");
    while (true) {
        profilestart();
        var_1556c25 = getlevelframenumber();
        foreach (player in getplayers()) {
            if ((player getentitynumber() + var_1556c25 & 1) != 0) {
                continue;
            }
            if (!isdefined(player.var_dc77251f)) {
                continue;
            }
            player function_8f2722f6();
            player.var_dc77251f.var_d1e06a5f = gettime();
        }
        profilestop();
        waitframe(1);
    }
}

// Namespace healthoverlay/healthoverlay
// Params 1, eflags: 0x1 linked
// Checksum 0xa1ac9bbf, Offset: 0x1bb0
// Size: 0x120
function decay_player_damages(decay) {
    if (!isdefined(self.attackerdamage)) {
        return;
    }
    if (!isdefined(self.attackers)) {
        return;
    }
    for (j = 0; j < self.attackers.size; j++) {
        player = self.attackers[j];
        if (!isdefined(player)) {
            continue;
        }
        if (self.attackerdamage[player.clientid].damage == 0) {
            continue;
        }
        self.attackerdamage[player.clientid].damage = self.attackerdamage[player.clientid].damage - decay;
        if (self.attackerdamage[player.clientid].damage < 0) {
            self.attackerdamage[player.clientid].damage = 0;
        }
    }
}

// Namespace healthoverlay/healthoverlay
// Params 1, eflags: 0x1 linked
// Checksum 0x85a204de, Offset: 0x1cd8
// Size: 0xea
function player_breathing_sound(healthcap) {
    self endon(#"end_healthregen");
    wait(2);
    player = self;
    for (;;) {
        wait(0.2);
        if (player.health <= 0) {
            return;
        }
        if (player util::isusingremote()) {
            continue;
        }
        if (player.health >= healthcap) {
            continue;
        }
        if (player.healthregentime <= 0 && gettime() > player.breathingstoptime) {
            continue;
        }
        player notify(#"snd_breathing_hurt");
        wait(0.784);
        wait(0.1 + randomfloat(0.8));
    }
}

// Namespace healthoverlay/healthoverlay
// Params 1, eflags: 0x1 linked
// Checksum 0xa464a9a3, Offset: 0x1dd0
// Size: 0x136
function player_heartbeat_sound(healthcap) {
    self endon(#"end_healthregen");
    self.hearbeatwait = 0.2;
    wait(2);
    player = self;
    for (;;) {
        wait(0.2);
        if (player.health <= 0) {
            return;
        }
        if (player util::isusingremote()) {
            continue;
        }
        if (player.health >= healthcap) {
            self.hearbeatwait = 0.3;
            continue;
        }
        if (player.healthregentime <= 0 && gettime() > player.breathingstoptime) {
            self.hearbeatwait = 0.3;
            continue;
        }
        player playlocalsound(#"mpl_player_heartbeat");
        wait(self.hearbeatwait);
        if (self.hearbeatwait <= 0.6) {
            self.hearbeatwait = self.hearbeatwait + 0.1;
        }
    }
}

