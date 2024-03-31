// Atian COD Tools GSC decompiler test
#using scripts\zm_common\trials\zm_trial_force_archetypes.gsc;
#using scripts\zm_common\trials\zm_trial_special_enemy.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using script_24c32478acf44108;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_lockdown_util.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_grappler.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm\weapons\zm_weap_riotshield.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\destructible_character.gsc;
#using scripts\core_common\ai\archetype_blight_father_interface.gsc;
#using scripts\core_common\ai\archetype_blight_father.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\archetype_mocomps_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\debug.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\archetype_locomotion_utility.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace zm_ai_blight_father;

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x2
// Checksum 0x9e5cb69b, Offset: 0xbc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_blight_father", &__init__, undefined, undefined);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0xdeb49cf4, Offset: 0xc10
// Size: 0x9ca
function __init__() {
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"blight_father", &function_7c52f40);
    spawner::function_89a2cd87(#"blight_father", &function_95a6fbef);
    zm_utility::function_d0f02e71(#"blight_father");
    callback::on_spawned(&on_player_spawned);
    function_ce1b7f67();
    clientfield::register("actor", "blight_father_amb_sac_clientfield", 1, 1, "int");
    clientfield::register("actor", "blight_father_weakpoint_l_elbow_fx", 1, 1, "int");
    clientfield::register("actor", "blight_father_weakpoint_r_elbow_fx", 1, 1, "int");
    clientfield::register("actor", "blight_father_weakpoint_l_maggot_sac_fx", 1, 1, "int");
    clientfield::register("actor", "blight_father_weakpoint_r_maggot_sac_fx", 1, 1, "int");
    clientfield::register("actor", "blight_father_weakpoint_jaw_fx", 1, 1, "int");
    clientfield::register("scriptmover", "blight_father_purchase_lockdown_vomit_fx", 1, 3, "int");
    clientfield::register("toplayer", "tongueGrabPostFx", 1, 1, "int");
    clientfield::register("toplayer", "tongueGrabRumble", 1, 1, "int");
    clientfield::register("actor", "blight_father_vomit_fx", 1, 2, "int");
    clientfield::register("actor", "blight_father_spawn_maggot_fx_left", 1, 1, "counter");
    clientfield::register("actor", "blight_father_spawn_maggot_fx_right", 1, 1, "counter");
    clientfield::register("actor", "mtl_blight_father_clientfield", 1, 1, "int");
    clientfield::register("scriptmover", "blight_father_maggot_trail_fx", 1, 1, "int");
    clientfield::register("scriptmover", "blight_father_chaos_missile_explosion_clientfield", 1, 1, "int");
    clientfield::register("toplayer", "blight_father_chaos_missile_rumble_clientfield", 1, 1, "counter");
    clientfield::register("toplayer", "blight_father_vomit_postfx_clientfield", 1, 1, "int");
    clientfield::register("scriptmover", "blight_father_gib_explosion", 1, 1, "int");
    clientfield::register("actor", "blight_father_death_fx", 17000, 6, "int");
    level thread aat::register_immunity("zm_aat_brain_decay", #"blight_father", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_frostbite", #"blight_father", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_kill_o_watt", #"blight_father", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_plasmatic_burst", #"blight_father", 1, 1, 1);
    blight_father_spawner = getent("zombie_spawner_blight_father", "targetname");
    zm_transform::function_cfca77a7(blight_father_spawner, #"blight_father", &function_39212989, 10, &function_3a0cdf7f, &function_8e4c43d3, "aib_vign_zm_zod_bltfthr_spawn_pre_split", "aib_vign_zm_zod_bltfthr_spawn_post_split");
    zm_spawner::register_zombie_death_event_callback(&killed_callback);
    callback::on_ai_killed(&function_7bef9c3c);
    zm_round_spawning::register_archetype(#"blight_father", &function_633d7436, &round_spawn, undefined, 300);
    zm_round_spawning::function_306ce518(#"blight_father", &function_fa00e485);
    zm_cleanup::function_cdf5a512(#"blight_father", &function_2628e1c2);
    if (true) {
        level.var_445e24c8 = [];
        for (i = 0; i < 12; i++) {
            trigger = spawn("trigger_damage", (0, 0, 0), 0, 40, 40);
            trigger enablelinkto();
            trigger.inuse = 0;
            trigger triggerenable(0);
            if (!isdefined(level.var_445e24c8)) {
                level.var_445e24c8 = [];
            } else if (!isarray(level.var_445e24c8)) {
                level.var_445e24c8 = array(level.var_445e24c8);
            }
            level.var_445e24c8[level.var_445e24c8.size] = trigger;
        }
    }
    level.var_c2981ce9 = [#"tag_mouth_weakspot":&function_fa7c080, #"tag_elbow_weakspot_le":&function_9bbe631c, #"tag_elbow_weakspot_ri":&function_5a1a4ad, #"tag_eggsack_weakspot_le":&function_40034805, #"tag_eggsack_weakspot_ri":&function_33b2c99e];
    zm_ai_utility::function_2ad308c4(#"blight_father", &function_744be31d);
    zm_trial_special_enemy::function_95c1dd81(#"blight_father", &function_2315440d);
    namespace_9ff9f642::register_slowdown(#"hash_2fd5f5f16583a427", 0.8);
    callback::add_callback(#"on_host_migration_begin", &on_host_migration_begin);
    callback::add_callback(#"on_host_migration_end", &on_host_migration_end);
    level.var_fcb96175 = 0;
    /#
        spawner::add_archetype_spawn_function(#"blight_father", &zombie_utility::updateanimationrate);
        level thread function_a2751530();
    #/
    level.var_a51ca41a = 0;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 4, eflags: 0x5 linked
// Checksum 0x8a8f0add, Offset: 0x15e8
// Size: 0x7c
function private function_3e8300e9(entity, attribute, oldvalue, value) {
    if (value == "low") {
        entity thread namespace_9ff9f642::slowdown(#"hash_2fd5f5f16583a427");
        return;
    }
    entity thread namespace_9ff9f642::function_520f4da5(#"hash_2fd5f5f16583a427");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0xe818c0a8, Offset: 0x1670
// Size: 0x12
function private on_player_spawned() {
    self.grapple_tag = "j_mainroot";
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0x80f724d1, Offset: 0x1690
// Size: 0x4
function private function_ce1b7f67() {
    
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0xe52df68, Offset: 0x16a0
// Size: 0x668
function private function_7c52f40() {
    self endon(#"death");
    self.zombie_move_speed = "sprint";
    self zombie_utility::function_df5afb5e(0);
    if (!(isdefined(level.var_a2831281) && level.var_a2831281) && !zm_trial_special_enemy::is_active() && !zm_trial_force_archetypes::function_ff2a74e7(#"blight_father") && !(isdefined(level.var_f300b600) && level.var_f300b600)) {
        self.ignore_enemy_count = 1;
    }
    self.var_77f481e1 = 1;
    self.var_126d7bef = 1;
    self.ignore_nuke = 1;
    self.lightning_chain_immune = 1;
    self.instakill_func = &zm_powerups::function_16c2586a;
    self.var_f46fbf3f = 1;
    self.no_powerups = 1;
    self.var_2703428f = self ai::function_9139c839().var_fc5eff78;
    self attach("c_t8_zmb_blightfather_mouth");
    self attach("c_t8_zmb_blightfather_elbow1_le");
    self attach("c_t8_zmb_blightfather_elbow1_ri");
    self attach("c_t8_zmb_blightfather_eggsack1_both");
    self attach("c_t8_zmb_blightfather_tongue2");
    self hidepart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
    aiutility::addaioverridedamagecallback(self, &function_afce1cf);
    aiutility::addaioverridedamagecallback(self, &function_515b4a87);
    self.var_f7c29bc4 = gettime() + self ai::function_9139c839().var_eed65399;
    self.var_e6c8672d = 1;
    self.grapple_tag = "tag_jaw";
    self.var_c8088bcb = {#traces:[], #timestamp:gettime()};
    self.var_b2a80abc = gettime() + self ai::function_9139c839().var_f246f6de;
    self.var_acfc1c7c = &function_76c1f56f;
    self.var_80cf70fb = &function_3e8300e9;
    self.var_11a49434 = &function_c90a5ebb;
    self.closest_player_override = &zm_utility::function_c52e1749;
    self.var_72411ccf = &function_911c3934;
    self.var_ee833cd6 = &function_ee833cd6;
    self.cant_move_cb = &zombiebehavior::function_79fe956f;
    self.should_zigzag = 0;
    self.var_ab8f2b90 = 5;
    self.completed_emerging_into_playable_area = 1;
    self.ignorepathenemyfightdist = 1;
    self.var_81eb8127 = &function_babdb8e7;
    self.var_a4a10040 = &function_cf18d183;
    self.var_e38eaee5 = gettime();
    if (!isdefined(self.var_506922ab)) {
        self.var_506922ab = [];
    }
    if (!isdefined(self.var_506922ab)) {
        self.var_506922ab = [];
    } else if (!isarray(self.var_506922ab)) {
        self.var_506922ab = array(self.var_506922ab);
    }
    self.var_506922ab[self.var_506922ab.size] = &function_36b05ed0;
    self allowpitchangle(1);
    self setpitchorient();
    level thread zm_spawner::zombie_death_event(self);
    self thread zm_utility::update_zone_name();
    self thread zm_audio::play_ambient_zombie_vocals();
    self collidewithactors(1);
    self.deathfunction = &zm_spawner::zombie_death_animscript;
    if (!isdefined(level.var_6213dc32)) {
        level.var_6213dc32 = getweapon("zombie_ai_defaultmelee");
    }
    util::wait_network_frame();
    self clientfield::set("blight_father_weakpoint_l_elbow_fx", 1);
    self clientfield::set("blight_father_weakpoint_r_elbow_fx", 1);
    self clientfield::set("blight_father_weakpoint_l_maggot_sac_fx", 1);
    self clientfield::set("blight_father_weakpoint_r_maggot_sac_fx", 1);
    self clientfield::set("blight_father_weakpoint_jaw_fx", 1);
    self clientfield::set("blight_father_amb_sac_clientfield", 1);
    target_set(self);
    level.var_a51ca41a++;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0xb7c0b537, Offset: 0x1d10
// Size: 0xfc
function private function_95a6fbef() {
    self.maxhealth = int(self zm_ai_utility::function_8d44707e(1, self._starting_round_number) * (isdefined(level.var_9503486c) ? level.var_9503486c : 1));
    self.health = self.maxhealth;
    namespace_81245006::initweakpoints(self, #"c_t8_zmb_blightfather_weakpoint_def");
    zm_score::function_e5d6e6dd(#"blight_father", self ai::function_9139c839().var_bd058b07);
    self zm_score::function_82732ced();
    /#
        function_f8411b4d(self);
    #/
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xbe595e0a, Offset: 0x1e18
// Size: 0xdc
function private function_36b05ed0(entity) {
    entity hidepart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
    entity.var_fbec06fa = undefined;
    entity.knockdown = undefined;
    var_65ba9602 = zm_lockdown_util::function_87c1193e(entity);
    if (isdefined(var_65ba9602)) {
        zm_lockdown_util::function_77caff8b(var_65ba9602);
        entity.var_3acacb18 = undefined;
        entity.b_ignore_cleanup = entity.var_ca0d8389;
        entity.var_ca0d8389 = undefined;
    }
    entity thread function_d67c455e();
    function_c526065b(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x32562475, Offset: 0x1f00
// Size: 0xdc
function private killed_callback(e_attacker) {
    if (self.archetype != #"blight_father") {
        return;
    }
    self clientfield::set("blight_father_amb_sac_clientfield", 0);
    if (!isplayer(e_attacker)) {
        return;
    }
    if (level flag::get("zombie_drop_powerups") && !zm_utility::is_standard()) {
        self thread zm_powerups::specific_powerup_drop(self.var_d0686fde, self.origin, undefined, undefined, undefined, undefined, undefined, undefined, 0, 1);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xbc8ef27, Offset: 0x1fe8
// Size: 0x3c
function private function_7bef9c3c(params) {
    if (self.archetype !== #"blight_father") {
        return;
    }
    self function_76c1f56f();
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0xc13c5b91, Offset: 0x2030
// Size: 0x12
function function_ee833cd6() {
    self.completed_emerging_into_playable_area = 1;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0xbe680f8e, Offset: 0x2050
// Size: 0x288
function function_2628e1c2() {
    if (!isdefined(level.var_801efcc7)) {
        level.var_801efcc7 = struct::get_array("blight_father_location", "script_noteworthy");
    }
    if (level.var_801efcc7.size < 1) {
        self.b_ignore_cleanup = 1;
        return 1;
    }
    if (zm_utility::is_standard() && level flag::exists("started_defend_area") && level flag::get("started_defend_area")) {
        self.b_ignore_cleanup = 1;
        return 1;
    }
    var_31f7011a = arraycopy(level.players);
    var_31f7011a = arraysortclosest(var_31f7011a, self.origin);
    i = 0;
    var_b2aa54a9 = level.var_801efcc7[0];
    var_56feeec4 = distancesquared(var_31f7011a[0].origin, var_b2aa54a9.origin);
    foreach (var_d7eff26a in level.var_801efcc7) {
        if (!zm_utility::is_player_valid(var_31f7011a[i])) {
            i++;
            if (i >= var_31f7011a.size) {
                i = 0;
                util::wait_network_frame();
            }
            continue;
        }
        var_e8ab126e = distancesquared(var_31f7011a[i].origin, var_d7eff26a.origin);
        if (var_e8ab126e < var_56feeec4) {
            var_56feeec4 = var_e8ab126e;
            var_b2aa54a9 = var_d7eff26a;
        }
    }
    if (!isdefined(self)) {
        return;
    }
    self zm_ai_utility::function_a8dc3363(var_b2aa54a9);
    return 1;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0x27d6a808, Offset: 0x22e0
// Size: 0x1174
function private registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&function_2784f3ff));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_148b4066ca34ac7d", &function_2784f3ff);
    /#
        assert(isscriptfunctionptr(&function_d6ded650));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5c96eb204e351d55", &function_d6ded650);
    /#
        assert(isscriptfunctionptr(&function_d6fbf1b7));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7121da36951eb072", &function_d6fbf1b7);
    /#
        assert(isscriptfunctionptr(&function_1d9f449a));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_32703c2c1d28f6f8", &function_1d9f449a);
    /#
        assert(isscriptfunctionptr(&function_2ed4a174));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_68ad8f05c187147e", &function_2ed4a174);
    /#
        assert(isscriptfunctionptr(&function_e1ba6416));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2fa134b71f113f7a", &function_e1ba6416);
    /#
        assert(isscriptfunctionptr(&function_8383fdf9));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_73649a2d01c11f41", &function_8383fdf9);
    /#
        assert(isscriptfunctionptr(&blightfathershouldmelee));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"blightfathershouldmelee", &blightfathershouldmelee);
    /#
        assert(isscriptfunctionptr(&blightfathershouldshowpain));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"blightfathershouldshowpain", &blightfathershouldshowpain);
    /#
        assert(isscriptfunctionptr(&function_3515ad4b));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_41aa80b14334caac", &function_3515ad4b);
    /#
        assert(isscriptfunctionptr(&function_aaad8487));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_124ccb4b34a00c0f", &function_aaad8487);
    /#
        assert(isscriptfunctionptr(&function_4bd1c37e));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_667d737e6c9aba40", &function_4bd1c37e);
    /#
        assert(isscriptfunctionptr(&blightfatherdeathstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"blightfatherdeathstart", &blightfatherdeathstart);
    /#
        assert(isscriptfunctionptr(&function_1177eb85));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7ef0bb5832b7989d", &function_1177eb85);
    /#
        assert(isscriptfunctionptr(&function_d5a0a1eb));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1db7e3af327c9b04", &function_d5a0a1eb);
    /#
        assert(isscriptfunctionptr(&function_e0d8f770));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7817d265f22976fd", &function_e0d8f770);
    /#
        assert(isscriptfunctionptr(&function_f108c0ea));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_21c5672c06f01755", &function_f108c0ea);
    /#
        assert(isscriptfunctionptr(&function_b5b42347));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_45f5d3d442f48795", &function_b5b42347);
    /#
        assert(isscriptfunctionptr(&function_283b9654));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3598ca6c9a0b1b1", &function_283b9654);
    /#
        assert(isscriptfunctionptr(&function_173d7fb2));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4913708f18cd3e3e", &function_173d7fb2);
    /#
        assert(isscriptfunctionptr(&function_bc3eb15a));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6a7eedc191a3f371", &function_bc3eb15a);
    /#
        assert(isscriptfunctionptr(&function_1dac0714));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_ae71931f5fb12d8", &function_1dac0714);
    /#
        assert(isscriptfunctionptr(&function_fc84db95));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_23b3b2b5a3230cc5", &function_fc84db95);
    /#
        assert(isscriptfunctionptr(&function_8d9b9683));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_77b88d91d0990898", &function_8d9b9683);
    /#
        assert(isscriptfunctionptr(&function_d83ac1e7));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6e5059e0839da879", &function_d83ac1e7);
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&function_b62014ac) || isscriptfunctionptr(&function_b62014ac));
    #/
    /#
        assert(!isdefined(&function_928e66ad) || isscriptfunctionptr(&function_928e66ad));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_7ebcf0c2d647b3a2", undefined, &function_b62014ac, &function_928e66ad);
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&function_8cbef8fd) || isscriptfunctionptr(&function_8cbef8fd));
    #/
    /#
        assert(!isdefined(&function_928e66ad) || isscriptfunctionptr(&function_928e66ad));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_efb5b2c25a5b7cb", undefined, &function_8cbef8fd, &function_928e66ad);
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&function_fa33f4aa) || isscriptfunctionptr(&function_fa33f4aa));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_7b6603199659e6ff", undefined, &function_fa33f4aa, undefined);
    animationstatenetwork::registernotetrackhandlerfunction("blight_father_tongue_grab_launch", &function_28dddd64);
    animationstatenetwork::registernotetrackhandlerfunction("blight_father_vomit_start", &function_7a634eaa);
    animationstatenetwork::registernotetrackhandlerfunction("fire_left", &function_d2b91209);
    animationstatenetwork::registernotetrackhandlerfunction("fire_right", &function_78f5c48e);
    animationstatenetwork::registernotetrackhandlerfunction("blight_father_melee", &function_ac921de9);
    animationstatenetwork::registernotetrackhandlerfunction("blight_father_show_tongue", &function_51ead3e8);
    animationstatenetwork::registernotetrackhandlerfunction("blight_father_hide_tongue", &function_bb6aa70c);
    animationstatenetwork::registernotetrackhandlerfunction("blightfather_explode", &function_b78adc65);
    animationstatenetwork::registeranimationmocomp("mocomp_purchase_lockdown_vomit@blight_father", &function_6ab8460f, undefined, undefined);
    animationstatenetwork::registeranimationmocomp("mocomp_grapple_attack_launch@blight_father", &function_299dd40e, &function_689831cf, &function_42de48fb);
    /#
        assert(isscriptfunctionptr(&function_7055b26));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3ab9ffa56496f9a1", &function_7055b26);
    /#
        assert(isscriptfunctionptr(&function_f2914d65));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_116b298d64ab0478", &function_f2914d65);
    /#
        assert(isscriptfunctionptr(&function_563d56de));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7156796e4e9cd68", &function_563d56de);
    /#
        assert(isscriptfunctionptr(&function_b3f66ac3));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7a04596792c5199d", &function_b3f66ac3);
    /#
        assert(isscriptfunctionptr(&function_1d2646));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_435c602040220705", &function_1d2646);
    /#
        assert(isscriptfunctionptr(&function_62b3b7a3));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_483c1950bc1df07f", &function_62b3b7a3);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0xa4409f8a, Offset: 0x3460
// Size: 0x1c4
function function_b78adc65(entity) {
    if (entity isragdoll()) {
        entity showpart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
        if (entity isattached("c_t8_zmb_blightfather_eggsack1_both")) {
            entity detach("c_t8_zmb_blightfather_eggsack1_both");
        } else if (entity isattached("c_t8_zmb_blightfather_eggsack1_le")) {
            entity detach("c_t8_zmb_blightfather_eggsack1_le");
        } else if (entity isattached("c_t8_zmb_blightfather_eggsack1_ri")) {
            entity detach("c_t8_zmb_blightfather_eggsack1_ri");
        }
        entity hidepart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
        return;
    }
    if (isdefined(entity.gib_model)) {
        entity.gib_model clientfield::set("blight_father_gib_explosion", 1);
        entity.gib_model stopanimscripted(0, 1);
        entity.gib_model startragdoll();
    }
    entity delete();
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0x72c9ae04, Offset: 0x3630
// Size: 0x4c
function private function_529b7fb9() {
    self endon(#"death");
    level waittilltimeout(300, #"clear_all_corpses");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0x91f153e8, Offset: 0x3688
// Size: 0x8e
function function_4589bd24() {
    if (isdefined(self.favoriteenemy)) {
        predictedpos = self lastknownpos(self.favoriteenemy);
        if (isdefined(predictedpos)) {
            turnyaw = absangleclamp360(self.angles[1] - vectortoangles(predictedpos - self.origin)[1]);
            return turnyaw;
        }
    }
    return undefined;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0xf03974d5, Offset: 0x3720
// Size: 0x18e
function function_753b4884() {
    if (zm_lockdown_util::function_7bfa8895(self)) {
        stub = zm_lockdown_util::function_87c1193e(self);
        var_4afb24b6 = zm_lockdown_util::function_dab6d796(self, stub);
        if (isdefined(var_4afb24b6)) {
            turnyaw = absangleclamp360(self.angles[1] - vectortoangles(var_4afb24b6.origin - self.origin)[1]);
        } else {
            /#
                println("mocomp_purchase_lockdown_vomit@blight_father" + self getentitynumber() + "tag_tongue" + self.origin[0] + "face angle" + self.origin[1] + "face angle" + self.origin[2] + "j_head");
            #/
            turnyaw = absangleclamp360(self.angles[1] - vectortoangles(stub.origin - self.origin)[1]);
        }
        return turnyaw;
    }
    return undefined;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x88bac70d, Offset: 0x38b8
// Size: 0x12a
function private function_f2914d65(entity) {
    enemies = getaiarchetypearray(#"zombie");
    enemies = arraycombine(enemies, getaiarchetypearray(#"catalyst"), 0, 0);
    enemies = array::filter(enemies, 0, &function_3d752709, entity);
    foreach (enemy in enemies) {
        enemy zombie_utility::setup_zombie_knockdown(entity);
        enemy.knockdown_type = "knockdown_shoved";
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0x8345e072, Offset: 0x39f0
// Size: 0x1a8
function private function_3d752709(enemy, target) {
    if (isdefined(enemy.knockdown) && enemy.knockdown) {
        return false;
    }
    if (gibserverutils::isgibbed(enemy, 384)) {
        return false;
    }
    if (distancesquared(enemy.origin, target.origin) > self ai::function_9139c839().var_2e53b0a6 * self ai::function_9139c839().var_2e53b0a6) {
        return false;
    }
    facingvec = anglestoforward(target.angles);
    enemyvec = enemy.origin - target.origin;
    var_3e3c8075 = (enemyvec[0], enemyvec[1], 0);
    var_c2ee8451 = (facingvec[0], facingvec[1], 0);
    var_3e3c8075 = vectornormalize(var_3e3c8075);
    var_c2ee8451 = vectornormalize(var_c2ee8451);
    enemydot = vectordot(var_c2ee8451, var_3e3c8075);
    if (enemydot < 0) {
        return false;
    }
    return true;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0x6e25a79, Offset: 0x3ba0
// Size: 0x4a
function private function_69b8daf(origin, angles) {
    fx_model = util::spawn_model(#"tag_origin", origin, angles);
    return fx_model;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x28947caf, Offset: 0x3bf8
// Size: 0x24
function private blightfathershouldshowpain(entity) {
    if (isdefined(entity.var_fbec06fa)) {
        return true;
    }
    return false;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xe7943e64, Offset: 0x3c28
// Size: 0x54
function private function_8d9b9683(entity) {
    function_173d7fb2(entity);
    entity thread function_d67c455e();
    function_c526065b(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xb081c6d, Offset: 0x3c88
// Size: 0x6c
function private function_3515ad4b(entity) {
    return blightfathershouldshowpain(entity) || zm_behavior::zombieshouldstun(entity) || function_2ed4a174(entity) || zm_behavior::zombieshouldknockdown(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x1c8449c8, Offset: 0x3d00
// Size: 0x22
function private function_173d7fb2(entity) {
    entity.var_fbec06fa = undefined;
    entity.var_cdc2bec8 = undefined;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 12, eflags: 0x5 linked
// Checksum 0x36414428, Offset: 0x3d30
// Size: 0x178
function private function_515b4a87(inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (!(isdefined(self.var_c8f98f87) && self.var_c8f98f87) && isdefined(self.e_grapplee) && (hitloc == "head" || attacker === self.e_grapplee)) {
        if (!isdefined(self.var_cdc2bec8)) {
            self.var_cdc2bec8 = 0;
        }
        self.var_cdc2bec8 = self.var_cdc2bec8 + damage;
        if (function_2ed4a174(self)) {
            self.e_glidin = inflictor;
        }
    }
    if (!(isdefined(self.var_c8f98f87) && self.var_c8f98f87) && isdefined(self.e_grapplee) && (zm_loadout::is_hero_weapon(weapon) || meansofdamage === "MOD_PROJECTILE")) {
        self ai::stun();
    }
    return damage;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0xf77fbf2a, Offset: 0x3eb0
// Size: 0x34
function private function_76c1f56f() {
    function_c526065b(self);
    self thread function_d67c455e();
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x65f27715, Offset: 0x3ef0
// Size: 0x6c
function private function_cf18d183(grapplee) {
    if (isdefined(grapplee) && isplayer(grapplee)) {
        grapplee clientfield::set_to_player("tongueGrabPostFx", 0);
        grapplee clientfield::set_to_player("tongueGrabRumble", 0);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x3730ba23, Offset: 0x3f68
// Size: 0x214
function private blightfatherdeathstart(entity) {
    entity val::set(#"blight_father_death", "takedamage", 0);
    if (level.var_79b2615b === entity) {
        level.var_79b2615b = undefined;
    }
    if (entity isattached("c_t8_zmb_blightfather_tongue2", "tag_tongue_grab")) {
        entity detach("c_t8_zmb_blightfather_tongue2");
    }
    if (!entity isragdoll()) {
        gib_model = util::spawn_anim_model("c_t8_zmb_blightfather_body1_gib", entity.origin, entity.angles);
        if (!isdefined(gib_model)) {
            return;
        }
        gib_model animscripted(#"hash_56a346d1e0dd61cd", gib_model.origin, gib_model.angles, #"hash_3e937fff0e0a4362", "normal");
        gib_model thread function_529b7fb9();
        entity.gib_model = gib_model;
    }
    attacker = entity.attacker;
    if (isdefined(attacker) && isplayer(attacker)) {
        weapon = attacker getcurrentweapon();
        if (attacker hasweapon(weapon)) {
            var_81316a8a = attacker function_b1298bfb(weapon);
            entity clientfield::set("blight_father_death_fx", var_81316a8a);
        }
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x384bca21, Offset: 0x4188
// Size: 0x42
function private blightfathershouldmelee(entity) {
    if (function_66e66814(entity)) {
        return 1;
    }
    return zombiebehavior::zombieshouldmeleecondition(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xdfc65be3, Offset: 0x41d8
// Size: 0x142
function private function_66e66814(entity) {
    if (!isdefined(entity.var_81ce9fcd)) {
        return false;
    }
    if (entity istouching(entity.var_81ce9fcd)) {
        return true;
    }
    var_e3df303a = zombiebehavior::function_997f1224(entity);
    if (distancesquared(entity.origin, entity.var_81ce9fcd.origin) > var_e3df303a) {
        return false;
    }
    var_838fd1c7 = angleclamp180(entity.angles[1] - vectortoangles(entity.var_81ce9fcd.origin - entity.origin)[1]);
    if (abs(var_838fd1c7) > (isdefined(entity.var_1c0eb62a) ? entity.var_1c0eb62a : 60)) {
        return false;
    }
    return true;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x87194bc1, Offset: 0x4328
// Size: 0x408
function private function_ac921de9(entity) {
    meleerange = entity ai::function_9139c839().var_558fb394;
    meleerangesq = meleerange * meleerange;
    potential_players = [];
    foreach (player in getplayers()) {
        if (meleerangesq < distancesquared(entity.origin, player.origin)) {
            continue;
        }
        if (!isdefined(potential_players)) {
            potential_players = [];
        } else if (!isarray(potential_players)) {
            potential_players = array(potential_players);
        }
        if (!isinarray(potential_players, player)) {
            potential_players[potential_players.size] = player;
        }
    }
    bhtnactionstartevent(entity, "attack_melee");
    registernotice_walla = anglestoforward(entity.angles);
    var_2f706708 = entity gettagorigin("j_spine4");
    var_9b246038 = entity ai::function_9139c839().var_4e8d4c24;
    if (isdefined(entity.var_81ce9fcd)) {
        var_e3df303a = zombiebehavior::function_997f1224(entity);
        if (distancesquared(entity.var_81ce9fcd.origin, entity.origin) < var_e3df303a && bullettracepassed(var_2f706708, entity.var_81ce9fcd getcentroid(), 0, entity, entity.var_81ce9fcd, 0, 1)) {
            entity.var_81ce9fcd notify(#"hash_90cfd38343f41f2", {#var_b736806d:entity, #var_8413ff14:var_2f706708});
        }
    }
    foreach (player in potential_players) {
        vec_to_player = vectornormalize(player.origin - entity.origin);
        if (vectordot(vec_to_player, registernotice_walla) < var_9b246038) {
            continue;
        }
        if (bullettracepassed(var_2f706708, player geteye(), 0, entity)) {
            player dodamage(entity.meleeweapon.playerdamage, entity.origin, entity, entity, "none", "MOD_MELEE");
        }
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x74430625, Offset: 0x4738
// Size: 0x462
function private function_911c3934(entity) {
    /#
        if (isdefined(entity.ispuppet) && entity.ispuppet) {
            return;
        }
    #/
    if (!isdefined(entity.var_93a62fe)) {
        if (isdefined(self.ignore_player)) {
            if (isdefined(level._should_skip_ignore_player_logic) && [[ level._should_skip_ignore_player_logic ]]()) {
                return;
            }
            self.ignore_player = [];
        }
        if (!isdefined(entity.var_9ba20329)) {
            entity.var_9ba20329 = entity zm_cleanup::get_escape_position();
        }
        if (isdefined(entity.var_9ba20329)) {
            entity setgoal(entity.var_9ba20329.origin);
        } else {
            entity setgoal(entity.origin);
        }
        return 0;
    }
    entity.var_9ba20329 = undefined;
    if (isdefined(entity.var_81ce9fcd)) {
        v_goal = getclosestpointonnavmesh(entity.var_81ce9fcd.origin, 24, entity getpathfindingradius());
        if (isdefined(v_goal)) {
            entity.var_c52d968a = v_goal;
        }
    } else if (!isdefined(entity.var_81ce9fcd)) {
        entity.var_c52d968a = undefined;
        a_poi = entity zm_utility::get_zombie_point_of_interest(entity.origin);
        if (isarray(a_poi) && a_poi.size > 0) {
            foreach (poi in a_poi) {
                if (isentity(poi) && !(isdefined(poi.var_27b86a5a) && poi.var_27b86a5a) && function_51dbdb8f(poi.weapon) && isdefined(poi.birthtime) && level.time - poi.birthtime >= 5000) {
                    v_goal = getclosestpointonnavmesh(poi.origin, 24, entity getpathfindingradius());
                    if (isdefined(v_goal)) {
                        /#
                            iprintlnbold("<unknown string>" + entity getentitynumber() + "<unknown string>" + poi getentitynumber());
                        #/
                        entity.var_81ce9fcd = poi;
                        entity.var_c52d968a = v_goal;
                        poi.var_27b86a5a = 1;
                    }
                }
            }
        }
    }
    if (isdefined(entity.var_c52d968a) && entity zm_utility::function_64259898(entity.var_c52d968a)) {
        return 1;
    }
    if (isdefined(entity.var_3acacb18)) {
        targetpos = entity.var_3acacb18;
        self function_a57c34b7(targetpos);
    } else {
        targetpos = entity.var_93a62fe.origin;
        zm_utility::function_64259898(targetpos);
    }
    entity.favoriteenemy = entity.var_93a62fe;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0x982ca8a, Offset: 0x4ba8
// Size: 0x66
function function_51dbdb8f(var_9cb85074) {
    if (!isdefined(var_9cb85074) || !isarray(level.var_fe96a4c4)) {
        return false;
    }
    if (isinarray(level.var_fe96a4c4, var_9cb85074)) {
        return true;
    }
    return false;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xed9e270f, Offset: 0x4c18
// Size: 0x54
function private function_283b9654(entity) {
    function_25f9cc48(entity);
    function_c526065b(entity);
    zm_behavior::zombiestunstart(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0x2bdfb4fe, Offset: 0x4c78
// Size: 0x38
function private function_fa33f4aa(entity, asmstatename) {
    if (zm_behavior::zombieshouldstun(entity)) {
        return 5;
    }
    return 4;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x1377aaf8, Offset: 0x4cb8
// Size: 0x54
function private function_d83ac1e7(entity) {
    function_25f9cc48(entity);
    function_c526065b(entity);
    zm_behavior::zombieknockdownactionstart(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0x7859c881, Offset: 0x4d18
// Size: 0x30
function private function_928e66ad(entity, asmstatename) {
    function_f108c0ea(entity);
    return 4;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xa69a6b8c, Offset: 0x4d50
// Size: 0x54
function private function_f108c0ea(entity) {
    if (function_3515ad4b(entity)) {
        function_25f9cc48(entity);
        function_c526065b(entity);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0xbeedd5cb, Offset: 0x4db0
// Size: 0x50
function private function_775f8cf2() {
    if (isdefined(self.var_177b7a47) && self.var_177b7a47) {
        return "left_sac_destroyed";
    }
    if (isdefined(self.var_7c54fb46) && self.var_7c54fb46) {
        return "right_sac_destroyed";
    }
    return undefined;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 13, eflags: 0x5 linked
// Checksum 0x455df747, Offset: 0x4e08
// Size: 0x114
function private function_3df61a1a(entity, inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity.var_2703428f--;
    entity showpart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
    entity destructserverutils::handledamage(inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex);
    entity hidepart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 13, eflags: 0x5 linked
// Checksum 0xf63ff587, Offset: 0x4f28
// Size: 0x156
function private function_fa7c080(entity, inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity.var_c8f98f87 = 1;
    entity.var_6ee32f47 = 1;
    entity clientfield::set("blight_father_weakpoint_jaw_fx", 0);
    entity attach("c_t8_zmb_blightfather_mouth_dmg1");
    if (entity isattached("c_t8_zmb_blightfather_tongue2", "tag_tongue_grab")) {
        entity detach("c_t8_zmb_blightfather_tongue2");
    }
    stub = zm_lockdown_util::function_87c1193e(entity);
    zm_lockdown_util::function_77caff8b(stub);
    entity.var_3acacb18 = undefined;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 13, eflags: 0x5 linked
// Checksum 0xc8ad1af0, Offset: 0x5088
// Size: 0x8c
function private function_9bbe631c(entity, inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity clientfield::set("blight_father_weakpoint_l_elbow_fx", 0);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 13, eflags: 0x5 linked
// Checksum 0xfa19fff2, Offset: 0x5120
// Size: 0x8c
function private function_5a1a4ad(entity, inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity clientfield::set("blight_father_weakpoint_r_elbow_fx", 0);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 13, eflags: 0x5 linked
// Checksum 0x24e4b443, Offset: 0x51b8
// Size: 0x16c
function private function_40034805(entity, inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity.var_177b7a47 = 1;
    entity clientfield::set("blight_father_weakpoint_l_maggot_sac_fx", 0);
    entity showpart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
    if (isdefined(entity.var_7c54fb46) && entity.var_7c54fb46) {
        entity detach("c_t8_zmb_blightfather_eggsack1_le");
    } else {
        entity detach("c_t8_zmb_blightfather_eggsack1_both");
        entity attach("c_t8_zmb_blightfather_eggsack1_ri");
    }
    entity hidepart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 13, eflags: 0x5 linked
// Checksum 0xad417a69, Offset: 0x5330
// Size: 0x16c
function private function_33b2c99e(entity, inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity.var_7c54fb46 = 1;
    entity clientfield::set("blight_father_weakpoint_r_maggot_sac_fx", 0);
    entity showpart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
    if (isdefined(entity.var_177b7a47) && entity.var_177b7a47) {
        entity detach("c_t8_zmb_blightfather_eggsack1_ri");
    } else {
        entity detach("c_t8_zmb_blightfather_eggsack1_both");
        entity attach("c_t8_zmb_blightfather_eggsack1_le");
    }
    entity hidepart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 14, eflags: 0x5 linked
// Checksum 0xfc0b0e81, Offset: 0x54a8
// Size: 0x22c
function private function_cacd1506(var_84ed9a13, entity, inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (namespace_81245006::function_f29756fe(var_84ed9a13) != 1) {
        return;
    }
    namespace_81245006::function_ef87b7e8(var_84ed9a13, damage);
    if (isdefined(inflictor)) {
        inflictor thread function_6f109d76(self);
    }
    if (namespace_81245006::function_f29756fe(var_84ed9a13) == 3) {
        if (isdefined(level.var_c2981ce9[var_84ed9a13.var_51e8b151])) {
            entity [[ level.var_c2981ce9[var_84ed9a13.var_51e8b151] ]](entity, inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex);
        }
        if (!entity isplayinganimscripted()) {
            entity.var_fbec06fa = var_84ed9a13.var_51e8b151;
            entity setblackboardattribute("_blight_father_weak_point", var_84ed9a13.var_51e8b151);
        }
        bone = boneindex;
        if (zm_utility::is_explosive_damage(meansofdamage)) {
            bone = var_84ed9a13.var_51e8b151;
        }
        function_3df61a1a(entity, inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, bone, modelindex);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0x5b278afd, Offset: 0x56e0
// Size: 0x74
function function_6f109d76(ai) {
    if (level.var_a51ca41a <= 2) {
        if (level.time - ai.birthtime > 3000) {
            self thread zm_audio::create_and_play_dialog(#"blight_father", #"weak_points");
        }
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 12, eflags: 0x5 linked
// Checksum 0x44d09313, Offset: 0x5760
// Size: 0x3c6
function private function_afce1cf(inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity = self;
    var_dd54fdb1 = namespace_81245006::function_3131f5dd(self, hitloc, 1);
    if (!isdefined(var_dd54fdb1)) {
        var_dd54fdb1 = namespace_81245006::function_73ab4754(self, point, 1);
    }
    var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, boneindex, hitloc, point, var_dd54fdb1);
    damage_scale = var_786d7e06.damage_scale;
    var_84ed9a13 = var_786d7e06.var_84ed9a13;
    registerzombie_bgb_used_reinforce = var_786d7e06.registerzombie_bgb_used_reinforce;
    if (zm_utility::is_explosive_damage(meansofdamage)) {
        damage_scale = max(damage_scale, entity ai::function_9139c839().explosivedamagescale);
        final_damage = int(damage * damage_scale);
        if (meansofdamage === "MOD_PROJECTILE" && isdefined(var_84ed9a13) && registerzombie_bgb_used_reinforce) {
            function_cacd1506(var_84ed9a13, entity, inflictor, attacker, var_84ed9a13.health, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex);
        }
    } else {
        final_damage = int(damage * damage_scale);
        if (isdefined(var_84ed9a13) && registerzombie_bgb_used_reinforce) {
            function_cacd1506(var_84ed9a13, entity, inflictor, attacker, final_damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex);
        }
    }
    /#
        if (isdefined(level.var_482766d7) && level.var_482766d7) {
            iprintlnbold("<unknown string>" + damage_scale + "<unknown string>" + final_damage + "<unknown string>" + entity.health - final_damage + "<unknown string>" + entity.var_2703428f);
        }
    #/
    if (entity.var_2703428f <= 0) {
        origin = entity.origin;
        if (isdefined(inflictor)) {
            origin = inflictor.origin;
        }
        attacker util::show_hit_marker(1);
        entity kill(origin, attacker, inflictor, weapon, 0, 1);
        final_damage = 0;
    }
    return final_damage;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x2375fa05, Offset: 0x5b30
// Size: 0xe8
function private function_f9d9f198(entity) {
    var_bee929e7 = entity astsearch("grapple_attack_vomit@blight_father");
    animname = animationstatenetworkutility::searchanimationmap(entity, var_bee929e7[#"animation"]);
    tag_pos = getanimtagorigin(animname, 0, "tag_tongue");
    var_2db07c66 = rotatepoint(tag_pos, entity gettagangles("tag_origin"));
    var_2db07c66 = var_2db07c66 + entity.origin;
    return var_2db07c66;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x76b93a69, Offset: 0x5c20
// Size: 0x36
function private function_35edac9c(entity) {
    entity.var_f7c29bc4 = gettime() + entity ai::function_9139c839().var_eed65399;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0xa2a9c7b5, Offset: 0x5c60
// Size: 0x1e6
function private function_5d7f8057(entity, player) {
    if (entity.var_c8088bcb.timestamp !== gettime()) {
        entity.var_c8088bcb.traces = [];
        entity.var_c8088bcb.timestamp = gettime();
    } else if (isdefined(entity.var_c8088bcb.traces[player getentitynumber()])) {
        return entity.var_c8088bcb.traces[player getentitynumber()];
    }
    clip_mask = 1 | 8;
    if (player haspart("j_mainroot")) {
        trace = physicstrace(entity.origin + vectorscale((0, 0, 1), 35), player gettagorigin("j_mainroot"), (-15, -15, -20), (15, 15, 40), entity, clip_mask);
    } else {
        trace = physicstrace(entity.origin + vectorscale((0, 0, 1), 35), player.origin, (-15, -15, -20), (15, 15, 40), entity, clip_mask);
    }
    entity.var_c8088bcb.traces[player getentitynumber()] = trace;
    return trace;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xb5ded491, Offset: 0x5e50
// Size: 0x4a
function private function_aaad8487(entity) {
    if (!isdefined(level.var_e82b911f) || level.var_e82b911f === entity) {
        level.var_e82b911f = entity;
        return true;
    }
    return false;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xa935d664, Offset: 0x5ea8
// Size: 0x16
function private function_3782350(entity) {
    level.var_e82b911f = undefined;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xdaeafe51, Offset: 0x5ec8
// Size: 0x76
function private function_4bd1c37e(entity) {
    if (function_aaad8487(entity)) {
        if (function_2784f3ff(entity)) {
            function_3782350(entity);
            return true;
        }
        if (function_8383fdf9(entity)) {
            return true;
        }
    }
    return false;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x5a23fa6, Offset: 0x5f48
// Size: 0x346
function private function_2784f3ff(entity) {
    if (isdefined(level.var_9cfa4efd) && level.var_9cfa4efd) {
        return false;
    }
    if (level.var_fcb96175 > gettime()) {
        return false;
    }
    if (!ai::get_behavior_attribute("tongue_grab_enabled")) {
        return false;
    }
    if (isdefined(entity.var_81ce9fcd)) {
        return false;
    }
    if (entity.var_f7c29bc4 > gettime()) {
        return false;
    }
    if (zm_grappler::function_56813755()) {
        return false;
    }
    var_490cb97a = function_ef973b70(entity);
    if (isdefined(var_490cb97a) && var_490cb97a != 4) {
        return false;
    }
    if (isdefined(entity.var_c8f98f87) && entity.var_c8f98f87) {
        return false;
    }
    if (abs(entity aiutility::function_6f949118()) > 5) {
        return false;
    }
    foreach (player in level.players) {
        /#
            if (player isinmovemode("<unknown string>", "<unknown string>")) {
                continue;
            }
        #/
        if (!zombie_utility::is_player_valid(player, 1, undefined, 0)) {
            continue;
        }
        var_c7af7c08 = distancesquared(player.origin, entity.origin);
        if (var_c7af7c08 > entity ai::function_9139c839().var_b30a945 * entity ai::function_9139c839().var_b30a945) {
            continue;
        }
        if (vectordot(vectornormalize(player.origin - entity.origin), anglestoforward(entity.angles)) < entity ai::function_9139c839().var_b2656f44) {
            continue;
        }
        test_trace = function_5d7f8057(entity, player);
        if (test_trace[#"fraction"] == 1 || test_trace[#"entity"] === player) {
            entity.var_bef7624d = player;
            return true;
        }
    }
    return false;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x51f8974b, Offset: 0x6298
// Size: 0x18
function private function_d6ded650(entity) {
    return isdefined(entity.e_grapplee);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xda0b9ac1, Offset: 0x62b8
// Size: 0x3c
function private function_e0b3baff(notifyhash) {
    function_c526065b(self);
    function_d67c455e(notifyhash);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0x6bb46319, Offset: 0x6300
// Size: 0x66c
function private function_96f5d05a(entity, var_4c0587b) {
    if (!isdefined(entity)) {
        return;
    }
    if (!isalive(entity)) {
        entity function_e0b3baff();
        return;
    }
    entity endoncallback(&function_e0b3baff, #"death", #"hash_2fb2eddfa6a0ef3f");
    grapple_start = zm_grappler::create_mover(entity gettagorigin("tag_jaw"), entity.angles);
    grapple_end = zm_grappler::create_mover(entity gettagorigin("tag_jaw"), entity.angles * -1);
    grapple_end.prone_2_run_roll = entity;
    grapple_start linkto(entity, "tag_jaw");
    entity.var_54c1950f = {#beamstart:grapple_start, #beamend:grapple_end, #status:0, #ignore_ents:[]};
    thread zm_grappler::function_30a5f5c1(grapple_start, grapple_end);
    util::wait_network_frame();
    n_time = distance(grapple_end.origin, var_4c0587b) / entity ai::function_9139c839().var_4a5ffac;
    n_time = max(0.1, n_time);
    entity.var_54c1950f.status = 1;
    grapple_end playsound(#"zmb_grapple_start");
    grapple_end moveto(var_4c0587b, n_time, 0, n_time * 0.1);
    grapple_end.return_pos = entity zm_grappler::function_f21c3519();
    thread function_9d1a26f1(entity, entity ai::function_9139c839().var_23426e9a * entity ai::function_9139c839().var_23426e9a, level.players);
    grapple_end flagsys::wait_till("grapple_moveto_done");
    grapple_end flagsys::clear("grapple_moveto_done");
    entity.var_54c1950f.status = 2;
    n_time = distance(grapple_end.origin, grapple_end.return_pos) / entity ai::function_9139c839().var_4a5ffac;
    grapple_end moveto(grapple_end.return_pos, n_time, n_time * 0.1, 0);
    var_51c441a4 = entity.e_grapplee;
    grapple_end playsound(#"zmb_grapple_pull");
    thread function_9d1a26f1(entity, entity ai::function_9139c839().var_23426e9a * entity ai::function_9139c839().var_23426e9a, level.players);
    grapple_end flagsys::wait_till("grapple_moveto_done");
    grapple_end flagsys::clear("grapple_moveto_done");
    if (!isdefined(var_51c441a4) && isdefined(entity.e_grapplee)) {
        n_time = distance(grapple_end.origin, grapple_end.return_pos) / entity ai::function_9139c839().var_4a5ffac;
        grapple_end moveto(grapple_end.return_pos, n_time, 0, 0);
        grapple_end waittill(#"movedone");
    }
    if (isdefined(entity.e_grapplee)) {
        var_148b92ae = function_f9d9f198(entity);
        var_1b40c6fd = entity.origin - var_148b92ae;
        angles = vectortoangles(var_1b40c6fd);
        grapple_end.angles = (grapple_end.angles[0], angles[1], grapple_end.angles[2]);
        entity.e_grapplee util::delay(0.5, undefined, &zm_audio::create_and_play_dialog, #"blight_father", #"vomit", undefined, 2);
    }
    entity.var_54c1950f.status = 4;
    if (!isdefined(entity.e_grapplee)) {
        entity thread function_d67c455e();
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xba56236a, Offset: 0x6978
// Size: 0x6c
function private function_55cba1f3(prone_2_run_roll) {
    self endon(#"death", #"hash_46064b6c2cb5cf20");
    wait(15);
    if (isdefined(prone_2_run_roll)) {
        function_25f9cc48(prone_2_run_roll);
    }
    self thread function_c526065b(prone_2_run_roll, self);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xe0a23d1d, Offset: 0x69f0
// Size: 0x1e4
function private function_28dddd64(entity) {
    entity.var_cdc2bec8 = 0;
    if (zombie_utility::is_player_valid(entity.var_bef7624d, 1, 1, 0)) {
        dir = entity.var_bef7624d zm_grappler::function_f21c3519() - entity zm_grappler::function_f21c3519();
        dir_norm = vectornormalize(dir);
        if (vectordot(dir_norm, anglestoforward(entity.angles)) < entity ai::function_9139c839().var_b2656f44) {
            dir_norm = anglestoforward(entity.angles);
        }
        var_4c0587b = entity zm_grappler::function_f21c3519() + dir_norm * entity ai::function_9139c839().var_b30a945;
        test_trace = worldtrace(entity zm_grappler::function_f21c3519(), var_4c0587b);
        if (test_trace[#"fraction"] < 1) {
            var_4c0587b = test_trace[#"position"];
        }
        thread function_96f5d05a(entity, var_4c0587b);
    }
    function_3782350(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0x201c0246, Offset: 0x6be0
// Size: 0x32
function function_ef973b70(entity) {
    if (isdefined(entity.var_54c1950f)) {
        return entity.var_54c1950f.status;
    }
    return undefined;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0xe6855cfa, Offset: 0x6c20
// Size: 0x3c
function function_31963d63(notifyhash) {
    if (notifyhash === #"movedone") {
        self flagsys::set("grapple_moveto_done");
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 3, eflags: 0x1 linked
// Checksum 0xba724983, Offset: 0x6c68
// Size: 0x560
function function_9d1a26f1(entity, var_8a713db5, var_3e06882e) {
    entity endon(#"death", #"hash_2fb2eddfa6a0ef3f");
    entity.var_54c1950f.beamend endoncallback(&function_31963d63, #"death", #"movedone");
    /#
        if (getdvarint(#"hash_692fb9cc4cff6541", 0)) {
            var_1b97aa47 = sqrt(var_8a713db5);
            debug_origins = [];
        }
    #/
    while (true) {
        if (!isdefined(entity.e_grapplee)) {
            /#
                if (getdvarint(#"hash_692fb9cc4cff6541", 0)) {
                    if (!isdefined(debug_origins)) {
                        debug_origins = [];
                    } else if (!isarray(debug_origins)) {
                        debug_origins = array(debug_origins);
                    }
                    if (!isinarray(debug_origins, entity.var_54c1950f.beamend.origin)) {
                        debug_origins[debug_origins.size] = entity.var_54c1950f.beamend.origin;
                    }
                    foreach (origin in debug_origins) {
                        recordcircle(origin, var_1b97aa47, (1, 0, 0));
                        recordstar(origin, (0, 1, 0));
                    }
                }
            #/
            e_grapplee = function_5afb347c(entity, entity.var_54c1950f.beamend.origin, var_8a713db5, var_3e06882e);
            if (isdefined(e_grapplee)) {
                entity.var_54c1950f.beamend.return_pos = entity gettagorigin("tag_jaw");
                if (isdefined(e_grapplee.hasriotshieldequipped) && e_grapplee.hasriotshieldequipped) {
                    if (!isdefined(entity.var_54c1950f.ignore_ents)) {
                        entity.var_54c1950f.ignore_ents = [];
                    } else if (!isarray(entity.var_54c1950f.ignore_ents)) {
                        entity.var_54c1950f.ignore_ents = array(entity.var_54c1950f.ignore_ents);
                    }
                    if (!isinarray(entity.var_54c1950f.ignore_ents, e_grapplee)) {
                        entity.var_54c1950f.ignore_ents[entity.var_54c1950f.ignore_ents.size] = e_grapplee;
                    }
                    e_grapplee thread riotshield::player_take_riotshield();
                } else if (e_grapplee function_61efcfe5()) {
                    if (!isdefined(entity.var_54c1950f.ignore_ents)) {
                        entity.var_54c1950f.ignore_ents = [];
                    } else if (!isarray(entity.var_54c1950f.ignore_ents)) {
                        entity.var_54c1950f.ignore_ents = array(entity.var_54c1950f.ignore_ents);
                    }
                    if (!isinarray(entity.var_54c1950f.ignore_ents, e_grapplee)) {
                        entity.var_54c1950f.ignore_ents[entity.var_54c1950f.ignore_ents.size] = e_grapplee;
                    }
                } else {
                    function_91dcbd1c(entity, entity.var_54c1950f.beamend, e_grapplee);
                }
                entity.var_54c1950f.beamend flagsys::set("grapple_moveto_done");
                return;
            }
        }
        waitframe(1);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 4, eflags: 0x5 linked
// Checksum 0x15e7c3b2, Offset: 0x71d0
// Size: 0x254
function private function_5afb347c(entity, var_6aab4b, var_8a713db5, var_3e06882e) {
    foreach (var_cf12838e in var_3e06882e) {
        if (!zombie_utility::is_player_valid(var_cf12838e, 1, 1) || isdefined(var_cf12838e.var_564dec14) && var_cf12838e.var_564dec14 || isdefined(var_cf12838e.var_e75517b1) && var_cf12838e.var_e75517b1 || var_cf12838e issliding() || var_cf12838e getstance() == "prone" || isinarray(entity.var_54c1950f.ignore_ents, var_cf12838e) || !isdefined(var_cf12838e gettagorigin("j_mainroot"))) {
            continue;
        }
        if (distancesquared(var_cf12838e gettagorigin("j_mainroot"), var_6aab4b) < var_8a713db5) {
            var_148b92ae = function_f9d9f198(entity);
            var_36282543 = var_cf12838e geteye() - var_148b92ae;
            var_b842eb80 = (var_36282543[0], var_36282543[1], 0);
            if (vectordot(var_b842eb80, anglestoforward(entity.angles)) > 0) {
                return var_cf12838e;
            }
        }
    }
    return undefined;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0x9d18cbcd, Offset: 0x7430
// Size: 0x4c
function private function_c1b0cbda() {
    self endon(#"death");
    while (self isswitchingweapons()) {
        waitframe(1);
    }
    self thread riotshield::function_a9109d26();
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 3, eflags: 0x5 linked
// Checksum 0xd3f4e505, Offset: 0x7488
// Size: 0x384
function private function_91dcbd1c(prone_2_run_roll, var_a424c06a, e_grapplee) {
    if (!isdefined(var_a424c06a)) {
        return;
    }
    prone_2_run_roll.e_grapplee = e_grapplee;
    e_grapplee zm_grappler::function_a60cb756(1, 0);
    if (isplayer(e_grapplee)) {
        e_grapplee thread function_c1b0cbda();
        e_grapplee function_5d851a4e();
    }
    var_148b92ae = function_f9d9f198(prone_2_run_roll);
    /#
        recordstar(var_148b92ae, (1, 0.5, 0));
        recordcircle(var_148b92ae, 10, (0, 0, 1));
    #/
    var_a424c06a.return_pos = var_148b92ae;
    var_ca015b6f = util::spawn_model("tag_origin", e_grapplee.origin, e_grapplee.angles);
    var_ca015b6f linkto(var_a424c06a, "tag_origin", vectorscale((0, 0, 1), 35) * -1);
    e_grapplee.var_ca015b6f = var_ca015b6f;
    if (isplayer(e_grapplee)) {
        e_grapplee playerlinkto(var_ca015b6f, "tag_origin", 1, 40, 40, 80, 15);
        /#
            recordstar(var_148b92ae, (1, 0, 0));
            recordstar(e_grapplee geteye(), (0, 0, 1));
        #/
        angles = vectortoangles(var_148b92ae - e_grapplee geteye());
        var_a424c06a.angles = (0, angles[1], 0);
        e_grapplee setplayerangles(angles);
        e_grapplee setstance("stand");
        e_grapplee allowcrouch(0);
        e_grapplee allowprone(0);
        e_grapplee function_babdb8e7();
    } else {
        e_grapplee linkto(var_a424c06a);
    }
    if (isdefined(prone_2_run_roll) && isdefined(e_grapplee) && isplayer(e_grapplee)) {
        e_grapplee thread function_55cba1f3(prone_2_run_roll);
    }
    e_grapplee playsound(#"zmb_grapple_grab");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x1 linked
// Checksum 0xb62325b2, Offset: 0x7818
// Size: 0x2ce
function function_c526065b(entity, var_e0ef3075) {
    grapplee = var_e0ef3075;
    if (isdefined(entity)) {
        entity.e_glidin = undefined;
        grapplee = entity.e_grapplee;
    }
    if (!isdefined(grapplee) || !(isdefined(grapplee.var_564dec14) && grapplee.var_564dec14)) {
        return;
    }
    if (isdefined(entity)) {
        grapplee notify(#"hash_46064b6c2cb5cf20", {#blight_father:entity});
    }
    function_cf18d183(grapplee);
    grapplee unlink();
    if (isdefined(grapplee.var_ca015b6f)) {
        grapplee.var_ca015b6f delete();
        grapplee.var_ca015b6f = undefined;
    }
    grapplee zm_grappler::function_a60cb756(0, 0);
    if (isplayer(grapplee)) {
        grapplee function_1fd426b6();
        grapplee allowcrouch(1);
        grapplee allowprone(1);
    }
    droppoint = getclosestpointonnavmesh(grapplee.origin, 64, 24);
    if (isdefined(droppoint)) {
        v_ground_pos = groundtrace(droppoint + vectorscale((0, 0, 1), 50), droppoint, 0, entity)[#"position"];
        if (isdefined(v_ground_pos)) {
            droppoint = v_ground_pos;
        }
        if (isplayer(grapplee)) {
            grapplee setorigin(droppoint);
        } else {
            grapplee forceteleport(droppoint);
        }
    } else if (isplayer(grapplee)) {
        if (isdefined(grapplee.last_valid_position)) {
            grapplee setorigin(grapplee.last_valid_position);
        }
    }
    grapplee function_def41e89();
    if (isdefined(entity)) {
        entity.e_grapplee = undefined;
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0xfd0c7dbd, Offset: 0x7af0
// Size: 0x1bc
function private function_def41e89() {
    enemies = getaispeciesarray(level.zombie_team, "all");
    enemies = arraysortclosest(enemies, self.origin, undefined, 0, self getpathfindingradius() + 100);
    foreach (enemy in enemies) {
        if (self istouching(enemy)) {
            if (isdefined(enemy.allowdeath) && enemy.allowdeath && (enemy.var_6f84b820 === #"basic" || enemy.var_6f84b820 === #"popcorn")) {
                enemy zm_cleanup::function_23621259();
                enemy kill();
                continue;
            }
            self dodamage(self.health + 1000, self.origin, enemy, enemy, "none", "MOD_RIFLE_BULLET");
            break;
        }
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0x531f90cd, Offset: 0x7cb8
// Size: 0x122
function function_d67c455e(notifyhash) {
    if (isdefined(self.prone_2_run_roll)) {
        entity = self.prone_2_run_roll;
    } else {
        entity = self;
    }
    if (!isdefined(entity.var_54c1950f)) {
        return;
    }
    e_source = entity.var_54c1950f.beamstart;
    e_beamend = entity.var_54c1950f.beamend;
    entity.var_54c1950f = undefined;
    zm_grappler::function_c43e7cab();
    level.var_acec7a44 = 1;
    if (isdefined(e_source)) {
        e_source unlink();
        zm_grappler::destroy_mover(e_source);
    }
    if (isdefined(e_beamend)) {
        zm_grappler::destroy_mover(e_beamend);
    }
    util::wait_network_frame();
    level.var_acec7a44 = 0;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0xf57d6f13, Offset: 0x7de8
// Size: 0x44
function private function_babdb8e7() {
    self clientfield::set_to_player("tongueGrabRumble", 1);
    self clientfield::set_to_player("tongueGrabPostFx", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 5, eflags: 0x5 linked
// Checksum 0x84404d1e, Offset: 0x7e38
// Size: 0xdc
function private function_299dd40e(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    if (zm_utility::is_player_valid(entity.var_bef7624d)) {
        to_player = entity.var_bef7624d.origin - entity.origin;
        var_47d9e0ed = vectortoangles(to_player);
        entity orientmode("face angle", var_47d9e0ed[1]);
    }
    entity animmode("zonly_physics", 0);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 5, eflags: 0x5 linked
// Checksum 0x639f7d9a, Offset: 0x7f20
// Size: 0x1ac
function private function_689831cf(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    if (function_ef973b70(entity) === 0 && zm_utility::is_player_valid(entity.var_bef7624d) && !isdefined(entity.e_grapplee)) {
        /#
            record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 16), (0, 0, 1));
        #/
        to_player = entity.var_bef7624d.origin - entity.origin;
        var_47d9e0ed = vectortoangles(to_player);
        entity orientmode("face angle", var_47d9e0ed[1]);
    } else {
        /#
            record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 16), (0, 1, 0));
        #/
        entity orientmode("face current");
    }
    entity animmode("zonly_physics", 0);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 5, eflags: 0x5 linked
// Checksum 0xfd073df4, Offset: 0x80d8
// Size: 0x4c
function private function_42de48fb(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity orientmode("face default");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0x6445523e, Offset: 0x8130
// Size: 0x58
function private function_b62014ac(entity, asmstatename) {
    if (function_ef973b70(entity) === 0 || function_ef973b70(entity) === 1) {
        return 5;
    }
    return 4;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0x76d18ff8, Offset: 0x8190
// Size: 0x3e
function private function_8cbef8fd(entity, asmstatename) {
    if (function_ef973b70(entity) === 2) {
        return 5;
    }
    return 4;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0xd56494d3, Offset: 0x81d8
// Size: 0x2c
function function_b5b42347(entity) {
    entity.var_bef7624d = undefined;
    function_f108c0ea(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xfdcec44, Offset: 0x8210
// Size: 0x5c
function private watch_disconnect(grappler) {
    grappler endon(#"death", #"hash_2fb2eddfa6a0ef3f");
    self waittill(#"disconnect");
    thread function_25f9cc48(grappler);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xac41a572, Offset: 0x8278
// Size: 0x4e
function private function_5e853c85(grappler) {
    self endon(#"disconnect");
    grappler waittill(#"death", #"hash_2fb2eddfa6a0ef3f");
    self.var_f4e33249 = 0;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x4
// Checksum 0x935cfd72, Offset: 0x82d0
// Size: 0xa8
function private function_e989972e(grappler) {
    /#
        self endon(#"disconnect");
        grappler endon(#"death", #"hash_2fb2eddfa6a0ef3f");
        while (true) {
            if (self isinmovemode("<unknown string>", "<unknown string>")) {
                grappler function_76c1f56f();
                function_c526065b(grappler);
            }
            wait(0.1);
        }
    #/
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x8650294, Offset: 0x8380
// Size: 0x1d0
function private function_62b3b7a3(entity) {
    grapplee = entity.e_grapplee;
    if (isdefined(grapplee)) {
        entity thread function_d67c455e();
        if (isdefined(grapplee.var_ca015b6f)) {
            grapplee.var_ca015b6f unlink();
            var_938dbbaa = vectortoangles(entity.origin - grapplee.var_ca015b6f.origin);
            var_7e28b231 = entity gettagangles("tag_tongue");
            grapplee.var_ca015b6f linkto(entity, "tag_tongue", vectorscale((0, 0, 1), 35) * -1, (var_7e28b231[0] * -1, var_938dbbaa[1] - var_7e28b231[1], var_7e28b231[2] * -1));
            grapplee setplayercollision(1);
        } else {
            function_c526065b(entity);
        }
        /#
            println("<unknown string>" + distance(function_f9d9f198(entity), grapplee.origin + vectorscale((0, 0, 1), 35)));
        #/
    }
    return true;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x11efeada, Offset: 0x8558
// Size: 0x25c
function private function_1d2646(entity) {
    var_78a5a6c3 = 0;
    grapplee = entity.e_grapplee;
    if (isdefined(grapplee) && isplayer(grapplee) && !(isdefined(grapplee.var_16735873) && grapplee.var_16735873) && !(isdefined(grapplee.var_77f481e1) && grapplee.var_77f481e1)) {
        grapplee.var_f4e33249 = 1;
        var_78a5a6c3 = 1;
        var_8aa5bbfb = entity gettagorigin("tag_jaw") - grapplee geteye();
        angles = vectortoangles(var_8aa5bbfb);
        grapplee setplayerangles((angles[0], angles[1], grapplee.angles[2]));
        grapplee thread watch_disconnect(entity);
        grapplee thread function_5e853c85(entity);
        /#
            grapplee thread function_e989972e(entity);
        #/
    }
    if (!var_78a5a6c3 && entity.var_e6c8672d < ai::function_9139c839().var_4afa14d6) {
        if (math::cointoss()) {
            entity.var_e6c8672d = entity.var_e6c8672d + 2;
        } else {
            entity.var_e6c8672d++;
        }
    } else {
        entity.var_e6c8672d = 1;
        function_35edac9c(entity);
    }
    entity hidepart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x1f36a8b7, Offset: 0x87c0
// Size: 0x48
function private function_563d56de(entity) {
    if (isdefined(entity.var_e6c8672d)) {
        return (entity.var_e6c8672d < entity ai::function_9139c839().var_4afa14d6);
    }
    return false;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x23870c3e, Offset: 0x8810
// Size: 0x2a
function private function_d6fbf1b7(entity) {
    return zombie_utility::is_player_valid(entity.e_grapplee, undefined, undefined, 0);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xf42d7321, Offset: 0x8848
// Size: 0x174
function private function_bc3eb15a(entity) {
    entity showpart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
    if (isdefined(entity.e_grapplee)) {
        grapplee = entity.e_grapplee;
        var_7981cbb7 = angleclamp180(vectortoangles(entity gettagorigin("j_head") - grapplee geteye())[0]);
        var_495f8389 = abs(var_7981cbb7 - 10);
        var_6f2b0bce = max(var_7981cbb7 + 10, 0);
        if (isplayer(grapplee) && grapplee islinkedto(grapplee.var_ca015b6f)) {
            grapplee lerpviewangleclamp(0, 0, 0, 20, 20, var_495f8389, var_6f2b0bce);
        }
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xfc1d6f4, Offset: 0x89c8
// Size: 0x46
function private function_1d9f449a(entity) {
    grapplee = entity.e_grapplee;
    return isdefined(grapplee) && !zombie_utility::is_player_valid(grapplee, undefined, undefined, 0);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x12b1a9b1, Offset: 0x8a18
// Size: 0x6c
function private function_25f9cc48(entity) {
    entity notify(#"hash_2fb2eddfa6a0ef3f");
    entity clientfield::set("blight_father_vomit_fx", 0);
    function_35edac9c(entity);
    entity thread function_d67c455e();
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xcc99b947, Offset: 0x8a90
// Size: 0x4c
function private function_1177eb85(entity) {
    function_25f9cc48(entity);
    entity hidepart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x9fde043a, Offset: 0x8ae8
// Size: 0x64
function private function_1dac0714(entity) {
    function_25f9cc48(entity);
    function_c526065b(entity);
    entity showpart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x247a9aca, Offset: 0x8b58
// Size: 0x24
function private function_fc84db95(entity) {
    function_1dac0714(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xaf627c86, Offset: 0x8b88
// Size: 0x52
function private function_2ed4a174(entity) {
    if (isdefined(entity.var_cdc2bec8) && entity.var_cdc2bec8 > entity ai::function_9139c839().var_2c6cfada) {
        return true;
    }
    return false;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0x641e21bf, Offset: 0x8be8
// Size: 0x34
function function_744be31d(player) {
    if (self.e_grapplee !== player) {
        return;
    }
    self ai::stun();
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xd6f94def, Offset: 0x8c28
// Size: 0xac
function private function_7a634eaa(entity) {
    grapplee = entity.e_grapplee;
    if (isdefined(grapplee)) {
        entity clientfield::set("blight_father_vomit_fx", 1);
        grapplee thread function_d5ba6cc6(entity, grapplee);
        return;
    }
    entity clientfield::set("blight_father_vomit_fx", 2);
    function_a0edafd0(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0xde0305ee, Offset: 0x8ce0
// Size: 0x144
function private function_d5ba6cc6(blight_father, player) {
    player endon(#"death", #"disconnect");
    player clientfield::set_to_player("blight_father_vomit_postfx_clientfield", 1);
    while (isdefined(blight_father) && isalive(blight_father) && zm_utility::is_player_valid(blight_father.e_grapplee, undefined, undefined, undefined, 0) && blight_father.e_grapplee === player) {
        player dodamage(blight_father ai::function_9139c839().var_b995c667, blight_father.origin, blight_father, blight_father);
        wait(blight_father ai::function_9139c839().var_7334215);
    }
    if (isdefined(player)) {
        player clientfield::set_to_player("blight_father_vomit_postfx_clientfield", 0);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xebbff737, Offset: 0x8e30
// Size: 0x44
function private function_b3f66ac3(entity) {
    entity clientfield::set("blight_father_vomit_fx", 0);
    function_f108c0ea(entity);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x6c56e559, Offset: 0x8e80
// Size: 0x34
function private function_51ead3e8(entity) {
    entity showpart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x326c851e, Offset: 0x8ec0
// Size: 0x34
function private function_bb6aa70c(entity) {
    entity hidepart("tag_tongue_grab", "c_t8_zmb_blightfather_tongue2", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0x953ea173, Offset: 0x8f00
// Size: 0x1fa
function private function_7fe36aac(entity, minplayerdist) {
    playerpositions = [];
    foreach (player in getplayers()) {
        if (!isdefined(playerpositions)) {
            playerpositions = [];
        } else if (!isarray(playerpositions)) {
            playerpositions = array(playerpositions);
        }
        if (!isinarray(playerpositions, isdefined(player.last_valid_position) ? player.last_valid_position : player.origin)) {
            playerpositions[playerpositions.size] = isdefined(player.last_valid_position) ? player.last_valid_position : player.origin;
        }
    }
    position = getclosestpointonnavmesh(entity.origin, 128, entity getpathfindingradius());
    if (!isdefined(position)) {
        return false;
    }
    pathdata = generatenavmeshpath(position, playerpositions, entity);
    if (isdefined(pathdata) && pathdata.status === "succeeded" && pathdata.pathdistance < minplayerdist) {
        return false;
    }
    return true;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 4, eflags: 0x5 linked
// Checksum 0xea823fc8, Offset: 0x9108
// Size: 0x9a
function private function_c90a5ebb(entity, attribute, oldvalue, value) {
    if (!value) {
        var_65ba9602 = zm_lockdown_util::function_87c1193e(entity);
        if (isdefined(var_65ba9602)) {
            zm_lockdown_util::function_77caff8b(var_65ba9602);
            entity.var_3acacb18 = undefined;
            entity.b_ignore_cleanup = entity.var_ca0d8389;
            entity.var_ca0d8389 = undefined;
        }
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x48828dc0, Offset: 0x91b0
// Size: 0x752
function private function_7055b26(entity) {
    /#
        zm_lockdown_util::function_f3cff6ff(entity);
    #/
    if (zm_utility::is_standard() && level flag::exists("started_defend_area") && level flag::get("started_defend_area")) {
        entity.var_3acacb18 = undefined;
        return;
    }
    if (entity clientfield::get("blight_father_vomit_fx")) {
        return;
    }
    if (!entity ai::get_behavior_attribute("lockdown_enabled")) {
        return;
    }
    if (isdefined(entity.var_c8f98f87) && entity.var_c8f98f87 || zombiebehavior::zombieshouldmeleecondition(entity) || function_4bd1c37e(entity)) {
        return;
    }
    var_65ba9602 = zm_lockdown_util::function_87c1193e(entity);
    if (isdefined(var_65ba9602)) {
        if (!zm_lockdown_util::function_c9105448(entity, var_65ba9602)) {
            zm_lockdown_util::function_77caff8b(var_65ba9602);
            entity.var_3acacb18 = undefined;
            entity.b_ignore_cleanup = entity.var_ca0d8389;
            entity.var_ca0d8389 = undefined;
        }
        return;
    } else {
        entity.var_3acacb18 = undefined;
    }
    if (self.var_e38eaee5 > gettime()) {
        return;
    }
    stub_types = [];
    if (!isdefined(stub_types)) {
        stub_types = [];
    } else if (!isarray(stub_types)) {
        stub_types = array(stub_types);
    }
    stub_types[stub_types.size] = "lockdown_stub_type_wallbuys";
    if (!isdefined(stub_types)) {
        stub_types = [];
    } else if (!isarray(stub_types)) {
        stub_types = array(stub_types);
    }
    stub_types[stub_types.size] = "lockdown_stub_type_crafting_tables";
    if (!isdefined(stub_types)) {
        stub_types = [];
    } else if (!isarray(stub_types)) {
        stub_types = array(stub_types);
    }
    stub_types[stub_types.size] = "lockdown_stub_type_perks";
    if (!isdefined(stub_types)) {
        stub_types = [];
    } else if (!isarray(stub_types)) {
        stub_types = array(stub_types);
    }
    stub_types[stub_types.size] = "lockdown_stub_type_pap";
    if (!isdefined(stub_types)) {
        stub_types = [];
    } else if (!isarray(stub_types)) {
        stub_types = array(stub_types);
    }
    stub_types[stub_types.size] = "lockdown_stub_type_magic_box";
    max_height = entity ai::function_9139c839().var_ee9586a9;
    if (isdefined(level.var_1c666963)) {
        max_height = level.var_1c666963;
    }
    registerlotus_right = zm_lockdown_util::function_9b84bb88(entity, stub_types, entity ai::function_9139c839().var_8ae9a3a7, max_height);
    entity.var_e38eaee5 = gettime() + 500;
    if (registerlotus_right.size == 0) {
        return;
    }
    stub = registerlotus_right[0];
    if (!function_7fe36aac(entity, entity ai::function_9139c839().var_182ee089)) {
        return;
    }
    var_4afb24b6 = zm_lockdown_util::function_dab6d796(entity, stub);
    if (!isdefined(var_4afb24b6)) {
        /#
            println("mocomp_purchase_lockdown_vomit@blight_father" + entity getentitynumber() + "<unknown string>" + stub.origin + "<unknown string>");
        #/
        var_7162cf15 = zm_utility::function_b0eeaada(stub.origin);
        halfheight = 32;
        if (!isdefined(var_7162cf15)) {
            var_7162cf15 = [];
            var_7162cf15[#"point"] = stub.origin;
            halfheight = (stub.origin - zm_utility::groundpos(stub.origin))[2] + 1;
        }
        var_239124a9 = positionquery_source_navigation(var_7162cf15[#"point"], 0, 256, halfheight, 20, 1);
        if (var_239124a9.data.size == 0) {
            return;
        }
        start_origin = var_239124a9.data[0].origin;
    } else {
        var_adac1439 = entity astsearch("purchase_lockdown_vomit@blight_father");
        animname = animationstatenetworkutility::searchanimationmap(entity, var_adac1439[#"animation"]);
        start_origin = getstartorigin(var_4afb24b6.origin, var_4afb24b6.angles, animname);
    }
    if (!ispointonnavmesh(start_origin, entity)) {
        /#
            if (isdefined(var_4afb24b6)) {
                zm_lockdown_util::function_78eae22a(entity, stub, 14, start_origin, var_4afb24b6);
            }
        #/
        return;
    }
    zm_lockdown_util::function_50ba1eb0(entity, stub);
    entity setblackboardattribute("_lockdown_type", zm_lockdown_util::function_22aeb4e9(stub.lockdowntype));
    entity.var_ca0d8389 = entity.b_ignore_cleanup;
    entity.b_ignore_cleanup = 1;
    entity.var_3acacb18 = start_origin;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0xf4434518, Offset: 0x9910
// Size: 0x102
function function_b57f31b6(player) {
    if (isdefined(level.var_3e10516a) && level.var_3e10516a) {
        if (function_8b1a219a()) {
            self sethintstring(#"hash_1fa0254afe1fa66");
        } else {
            self sethintstring(#"hash_3aa47b7b8258ebd2");
        }
    } else if (function_8b1a219a()) {
        self sethintstring(#"hash_76208e521ab783c1", 500);
    } else {
        self sethintstring(#"hash_5ef6d21d81a0250b", 500);
    }
    return zm_lockdown_util::function_b5dd9241(self.stub);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0x777aadf6, Offset: 0x9a20
// Size: 0x140
function private function_158a1b7e() {
    self endon(#"death");
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        if (!isdefined(waitresult.activator) || !zm_utility::is_player_valid(waitresult.activator) || isdefined(self.stub) && isdefined(self.stub.var_6156031a) && self.stub.var_6156031a) {
            continue;
        }
        player = waitresult.activator;
        if (!player zm_score::can_player_purchase(500)) {
            continue;
        }
        player zm_score::minus_to_player_score(500);
        self.stub thread zm_lockdown_util::function_61a9bc58();
        player playsoundtoplayer(#"hash_4d5ca6fb8f2395de", player);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xaf1e69a, Offset: 0x9b68
// Size: 0x64
function private function_d6e82d62(stub) {
    if (isdefined(stub.var_bebc05f5)) {
        stub thread function_b9a828e1(stub.var_bebc05f5);
    }
    wait(getdvarfloat(#"hash_2f19f037c4f8ddc9", 2));
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xea879f1c, Offset: 0x9bd8
// Size: 0x74
function private function_b9a828e1(model) {
    model clientfield::set("blight_father_purchase_lockdown_vomit_fx", 0);
    util::wait_network_frame();
    if (isentity(model) && isdefined(model)) {
        model delete();
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x4fcfead3, Offset: 0x9c58
// Size: 0xc0
function private function_e1ba6416(entity) {
    if (isdefined(entity.var_c8f98f87) && entity.var_c8f98f87) {
        return false;
    }
    if (!zm_lockdown_util::function_7bfa8895(entity)) {
        return false;
    }
    if (!isdefined(entity.var_3acacb18)) {
        return false;
    }
    if (distance2dsquared(entity.var_3acacb18, entity.origin) > entity ai::function_9139c839().var_6b3398a5 * entity ai::function_9139c839().var_6b3398a5) {
        return false;
    }
    return true;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x2199001, Offset: 0x9d20
// Size: 0x292
function private function_a0edafd0(entity) {
    if (zm_lockdown_util::function_7bfa8895(entity)) {
        stub = zm_lockdown_util::function_7258b5cc(entity, &function_b57f31b6, &function_158a1b7e, &function_d6e82d62);
        if (!isdefined(stub)) {
            return;
        }
        switch (stub.lockdowntype) {
        case #"lockdown_stub_type_perks":
            var_680c2eca = 2;
            var_8354cf7d = zm_lockdown_util::function_da72073(stub);
            break;
        case #"lockdown_stub_type_magic_box":
            var_680c2eca = 3;
            var_8354cf7d = zm_lockdown_util::function_da72073(stub);
            break;
        case #"lockdown_stub_type_crafting_tables":
            var_680c2eca = 4;
            var_8354cf7d = zm_lockdown_util::function_da72073(stub);
            break;
        case #"lockdown_stub_type_pap":
        case #"lockdown_stub_type_wallbuys":
            var_8354cf7d = zm_lockdown_util::function_da72073(stub);
        default:
            var_680c2eca = 1;
            break;
        }
        if (stub.lockdowntype === "lockdown_stub_type_crafting_tables" && stub.script_string === "its_a_trap") {
            var_680c2eca = 3;
        }
        if (!isdefined(var_8354cf7d)) {
            v_origin = stub.origin;
            v_angles = stub.angles;
        } else {
            v_origin = var_8354cf7d.origin;
            v_angles = var_8354cf7d.angles;
        }
        stub.var_bebc05f5 = function_69b8daf(v_origin, v_angles);
        stub.var_bebc05f5 clientfield::set("blight_father_purchase_lockdown_vomit_fx", var_680c2eca);
        entity.var_3acacb18 = undefined;
        entity.b_ignore_cleanup = entity.var_ca0d8389;
        entity.var_ca0d8389 = undefined;
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 5, eflags: 0x5 linked
// Checksum 0x90f7f20b, Offset: 0x9fc0
// Size: 0x1fc
function private function_6ab8460f(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    stub = zm_lockdown_util::function_87c1193e(entity);
    var_4afb24b6 = zm_lockdown_util::function_dab6d796(entity, stub);
    if (isdefined(var_4afb24b6)) {
        start_origin = getstartorigin(var_4afb24b6.origin, var_4afb24b6.angles, mocompanim);
        start_angles = getstartangles(var_4afb24b6.origin, var_4afb24b6.angles, mocompanim);
    } else {
        /#
            println("mocomp_purchase_lockdown_vomit@blight_father" + entity getentitynumber() + "tag_tongue" + entity.origin[0] + "face angle" + entity.origin[1] + "face angle" + entity.origin[2] + "j_head");
        #/
        start_origin = entity.origin;
        start_angles = entity.angles;
    }
    entity forceteleport(start_origin, start_angles);
    entity animmode("noclip", 1);
    entity orientmode("face angle", start_angles[1]);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x58dc72ce, Offset: 0xa1c8
// Size: 0x2a
function private function_37d1a803(entity) {
    return entity ai::function_9139c839().var_f246f6de;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xbc915e37, Offset: 0xa200
// Size: 0x28
function private function_71b8279d(entity) {
    return isdefined(entity.var_6ee32f47) && entity.var_6ee32f47;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0xca999233, Offset: 0xa230
// Size: 0x8c
function private function_63b7576d() {
    var_3c533fa2 = 0;
    foreach (trigger in level.var_445e24c8) {
        if (!trigger.inuse) {
            var_3c533fa2++;
        }
    }
    return var_3c533fa2;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0x4aed385a, Offset: 0xa2c8
// Size: 0xa8
function private function_c48604c0() {
    foreach (trigger in level.var_445e24c8) {
        if (!trigger.inuse) {
            trigger.inuse = 1;
            trigger triggerenable(1);
            return trigger;
        }
    }
    return undefined;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x2e2337ad, Offset: 0xa378
// Size: 0x42
function private function_da2c4ce9(trigger) {
    trigger.inuse = 0;
    trigger triggerenable(0);
    trigger.origin = (0, 0, 0);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x849cc35a, Offset: 0xa3c8
// Size: 0x48
function private function_8383fdf9(entity) {
    var_329b1080 = function_19249d10(entity);
    function_3782350(entity);
    return var_329b1080;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xc2974e45, Offset: 0xa418
// Size: 0x684
function private function_19249d10(entity) {
    if (isdefined(level.var_9cfa4efd) && level.var_9cfa4efd) {
        return false;
    }
    if (level.var_fcb96175 > gettime()) {
        return false;
    }
    if (!isdefined(entity.favoriteenemy)) {
        return false;
    }
    if (!isplayer(entity.favoriteenemy)) {
        return false;
    }
    if (isdefined(entity.var_81ce9fcd)) {
        return false;
    }
    if (isdefined(entity.var_177b7a47) && entity.var_177b7a47 && isdefined(entity.var_7c54fb46) && entity.var_7c54fb46) {
        return false;
    }
    if (isdefined(level.var_79b2615b) && level.var_79b2615b != entity && isalive(level.var_79b2615b)) {
        return false;
    }
    if (!function_71b8279d(entity) && entity.var_b2a80abc > gettime()) {
        return false;
    }
    var_d0651e10 = function_63b7576d();
    if (var_d0651e10 <= 0) {
        return false;
    } else if (!(isdefined(entity.var_177b7a47) && entity.var_177b7a47) && !(isdefined(entity.var_7c54fb46) && entity.var_7c54fb46) && var_d0651e10 < 3) {
        return false;
    }
    forward = anglestoforward(entity.angles);
    forward2d = vectornormalize((forward[0], forward[1], 0));
    dirtotarget = entity.favoriteenemy.origin - entity.origin;
    var_854904a = vectornormalize((dirtotarget[0], dirtotarget[1], 0));
    dot = vectordot(forward2d, var_854904a);
    if (dot < entity ai::function_9139c839().var_aa503e5a) {
        return false;
    }
    test_trace = function_5d7f8057(entity, entity.favoriteenemy);
    if (test_trace[#"fraction"] < 1 && test_trace[#"entity"] !== entity.favoriteenemy) {
        return false;
    }
    height = self.maxs[2] - self.mins[2];
    forward = anglestoforward(self.angles);
    var_725b8fb5 = forward * entity ai::function_9139c839().var_167cbf22;
    var_edabd3cd = bullettracepassed(self.origin + (0, 0, height), self.origin + var_725b8fb5 + (0, 0, height + entity ai::function_9139c839().var_73212b51), 0, self);
    /#
        recordline(self.origin + (0, 0, height), self.origin + var_725b8fb5 + (0, 0, height + entity ai::function_9139c839().var_73212b51), (0, 1, 0));
    #/
    if (var_edabd3cd) {
        var_c46a2de3 = forward * entity ai::function_9139c839().var_baa42d79;
        var_edabd3cd = bullettracepassed(self.origin + var_725b8fb5 + (0, 0, height + entity ai::function_9139c839().var_73212b51), self.origin + var_c46a2de3 + (0, 0, height + entity ai::function_9139c839().var_73212b51), 0, self);
        /#
            recordline(self.origin + var_725b8fb5 + (0, 0, height + entity ai::function_9139c839().var_73212b51), self.origin + var_c46a2de3 + (0, 0, height + entity ai::function_9139c839().var_73212b51), (0, 1, 0));
        #/
    }
    if (!var_edabd3cd) {
        return false;
    }
    var_9c2b856b = distancesquared(entity.origin, entity.favoriteenemy.origin);
    if (var_9c2b856b < entity ai::function_9139c839().var_cdf6b76d * entity ai::function_9139c839().var_cdf6b76d || var_9c2b856b > entity ai::function_9139c839().var_652a36f2 * entity ai::function_9139c839().var_652a36f2) {
        return false;
    }
    return true;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x29cbb034, Offset: 0xaaa8
// Size: 0x2c
function private function_d5a0a1eb(entity) {
    entity clientfield::set("blight_father_amb_sac_clientfield", 0);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x51f2e8ba, Offset: 0xaae0
// Size: 0x5c
function private function_e0d8f770(entity) {
    entity.var_b2a80abc = gettime() + function_37d1a803(entity);
    level.var_79b2615b = undefined;
    entity clientfield::set("blight_father_amb_sac_clientfield", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xfb6653ff, Offset: 0xab48
// Size: 0x94
function private function_d2b91209(entity) {
    if (!isdefined(entity.favoriteenemy)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    entity clientfield::increment("blight_father_spawn_maggot_fx_left");
    entity thread blightfatherlaunchchaosmissile(entity.favoriteenemy, vectorscale((0, 0, 1), 5), "tag_sac_fx_le");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xfd2ba8b8, Offset: 0xabe8
// Size: 0x94
function private function_78f5c48e(entity) {
    if (!isdefined(entity.favoriteenemy)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    entity clientfield::increment("blight_father_spawn_maggot_fx_right");
    entity thread blightfatherlaunchchaosmissile(entity.favoriteenemy, vectorscale((0, 0, 1), 5), "tag_sac_fx_ri");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0xc619c662, Offset: 0xac88
// Size: 0x4c
function private function_ebd22bba() {
    self endon(#"death");
    util::wait_network_frame();
    self clientfield::set("blight_father_maggot_trail_fx", 1);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 3, eflags: 0x5 linked
// Checksum 0x5b2ac419, Offset: 0xace0
// Size: 0x568
function private blightfatherlaunchchaosmissile(var_f794172e, var_61622673, var_f3486358) {
    var_ced3ec54 = self gettagorigin(var_f3486358);
    var_27e1ee12 = var_f794172e.origin + var_61622673;
    if (isdefined(self.var_6ee32f47) && self.var_6ee32f47) {
        self.var_6ee32f47 = 0;
    }
    var_892397fd = util::spawn_model(#"tag_origin", var_ced3ec54);
    if (!isdefined(var_892397fd)) {
        return;
    }
    var_a9494306 = function_c48604c0();
    if (!isdefined(var_a9494306)) {
        var_892397fd delete();
        return;
    }
    var_a9494306.origin = var_892397fd.origin;
    var_a9494306.angles = var_892397fd.angles;
    var_a9494306 linkto(var_892397fd, "tag_origin");
    var_892397fd.trigger = var_a9494306;
    var_892397fd thread function_b2be1340(self ai::function_9139c839().var_a2519bb8);
    var_892397fd thread function_ebd22bba();
    var_892397fd thread function_a6a20b2c(var_a9494306);
    var_892397fd.var_f3d1c928 = 0;
    var_892397fd.var_52334e8c = self;
    angles_to_enemy = self gettagangles(var_f3486358);
    normal_vector = anglestoforward(angles_to_enemy);
    var_892397fd.angles = angles_to_enemy;
    var_892397fd.var_209ff2fa = normal_vector * self ai::function_9139c839().var_f988064f;
    max_trail_iterations = int(self ai::function_9139c839().var_652a36f2 / self ai::function_9139c839().var_52bddd4 * self ai::function_9139c839().var_9e5ebf3c);
    var_892397fd.missile_target = var_f794172e;
    var_892397fd thread function_5f3390fd(var_61622673, 40);
    var_892397fd playloopsound(#"hash_5b21b7c645692f8", 0.1);
    var_892397fd moveto(self gettagorigin(var_f3486358) + var_61622673, self ai::function_9139c839().var_20c6e4ca);
    var_eb325a79 = self ai::function_9139c839().var_9e5ebf3c;
    var_b446b077 = self ai::function_9139c839().var_94fefe66;
    var_3fa92868 = self ai::function_9139c839().var_52bddd4;
    wait(self ai::function_9139c839().var_20c6e4ca);
    while (isdefined(var_892397fd)) {
        if (!zombie_utility::is_player_valid(var_892397fd.missile_target, 1)) {
            var_892397fd.missile_target = undefined;
            players = getplayers();
            players = arraysortclosest(players, var_892397fd.origin);
            foreach (player in players) {
                if (zombie_utility::is_player_valid(player, 1)) {
                    var_892397fd.missile_target = player;
                    break;
                }
            }
        }
        if (var_892397fd.var_f3d1c928 >= max_trail_iterations) {
            var_892397fd thread function_124486ee(0);
        } else {
            var_892397fd function_1974d26f(var_3fa92868, var_b446b077, var_eb325a79);
            var_892397fd.var_f3d1c928 = var_892397fd.var_f3d1c928 + 1;
        }
        wait(var_eb325a79);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0x3ede8a4f, Offset: 0xb250
// Size: 0x4c
function function_a6a20b2c(var_3797b49d) {
    self waittill(#"death");
    var_3797b49d unlink();
    function_da2c4ce9(var_3797b49d);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0xc05f82bf, Offset: 0xb2a8
// Size: 0xe4
function function_b2be1340(starting_health) {
    self endon(#"detonated");
    self.n_health = starting_health;
    while (self.n_health > 0) {
        s_notify = undefined;
        s_notify = self.trigger waittill(#"damage");
        if (isdefined(s_notify.attacker) && isplayer(s_notify.attacker) && s_notify.amount > 0) {
            self.n_health = self.n_health - s_notify.amount;
        }
    }
    self thread function_124486ee(0);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 4, eflags: 0x4
// Checksum 0x938dddfb, Offset: 0xb398
// Size: 0x10e
function private function_581a06c7(forward_dir, var_ced3ec54, var_27e1ee12, max_angle) {
    vec_to_enemy = var_27e1ee12 - var_ced3ec54;
    vec_to_enemy_normal = vectornormalize(vec_to_enemy);
    angle_to_enemy = vectordot(forward_dir, vec_to_enemy_normal);
    if (angle_to_enemy >= max_angle) {
        return vec_to_enemy_normal;
    }
    plane_normal = vectorcross(forward_dir, vec_to_enemy_normal);
    perpendicular_normal = vectorcross(plane_normal, forward_dir);
    var_21f9edfd = forward_dir * cos(max_angle) + perpendicular_normal * sin(max_angle);
    return var_21f9edfd;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 2, eflags: 0x5 linked
// Checksum 0x31cdbb20, Offset: 0xb4b0
// Size: 0x18e
function private function_5f3390fd(var_61622673, var_4fee43d4) {
    self endon(#"death", #"detonated");
    var_892397fd = self;
    while (isdefined(var_892397fd)) {
        player_origins = [];
        players = getplayers();
        foreach (player in players) {
            if (!isdefined(player_origins)) {
                player_origins = [];
            } else if (!isarray(player_origins)) {
                player_origins = array(player_origins);
            }
            player_origins[player_origins.size] = player getplayercamerapos();
        }
        players = arraysortclosest(player_origins, var_892397fd.origin, undefined, 0, var_4fee43d4);
        if (players.size > 0) {
            var_892397fd thread function_124486ee(0);
        }
        waitframe(1);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 3, eflags: 0x5 linked
// Checksum 0x273ce2a, Offset: 0xb648
// Size: 0x394
function private function_1974d26f(var_3fa92868, var_10ed5867, var_eb325a79) {
    self endon(#"detonated", #"death");
    if (!isdefined(self.var_3b8e09f5)) {
        self.var_3b8e09f5 = cos(var_10ed5867 * var_eb325a79);
    }
    if (isdefined(self.missile_target) && isdefined(self.var_209ff2fa)) {
        var_6d0a510 = self.missile_target getcentroid();
        if (isplayer(self.missile_target)) {
            var_6d0a510 = self.missile_target getplayercamerapos();
        }
        vector_to_target = var_6d0a510 - self.origin;
        normal_vector = vectornormalize(vector_to_target);
        dot = vectordot(normal_vector, self.var_209ff2fa);
        if (dot >= 1) {
            dot = 1;
        } else if (dot <= -1) {
            dot = -1;
        }
        new_vector = normal_vector - self.var_209ff2fa;
        angle_between_vectors = acos(dot);
        if (!isdefined(angle_between_vectors)) {
            angle_between_vectors = 180;
        }
        if (angle_between_vectors == 0) {
            angle_between_vectors = 0.0001;
        }
        ratio = var_10ed5867 * var_eb325a79 / angle_between_vectors;
        if (ratio > 1) {
            ratio = 1;
        }
        new_vector = new_vector * ratio;
        new_vector = new_vector + self.var_209ff2fa;
        normal_vector = vectornormalize(new_vector);
    } else {
        normal_vector = self.var_209ff2fa;
    }
    move_distance = var_3fa92868 * var_eb325a79;
    move_vector = var_3fa92868 * var_eb325a79 * normal_vector;
    move_to_point = self.origin + move_vector;
    trace = bullettrace(self.origin, move_to_point, 0, self);
    if (trace[#"surfacetype"] !== "none") {
        detonate_point = trace[#"position"];
        dist_sq = distancesquared(detonate_point, self.origin);
        move_dist_sq = move_distance * move_distance;
        ratio = dist_sq / move_dist_sq;
        delay = ratio * var_eb325a79;
        self thread function_124486ee(delay);
    }
    self.var_209ff2fa = normal_vector;
    self moveto(move_to_point, var_eb325a79);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xea9cc07e, Offset: 0xb9e8
// Size: 0x304
function private function_124486ee(delay) {
    if (!isdefined(self)) {
        return;
    }
    var_892397fd = self;
    missile_owner = var_892397fd.var_52334e8c;
    blast_radius = 128;
    var_83f35abe = 45;
    var_6927cfa0 = 40;
    var_c45ef84c = 40 * 40;
    if (delay > 0) {
        wait(delay);
    }
    if (isdefined(var_892397fd)) {
        var_892397fd notify(#"detonated");
        var_892397fd moveto(var_892397fd.origin, 0.05);
        var_892397fd clientfield::set("blight_father_chaos_missile_explosion_clientfield", 1);
        e_blightfather = var_892397fd.var_52334e8c;
        w_weapon = getweapon(#"none");
        var_892397fd function_8e8b1dfc(var_c45ef84c, e_blightfather, w_weapon);
        offset = vectorscale((0, 0, 1), 18);
        if (bullettracepassed(var_892397fd.origin, var_892397fd.origin + offset, 0, 1)) {
            explosion_point = var_892397fd.origin + offset;
        } else {
            explosion_point = var_892397fd.origin;
        }
        util::wait_network_frame();
        players = getplayers();
        foreach (player in players) {
            player.var_c29c44ca = player.health;
        }
        radiusdamage(explosion_point, blast_radius, var_83f35abe, var_6927cfa0, e_blightfather, "MOD_UNKNOWN", w_weapon);
        function_44e3e0d1(explosion_point);
        if (isdefined(var_892397fd)) {
            var_892397fd clientfield::set("blight_father_maggot_trail_fx", 0);
            var_892397fd delete();
        }
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x38950c9, Offset: 0xbcf8
// Size: 0x29e
function private function_44e3e0d1(var_51a7ab9c) {
    players = getplayers();
    v_length = 100 * 100;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (!isalive(player)) {
            continue;
        }
        if (player.sessionstate == "spectator") {
            continue;
        }
        if (player.sessionstate == "intermission") {
            continue;
        }
        if (isdefined(player.ignoreme) && player.ignoreme) {
            continue;
        }
        if (player isnotarget()) {
            continue;
        }
        if (isdefined(player.var_c29c44ca) && player.health >= player.var_c29c44ca) {
            continue;
        }
        n_distance = distance2dsquared(var_51a7ab9c, player.origin);
        if (n_distance < 0.01) {
            continue;
        }
        if (!bullettracepassed(var_51a7ab9c, player.origin, 0, 1)) {
            continue;
        }
        if (n_distance < v_length) {
            v_dir = player.origin - var_51a7ab9c;
            v_dir = (v_dir[0], v_dir[1], 0.1);
            v_dir = vectornormalize(v_dir);
            n_push_strength = getdvarint(#"hash_708ca0a943843f57", 500);
            n_push_strength = 200 + randomint(n_push_strength - 200);
            v_player_velocity = player getvelocity();
            player setvelocity(v_player_velocity + v_dir * n_push_strength);
        }
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 3, eflags: 0x5 linked
// Checksum 0x4606adbe, Offset: 0xbfa0
// Size: 0x140
function private function_8e8b1dfc(var_c45ef84c, blight_father, weapon) {
    foreach (player in level.activeplayers) {
        if (!isdefined(player)) {
            continue;
        }
        distancesq = distancesquared(self.origin, player.origin + vectorscale((0, 0, 1), 48));
        if (distancesq > var_c45ef84c) {
            continue;
        }
        status_effect = getstatuseffect(#"hash_7867f8f9aaaa0c40");
        player status_effect::status_effect_apply(status_effect, weapon, blight_father);
        player clientfield::increment_to_player("blight_father_chaos_missile_rumble_clientfield", 1);
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x0
// Checksum 0x7f65d059, Offset: 0xc0e8
// Size: 0x60
function function_3dbdca02() {
    level.var_1b8dabf3++;
    level.zombie_ai_limit--;
    self waittill(#"death");
    level.var_1b8dabf3--;
    level.zombie_ai_limit++;
    level notify(#"hash_5fb3aa7a0745af2c");
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0xc5ea6b1b, Offset: 0xc150
// Size: 0x20a
function function_39212989() {
    if (!self zm_ai_utility::function_db610082()) {
        return false;
    }
    if (isdefined(level.var_153e9058) && level.var_153e9058) {
        return false;
    }
    if (isdefined(level.var_a2831281) && level.var_a2831281) {
        return true;
    }
    if (isdefined(self.var_641025d6) && self.var_641025d6 > gettime()) {
        return false;
    }
    var_57bb4de2 = 0;
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (distancesquared(player.origin, self.origin) < 16384) {
            continue;
        }
        if (distancesquared(player.origin, self.origin) > 102400) {
            continue;
        }
        var_57bb4de2 = self sightconetrace(player.origin, player, anglestoforward(player.angles));
        var_2ade806 = 1;
        if (isdefined(level.var_d975e8e6)) {
            var_2ade806 = self [[ level.var_d975e8e6 ]]();
        }
        if (var_57bb4de2 && var_2ade806) {
            break;
        }
    }
    return var_57bb4de2 && var_2ade806;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0x4946362e, Offset: 0xc368
// Size: 0x12
function function_3a0cdf7f() {
    self.b_ignore_cleanup = 1;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0x645a2e36, Offset: 0xc388
// Size: 0xc
function function_8e4c43d3(n_health_percent) {
    
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0xc49f3eac, Offset: 0xc3a0
// Size: 0xe2
function function_fa00e485(n_round_number) {
    level endon(#"end_game");
    if (!isdefined(level.var_d47205b)) {
        level.var_d47205b = 0;
    }
    while (true) {
        level waittill(#"hash_5d3012139f083ccb");
        if (zm_round_spawning::function_d0db51fc(#"blight_father") && !(isdefined(level.var_153e9058) && level.var_153e9058)) {
            level.var_d47205b++;
            level.var_bd626b54 = level.round_number + randomintrangeinclusive(3, 5);
        }
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x1 linked
// Checksum 0x544606f4, Offset: 0xc490
// Size: 0x27a
function function_633d7436(var_dbce0c44) {
    forced = zm_trial_force_archetypes::function_ff2a74e7(#"blight_father");
    var_8cf00d40 = int(floor(var_dbce0c44 / 300));
    if (isdefined(level.var_bd626b54) && level.round_number < level.var_bd626b54 && !forced) {
        return 0;
    }
    var_2506688 = 0;
    var_1797c23a = 1;
    if (forced) {
        var_2506688 = 1;
    }
    n_player_count = zm_utility::function_a2541519(level.players.size);
    if (n_player_count == 1) {
        switch (level.var_d47205b) {
        case 0:
        case 1:
        case 2:
            break;
        default:
            var_2506688 = 1;
            break;
        }
    } else {
        switch (level.var_d47205b) {
        case 0:
            break;
        case 1:
            var_1797c23a = 2;
            break;
        case 2:
            var_1797c23a = 3;
            break;
        case 3:
            var_2506688 = 1;
            var_1797c23a = 3;
            break;
        case 4:
            var_2506688 = 2;
            var_1797c23a = 3;
            break;
        default:
            var_2506688 = 3;
            var_1797c23a = 3;
            break;
        }
    }
    return randomintrangeinclusive(var_2506688, int(min(var_8cf00d40, var_1797c23a)));
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0x320fb7e5, Offset: 0xc718
// Size: 0xbc
function function_858c7fa5() {
    var_c64622d1 = function_a24ee603();
    var_3b01e91c = function_2f701be7();
    if (!(isdefined(level.var_a2831281) && level.var_a2831281) && (isdefined(level.var_153e9058) && level.var_153e9058 || var_c64622d1 >= var_3b01e91c || !level flag::get("spawn_zombies"))) {
        return false;
    }
    return true;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0x9e82223c, Offset: 0xc7e0
// Size: 0x104
function function_a24ee603() {
    if (isdefined(level.var_95c10956)) {
        return [[ level.var_95c10956 ]]();
    }
    a_ai_blight_father = getaiarchetypearray(#"blight_father");
    a_ai_blight_father = array::remove_dead(a_ai_blight_father);
    var_8e350fd9 = a_ai_blight_father.size;
    if (isarray(level.var_b175714d) && isdefined(level.var_b175714d[#"blight_father"]) && isdefined(level.var_b175714d[#"blight_father"].var_33e393a7)) {
        var_8e350fd9 = var_8e350fd9 + level.var_b175714d[#"blight_father"].var_33e393a7;
    }
    return var_8e350fd9;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0xea78fa00, Offset: 0xc8f0
// Size: 0xc2
function function_2f701be7() {
    n_player_count = zm_utility::function_a2541519(level.players.size);
    switch (n_player_count) {
    case 1:
        return 1;
    case 2:
        return 3;
    case 3:
        return 3;
    case 4:
        return 3;
    default:
        return 3;
    }
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x1 linked
// Checksum 0x67c34b7c, Offset: 0xc9c0
// Size: 0x96
function round_spawn() {
    /#
        blight_father_spawners = getspawnerarray("<unknown string>", "<unknown string>");
        if (blight_father_spawners.size == 0) {
            iprintln("<unknown string>");
            return;
        }
    #/
    if (function_858c7fa5()) {
        zm_transform::function_bdd8aba6(#"blight_father");
    }
    return 0;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0xce2377f7, Offset: 0xca60
// Size: 0x90
function private function_2315440d() {
    spawners = getspawnerarray("zombie_blight_father_spawner", "script_noteworthy");
    /#
        assert(spawners.size > 0);
    #/
    new_ai = spawners[0] spawnfromspawner(0, 1);
    new_ai zm_transform::function_bbaec2fd();
    return true;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0xb7bce429, Offset: 0xcaf8
// Size: 0x1a
function private on_host_migration_begin(params) {
    level.var_9cfa4efd = 1;
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x5fe39132, Offset: 0xcb20
// Size: 0x46
function private on_host_migration_end(params) {
    level.var_9cfa4efd = undefined;
    level.var_fcb96175 = gettime() + int(30 * 1000);
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x4
// Checksum 0xf7f8793a, Offset: 0xcb70
// Size: 0x8a
function private function_ebc88dbd(part_name) {
    /#
        foreach (weakpoint in self.var_d88561ed) {
            if (weakpoint.var_19e7c1c4 == part_name) {
                return weakpoint;
            }
        }
    #/
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x4
// Checksum 0x8c688f9b, Offset: 0xcc08
// Size: 0x180
function private function_cab68577(hittag) {
    /#
        enemies = getaiarchetypearray(#"blight_father");
        foreach (enemy in enemies) {
            if (isalive(enemy)) {
                var_84ed9a13 = namespace_81245006::function_37e3f011(enemy, hittag);
                if (!isdefined(var_84ed9a13)) {
                    return;
                } else if (namespace_81245006::function_f29756fe(var_84ed9a13) != 1) {
                    continue;
                }
                enemy function_afce1cf(level.players[0], level.players[0], var_84ed9a13.maxhealth, undefined, undefined, level.players[0] getcurrentweapon(), level.players[0].origin, undefined, undefined, 0, hittag);
            }
        }
    #/
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 1, eflags: 0x4
// Checksum 0x18353e3c, Offset: 0xcd90
// Size: 0xde
function private function_f8411b4d(blight_father) {
    /#
        if (isdefined(level.var_d4c91513)) {
            return;
        }
        foreach (var_84ed9a13 in namespace_81245006::function_fab3ee3e(blight_father)) {
            adddebugcommand("<unknown string>" + var_84ed9a13.var_51e8b151 + "<unknown string>" + var_84ed9a13.var_51e8b151 + "<unknown string>");
        }
        level.var_d4c91513 = 1;
    #/
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x4
// Checksum 0x44934b35, Offset: 0xce78
// Size: 0x430
function private function_a2751530() {
    /#
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        while (true) {
            waitframe(1);
            string = getdvarstring(#"hash_1999cec56042c9de", "<unknown string>");
            cmd = strtok(string, "face angle");
            if (cmd.size > 0) {
                switch (cmd[0]) {
                case #"spawn":
                    function_4d72a4a6();
                    break;
                case #"kill":
                    function_d420b133();
                    break;
                case #"destroy_weakpoint":
                    function_cab68577(cmd[1]);
                    break;
                case #"hash_396b84907b30a71c":
                    setdvar(#"hash_3ec02cda135af40f", !getdvarint(#"hash_3ec02cda135af40f", 0));
                    break;
                case #"debug_dmg":
                    level.var_482766d7 = !(isdefined(level.var_482766d7) && level.var_482766d7);
                    break;
                case #"hash_3170107749934609":
                    foreach (blight_father in getaiarchetypearray(#"blight_father")) {
                        blight_father ai::set_behavior_attribute("<unknown string>", !blight_father ai::get_behavior_attribute("<unknown string>"));
                    }
                    break;
                case #"toggle_lockdown":
                    foreach (blight_father in getaiarchetypearray(#"blight_father")) {
                        blight_father ai::set_behavior_attribute("<unknown string>", !blight_father ai::get_behavior_attribute("<unknown string>"));
                    }
                    break;
                default:
                    if (isdefined(level.var_c81a4e00)) {
                        [[ level.var_c81a4e00 ]](cmd);
                    }
                    break;
                }
            }
            setdvar(#"hash_1999cec56042c9de", "<unknown string>");
        }
    #/
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x4
// Checksum 0x64950095, Offset: 0xd2b0
// Size: 0xae
function private function_255c7194() {
    /#
        player = getplayers()[0];
        queryresult = positionquery_source_navigation(player.origin, 128, 256, 128, 20);
        if (isdefined(queryresult) && queryresult.data.size > 0) {
            return queryresult.data[0];
        }
        return {#origin:player.origin};
    #/
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x4
// Checksum 0x9d6d686b, Offset: 0xd368
// Size: 0x12c
function private function_4d72a4a6() {
    /#
        blight_father_spawners = getspawnerarray("<unknown string>", "<unknown string>");
        spawn_point = function_255c7194();
        if (blight_father_spawners.size == 0) {
            iprintln("<unknown string>");
            return;
        }
        blight_father_spawners[0].script_forcespawn = 1;
        entity = zombie_utility::spawn_zombie(blight_father_spawners[0], undefined, spawn_point);
        if (!isdefined(entity)) {
            return;
        }
        if (!isdefined(spawn_point.angles)) {
            angles = (0, 0, 0);
        } else {
            angles = spawn_point.angles;
        }
        entity zm_transform::function_bbaec2fd();
        entity forceteleport(spawn_point.origin, angles);
    #/
}

// Namespace zm_ai_blight_father/zm_ai_blight_father
// Params 0, eflags: 0x4
// Checksum 0xe1b9b31f, Offset: 0xd4a0
// Size: 0xc0
function private function_d420b133() {
    /#
        enemies = getaiarchetypearray(#"blight_father");
        foreach (enemy in enemies) {
            if (isalive(enemy)) {
                enemy kill();
            }
        }
    #/
}

