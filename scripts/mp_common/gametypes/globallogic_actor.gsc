#using scripts\weapons\weapons;
#using scripts\weapons\weapon_utils;
#using scripts\mp_common\player\player_utils;
#using scripts\mp_common\gametypes\globallogic_utils;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\challenges;
#using scripts\core_common\util_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\globallogic\globallogic_player;
#using scripts\core_common\gamestate;
#using scripts\core_common\damagefeedback_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\challenges_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\systems\destructible_character;

#namespace globallogic_actor;

// Namespace globallogic_actor/globallogic_actor
// Params 0, eflags: 0x2
// Checksum 0x80f724d1, Offset: 0x1a0
// Size: 0x4
function autoexec init() {
    
}

// Namespace globallogic_actor/globallogic_actor
// Params 1, eflags: 0x0
// Checksum 0x3de9faec, Offset: 0x1b0
// Size: 0x24
function callback_actorspawned(spawner) {
    self thread spawner::spawn_think(spawner);
}

// Namespace globallogic_actor/globallogic_actor
// Params 15, eflags: 0x0
// Checksum 0x6bcffa6c, Offset: 0x1e0
// Size: 0xf3a
function callback_actordamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, modelindex, surfacetype, vsurfacenormal) {
    if (gamestate::is_game_over()) {
        return;
    }
    if (self.team == #"spectator") {
        return;
    }
    if (isdefined(eattacker) && isplayer(eattacker) && isdefined(eattacker.candocombat) && !eattacker.candocombat) {
        return;
    }
    self.idflags = idflags;
    self.idflagstime = gettime();
    eattacker = player::figure_out_attacker(eattacker);
    if (!isdefined(vdir)) {
        idflags |= 4;
    }
    friendly = 0;
    if (self.health == self.maxhealth || !isdefined(self.attackers)) {
        self.attackers = [];
        self.attackerdata = [];
        self.attackerdamage = [];
        self.attackersthisspawn = [];
    }
    if (globallogic_utils::isheadshot(weapon, shitloc, smeansofdeath, einflictor) && !weapon_utils::ismeleemod(smeansofdeath)) {
        smeansofdeath = "MOD_HEAD_SHOT";
    }
    if (level.onlyheadshots) {
        if (smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET") {
            return;
        } else if (smeansofdeath == "MOD_HEAD_SHOT") {
            idamage = 150;
        }
    }
    if (isdefined(self.overrideactordamage)) {
        idamage = self [[ self.overrideactordamage ]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex);
    } else if (isdefined(level.overrideactordamage)) {
        idamage = self [[ level.overrideactordamage ]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex);
    }
    friendlyfire = [[ level.figure_out_friendly_fire ]](self, eattacker);
    if (friendlyfire == 0 && self.archetype === "robot" && isdefined(eattacker) && !util::function_fbce7263(eattacker.team, self.team)) {
        return;
    }
    if (isdefined(self.aioverridedamage)) {
        for (index = 0; index < self.aioverridedamage.size; index++) {
            damagecallback = self.aioverridedamage[index];
            idamage = self [[ damagecallback ]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex);
        }
        if (idamage < 1) {
            return;
        }
        idamage = int(idamage + 0.5);
    }
    if (weapon == level.weaponnone && isdefined(einflictor)) {
        if (isdefined(einflictor.targetname) && einflictor.targetname == "explodable_barrel") {
            weapon = getweapon(#"explodable_barrel");
        } else if (isdefined(einflictor.destructible_type) && issubstr(einflictor.destructible_type, "vehicle_")) {
            weapon = getweapon(#"destructible_car");
        }
    }
    params = spawnstruct();
    params.einflictor = einflictor;
    params.eattacker = eattacker;
    params.idamage = idamage;
    params.idflags = idflags;
    params.smeansofdeath = smeansofdeath;
    params.weapon = weapon;
    params.vpoint = vpoint;
    params.vdir = vdir;
    params.shitloc = shitloc;
    params.vdamageorigin = vdamageorigin;
    params.psoffsettime = psoffsettime;
    if (!(idflags & 8192)) {
        if (isplayer(eattacker) && isdefined(eattacker.pers)) {
            if (!isdefined(eattacker.pers[#"participation"])) {
                eattacker.pers[#"participation"] = 0;
            }
            eattacker.pers[#"participation"]++;
        }
        prevhealthratio = self.health / self.maxhealth;
        isshootingownclone = 0;
        if (isdefined(self.isaiclone) && self.isaiclone && isplayer(eattacker) && self.owner == eattacker) {
            isshootingownclone = 1;
        }
        if (level.teambased && isplayer(eattacker) && self != eattacker && !util::function_fbce7263(self.team, eattacker.pers[#"team"]) && !isshootingownclone) {
            friendlyfire = [[ level.figure_out_friendly_fire ]](self, eattacker);
            if (friendlyfire == 0) {
                return;
            } else if (friendlyfire == 1) {
                if (idamage < 1) {
                    idamage = 1;
                }
                self.lastdamagewasfromenemy = 0;
                var_5370b15e = idamage < self.health ? idamage : self.health;
                self globallogic_player::giveattackerandinflictorownerassist(eattacker, einflictor, var_5370b15e, smeansofdeath, weapon);
                params.idamage = idamage;
                self callback::callback(#"on_ai_damage", params);
                self callback::callback(#"on_actor_damage", params);
                self finishactordamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, surfacetype, vsurfacenormal);
            } else if (friendlyfire == 2) {
                return;
            } else if (friendlyfire == 3) {
                idamage = int(idamage * 0.5);
                if (idamage < 1) {
                    idamage = 1;
                }
                self.lastdamagewasfromenemy = 0;
                var_5370b15e = idamage < self.health ? idamage : self.health;
                self globallogic_player::giveattackerandinflictorownerassist(eattacker, einflictor, var_5370b15e, smeansofdeath, weapon);
                params.idamage = idamage;
                self callback::callback(#"on_ai_damage", params);
                self callback::callback(#"on_actor_damage", params);
                self finishactordamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, surfacetype, vsurfacenormal);
            }
            friendly = 1;
        } else {
            if (isdefined(eattacker) && isdefined(self.script_owner) && eattacker == self.script_owner && !level.hardcoremode && !isshootingownclone) {
                return;
            }
            if (isdefined(eattacker) && isdefined(self.script_owner) && isdefined(eattacker.script_owner) && eattacker.script_owner == self.script_owner) {
                return;
            }
            if (idamage < 1) {
                idamage = 1;
            }
            if (issubstr(smeansofdeath, "MOD_GRENADE") && isdefined(einflictor) && isdefined(einflictor.iscooked)) {
                self.wascooked = gettime();
            } else {
                self.wascooked = undefined;
            }
            self.lastdamagewasfromenemy = isdefined(eattacker) && eattacker != self;
            var_5370b15e = idamage < self.health ? idamage : self.health;
            self globallogic_player::giveattackerandinflictorownerassist(eattacker, einflictor, var_5370b15e, smeansofdeath, weapon);
            params.idamage = idamage;
            self callback::callback(#"on_ai_damage", params);
            self callback::callback(#"on_actor_damage", params);
            self finishactordamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, surfacetype, vsurfacenormal);
        }
        if (isdefined(eattacker) && eattacker != self) {
            if (weapon.name != "artillery" && (!isdefined(einflictor) || !isai(einflictor) || !isdefined(einflictor.controlled) || einflictor.controlled)) {
                if (idamage > 0 && shitloc !== "riotshield") {
                    eattacker thread damagefeedback::update(smeansofdeath, einflictor, undefined, weapon, self);
                }
            }
        }
    } else {
        params.idamage = idamage;
        self callback::callback(#"on_ai_damage", params);
        self callback::callback(#"on_actor_damage", params);
        self finishactordamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, surfacetype, vsurfacenormal);
    }
    self thread weapons::on_damage(eattacker, einflictor, weapon, smeansofdeath, idamage);
    /#
        if (getdvarint(#"g_debugdamage", 0)) {
            println("<dev string:x38>" + self getentitynumber() + "<dev string:x41>" + self.health + "<dev string:x4c>" + eattacker.clientid + "<dev string:x59>" + isplayer(einflictor) + "<dev string:x71>" + idamage + "<dev string:x7c>" + shitloc);
        }
    #/
    if (true) {
        lpselfnum = self getentitynumber();
        lpselfteam = self.team;
        lpattackerteam = "";
        if (isplayer(eattacker)) {
            lpattacknum = eattacker getentitynumber();
            var_c8fa9c41 = 0;
            lpattackguid = eattacker getguid();
            lpattackname = eattacker.name;
            lpattackerteam = eattacker.pers[#"team"];
            return;
        }
        lpattacknum = -1;
        var_c8fa9c41 = 0;
        lpattackguid = "";
        lpattackname = "";
        lpattackerteam = "world";
    }
}

// Namespace globallogic_actor/globallogic_actor
// Params 8, eflags: 0x0
// Checksum 0x583a502d, Offset: 0x1128
// Size: 0x224
function callback_actorkilled(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime) {
    if (gamestate::is_game_over()) {
        return;
    }
    if (isai(eattacker) && isdefined(eattacker.script_owner)) {
        if (util::function_fbce7263(eattacker.script_owner.team, self.team)) {
            eattacker = eattacker.script_owner;
        }
    }
    if (isdefined(eattacker) && eattacker.classname == "script_vehicle" && isdefined(eattacker.owner)) {
        eattacker = eattacker.owner;
    }
    globallogic::doweaponspecifickilleffects(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
    globallogic::doweaponspecificcorpseeffects(self, einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
    params = spawnstruct();
    params.einflictor = einflictor;
    params.eattacker = eattacker;
    params.idamage = idamage;
    params.smeansofdeath = smeansofdeath;
    params.weapon = weapon;
    params.vdir = vdir;
    params.shitloc = shitloc;
    params.psoffsettime = psoffsettime;
    self callback::callback(#"on_ai_killed", params);
}

// Namespace globallogic_actor/globallogic_actor
// Params 1, eflags: 0x0
// Checksum 0x9f2f2e7, Offset: 0x1358
// Size: 0x3c
function callback_actorcloned(original) {
    destructserverutils::copydestructstate(original, self);
    gibserverutils::copygibstate(original, self);
}

