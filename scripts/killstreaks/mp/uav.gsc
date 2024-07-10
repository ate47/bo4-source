#using scripts\killstreaks\mp\counteruav.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using scripts\killstreaks\killstreak_detect.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace uav;

// Namespace uav/uav
// Params 0, eflags: 0x2
// Checksum 0x5715d565, Offset: 0x230
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"uav", &__init__, undefined, #"killstreaks");
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0xec75a2c3, Offset: 0x280
// Size: 0x214
function __init__() {
    if (level.teambased) {
        foreach (team, _ in level.teams) {
            level.activeuavs[team] = 0;
        }
    } else {
        level.activeuavs = [];
    }
    level.activeplayeruavs = [];
    level.spawneduavs = [];
    if (tweakables::gettweakablevalue("killstreak", "allowradar")) {
        killstreaks::register_killstreak("killstreak_uav", &activateuav);
    }
    level thread uavtracker();
    callback::on_connect(&onplayerconnect);
    callback::on_spawned(&onplayerspawned);
    callback::on_joined_team(&onplayerjoinedteam);
    callback::on_finalize_initialization(&function_3675de8b);
    callback::add_callback(#"hash_425352b435722271", &fx_flesh_hit_neck_fatal);
    callback::on_finalize_initialization(&function_1c601b99);
    setmatchflag("radar_allies", 0);
    setmatchflag("radar_axis", 0);
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0xc688a448, Offset: 0x4a0
// Size: 0x50
function function_1c601b99() {
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](getweapon(#"uav"), &function_bff5c062);
    }
}

// Namespace uav/uav
// Params 2, eflags: 0x0
// Checksum 0xd8e9e83f, Offset: 0x4f8
// Size: 0x114
function function_bff5c062(uav, attackingplayer) {
    uav hackedprefunction(attackingplayer);
    uav.owner = attackingplayer;
    uav killstreaks::configure_team_internal(attackingplayer, 1);
    if (isdefined(level.var_f1edf93f)) {
        uav notify(#"hacked");
        uav notify(#"cancel_timeout");
        var_eb79e7c3 = int([[ level.var_f1edf93f ]]() * 1000);
        uav thread killstreaks::waitfortimeout("uav", var_eb79e7c3, &ontimeout, "delete", "death", "crashing");
    }
}

// Namespace uav/uav
// Params 1, eflags: 0x0
// Checksum 0xa20cb3e2, Offset: 0x618
// Size: 0x240
function fx_flesh_hit_neck_fatal(params) {
    enemycuavactive = 0;
    if (params.attacker hasperk(#"specialty_immunecounteruav") == 0) {
        foreach (team, _ in level.teams) {
            if (team == params.attacker.team) {
                continue;
            }
            if (counteruav::teamhasactivecounteruav(team)) {
                enemycuavactive = 1;
            }
        }
    }
    if (enemycuavactive == 0) {
        foreach (player in params.players) {
            if (isdefined(level.activeplayeruavs)) {
                activeuav = level.activeplayeruavs[player.entnum];
                if (level.forceradar == 1) {
                    activeuav--;
                }
                if (activeuav > 0) {
                    scoregiven = scoreevents::processscoreevent(#"uav_assist", player, undefined, undefined);
                    if (isdefined(scoregiven)) {
                        player challenges::earneduavassistscore(scoregiven);
                        killstreakindex = level.killstreakindices[#"uav"];
                        killstreaks::killstreak_assist(player, self, killstreakindex);
                    }
                }
            }
        }
    }
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0xa2302da0, Offset: 0x860
// Size: 0x1e
function function_3675de8b() {
    profilestart();
    initrotatingrig();
    profilestop();
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0xb088c90a, Offset: 0x888
// Size: 0x1e4
function initrotatingrig() {
    if (isdefined(level.var_c6129172)) {
        map_center = airsupport::getmapcenter();
        rotator_offset = (isdefined(level.var_c6129172) ? level.var_c6129172 : map_center[0], isdefined(level.var_ae8d87c7) ? level.var_ae8d87c7 : map_center[1], isdefined(level.var_eb2556e1) ? level.var_eb2556e1 : 1200);
        level.var_b59e7114 = spawn("script_model", rotator_offset);
    } else {
        map_center = airsupport::getmapcenter();
        rotator_offset = (isdefined(level.var_778a1b96) ? level.var_778a1b96 : 0, isdefined(level.var_621e7f72) ? level.var_621e7f72 : 0, 1200);
        level.var_b59e7114 = spawn("script_model", map_center + rotator_offset);
    }
    level.var_b59e7114 setmodel(#"tag_origin");
    level.var_b59e7114.angles = (0, 115, 0);
    level.var_b59e7114 hide();
    level.var_b59e7114 thread rotaterig();
    level.var_b59e7114 thread swayrig();
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0x302b4dc5, Offset: 0xa78
// Size: 0x2e
function rotaterig() {
    for (;;) {
        self rotateyaw(-360, 60);
        wait(60);
    }
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0xecfad563, Offset: 0xab0
// Size: 0x10e
function swayrig() {
    centerorigin = self.origin;
    for (;;) {
        z = randomintrange(-200, -100);
        time = randomintrange(3, 6);
        self moveto(centerorigin + (0, 0, z), time, 1, 1);
        wait(time);
        z = randomintrange(100, 200);
        time = randomintrange(3, 6);
        self moveto(centerorigin + (0, 0, z), time, 1, 1);
        wait(time);
    }
}

// Namespace uav/uav
// Params 1, eflags: 0x0
// Checksum 0x57dbb2bc, Offset: 0xbc8
// Size: 0x2c
function hackedprefunction(hacker) {
    uav = self;
    uav resetactiveuav();
}

// Namespace uav/uav
// Params 2, eflags: 0x0
// Checksum 0xda74e824, Offset: 0xc00
// Size: 0xd4
function configureteampost(owner, ishacked) {
    uav = self;
    uav thread teams::waituntilteamchangesingleton(owner, "UAV_watch_team_change_" + uav getentitynumber(), &onteamchange, owner.entnum, "delete", "death", "leaving");
    if (ishacked == 0) {
        uav teams::hidetosameteam();
    } else {
        uav setvisibletoall();
    }
    owner addactiveuav();
}

// Namespace uav/uav
// Params 1, eflags: 0x0
// Checksum 0x863c45b2, Offset: 0xce0
// Size: 0x1e
function function_f724cfe4(health) {
    waitframe(1);
    self.health = health;
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0x24f49cee, Offset: 0xd08
// Size: 0x6a8
function activateuav() {
    assert(isdefined(level.players));
    if (self killstreakrules::iskillstreakallowed("uav", self.team) == 0) {
        return false;
    }
    killstreak_id = self killstreakrules::killstreakstart("uav", self.team);
    if (killstreak_id == -1) {
        return false;
    }
    rotator = level.var_b59e7114;
    attach_angle = -90;
    uav = spawn("script_model", rotator gettagorigin("tag_origin"));
    if (!isdefined(level.spawneduavs)) {
        level.spawneduavs = [];
    } else if (!isarray(level.spawneduavs)) {
        level.spawneduavs = array(level.spawneduavs);
    }
    level.spawneduavs[level.spawneduavs.size] = uav;
    uav setmodel(level.killstreakbundle[#"uav"].ksmodel);
    uav.weapon = getweapon("uav");
    uav setweapon(uav.weapon);
    uav.targetname = "uav";
    uav util::make_sentient();
    uav killstreaks::configure_team("uav", killstreak_id, self, undefined, undefined, &configureteampost);
    uav killstreak_hacking::enable_hacking("uav", &hackedprefunction, undefined);
    uav clientfield::set("enemyvehicle", 1);
    killstreak_detect::killstreaktargetset(uav);
    uav setdrawinfrared(1);
    uav.killstreak_id = killstreak_id;
    uav.leaving = 0;
    uav.victimsoundmod = "vehicle";
    uav thread killstreaks::function_2b6aa9e8("uav", &destroyuav, &onlowhealth);
    uav thread function_f724cfe4(100000);
    uav thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile("crashing", undefined, 1);
    uav.rocketdamage = uav.maxhealth + 1;
    minflyheight = int(airsupport::getminimumflyheight());
    zoffset = minflyheight + (isdefined(level.uav_z_offset) ? level.uav_z_offset : 2500);
    angle = randomint(360);
    radiusoffset = (isdefined(level.uav_rotation_radius) ? level.uav_rotation_radius : 4000) + randomint(isdefined(level.uav_rotation_random_offset) ? level.uav_rotation_random_offset : 1000);
    xoffset = cos(angle) * radiusoffset;
    yoffset = sin(angle) * radiusoffset;
    anglevector = vectornormalize((xoffset, yoffset, zoffset));
    anglevector *= zoffset;
    anglevector = (anglevector[0], anglevector[1], zoffset - rotator.origin[2]);
    uav linkto(rotator, "tag_origin", anglevector, (0, angle + attach_angle, 0));
    self stats::function_e24eec31(getweapon("uav"), #"used", 1);
    uav thread killstreaks::waitfortimeout("uav", 30000, &ontimeout, "delete", "death", "crashing");
    uav thread killstreaks::waitfortimecheck(30000 / 2, &ontimecheck, "delete", "death", "crashing");
    uav thread startuavfx();
    self killstreaks::play_killstreak_start_dialog("uav", self.team, killstreak_id);
    uav killstreaks::play_pilot_dialog_on_owner("arrive", "uav", killstreak_id);
    uav thread killstreaks::player_killstreak_threat_tracking("uav");
    return true;
}

// Namespace uav/uav
// Params 2, eflags: 0x0
// Checksum 0x61e7d19c, Offset: 0x13b8
// Size: 0x7c
function onlowhealth(attacker, weapon) {
    self.is_damaged = 1;
    params = level.killstreakbundle[#"uav"];
    if (isdefined(params.fxlowhealth)) {
        playfxontag(params.fxlowhealth, self, "tag_origin");
    }
}

// Namespace uav/uav
// Params 2, eflags: 0x0
// Checksum 0xe0e161e4, Offset: 0x1440
// Size: 0x2c
function onteamchange(entnum, event) {
    destroyuav(undefined, undefined);
}

// Namespace uav/uav
// Params 2, eflags: 0x0
// Checksum 0x43f6be5, Offset: 0x1478
// Size: 0x30c
function destroyuav(attacker, weapon) {
    attacker = self [[ level.figure_out_attacker ]](attacker);
    if (isdefined(attacker) && (!isdefined(self.owner) || self.owner util::isenemyplayer(attacker))) {
        attacker battlechatter::function_dd6a6012("uav", weapon);
        challenges::destroyedaircraft(attacker, weapon, 0, 0);
        luinotifyevent(#"player_callout", 2, #"hash_7f902a0b5852fe90", attacker.entnum);
        attacker challenges::addflyswatterstat(weapon, self);
    }
    if (!self.leaving) {
        self removeactiveuav();
        self killstreaks::play_destroyed_dialog_on_owner("uav", self.killstreak_id);
    }
    self notify(#"crashing");
    self playsound(#"exp_veh_large");
    params = level.killstreakbundle[#"uav"];
    if (isdefined(params.ksexplosionfx)) {
        playfxontag(params.ksexplosionfx, self, "tag_origin");
    }
    if (isdefined(params.var_bb6c29b4) && isdefined(weapon) && weapon == getweapon(#"shock_rifle")) {
        playfxontag(params.var_bb6c29b4, self, "tag_origin");
    }
    self stoploopsound();
    self setmodel(#"tag_origin");
    if (target_istarget(self)) {
        target_remove(self);
    }
    self unlink();
    wait(0.5);
    arrayremovevalue(level.spawneduavs, self);
    if (isdefined(self)) {
        self notify(#"delete");
        self delete();
    }
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0xa225e115, Offset: 0x1790
// Size: 0x5e
function onplayerconnect() {
    self.entnum = self getentitynumber();
    if (!level.teambased) {
        level.activeuavs[self.entnum] = 0;
    }
    level.activeplayeruavs[self.entnum] = 0;
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0x7b4f4516, Offset: 0x17f8
// Size: 0x68
function onplayerspawned() {
    self endon(#"disconnect");
    if (level.teambased == 0 || level.multiteam == 1 || level.forceradar == 1) {
        level notify(#"uav_update");
    }
}

// Namespace uav/uav
// Params 1, eflags: 0x0
// Checksum 0xf0752e48, Offset: 0x1868
// Size: 0x1c
function onplayerjoinedteam(params) {
    hidealluavstosameteam();
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0x789f3816, Offset: 0x1890
// Size: 0x13c
function ontimeout() {
    playafterburnerfx();
    if (isdefined(self.is_damaged) && self.is_damaged) {
        playfxontag("killstreaks/fx_uav_damage_trail", self, "tag_body");
    }
    self killstreaks::play_pilot_dialog_on_owner("timeout", "uav");
    self.leaving = 1;
    if (isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](self, 0);
    }
    self removeactiveuav();
    airsupport::leave(10);
    wait(10);
    if (target_istarget(self)) {
        target_remove(self);
    }
    arrayremovevalue(level.spawneduavs, self);
    self delete();
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0x892c9d92, Offset: 0x19d8
// Size: 0x34
function ontimecheck() {
    self killstreaks::play_pilot_dialog_on_owner("timecheck", "uav", self.killstreak_id);
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0x7157532e, Offset: 0x1a18
// Size: 0x74
function startuavfx() {
    self endon(#"death");
    wait(0.1);
    if (isdefined(self)) {
        playfxontag("killstreaks/fx_uav_lights", self, "tag_origin");
        self playloopsound(#"veh_uav_engine_loop", 1);
    }
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0xbe535c77, Offset: 0x1a98
// Size: 0x84
function playafterburnerfx() {
    self endon(#"death");
    wait(0.1);
    if (isdefined(self)) {
        self stoploopsound();
        team = util::getotherteam(self.team);
        self playsoundtoteam(#"veh_kls_uav_afterburner", team);
    }
}

// Namespace uav/uav
// Params 1, eflags: 0x0
// Checksum 0x7a4be9a7, Offset: 0x1b28
// Size: 0x20
function hasuav(team_or_entnum) {
    return level.activeuavs[team_or_entnum] > 0;
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0xb1efdd6c, Offset: 0x1b50
// Size: 0xd8
function addactiveuav() {
    if (level.teambased) {
        assert(isdefined(self.team));
        level.activeuavs[self.team]++;
    } else {
        assert(isdefined(self.entnum));
        if (!isdefined(self.entnum)) {
            self.entnum = self getentitynumber();
        }
        level.activeuavs[self.entnum]++;
    }
    level.activeplayeruavs[self.entnum]++;
    level notify(#"uav_update");
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0x81221b6e, Offset: 0x1c30
// Size: 0x54
function removeactiveuav() {
    uav = self;
    uav resetactiveuav();
    uav killstreakrules::killstreakstop("uav", self.originalteam, self.killstreak_id);
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0x1e6c5a69, Offset: 0x1c90
// Size: 0x200
function resetactiveuav() {
    if (level.teambased) {
        level.activeuavs[self.team]--;
        assert(level.activeuavs[self.team] >= 0);
        if (level.activeuavs[self.team] < 0) {
            level.activeuavs[self.team] = 0;
        }
    } else if (isdefined(self.owner)) {
        assert(isdefined(self.owner.entnum));
        if (!isdefined(self.owner.entnum)) {
            self.owner.entnum = self.owner getentitynumber();
        }
        level.activeuavs[self.owner.entnum]--;
        assert(level.activeuavs[self.owner.entnum] >= 0);
        if (level.activeuavs[self.owner.entnum] < 0) {
            level.activeuavs[self.owner.entnum] = 0;
        }
    }
    if (isdefined(self.owner)) {
        level.activeplayeruavs[self.owner.entnum]--;
        assert(level.activeplayeruavs[self.owner.entnum] >= 0);
    }
    level notify(#"uav_update");
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0x6c8cbe83, Offset: 0x1e98
// Size: 0x2ac
function uavtracker() {
    level endon(#"game_ended");
    while (true) {
        level waittill(#"uav_update");
        if (level.teambased) {
            foreach (team, _ in level.teams) {
                activeuavs = level.activeuavs[team];
                activeuavsandsatellites = activeuavs + (isdefined(level.activesatellites) ? level.activesatellites[team] : 0);
                setteamspyplane(team, int(min(activeuavs, 2)));
                util::set_team_radar(team, activeuavsandsatellites > 0);
            }
            continue;
        }
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            assert(isdefined(player.entnum));
            if (!isdefined(player.entnum)) {
                player.entnum = player getentitynumber();
            }
            activeuavs = level.activeuavs[player.entnum];
            activeuavsandsatellites = activeuavs + (isdefined(level.activesatellites) ? level.activesatellites[player.entnum] : 0);
            player setclientuivisibilityflag("radar_client", activeuavsandsatellites > 0);
            player.hasspyplane = int(min(activeuavs, 2));
        }
    }
}

// Namespace uav/uav
// Params 0, eflags: 0x0
// Checksum 0xa304612b, Offset: 0x2150
// Size: 0x88
function hidealluavstosameteam() {
    foreach (uav in level.spawneduavs) {
        if (isdefined(uav)) {
            uav teams::hidetosameteam();
        }
    }
}

