// Atian COD Tools GSC decompiler test
#using scripts\zm\powerup\zm_powerup_nuke.gsc;
#using scripts\zm\ai\zm_ai_werewolf_interface.gsc;
#using scripts\zm_common\trials\zm_trial_special_enemy.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_ai_werewolf;

// Namespace zm_ai_werewolf
// Method(s) 2 Total 2
class class_9f07f58e {

    // Namespace class_9f07f58e/zm_ai_werewolf
    // Params 0, eflags: 0x9 linked
    // Checksum 0xfe0ee21b, Offset: 0x42d8
    // Size: 0x1a
    __constructor() {
        self.adjustmentstarted = 0;
        self.var_425c4c8b = 1;
    }

    // Namespace class_9f07f58e/zm_ai_werewolf
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x4300
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x2
// Checksum 0x786cbf8c, Offset: 0x510
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_werewolf", &__init__, &__main__, undefined);
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x1 linked
// Checksum 0xc516d34, Offset: 0x560
// Size: 0x1fc
function __init__() {
    registerbehaviorscriptfunctions();
    zm_ai_werewolf_interface::registerwerewolfinterfaceattributes();
    init();
    spawner::add_archetype_spawn_function(#"werewolf", &function_c759ad64);
    spawner::add_archetype_spawn_function(#"werewolf", &function_3d5e8286);
    spawner::function_89a2cd87(#"werewolf", &function_eaceec8b);
    zm_cleanup::function_cdf5a512(#"werewolf", &function_ccbee20);
    clientfield::register("actor", "wrwlf_silver_death_fx", 8000, 1, "int");
    clientfield::register("actor", "wrwlf_weakpoint_fx", 8000, 2, "counter");
    clientfield::register("actor", "wrwlf_silver_hit_fx", 8000, 1, "counter");
    clientfield::register("actor", "wrwlf_leap_attack_rumble", 8000, 1, "counter");
    /#
        level thread function_e79ce40a();
        spawner::add_archetype_spawn_function(#"werewolf", &zombie_utility::updateanimationrate);
    #/
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x768
// Size: 0x4
function __main__() {
    
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x1 linked
// Checksum 0x1a0eb510, Offset: 0x778
// Size: 0xe4
function init() {
    level thread aat::register_immunity("zm_aat_brain_decay", #"werewolf", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_frostbite", #"werewolf", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_kill_o_watt", #"werewolf", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_plasmatic_burst", #"werewolf", 1, 1, 1);
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x5 linked
// Checksum 0x560a21c2, Offset: 0x868
// Size: 0x4a
function private function_c759ad64() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_2e8f8923;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x122b1b71, Offset: 0x8c0
// Size: 0x2c
function private function_2e8f8923(entity) {
    entity.__blackboard = undefined;
    entity function_c759ad64();
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x5 linked
// Checksum 0x33b0173f, Offset: 0x8f8
// Size: 0xc7c
function private registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&werewolfstunstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfstunstart", &werewolfstunstart);
    /#
        assert(isscriptfunctionptr(&function_6bfc7a5f));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_50eb50a32d0c4791", &function_6bfc7a5f);
    /#
        assert(isscriptfunctionptr(&werewolfshouldstun));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfshouldstun", &werewolfshouldstun);
    /#
        assert(isscriptfunctionptr(&werewolfidlestart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfidlestart", &werewolfidlestart);
    /#
        assert(isscriptfunctionptr(&function_4014790a));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5bd93c0cfe1ada6", &function_4014790a);
    /#
        assert(isscriptfunctionptr(&function_1917d76d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7d2da6c50e1bc111", &function_1917d76d);
    /#
        assert(isscriptfunctionptr(&function_f8912291));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_603662b9e4017e3f", &function_f8912291);
    /#
        assert(isscriptfunctionptr(&function_f5d7dc0a));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6268b60dd4b1a7d4", &function_f5d7dc0a);
    /#
        assert(isscriptfunctionptr(&function_fcc1c537));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6ce96736fe43832a", &function_fcc1c537);
    /#
        assert(isscriptfunctionptr(&function_f2e3495a));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6f2cd3c4d5ecbf8d", &function_f2e3495a);
    /#
        assert(isscriptfunctionptr(&function_ee311142));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1516ae5422f14ad8", &function_ee311142);
    /#
        assert(isscriptfunctionptr(&function_6488bc7e));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_28bbc81deeedc395", &function_6488bc7e);
    /#
        assert(isscriptfunctionptr(&function_ba605111));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_37194f1a33dd9fa9", &function_ba605111);
    /#
        assert(isscriptfunctionptr(&werewolfshouldreset));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfshouldreset", &werewolfshouldreset);
    /#
        assert(isscriptfunctionptr(&werewolfshouldshowpain));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfshouldshowpain", &werewolfshouldshowpain);
    /#
        assert(isscriptfunctionptr(&function_1ab1a5b3));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2485d20310e0248c", &function_1ab1a5b3);
    /#
        assert(isscriptfunctionptr(&werewolfshouldmelee));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfshouldmelee", &werewolfshouldmelee);
    /#
        assert(isscriptfunctionptr(&function_9e901f61));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3ac66a354287014b", &function_9e901f61);
    /#
        assert(isscriptfunctionptr(&function_da984f51));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_645ddbbfa8bea6f9", &function_da984f51);
    /#
        assert(isscriptfunctionptr(&function_7e2f67cf));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5e3e49240f58c3fb", &function_7e2f67cf);
    /#
        assert(isscriptfunctionptr(&function_390c9423));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_45de1aecce571c1", &function_390c9423);
    /#
        assert(isscriptfunctionptr(&function_7a66357b));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3bca879f16f06962", &function_7a66357b);
    /#
        assert(isscriptfunctionptr(&werewolftargetservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolftargetservice", &werewolftargetservice);
    /#
        assert(isscriptfunctionptr(&function_a5c42011));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_599e12fb160520d7", &function_a5c42011);
    /#
        assert(isscriptfunctionptr(&function_e523fa0d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d036f310bd792ad", &function_e523fa0d);
    animationstatenetwork::registernotetrackhandlerfunction("summon_wolves", &summonwolves);
    animationstatenetwork::registernotetrackhandlerfunction("werewolf_leap_melee", &werewolfleapattack);
    animationstatenetwork::registernotetrackhandlerfunction("werewolf_disable_pain", &werewolfdisablepain);
    animationstatenetwork::registernotetrackhandlerfunction("wrwlf_silver_death_fx", &function_b74b9f01);
    animationstatenetwork::registernotetrackhandlerfunction("werewolf_leap_rumble", &function_e980911c);
    animationstatenetwork::registernotetrackhandlerfunction("start_breakout", &function_dc05cd83);
    animationstatenetwork::registernotetrackhandlerfunction("end_breakout", &function_2d5048be);
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&function_8ddb1128) || isscriptfunctionptr(&function_8ddb1128));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_4f16c6f87860a582", undefined, &function_8ddb1128, undefined);
    animationstatenetwork::registeranimationmocomp("mocomp_werewolf_leap_attack", &function_7ad7aa7d, &function_8b63ee0e, &function_76968111);
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x1 linked
// Checksum 0x694ba5e4, Offset: 0x1580
// Size: 0x48
function werewolfshouldstun(entity) {
    if (zm_behavior::zombieshouldstun(entity) && function_833670b7(entity)) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x958d8846, Offset: 0x15d0
// Size: 0xbc
function private function_833670b7(entity) {
    var_7a69f7e9 = blackboard::getblackboardevents("wrwlf_stun");
    if (isdefined(var_7a69f7e9) && var_7a69f7e9.size) {
        foreach (event in var_7a69f7e9) {
            if (event.werewolf === entity) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x1 linked
// Checksum 0x8defdfdc, Offset: 0x1698
// Size: 0x92
function werewolfstunstart(entity) {
    zm_behavior::zombiestunstart(entity);
    var_268f1415 = spawnstruct();
    var_268f1415.werewolf = entity;
    blackboard::addblackboardevent("wrwlf_stun", var_268f1415, randomintrange(10000, 12000));
    entity.var_cc2d7568 = 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 2, eflags: 0x5 linked
// Checksum 0x98102466, Offset: 0x1738
// Size: 0x38
function private function_8ddb1128(entity, asmstatename) {
    if (entity ai::is_stunned()) {
        return 5;
    }
    return 4;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x1 linked
// Checksum 0x80702999, Offset: 0x1778
// Size: 0x32
function function_6bfc7a5f(entity) {
    zm_behavior::function_c377438f(entity);
    entity.var_cc2d7568 = 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x1 linked
// Checksum 0x564f4a3b, Offset: 0x17b8
// Size: 0x74
function werewolfidlestart(entity) {
    if (isdefined(entity.var_cc2d7568) && entity.var_cc2d7568) {
        entity.var_cc2d7568 = 0;
        if (entity getpathmode() == "dont move") {
            entity pathmode("move allowed");
        }
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xe1870fbf, Offset: 0x1838
// Size: 0x1a
function private function_dc05cd83(entity) {
    self.var_2037a949 = 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x7135b008, Offset: 0x1860
// Size: 0x16
function private function_2d5048be(entity) {
    self.var_2037a949 = 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x5 linked
// Checksum 0x99605b3d, Offset: 0x1880
// Size: 0x27c
function private function_3d5e8286() {
    aiutility::addaioverridedamagecallback(self, &function_ebf85268);
    self.fovcosine = 0;
    self.fovcosinebusy = 0;
    self.fovcosinez = 0;
    self.closest_player_override = &zm_utility::function_c52e1749;
    self.var_1a60ad62 = 0;
    self.var_b7ba7211 = 0;
    self.var_9d9575a4 = 0;
    self.ignore_nuke = 1;
    self.lightning_chain_immune = 1;
    self.var_dd6fe31f = 1;
    self.var_126d7bef = 1;
    self.var_ccb2e201 = 0;
    self.instakill_func = &zm_powerups::function_16c2586a;
    self.var_f46fbf3f = 1;
    self.ignorepathenemyfightdist = 1;
    self.var_ceed8829 = 1;
    self.var_7d39ec6a = 1;
    self callback::function_d8abfc3d(#"on_ai_killed", &on_werewolf_killed);
    self zm_powerup_nuke::function_9a79647b(0.5);
    self setavoidancemask("avoid none");
    self collidewithactors(1);
    self function_11578581(70);
    self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
    self setblackboardattribute("_werewolf_stance", "upright");
    self thread function_8fa45bb0();
    self.var_b467f3a1 = &function_96640dc5;
    self.ai.var_9465ce93 = gettime() + randomintrange(4500, 5500);
    /#
        self thread function_1aba0132();
    #/
    target_set(self);
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x1 linked
// Checksum 0xd5a38473, Offset: 0x1b08
// Size: 0x12c
function on_werewolf_killed(params) {
    if (self.archetype != #"werewolf") {
        return;
    }
    e_attacker = params.eattacker;
    if (!isplayer(e_attacker)) {
        return;
    }
    if (zm_trial_special_enemy::is_active() && level.active_powerups.size > 0) {
        return;
    }
    if (level flag::get("zombie_drop_powerups") && !zm_utility::is_standard() && randomint(100) <= 40) {
        self.no_powerups = 1;
        self thread zm_powerups::specific_powerup_drop(self.var_d0686fde, self.origin, undefined, undefined, undefined, undefined, undefined, undefined, 0, 1);
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x4
// Checksum 0xa0a64009, Offset: 0x1c40
// Size: 0x1ae
function private function_1aba0132() {
    self endon(#"death");
    while (1) {
        if (isdefined(self.enemy)) {
            enemypos = function_6cde7a8b(self);
            distance = distance(self.origin, enemypos);
            eyeorigin = self gettagorigin("tag_eye");
            eyeangles = self gettagangles("tag_eye");
            var_a4d90ed8 = anglestoforward(eyeangles);
            /#
                if (self cansee(self.enemy)) {
                    recordline(eyeorigin, eyeorigin + var_a4d90ed8 * 100, (0, 1, 0), "<unknown string>");
                } else {
                    recordline(eyeorigin, eyeorigin + var_a4d90ed8 * 100, (1, 0, 0), "<unknown string>");
                }
                record3dtext("<unknown string>" + distance, self.origin, (0, 0, 1), "<unknown string>");
            #/
        }
        waitframe(1);
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x5 linked
// Checksum 0x90dd6a1e, Offset: 0x1df8
// Size: 0xec
function private function_eaceec8b() {
    self.maxhealth = self zm_ai_utility::function_8d44707e(1, self._starting_round_number);
    self.health = self.maxhealth;
    self.var_c59e2dbf = 0;
    /#
        if (zm_score::function_e5ca5733(self.archetype) == 0) {
            zm_score::function_e5d6e6dd(self.archetype, 100);
        }
    #/
    self zm_score::function_82732ced();
    self.deathfunction = &zm_spawner::zombie_death_animscript;
    level thread zm_spawner::zombie_death_event(self);
    namespace_81245006::initweakpoints(self, #"c_t8_zmb_werewolf_weakpoint_def");
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x1 linked
// Checksum 0x8e8d4244, Offset: 0x1ef0
// Size: 0x3e0
function function_ccbee20() {
    self endon(#"death");
    a_s_spawn_locs = struct::get_array("werewolf_location", "script_noteworthy");
    if (isarray(a_s_spawn_locs)) {
        i = 0;
        while (i < a_s_spawn_locs.size) {
            if (!zm_zonemgr::zone_is_enabled(a_s_spawn_locs[i].zone_name)) {
                arrayremoveindex(a_s_spawn_locs, i);
            } else if (isdefined(a_s_spawn_locs[i].var_39512f0e) && level flag::get(a_s_spawn_locs[i].var_39512f0e)) {
                if (a_s_spawn_locs[i].var_39512f0e === "power_on3" && zm_custom::function_901b751c("zmPowerState") == 2 && zm_custom::function_901b751c(#"zmpowerdoorstate") == 0) {
                    i++;
                } else {
                    arrayremoveindex(a_s_spawn_locs, i);
                }
            } else {
                i++;
            }
        }
        if (a_s_spawn_locs.size < 1) {
            self.b_ignore_cleanup = 1;
            return 1;
        }
    } else {
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
    var_b2aa54a9 = a_s_spawn_locs[0];
    var_56feeec4 = distancesquared(var_31f7011a[0].origin, var_b2aa54a9.origin);
    foreach (var_d7eff26a in a_s_spawn_locs) {
        if (!zm_utility::is_player_valid(var_31f7011a[i])) {
            i++;
            if (i >= var_31f7011a.size) {
                i = 0;
                util::wait_network_frame();
            }
        } else {
            var_e8ab126e = distancesquared(var_31f7011a[i].origin, var_d7eff26a.origin);
            if (var_e8ab126e < var_56feeec4) {
                var_56feeec4 = var_e8ab126e;
                var_b2aa54a9 = var_d7eff26a;
            }
        }
    }
    self zm_ai_utility::function_a8dc3363(var_b2aa54a9);
    return 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 12, eflags: 0x5 linked
// Checksum 0x9252c527, Offset: 0x22d8
// Size: 0x4e0
function private function_ebf85268(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (isdefined(attacker) && self === attacker) {
        damage = 0;
    }
    var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, boneindex, hitloc, point);
    final_damage = int(damage * var_786d7e06.damage_scale);
    var_934e9dce = isdefined(var_786d7e06.var_84ed9a13) && isdefined(var_786d7e06.registerzombie_bgb_used_reinforce) && var_786d7e06.registerzombie_bgb_used_reinforce && isdefined(attacker) && isplayer(attacker);
    if (var_934e9dce) {
        self.var_265cb589 = 1;
        self.var_4bb78ac7 = gettime() + 1000;
        attacker playhitmarker(undefined, 5, undefined, 1, 0);
        if (var_786d7e06.var_84ed9a13.var_51e8b151 === "tag_chest_ws") {
            clientfield::increment("wrwlf_weakpoint_fx", 1);
        } else {
            clientfield::increment("wrwlf_weakpoint_fx", 2);
        }
    } else if (isdefined(self.var_4bb78ac7) && gettime() < self.var_4bb78ac7) {
        self.var_265cb589 = 1;
    } else {
        self.var_265cb589 = 0;
    }
    /#
        if (level.var_abe0b71d) {
            iprintlnbold("<unknown string>" + var_786d7e06.damage_scale + "<unknown string>" + final_damage + "<unknown string>" + self.health - final_damage);
        }
    #/
    if (isdefined(self.var_c59e2dbf)) {
        self.var_c59e2dbf = self.var_c59e2dbf + final_damage;
    } else {
        self.var_c59e2dbf = final_damage;
    }
    if (!(isdefined(self.var_48baa747) && self.var_48baa747) && !(isdefined(self.var_e9ed8a62) && self.var_e9ed8a62) && self.var_c59e2dbf > self.maxhealth * self ai::function_9139c839().var_96b9b674 / 100) {
        if (self.var_b7ba7211 < gettime() && hasasm(self) && self function_ebbebf56() >= 1) {
            self.var_1cfbbe3d = 1;
        }
        self.var_c59e2dbf = 0;
    }
    if (isdefined(attacker) && isplayer(attacker) && isdefined(weapon) && attacker zm_utility::function_aa45670f(weapon, 0)) {
        if (isdefined(var_934e9dce) && var_934e9dce && isdefined(self.var_48baa747) && self.var_48baa747 && isdefined(self.var_2037a949) && self.var_2037a949 && hasasm(self) && self function_ebbebf56() >= 1) {
            self.var_1cfbbe3d = 1;
            self.blockingpain = 0;
        }
        if (gettime() >= self.ai.var_9465ce93) {
            self.ai.var_9465ce93 = gettime() + randomintrange(4500, 5500);
            self.var_125e7ef = 1;
            self clientfield::increment("wrwlf_silver_hit_fx");
        }
    }
    return final_damage;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x1 linked
// Checksum 0xfd1e7145, Offset: 0x27c0
// Size: 0x80
function function_7e2f67cf(entity) {
    currentstance = entity getblackboardattribute("_werewolf_stance");
    if (currentstance == "upright" && isdefined(self.var_125e7ef) && self.var_125e7ef) {
        self.var_125e7ef = 0;
        return 1;
    }
    self.var_125e7ef = 0;
    return 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xbb4389b4, Offset: 0x2848
// Size: 0x50
function private function_390c9423(entity) {
    currentstance = entity getblackboardattribute("_werewolf_stance");
    if (currentstance == "upright") {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x95bdf332, Offset: 0x28a0
// Size: 0x34
function private function_7a66357b(entity) {
    if (isdefined(entity.var_1cfbbe3d) && entity.var_1cfbbe3d) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x1322fd3d, Offset: 0x28e0
// Size: 0x34
function private function_da984f51(entity) {
    if (isdefined(entity.var_e0f90289) && entity.var_e0f90289) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x1263b292, Offset: 0x2920
// Size: 0x34
function private werewolfshouldreset(entity) {
    if (isdefined(entity.var_1cfbbe3d) && entity.var_1cfbbe3d) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xfa84924b, Offset: 0x2960
// Size: 0x80
function private werewolfshouldshowpain(entity) {
    if (function_7a66357b(entity)) {
        return 1;
    }
    if (!werewolfshouldmelee(entity) && btapi_locomotionbehaviorcondition(entity) && function_390c9423(entity)) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x8c6689d2, Offset: 0x29e8
// Size: 0x7c
function private function_4014790a(entity) {
    entity.var_1cfbbe3d = undefined;
    entity.var_b7ba7211 = gettime() + int(entity ai::function_9139c839().var_bd87ef4d * 1000);
    entity.blockingpain = 1;
    function_43f02cf0(entity);
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xc8cea777, Offset: 0x2a70
// Size: 0x34
function private function_1917d76d(entity) {
    entity.blockingpain = 0;
    entity pathmode("move allowed");
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x6455c417, Offset: 0x2ab0
// Size: 0x1a
function private werewolfdisablepain(entity) {
    entity.var_e9ed8a62 = 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x1 linked
// Checksum 0xfc644a8b, Offset: 0x2ad8
// Size: 0x44
function function_b74b9f01(entity) {
    self clientfield::set("wrwlf_silver_death_fx", 1);
    self thread function_fc2777d9();
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x5 linked
// Checksum 0x9d0f61a0, Offset: 0x2b28
// Size: 0x24
function private function_fc2777d9() {
    wait(3);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 4, eflags: 0x1 linked
// Checksum 0xe06335d9, Offset: 0x2b58
// Size: 0x60
function function_2341cdf0(entity, attribute, oldvalue, value) {
    entity.b_ignore_cleanup = value;
    if (value == 0 && oldvalue != value) {
        entity notify(#"patrol_done");
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xe2de2d20, Offset: 0x2bc0
// Size: 0x12a
function private function_e523fa0d(entity) {
    enemies = getaiarchetypearray(#"zombie");
    enemies = arraycombine(enemies, getaiarchetypearray(#"catalyst"), 0, 0);
    enemies = array::filter(enemies, 0, &function_3d752709, entity);
    foreach (enemy in enemies) {
        enemy zombie_utility::setup_zombie_knockdown(entity);
        enemy.knockdown_type = "knockdown_shoved";
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 2, eflags: 0x5 linked
// Checksum 0x84c86ac7, Offset: 0x2cf8
// Size: 0x1a8
function private function_3d752709(enemy, target) {
    if (isdefined(enemy.knockdown) && enemy.knockdown) {
        return 0;
    }
    if (gibserverutils::isgibbed(enemy, 384)) {
        return 0;
    }
    if (distancesquared(enemy.origin, target.origin) > self ai::function_9139c839().var_179988df * self ai::function_9139c839().var_179988df) {
        return 0;
    }
    facingvec = anglestoforward(target.angles);
    enemyvec = enemy.origin - target.origin;
    var_3e3c8075 = (enemyvec[0], enemyvec[1], 0);
    var_c2ee8451 = (facingvec[0], facingvec[1], 0);
    var_3e3c8075 = vectornormalize(var_3e3c8075);
    var_c2ee8451 = vectornormalize(var_c2ee8451);
    var_34e02165 = vectordot(var_c2ee8451, var_3e3c8075);
    if (var_34e02165 < 0) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xa296389e, Offset: 0x2ea8
// Size: 0x384
function private werewolftargetservice(entity) {
    if (isdefined(entity.ignoreall) && entity.ignoreall) {
        return;
    }
    /#
        if (isdefined(entity.ispuppet) && entity.ispuppet || isdefined(entity.var_ff56e34c)) {
            return;
        }
    #/
    entity.favoriteenemy = entity.var_93a62fe;
    if (entity ai::has_behavior_attribute("patrol") && entity ai::get_behavior_attribute("patrol")) {
        self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
        if (!isdefined(entity.enemy)) {
            return;
        }
        if (entity.health == entity.maxhealth && !entity seerecently(entity.enemy, 0.25)) {
            return;
        }
        zm_ai_utility::stop_patrol(entity);
    }
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
    entity.zombie_poi = entity zm_utility::get_zombie_point_of_interest(entity.origin);
    if (isdefined(entity.zombie_poi) && isdefined(entity.zombie_poi[1])) {
        entity.var_ee6f38fb = gettime() + 1000;
        goalpos = entity.zombie_poi[0];
        return entity zm_utility::function_64259898(goalpos);
    }
    if (!isdefined(entity.enemy) || zm_behavior::zombieshouldmoveawaycondition(entity)) {
        zone = zm_utility::get_current_zone();
        if (isdefined(zone)) {
            wait_locations = level.zones[zone].a_loc_types[#"wait_location"];
            if (isdefined(wait_locations) && wait_locations.size > 0) {
                return zm_utility::function_64259898(wait_locations[0].origin);
            }
        }
        entity setgoal(entity.origin);
        return 0;
    } else if (isdefined(entity.var_93a62fe)) {
        targetpos = getclosestpointonnavmesh(entity.var_93a62fe.origin, 100, self getpathfindingradius());
        if (!isdefined(targetpos)) {
            targetpos = entity.origin;
        }
        entity setgoal(targetpos);
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x53a305b5, Offset: 0x3238
// Size: 0x158
function private function_4b392ea3(entity) {
    if (entity function_ebbebf56() != 1) {
        return 0;
    }
    if (isdefined(entity.ai.var_d6cd1d4e)) {
        if (gettime() < entity.ai.var_d6cd1d4e) {
            return 0;
        }
    }
    var_34529779 = blackboard::getblackboardevents("wrlf_stance_change");
    if (isdefined(var_34529779) && var_34529779.size) {
        foreach (var_462d3042 in var_34529779) {
            if (isdefined(var_462d3042.data.pos) && distancesquared(var_462d3042.data.pos, entity.origin) <= 800 * 800) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xab303c13, Offset: 0x3398
// Size: 0x2a4
function private function_a5c42011(entity) {
    currentstance = entity getblackboardattribute("_werewolf_stance");
    desiredstance = currentstance;
    pathgoalpos = entity.pathgoalpos;
    if (function_4b392ea3(entity)) {
        if (isdefined(pathgoalpos)) {
            distsq = distancesquared(entity.origin, pathgoalpos);
            if (currentstance == "upright" && distsq > entity ai::function_9139c839().var_ed83d6e9 * entity ai::function_9139c839().var_ed83d6e9) {
                desiredstance = "quad";
                self allowpitchangle(1);
                self setpitchorient();
            } else if (currentstance == "quad" && distsq < entity ai::function_9139c839().var_e5f93adc * entity ai::function_9139c839().var_e5f93adc) {
                desiredstance = "upright";
                self allowpitchangle(0);
                self clearpitchorient();
            }
        } else {
            desiredstance = "upright";
        }
        entity.ai.var_d6cd1d4e = gettime() + int(entity ai::function_9139c839().var_6d4b0dd6 * 1000);
        entity setblackboardattribute("_werewolf_stance", desiredstance);
        var_462d3042 = spawnstruct();
        var_462d3042.pos = entity.origin;
        blackboard::addblackboardevent("wrlf_stance_change", var_462d3042, randomintrange(1000, 5000));
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xe555916d, Offset: 0x3648
// Size: 0x1e4
function private function_6488bc7e(entity) {
    zombies = getaiteamarray(level.zombie_team);
    zombies = arraysortclosest(zombies, entity.origin, undefined, 0, entity getpathfindingradius() + 20);
    var_31a419e0 = [];
    foreach (zombie in zombies) {
        if (zombie.var_6f84b820 === #"basic" || zombie.var_6f84b820 === #"popcorn") {
            if (!isdefined(var_31a419e0)) {
                var_31a419e0 = [];
            } else if (!isarray(var_31a419e0)) {
                var_31a419e0 = array(var_31a419e0);
            }
            var_31a419e0[var_31a419e0.size] = zombie;
        }
    }
    foreach (zombie in var_31a419e0) {
        zombie zombie_utility::setup_zombie_knockdown(entity);
    }
    return 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x50bcb693, Offset: 0x3838
// Size: 0x10
function private function_ee311142(entity) {
    return 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xfd3adf3, Offset: 0x3850
// Size: 0x10
function private function_ba605111(entity) {
    return 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xca845b94, Offset: 0x3868
// Size: 0x78
function private function_f5d7dc0a(entity) {
    var_3bfe8ebe = spawnstruct();
    var_3bfe8ebe.enemy = entity.enemy;
    blackboard::addblackboardevent("vlf_melee_event", var_3bfe8ebe, randomintrange(6000, 8500));
    return 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xff8b2966, Offset: 0x38e8
// Size: 0x114
function private function_e84f3864(entity) {
    /#
        if (getdvarint(#"hash_786b741fd20cb7c1", 0)) {
            return 1;
        }
    #/
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    var_33f55f67 = blackboard::getblackboardevents("vlf_melee_event");
    if (isdefined(var_33f55f67) && var_33f55f67.size) {
        foreach (var_3bfe8ebe in var_33f55f67) {
            if (var_3bfe8ebe.data.enemy === entity.enemy) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x1e235823, Offset: 0x3a08
// Size: 0x60
function private werewolfshouldmelee(entity) {
    if (!function_2801a911(entity)) {
        return 0;
    }
    if (btapi_shouldnormalmelee(entity) || function_9e901f61(entity)) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xbc69b356, Offset: 0x3a70
// Size: 0xba
function private function_2801a911(entity) {
    if (entity.ignoreall) {
        return 0;
    }
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    if (isdefined(entity.zombie_poi) || isdefined(entity.var_ee6f38fb) && entity.var_ee6f38fb > gettime()) {
        return 0;
    }
    if (abs(entity.enemy.origin[2] - entity.origin[2]) > 64) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 2, eflags: 0x5 linked
// Checksum 0x86ad1e5c, Offset: 0x3b38
// Size: 0x9c
function private function_6cde7a8b(entity, predictedenemypos) {
    enemypos = entity.enemy.origin;
    if (isdefined(predictedenemypos)) {
        enemypos = predictedenemypos;
    }
    dirtoenemy = vectornormalize(enemypos - entity.origin);
    dirtoenemy = vectornormalize(dirtoenemy);
    return enemypos + dirtoenemy * -1 * 45;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 2, eflags: 0x5 linked
// Checksum 0x200fa437, Offset: 0x3be0
// Size: 0x10e
function private function_93211521(entity, var_856465ed) {
    vectoenemy = var_856465ed - entity.origin;
    var_c43ad98d = entity.origin + vectorscale(vectoenemy, 0.5);
    results = physicstraceex(var_c43ad98d, var_c43ad98d + vectorscale((0, 0, 1), 120), (-15, -15, -5), (15, 15, 5), self);
    if (results[#"fraction"] == 1) {
        /#
            recordcircle(var_c43ad98d, 4, (0, 1, 0));
        #/
        return 1;
    }
    /#
        recordcircle(var_c43ad98d, 4, (1, 0, 0));
    #/
    return 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x29ff591, Offset: 0x3cf8
// Size: 0x352
function private function_9e901f61(entity) {
    if (entity function_ebbebf56() != 1) {
        return 0;
    }
    if (entity.ignoreall) {
        return 0;
    }
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    if (!function_e84f3864(entity)) {
        return 0;
    }
    if (isdefined(entity.zombie_poi) || isdefined(entity.var_ee6f38fb) && entity.var_ee6f38fb > gettime()) {
        return 0;
    }
    if (isdefined(entity.enemy)) {
        var_856465ed = function_6cde7a8b(entity);
        distancesq = distancesquared(entity.origin, var_856465ed);
        if (!ispointonnavmesh(entity.enemy.origin, entity.enemy)) {
            return 0;
        }
        if (!ispointonnavmesh(entity.enemy.origin, entity)) {
            return 0;
        }
        if (!ispointonnavmesh(var_856465ed, 60)) {
            return 0;
        }
        if (!ispointonnavmesh(var_856465ed, entity.enemy)) {
            return 0;
        }
        if (abs(entity.origin[2] - entity.enemy.origin[2]) > 64) {
            return 0;
        }
        if (abs(entity.origin[2] - var_856465ed[2]) > 64) {
            return 0;
        }
        if (distancesq < entity ai::function_9139c839().var_2a25aee8 * entity ai::function_9139c839().var_2a25aee8) {
            return 0;
        }
        if (distancesq > entity ai::function_9139c839().chargemeleedist * entity ai::function_9139c839().chargemeleedist) {
            return 0;
        }
        if (!tracepassedonnavmesh(entity.origin, var_856465ed, entity getpathfindingradius())) {
            return 0;
        }
        if (!util::within_fov(self.origin, self.angles, var_856465ed, cos(40))) {
            return 0;
        }
        if (!function_93211521(entity, var_856465ed)) {
            return 0;
        }
        return 1;
    }
    return 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x6361ba3f, Offset: 0x4058
// Size: 0x21c
function private werewolfleapattack(entity) {
    if (entity.ignoreall) {
        return;
    }
    if (!isdefined(entity.enemy)) {
        return;
    }
    if (entity.enemy.ignoreme) {
        return;
    }
    radiusdamage(entity.origin, 200, 15, 5, entity, "MOD_MELEE");
    zombies = getaiarchetypearray(#"zombie", level.zombie_team);
    zombies = arraysortclosest(zombies, self.origin + anglestoforward(self.angles) * 65 * 0.5, undefined, undefined, self getpathfindingradius() + 65);
    /#
        recordcircle(self.origin + anglestoforward(self.angles) * 65 * 0.5, self getpathfindingradius() + 65, (0, 0, 1));
    #/
    foreach (zombie in zombies) {
        zombie zombie_utility::setup_zombie_knockdown(self);
        zombie.knockdown_type = "knockdown_stun";
    }
    entity melee(anglestoforward(entity.angles));
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x60c561c5, Offset: 0x4280
// Size: 0x2c
function private function_e980911c(entity) {
    entity clientfield::increment("wrwlf_leap_attack_rumble");
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xa23b9c6, Offset: 0x42b8
// Size: 0x16
function private function_f2e3495a(entity) {
    entity.var_e9ed8a62 = undefined;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 5, eflags: 0x5 linked
// Checksum 0x6a42e683, Offset: 0x43a0
// Size: 0x314
function private function_7ad7aa7d(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity animmode("gravity", 1);
    entity orientmode("face angle", entity.angles[1]);
    entity.blockingpain = 1;
    entity.usegoalanimweight = 1;
    entity pathmode("dont move");
    entity collidewithactors(0);
    entity.var_b736fc8b = 1;
    if (isdefined(entity.enemy)) {
        dirtoenemy = vectornormalize(entity.enemy.origin - entity.origin);
        entity forceteleport(entity.origin, vectortoangles(dirtoenemy));
    }
    if (!isdefined(self.var_cd8354e0)) {
        self.var_cd8354e0 = new class_9f07f58e();
        self.var_cd8354e0.var_9bfa8497 = entity.origin;
        self.var_cd8354e0.var_98bc84b7 = getnotetracktimes(mocompanim, "start_procedural")[0];
        self.var_cd8354e0.var_6392c3a2 = getnotetracktimes(mocompanim, "stop_procedural")[0];
        var_e397f54c = getmovedelta(mocompanim, 0, 1, entity);
        self.var_cd8354e0.var_cb28f380 = entity localtoworldcoords(var_e397f54c);
        /#
            movedelta = getmovedelta(mocompanim, 0, 1, entity);
            animendpos = entity localtoworldcoords(movedelta);
            distance = distance(entity.origin, animendpos);
            recordcircle(animendpos, 3, (0, 1, 0), "<unknown string>");
            record3dtext("<unknown string>" + distance, animendpos, (0, 1, 0), "<unknown string>");
        #/
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 5, eflags: 0x1 linked
// Checksum 0x5dd9b793, Offset: 0x46c0
// Size: 0xc8c
function function_8b63ee0e(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    /#
        assert(isdefined(entity.var_cd8354e0));
    #/
    var_e72a224a = entity getanimtime(mocompanim);
    zombies = getaiarchetypearray(#"zombie", level.zombie_team);
    zombies = arraysortclosest(zombies, entity.origin, undefined, 0, entity getpathfindingradius() + 15);
    var_7bfb4133 = 0;
    foreach (zombie in zombies) {
        if (isdefined(zombie.knockdown) && zombie.knockdown) {
            continue;
        }
        zombie zombie_utility::setup_zombie_knockdown(entity);
        var_7bfb4133++;
        if (var_7bfb4133 >= 5) {
            break;
        }
    }
    if (isdefined(entity.enemy) && !entity.var_cd8354e0.adjustmentstarted && entity.var_cd8354e0.var_425c4c8b && var_e72a224a >= entity.var_cd8354e0.var_98bc84b7) {
        predictedenemypos = entity.enemy.origin;
        var_856465ed = function_6cde7a8b(entity, predictedenemypos);
        entity.var_cd8354e0.adjustedendpos = var_856465ed;
        var_cc075bd0 = vectornormalize(entity.origin - entity.var_cd8354e0.adjustedendpos);
        var_cf699df5 = distancesquared(entity.var_cd8354e0.var_9bfa8497, entity.var_cd8354e0.var_cb28f380);
        var_776ddabf = distancesquared(entity.var_cd8354e0.var_cb28f380, entity.var_cd8354e0.adjustedendpos);
        var_65cbfb52 = distancesquared(entity.var_cd8354e0.var_9bfa8497, entity.var_cd8354e0.adjustedendpos);
        var_201660e6 = tracepassedonnavmesh(entity.var_cd8354e0.var_9bfa8497, entity.var_cd8354e0.adjustedendpos, entity getpathfindingradius());
        traceresult = bullettrace(entity.origin, entity.var_cd8354e0.adjustedendpos + vectorscale((0, 0, 1), 30), 0, entity);
        isvisible = traceresult[#"fraction"] == 1;
        var_535d098c = 0;
        if (isdefined(traceresult[#"hitloc"]) && traceresult[#"hitloc"] == "riotshield") {
            entity.var_cd8354e0.adjustedendpos = entity.var_cd8354e0.adjustedendpos + vectorscale(var_cc075bd0, 50);
            var_535d098c = 1;
        }
        if (!var_201660e6) {
            /#
                record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
            #/
            entity.var_cd8354e0.var_425c4c8b = 0;
        } else if (var_cf699df5 > var_65cbfb52 && var_776ddabf >= entity ai::function_9139c839().var_d781a7cc * entity ai::function_9139c839().var_d781a7cc) {
            /#
                record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
            #/
            entity.var_cd8354e0.var_425c4c8b = 0;
        } else if (var_776ddabf >= entity ai::function_9139c839().var_e49498dc * entity ai::function_9139c839().var_e49498dc) {
            /#
                record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
            #/
            entity.var_cd8354e0.var_425c4c8b = 0;
        }
        if (var_535d098c) {
            /#
                record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
            #/
            entity.var_cd8354e0.var_425c4c8b = 1;
        }
        if (entity.var_cd8354e0.var_425c4c8b) {
            var_776ddabf = distancesquared(entity.var_cd8354e0.var_cb28f380, entity.var_cd8354e0.adjustedendpos);
            var_beabc994 = anglestoforward(entity.angles);
            var_1c3641f2 = (var_856465ed[0], var_856465ed[1], entity.origin[2]);
            dirtoenemy = vectornormalize(var_1c3641f2 - entity.origin);
            zdiff = entity.var_cd8354e0.var_cb28f380[2] - var_856465ed[2];
            var_6738a702 = abs(zdiff) <= entity ai::function_9139c839().var_3c41cb92;
            withinfov = vectordot(var_beabc994, dirtoenemy) > entity ai::function_9139c839().var_e2b09972;
            var_7948b2f3 = var_6738a702 && withinfov;
            var_425c4c8b = (isvisible || var_535d098c) && var_7948b2f3;
            /#
                reasons = "<unknown string>" + isvisible + "<unknown string>" + var_6738a702 + "<unknown string>" + withinfov;
                if (var_425c4c8b) {
                    record3dtext(reasons, entity.origin + vectorscale((0, 0, 1), 60), (0, 1, 0), "<unknown string>");
                } else {
                    record3dtext(reasons, entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
                }
            #/
            if (var_425c4c8b) {
                var_90c3cdd2 = length(entity.var_cd8354e0.adjustedendpos - entity.var_cd8354e0.var_cb28f380);
                timestep = function_60d95f53();
                animlength = getanimlength(mocompanim) * 1000;
                starttime = entity.var_cd8354e0.var_98bc84b7 * animlength;
                stoptime = entity.var_cd8354e0.var_6392c3a2 * animlength;
                starttime = floor(starttime / timestep);
                stoptime = floor(stoptime / timestep);
                adjustduration = stoptime - starttime;
                entity.var_cd8354e0.var_10b8b6d1 = vectornormalize(entity.var_cd8354e0.adjustedendpos - entity.var_cd8354e0.var_cb28f380);
                entity.var_cd8354e0.var_8b9a15a6 = var_90c3cdd2 / adjustduration;
                entity.var_cd8354e0.var_425c4c8b = 1;
                entity.var_cd8354e0.adjustmentstarted = 1;
            } else {
                entity.var_cd8354e0.var_425c4c8b = 0;
            }
        }
    }
    if (entity.var_cd8354e0.adjustmentstarted) {
        if (var_e72a224a <= entity.var_cd8354e0.var_6392c3a2) {
            /#
                assert(isdefined(entity.var_cd8354e0.var_10b8b6d1) && isdefined(entity.var_cd8354e0.var_8b9a15a6));
            #/
            /#
                recordsphere(entity.var_cd8354e0.var_cb28f380, 3, (0, 1, 0), "<unknown string>");
                recordsphere(entity.var_cd8354e0.adjustedendpos, 3, (0, 0, 1), "<unknown string>");
            #/
            adjustedorigin = entity.origin + entity.var_cd8354e0.var_10b8b6d1 * entity.var_cd8354e0.var_8b9a15a6;
            entity forceteleport(adjustedorigin);
        } else if (isdefined(entity.enemy)) {
            entity orientmode("face enemy");
        }
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 5, eflags: 0x1 linked
// Checksum 0xfa412a3, Offset: 0x5358
// Size: 0xd2
function function_76968111(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity.blockingpain = 0;
    entity.usegoalanimweight = 0;
    entity clearpath();
    entity orientmode("face enemy");
    entity pathmode("move delayed", 1, 0.2);
    entity collidewithactors(1);
    entity.var_cd8354e0 = undefined;
    entity.var_b736fc8b = 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 4, eflags: 0x1 linked
// Checksum 0x86a67c9c, Offset: 0x5438
// Size: 0x32
function function_2c67c3e1(entity, attribute, oldvalue, value) {
    entity.summon_wolves = value;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x43895f66, Offset: 0x5478
// Size: 0x12e
function private function_43f02cf0(entity) {
    if (isdefined(entity.summon_wolves) && entity.summon_wolves) {
        return 0;
    }
    if (entity function_ebbebf56() != 1) {
        return 0;
    }
    if (entity.health / entity.maxhealth > entity ai::function_9139c839().var_8c0e8cfb / 100) {
        return 0;
    }
    if (entity.var_1a60ad62 > gettime()) {
        return 0;
    }
    if (!(isdefined(level.var_8a5c1a7a) && level.var_8a5c1a7a) && zombie_utility::get_current_zombie_count() >= level.zombie_ai_limit) {
        return 0;
    }
    if (function_21a3a673(0, 100) < entity ai::function_9139c839().var_d9838997) {
        entity.summon_wolves = 1;
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xcd1ba4e8, Offset: 0x55b0
// Size: 0x28
function private function_1ab1a5b3(entity) {
    return isdefined(entity.summon_wolves) && entity.summon_wolves;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0xec111cd, Offset: 0x55e0
// Size: 0x5e
function private function_f8912291(entity) {
    entity.var_48baa747 = 1;
    entity.summon_wolves = undefined;
    entity.var_1a60ad62 = gettime() + entity ai::function_9139c839().var_fe050356;
    entity.blockingpain = 1;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x69eef649, Offset: 0x5648
// Size: 0x9a
function private function_fcc1c537(entity) {
    entity.var_48baa747 = 0;
    entity.ai.var_d6cd1d4e = gettime() + int(entity ai::function_9139c839().var_6d4b0dd6 * 1000);
    entity.var_1a60ad62 = gettime() + entity ai::function_9139c839().var_fe050356;
    entity.blockingpain = 0;
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x5 linked
// Checksum 0x129d7615, Offset: 0x56f0
// Size: 0x82
function private summonwolves(entity) {
    var_c59b482e = self.maxhealth * entity ai::function_9139c839().var_362e4d4c / 100;
    self.health = int(min(self.health + var_c59b482e, self.maxhealth));
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x4
// Checksum 0xff6eb7e6, Offset: 0x5780
// Size: 0x1b8
function private function_39671958() {
    /#
        werewolves = getaiarchetypearray(#"werewolf");
        foreach (werewolf in werewolves) {
            nearest_nodes = getnodesinradiussorted(werewolf.origin, 1024, 0);
            foreach (node in nearest_nodes) {
                if (node.script_noteworthy === "<unknown string>" && !iscovernode(node) && ispathnode(node)) {
                    var_71c80ceb = zm_ai_utility::get_pathnode_path(node);
                    zm_ai_utility::start_patrol(werewolf, var_71c80ceb.path, var_71c80ceb.loops, undefined, undefined);
                    break;
                }
            }
        }
    #/
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x4
// Checksum 0x260865c8, Offset: 0x5940
// Size: 0xa2
function private function_bb9fe466() {
    /#
        werewolves = getaiarchetypearray(#"werewolf");
        foreach (werewolf in werewolves) {
            werewolf.summon_wolves = 1;
        }
    #/
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x4
// Checksum 0x6a1d9c5b, Offset: 0x59f0
// Size: 0x110
function private function_91180121() {
    /#
        var_d480edb7 = getscriptbundle(#"c_t8_zmb_werewolf_weakpoint_def");
        foreach (var_dd54fdb1 in var_d480edb7.weakpoints) {
            hittag = isdefined(var_dd54fdb1.var_51e8b151) ? var_dd54fdb1.var_51e8b151 : var_dd54fdb1.var_910e2f9b;
            if (isdefined(hittag)) {
                adddebugcommand("<unknown string>" + hittag + "<unknown string>" + hittag + "<unknown string>");
            }
        }
    #/
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x4
// Checksum 0x105d5f8d, Offset: 0x5b08
// Size: 0xf8
function private function_5ffd8dd3(hittag) {
    /#
        werewolves = getaiarchetypearray(#"werewolf");
        foreach (werewolf in werewolves) {
            var_dd54fdb1 = namespace_81245006::function_37e3f011(werewolf, hittag);
            werewolf function_ebf85268(undefined, undefined, var_dd54fdb1.health, undefined, undefined, undefined, undefined, undefined, undefined, undefined, hittag);
        }
    #/
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x4
// Checksum 0x303e5aa9, Offset: 0x5c08
// Size: 0x428
function private function_e79ce40a() {
    /#
        adddebugcommand("<unknown string>");
        spawners = getactorspawnerarray();
        if (isdefined(spawners)) {
            foreach (spawner in spawners) {
                if (spawner.var_9fde8624 === #"werewolf_hallion" && isdefined(spawner.script_noteworthy)) {
                    adddebugcommand("<unknown string>");
                    break;
                }
            }
        }
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        function_91180121();
        level.var_abe0b71d = 0;
        while (1) {
            waitframe(1);
            string = getdvarstring(#"hash_4fe745cc8a7d9b8c", "<unknown string>");
            cmd = strtok(string, "<unknown string>");
            if (cmd.size > 0) {
                switch (cmd[0]) {
                case #"spawn":
                    zm_devgui::spawn_archetype("<unknown string>");
                    break;
                case #"spawn_hallion":
                    spawners = getspawnerarray();
                    foreach (spawner in spawners) {
                        if (spawner.var_9fde8624 === #"werewolf_hallion" && isdefined(spawner.script_noteworthy)) {
                            zm_devgui::spawn_archetype(spawner.script_noteworthy);
                            break;
                        }
                    }
                    break;
                case #"kill":
                    zm_devgui::kill_archetype(#"werewolf");
                    break;
                case #"patrol":
                    function_39671958();
                    break;
                case #"summon_wolves":
                    function_bb9fe466();
                    break;
                case #"destroy_weakpoint":
                    function_5ffd8dd3(cmd[1]);
                    break;
                case #"debug_dmg":
                    level.var_abe0b71d = !level.var_abe0b71d;
                    break;
                default:
                    break;
                }
            }
            setdvar(#"hash_4fe745cc8a7d9b8c", "<unknown string>");
        }
    #/
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 1, eflags: 0x1 linked
// Checksum 0x8fc316a8, Offset: 0x6038
// Size: 0x26a
function function_96640dc5(eventstruct) {
    notify_string = eventstruct.action;
    switch (notify_string) {
    case #"death":
        if (isdefined(self.bgb_tone_death) && self.bgb_tone_death) {
            level thread zm_audio::zmbaivox_playvox(self, "death_whimsy", 1, 4);
        } else {
            level thread zm_audio::zmbaivox_playvox(self, notify_string, 1, 4);
        }
        break;
    case #"pain":
    case #"shake":
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 1, 3, 1);
        break;
    case #"howl":
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 1, 3, 1);
        break;
    case #"growl_anim":
        level thread zm_audio::zmbaivox_playvox(self, "growl", 1, 3, 1);
        break;
    case #"attack_leap":
    case #"attack_melee":
        level thread zm_audio::zmbaivox_playvox(self, "attack", 1, 2, 1);
        break;
    case #"sprint":
    case #"ambient":
    case #"growl":
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 0, 1);
        break;
    default:
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 0, 2);
        break;
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x1 linked
// Checksum 0xd9294e7a, Offset: 0x62b0
// Size: 0x230
function function_8fa45bb0() {
    self endon(#"death");
    if (!isdefined(self.var_db792001)) {
        tag_origin = self gettagorigin("tag_eye");
        self.var_db792001 = spawn("script_origin", tag_origin);
        self.var_db792001 linkto(self);
        self.var_db792001 playloopsound(#"hash_6875b34c441a8695");
        self thread function_dfe1236();
        self thread function_10ac98a8();
    }
    laststance = "";
    var_76ed16d4 = 99;
    n_cooldown = 10;
    var_83773814 = "ambient";
    while (1) {
        currentstance = self getblackboardattribute("_werewolf_stance");
        if (isdefined(currentstance)) {
            if (currentstance != laststance) {
                laststance = currentstance;
                if (currentstance == "upright") {
                    var_83773814 = "ambient";
                    n_cooldown = randomintrange(7, 13);
                } else if (currentstance == "quad") {
                    var_83773814 = "sprint";
                    n_cooldown = randomintrange(4, 7);
                }
            }
        }
        if (var_76ed16d4 >= n_cooldown) {
            var_76ed16d4 = 0;
            function_6eac4ca1(self, var_83773814);
        } else {
            var_76ed16d4++;
        }
        wait(1);
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x1 linked
// Checksum 0x9cef01c, Offset: 0x64e8
// Size: 0xb0
function function_dfe1236() {
    self endon(#"death");
    while (1) {
        if (isdefined(self.talking) && self.talking) {
            self.var_db792001 stoploopsound();
            while (isdefined(self.talking) && self.talking) {
                wait(0.5);
            }
            self.var_db792001 playloopsound(#"hash_6875b34c441a8695");
        }
        wait(0.5);
    }
}

// Namespace zm_ai_werewolf/zm_ai_werewolf
// Params 0, eflags: 0x1 linked
// Checksum 0x2384c733, Offset: 0x65a0
// Size: 0x44
function function_10ac98a8() {
    var_80c3a5c6 = self.var_db792001;
    self waittill(#"death");
    waitframe(1);
    var_80c3a5c6 delete();
}

