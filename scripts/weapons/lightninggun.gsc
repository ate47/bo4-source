#using scripts\core_common\util_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\killcam_shared;
#using scripts\core_common\damage;
#using scripts\core_common\callbacks_shared;
#using scripts\abilities\ability_power;

#namespace lightninggun;

// Namespace lightninggun/lightninggun
// Params 0, eflags: 0x0
// Checksum 0xeea45d89, Offset: 0x128
// Size: 0x1fc
function init_shared() {
    level.weaponlightninggun = getweapon(#"hero_lightninggun");
    level.weaponlightninggunarc = getweapon(#"hero_lightninggun_arc");
    level.weaponlightninggunkillcamtime = getdvarfloat(#"scr_lightninggunkillcamtime", 0.35);
    level.weaponlightninggunkillcamdecelpercent = getdvarfloat(#"scr_lightninggunkillcamdecelpercent", 0.25);
    level.weaponlightninggunkillcamoffset = getdvarfloat(#"scr_lightninggunkillcamoffset", 150);
    level.lightninggun_arc_range = 300;
    level.lightninggun_arc_range_sq = level.lightninggun_arc_range * level.lightninggun_arc_range;
    level.lightninggun_arc_speed = 650;
    level.lightninggun_arc_speed_sq = level.lightninggun_arc_speed * level.lightninggun_arc_speed;
    level.lightninggun_arc_fx_min_range = 1;
    level.lightninggun_arc_fx_min_range_sq = level.lightninggun_arc_fx_min_range * level.lightninggun_arc_fx_min_range;
    level._effect[#"lightninggun_arc"] = #"weapon/fx_lightninggun_arc";
    callback::add_weapon_damage(level.weaponlightninggun, &on_damage_lightninggun);
    ability_power::function_9d78823f(level.weaponlightninggun, level.weaponlightninggunarc);
    /#
        level thread update_dvars();
    #/
}

/#

    // Namespace lightninggun/lightninggun
    // Params 0, eflags: 0x0
    // Checksum 0x3aab873f, Offset: 0x330
    // Size: 0xaa
    function update_dvars() {
        while (true) {
            wait 1;
            level.weaponlightninggunkillcamtime = getdvarfloat(#"scr_lightninggunkillcamtime", 0.35);
            level.weaponlightninggunkillcamdecelpercent = getdvarfloat(#"scr_lightninggunkillcamdecelpercent", 0.25);
            level.weaponlightninggunkillcamoffset = getdvarfloat(#"scr_lightninggunkillcamoffset", 150);
        }
    }

#/

// Namespace lightninggun/lightninggun
// Params 1, eflags: 0x0
// Checksum 0x89b0af2b, Offset: 0x3e8
// Size: 0xbc
function lightninggun_start_damage_effects(eattacker) {
    self endon(#"death");
    /#
        if (isgodmode(self)) {
            return;
        }
    #/
    if (isplayer(self)) {
        self setelectrifiedstate(1);
        self.electrifiedby = eattacker;
        self playrumbleonentity("lightninggun_victim");
        wait 2;
        self.electrifiedby = undefined;
        self setelectrifiedstate(0);
    }
}

// Namespace lightninggun/lightninggun
// Params 5, eflags: 0x0
// Checksum 0xb5a94ceb, Offset: 0x4b0
// Size: 0xac
function lightninggun_arc_killcam(arc_source_pos, arc_target, arc_target_pos, original_killcam_ent, waittime) {
    arc_target.killcamkilledbyent = create_killcam_entity(original_killcam_ent.origin, original_killcam_ent.angles, level.weaponlightninggunarc);
    arc_target.killcamkilledbyent killcam::store_killcam_entity_on_entity(original_killcam_ent);
    arc_target.killcamkilledbyent killcam_move(arc_source_pos, arc_target_pos, waittime);
}

// Namespace lightninggun/lightninggun
// Params 5, eflags: 0x0
// Checksum 0x2274b649, Offset: 0x568
// Size: 0x27e
function lightninggun_arc_fx(arc_source_pos, arc_target, arc_target_pos, distancesq, original_killcam_ent) {
    if (!isdefined(arc_target) || !isdefined(original_killcam_ent)) {
        return;
    }
    waittime = 0.25;
    if (level.lightninggun_arc_speed_sq > 100 && distancesq > 1) {
        waittime = distancesq / level.lightninggun_arc_speed_sq;
    }
    lightninggun_arc_killcam(arc_source_pos, arc_target, arc_target_pos, original_killcam_ent, waittime);
    killcamentity = arc_target.killcamkilledbyent;
    if (!isdefined(arc_target) || !isdefined(original_killcam_ent)) {
        return;
    }
    if (distancesq < level.lightninggun_arc_fx_min_range_sq) {
        wait waittime;
        killcamentity delete();
        if (isdefined(arc_target)) {
            arc_target.killcamkilledbyent = undefined;
        }
        return;
    }
    fxorg = spawn("script_model", arc_source_pos);
    fxorg setmodel(#"tag_origin");
    fx = playfxontag(level._effect[#"lightninggun_arc"], fxorg, "tag_origin");
    playsoundatposition(#"wpn_lightning_gun_bounce", fxorg.origin);
    fxorg moveto(arc_target_pos, waittime);
    fxorg waittill(#"movedone");
    util::wait_network_frame();
    util::wait_network_frame();
    util::wait_network_frame();
    fxorg delete();
    killcamentity delete();
    if (isdefined(arc_target)) {
        arc_target.killcamkilledbyent = undefined;
    }
}

// Namespace lightninggun/lightninggun
// Params 8, eflags: 0x0
// Checksum 0x270a2ace, Offset: 0x7f0
// Size: 0x15c
function lightninggun_arc(delay, eattacker, arc_source, arc_source_origin, arc_source_pos, arc_target, arc_target_pos, distancesq) {
    if (delay) {
        wait delay;
        if (!isdefined(arc_target) || !isalive(arc_target)) {
            return;
        }
        distancesq = distancesquared(arc_target.origin, arc_source_origin);
        if (distancesq > level.lightninggun_arc_range_sq) {
            return;
        }
    }
    killcamkilledbyent = undefined;
    if (isdefined(arc_source)) {
        killcamkilledbyent = arc_source.killcamkilledbyent;
    }
    level thread lightninggun_arc_fx(arc_source_pos, arc_target, arc_target_pos, distancesq, killcamkilledbyent);
    arc_target thread lightninggun_start_damage_effects(eattacker);
    arc_target dodamage(arc_target.health, arc_source_pos, eattacker, arc_source, "none", "MOD_PISTOL_BULLET", 0, level.weaponlightninggunarc);
}

// Namespace lightninggun/lightninggun
// Params 4, eflags: 0x0
// Checksum 0xb337d9d0, Offset: 0x958
// Size: 0x3f0
function lightninggun_find_arc_targets(eattacker, arc_source, arc_source_origin, arc_source_pos) {
    delay = 0.05;
    players = getplayers();
    allenemyaliveplayers = [];
    foreach (player in players) {
        if (util::function_fbce7263(player.team, eattacker.team)) {
            allenemyaliveplayers[allenemyaliveplayers.size] = player;
        }
    }
    enemy_team = util::get_enemy_team(eattacker.team);
    var_40e74cb7 = getactorteamarray(enemy_team);
    var_6249210e = arraycombine(allenemyaliveplayers, var_40e74cb7, 0, 0);
    enemyai = getaiarray();
    var_6249210e = arraycombine(var_6249210e, enemyai, 0, 0);
    closestenemies = arraysort(var_6249210e, arc_source_origin, 1);
    foreach (enemy in closestenemies) {
        if (isdefined(arc_source) && enemy == arc_source) {
            continue;
        }
        if (isplayer(enemy) && enemy player::is_spawn_protected()) {
            continue;
        }
        distancesq = distancesquared(enemy.origin, arc_source_origin);
        if (distancesq > level.lightninggun_arc_range_sq) {
            break;
        }
        if (eattacker != enemy && damage::friendlyfirecheck(eattacker, enemy)) {
            if (isdefined(self) && !enemy damageconetrace(arc_source_pos, self)) {
                continue;
            }
            if (isplayer(enemy)) {
                tagorigin = enemy gettagorigin("j_spineupper");
            } else if (enemy.archetype === "mp_dog") {
                tagorigin = enemy gettagorigin("j_neck1");
            } else {
                tagorigin = enemy.origin;
            }
            level thread lightninggun_arc(delay, eattacker, arc_source, arc_source_origin, arc_source_pos, enemy, tagorigin, distancesq);
            delay += 0.05;
        }
    }
}

// Namespace lightninggun/lightninggun
// Params 3, eflags: 0x0
// Checksum 0x3f620d1d, Offset: 0xd50
// Size: 0x88
function create_killcam_entity(origin, angles, weapon) {
    killcamkilledbyent = spawn("script_model", origin);
    killcamkilledbyent setmodel(#"tag_origin");
    killcamkilledbyent.angles = angles;
    killcamkilledbyent setweapon(weapon);
    return killcamkilledbyent;
}

// Namespace lightninggun/lightninggun
// Params 3, eflags: 0x0
// Checksum 0x4d04507e, Offset: 0xde0
// Size: 0x12e
function killcam_move(start_origin, end_origin, time) {
    delta = end_origin - start_origin;
    dist = length(delta);
    delta = vectornormalize(delta);
    move_to_dist = dist - level.weaponlightninggunkillcamoffset;
    end_angles = (0, 0, 0);
    if (move_to_dist > 0) {
        move_to_pos = start_origin + delta * move_to_dist;
        self moveto(move_to_pos, time, 0, time * level.weaponlightninggunkillcamdecelpercent);
        end_angles = vectortoangles(delta);
        return;
    }
    delta = end_origin - self.origin;
    end_angles = vectortoangles(delta);
}

// Namespace lightninggun/lightninggun
// Params 5, eflags: 0x0
// Checksum 0xd83279bd, Offset: 0xf18
// Size: 0x2de
function lightninggun_damage_response(eattacker, einflictor, weapon, meansofdeath, damage) {
    source_pos = eattacker.origin;
    bolt_source_pos = eattacker gettagorigin("tag_flash");
    arc_source = self;
    arc_source_origin = self.origin;
    if (isplayer(self)) {
        arc_source_pos = self gettagorigin("j_spineupper");
    } else if (self.archetype === "mp_dog") {
        arc_source_pos = self gettagorigin("j_neck1");
    } else {
        arc_source_pos = self.origin;
    }
    delta = arc_source_pos - bolt_source_pos;
    angles = (0, 0, 0);
    if (isplayer(self)) {
        arc_source.killcamkilledbyent = create_killcam_entity(bolt_source_pos, angles, weapon);
        arc_source.killcamkilledbyent killcam_move(bolt_source_pos, arc_source_pos, level.weaponlightninggunkillcamtime);
        killcamentity = arc_source.killcamkilledbyent;
    }
    self thread lightninggun_start_damage_effects(eattacker);
    if (self.archetype === "mp_dog") {
        self dodamage(self.health, source_pos, eattacker, einflictor, "none", "MOD_PISTOL_BULLET", 0, level.weaponlightninggunarc);
    }
    wait 2;
    if (isdefined(self) && isdefined(self.body)) {
        arc_source_origin = self.body.origin;
        arc_source_pos = self.body gettagorigin("j_spineupper");
    }
    self thread lightninggun_find_arc_targets(eattacker, arc_source, arc_source_origin, arc_source_pos);
    if (isdefined(killcamentity)) {
        wait 0.45;
        killcamentity delete();
        if (isdefined(arc_source)) {
            arc_source.killcamkilledbyent = undefined;
        }
    }
}

// Namespace lightninggun/lightninggun
// Params 5, eflags: 0x0
// Checksum 0xadc7145f, Offset: 0x1200
// Size: 0x74
function on_damage_lightninggun(eattacker, einflictor, weapon, meansofdeath, damage) {
    if ("MOD_PISTOL_BULLET" != meansofdeath && "MOD_HEAD_SHOT" != meansofdeath) {
        return;
    }
    self thread lightninggun_damage_response(eattacker, einflictor, weapon, meansofdeath, damage);
}

