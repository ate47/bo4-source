#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;

#namespace bouncingbetty;

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0xa6e9effe, Offset: 0x150
// Size: 0x374
function init_shared() {
    level.bettydestroyedfx = #"weapon/fx_betty_exp_destroyed";
    level._effect[#"fx_betty_friendly_light"] = #"hash_5f76ecd582d98e38";
    level._effect[#"fx_betty_enemy_light"] = #"hash_330682ff4f12f646";
    level.bettymindist = 20;
    level.bettystuntime = 1;
    bettyexplodeanim = "o_spider_mine_detonate";
    bettydeployanim = "o_spider_mine_deploy";
    level.bettyradius = getdvarint(#"betty_detect_radius", 180);
    level.bettyactivationdelay = getdvarfloat(#"betty_activation_delay", 1);
    level.bettygraceperiod = getdvarfloat(#"betty_grace_period", 0);
    level.bettydamageradius = getdvarint(#"betty_damage_radius", 180);
    level.bettydamagemax = getdvarint(#"betty_damage_max", 180);
    level.bettydamagemin = getdvarint(#"betty_damage_min", 70);
    level.bettydamageheight = getdvarint(#"betty_damage_cylinder_height", 200);
    level.bettyjumpheight = getdvarint(#"betty_jump_height_onground", 55);
    level.bettyjumpheightwall = getdvarint(#"betty_jump_height_wall", 20);
    level.bettyjumpheightwallangle = getdvarint(#"betty_onground_angle_threshold", 30);
    level.bettyjumpheightwallanglecos = cos(level.bettyjumpheightwallangle);
    level.bettyjumptime = getdvarfloat(#"betty_jump_time", 0.7);
    level.bettybombletspawndistance = 20;
    level.bettybombletcount = 4;
    level thread register();
    /#
        level thread bouncingbettydvarupdate();
    #/
    weaponobjects::function_e6400478(#"bouncingbetty", &createbouncingbettywatcher, 0);
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0xdf43adc3, Offset: 0x4d0
// Size: 0x64
function register() {
    clientfield::register("missile", "bouncingbetty_state", 1, 2, "int");
    clientfield::register("scriptmover", "bouncingbetty_state", 1, 2, "int");
}

/#

    // Namespace bouncingbetty/bouncingbetty
    // Params 0, eflags: 0x0
    // Checksum 0xd1d7279c, Offset: 0x540
    // Size: 0x2a0
    function bouncingbettydvarupdate() {
        for (;;) {
            level.bettyradius = getdvarint(#"betty_detect_radius", level.bettyradius);
            level.bettyactivationdelay = getdvarfloat(#"betty_activation_delay", level.bettyactivationdelay);
            level.bettygraceperiod = getdvarfloat(#"betty_grace_period", level.bettygraceperiod);
            level.bettydamageradius = getdvarint(#"betty_damage_radius", level.bettydamageradius);
            level.bettydamagemax = getdvarint(#"betty_damage_max", level.bettydamagemax);
            level.bettydamagemin = getdvarint(#"betty_damage_min", level.bettydamagemin);
            level.bettydamageheight = getdvarint(#"betty_damage_cylinder_height", level.bettydamageheight);
            level.bettyjumpheight = getdvarint(#"betty_jump_height_onground", level.bettyjumpheight);
            level.bettyjumpheightwall = getdvarint(#"betty_jump_height_wall", level.bettyjumpheightwall);
            level.bettyjumpheightwallangle = getdvarint(#"betty_onground_angle_threshold", level.bettyjumpheightwallangle);
            level.bettyjumpheightwallanglecos = cos(level.bettyjumpheightwallangle);
            level.bettyjumptime = getdvarfloat(#"betty_jump_time", level.bettyjumptime);
            wait(3);
        }
    }

#/

// Namespace bouncingbetty/bouncingbetty
// Params 1, eflags: 0x1 linked
// Checksum 0xab9cd39e, Offset: 0x7e8
// Size: 0x176
function createbouncingbettywatcher(watcher) {
    watcher.onspawn = &onspawnbouncingbetty;
    watcher.watchforfire = 1;
    watcher.ondetonatecallback = &bouncingbettydetonate;
    watcher.activatesound = #"wpn_betty_alert";
    watcher.hackable = 1;
    watcher.hackertoolradius = level.equipmenthackertoolradius;
    watcher.hackertooltimems = level.equipmenthackertooltimems;
    watcher.ownergetsassist = 1;
    watcher.ignoredirection = 1;
    watcher.immediatedetonation = 1;
    watcher.immunespecialty = "specialty_immunetriggerbetty";
    watcher.detectionmindist = level.bettymindist;
    watcher.detectiongraceperiod = level.bettygraceperiod;
    watcher.detonateradius = level.bettyradius;
    watcher.onfizzleout = &onbouncingbettyfizzleout;
    watcher.stun = &weaponobjects::weaponstun;
    watcher.stuntime = level.bettystuntime;
    watcher.activationdelay = level.bettyactivationdelay;
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0x2de4e08f, Offset: 0x968
// Size: 0x74
function onbouncingbettyfizzleout() {
    if (isdefined(self.minemover)) {
        if (isdefined(self.minemover.killcament)) {
            self.minemover.killcament delete();
        }
        self.minemover delete();
    }
    self delete();
}

// Namespace bouncingbetty/bouncingbetty
// Params 2, eflags: 0x1 linked
// Checksum 0x9296d9b4, Offset: 0x9e8
// Size: 0xac
function onspawnbouncingbetty(watcher, owner) {
    weaponobjects::onspawnproximityweaponobject(watcher, owner);
    self.originalowner = owner;
    self thread spawnminemover();
    self trackonowner(owner);
    self thread trackusedstatondeath();
    self thread donotrackusedstatonpickup();
    self thread trackusedonhack();
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0x8cbbc8a7, Offset: 0xaa0
// Size: 0x66
function trackusedstatondeath() {
    self endon(#"do_not_track_used");
    self waittill(#"death");
    waittillframeend();
    self.owner trackbouncingbettyasused();
    self notify(#"end_donotrackusedonpickup");
    self notify(#"end_donotrackusedonhacked");
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0xceb54864, Offset: 0xb10
// Size: 0x3e
function donotrackusedstatonpickup() {
    self endon(#"end_donotrackusedonpickup");
    self waittill(#"picked_up");
    self notify(#"do_not_track_used");
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0xc1098234, Offset: 0xb58
// Size: 0x56
function trackusedonhack() {
    self endon(#"end_donotrackusedonhacked");
    self waittill(#"hacked");
    self.originalowner trackbouncingbettyasused();
    self notify(#"do_not_track_used");
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0x3f94da74, Offset: 0xbb8
// Size: 0x64
function trackbouncingbettyasused() {
    if (isplayer(self)) {
        self stats::function_e24eec31(getweapon(#"bouncingbetty"), #"used", 1);
    }
}

// Namespace bouncingbetty/bouncingbetty
// Params 1, eflags: 0x1 linked
// Checksum 0x94708abe, Offset: 0xc28
// Size: 0x8a
function trackonowner(owner) {
    if (level.trackbouncingbettiesonowner === 1) {
        if (!isdefined(owner)) {
            return;
        }
        if (!isdefined(owner.activebouncingbetties)) {
            owner.activebouncingbetties = [];
        } else {
            arrayremovevalue(owner.activebouncingbetties, undefined);
        }
        owner.activebouncingbetties[owner.activebouncingbetties.size] = self;
    }
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0x52120927, Offset: 0xcc0
// Size: 0x29c
function spawnminemover() {
    self endon(#"death");
    self util::waittillnotmoving();
    self clientfield::set("bouncingbetty_state", 2);
    self useanimtree("generic");
    self setanim(#"o_spider_mine_deploy", 1, 0, 1);
    minemover = spawn("script_model", self.origin);
    minemover.angles = self.angles;
    minemover setmodel(#"tag_origin");
    minemover.owner = self.owner;
    mineup = anglestoup(minemover.angles);
    z_offset = getdvarfloat(#"scr_bouncing_betty_killcam_offset", 18);
    minemover enablelinkto();
    minemover linkto(self);
    minemover.killcamoffset = vectorscale(mineup, z_offset);
    minemover.weapon = self.weapon;
    minemover playsound(#"wpn_betty_arm");
    killcament = spawn("script_model", minemover.origin + minemover.killcamoffset);
    killcament.angles = (0, 0, 0);
    killcament setmodel(#"tag_origin");
    killcament setweapon(self.weapon);
    minemover.killcament = killcament;
    self.minemover = minemover;
    self thread killminemoveronpickup();
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0xdfed91e0, Offset: 0xf68
// Size: 0x54
function killminemoveronpickup() {
    self.minemover endon(#"death");
    self waittill(#"picked_up", #"hacked");
    self killminemover();
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0xafcfd739, Offset: 0xfc8
// Size: 0x5c
function killminemover() {
    if (isdefined(self.minemover)) {
        if (isdefined(self.minemover.killcament)) {
            self.minemover.killcament delete();
        }
        self.minemover delete();
    }
}

// Namespace bouncingbetty/bouncingbetty
// Params 3, eflags: 0x1 linked
// Checksum 0xe111d62f, Offset: 0x1030
// Size: 0x14c
function bouncingbettydetonate(attacker, weapon, target) {
    if (isdefined(weapon) && weapon.isvalid) {
        self.destroyedby = attacker;
        if (isdefined(attacker)) {
            if (self.owner util::isenemyplayer(attacker)) {
                attacker challenges::destroyedexplosive(weapon);
                scoreevents::processscoreevent(#"destroyed_bouncingbetty", attacker, self.owner, weapon);
            }
        }
        self bouncingbettydestroyed();
        return;
    }
    if (isdefined(self.minemover)) {
        self.minemover.ignore_team_kills = 1;
        self.minemover setmodel(self.model);
        self.minemover thread bouncingbettyjumpandexplode();
        self delete();
        return;
    }
    self bouncingbettydestroyed();
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0xb9cad3d7, Offset: 0x1188
// Size: 0xe4
function bouncingbettydestroyed() {
    playfx(level.bettydestroyedfx, self.origin);
    playsoundatposition(#"dst_equipment_destroy", self.origin);
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
    self killminemover();
    self radiusdamage(self.origin, 128, 110, 10, self.owner, "MOD_EXPLOSIVE", self.weapon);
    self delete();
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0x8cb1df24, Offset: 0x1278
// Size: 0x114
function bouncingbettyjumpandexplode() {
    jumpdir = vectornormalize(anglestoup(self.angles));
    if (jumpdir[2] > level.bettyjumpheightwallanglecos) {
        jumpheight = level.bettyjumpheight;
    } else {
        jumpheight = level.bettyjumpheightwall;
    }
    explodepos = self.origin + jumpdir * jumpheight;
    self.killcament moveto(explodepos + self.killcamoffset, level.bettyjumptime, 0, level.bettyjumptime);
    self clientfield::set("bouncingbetty_state", 1);
    wait(level.bettyjumptime);
    self thread mineexplode(jumpdir, explodepos);
}

// Namespace bouncingbetty/bouncingbetty
// Params 2, eflags: 0x1 linked
// Checksum 0x5b48408a, Offset: 0x1398
// Size: 0x18c
function mineexplode(explosiondir, explodepos) {
    if (!isdefined(self) || !isdefined(self.owner)) {
        return;
    }
    self playsound(#"wpn_betty_explo");
    self clientfield::increment("sndRattle", 1);
    waitframe(1);
    if (!isdefined(self) || !isdefined(self.owner)) {
        return;
    }
    self cylinderdamage(explosiondir * level.bettydamageheight, explodepos, level.bettydamageradius, level.bettydamageradius, level.bettydamagemax, level.bettydamagemin, self.owner, "MOD_EXPLOSIVE", self.weapon);
    self ghost();
    wait(0.1);
    if (!isdefined(self) || !isdefined(self.owner)) {
        return;
    }
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
    self.killcament delete();
    self delete();
}

