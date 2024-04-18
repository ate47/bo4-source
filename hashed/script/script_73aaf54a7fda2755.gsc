// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_1d05befd;

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 0, eflags: 0x2
// Checksum 0x75afcef2, Offset: 0x1c8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"hash_831eacd382054cc", &__init__, &__main__, undefined);
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 0, eflags: 0x1 linked
// Checksum 0x4f4724cc, Offset: 0x218
// Size: 0x194
function __init__() {
    spawner::add_archetype_spawn_function(#"zombie", &function_65089f84);
    clientfield::register("actor", "zm_ai/zombie_electric_fx_clientfield", 21000, 1, "int");
    clientfield::register("actor", "zombie_electric_burst_clientfield", 21000, 1, "counter");
    clientfield::register("actor", "zombie_electric_water_aoe_clientfield", 21000, 1, "counter");
    clientfield::register("actor", "zombie_electric_burst_stun_friendly_clientfield", 21000, 1, "int");
    clientfield::register("toplayer", "zombie_electric_burst_postfx_clientfield", 21000, 1, "counter");
    callback::on_player_damage(&function_4639701a);
    level.var_f8eb6737 = getstatuseffect(#"hash_3a1f530cdb5f75f4");
    /#
        zm_devgui::function_c7dd7a17("<unknown string>", "<unknown string>");
    #/
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x3b8
// Size: 0x4
function __main__() {
    
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 0, eflags: 0x5 linked
// Checksum 0xbd0dee7f, Offset: 0x3c8
// Size: 0x72
function private function_65089f84() {
    if (isdefined(self.var_9fde8624) && self.var_9fde8624 == #"zombie_electric") {
        zm_behavior::function_57d3b5eb();
        self thread clientfield::set("zm_ai/zombie_electric_fx_clientfield", 1);
        self.actor_killed_override = &function_1a47fb39;
    }
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 1, eflags: 0x5 linked
// Checksum 0xa531d208, Offset: 0x448
// Size: 0xb4
function private function_4639701a(params) {
    if (isdefined(params.eattacker) && isdefined(params.eattacker.var_9fde8624) && isdefined(params.smeansofdeath) && params.eattacker.var_9fde8624 == #"zombie_electric" && params.smeansofdeath == "MOD_MELEE") {
        self status_effect::status_effect_apply(level.var_f8eb6737, undefined, self, 0);
    }
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 8, eflags: 0x5 linked
// Checksum 0x38449093, Offset: 0x508
// Size: 0x16c
function private function_1a47fb39(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime) {
    self thread clientfield::set("zm_ai/zombie_electric_fx_clientfield", 0);
    if (!(isdefined(self.water_damage) && self.water_damage)) {
        self thread zombie_utility::zombie_gib(idamage, attacker, vdir, self gettagorigin("j_spine4"), smeansofdeath, shitloc, undefined, undefined, weapon);
        var_e98404d8 = self getcentroid();
        gibserverutils::annihilate(self);
        function_25c6cba0(self, var_e98404d8);
        if (isdefined(self.b_in_water) && self.b_in_water) {
            self clientfield::increment("zombie_electric_water_aoe_clientfield");
            level thread function_79e38cc4(var_e98404d8);
        }
    }
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 2, eflags: 0x5 linked
// Checksum 0x76a3e18f, Offset: 0x680
// Size: 0x320
function private function_25c6cba0(entity, origin) {
    entity clientfield::increment("zombie_electric_burst_clientfield");
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        distance_sq = distancesquared(origin, players[i] getcentroid());
        if (isdefined(entity.b_in_water) && entity.b_in_water && isdefined(players[i].b_in_water) && players[i].b_in_water && distance_sq <= 250000) {
            players[i] status_effect::status_effect_apply(level.var_f8eb6737, undefined, players[i], 0);
            continue;
        }
        if (distance_sq <= 32400) {
            players[i] clientfield::increment_to_player("zombie_electric_burst_postfx_clientfield");
        }
    }
    zombies = getaiteamarray(level.zombie_team);
    foreach (zombie in zombies) {
        if (zombie.archetype == #"zombie" && (!isdefined(zombie.var_9fde8624) || zombie.var_9fde8624 != #"zombie_electric") && isdefined(entity.b_in_water) && entity.b_in_water && isdefined(zombie.b_in_water) && zombie.b_in_water && distancesquared(origin, zombie.origin) <= 250000) {
            zombie clientfield::set("zombie_electric_burst_stun_friendly_clientfield", 1);
            zombie ai::stun(5);
            zombie thread function_ef1b9d42();
        }
    }
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 0, eflags: 0x5 linked
// Checksum 0x2f035908, Offset: 0x9a8
// Size: 0x3c
function private function_ef1b9d42() {
    self endon(#"death");
    wait(5);
    self clientfield::set("zombie_electric_burst_stun_friendly_clientfield", 0);
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 1, eflags: 0x5 linked
// Checksum 0xb174a28f, Offset: 0x9f0
// Size: 0x146
function private function_79e38cc4(origin) {
    var_74d136f5 = 0;
    time_step = 0.5;
    while (var_74d136f5 <= 1.5) {
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            distance_sq = distancesquared(origin, players[i] getcentroid());
            if (isdefined(players[i].b_in_water) && players[i].b_in_water && distance_sq <= 40000) {
                players[i] status_effect::status_effect_apply(level.var_f8eb6737, undefined, players[i], 0);
            }
        }
        wait(time_step);
        var_74d136f5 += time_step;
    }
}

