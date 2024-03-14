// Atian COD Tools GSC decompiler test
#using scripts\weapons\weapons.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace riotshield;

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x755a1ca4, Offset: 0x288
// Size: 0x15c
function init_shared() {
    if (!isdefined(level.weaponriotshield)) {
        level.weaponriotshield = getweapon(#"riotshield");
    }
    level.deployedshieldmodel = #"wpn_t7_shield_riot_world";
    level.stowedshieldmodel = #"wpn_t7_shield_riot_world";
    level.carriedshieldmodel = #"wpn_t7_shield_riot_world";
    level.detectshieldmodel = #"wpn_t7_shield_riot_world";
    level.riotshielddestroyanim = "o_riot_stand_destroyed";
    level.riotshielddeployanim = "o_riot_stand_deploy";
    level.riotshieldshotanimfront = "o_riot_stand_shot";
    level.riotshieldshotanimback = "o_riot_stand_shot_back";
    level.riotshieldmeleeanimfront = "o_riot_stand_melee_front";
    level.riotshieldmeleeanimback = "o_riot_stand_melee_back";
    level.riotshield_placement_zoffset = 26;
    thread register();
    callback::on_spawned(&on_player_spawned);
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x604a7b92, Offset: 0x3f0
// Size: 0x34
function register() {
    clientfield::register("scriptmover", "riotshield_state", 1, 2, "int");
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0xbd8d7061, Offset: 0x430
// Size: 0xac
function watchpregameclasschange() {
    self endon(#"death", #"disconnect", #"track_riot_shield");
    self waittill(#"changed_class");
    if (level.ingraceperiod && !self.hasdonecombat) {
        self clearstowedweapon();
        self refreshshieldattachment();
        self thread trackriotshield();
    }
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0xd74a9ef3, Offset: 0x4e8
// Size: 0x134
function watchriotshieldpickup() {
    self endon(#"death", #"disconnect", #"track_riot_shield");
    self notify(#"watch_riotshield_pickup");
    self endon(#"watch_riotshield_pickup");
    self waittill(#"pickup_riotshield");
    self endon(#"weapon_change");
    /#
        println("<unknown string>");
    #/
    wait(0.5);
    /#
        println("<unknown string>");
    #/
    currentweapon = self getcurrentweapon();
    self.hasriotshield = self hasriotshield();
    self.hasriotshieldequipped = currentweapon.isriotshield;
    self refreshshieldattachment();
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x34fe33ab, Offset: 0x628
// Size: 0x280
function trackriotshield() {
    self endon(#"death", #"disconnect");
    self notify(#"track_riot_shield");
    self endon(#"track_riot_shield");
    self thread watchpregameclasschange();
    self waittill(#"weapon_change");
    self refreshshieldattachment();
    currentweapon = self getcurrentweapon();
    self.hasriotshield = self hasriotshield();
    self.hasriotshieldequipped = currentweapon.isriotshield;
    self.lastnonshieldweapon = level.weaponnone;
    while (true) {
        self thread watchriotshieldpickup();
        currentweapon = self getcurrentweapon();
        currentweapon = self getcurrentweapon();
        self.hasriotshield = self hasriotshield();
        self.hasriotshieldequipped = currentweapon.isriotshield;
        refresh_attach = 0;
        waitresult = undefined;
        waitresult = self waittill(#"weapon_change");
        if (waitresult.weapon.isriotshield) {
            refresh_attach = 1;
            if (isdefined(self.riotshieldentity)) {
                self notify(#"destroy_riotshield");
            }
            if (self.hasriotshield) {
                if (isdefined(self.riotshieldtakeweapon)) {
                    self takeweapon(self.riotshieldtakeweapon);
                    self.riotshieldtakeweapon = undefined;
                }
            }
            if (isvalidnonshieldweapon(currentweapon)) {
                self.lastnonshieldweapon = currentweapon;
            }
        }
        if (self.hasriotshield || refresh_attach == 1) {
            self refreshshieldattachment();
        }
    }
}

// Namespace riotshield/riotshield
// Params 1, eflags: 0x1 linked
// Checksum 0xa7fa2d55, Offset: 0x8b0
// Size: 0x2e
function isvalidnonshieldweapon(weapon) {
    if (!weapons::may_drop(weapon)) {
        return false;
    }
    return true;
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x4fcceee8, Offset: 0x8e8
// Size: 0x2c
function startriotshielddeploy() {
    self notify(#"start_riotshield_deploy");
    self thread watchriotshielddeploy();
}

// Namespace riotshield/riotshield
// Params 1, eflags: 0x1 linked
// Checksum 0xc2819b02, Offset: 0x920
// Size: 0x17e
function resetreconmodelvisibility(owner) {
    if (!isdefined(self)) {
        return;
    }
    self setinvisibletoall();
    self setforcenocull();
    if (!isdefined(owner)) {
        return;
    }
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] hasperk(#"specialty_showenemyequipment")) {
            if (level.players[i].team == #"spectator") {
                continue;
            }
            isenemy = 1;
            if (level.teambased) {
                if (!level.players[i] util::isenemyteam(owner.team)) {
                    isenemy = 0;
                }
            } else if (level.players[i] == owner) {
                isenemy = 0;
            }
            if (isenemy) {
                self setvisibletoplayer(level.players[i]);
            }
        }
    }
}

// Namespace riotshield/riotshield
// Params 2, eflags: 0x1 linked
// Checksum 0xc97e2058, Offset: 0xaa8
// Size: 0x80
function resetreconmodelonevent(eventname, owner) {
    self endon(#"death");
    for (;;) {
        waitresult = undefined;
        waitresult = level waittill(eventname);
        if (isdefined(waitresult.player)) {
            owner = waitresult.player;
        }
        self resetreconmodelvisibility(owner);
    }
}

// Namespace riotshield/riotshield
// Params 2, eflags: 0x1 linked
// Checksum 0xa61d4783, Offset: 0xb30
// Size: 0x11a
function attachreconmodel(modelname, owner) {
    if (!isdefined(self)) {
        return;
    }
    reconmodel = spawn("script_model", self.origin);
    reconmodel.angles = self.angles;
    reconmodel setmodel(modelname);
    reconmodel.model_name = modelname;
    reconmodel linkto(self);
    reconmodel setcontents(0);
    reconmodel resetreconmodelvisibility(owner);
    reconmodel thread resetreconmodelonevent("joined_team", owner);
    reconmodel thread resetreconmodelonevent("player_spawned", owner);
    self.reconmodel = reconmodel;
}

// Namespace riotshield/riotshield
// Params 2, eflags: 0x1 linked
// Checksum 0x998f98d3, Offset: 0xc58
// Size: 0x150
function spawnriotshieldcover(origin, angles) {
    shield_ent = spawn("script_model", origin, 1);
    shield_ent.targetname = "riotshield_mp";
    shield_ent.angles = angles;
    shield_ent setmodel(level.deployedshieldmodel);
    shield_ent setowner(self);
    shield_ent.owner = self;
    shield_ent.team = self.team;
    shield_ent setteam(self.team);
    shield_ent attachreconmodel(level.detectshieldmodel, self);
    shield_ent useanimtree("generic");
    shield_ent setscriptmoverflag(0);
    shield_ent disconnectpaths();
    return shield_ent;
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x619831fe, Offset: 0xdb0
// Size: 0x414
function watchriotshielddeploy() {
    self endon(#"death", #"disconnect", #"start_riotshield_deploy");
    waitresult = undefined;
    waitresult = self waittill(#"deploy_riotshield");
    deploy_attempt = waitresult.is_deploy_attempt;
    weapon = waitresult.weapon;
    self setplacementhint(1);
    placement_hint = 0;
    if (deploy_attempt) {
        placement = self canplaceriotshield("deploy_riotshield");
        if (placement[#"result"]) {
            self.hasdonecombat = 1;
            zoffset = level.riotshield_placement_zoffset;
            shield_ent = self spawnriotshieldcover(placement[#"origin"] + (0, 0, zoffset), placement[#"angles"]);
            item_ent = deployriotshield(self, shield_ent);
            primaries = self getweaponslistprimaries();
            /#
                /#
                    assert(isdefined(item_ent));
                #/
                /#
                    assert(!isdefined(self.riotshieldretrievetrigger));
                #/
                /#
                    assert(!isdefined(self.riotshieldentity));
                #/
                if (level.gametype != "<unknown string>") {
                    /#
                        assert(primaries.size > 0);
                    #/
                }
            #/
            shield_ent clientfield::set("riotshield_state", 1);
            shield_ent.reconmodel clientfield::set("riotshield_state", 1);
            if (level.gametype != "shrp") {
                self weapons::function_d571ac59(self.lastnonshieldweapon);
            }
            if (!self hasweapon(level.weaponbasemeleeheld)) {
                self giveweapon(level.weaponbasemeleeheld);
                self.riotshieldtakeweapon = level.weaponbasemeleeheld;
            }
            self.riotshieldretrievetrigger = item_ent;
            self.riotshieldentity = shield_ent;
            self thread watchdeployedriotshieldents();
            self thread deleteshieldontriggerdeath(self.riotshieldretrievetrigger);
            self thread deleteshieldonplayerdeathordisconnect(shield_ent);
            self.riotshieldentity thread watchdeployedriotshielddamage();
            level notify(#"riotshield_planted", {#player:self});
        } else {
            placement_hint = 1;
            clip_max_ammo = weapon.clipsize;
            self setweaponammoclip(weapon, clip_max_ammo);
        }
    } else {
        placement_hint = 1;
    }
    if (placement_hint) {
        self setriotshieldfailhint();
    }
}

// Namespace riotshield/riotshield
// Params 1, eflags: 0x0
// Checksum 0x738a0f24, Offset: 0x11d0
// Size: 0x116
function riotshielddistancetest(origin) {
    /#
        /#
            assert(isdefined(origin));
        #/
    #/
    min_dist_squared = getdvarfloat(#"riotshield_deploy_limit_radius", 0);
    min_dist_squared = min_dist_squared * min_dist_squared;
    for (i = 0; i < level.players.size; i++) {
        if (isdefined(level.players[i].riotshieldentity)) {
            dist_squared = distancesquared(level.players[i].riotshieldentity.origin, origin);
            if (min_dist_squared > dist_squared) {
                /#
                    println("<unknown string>");
                #/
                return false;
            }
        }
    }
    return true;
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0xbf11c10d, Offset: 0x12f0
// Size: 0xfc
function watchdeployedriotshieldents() {
    /#
        /#
            assert(isdefined(self.riotshieldretrievetrigger));
        #/
        /#
            assert(isdefined(self.riotshieldentity));
        #/
    #/
    self waittill(#"destroy_riotshield");
    if (isdefined(self.riotshieldretrievetrigger)) {
        self.riotshieldretrievetrigger delete();
    }
    if (isdefined(self.riotshieldentity)) {
        if (isdefined(self.riotshieldentity.reconmodel)) {
            self.riotshieldentity.reconmodel delete();
        }
        self.riotshieldentity connectpaths();
        self.riotshieldentity delete();
    }
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x218e4884, Offset: 0x13f8
// Size: 0x38c
function watchdeployedriotshielddamage() {
    self endon(#"death");
    damagemax = getdvarint(#"riotshield_deployed_health", 0);
    self.damagetaken = 0;
    while (true) {
        self.maxhealth = 100000;
        self.health = self.maxhealth;
        waitresult = undefined;
        waitresult = self waittill(#"damage");
        attacker = waitresult.attacker;
        damage = waitresult.amount;
        weapon = waitresult.weapon;
        type = waitresult.mod;
        if (!isdefined(attacker)) {
            continue;
        }
        /#
            /#
                assert(isdefined(self.owner) && isdefined(self.owner.team));
            #/
        #/
        if (isplayer(attacker)) {
            if (level.teambased && !util::function_fbce7263(attacker.team, self.owner.team) && attacker != self.owner) {
                continue;
            }
        }
        if (type == "MOD_MELEE" || type == "MOD_MELEE_ASSASSINATE") {
            damage = damage * getdvarfloat(#"riotshield_melee_damage_scale", 0);
        } else if (type == "MOD_PISTOL_BULLET" || type == "MOD_RIFLE_BULLET") {
            damage = damage * getdvarfloat(#"riotshield_bullet_damage_scale", 0);
        } else if (type == "MOD_GRENADE" || type == "MOD_GRENADE_SPLASH" || type == "MOD_EXPLOSIVE" || type == "MOD_EXPLOSIVE_SPLASH" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH") {
            damage = damage * getdvarfloat(#"riotshield_explosive_damage_scale", 0);
        } else if (type == "MOD_IMPACT") {
            damage = damage * getdvarfloat(#"riotshield_projectile_damage_scale", 0);
        } else if (type == "MOD_CRUSH") {
            damage = damagemax;
        }
        self.damagetaken = self.damagetaken + damage;
        if (self.damagetaken >= damagemax) {
            self thread damagethendestroyriotshield(attacker, weapon);
            break;
        }
    }
}

// Namespace riotshield/riotshield
// Params 2, eflags: 0x1 linked
// Checksum 0xe492e124, Offset: 0x1790
// Size: 0x184
function damagethendestroyriotshield(attacker, weapon) {
    self notify(#"damagethendestroyriotshield");
    self endon(#"death");
    if (isdefined(self.owner.riotshieldretrievetrigger)) {
        self.owner.riotshieldretrievetrigger delete();
    }
    if (isdefined(self.reconmodel)) {
        self.reconmodel delete();
    }
    self connectpaths();
    self.owner.riotshieldentity = undefined;
    self notsolid();
    self clientfield::set("riotshield_state", 2);
    if (isdefined(attacker) && attacker != self.owner && isplayer(attacker)) {
        scoreevents::processscoreevent(#"destroyed_shield", attacker, self.owner, weapon);
    }
    wait(getdvarfloat(#"riotshield_destroyed_cleanup_time", 0));
    self delete();
}

// Namespace riotshield/riotshield
// Params 1, eflags: 0x1 linked
// Checksum 0x28f189a0, Offset: 0x1920
// Size: 0x46
function deleteshieldontriggerdeath(shield_trigger) {
    shield_trigger waittill(#"trigger", #"death");
    self notify(#"destroy_riotshield");
}

// Namespace riotshield/riotshield
// Params 1, eflags: 0x1 linked
// Checksum 0x4e183919, Offset: 0x1970
// Size: 0x7c
function deleteshieldonplayerdeathordisconnect(shield_ent) {
    shield_ent endon(#"death", #"damagethendestroyriotshield");
    self waittill(#"death", #"disconnect", #"remove_planted_weapons");
    shield_ent thread damagethendestroyriotshield();
}

// Namespace riotshield/riotshield
// Params 2, eflags: 0x1 linked
// Checksum 0xa3cde87, Offset: 0x19f8
// Size: 0x9c
function watchriotshieldstuckentitydeath(grenade, owner) {
    grenade endon(#"death");
    self waittill(#"damagethendestroyriotshield", #"death", #"disconnect", #"weapon_change", #"deploy_riotshield");
    grenade detonate(owner);
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x4ccb4c6e, Offset: 0x1aa0
// Size: 0x1c
function on_player_spawned() {
    self thread watch_riot_shield_use();
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0xe2d81e6d, Offset: 0x1ac8
// Size: 0x68
function watch_riot_shield_use() {
    self endon(#"death", #"disconnect");
    self thread trackriotshield();
    for (;;) {
        self waittill(#"raise_riotshield");
        self thread startriotshielddeploy();
    }
}

// Namespace riotshield/grenade_fire
// Params 1, eflags: 0x40
// Checksum 0xade09964, Offset: 0x1b38
// Size: 0xd2
function event_handler[grenade_fire] function_4f975761(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    grenade = eventstruct.projectile;
    weapon = eventstruct.weapon;
    if (grenade util::ishacked()) {
        return;
    }
    switch (weapon.name) {
    case #"explosive_bolt":
    case #"proximity_grenade":
    case #"sticky_grenade":
        grenade thread check_stuck_to_shield();
        break;
    }
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x33c47a96, Offset: 0x1c18
// Size: 0x64
function check_stuck_to_shield() {
    self endon(#"death");
    waitresult = undefined;
    waitresult = self waittill(#"stuck_to_shield");
    waitresult.entity watchriotshieldstuckentitydeath(self, waitresult.owner);
}

