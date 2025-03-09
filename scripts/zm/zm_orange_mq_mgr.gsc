#using script_4b80fc97d8469299;
#using script_4ec1d631174f7283;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange_lights;
#using scripts\zm\zm_orange_mq_blood;
#using scripts\zm\zm_orange_mq_campfire;
#using scripts\zm\zm_orange_mq_dials;
#using scripts\zm\zm_orange_mq_fuse;
#using scripts\zm\zm_orange_mq_hell;
#using scripts\zm\zm_orange_mq_sendoff;
#using scripts\zm\zm_orange_mq_soapstone;
#using scripts\zm\zm_orange_mq_vessel;
#using scripts\zm\zm_orange_trophies;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_bgb_pack;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_weapons;

#namespace zm_orange_mq_mgr;

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x0
// Checksum 0x106a5391, Offset: 0x298
// Size: 0xb4
function preload() {
    zm_orange_mq_dials::preload();
    zm_orange_mq_vessel::preload();
    zm_orange_mq_blood::preload();
    zm_orange_mq_campfire::preload();
    namespace_4b68b2b3::preload();
    zm_orange_mq_hell::preload();
    zm_orange_mq_sendoff::preload();
    clientfield::register("toplayer", "" + #"hash_668f474410d5c1d0", 24000, 1, "int");
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x0
// Checksum 0x6af85d, Offset: 0x358
// Size: 0x7fc
function main() {
    zm_orange_mq_dials::main();
    zm_orange_mq_vessel::main();
    zm_orange_mq_blood::main();
    zm_orange_mq_campfire::main();
    namespace_4b68b2b3::main();
    zm_orange_mq_hell::main();
    zm_orange_mq_sendoff::init();
    level flag::init("sam_music_done");
    level flag::init(#"hash_18b94410e3b6b0bf");
    zm_sq::register(#"main_quest", #"hash_86e283359f19a5f", #"main_quest_step1", &zm_orange_mq_dials::function_77ed3bab, &zm_orange_mq_dials::function_51ecc801);
    zm_sq::register(#"main_quest", #"hash_467104204a4803ad", #"main_quest_step2", &zm_orange_mq_vessel::function_a5254494, &zm_orange_mq_vessel::function_77e4073b);
    zm_sq::register(#"main_quest", #"hash_7c16d3a3e4250b9a", #"main_quest_step3", &zm_orange_mq_blood::function_8d43b840, &zm_orange_mq_blood::function_2d9e1e29);
    zm_sq::register(#"main_quest", #"hash_2dfcd4264b2c2340", #"main_quest_step4", &zm_orange_mq_campfire::function_13dda28a, &zm_orange_mq_campfire::function_a874e5d0);
    zm_sq::register(#"main_quest", #"hash_c2e45a40a675911", #"main_quest_step5", &zm_orange_mq_soapstone::function_d878e1ee, &zm_orange_mq_soapstone::function_9ee4c8c3);
    zm_sq::register(#"main_quest", #"hash_72bc0ec65f4afcca", #"hash_6289c5eef32eca15", &zm_orange_mq_fuse::function_742dfdb5, &zm_orange_mq_fuse::function_9e34b0d4);
    zm_sq::register(#"main_quest", #"hash_28c88f40ace27a7b", #"hash_6289c2eef32ec4fc", &zm_orange_mq_fuse::function_c723e684, &zm_orange_mq_fuse::function_3d5a45fb);
    zm_sq::register(#"main_quest", #"hash_382d731d4de07ed3", #"main_quest_step7", &zm_orange_mq_blood::function_8d43b840, &zm_orange_mq_blood::function_2d9e1e29);
    zm_sq::register(#"main_quest", #"hash_2c00866b95e17ff5", #"main_quest_step8", &zm_orange_mq_campfire::function_13dda28a, &zm_orange_mq_campfire::function_a874e5d0);
    zm_sq::register(#"main_quest", #"hash_ebca448700872b8", #"hash_62afa5eef34f62f2", &namespace_4b68b2b3::function_1faf4b9, &namespace_4b68b2b3::function_a8748143);
    zm_sq::register(#"main_quest", #"hash_810019231f11ea1", #"hash_62afa4eef34f613f", &namespace_4b68b2b3::function_91fbb734, &namespace_4b68b2b3::function_c2898bf0);
    zm_sq::register(#"main_quest", #"hash_11c4f1ecb0dd5a34", #"main_quest_step10", &zm_orange_mq_blood::function_8d43b840, &zm_orange_mq_blood::function_2d9e1e29);
    zm_sq::register(#"main_quest", #"hash_d0bf3cf30a07a84", #"main_quest_step11", &zm_orange_mq_campfire::function_13dda28a, &zm_orange_mq_campfire::function_a874e5d0);
    zm_sq::register(#"main_quest", #"hash_13b9abe1bd17294c", #"main_quest_step12", &namespace_4b68b2b3::function_816c3132, &namespace_4b68b2b3::function_3c9be590);
    zm_sq::register(#"main_quest", #"hash_7d78cef11f6afb5e", #"main_quest_step13", &zm_orange_mq_hell::function_5309464a, &zm_orange_mq_hell::function_ae270d9e);
    zm_sq::register(#"main_quest", #"hash_2bd81e2b05fccbed", #"main_quest_step14", &zm_orange_mq_sendoff::function_5309464a, &zm_orange_mq_sendoff::function_ae270d9e);
    zm_sq::register(#"main_quest", #"hash_49b41abaa9addedd", #"main_quest_step15", &function_d4147875, &function_895265b1, 1);
    if (zm_utility::is_ee_enabled()) {
        level thread function_93a140f7();
    }
    level.var_d1cf60c8 = getentarray("loc_outro_vo", "targetname");
    foreach (loc in level.var_d1cf60c8) {
        loc hide();
    }
    level thread function_fe09cd56();
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x0
// Checksum 0x370c2da8, Offset: 0xb60
// Size: 0x5c
function function_93a140f7() {
    level endon(#"end_game");
    while (level.var_a43a746d < 2) {
        wait 2;
    }
    zm_sq::start(#"main_quest");
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 1, eflags: 0x0
// Checksum 0x7e8fd85c, Offset: 0xbc8
// Size: 0x1a
function function_cb512dd4(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        wait 10;
    }
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 2, eflags: 0x0
// Checksum 0x5d10585f, Offset: 0xbf0
// Size: 0x14
function function_f615b0f(var_5ea5c94d, ended_early) {
    
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x0
// Checksum 0xd2933143, Offset: 0xc10
// Size: 0x14c
function play_outro() {
    a_e_players = getplayers();
    if (a_e_players.size > 1) {
        foreach (e_player in a_e_players) {
            if (e_player laststand::player_is_in_laststand()) {
                e_player thread zm_laststand::auto_revive(e_player);
            }
        }
        array::thread_all(a_e_players, &zm_player::spectator_respawn_player);
    }
    zm_hms_util::function_3c173d37();
    level zm_audio::sndvoxoverride(1);
    lui::play_movie(#"zm_orange_outro", "fullscreen", 1, 0, 0, #"hash_1d54dda4d1e82bc3", undefined, 0);
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 1, eflags: 0x0
// Checksum 0x122ab0fc, Offset: 0xd68
// Size: 0x684
function function_d4147875(var_5ea5c94d) {
    zm_hms_util::pause_zombies(1, 0);
    zm_orange_lights::function_b1c6d4f2();
    level flag::set(#"hold_round_end");
    level thread play_outro();
    wait 320;
    println("<dev string:x38>");
    level thread lui::screen_flash(0.2, 7, 7, 1, "black");
    wait 0.3;
    level.var_583a0efc = getstatuseffect(#"zm_orange_outro");
    println("<dev string:x5c>");
    hud_disable();
    veh_start = getvehiclenode("mq_gehen_01", "targetname");
    veh_end = getvehiclenode("mq_gehen_02", "targetname");
    println("<dev string:x71>");
    sam_spawner = getent("mq_gehen_s", "targetname");
    level.sam = sam_spawner spawnfromspawner("sam", 1);
    level.sam.team = #"allies";
    util::magic_bullet_shield(level.sam);
    eddie_spawner = getent("mq_gehen_e", "targetname");
    eddie = eddie_spawner spawnfromspawner("eddie", 1);
    eddie.team = #"allies";
    util::magic_bullet_shield(eddie);
    waitframe(1);
    println("<dev string:x93>");
    namespace_3b9dec72::function_1c989dc4();
    println("<dev string:xb4>");
    zm_orange_lights::function_e9f6e0f7();
    println("<dev string:xd1>");
    array::thread_all(level.var_d1cf60c8, &function_74963add);
    println("<dev string:x109>");
    a_e_players = getplayers();
    n_player = 1;
    foreach (player in a_e_players) {
        player.var_c5e36086 = 1;
        player thread function_c40f70df(n_player);
        n_player++;
    }
    wait 1;
    println("<dev string:x136>");
    namespace_3b9dec72::function_303ab700();
    println("<dev string:x157>");
    level.var_9441bf02 = spawn("script_origin", (0, 0, 0));
    level.var_9441bf02 playloopsound(#"hash_503b99b370ac70b9");
    println("<dev string:x172>");
    wait 5;
    println("<dev string:x1a3>");
    level.musicsystemoverride = 1;
    music::setmusicstate("sam_eddie_walk");
    thread music_watcher();
    println("<dev string:x1ba>");
    while (true) {
        waitframe(1);
        _attack_barrier_sprint = vectornormalize(veh_end.origin - level.sam.origin);
        var_7d910a84 = vectordot(_attack_barrier_sprint, anglestoforward(level.sam.angles));
        if (var_7d910a84 < 0) {
            break;
        }
    }
    namespace_3b9dec72::function_10add6a8();
    namespace_3b9dec72::function_ddbe2dbb(1000);
    wait 5;
    level thread lui::screen_flash(10, 30, 5, 1, "white");
    while (!flag::get("sam_music_done")) {
        wait 0.5;
    }
    wait 8;
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x0
// Checksum 0x1e20ac38, Offset: 0x13f8
// Size: 0x2c
function music_watcher() {
    wait 120;
    level flag::set(#"sam_music_done");
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 2, eflags: 0x0
// Checksum 0x2f262384, Offset: 0x1430
// Size: 0x80
function function_895265b1(var_5ea5c94d, ended_early) {
    zm_orange_trophies::function_ea67bd7c();
    level.var_9441bf02 delete();
    level.musicsystemoverride = 0;
    music::setmusicstate("none");
    wait 2;
    level notify(#"end_game");
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x0
// Checksum 0x5e723729, Offset: 0x14b8
// Size: 0xbc
function function_74963add() {
    while (true) {
        waitframe(1);
        _attack_barrier_sprint = vectornormalize(self.origin - level.sam.origin);
        var_7d910a84 = vectordot(_attack_barrier_sprint, anglestoforward(level.sam.angles));
        if (var_7d910a84 < 0) {
            break;
        }
    }
    playsoundatposition(self.script_string, self.origin);
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x0
// Checksum 0xe5427b87, Offset: 0x1580
// Size: 0x120
function hud_disable() {
    foreach (player in getplayers()) {
        player showcrosshair(0);
        player allowcrouch(0);
        player thread function_b20c4898();
        player clientfield::set_to_player("" + #"hash_668f474410d5c1d0", 1);
        player val::set(#"gehen", "disable_weapons", 1);
    }
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x0
// Checksum 0x60208315, Offset: 0x16a8
// Size: 0xd0
function hud_enable() {
    foreach (player in getplayers()) {
        player showcrosshair(1);
        player allowcrouch(1);
        player clientfield::set_to_player("" + #"hash_668f474410d5c1d0", 0);
    }
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x0
// Checksum 0x6c538b3f, Offset: 0x1780
// Size: 0x66
function function_b20c4898() {
    level endon(#"end_game");
    self endon(#"death");
    while (true) {
        self status_effect::status_effect_apply(level.var_583a0efc, undefined, self, 0);
        wait 30;
    }
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 1, eflags: 0x0
// Checksum 0x48edd3e, Offset: 0x17f0
// Size: 0x354
function function_c40f70df(var_21c1ba1) {
    level endon(#"end_game");
    self endon(#"death");
    println("<dev string:x20d>" + var_21c1ba1 + "<dev string:x217>");
    self bgb::suspend_weapon_cycling();
    self bgb_pack::function_ac9cb612(1);
    self util::magic_bullet_shield();
    self allowsprint(0);
    self allowcrouch(0);
    self allowprone(0);
    self allowmelee(0);
    self allowads(0);
    self hide();
    w_current = self getcurrentweapon();
    if (w_current.name == #"ww_tesla_sniper_t8" || w_current.name == #"ww_tesla_sniper_upgraded_t8") {
        self zm_weapons::weapon_give(level.weaponzmfists, 1);
    }
    waitframe(1);
    println("<dev string:x20d>" + var_21c1ba1 + "<dev string:x233>");
    self zm_trial_util::function_3f8a4145(0);
    if (!self laststand::player_is_in_laststand()) {
        str_stance = self getstance();
        switch (str_stance) {
        case #"crouch":
            self setstance("stand");
            println("<dev string:x20d>" + var_21c1ba1 + "<dev string:x248>");
            wait 0.2;
            break;
        case #"prone":
            self setstance("stand");
            println("<dev string:x20d>" + var_21c1ba1 + "<dev string:x273>");
            wait 1;
            break;
        }
    }
    println("<dev string:x20d>" + var_21c1ba1 + "<dev string:x29b>");
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x0
// Checksum 0x17424876, Offset: 0x1b50
// Size: 0x1f4
function function_fe09cd56() {
    n_length = 12;
    angle = (0, 270, 0);
    start_pos = (-8752, 50696, 1784);
    pos = start_pos;
    for (i = 0; i < n_length; i++) {
        spawncollision("collision_clip_wall_512x512x10", "collider", pos, angle);
        pos += (512, 0, 0);
    }
    angle = (0, 270, 0);
    start_pos = (-8752, 50216, 1784);
    pos = start_pos;
    for (i = 0; i < n_length; i++) {
        spawncollision("collision_clip_wall_512x512x10", "collider", pos, angle);
        pos += (512, 0, 0);
    }
    angle = (90, 0, 0);
    start_pos = (-8752, 50456, 2040);
    pos = start_pos;
    for (i = 0; i < n_length; i++) {
        spawncollision("collision_clip_wall_512x512x10", "collider", pos, angle);
        pos += (512, 0, 0);
    }
    angle = (0, 0, 0);
    start_pos = (-3656, 50456, 1792);
    spawncollision("collision_clip_wall_512x512x10", "collider", pos, angle);
}

