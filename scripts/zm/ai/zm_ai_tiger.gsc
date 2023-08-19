// Atian COD Tools GSC decompiler test
#include scripts/zm_common/ai/zm_ai_utility.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_spawner.gsc;
#include scripts/zm_common/zm_score.gsc;
#include scripts/zm_common/zm_player.gsc;
#include scripts/zm_common/zm_behavior.gsc;
#include scripts/zm_common/zm_audio.gsc;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/ai/archetype_tiger.gsc;
#include script_3aa0f32b70d4f7cb;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/spawner_shared.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/aat_shared.gsc;

#namespace zm_ai_tiger;

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x2
// Checksum 0x8a353d1a, Offset: 0x150
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_tiger", &__init__, &__main__, undefined);
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0xb9862c60, Offset: 0x1a0
// Size: 0x12c
function __init__() {
    clientfield::register("toplayer", "" + #"hash_14c746e550d9f3ca", 1, 2, "counter");
    function_d5ccdca1();
    zm_player::register_player_damage_callback(&function_9808e44f);
    spawner::add_archetype_spawn_function(#"tiger", &tiger_init);
    /#
        spawner::add_archetype_spawn_function(#"tiger", &zombie_utility::updateanimationrate);
    #/
    /#
        if (!zm_score::function_e5ca5733(#"tiger")) {
            zm_score::function_e5d6e6dd(#"tiger", 60);
        }
    #/
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x2d8
// Size: 0x4
function __main__() {
    
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x5 linked
// Checksum 0x710542d1, Offset: 0x2e8
// Size: 0x144
function private function_d5ccdca1() {
    /#
        assert(isscriptfunctionptr(&function_10687511));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"zmtigertargetservice", &function_10687511, 1);
    /#
        assert(isscriptfunctionptr(&function_8709c761));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"zmtigershouldmelee", &function_8709c761);
    /#
        assert(isscriptfunctionptr(&function_6c513e36));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_70607ec85c34b86f", &function_6c513e36);
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 1, eflags: 0x5 linked
// Checksum 0xce093700, Offset: 0x438
// Size: 0x572
function private function_10687511(entity) {
    if (isdefined(entity.ignoreall) && entity.ignoreall) {
        return 0;
    }
    if (isdefined(entity.disabletargetservice) && entity.disabletargetservice) {
        return 0;
    }
    if (entity.team == #"allies") {
        entity function_cd6f239();
        if (isdefined(entity.favoriteenemy)) {
            return entity zm_utility::function_64259898(entity.favoriteenemy.origin, 128);
        }
        return 0;
    }
    zombie_poi = entity zm_utility::get_zombie_point_of_interest(entity.origin);
    entity zombie_utility::run_ignore_player_handler();
    entity.favoriteenemy = entity.var_93a62fe;
    if (isdefined(zombie_poi) && isdefined(zombie_poi[1])) {
        goalpos = zombie_poi[0];
        return entity zm_utility::function_64259898(goalpos, 128);
    }
    if (isdefined(entity.var_4dc477c) && entity.var_4dc477c) {
        entity.favoriteenemy = undefined;
    }
    if (!isdefined(entity.favoriteenemy) || zm_behavior::zombieshouldmoveawaycondition(entity)) {
        zone = zm_utility::get_current_zone();
        if (isdefined(zone)) {
            wait_locations = level.zones[zone].a_loc_types[#"wait_location"];
            if (isdefined(wait_locations) && wait_locations.size > 0) {
                return entity zm_utility::function_64259898(wait_locations[0].origin, 128);
            }
        }
        entity setgoal(entity.origin);
        return 0;
    }
    if (!(isdefined(entity.hasseenfavoriteenemy) && entity.hasseenfavoriteenemy)) {
        if (isdefined(entity.favoriteenemy) && entity tigerbehavior::need_to_run()) {
            entity.hasseenfavoriteenemy = 1;
            entity setblackboardattribute("_seen_enemy", "has_seen");
        }
    }
    /#
        if (entity.favoriteenemy isnotarget()) {
            entity setgoal(entity.origin);
            return 0;
        }
    #/
    var_eef1279d = 0;
    if (distancesquared(entity.origin, entity.favoriteenemy.origin) >= 400 * 400) {
        var_eef1279d = 1;
    }
    if (var_eef1279d && entity function_8d4da9d6() && !(isdefined(entity.var_cc94acec) && entity.var_cc94acec) && isdefined(entity.hasseenfavoriteenemy) && entity.hasseenfavoriteenemy) {
        if (!isdefined(entity.var_aaeee932)) {
            entity.var_aaeee932 = 0;
            if (math::cointoss()) {
                entity.var_aaeee932 = 2;
            }
        }
        entity function_4703be8a();
    }
    if (isdefined(entity.var_cc94acec) && entity.var_cc94acec && !(isdefined(entity.var_b11272e3) && entity.var_b11272e3)) {
        self function_a57c34b7(entity.var_826049b6);
        if (distancesquared(entity.origin, entity.var_826049b6) <= 64 * 64) {
            entity.var_b11272e3 = 1;
            self function_d4c687c9();
        }
        return 1;
    }
    goalent = entity.favoriteenemy;
    if (isplayer(goalent)) {
        goalent = zm_ai_utility::function_a2e8fd7b(entity, entity.favoriteenemy);
    }
    return entity zm_utility::function_64259898(goalent.origin, 128);
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x5 linked
// Checksum 0xb17c44f6, Offset: 0x9b8
// Size: 0x224
function private function_4703be8a() {
    var_77f4782e = 45;
    if (isdefined(self.var_aaeee932)) {
        if (self.var_aaeee932 == 0) {
            var_77f4782e = -45;
        } else if (self.var_aaeee932 == 1) {
            var_77f4782e = -22.5;
        } else if (self.var_aaeee932 == 3) {
            var_77f4782e = 22.5;
        }
        self.var_aaeee932++;
        if (self.var_aaeee932 > 3) {
            self.var_aaeee932 = 0;
        }
    }
    enemy = self.favoriteenemy;
    var_4a8dc744 = vectortoangles(self.origin - self.favoriteenemy.origin)[1];
    var_36294491 = absangleclamp360(var_4a8dc744 + var_77f4782e);
    var_ef2595f9 = anglestoforward((0, var_36294491, 0));
    var_9b0fde6d = enemy.origin + var_ef2595f9 * 400;
    var_b4a11ac2 = getclosestpointonnavmesh(var_9b0fde6d, 128, self getpathfindingradius());
    if (isdefined(var_b4a11ac2)) {
        path_success = self findpath(self.origin, var_b4a11ac2, 1, 0);
        if (path_success) {
            self.var_826049b6 = var_b4a11ac2;
            self.var_cc94acec = 1;
            /#
                recordsphere(self.var_826049b6, 3, (0, 1, 0), "<unknown string>");
            #/
            return 1;
        }
    }
    return 0;
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x5 linked
// Checksum 0x988f071d, Offset: 0xbe8
// Size: 0x1a
function private function_8d4da9d6() {
    if (gettime() > self.var_86152978) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0x9df33898, Offset: 0xc10
// Size: 0x1aa
function function_cd6f239() {
    zombies = getaispeciesarray(level.zombie_team, "all");
    zombie_enemy = undefined;
    closest_dist = undefined;
    foreach (zombie in zombies) {
        if (isalive(zombie) && isdefined(zombie.completed_emerging_into_playable_area) && zombie.completed_emerging_into_playable_area && !zm_utility::is_magic_bullet_shield_enabled(zombie) && (isdefined(zombie.canbetargetedbyturnedzombies) && zombie.canbetargetedbyturnedzombies || isdefined(zombie.var_8c28b842) && zombie.var_8c28b842)) {
            dist = distancesquared(self.origin, zombie.origin);
            if (!isdefined(closest_dist) || dist < closest_dist) {
                closest_dist = dist;
                zombie_enemy = zombie;
            }
        }
    }
    self.favoriteenemy = zombie_enemy;
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0x6e9da1d1, Offset: 0xdc8
// Size: 0x76
function function_8709c761(entity) {
    if (isdefined(entity.var_d96b3fd4) && entity.var_d96b3fd4) {
        return 0;
    }
    if (!entity tigerbehavior::function_8de56915(102 * 102)) {
        return 0;
    }
    if (zm_ai_utility::function_54054394(entity)) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0x16f8f8ae, Offset: 0xe48
// Size: 0x16e
function function_6c513e36(entity) {
    if (!entity tigerbehavior::function_8de56915(180 * 180)) {
        return 0;
    }
    if (isdefined(entity.var_d96b3fd4) && entity.var_d96b3fd4) {
        entity.var_d96b3fd4 = 0;
        return 1;
    }
    if (!entity cansee(entity.favoriteenemy)) {
        return 0;
    }
    if (distancesquared(entity.origin, entity.favoriteenemy.origin) < 40 * 40) {
        return 1;
    }
    if (zm_ai_utility::function_54054394(entity)) {
        return 0;
    }
    if (!tracepassedonnavmesh(entity.origin, isdefined(entity.favoriteenemy.last_valid_position) ? entity.favoriteenemy.last_valid_position : entity.favoriteenemy.origin, entity.favoriteenemy getpathfindingradius())) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0x46c50cfd, Offset: 0xfc0
// Size: 0x23a
function tiger_init() {
    self.allowdeath = 1;
    self.allowpain = 0;
    self.force_gib = 1;
    self.is_zombie = 1;
    self.gibbed = 0;
    self.head_gibbed = 0;
    self.default_goalheight = 40;
    self.ignore_inert = 1;
    self.holdfire = 1;
    self.var_11b4c057 = 1;
    self.grenadeawareness = 0;
    self.badplaceawareness = 0;
    self.ignoresuppression = 1;
    self.suppressionthreshold = 1;
    self.dontshootwhilemoving = 1;
    self.pathenemylookahead = 0;
    self.badplaceawareness = 0;
    self.chatinitialized = 0;
    self.b_ignore_cleanup = 1;
    self.team = level.zombie_team;
    self.var_8c28b842 = 1;
    self.var_7672fb41 = 1;
    self.ignorepathenemyfightdist = 1;
    self allowpitchangle(1);
    self setpitchorient();
    self setavoidancemask("avoid ai");
    self collidewithactors(1);
    self.closest_player_override = &zm_utility::function_c52e1749;
    self thread zombie_utility::round_spawn_failsafe();
    level thread zm_spawner::zombie_death_event(self);
    self callback::function_d8abfc3d(#"on_ai_killed", &on_tiger_killed);
    self thread zm_audio::zmbaivox_notifyconvert();
    self thread zm_audio::play_ambient_zombie_vocals();
    self.deathfunction = &zm_spawner::zombie_death_animscript;
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0x5a50845e, Offset: 0x1208
// Size: 0x54
function on_tiger_killed(params) {
    self val::set(#"zm_ai_tiger", "hide", 1);
    self notsolid();
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 10, eflags: 0x1 linked
// Checksum 0x165414b1, Offset: 0x1268
// Size: 0xe8
function function_9808e44f(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime) {
    if (isdefined(eattacker) && isai(eattacker) && eattacker.archetype == #"tiger" && eattacker.team != self.team) {
        if (isdefined(eattacker.var_d6c43d9b)) {
            self function_8fc19416(eattacker.var_d6c43d9b);
        }
    }
    return -1;
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0x30ebe2c6, Offset: 0x1358
// Size: 0xa2
function function_8fc19416(notetrack) {
    switch (notetrack) {
    case #"tiger_melee_left":
        self clientfield::increment_to_player("" + #"hash_14c746e550d9f3ca", 2);
        break;
    case #"tiger_melee_right":
        self clientfield::increment_to_player("" + #"hash_14c746e550d9f3ca", 1);
        break;
    }
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0x72ade929, Offset: 0x1408
// Size: 0x138
function get_favorite_enemy() {
    var_7c746996 = getplayers();
    least_hunted = var_7c746996[0];
    for (i = 0; i < var_7c746996.size; i++) {
        if (!isdefined(var_7c746996[i].hunted_by)) {
            var_7c746996[i].hunted_by = 0;
        }
        if (!zm_utility::is_player_valid(var_7c746996[i])) {
            continue;
        }
        if (!zm_utility::is_player_valid(least_hunted)) {
            least_hunted = var_7c746996[i];
        }
        if (var_7c746996[i].hunted_by < least_hunted.hunted_by) {
            least_hunted = var_7c746996[i];
        }
    }
    if (!zm_utility::is_player_valid(least_hunted)) {
        return undefined;
    } else {
        least_hunted.hunted_by = least_hunted.hunted_by + 1;
        return least_hunted;
    }
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x0
// Checksum 0xd958cc7e, Offset: 0x1548
// Size: 0x68
function function_c436ab98() {
    self endon(#"death");
    while (1) {
        if (!zm_utility::is_player_valid(self.favoriteenemy)) {
            self.favoriteenemy = get_favorite_enemy();
        }
        wait(0.2);
    }
}

