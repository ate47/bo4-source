// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\archetype_brutus_interface.gsc;
#using scripts\core_common\ai\archetype_brutus.gsc;
#using scripts\zm\powerup\zm_powerup_nuke.gsc;
#using script_7c62f55ce3a557ff;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using script_24c32478acf44108;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_lockdown_util.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\destructible_character.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\archetype_mocomps_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\debug.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\archetype_locomotion_utility.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace zm_ai_brutus;

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x2
// Checksum 0x32898d92, Offset: 0x588
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_brutus", &__init__, &__main__, undefined);
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0xe037498c, Offset: 0x5d8
// Size: 0x31c
function __init__() {
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"brutus", &function_debbd9da);
    spawner::function_89a2cd87(#"brutus", &function_6090f71a);
    level._effect[#"brutus"] = [];
    level._effect[#"brutus"][#"lockdown_stub_type_pap"] = "maps/zm_escape/fx8_alcatraz_perk_lock";
    level._effect[#"brutus"][#"lockdown_stub_type_perks"] = "maps/zm_escape/fx8_alcatraz_perk_s_lock";
    level._effect[#"brutus"][#"lockdown_stub_type_crafting_tables"] = "maps/zm_escape/fx8_alcatraz_w_bench_lock";
    level thread aat::register_immunity("zm_aat_brain_decay", #"brutus", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_frostbite", #"brutus", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_kill_o_watt", #"brutus", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_plasmatic_burst", #"brutus", 1, 1, 1);
    clientfield::register("actor", "brutus_shock_attack", 1, 1, "counter");
    clientfield::register("actor", "brutus_spawn_clientfield", 1, 1, "int");
    clientfield::register("toplayer", "brutus_shock_attack_player", 1, 1, "counter");
    callback::on_actor_killed(&on_brutus_killed);
    zm_cleanup::function_cdf5a512(#"brutus", &function_88efcb);
    /#
        zm_devgui::function_c7dd7a17("<unknown string>");
    #/
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x900
// Size: 0x4
function __main__() {
    
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x7c4faf, Offset: 0x910
// Size: 0x23e
function function_debbd9da() {
    self zombie_utility::set_zombie_run_cycle("run");
    aiutility::addaioverridedamagecallback(self, &function_83a6d3ae);
    self.hashelmet = 1;
    self.helmethits = 0;
    self.var_96b5e3f1 = 0;
    self.var_71ab4927 = 0;
    self.var_905e4ce2 = self ai::function_9139c839().var_267bc182;
    self.meleedamage = self ai::function_9139c839().var_da7f4645;
    self.instakill_func = &instakill_override;
    self.var_f46fbf3f = 1;
    self.var_126d7bef = 1;
    self.var_e38eaee5 = 0;
    self.var_72411ccf = &brutustargetservice;
    self.cant_move_cb = &zombiebehavior::function_79fe956f;
    self.closest_player_override = &zm_utility::function_c52e1749;
    self zm_powerup_nuke::function_9a79647b(0.25);
    self thread zm_audio::zmbaivox_notifyconvert();
    self thread zm_audio::play_ambient_zombie_vocals();
    self callback::function_d8abfc3d(#"hash_6f9c2499f805be2f", &function_f2f4ced8);
    if (!isdefined(self.var_9fde8624)) {
        self attach("c_t8_zmb_mob_brutus_baton", "tag_weapon_right");
    }
    self setavoidancemask("avoid none");
    self.cant_move_cb = &function_188c83c7;
    self.var_63d2fce2 = &function_7b6e791e;
    self.ignorepathenemyfightdist = 1;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x34666d1e, Offset: 0xb58
// Size: 0x24
function function_7b6e791e() {
    self.var_67faa700 = 0;
    self collidewithactors(1);
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x1974cef6, Offset: 0xb88
// Size: 0xc4
function function_188c83c7() {
    self endon(#"death");
    self notify(#"hash_74044076f321434a");
    self endon(#"hash_74044076f321434a");
    self clearpath();
    self collidewithactors(0);
    if (isdefined(self.var_ece4a895)) {
        var_b378abd6 = self [[ self.var_ece4a895 ]]();
        if (isdefined(var_b378abd6)) {
            self.var_67faa700 = 1;
            self setgoal(var_b378abd6, 1);
        }
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0xa28d7655, Offset: 0xc58
// Size: 0xc4
function function_f2f4ced8() {
    self clientfield::set("brutus_spawn_clientfield", 1);
    if (isdefined(level.var_779eb5f5) && level.var_779eb5f5) {
        return;
    }
    playsoundatposition(#"zmb_ai_brutus_spawn", self.origin);
    if (!isdefined(level.var_b491030) || level flag::get(#"main_quest_completed")) {
        self playsound(#"hash_5d69a47fd8c0e9e5");
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0xed4fcdcf, Offset: 0xd28
// Size: 0x76
function function_c7ea6c73() {
    if (!isdefined(level.brutus_last_spawn_round)) {
        level.brutus_last_spawn_round = 0;
    }
    if (!isdefined(level.brutus_round_count)) {
        level.brutus_round_count = 0;
    }
    if (level.round_number > level.brutus_last_spawn_round) {
        level.brutus_round_count++;
        level.brutus_last_spawn_round = level.round_number;
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x42562d76, Offset: 0xda8
// Size: 0xea
function function_24c1b38f() {
    a_players = getplayers();
    n_player_modifier = 1;
    if (a_players.size > 1) {
        n_player_modifier = a_players.size * self ai::function_9139c839().var_854eebd;
    }
    var_eb6e4e3a = self ai::function_9139c839().var_544b0295 * n_player_modifier * level.brutus_round_count;
    var_eb6e4e3a = int(min(var_eb6e4e3a, self ai::function_9139c839().var_d0d2e3ce * n_player_modifier));
    return var_eb6e4e3a;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0xe4313191, Offset: 0xea0
// Size: 0x184
function function_6090f71a() {
    if (!isdefined(self.starting_health)) {
        function_c7ea6c73();
        self.maxhealth = int(self zm_ai_utility::function_8d44707e(1, level.brutus_round_count) * (isdefined(level.var_1b0cc4f5) ? level.var_1b0cc4f5 : 1));
        self.health = int(self zm_ai_utility::function_8d44707e(1, level.brutus_round_count) * (isdefined(level.var_1b0cc4f5) ? level.var_1b0cc4f5 : 1));
    } else {
        self.maxhealth = self.starting_health;
        self.health = self.starting_health;
    }
    self.starting_health = undefined;
    self.explosive_dmg_req = self function_24c1b38f();
    starting_round = isdefined(self._starting_round_number) ? self._starting_round_number : level.round_number;
    ai::set_behavior_attribute("can_ground_slam", starting_round > self ai::function_9139c839().var_af3fff17);
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x1 linked
// Checksum 0xc99d4d35, Offset: 0x1030
// Size: 0xac
function on_brutus_killed(params) {
    if (self.archetype !== #"brutus") {
        return;
    }
    self clientfield::set("brutus_spawn_clientfield", 0);
    playsoundatposition(#"zmb_ai_brutus_death", self.origin);
    self destructserverutils::togglespawngibs(self, 1);
    self destructserverutils::function_629a8d54(self, "tag_weapon_right");
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x5 linked
// Checksum 0xaeae119a, Offset: 0x10e8
// Size: 0x494
function private registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&function_fbb311db));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_68d081058095794", &function_fbb311db);
    /#
        assert(isscriptfunctionptr(&function_3006441d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_df1d28cebbb75f6", &function_3006441d);
    /#
        assert(isscriptfunctionptr(&function_3bda3c55));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_d8653062b32a601", &function_3bda3c55);
    /#
        assert(isscriptfunctionptr(&function_20fa0d4c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_691307470629f20e", &function_20fa0d4c);
    /#
        assert(isscriptfunctionptr(&function_3536f675));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_526dcca6d6d76bfe", &function_3536f675);
    /#
        assert(isscriptfunctionptr(&brutuslockdownstub));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"brutuslockdownstub", &brutuslockdownstub);
    /#
        assert(isscriptfunctionptr(&function_4ec678fe));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_643443bf9243e4ff", &function_4ec678fe);
    /#
        assert(isscriptfunctionptr(&function_f4a61e6a));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5800441474109ca6", &function_f4a61e6a);
    animationstatenetwork::registernotetrackhandlerfunction("hit_ground", &function_85e8940a);
    animationstatenetwork::registernotetrackhandlerfunction("locked", &brutuslockdownstub);
    animationstatenetwork::registeranimationmocomp("mocomp_purchase_lockdown@brutus", &function_14ed6be, undefined, undefined);
    /#
        assert(isscriptfunctionptr(&function_3c3e6f4a));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1ba2ab8d76e1cd9b", &function_3c3e6f4a);
    /#
        assert(isscriptfunctionptr(&function_eb1f805));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_cc119947efb49cf", &function_eb1f805);
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 2, eflags: 0x5 linked
// Checksum 0xcf681549, Offset: 0x1588
// Size: 0x1f2
function private function_943e4c08(entity, minplayerdist) {
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
    var_6f59ec8b = getclosestpointonnavmesh(entity.origin, entity getpathfindingradius());
    if (isdefined(var_6f59ec8b)) {
        pathdata = generatenavmeshpath(var_6f59ec8b, playerpositions, entity);
        if (isdefined(pathdata) && pathdata.status === "succeeded" && pathdata.pathdistance < minplayerdist) {
            return 0;
        }
    }
    return 1;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0xd3edebc6, Offset: 0x1788
// Size: 0x392
function private brutustargetservice(entity) {
    if (isdefined(entity.ignoreall) && entity.ignoreall) {
        return 0;
    }
    entity.favoriteenemy = entity.var_93a62fe;
    if (!isdefined(entity.favoriteenemy) || zm_behavior::zombieshouldmoveawaycondition(entity)) {
        zone = zm_utility::get_current_zone();
        if (isdefined(zone)) {
            wait_locations = level.zones[zone].a_loc_types[#"wait_location"];
            if (isdefined(wait_locations) && wait_locations.size > 0) {
                entity zm_utility::function_64259898(wait_locations[0].origin, 200);
                return 1;
            }
        }
        entity setgoal(entity.origin);
        return 1;
    }
    /#
        zm_lockdown_util::function_f3cff6ff(entity);
    #/
    if (!isdefined(entity.var_722a34a3)) {
        entity.var_52e3b294 = undefined;
        pointofinterest = entity zm_utility::get_zombie_point_of_interest(entity.origin);
        if (isdefined(pointofinterest) && pointofinterest.size > 0) {
            foreach (poi in pointofinterest) {
                if (isdefined(poi) && isentity(poi) && isdefined(poi.classname) && poi.classname == "grenade") {
                    goalpos = getclosestpointonnavmesh(poi.origin, 10, self getpathfindingradius());
                    if (isdefined(goalpos)) {
                        entity.var_722a34a3 = poi;
                        entity.var_52e3b294 = goalpos;
                    }
                }
            }
        }
    }
    if (isdefined(entity.var_52e3b294) && entity zm_utility::function_64259898(entity.var_52e3b294)) {
        return 1;
    }
    if (isdefined(entity.var_d646708c)) {
        entity function_a57c34b7(entity.var_d646708c);
        return 1;
    }
    goalent = entity.favoriteenemy;
    if (isplayer(goalent)) {
        goalent = zm_ai_utility::function_a2e8fd7b(entity, entity.favoriteenemy);
    }
    return entity zm_utility::function_64259898(goalent.origin);
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x91253ec8, Offset: 0x1b28
// Size: 0x500
function private function_3c3e6f4a(entity) {
    var_65ba9602 = zm_lockdown_util::function_87c1193e(entity);
    if (isdefined(entity.var_722a34a3) || !isdefined(var_65ba9602) || !zm_lockdown_util::function_c9105448(entity, var_65ba9602)) {
        zm_lockdown_util::function_77caff8b(var_65ba9602);
        entity.var_d646708c = undefined;
    }
    if (isdefined(entity.var_722a34a3) || isdefined(var_65ba9602)) {
        return;
    }
    if (entity.var_e38eaee5 > gettime()) {
        return 0;
    }
    if (!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area)) {
        return 0;
    }
    if (zm_utility::is_standard() && level flag::exists("started_defend_area") && level flag::get("started_defend_area")) {
        entity.var_d646708c = undefined;
        return 0;
    }
    /#
        zm_lockdown_util::function_f3cff6ff(entity);
    #/
    stub_types = [];
    array::add(stub_types, "lockdown_stub_type_crafting_tables");
    array::add(stub_types, "lockdown_stub_type_perks");
    array::add(stub_types, "lockdown_stub_type_pap");
    array::add(stub_types, "lockdown_stub_type_magic_box");
    array::add(stub_types, "lockdown_stub_type_boards");
    array::add(stub_types, "lockdown_stub_type_traps");
    registerlotus_right = zm_lockdown_util::function_9b84bb88(entity, stub_types, entity ai::function_9139c839().var_58b424ec, entity ai::function_9139c839().var_e81712d);
    entity.var_e38eaee5 = gettime() + 500;
    if (registerlotus_right.size == 0) {
        return 0;
    }
    stub = registerlotus_right[0];
    if (!function_943e4c08(entity, entity ai::function_9139c839().var_78a5f50)) {
        /#
            zm_lockdown_util::function_78eae22a(entity, stub, 9);
        #/
        return 0;
    }
    var_801b2d64 = undefined;
    var_f1591c10 = zm_lockdown_util::function_dab6d796(entity, stub);
    if (!isdefined(var_f1591c10)) {
        var_7162cf15 = zm_utility::function_b0eeaada(stub.origin);
        halfheight = 32;
        if (!isdefined(var_7162cf15)) {
            var_7162cf15 = [];
            var_7162cf15[#"point"] = stub.origin;
            halfheight = (stub.origin - zm_utility::groundpos(stub.origin))[2] + 1;
        }
        var_239124a9 = positionquery_source_navigation(var_7162cf15[#"point"], 0, 256, halfheight, 20, 1);
        if (var_239124a9.data.size == 0) {
            return 0;
        }
        var_801b2d64 = var_239124a9.data[0].origin;
    } else {
        var_801b2d64 = getclosestpointonnavmesh(var_f1591c10.origin, 200, 24);
    }
    if (!isdefined(var_801b2d64)) {
        return 0;
    }
    entity.var_d646708c = var_801b2d64;
    zm_lockdown_util::function_50ba1eb0(entity, stub);
    entity setblackboardattribute("_lockdown_type", zm_lockdown_util::function_22aeb4e9(stub.lockdowntype));
    /#
        zm_lockdown_util::function_f3cff6ff(entity);
    #/
    return 1;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x1e1c14ee, Offset: 0x2030
// Size: 0x1d0
function private function_eb1f805(entity) {
    velocity = entity getvelocity();
    velocitymag = length(velocity);
    predicttime = 0.2;
    movevector = velocity * predicttime;
    predictedpos = entity.origin + movevector;
    zombiesarray = getaiarchetypearray(#"zombie");
    zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"catalyst"), 0, 0);
    var_86476d47 = array::filter(zombiesarray, 0, &namespace_9ff9f642::function_865a83f8, entity, predictedpos, ai::function_9139c839().var_b7366094);
    if (var_86476d47.size > 0) {
        foreach (zombie in var_86476d47) {
            zombie zombie_utility::function_fc0cb93d(entity);
        }
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0xa2b4bfa0, Offset: 0x2208
// Size: 0x74
function private function_3006441d(entity) {
    if (!isdefined(entity.var_722a34a3) || !isdefined(entity.var_52e3b294) || distancesquared(entity.var_52e3b294, entity.origin) > 10 * 10) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x91f88588, Offset: 0x2288
// Size: 0xd4
function private function_4ec678fe(entity) {
    if (!isdefined(entity.var_722a34a3)) {
        return;
    }
    monkeybomb = entity.var_722a34a3;
    level notify(#"hash_79c0225ea09cd215", {#var_569d804d:monkeybomb.angles, #var_cee6bd0b:monkeybomb.origin, #brutus:self});
    if (isdefined(monkeybomb.damagearea)) {
        monkeybomb.damagearea delete();
    }
    monkeybomb delete();
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x1 linked
// Checksum 0x70d6c5b, Offset: 0x2368
// Size: 0x2ae
function function_20fa0d4c(entity) {
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    if (isdefined(entity.marked_for_death)) {
        return 0;
    }
    if (isdefined(entity.ignoremelee) && entity.ignoremelee) {
        return 0;
    }
    if (abs(entity.origin[2] - entity.enemy.origin[2]) > 64) {
        return 0;
    }
    if (isdefined(entity.meleeweapon) && entity.meleeweapon !== level.weaponnone) {
        meleedistsq = entity.meleeweapon.aimeleerange * entity.meleeweapon.aimeleerange;
    }
    if (!isdefined(meleedistsq)) {
        return 0;
    }
    if (distancesquared(entity.origin, entity.enemy.origin) > meleedistsq) {
        return 0;
    }
    yawtoenemy = angleclamp180(entity.angles[1] - vectortoangles(entity.enemy.origin - entity.origin)[1]);
    if (abs(yawtoenemy) > 60) {
        return 0;
    }
    if (!entity cansee(entity.enemy)) {
        return 0;
    }
    if (distancesquared(entity.origin, entity.enemy.origin) < 40 * 40) {
        return 1;
    }
    if (!tracepassedonnavmesh(entity.origin, isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin, entity getpathfindingradius())) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x6c485d90, Offset: 0x2620
// Size: 0x52
function private function_3536f675(entity) {
    return entity ai::has_behavior_attribute("scripted_mode") && entity ai::get_behavior_attribute("scripted_mode") === 1;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0xece71865, Offset: 0x2680
// Size: 0x140
function private function_3bda3c55(entity) {
    if (!entity ai::get_behavior_attribute("can_ground_slam")) {
        return 0;
    }
    if (entity.var_96b5e3f1 > gettime()) {
        return 0;
    }
    if (!isdefined(entity.favoriteenemy)) {
        return 0;
    }
    if (!(isdefined(entity.favoriteenemy.am_i_valid) && entity.favoriteenemy.am_i_valid)) {
        return 0;
    }
    if (abs(entity.origin[2] - entity.favoriteenemy.origin[2]) > 72) {
        return 0;
    }
    if (distance2dsquared(entity.origin, entity.favoriteenemy.origin) > entity ai::function_9139c839().var_b4c77cfb * entity ai::function_9139c839().var_b4c77cfb) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x7de46a4e, Offset: 0x27c8
// Size: 0x4e
function private function_f4a61e6a(entity) {
    entity.var_96b5e3f1 = gettime() + int(entity ai::function_9139c839().var_d5427206 * 1000);
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x3ddcf9b9, Offset: 0x2820
// Size: 0x3a0
function private function_85e8940a(entity) {
    players = getplayers();
    zombies = getaiteamarray(level.zombie_team);
    ents = arraycombine(players, zombies, 0, 0);
    ents = arraysortclosest(ents, entity.origin, undefined, 0, entity ai::function_9139c839().var_1709a39);
    shock_status_effect = getstatuseffect(#"hash_19533caf858a9f3b");
    entity clientfield::increment("brutus_shock_attack", 1);
    level notify(#"hash_7a4ba7676000c3c6", {#brutus:self});
    foreach (ent in ents) {
        if (isplayer(ent)) {
            if (!zombie_utility::is_player_valid(ent, 0, 0)) {
                continue;
            }
            if (!bullettracepassed(entity.origin, ent gettagorigin("j_spine4"), 0, entity, ent)) {
                continue;
            }
            damage = mapfloat(entity getpathfindingradius() + 15, entity ai::function_9139c839().var_1709a39, entity ai::function_9139c839().var_7ea758e1, 0, distance(entity.origin, ent.origin));
            damage = int(max(10, damage));
            ent dodamage(damage, entity.origin, entity, entity, "none");
            ent status_effect::status_effect_apply(shock_status_effect, undefined, self, 0);
            ent clientfield::increment_to_player("brutus_shock_attack_player", 1);
        } else if (isai(ent)) {
            if (ent.var_6f84b820 === #"basic") {
                ent zombie_utility::setup_zombie_knockdown(entity);
            }
        }
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0xe67d3554, Offset: 0x2bc8
// Size: 0xa0
function private function_fbb311db(entity) {
    if (!isdefined(entity.var_d646708c) || !zm_lockdown_util::function_7bfa8895(entity)) {
        return 0;
    }
    if (distancesquared(entity.var_d646708c, entity.origin) > entity ai::function_9139c839().var_98d0b358 * entity ai::function_9139c839().var_98d0b358) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x1 linked
// Checksum 0xc70f218f, Offset: 0x2c70
// Size: 0x112
function function_c1844128(player) {
    if (zm_utility::is_standard()) {
        if (function_8b1a219a()) {
            self sethintstring(#"hash_43bfefdaa25b6b9c");
        } else {
            self sethintstring(#"hash_41048087f44fc9b0");
        }
    } else if (function_8b1a219a()) {
        self sethintstring(#"hash_451dc9a0469e39ff", self.stub.var_534571f);
    } else {
        self sethintstring(#"hash_5bdb56428055a4c1", self.stub.var_534571f);
    }
    return zm_lockdown_util::function_b5dd9241(self.stub);
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 2, eflags: 0x5 linked
// Checksum 0x219b7467, Offset: 0x2d90
// Size: 0x140
function private function_30afd2be(type, stub) {
    if (!isdefined(stub.var_50a8d231)) {
        stub.var_50a8d231 = 0;
    }
    var_b8576908 = 2000;
    switch (type) {
    case #"lockdown_stub_type_crafting_tables":
        var_491c5d62 = 1;
        break;
    case #"lockdown_stub_type_magic_box":
        var_491c5d62 = 1;
        break;
    case #"lockdown_stub_type_pap":
        var_491c5d62 = 3;
        break;
    case #"lockdown_stub_type_perks":
        var_491c5d62 = 3;
        break;
    default:
        var_491c5d62 = 1;
        break;
    }
    stub.var_50a8d231 = int(min(stub.var_50a8d231 + 1, var_491c5d62));
    return var_b8576908 * stub.var_50a8d231;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x5 linked
// Checksum 0x508eccb9, Offset: 0x2ed8
// Size: 0x1c0
function private function_32551326() {
    self endon(#"death");
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        if (!isdefined(waitresult.activator) || !zm_utility::is_player_valid(waitresult.activator) || isdefined(self.stub) && isdefined(self.stub.var_6156031a) && self.stub.var_6156031a) {
            continue;
        }
        player = waitresult.activator;
        if (!player zm_score::can_player_purchase(self.stub.var_534571f)) {
            continue;
        }
        player zm_score::minus_to_player_score(self.stub.var_534571f);
        level notify(#"unlock_purchased", {#s_stub:self.stub});
        if (!isdefined(self.stub.var_6f08706b)) {
            if (self.stub.lockdowntype == "lockdown_stub_type_magic_box") {
                self.stub.trigger_target.zbarrier thread zm_magicbox::set_magic_box_zbarrier_state("unlocking");
            }
        }
        self.stub thread zm_lockdown_util::function_61a9bc58();
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x856ed5b5, Offset: 0x30a0
// Size: 0x194
function private brutuslockdownstub(entity) {
    stub = zm_lockdown_util::function_87c1193e(entity);
    if (isdefined(stub)) {
        if (!zm_lockdown_util::function_c9105448(entity, stub)) {
            zm_lockdown_util::function_77caff8b(stub);
            entity.var_d646708c = undefined;
            return;
        }
        if (stub.lockdowntype == "lockdown_stub_type_magic_box") {
            stub.trigger_target.zbarrier zm_magicbox::set_magic_box_zbarrier_state("locking");
        }
        if (isdefined(stub.lockdowntype)) {
            var_80f22b97 = function_30afd2be(stub.lockdowntype, stub);
        } else {
            var_80f22b97 = 2000;
        }
        stub.var_534571f = var_80f22b97;
        level notify(#"brutus_locked", {#s_stub:stub});
        zm_lockdown_util::function_7258b5cc(entity, &function_c1844128, &function_32551326);
        entity setblackboardattribute("_lockdown_type", "INVALID");
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 5, eflags: 0x5 linked
// Checksum 0x1afdca79, Offset: 0x3240
// Size: 0x7c
function private function_14ed6be(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    stub = zm_lockdown_util::function_87c1193e(entity);
    if (isdefined(stub)) {
        entity orientmode("face point", stub.origin);
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0xf807dfc4, Offset: 0x32c8
// Size: 0x62
function private function_97f51aa3(v_org) {
    grenade = self magicgrenadetype(getweapon(#"willy_pete"), v_org, (0, 0, 0), 0.4);
    grenade.owner = self;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0xa3d43d6e, Offset: 0x3338
// Size: 0x184
function function_530c54e3() {
    self.hashelmet = 0;
    self zombie_utility::set_zombie_run_cycle("sprint");
    self.var_71ab4927 = gettime() + int(self ai::function_9139c839().var_d463e760 * 1000);
    destructserverutils::function_9885f550(self, "helmet");
    self playsound(#"evt_brutus_helmet");
    self thread zm_audio::zmbaivox_playvox(self, "roar", 1, 3);
    if (isalive(self)) {
        function_97f51aa3(self gettagorigin("TAG_WEAPON_LEFT"));
        function_97f51aa3(self gettagorigin("TAG_WEAPON_RIGHT"));
        if (math::cointoss(50)) {
            level thread smoke_vo(self.origin);
        }
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 1, eflags: 0x1 linked
// Checksum 0x4745004d, Offset: 0x34c8
// Size: 0x148
function smoke_vo(v_pos) {
    var_55c47118 = spawn("trigger_radius", v_pos, 0, 200, 80);
    var_55c47118 endon(#"death");
    var_55c47118 thread function_9a4a6d02();
    while (1) {
        waitresult = undefined;
        waitresult = var_55c47118 waittill(#"trigger");
        if (isplayer(waitresult.activator)) {
            b_played = waitresult.activator zm_audio::create_and_play_dialog(#"brutus", #"smoke_react");
            if (isdefined(b_played) && b_played) {
                var_55c47118 notify(#"hash_617485dc39ba3f5e");
            }
        }
        wait(randomfloatrange(0.666667, 1.33333));
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0xe7fcdcdc, Offset: 0x3618
// Size: 0x34
function function_9a4a6d02() {
    self waittilltimeout(20, #"hash_617485dc39ba3f5e");
    self delete();
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 6, eflags: 0x5 linked
// Checksum 0xbcae5d0e, Offset: 0x3658
// Size: 0x244
function private function_55bb9c72(attacker, damage, weapon, var_81dcad68, damagemultiplier, damageoverride) {
    if (!(isdefined(self.hashelmet) && self.hashelmet)) {
        if (isdefined(attacker) && isplayer(attacker) && attacker hasperk(#"specialty_mod_awareness")) {
            if (self.var_6f84b820 === #"boss") {
                damage = damage * 1.1;
            } else {
                damage = damage * 1.2;
            }
        }
        return (damage * (damageoverride ? damagemultiplier : var_81dcad68));
    } else {
        if (weaponhasattachment(weapon, "fmj2")) {
            if (self.var_6f84b820 === #"boss") {
                damagemultiplier = damagemultiplier * 1.1;
            } else {
                damagemultiplier = min(1, damagemultiplier + 0.1);
            }
        }
        self.helmethits++;
        if (self.helmethits >= self.var_905e4ce2) {
            self function_530c54e3();
            if (isdefined(attacker) && isplayer(attacker) && isdefined(level.brutus_points_for_helmet)) {
                attacker zm_score::add_to_player_score(zm_score::get_points_multiplier(attacker) * zm_utility::round_up_score(level.brutus_points_for_helmet, 5));
                attacker notify(#"hash_1413599b710f10bd");
            }
        }
        return (damage * damagemultiplier);
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 11, eflags: 0x5 linked
// Checksum 0x4fdea8eb, Offset: 0x38a8
// Size: 0x42c
function private function_83a6d3ae(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, poffsettime, boneindex) {
    var_9000ab2 = isdefined(level.brutus_damage_percent) ? level.brutus_damage_percent : 0.1;
    var_127e9e7d = 1.5;
    var_81dcad68 = 1;
    if (self.var_71ab4927 > gettime()) {
        if (isplayer(attacker)) {
            attacker util::show_hit_marker();
        }
        return 0;
    }
    var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, boneindex, shitloc, vpoint);
    var_9000ab2 = var_786d7e06.damage_scale;
    var_58640bc4 = self zm_ai_utility::function_94d76123(weapon);
    if (isdefined(attacker) && isalive(attacker) && isplayer(attacker) && attacker zm_powerups::is_insta_kill_active()) {
        var_81dcad68 = 2;
    }
    if (isdefined(weapon) && weapon.weapclass == "spread") {
        var_9000ab2 = var_9000ab2 * var_127e9e7d;
        var_81dcad68 = var_81dcad68 * var_127e9e7d;
    }
    if (zm_utility::is_explosive_damage(meansofdeath)) {
        if (!isdefined(self.explosivedmgtaken)) {
            self.explosivedmgtaken = 0;
        }
        self.explosivedmgtaken = self.explosivedmgtaken + damage;
        scaler = var_9000ab2;
        if (self.explosivedmgtaken >= self.explosive_dmg_req && isdefined(self.hashelmet) && self.hashelmet) {
            self function_530c54e3();
            if (isdefined(attacker) && isplayer(attacker) && isdefined(level.brutus_points_for_helmet)) {
                attacker zm_score::add_to_player_score(zm_score::get_points_multiplier(attacker) * zm_utility::round_up_score(level.brutus_points_for_helmet, 5));
                attacker notify(#"hash_1413599b710f10bd");
            }
        }
        return (damage * scaler);
    } else if (shitloc !== "head" && shitloc !== "helmet") {
        if (weaponhasattachment(weapon, "fmj") && var_9000ab2 < 1) {
            if (self.var_6f84b820 == #"boss") {
                var_9000ab2 = var_9000ab2 * 1.1;
            } else {
                var_9000ab2 = min(1, var_9000ab2 + 0.1);
            }
        }
        return (damage * var_9000ab2);
    } else {
        return int(self function_55bb9c72(attacker, damage, weapon, var_81dcad68, var_9000ab2, var_58640bc4));
    }
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 3, eflags: 0x1 linked
// Checksum 0x640f2ce6, Offset: 0x3ce0
// Size: 0x40
function instakill_override(player, mod, shitloc) {
    if (self.archetype === #"brutus") {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_brutus/zm_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x21cac9ee, Offset: 0x3d28
// Size: 0x148
function function_88efcb() {
    if (!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area)) {
        return 1;
    }
    if (isdefined(level.var_f47ae5da)) {
        s_spawn_loc = [[ level.var_f47ae5da ]]();
    } else if (level.zm_loc_types[#"brutus_location"].size > 0) {
        s_spawn_loc = zombie_brutus_util::get_best_brutus_spawn_pos();
    }
    if (!isdefined(s_spawn_loc)) {
        return 1;
    }
    var_38007f6f = zm_lockdown_util::function_87c1193e(self);
    if (isdefined(var_38007f6f) && zm_lockdown_util::function_c9105448(self, var_38007f6f)) {
        zm_lockdown_util::function_77caff8b(var_38007f6f);
        self.var_d646708c = undefined;
    }
    self zm_ai_utility::function_a8dc3363(s_spawn_loc);
    if (isdefined(self)) {
        self thread zombie_brutus_util::brutus_lockdown_client_effects();
        self playsound(#"zmb_ai_brutus_spawn_2d");
    }
    return 1;
}

