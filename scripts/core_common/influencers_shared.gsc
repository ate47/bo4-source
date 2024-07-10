#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace influencers;

// Namespace influencers/influencers_shared
// Params 0, eflags: 0x2
// Checksum 0xd806c429, Offset: 0xf0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"influencers_shared", &__init__, undefined, undefined);
}

// Namespace influencers/influencers_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xa71ca70b, Offset: 0x138
// Size: 0x8c
function __init__() {
    if (!isdefined(level.var_3d984b4c)) {
        level.var_3d984b4c = 1;
    }
    if (level.var_3d984b4c) {
        callback::on_connecting(&onplayerconnect);
        callback::on_joined_team(&on_joined_team);
        callback::on_spawned(&onplayerspawned);
    }
}

// Namespace influencers/influencers_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5f8c42b, Offset: 0x1d0
// Size: 0x34
function onplayerspawned() {
    removeallinfluencersfromentity(self);
    self create_player_influencers();
}

// Namespace influencers/influencers_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x85a634be, Offset: 0x210
// Size: 0x5c
function onplayerconnect() {
    level endon(#"game_ended");
    self callback::on_grenade_fired(&on_grenade_fired);
    self callback::on_death(&on_player_death);
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xabddfbbf, Offset: 0x278
// Size: 0x54
function on_player_death(params) {
    if (game.state != "playing") {
        return;
    }
    level create_friendly_influencer("friend_dead", self.origin, self.team);
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9b800ee, Offset: 0x2d8
// Size: 0x16
function on_joined_team(params) {
    self.lastspawnpoint = undefined;
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9f5c575f, Offset: 0x2f8
// Size: 0x74
function on_grenade_fired(params) {
    grenade = params.projectile;
    weapon = params.weapon;
    level thread create_grenade_influencers(self.pers[#"team"], weapon, grenade);
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xdab27c90, Offset: 0x378
// Size: 0x52
function get_friendly_team_mask(team) {
    if (level.teambased) {
        team_mask = util::getteammask(team);
    } else {
        team_mask = level.spawnsystem.ispawn_teammask_free;
    }
    return team_mask;
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xcc63ba13, Offset: 0x3d8
// Size: 0x52
function get_enemy_team_mask(team) {
    if (level.teambased) {
        team_mask = util::getotherteamsmask(team);
    } else {
        team_mask = level.spawnsystem.ispawn_teammask_free;
    }
    return team_mask;
}

// Namespace influencers/influencers_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x50e9677, Offset: 0x438
// Size: 0xf0
function private add_influencer_tracker(influencer, name) {
    if (!isdefined(self.influencers)) {
        self.influencers = [];
    }
    if (!isdefined(self.influencers[name])) {
        self.influencers[name] = [];
    }
    if (!isdefined(self.influencers[name])) {
        self.influencers[name] = [];
    } else if (!isarray(self.influencers[name])) {
        self.influencers[name] = array(self.influencers[name]);
    }
    self.influencers[name][self.influencers[name].size] = influencer;
}

// Namespace influencers/influencers_shared
// Params 4, eflags: 0x0
// Checksum 0x1866f88e, Offset: 0x530
// Size: 0x168
function create_influencer_generic(str_name, origin_or_entity, str_team, is_for_enemy = 0) {
    if (str_team === #"any") {
        team_mask = level.spawnsystem.ispawn_teammask[#"all"];
    } else if (is_for_enemy) {
        team_mask = self get_enemy_team_mask(str_team);
    } else {
        team_mask = self get_friendly_team_mask(str_team);
    }
    if (isentity(origin_or_entity)) {
        influencer = addentityinfluencer(str_name, origin_or_entity, team_mask);
    } else if (isvec(origin_or_entity)) {
        influencer = addinfluencer(str_name, origin_or_entity, team_mask);
    }
    if (!isentity(origin_or_entity)) {
        self add_influencer_tracker(influencer, str_name);
    }
    return influencer;
}

// Namespace influencers/influencers_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x1eff53df, Offset: 0x6a0
// Size: 0x3a
function create_influencer(name, origin, team_mask) {
    return addinfluencer(name, origin, team_mask);
}

// Namespace influencers/influencers_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x3dfcf016, Offset: 0x6e8
// Size: 0x6a
function create_friendly_influencer(name, origin, team) {
    team_mask = self get_friendly_team_mask(team);
    influencer = create_influencer(name, origin, team_mask);
    return influencer;
}

// Namespace influencers/influencers_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xc6a67494, Offset: 0x760
// Size: 0x6a
function create_enemy_influencer(name, origin, team) {
    team_mask = self get_enemy_team_mask(team);
    influencer = create_influencer(name, origin, team_mask);
    return influencer;
}

// Namespace influencers/influencers_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x304823fa, Offset: 0x7d8
// Size: 0x2a
function create_entity_influencer(name, team_mask) {
    return addentityinfluencer(name, self, team_mask);
}

// Namespace influencers/influencers_shared
// Params 3, eflags: 0x0
// Checksum 0x786f3272, Offset: 0x810
// Size: 0x3a
function function_f15009ad(name, origin, var_f317c70c) {
    return function_a116c91b(name, origin, var_f317c70c);
}

// Namespace influencers/influencers_shared
// Params 2, eflags: 0x0
// Checksum 0xbdbe7d95, Offset: 0x858
// Size: 0x52
function create_entity_friendly_influencer(name, team) {
    team_mask = self get_friendly_team_mask(team);
    return self create_entity_influencer(name, team_mask);
}

// Namespace influencers/influencers_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x7c21fa7f, Offset: 0x8b8
// Size: 0x52
function create_entity_enemy_influencer(name, team) {
    team_mask = self get_enemy_team_mask(team);
    return self create_entity_influencer(name, team_mask);
}

// Namespace influencers/influencers_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xecb5472e, Offset: 0x918
// Size: 0x1d2
function create_player_influencers() {
    if (!isdefined(self.pers[#"team"]) || self.pers[#"team"] == #"spectator") {
        return;
    }
    if (self.influencers_created === 0) {
        return;
    }
    if (!level.teambased) {
        team_mask = level.spawnsystem.ispawn_teammask_free;
        enemy_teams_mask = level.spawnsystem.ispawn_teammask_free;
    } else if (isdefined(self.pers[#"team"])) {
        team = self.pers[#"team"];
        team_mask = util::getteammask(team);
        enemy_teams_mask = util::getotherteamsmask(team);
    } else {
        team_mask = 0;
        enemy_teams_mask = 0;
    }
    angles = self.angles;
    origin = self.origin;
    up = (0, 0, 1);
    forward = (1, 0, 0);
    self create_entity_influencer("enemy", enemy_teams_mask);
    if (level.teambased) {
        self create_entity_influencer("friend", team_mask);
    }
    self.influencers_created = 1;
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa375fa43, Offset: 0xaf8
// Size: 0x7c
function create_player_spawn_influencers(spawn_origin) {
    level create_enemy_influencer("enemy_spawn", spawn_origin, self.pers[#"team"]);
    level create_friendly_influencer("friendly_spawn", spawn_origin, self.pers[#"team"]);
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x86524ebb, Offset: 0xb80
// Size: 0x90
function private remove_influencer_tracking(to_be_removed) {
    if (isdefined(self.influencers)) {
        foreach (influencer_name_array in self.influencers) {
            arrayremovevalue(influencer_name_array, to_be_removed);
        }
    }
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x763f31ac, Offset: 0xc18
// Size: 0x9a
function private is_influencer_tracked(influencer) {
    if (isdefined(self.influencers)) {
        foreach (influencer_name_array in self.influencers) {
            if (isinarray(influencer_name_array, influencer)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x29013508, Offset: 0xcc0
// Size: 0x54
function remove_influencer(to_be_removed) {
    if (is_influencer_tracked(to_be_removed)) {
        self remove_influencer_tracking(to_be_removed);
    }
    removeinfluencer(to_be_removed);
}

// Namespace influencers/influencers_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6dc23ee6, Offset: 0xd20
// Size: 0x146
function remove_influencers() {
    if (!isdefined(self)) {
        return;
    }
    if (isentity(self)) {
        removeallinfluencersfromentity(self);
    } else if (isdefined(self.influencers)) {
        foreach (influencer_name_array in self.influencers) {
            foreach (influencer in influencer_name_array) {
                self remove_influencer_tracking(influencer);
                removeinfluencer(influencer);
            }
        }
    }
    self.influencers = [];
}

// Namespace influencers/influencers_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x84dbb377, Offset: 0xe70
// Size: 0x12c
function create_grenade_influencers(parent_team, weapon, grenade) {
    pixbeginevent(#"create_grenade_influencers");
    spawn_influencer = weapon.spawninfluencer;
    if (isdefined(grenade.origin) && spawn_influencer != "" && isdefined(level.spawnsystem)) {
        if (!level.teambased || !isdefined(parent_team)) {
            weapon_team_mask = level.spawnsystem.ispawn_teammask_free;
        } else {
            weapon_team_mask = util::getotherteamsmask(parent_team);
            if (level.friendlyfire) {
                weapon_team_mask |= util::getteammask(parent_team);
            }
        }
        grenade create_entity_influencer(spawn_influencer, weapon_team_mask);
    }
    pixendevent();
}

// Namespace influencers/influencers_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x605b9b15, Offset: 0xfa8
// Size: 0x7e
function create_map_placed_influencers() {
    staticinfluencerents = getentarray("mp_uspawn_influencer", "classname");
    for (i = 0; i < staticinfluencerents.size; i++) {
        staticinfluencerent = staticinfluencerents[i];
        create_map_placed_influencer(staticinfluencerent);
    }
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x4a7665f9, Offset: 0x1030
// Size: 0xa0
function create_map_placed_influencer(influencer_entity) {
    influencer_id = -1;
    if (isdefined(influencer_entity.script_noteworty)) {
        team_mask = util::getteammask(influencer_entity.script_team);
        level create_enemy_influencer(influencer_entity.script_noteworty, influencer_entity.origin, team_mask);
    } else {
        assertmsg("<dev string:x38>");
    }
    return influencer_id;
}

// Namespace influencers/influencers_shared
// Params 1, eflags: 0x0
// Checksum 0x6cf771d8, Offset: 0x10d8
// Size: 0xba
function create_turret_influencer(name) {
    turret = self;
    preset = getinfluencerpreset(name);
    if (!isdefined(preset)) {
        return;
    }
    projected_point = turret.origin + vectorscale(anglestoforward(turret.angles), preset[#"radius"] * 0.7);
    return create_enemy_influencer(name, turret.origin, turret.team);
}

