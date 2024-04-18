// Atian COD Tools GSC decompiler test
#using scripts\wz_common\wz_ai_utils.gsc;
#using scripts\wz_common\wz_ai_zombie.gsc;
#using scripts\mp_common\player\player_damage.gsc;
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
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\infection.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace wz_ai_brutus;

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x2
// Checksum 0x5954178b, Offset: 0x370
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"wz_ai_brutus", &__init__, &__main__, undefined);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0xf1ae3f4f, Offset: 0x3c0
// Size: 0x124
function __init__() {
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"brutus", &function_debbd9da);
    spawner::function_89a2cd87(#"brutus", &function_6090f71a);
    clientfield::register("actor", "brutus_shock_attack", 15000, 1, "counter");
    clientfield::register("actor", "brutus_spawn_clientfield", 15000, 1, "int");
    clientfield::register("toplayer", "brutus_shock_attack_player", 15000, 1, "counter");
    callback::on_actor_killed(&on_brutus_killed);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x4f0
// Size: 0x4
function __main__() {
    
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x5 linked
// Checksum 0x8b5c99b4, Offset: 0x500
// Size: 0x62
function private function_517fd069() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_666b2409;
    self.___archetypeonbehavecallback = &function_3cdbfffd;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x22e5c109, Offset: 0x570
// Size: 0xc
function private function_3cdbfffd(entity) {
    
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x1cb62ba3, Offset: 0x588
// Size: 0x2c
function private function_666b2409(entity) {
    self.__blackboard = undefined;
    self function_517fd069();
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0xfe0cd894, Offset: 0x5c0
// Size: 0x27e
function function_debbd9da() {
    self function_517fd069();
    self wz_ai_utils::function_9758722("walk");
    aiutility::addaioverridedamagecallback(self, &function_83a6d3ae);
    self callback::function_d8abfc3d(#"on_ai_melee", &wz_ai_zombie::function_b8eb5dea);
    self callback::function_d8abfc3d(#"on_ai_killed", &on_brutus_killed);
    self callback::function_d8abfc3d(#"hash_4e449871617e2c25", &function_6a482c74);
    self callback::function_d8abfc3d(#"hash_3bb51ce51020d0eb", &wz_ai_utils::function_16e2f075);
    self function_bad305c7();
    self.var_65e57a10 = 1;
    self.health = 6000;
    self.hashelmet = 1;
    self.helmethits = 0;
    self.var_96b5e3f1 = 0;
    self.var_71ab4927 = 0;
    self.var_905e4ce2 = self ai::function_9139c839().var_267bc182;
    self.meleedamage = 150;
    self.var_f46fbf3f = 1;
    self.var_e38eaee5 = 0;
    self.var_a0193213 = 500;
    self.var_12ec333b = 1;
    self.var_6501ffdf = 1;
    self.var_737e8510 = 96;
    self thread wz_ai_zombie::function_6c308e81();
    self setavoidancemask("avoid none");
    self.cant_move_cb = &wz_ai_zombie::function_9c573bc6;
    self.ignorepathenemyfightdist = 1;
    self.var_31a789c0 = 1;
    self.var_872e52b0 = &wz_ai_zombie::function_833ce8c8;
    self.var_721a3dbd = 1;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x1 linked
// Checksum 0x44add647, Offset: 0x848
// Size: 0x6a
function function_6a482c74(params) {
    switch (params.state) {
    case 3:
        self wz_ai_utils::function_9758722("run");
        break;
    default:
        break;
    }
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0xe320e5e0, Offset: 0x8c0
// Size: 0x2e
function function_bad305c7() {
    self.var_2cee3556 = [];
    self.var_2cee3556[#"brutus_base_itemlist_all"] = 15;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x48167696, Offset: 0x8f8
// Size: 0x19a
function function_6090f71a() {
    self.explosive_dmg_req = 50;
    if (!getdvarint(#"survival_prototype", 0)) {
        self thread wz_ai_zombie::function_e261b81d();
    } else {
        self callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &wz_ai_zombie::function_bb3c1175);
        self wz_ai_zombie::function_b670d610();
    }
    self clientfield::set("brutus_spawn_clientfield", 1);
    var_7dd9d338 = "c_t8_zmb_mob_brutus_baton";
    if (self.var_9fde8624 === #"brutus_special") {
        var_7dd9d338 = "c_t8_zmb_mob_brutus_boss_baton";
    }
    self attach(var_7dd9d338, "tag_weapon_right");
    if (isdefined(self.ai_zone)) {
        node = getnode(self.ai_zone.zone_name + "_patrol", "targetname");
        if (isdefined(node)) {
            self.patrol_path = wz_ai_utils::get_pathnode_path(node);
            self.var_5d58d4c0 = &function_b510a832;
        }
    }
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x0
// Checksum 0xa6316db2, Offset: 0xaa0
// Size: 0x32
function function_ea3e1b6c(entity) {
    entity.fovcosine = 0.5;
    entity.maxsightdistsqrd = 900 * 900;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x1 linked
// Checksum 0x90818d82, Offset: 0xae0
// Size: 0x8c
function on_brutus_killed(params) {
    self clientfield::set("brutus_spawn_clientfield", 0);
    playsoundatposition(#"zmb_ai_brutus_death", self.origin);
    self destructserverutils::togglespawngibs(self, 1);
    self destructserverutils::function_629a8d54(self, "tag_weapon_right");
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x5 linked
// Checksum 0x2ec83c2, Offset: 0xb78
// Size: 0x36c
function private registerbehaviorscriptfunctions() {
    assert(isscriptfunctionptr(&function_3006441d));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_df1d28cebbb75f6", &function_3006441d);
    assert(isscriptfunctionptr(&function_3bda3c55));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_d8653062b32a601", &function_3bda3c55);
    assert(isscriptfunctionptr(&function_4ec678fe));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_643443bf9243e4ff", &function_4ec678fe);
    assert(isscriptfunctionptr(&function_f4a61e6a));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5800441474109ca6", &function_f4a61e6a);
    assert(isscriptfunctionptr(&function_5ca455a0));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_31bfd48e9c8557f0", &function_5ca455a0);
    assert(isscriptfunctionptr(&function_d996f07c));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4fe62c9a1dbe75d3", &function_d996f07c);
    assert(isscriptfunctionptr(&function_e2ab1df7));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_14196abc66fc78ee", &function_e2ab1df7);
    assert(isscriptfunctionptr(&function_1bd1ebe7));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6df8ee94ab700109", &function_1bd1ebe7);
    animationstatenetwork::registernotetrackhandlerfunction("hit_ground", &function_85e8940a);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x472085c1, Offset: 0xef0
// Size: 0x56
function private function_5ca455a0(entity) {
    entity val::set(#"brutus_cleanup", "blockingpain", 1);
    entity.var_8a96267d = undefined;
    entity.var_bc0e449a = 1;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x100ab46f, Offset: 0xf50
// Size: 0x2a
function private function_d996f07c(entity) {
    entity notify(#"is_underground");
    entity.var_bc0e449a = undefined;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0xdf967aa8, Offset: 0xf88
// Size: 0xe4
function private function_9d76e96c(entity) {
    entity val::set(#"brutus_cleanup", "allowoffnavmesh", 0);
    entity val::reset(#"brutus_cleanup", "blockingpain");
    entity ghost();
    entity notsolid();
    entity pathmode("dont move", 1);
    entity function_d4c687c9();
    entity clientfield::set("brutus_spawn_clientfield", 0);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0xf81ba9d6, Offset: 0x1078
// Size: 0x2e
function private function_e2ab1df7(entity) {
    entity solid();
    entity.var_8ba6ede3 = undefined;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x9e2af13e, Offset: 0x10b0
// Size: 0xa0
function private function_1bd1ebe7(entity) {
    entity val::reset(#"brutus_cleanup", "allowoffnavmesh");
    entity show();
    entity clientfield::set("brutus_spawn_clientfield", 1);
    entity pathmode("move allowed");
    entity notify(#"not_underground");
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x8e23e06e, Offset: 0x1158
// Size: 0x74
function private function_3006441d(entity) {
    if (!isdefined(entity.var_722a34a3) || !isdefined(entity.var_52e3b294) || distancesquared(entity.var_52e3b294, entity.origin) > 10 * 10) {
        return false;
    }
    return true;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x4a3a1ea4, Offset: 0x11d8
// Size: 0xd4
function private function_4ec678fe(entity) {
    if (!isdefined(entity.var_722a34a3)) {
        return;
    }
    monkeybomb = entity.var_722a34a3;
    level notify(#"hash_79c0225ea09cd215", {#brutus:self, #var_cee6bd0b:monkeybomb.origin, #var_569d804d:monkeybomb.angles});
    if (isdefined(monkeybomb.damagearea)) {
        monkeybomb.damagearea delete();
    }
    monkeybomb delete();
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x627d09cd, Offset: 0x12b8
// Size: 0x140
function private function_3bda3c55(entity) {
    if (entity.var_96b5e3f1 > gettime()) {
        return false;
    }
    if (!isdefined(entity.favoriteenemy)) {
        return false;
    }
    if (!wz_ai_utils::is_player_valid(entity.favoriteenemy)) {
        return false;
    }
    if (abs(entity.origin[2] - entity.favoriteenemy.origin[2]) > 72) {
        return false;
    }
    if (distance2dsquared(entity.origin, entity.favoriteenemy.origin) > entity ai::function_9139c839().var_b4c77cfb * entity ai::function_9139c839().var_b4c77cfb) {
        return false;
    }
    if (lengthsquared(entity.favoriteenemy getvelocity()) > 90 * 90) {
        return false;
    }
    return true;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0xb6c11136, Offset: 0x1400
// Size: 0x4e
function private function_f4a61e6a(entity) {
    entity.var_96b5e3f1 = gettime() + int(entity ai::function_9139c839().var_d5427206 * 1000);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0xce1836dd, Offset: 0x1458
// Size: 0x358
function private function_85e8940a(entity) {
    if (isdefined(entity.var_bc0e449a) && entity.var_bc0e449a) {
        function_9d76e96c(entity);
        return;
    }
    var_aa6baab8 = entity ai::function_9139c839().var_1709a39;
    players = getplayers(#"all", entity.origin, var_aa6baab8);
    shock_status_effect = getstatuseffect(#"hash_19533caf858a9f3b");
    entity clientfield::increment("brutus_shock_attack", 1);
    foreach (player in players) {
        if (!wz_ai_utils::is_player_valid(player)) {
            continue;
        }
        if (player.origin[2] - entity.origin[2] < -32) {
            continue;
        }
        if (player.origin[2] - entity.origin[2] > 200) {
            continue;
        }
        if (!bullettracepassed(entity.origin, player gettagorigin("j_spine4"), 0, entity, player)) {
            continue;
        }
        damage = mapfloat(entity getpathfindingradius() + 15, entity ai::function_9139c839().var_1709a39, entity ai::function_9139c839().var_7ea758e1, 0, distance(entity.origin, player.origin));
        damage = int(max(10, damage));
        player dodamage(damage, entity.origin, entity, entity, "none", "MOD_PROJECTILE_SPLASH");
        player status_effect::status_effect_apply(shock_status_effect, undefined, self, 0);
        player clientfield::increment_to_player("brutus_shock_attack_player", 1);
    }
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x4
// Checksum 0x774a8650, Offset: 0x17b8
// Size: 0x62
function private function_97f51aa3(v_org) {
    grenade = self magicgrenadetype(getweapon(#"willy_pete"), v_org, (0, 0, 0), 0.4);
    grenade.owner = self;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x3d027ac0, Offset: 0x1828
// Size: 0x66
function function_530c54e3() {
    self.hashelmet = 0;
    destructserverutils::function_9885f550(self, "helmet");
    self playsound(#"evt_brutus_helmet");
    if (isalive(self)) {
    }
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 5, eflags: 0x5 linked
// Checksum 0xe3245386, Offset: 0x1898
// Size: 0x98
function private function_55bb9c72(attacker, damage, weapon, var_81dcad68, damagemultiplier) {
    if (!(isdefined(self.hashelmet) && self.hashelmet)) {
        return (damage * var_81dcad68);
    }
    self.helmethits++;
    if (self.helmethits >= self.var_905e4ce2) {
        self function_530c54e3();
    }
    return damage * damagemultiplier;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 11, eflags: 0x5 linked
// Checksum 0x88305978, Offset: 0x1938
// Size: 0x45c
function private function_83a6d3ae(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, poffsettime, boneindex) {
    var_9000ab2 = isdefined(level.brutus_damage_percent) ? level.brutus_damage_percent : 0.5;
    var_81dcad68 = 1.5;
    if (isplayer(attacker) && attacker infection::is_infected()) {
        return 0;
    }
    if (self.var_71ab4927 > gettime()) {
        if (isplayer(attacker)) {
            attacker util::show_hit_marker();
        }
        return 0;
    }
    self player::function_74a5d514(attacker, damage, meansofdeath, weapon, shitloc);
    if (isdefined(weapon) && meansofdeath !== "MOD_DOT") {
        dot_params = function_f74d2943(weapon, 7);
        if (isdefined(dot_params)) {
            status_effect::status_effect_apply(dot_params, weapon, inflictor);
        }
    }
    if (isdefined(inflictor) && !isdefined(self.attackable) && isdefined(inflictor.var_b79a8ac7) && isarray(inflictor.var_b79a8ac7.slots) && isarray(level.var_7fc48a1a) && isinarray(level.var_7fc48a1a, weapon)) {
        if (inflictor wz_ai_utils::get_attackable_slot(self)) {
            self.attackable = inflictor;
        }
    }
    if (isdefined(weapon) && weapon.weapclass == "spread") {
        var_9000ab2 *= 1.2;
        var_81dcad68 *= 1.2;
    }
    final_damage = 0;
    if (isdefined(meansofdeath) && (meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH" || meansofdeath == "MOD_EXPLOSIVE")) {
        if (!isdefined(self.explosivedmgtaken)) {
            self.explosivedmgtaken = 0;
        }
        self.explosivedmgtaken += damage;
        scaler = var_9000ab2;
        if (self.explosivedmgtaken >= self.explosive_dmg_req && isdefined(self.hashelmet) && self.hashelmet) {
            self function_530c54e3();
        }
        final_damage = damage * scaler;
    } else if (shitloc !== "head" && shitloc !== "helmet") {
        final_damage = damage * var_9000ab2;
    } else {
        final_damage = int(self function_55bb9c72(attacker, damage, weapon, var_81dcad68, var_9000ab2));
    }
    /#
        if (isdefined(level.var_85a39c96) && level.var_85a39c96) {
            final_damage = self.health + 1;
        }
    #/
    return final_damage;
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 2, eflags: 0x5 linked
// Checksum 0x22b8e5ae, Offset: 0x1da0
// Size: 0x1dc
function private getclosestnode(entity, nodes) {
    if (nodes.size > 16) {
        filtered_nodes = arraysortclosest(nodes, entity.origin, 16);
    } else {
        filtered_nodes = nodes;
    }
    origins = [];
    foreach (node in filtered_nodes) {
        if (!isdefined(origins)) {
            origins = [];
        } else if (!isarray(origins)) {
            origins = array(origins);
        }
        origins[origins.size] = node.origin;
    }
    pathdata = generatenavmeshpath(entity.origin, origins, entity);
    if (isdefined(pathdata) && pathdata.status === "succeeded") {
        goalpos = pathdata.pathpoints[pathdata.pathpoints.size - 1];
        return arraygetclosest(goalpos, filtered_nodes);
    }
    return arraygetclosest(entity.origin, filtered_nodes);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x83bb10ee, Offset: 0x1f88
// Size: 0x282
function function_b510a832() {
    level endon(#"game_ended");
    self endon(#"death", #"state_changed");
    start_node = getclosestnode(self, self.patrol_path.path);
    start_index = 0;
    foreach (index, node in self.patrol_path.path) {
        if (node == start_node) {
            start_index = index;
            break;
        }
    }
    while (true) {
        for (i = 0; i < self.patrol_path.path.size; i++) {
            var_cf88d3eb = self.patrol_path.path[(start_index + i) % self.patrol_path.path.size];
            next_goal = getclosestpointonnavmesh(var_cf88d3eb.origin, 100, self getpathfindingradius());
            if (!isdefined(next_goal)) {
                break;
            }
            self.var_80780af2 = next_goal;
            self.var_9a79d89d = next_goal;
            waitresult = self waittilltimeout(30, #"goal");
            if (isdefined(self.var_50826790) && self.var_50826790) {
                self.var_ef59b90 = 5;
                self.var_50826790 = 0;
            }
            if (waitresult._notify !== "timeout") {
                idle_time = randomfloatrange(3, 5);
                wait(idle_time);
            }
        }
    }
}

