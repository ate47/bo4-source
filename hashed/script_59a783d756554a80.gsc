// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_office_floors.gsc;
#include scripts/zm_common/zm_characters.gsc;
#include scripts/zm_common/callbacks.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/zm_common/zm_audio.gsc;
#include scripts/zm_common/zm_vo.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace namespace_8f53e87b;

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0x9b92ca6, Offset: 0x130
// Size: 0x4c
function init() {
    callback::on_spawned(&function_ea6a4006);
    if (!zm_utility::is_standard()) {
        level thread function_132e0bea();
    }
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0xa0d00f5a, Offset: 0x188
// Size: 0x9c
function function_ea6a4006() {
    if (!zm_trial::is_trial_mode() && !zm_utility::is_standard()) {
        if (self zm_characters::is_character(array(#"hash_59f3598ad57dadd8", #"hash_2bcebdf1bef33311", #"hash_5a715cb0a6e071ae"))) {
            self thread function_5bd0ee94();
        }
    }
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0x339dee3, Offset: 0x230
// Size: 0xec
function function_5bd0ee94() {
    self endon(#"death");
    level.var_b10a99a1 = array(#"hash_32d43d269e30acea", #"hash_17d53ca41c412d7f", #"hash_da35c4f5834157c", #"hash_3ee8d76b357581a1", #"hash_7cc1be647a9336e6");
    level.var_7e23e2dd = 0;
    level thread function_148c9f71();
    level waittill(#"hash_2b803f353d8e13c0");
    self thread function_c207b97();
    function_25f77618();
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0xafb0eb5e, Offset: 0x328
// Size: 0x94c
function function_25f77618() {
    self zm_audio::function_6191af93(#"ammo", #"out", #"hash_6498f9b40d233db", #"out", 25);
    self zm_audio::function_6191af93(#"ammo", #"low", #"hash_6498f9b40d233db", #"low", 25);
    self zm_audio::function_6191af93(#"magicbox", #"homunculus", #"hash_e1b7317229bdec5", #"homunculus", 25);
    self zm_audio::function_6191af93(#"magicbox", #"pistol", #"hash_e1b7317229bdec5", #"pistol", 25);
    self zm_audio::function_6191af93(#"magicbox", #"sniper", #"hash_e1b7317229bdec5", #"sniper", 25);
    self zm_audio::function_6191af93(#"magicbox", #"raygun", #"hash_e1b7317229bdec5", #"raygun", 25);
    self zm_audio::function_6191af93(#"kill", #"homunculus", #"hash_fe54ed4fd5d8e31", #"homunculus", 25);
    self zm_audio::function_6191af93(#"kill", #"explosive", #"hash_fe54ed4fd5d8e31", #"explosive", 25);
    self zm_audio::function_6191af93(#"kill", #"headshot", #"hash_fe54ed4fd5d8e31", #"headshot", 25);
    self zm_audio::function_6191af93(#"kill", #"streak_self", #"hash_fe54ed4fd5d8e31", #"streak_self", 25);
    self zm_audio::function_6191af93(#"kill", #"melee", #"hash_fe54ed4fd5d8e31", #"melee", 25);
    self zm_audio::function_6191af93(#"kill", #"raygun", #"hash_fe54ed4fd5d8e31", #"raygun", 25);
    self zm_audio::function_6191af93(#"kill", #"specialround", #"hash_fe54ed4fd5d8e31", #"specialround", 25);
    self zm_audio::function_6191af93(#"powerup", #"firesale", #"hash_336075b054ae439f", #"firesale", 25);
    self zm_audio::function_6191af93(#"powerup", #"nuke", #"hash_336075b054ae439f", #"nuke", 25);
    self zm_audio::function_6191af93(#"revive", #"down", #"hash_319bb42d8dc9a388", #"down", 25);
    self zm_audio::function_6191af93(#"revive", #"support_demp", #"hash_319bb42d8dc9a388", #"support_demp", 25);
    self zm_audio::function_6191af93(#"revive", #"support_niko", #"hash_319bb42d8dc9a388", #"support_niko", 25);
    self zm_audio::function_6191af93(#"revive", #"support_take", #"hash_319bb42d8dc9a388", #"support_take", 25);
    self zm_audio::function_6191af93(#"general", #"attacked", #"hash_7e2486c17f45616f", #"attacked", 25);
    self zm_audio::function_6191af93(#"general", #"crawl_spawn", #"hash_7e2486c17f45616f", #"crawl_spawn", 25);
    self zm_audio::function_6191af93(#"general", #"gib", #"hash_7e2486c17f45616f", #"gib", 25);
    self zm_audio::function_6191af93(#"general", #"outofmoney", #"hash_7e2486c17f45616f", #"outofmoney", 25);
    self zm_audio::function_6191af93(#"perk", #"generic", #"hash_285be55574f6258d", #"generic", 25);
    self zm_audio::function_6191af93(#"weapon_pickup", #"shield", #"hash_14a052272fa3cf92", #"shield", 25);
    self zm_audio::function_6191af93(#"roundstart", #"special", #"hash_d345ba7a03b3891", #"special", 25);
    self zm_audio::function_6191af93(#"surrounded", #"self", #"hash_7edcffe24c4d3d76", #"self", 25);
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0xb5be17bc, Offset: 0xc80
// Size: 0x98
function function_148c9f71() {
    self endon(#"game_ended");
    callback::on_round_end(&function_76659f5e);
    while (level.var_7e23e2dd < 3) {
        level waittill(#"hash_299e7babad6c5b0e");
        level.var_7e23e2dd++;
    }
    level.var_7e23e2dd = 0;
    level notify(#"hash_2b803f353d8e13c0");
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0xed965352, Offset: 0xd20
// Size: 0xb4
function function_c207b97() {
    self endon(#"death");
    while (level.var_7e23e2dd < 5) {
        self.var_472e3448 = 1;
        self zm_vo::vo_say(level.var_b10a99a1[level.var_7e23e2dd], undefined, 1, undefined, undefined, 1);
        level.var_7e23e2dd++;
        level waittill(#"hash_299e7babad6c5b0e");
    }
    callback::remove_on_round_end(&function_76659f5e);
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0xc53cedc3, Offset: 0xde0
// Size: 0x104
function function_76659f5e() {
    a_e_players = zm_office_floors::function_df2506d3(4);
    foreach (e_player in a_e_players) {
        level notify(#"hash_299e7babad6c5b0e");
        if (e_player zm_characters::is_character(array(#"hash_59f3598ad57dadd8", #"hash_2bcebdf1bef33311", #"hash_5a715cb0a6e071ae"))) {
            level notify(#"hash_299e7babad6c5b0e");
        }
    }
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0x3d600476, Offset: 0xef0
// Size: 0x104
function function_132e0bea() {
    level endon(#"end_game");
    level waittill(#"start_of_round");
    power_trig = getent("use_elec_switch", "targetname");
    if (isdefined(power_trig)) {
        waitresult = undefined;
        waitresult = power_trig waittill(#"trigger");
        user = waitresult.activator;
        wait(2);
        while (isdefined(user) && isdefined(user.isspeaking) && user.isspeaking) {
            waitframe(1);
        }
        play_pentagon_announcer_vox(#"hash_1984a3f4bf85aff0");
    }
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 1, eflags: 0x1 linked
// Checksum 0x19631297, Offset: 0x1000
// Size: 0x94
function function_777b7961(user) {
    flag::clear(#"hash_38f45c699c5d5d63");
    level play_pentagon_announcer_vox(#"hash_450f3dd9fe21becd", 5);
    level play_pentagon_announcer_vox("vox_pentagon_teleport_establish_pann_0");
    user thread zm_vo::function_a2bd5a0c(#"hash_2a834e891cc8667a");
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 2, eflags: 0x1 linked
// Checksum 0x26206374, Offset: 0x10a0
// Size: 0xc2
function play_pentagon_announcer_vox(alias, defcon_level) {
    if (!isdefined(alias)) {
        return;
    }
    if (!isdefined(level.pentann_is_speaking)) {
        level.pentann_is_speaking = 0;
    }
    if (isdefined(defcon_level)) {
        alias = alias + "_" + defcon_level + "_pann_0";
    }
    if (level.pentann_is_speaking == 0) {
        level.pentann_is_speaking = 1;
        level function_b66105cb();
        level function_2389bb7a(alias);
        level.pentann_is_speaking = 0;
    }
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 1, eflags: 0x1 linked
// Checksum 0x9f83af59, Offset: 0x1170
// Size: 0x116
function function_2389bb7a(str_sound) {
    n_wait = float(soundgetplaybacktime(str_sound)) / 1000;
    n_wait = max(n_wait - 0.5, 0.1);
    foreach (player in level.players) {
        if (!zm_office_floors::function_9dd97963(player)) {
            player playsoundtoplayer(str_sound, player);
        }
    }
    wait(n_wait);
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0xc3d1e34b, Offset: 0x1290
// Size: 0x90
function function_b66105cb() {
    structs = struct::get_array("defcon_alarms", "targetname");
    for (i = 0; i < structs.size; i++) {
        playsoundatposition(#"hash_703767be61fa24c0", structs[i].origin);
    }
    wait(0.5);
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0xd215ad89, Offset: 0x1328
// Size: 0x7c
function function_8cbb1711() {
    play_pentagon_announcer_vox(#"hash_447c4584ae2e8e9c");
    e_player = function_d62aaf66();
    if (isdefined(e_player)) {
        e_player zm_audio::create_and_play_dialog(#"generic", #"response_negative", undefined, 1);
    }
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 2, eflags: 0x1 linked
// Checksum 0xdae019e8, Offset: 0x13b0
// Size: 0x9c
function function_d7b93e68(e_player, n_index) {
    if (isdefined(n_index)) {
        level play_pentagon_announcer_vox(#"hash_33a55493071f7af6");
        e_player thread zm_audio::create_and_play_dialog(#"generic", #"response_negative", undefined, 1);
    } else {
        level thread play_pentagon_announcer_vox(#"hash_33a55493071f7af6");
    }
}

// Namespace namespace_8f53e87b/namespace_8f53e87b
// Params 0, eflags: 0x1 linked
// Checksum 0xce275a0f, Offset: 0x1458
// Size: 0x42
function function_d62aaf66() {
    a_players = zm_vo::function_347f7d34();
    e_player = array::random(a_players);
    return e_player;
}

