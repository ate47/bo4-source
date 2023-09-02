// Atian COD Tools GSC decompiler test
#using scripts\zm\powerup\zm_powerup_nuke.gsc;
#using scripts\zm_common\trials\zm_trial_close_quarters.gsc;
#using scripts\zm_common\trials\zm_trial_special_enemy.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using script_24c32478acf44108;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\destructible_character.gsc;
#using scripts\core_common\ai\systems\debug.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using scripts\core_common\ai\archetype_stoker_interface.gsc;
#using scripts\core_common\ai\archetype_stoker.gsc;
#using scripts\core_common\ai\archetype_mocomps_utility.gsc;
#using scripts\core_common\ai\archetype_locomotion_utility.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\burnplayer.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace zm_ai_stoker;

// Namespace zm_ai_stoker
// Method(s) 2 Total 2
class class_264486ac {

    // Namespace class_264486ac/zm_ai_stoker
    // Params 0, eflags: 0x9 linked
    // Checksum 0xed872d17, Offset: 0x1560
    // Size: 0x4c
    __constructor() {
        self.active = 1;
        self.health = 0;
        self.hitloc = "";
        self.hittag = "";
        var_934afb38 = 0;
    }

    // Namespace class_264486ac/zm_ai_stoker
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x15b8
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x2
// Checksum 0x44376a26, Offset: 0x610
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_stoker", &__init__, &__main__, undefined);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0xf8f776d1, Offset: 0x660
// Size: 0x3c4
function __init__() {
    level.var_b48fed60 = 0;
    zm_player::register_player_damage_callback(&function_6da30402);
    registerbehaviorscriptfunctions();
    init();
    /#
        execdevgui("<unknown string>");
        level thread function_a92dac75();
    #/
    spawner::add_archetype_spawn_function(#"stoker", &function_580b77a2);
    zm_utility::function_d0f02e71(#"stoker");
    /#
        spawner::add_archetype_spawn_function(#"stoker", &zombie_utility::updateanimationrate);
    #/
    animationstatenetwork::registernotetrackhandlerfunction("coals_fire", &function_b2602782);
    animationstatenetwork::registernotetrackhandlerfunction("stoker_death_gib", &function_eb4e0ec3);
    animationstatenetwork::registernotetrackhandlerfunction("coal_charge_stop", &function_717a6538);
    if (ai::shouldregisterclientfieldforarchetype(#"stoker")) {
        clientfield::register("actor", "crit_spot_reveal_clientfield", 1, getminbitcountfornum(4), "int");
        clientfield::register("actor", "stoker_fx_start_clientfield", 1, 3, "int");
        clientfield::register("actor", "stoker_fx_stop_clientfield", 1, 3, "int");
        clientfield::register("actor", "stoker_death_explosion", 1, 2, "int");
    }
    function_983f7ff1();
    zm::register_actor_damage_callback(&function_fa8be26d);
    zm_spawner::register_zombie_death_event_callback(&killed_callback);
    zm_trial_special_enemy::function_95c1dd81(#"stoker", &function_f5f699aa);
    namespace_9ff9f642::register_slowdown("stoker_undewater_slow_type", 0.8);
    zm_round_spawning::register_archetype(#"stoker", &function_b381320, &round_spawn, undefined, 100);
    zm_round_spawning::function_306ce518(#"stoker", &function_cf5ef033);
    zm_cleanup::function_cdf5a512(#"stoker", &function_3049b317);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xa30
// Size: 0x4
function __main__() {
    
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0x89bfc28a, Offset: 0xa40
// Size: 0xfc
function init() {
    level.a_sp_stoker = [];
    level thread aat::register_immunity("zm_aat_brain_decay", #"stoker", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_frostbite", #"stoker", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_kill_o_watt", #"stoker", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_plasmatic_burst", #"stoker", 1, 1, 1);
    function_2170ee7a();
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0x5312cfca, Offset: 0xb48
// Size: 0x9e4
function registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&function_253c9e38));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_11342039e49bb092", &function_253c9e38);
    /#
        assert(isscriptfunctionptr(&function_6d817d57));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_64bb85f17c6f0c26", &function_6d817d57);
    /#
        assert(isscriptfunctionptr(&function_31f887b5));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7abf56a70eea8824", &function_31f887b5);
    /#
        assert(isscriptfunctionptr(&function_6cd91a4d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7914389e526099c3", &function_6cd91a4d);
    /#
        assert(isscriptfunctionptr(&function_d47e273b));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_69d99c802f94a161", &function_d47e273b);
    /#
        assert(isscriptfunctionptr(&function_65d23c4f));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_34979234c577e020", &function_65d23c4f);
    /#
        assert(isscriptfunctionptr(&function_fb220c8c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2eda816d46284ecf", &function_fb220c8c);
    /#
        assert(isscriptfunctionptr(&function_53d1998d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_62e8ff16b0eb8a2e", &function_53d1998d);
    /#
        assert(isscriptfunctionptr(&function_765f06f9));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_e3d43dd957e7586", &function_765f06f9);
    /#
        assert(isscriptfunctionptr(&function_60951874));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2d05a32b52fcaafd", &function_60951874);
    /#
        assert(isscriptfunctionptr(&function_8ef6771f));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7ed50d08e0e9bcfa", &function_8ef6771f);
    /#
        assert(isscriptfunctionptr(&function_e2e5eebf));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_58ce6baf23499b6f", &function_e2e5eebf);
    /#
        assert(isscriptfunctionptr(&function_7cd52d88));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3993bf34ab2531f0", &function_7cd52d88);
    /#
        assert(isscriptfunctionptr(&function_a2d1d120));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_25c4de2eb81f27cb", &function_a2d1d120);
    /#
        assert(isscriptfunctionptr(&function_b7fe306e));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_389c07d3893e660", &function_b7fe306e);
    /#
        assert(isscriptfunctionptr(&function_36903815));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1607f20e814fb19b", &function_36903815);
    /#
        assert(isscriptfunctionptr(&function_f01e64d6));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_173e1c9378200965", &function_f01e64d6);
    /#
        assert(isscriptfunctionptr(&function_dee90338));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3e875851311be4e8", &function_dee90338);
    /#
        assert(isscriptfunctionptr(&function_b6e7676d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4fe0c56f8cd42ad1", &function_b6e7676d);
    /#
        assert(isscriptfunctionptr(&function_20a3d8f6));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_21f1387075571547", &function_20a3d8f6);
    /#
        assert(isscriptfunctionptr(&function_efbd6650));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_771bfe8686d806d6", &function_efbd6650);
    /#
        assert(isscriptfunctionptr(&function_399815b2));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_138db5b46aeab153", &function_399815b2);
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&function_b4ecc051) || isscriptfunctionptr(&function_b4ecc051));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_4778faf1d75cc885", undefined, &function_b4ecc051, undefined);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x5 linked
// Checksum 0x27ee3cf, Offset: 0x1538
// Size: 0x1e
function private function_983f7ff1() {
    level.stokerdebug = 0;
    level.var_fb6dfb50 = 0;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0xae1aa66f, Offset: 0x1658
// Size: 0x5d8
function function_580b77a2() {
    zm_score::function_e5d6e6dd(#"stoker", self ai::function_9139c839().var_87e1e74d);
    aiutility::addaioverridedamagecallback(self, &function_a96d8bd7);
    self attach("c_t8_zmb_titanic_stoker_larm1");
    self attach("c_t8_zmb_titanic_stoker_lshoulder_cap1");
    self attach("c_t8_zmb_titanic_stoker_rshoulder_cap1");
    self attach("c_t8_zmb_titanic_stoker_head_cap1");
    self attach("c_t8_zmb_titanic_stoker_shovel1", "tag_weapon_right");
    self.var_1861eb5b = [];
    self.var_1861eb5b[#"left_arm_upper"] = new class_264486ac();
    self.var_1861eb5b[#"left_arm_upper"].shadervector = 4;
    self.var_1861eb5b[#"left_arm_upper"].fxindex = 3;
    self.var_1861eb5b[#"right_arm_upper"] = new class_264486ac();
    self.var_1861eb5b[#"right_arm_upper"].shadervector = 1;
    self.var_1861eb5b[#"right_arm_upper"].fxindex = 4;
    self.var_1861eb5b[#"head"] = new class_264486ac();
    self.var_1861eb5b[#"head"].shadervector = 3;
    self.var_1861eb5b[#"head"].fxindex = 5;
    self.var_1861eb5b[#"left_arm_lower"] = new class_264486ac();
    self.var_1861eb5b[#"left_arm_lower"].var_6d7b8c32 = 1;
    self.var_1861eb5b[#"left_arm_lower"].var_a222368f = "j_wrist_le";
    self.var_1861eb5b[#"left_arm_lower"].fxindex = 6;
    self.var_19f48bbe = [];
    self.var_19f48bbe[0] = "left_arm_upper";
    self.var_19f48bbe[1] = "right_arm_upper";
    self.var_19f48bbe[2] = "head";
    if (!isdefined(level.var_a64fa07c)) {
        level.var_a64fa07c = 0;
    }
    self.var_a056e24 = self.var_19f48bbe[level.var_a64fa07c];
    level.var_a64fa07c = (level.var_a64fa07c + 1) % self.var_19f48bbe.size;
    self.var_dc32e381 = 0;
    self.var_81d3587d = 0;
    self.var_ce5d8e8f = "locomotion_speed_run";
    if (level.var_fb6dfb50) {
        self.var_ce5d8e8f = "locomotion_speed_walk";
    }
    self setblackboardattribute("_locomotion_speed", self.var_ce5d8e8f);
    self.lastattacktime = gettime() + self ai::function_9139c839().var_1d505f4d - getdvarint(#"hash_3dfb66f92268c90f", self ai::function_9139c839().var_d33d95d0);
    self.var_41f51cb4 = "stoker_charge_attack";
    self.var_5274eb5f = 0;
    self.var_86f9cdcd = 0;
    self.var_aca87abc = 0;
    self.var_d691409c = 0;
    self.var_ccb2e201 = 0;
    self.var_1db5ef71 = 0;
    self.should_zigzag = 0;
    self.instakill_func = &zm_powerups::function_16c2586a;
    self.var_f46fbf3f = 1;
    self.actor_killed_override = &function_cf402986;
    self.closest_player_override = &zm_utility::function_c52e1749;
    self.var_80cf70fb = &function_e4ef4e27;
    self.cant_move_cb = &zombiebehavior::function_79fe956f;
    self zm_powerup_nuke::function_9a79647b(0.5);
    self thread zm_audio::play_ambient_zombie_vocals();
    target_set(self);
    level.var_b48fed60++;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0x1b20d86f, Offset: 0x1c38
// Size: 0x8c
function function_2df052bb() {
    self.maxhealth = int(self zm_ai_utility::function_8d44707e(1, self._starting_round_number) * (isdefined(level.var_1b0cc4f5) ? level.var_1b0cc4f5 : 1));
    self.health = self.maxhealth;
    namespace_81245006::initweakpoints(self, #"c_t8_zmb_stoker_weakpoint_def");
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0x8b7b245a, Offset: 0x1cd0
// Size: 0x118
function function_3049b317() {
    if (!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area)) {
        return 1;
    }
    if (isdefined(level.var_370b1a3d)) {
        s_spawn_loc = [[ level.var_370b1a3d ]]();
    } else if (level.zm_loc_types[#"stoker_location"].size > 0) {
        s_spawn_loc = array::random(level.zm_loc_types[#"stoker_location"]);
    }
    if (!isdefined(s_spawn_loc)) {
        return 1;
    }
    self zm_ai_utility::function_a8dc3363(s_spawn_loc);
    if (isalive(self)) {
        self playsound(#"hash_63299a75a97f9678");
        function_6eac4ca1(self, "spawn");
    }
    return 1;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xed6aa352, Offset: 0x1df0
// Size: 0x4c
function private function_eb4e0ec3(entity) {
    entity setmodel("c_t8_zmb_titanic_stoker_body1_gibbed");
    entity clientfield::set("stoker_death_explosion", 2);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 8, eflags: 0x5 linked
// Checksum 0x6dc5fd34, Offset: 0x1e48
// Size: 0x9c
function private function_cf402986(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime) {
    self clientfield::set("stoker_fx_start_clientfield", 1);
    destructserverutils::destructnumberrandompieces(self);
    self clientfield::set("stoker_death_explosion", 1);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 4, eflags: 0x5 linked
// Checksum 0xa0518aa2, Offset: 0x1ef0
// Size: 0x74
function private function_e4ef4e27(entity, attribute, oldvalue, value) {
    if (value == "low") {
        entity thread namespace_9ff9f642::slowdown("stoker_undewater_slow_type");
    } else {
        entity thread namespace_9ff9f642::function_520f4da5("stoker_undewater_slow_type");
    }
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params c, eflags: 0x1 linked
// Checksum 0x98489deb, Offset: 0x1f70
// Size: 0x6e0
function function_a96d8bd7(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex) {
    if (self.archetype != #"stoker") {
        return;
    }
    if (eattacker.archetype === #"stoker") {
        return 0;
    }
    if (zm_trial_close_quarters::is_active() && !self zm_trial_close_quarters::function_23d15bf3(eattacker)) {
        return 0;
    }
    var_dd54fdb1 = namespace_81245006::function_3131f5dd(self, shitloc, 1);
    if (!isdefined(var_dd54fdb1)) {
        var_dd54fdb1 = namespace_81245006::function_73ab4754(self, vpoint, 1);
    }
    var_786d7e06 = zm_ai_utility::function_422fdfd4(self, eattacker, sweapon, boneindex, shitloc, vpoint, var_dd54fdb1);
    damagedone = int(max(1, idamage * var_786d7e06.damage_scale));
    var_fe16adf4 = 0;
    var_88e794fb = 0;
    var_ae30c5b0 = 0;
    if (zm_loadout::is_hero_weapon(sweapon)) {
        var_ae30c5b0 = 1;
        if (!isdefined(self.var_5dc26e42) || self.var_5dc26e42 >= 1000) {
            self.var_5dc26e42 = 0;
        }
        self.var_5dc26e42 = self.var_5dc26e42 + damagedone;
    }
    if (smeansofdeath != "MOD_PROJECTILE_SPLASH") {
        if (!var_ae30c5b0) {
            var_dd54fdb1 = var_786d7e06.var_84ed9a13;
            var_88e794fb = var_786d7e06.registerzombie_bgb_used_reinforce;
        } else {
            weakpoints = namespace_81245006::function_fab3ee3e(self);
            if (isdefined(weakpoints)) {
                foreach (var_3a1904d3 in weakpoints) {
                    if (namespace_81245006::function_f29756fe(var_3a1904d3) === 1 && var_3a1904d3.type === #"armor" && var_3a1904d3.hitloc !== "left_arm_lower") {
                        var_dd54fdb1 = var_3a1904d3;
                        var_88e794fb = 1;
                        break;
                    }
                }
            }
        }
        if (isdefined(var_dd54fdb1)) {
            if (var_dd54fdb1.type == #"armor") {
                if (isdefined(var_88e794fb) && var_88e794fb) {
                    if (isdefined(var_dd54fdb1.hitloc)) {
                        var_1861eb5b = self.var_1861eb5b[var_dd54fdb1.hitloc];
                    }
                    if (isdefined(var_1861eb5b)) {
                        self clientfield::set("stoker_fx_start_clientfield", var_1861eb5b.fxindex);
                    }
                    namespace_81245006::function_ef87b7e8(var_dd54fdb1, damagedone);
                    var_fe16adf4 = 1;
                    function_6eac4ca1(self, "pain");
                    if (namespace_81245006::function_f29756fe(var_dd54fdb1) === 3 || var_ae30c5b0 && self.var_5dc26e42 >= 1000) {
                        if (var_dd54fdb1.var_641ce20e) {
                            namespace_81245006::function_6742b846(self, var_dd54fdb1);
                        }
                        if (isdefined(var_1861eb5b.var_6d7b8c32) && var_1861eb5b.var_6d7b8c32) {
                            self.var_81d3587d = 1;
                            self.var_86f9cdcd = 1;
                        }
                        if (isdefined(var_1861eb5b.var_a222368f)) {
                            physicsexplosionsphere(self gettagorigin(var_1861eb5b.var_a222368f), 600, 0, 80, 1, 1);
                            self.var_ccb2e201 = 1;
                        }
                        self destructserverutils::handledamage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, var_dd54fdb1.hitloc, psoffsettime, boneindex, modelindex);
                        if (var_dd54fdb1.hitloc === self.var_a056e24) {
                            if (isdefined(var_1861eb5b.shadervector)) {
                                self clientfield::set("crit_spot_reveal_clientfield", var_1861eb5b.shadervector);
                            }
                            var_add9b529 = namespace_81245006::function_3131f5dd(self, self.var_a056e24);
                            if (isdefined(var_add9b529)) {
                                namespace_81245006::function_6c64ebd3(var_add9b529, 1);
                            }
                        }
                    }
                }
            } else if (var_dd54fdb1.hitloc === self.var_a056e24) {
                if (self.var_5274eb5f) {
                    self.var_dc32e381 = self.var_dc32e381 + damagedone;
                }
                if (damagedone >= self.health) {
                    self.var_6f3ba226 = 1;
                    self notify(#"hash_4651621237a54fc7");
                }
            }
        }
    }
    if (var_fe16adf4 && !var_ae30c5b0) {
        damagedone = 1;
    }
    /#
        function_752a64b8("<unknown string>" + damagedone + "<unknown string>" + self.health);
    #/
    return damagedone;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 5, eflags: 0x4
// Checksum 0x12ef9e44, Offset: 0x2658
// Size: 0xc0
function private function_1bf5272c(hitloc, point, location, var_934afb38, tag) {
    var_99f08950 = 0;
    if (isdefined(hitloc) && hitloc != "none" && hitloc == location) {
        var_99f08950 = 1;
    } else {
        distsq = distancesquared(point, self gettagorigin(tag));
        if (distsq <= var_934afb38) {
            var_99f08950 = 1;
        }
    }
    return var_99f08950;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 2, eflags: 0x4
// Checksum 0x11d45a71, Offset: 0x2720
// Size: 0x86
function private function_c9116e0f(var_1861eb5b, damage) {
    /#
        function_752a64b8("<unknown string>" + damage + "<unknown string>" + var_1861eb5b.position);
    #/
    var_1861eb5b.health = var_1861eb5b.health - damage;
    if (var_1861eb5b.health <= 0) {
        var_1861eb5b.active = 0;
    }
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xea06d98d, Offset: 0x27b0
// Size: 0x2b6
function private function_31f887b5(behaviortreeentity) {
    if (behaviortreeentity getblackboardattribute("_locomotion_speed") === "locomotion_speed_sprint" || behaviortreeentity.var_ccb2e201) {
        var_bd66486b = "knockdown";
    } else {
        var_bd66486b = "push";
    }
    var_92cf09df = behaviortreeentity ai::function_9139c839().var_a22e6e32;
    if (behaviortreeentity.var_ccb2e201) {
        var_92cf09df = behaviortreeentity ai::function_9139c839().var_159f74bb;
    }
    velocity = behaviortreeentity getvelocity();
    velocitymag = length(velocity);
    predicttime = 0.2;
    movevector = velocity * predicttime;
    predictedpos = behaviortreeentity.origin + movevector;
    zombiesarray = getaiarchetypearray(#"zombie");
    zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"catalyst"), 0, 0);
    var_86476d47 = array::filter(zombiesarray, 0, &namespace_9ff9f642::function_865a83f8, behaviortreeentity, predictedpos, var_92cf09df);
    if (var_86476d47.size > 0) {
        foreach (zombie in var_86476d47) {
            if (var_bd66486b == "knockdown") {
                zombie zombie_utility::setup_zombie_knockdown(behaviortreeentity);
                zombie.knockdown_type = "knockdown_shoved";
            } else {
                zombie zombie_utility::function_fc0cb93d(behaviortreeentity);
            }
        }
    }
    behaviortreeentity.var_ccb2e201 = 0;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xdd53c6d4, Offset: 0x2a70
// Size: 0x130
function private function_6cd91a4d(entity) {
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    if (entity.var_1db5ef71 > gettime()) {
        return 0;
    }
    meleedistsq = 4096;
    if (isdefined(entity.meleeweapon) && entity.meleeweapon !== level.weaponnone) {
        meleedistsq = entity.meleeweapon.aimeleerange * entity.meleeweapon.aimeleerange;
    }
    var_e9677328 = distancesquared(entity.origin, entity.enemy.origin);
    if (var_e9677328 <= meleedistsq) {
        return 0;
    }
    if (var_e9677328 > entity ai::function_9139c839().var_b7a8163d * entity ai::function_9139c839().var_b7a8163d) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x4
// Checksum 0xb59e9923, Offset: 0x2ba8
// Size: 0x52
function private function_d4e03577(distance) {
    if (isdefined(self.enemy)) {
        return (distancesquared(self.origin, self.enemy.origin) > distance * distance);
    }
    return 0;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x2e56c906, Offset: 0x2c08
// Size: 0x16
function private function_d47e273b(entity) {
    return entity.var_86f9cdcd;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x68421b, Offset: 0x2c28
// Size: 0x3e
function private function_65d23c4f(entity) {
    /#
        if (entity.var_907e6060) {
            function_752a64b8("<unknown string>");
        }
    #/
    return entity.var_907e6060;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xe4d8e7ea, Offset: 0x2c70
// Size: 0x2c
function private function_fb220c8c(entity) {
    return entity.var_aca87abc && function_ac53cb4e(entity);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xbc0ee755, Offset: 0x2ca8
// Size: 0x44
function private function_53d1998d(entity) {
    return !entity.var_907e6060 && entity.var_aca87abc && function_ac53cb4e(entity);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x9eaceaad, Offset: 0x2cf8
// Size: 0x2c
function private function_765f06f9(entity) {
    return entity.var_aca87abc && function_ac53cb4e(entity);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x8eba7104, Offset: 0x2d30
// Size: 0x2c
function private function_7cd52d88(entity) {
    /#
        function_752a64b8("<unknown string>");
    #/
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x68aadc76, Offset: 0x2d68
// Size: 0x4c
function private function_b7fe306e(entity) {
    /#
        function_752a64b8("<unknown string>");
    #/
    entity.var_86f9cdcd = 0;
    stokerchargeattack(entity);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x7958b20e, Offset: 0x2dc0
// Size: 0x2c
function private function_f01e64d6(entity) {
    /#
        function_752a64b8("<unknown string>");
    #/
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xcb959c9d, Offset: 0x2df8
// Size: 0x4c
function private function_36903815(entity) {
    /#
        function_752a64b8("<unknown string>");
    #/
    entity clientfield::set("stoker_fx_start_clientfield", 7);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x5e71febc, Offset: 0x2e50
// Size: 0x4e
function private function_aae7916a(entity) {
    if (zm_behavior::zombieshouldstun(entity)) {
        return 1;
    }
    if (zm_behavior::zombieshouldknockdown(entity)) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x839f9c9, Offset: 0x2ea8
// Size: 0x2c
function private function_dee90338(entity) {
    /#
        function_752a64b8("<unknown string>");
    #/
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x28a2d486, Offset: 0x2ee0
// Size: 0x6c
function private function_b6e7676d(entity) {
    /#
        function_752a64b8("<unknown string>");
    #/
    entity.var_aca87abc = 0;
    if (function_aae7916a(entity)) {
        entity clientfield::set("stoker_fx_stop_clientfield", 7);
    }
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x462c05cf, Offset: 0x2f58
// Size: 0x6c
function private function_20a3d8f6(entity) {
    /#
        function_752a64b8("<unknown string>");
    #/
    entity.var_907e6060 = 0;
    if (function_aae7916a(entity)) {
        entity clientfield::set("stoker_fx_stop_clientfield", 7);
    }
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xc8234fe8, Offset: 0x2fd0
// Size: 0x1a
function private function_efbd6650(entity) {
    entity.cp_level_blackstation_goto_centerbreadcrumb = 1;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xa5e65cd5, Offset: 0x2ff8
// Size: 0x16
function private function_399815b2(entity) {
    entity.cp_level_blackstation_goto_centerbreadcrumb = undefined;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xa5aab675, Offset: 0x3018
// Size: 0x54
function private function_60951874(entity) {
    if (self.var_dc32e381 >= entity ai::function_9139c839().var_20dea374) {
        /#
            function_752a64b8("<unknown string>");
        #/
        return 1;
    }
    return 0;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 2, eflags: 0x5 linked
// Checksum 0x69e906eb, Offset: 0x3078
// Size: 0x38
function private function_b4ecc051(entity, asmstatename) {
    if (entity ai::is_stunned()) {
        return 5;
    }
    return 4;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xe78629e4, Offset: 0x30b8
// Size: 0x44
function private function_a2d1d120(entity) {
    /#
        function_752a64b8("<unknown string>");
    #/
    function_394c6870(entity);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x10a5367c, Offset: 0x3108
// Size: 0x74
function private function_394c6870(entity) {
    entity.var_5274eb5f = 0;
    entity.var_86f9cdcd = 0;
    entity.var_dc32e381 = 0;
    entity setblackboardattribute("_locomotion_speed", self.var_ce5d8e8f);
    entity clientfield::set("stoker_fx_stop_clientfield", 2);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xf974326, Offset: 0x3188
// Size: 0x9c
function private stokerchargeattack(entity) {
    entity.var_5274eb5f = 1;
    if (entity.var_d691409c) {
        entity.var_d691409c = 0;
    } else {
        entity.var_41f51cb4 = "stoker_charge_attack";
    }
    entity.lastattacktime = gettime();
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
    entity clientfield::set("stoker_fx_start_clientfield", 2);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x711b6cec, Offset: 0x3230
// Size: 0x46
function private stokerrangedattack(entity) {
    entity.var_907e6060 = 1;
    entity.var_aca87abc = 1;
    self.var_41f51cb4 = "stoker_ranged_attack";
    entity.lastattacktime = gettime();
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xefda38d2, Offset: 0x3280
// Size: 0x7e
function private function_5878b360(entity) {
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    return distancesquared(entity.origin, entity.enemy.origin) <= entity ai::function_9139c839().var_2512cf3b * entity ai::function_9139c839().var_2512cf3b;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x77783775, Offset: 0x3308
// Size: 0x82
function private function_ac53cb4e(entity) {
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    can_see = bullettracepassed(entity.origin + vectorscale((0, 0, 1), 36), entity.enemy.origin + vectorscale((0, 0, 1), 36), 0, undefined);
    return can_see;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xb9c9e60a, Offset: 0x3398
// Size: 0x3a
function private function_6d817d57(entity) {
    if (isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area) {
        return 1;
    }
    return zm_behavior::zombieenteredplayable(entity);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xa2250ca3, Offset: 0x33e0
// Size: 0x28c
function private function_253c9e38(entity) {
    timeelapsed = gettime() - entity.lastattacktime;
    if (entity.var_5274eb5f && timeelapsed > entity ai::function_9139c839().var_287805eb) {
        /#
            function_752a64b8("<unknown string>");
        #/
        function_394c6870(entity);
    }
    if (entity.var_d691409c) {
        /#
            function_752a64b8("<unknown string>");
        #/
        entity.var_86f9cdcd = 1;
        return;
    }
    if (timeelapsed > getdvarint(#"hash_3dfb66f92268c90f", entity ai::function_9139c839().var_d33d95d0)) {
        if (timeelapsed > entity ai::function_9139c839().var_73070557 && entity.var_41f51cb4 == "stoker_ranged_attack" && isdefined(entity.var_c6e0686b) && entity.var_c6e0686b <= entity ai::function_9139c839().var_20266c0d * entity ai::function_9139c839().var_20266c0d) {
            entity.var_86f9cdcd = 1;
        } else if (!entity.var_aca87abc && !entity.var_86f9cdcd && isdefined(entity getblackboardattribute("_locomotion_speed")) && entity getblackboardattribute("_locomotion_speed") != "locomotion_speed_sprint" && function_ac53cb4e(entity) && !entity.var_81d3587d && function_5878b360(entity)) {
            /#
                function_752a64b8("<unknown string>");
            #/
            stokerrangedattack(entity);
        }
    }
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x1 linked
// Checksum 0x13a672f6, Offset: 0x3678
// Size: 0x466
function function_b2602782(entity) {
    if (!isactor(entity) || !isdefined(entity.enemy)) {
        return;
    }
    targetpos = entity.enemy.origin;
    launchpos = entity gettagorigin("j_wrist_le");
    var_ad804014 = entity ai::function_9139c839().var_accd767d;
    if (distancesquared(targetpos, entity.origin) > entity ai::function_9139c839().var_bf28a226 * entity ai::function_9139c839().var_bf28a226) {
        velocity = entity.enemy getvelocity();
        targetpos = targetpos + velocity * entity ai::function_9139c839().var_10a1d059;
        var_a76a363d = math::randomsign() * randomint(var_ad804014);
        var_9b241db1 = math::randomsign() * randomint(var_ad804014);
        targetpos = targetpos + (var_a76a363d, var_9b241db1, 0);
        speed = length(velocity);
        if (speed > 0) {
            var_7ee6937e = vectornormalize((targetpos[0], targetpos[1], 0) - (launchpos[0], launchpos[1], 0));
            dot = vectordot(-1 * var_7ee6937e, velocity / speed);
            if (dot >= entity ai::function_9139c839().var_cd8b7a6c) {
                targetpos = targetpos + var_7ee6937e * dot * speed * entity ai::function_9139c839().var_322773b9;
            }
        }
    }
    targetpos = targetpos + (0, 0, entity ai::function_9139c839().var_f227d0d0);
    var_872c6826 = vectortoangles(targetpos - launchpos);
    angles = function_cc68801f(launchpos, targetpos, entity ai::function_9139c839().var_81da787, getdvarfloat(#"bg_lowgravity", 0));
    if (isdefined(angles) && angles[#"lowangle"] > 0) {
        dir = anglestoforward((-1 * angles[#"lowangle"], var_872c6826[1], var_872c6826[2]));
    } else {
        dir = anglestoforward(var_872c6826);
    }
    velocity = dir * entity ai::function_9139c839().var_81da787;
    grenade = entity magicgrenadetype(getweapon("stoker_coal_bomb"), launchpos, velocity);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x1 linked
// Checksum 0xbd47669e, Offset: 0x3ae8
// Size: 0x2c
function function_717a6538(entity) {
    entity clientfield::set("stoker_fx_stop_clientfield", 7);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 10, eflags: 0x1 linked
// Checksum 0x1ec6dffe, Offset: 0x3b20
// Size: 0x1a6
function function_6da30402(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime) {
    if (isdefined(eattacker) && isai(eattacker) && eattacker.archetype == #"stoker" && eattacker.team != self.team) {
        if (smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_BURNED") {
            eattacker.var_d691409c = 1;
        }
        if (weapon == getweapon(#"stoker_melee") && isdefined(einflictor.cp_level_blackstation_goto_centerbreadcrumb) && einflictor.cp_level_blackstation_goto_centerbreadcrumb) {
            idamage = 150;
        }
        if (weapon == getweapon(#"stoker_coal_bomb")) {
            burnplayer::setplayerburning(1, 1, 1, eattacker, weapon);
        }
        return idamage;
    }
    return -1;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x8d397fba, Offset: 0x3cd0
// Size: 0x1a
function private function_8ef6771f(entity) {
    entity.var_dc89435f = 1;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x49a4206, Offset: 0x3cf8
// Size: 0x3e
function private function_e2e5eebf(entity) {
    entity.var_dc89435f = undefined;
    entity.var_1db5ef71 = gettime() + entity ai::function_9139c839().var_10d707f8;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 3, eflags: 0x1 linked
// Checksum 0xd81a73b4, Offset: 0x3d40
// Size: 0xa8
function function_72339619(spawner, s_spot, var_bc66d64b) {
    ai_stoker = zombie_utility::spawn_zombie(level.a_sp_stoker[0], "stoker", s_spot, var_bc66d64b);
    if (isdefined(ai_stoker)) {
        ai_stoker.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
        ai_stoker thread zombie_utility::round_spawn_failsafe();
        ai_stoker thread function_4c2cb763(s_spot);
    }
    return ai_stoker;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x1 linked
// Checksum 0xe0cb6675, Offset: 0x3df0
// Size: 0x54
function function_4c2cb763(s_spot) {
    if (isdefined(level.var_9fb8585a)) {
        self thread [[ level.var_9fb8585a ]](s_spot);
    }
    if (isdefined(level.var_1ab8872e)) {
        self thread [[ level.var_1ab8872e ]]();
    }
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0x58ab0a96, Offset: 0x3e50
// Size: 0x100
function function_2170ee7a() {
    level.a_sp_stoker = getentarray("zombie_stoker_spawner", "script_noteworthy");
    if (level.a_sp_stoker.size == 0) {
        /#
            assertmsg("<unknown string>");
        #/
        return;
    }
    foreach (sp_stoker in level.a_sp_stoker) {
        sp_stoker.is_enabled = 1;
        sp_stoker.script_forcespawn = 1;
        sp_stoker spawner::add_spawn_function(&stoker_init);
    }
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0x2589a274, Offset: 0x3f58
// Size: 0x5c
function stoker_init() {
    self function_2df052bb();
    self zm_score::function_82732ced();
    self.var_ab8f2b90 = 3;
    level thread zm_spawner::zombie_death_event(self);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 12, eflags: 0x5 linked
// Checksum 0x3e1634af, Offset: 0x3fc0
// Size: 0xae
function private function_fa8be26d(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (isdefined(attacker) && attacker.archetype === #"stoker" && self.team === attacker.team) {
        return 0;
    }
    return -1;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0x82c529f8, Offset: 0x4078
// Size: 0xc4
function private killed_callback(e_attacker) {
    if (self.archetype != #"stoker") {
        return;
    }
    self val::set(#"stoker_death", "takedamage", 0);
    if (!isplayer(e_attacker)) {
        return;
    }
    e_attacker util::delay(1.5, "death", &zm_audio::create_and_play_dialog, #"kill", #"stoker");
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 3, eflags: 0x1 linked
// Checksum 0xad2a8393, Offset: 0x4148
// Size: 0x230
function spawn_single(b_force_spawn = 0, var_eb3a8721, var_bc66d64b) {
    if (!b_force_spawn && !function_30509b8c()) {
        return undefined;
    }
    if (isdefined(var_eb3a8721)) {
        s_spawn_loc = var_eb3a8721;
    } else if (isdefined(level.var_370b1a3d)) {
        s_spawn_loc = [[ level.var_370b1a3d ]]();
    } else if (level.zm_loc_types[#"stoker_location"].size > 0) {
        s_spawn_loc = array::random(level.zm_loc_types[#"stoker_location"]);
    }
    if (!isdefined(s_spawn_loc)) {
        /#
            if (getdvarint(#"hash_1f8efa579fee787c", 0)) {
                iprintlnbold("<unknown string>");
            }
        #/
        return undefined;
    }
    ai = function_72339619(level.a_sp_stoker[0], undefined, var_bc66d64b);
    if (isdefined(ai)) {
        ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
        if (isdefined(level.var_9e197b6)) {
            ai thread [[ level.var_9e197b6 ]](s_spawn_loc);
        }
        ai playsound(#"hash_63299a75a97f9678");
        function_6eac4ca1(ai, "spawn");
        self util::delay(3, "death", &zm_audio::function_bca32e49, "stoker", "cue_react");
    }
    return ai;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0x9368f2d0, Offset: 0x4380
// Size: 0xbc
function function_30509b8c() {
    var_cd35bb62 = function_9d74a83a();
    var_74f3a5af = function_6dd277e7();
    if (!(isdefined(level.var_76934955) && level.var_76934955) && (isdefined(level.var_fe2bb2ac) && level.var_fe2bb2ac || var_cd35bb62 >= var_74f3a5af || !level flag::get("spawn_zombies"))) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0xafda8d89, Offset: 0x4448
// Size: 0xaa
function function_6dd277e7() {
    n_player_count = zm_utility::function_a2541519(level.players.size);
    switch (n_player_count) {
    case 1:
        return 1;
        break;
    case 2:
        return 2;
        break;
    case 3:
        return 2;
        break;
    case 4:
        return 3;
        break;
    }
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x1 linked
// Checksum 0x637f7431, Offset: 0x4500
// Size: 0x1b2
function function_cf5ef033(n_round_number) {
    level endon(#"end_game");
    if (!isdefined(level.var_ac8e1955)) {
        level.var_ac8e1955 = 0;
    }
    /#
        switch (level.round_number - n_round_number) {
        case 0:
            break;
        case 1:
        case 2:
            level.var_ac8e1955++;
            break;
        case 3:
        case 4:
            level.var_ac8e1955 = level.var_ac8e1955 + 2;
            break;
        default:
            level.var_ac8e1955 = undefined;
            return;
        }
    #/
    while (1) {
        level waittill(#"hash_5d3012139f083ccb");
        if (zm_round_spawning::function_d0db51fc(#"stoker")) {
            level.var_ac8e1955++;
            if (level.var_ac8e1955 == 3) {
                level.var_ac8e1955 = undefined;
                level.var_a21ee6fc = undefined;
                return;
            }
            level.var_a21ee6fc = level.round_number + function_21a3a673(1, 2);
        }
    }
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x1 linked
// Checksum 0x54cb6fd7, Offset: 0x46c0
// Size: 0x1da
function function_b381320(var_dbce0c44) {
    var_8cf00d40 = int(floor(var_dbce0c44 / 100));
    if (isdefined(level.var_a21ee6fc) && level.round_number < level.var_a21ee6fc) {
        return 0;
    }
    if (level.players.size == 1) {
        var_1797c23a = 1 + max(0, floor((level.round_number - zombie_utility::function_d2dfacfd(#"hash_2374f3ef775ac2c3")) / 4));
    } else {
        var_1797c23a = 1 + max(0, floor((level.round_number - zombie_utility::function_d2dfacfd(#"hash_3b4ad7449c039d1b")) / 3));
    }
    var_2506688 = var_1797c23a < 8 ? var_1797c23a * 0.75 : max(var_1797c23a - 3, 0);
    return function_21a3a673(int(var_2506688), int(min(var_8cf00d40, var_1797c23a)));
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0x802054c6, Offset: 0x48a8
// Size: 0x3c
function round_spawn() {
    ai = spawn_single();
    if (isdefined(ai)) {
        level.zombie_total--;
        return 1;
    }
    return 0;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0x33bde18a, Offset: 0x48f0
// Size: 0xbc
function function_9d74a83a() {
    var_35576160 = getaiarchetypearray(#"stoker");
    var_cd35bb62 = var_35576160.size;
    foreach (ai_stoker in var_35576160) {
        if (!isalive(ai_stoker)) {
            var_cd35bb62--;
        }
    }
    return var_cd35bb62;
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x5 linked
// Checksum 0x6f2bea24, Offset: 0x49b8
// Size: 0x2a
function private function_f5f699aa() {
    var_16049422 = spawn_single(1);
    return isdefined(var_16049422);
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x4
// Checksum 0xc29791b7, Offset: 0x49f0
// Size: 0x74
function private function_a92dac75() {
    /#
        level flagsys::wait_till("<unknown string>");
        zm_devgui::add_custom_devgui_callback(&function_963e8ce);
        spawner::add_archetype_spawn_function(#"stoker", &function_16c9b795);
    #/
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x4
// Checksum 0xee9f3a5a, Offset: 0x4a70
// Size: 0xb2
function private function_16c9b795() {
    /#
        if (isdefined(level.var_910d20f6) && level.var_910d20f6) {
            return;
        }
        adddebugcommand("<unknown string>" + getdvarint(#"hash_3dfb66f92268c90f", self ai::function_9139c839().var_d33d95d0) + "<unknown string>");
        adddebugcommand("<unknown string>");
        level.var_910d20f6 = 1;
    #/
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x4
// Checksum 0x33910449, Offset: 0x4b30
// Size: 0x278
function private function_963e8ce(cmd) {
    /#
        if (cmd == "<unknown string>") {
            player = level.players[0];
            v_direction = player getplayerangles();
            v_direction = anglestoforward(v_direction) * 8000;
            eye = player geteye();
            trace = bullettrace(eye, eye + v_direction, 0, undefined);
            var_380c580a = positionquery_source_navigation(trace[#"position"], 128, 256, 128, 20);
            s_spot = spawnstruct();
            if (isdefined(var_380c580a) && var_380c580a.data.size > 0) {
                s_spot.origin = var_380c580a.data[0].origin;
            } else {
                s_spot.origin = player.origin;
            }
            s_spot.angles = (0, player.angles[1] - 180, 0);
            spawn_single(1, s_spot);
            return 1;
        }
        if (cmd == "<unknown string>") {
            stokers = getaiarchetypearray(#"stoker");
            foreach (stoker in stokers) {
                stoker kill();
            }
        }
    #/
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 0, eflags: 0x0
// Checksum 0x421e1175, Offset: 0x4db0
// Size: 0x48
function update_dvars() {
    /#
        while (1) {
            level.stokerdebug = getdvarint(#"scr_stokerdebug", 0);
            wait(1);
        }
    #/
}

// Namespace zm_ai_stoker/zm_ai_stoker
// Params 1, eflags: 0x0
// Checksum 0xbc25f847, Offset: 0x4e00
// Size: 0x44
function function_752a64b8(message) {
    /#
        if (isdefined(level.stokerdebug)) {
            println("<unknown string>" + message);
        }
    #/
}

