// Atian COD Tools GSC decompiler test
#include scripts/mp_common/gametypes/battlechatter.gsc;
#include scripts/mp_common/teams/teams.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/weapons/heatseekingmissile.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/tweakables_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/killstreaks/killstreaks_util.gsc;
#include scripts/killstreaks/killstreaks_shared.gsc;
#include scripts/killstreaks/killstreakrules_shared.gsc;
#include scripts/killstreaks/killstreak_hacking.gsc;
#include scripts/killstreaks/killstreak_detect.gsc;
#include scripts/killstreaks/airsupport.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace counteruav;

// Namespace counteruav/counteruav
// Params 0, eflags: 0x2
// Checksum 0x9de26bbf, Offset: 0x218
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"counteruav", &__init__, undefined, #"killstreaks");
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x88ef36bb, Offset: 0x268
// Size: 0x28c
function __init__() {
    level.activecounteruavs = [];
    level.counter_uav_offsets = buildoffsetlist((0, 0, 0), 3, 450, 450);
    if (level.teambased) {
        foreach (team, _ in level.teams) {
            level.activecounteruavs[team] = 0;
        }
    } else {
        level.activecounteruavs = [];
    }
    level.activeplayercounteruavs = [];
    level.counter_uav_entities = [];
    if (tweakables::gettweakablevalue("killstreak", "allowcounteruav")) {
        killstreaks::register_killstreak("killstreak_counteruav", &activatecounteruav);
    }
    clientfield::register("toplayer", "counteruav", 1, 1, "int");
    level thread watchcounteruavs();
    callback::on_connect(&onplayerconnect);
    callback::on_spawned(&onplayerspawned);
    callback::on_joined_team(&onplayerjoinedteam);
    callback::on_finalize_initialization(&function_3675de8b);
    callback::on_connect(&onplayerconnect);
    callback::add_callback(#"hash_425352b435722271", &fx_flesh_hit_neck_fatal);
    /#
        if (getdvarint(#"scr_cuav_offset_debug", 0)) {
            level thread waitanddebugdrawoffsetlist();
        }
    #/
}

// Namespace counteruav/counteruav
// Params 1, eflags: 0x1 linked
// Checksum 0x8173a109, Offset: 0x500
// Size: 0x118
function fx_flesh_hit_neck_fatal(params) {
    foreach (player in params.players) {
        if (level.activeplayercounteruavs[player.entnum] > 0) {
            scoregiven = scoreevents::processscoreevent(#"counter_uav_assist", player, undefined, undefined);
            if (isdefined(scoregiven)) {
                player challenges::earnedcuavassistscore(scoregiven);
                killstreakindex = level.killstreakindices[#"counteruav"];
                killstreaks::killstreak_assist(player, self, killstreakindex);
            }
        }
    }
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x44e05e61, Offset: 0x620
// Size: 0x68
function function_3675de8b() {
    profilestart();
    initrotatingrig();
    profilestop();
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](getweapon(#"counteruav"), &function_bff5c062);
    }
}

// Namespace counteruav/counteruav
// Params 2, eflags: 0x1 linked
// Checksum 0x44ab2521, Offset: 0x690
// Size: 0x12c
function function_bff5c062(cuav, attackingplayer) {
    cuav hackedprefunction(attackingplayer);
    cuav.owner = attackingplayer;
    cuav setowner(attackingplayer);
    cuav killstreaks::configure_team_internal(attackingplayer, 1);
    if (isdefined(level.var_f1edf93f)) {
        cuav notify(#"hacked");
        cuav notify(#"cancel_timeout");
        var_eb79e7c3 = int([[ level.var_f1edf93f ]]() * 1000);
        cuav thread killstreaks::waitfortimeout("counteruav", 30000, &ontimeout, "delete", "death", "crashing");
    }
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xc038ce35, Offset: 0x7c8
// Size: 0x5e
function onplayerconnect() {
    self.entnum = self getentitynumber();
    if (!level.teambased) {
        level.activecounteruavs[self.entnum] = 0;
    }
    level.activeplayercounteruavs[self.entnum] = 0;
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x2980afaf, Offset: 0x830
// Size: 0x5c
function onplayerspawned() {
    if (self enemycounteruavactive()) {
        self clientfield::set_to_player("counteruav", 1);
    } else {
        self clientfield::set_to_player("counteruav", 0);
    }
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xf379c027, Offset: 0x898
// Size: 0x1d4
function initrotatingrig() {
    if (isdefined(level.var_98c93497)) {
        map_center = airsupport::getmapcenter();
        rotator_offset = (isdefined(level.var_98c93497) ? level.var_98c93497 : map_center[0], isdefined(level.var_31be45ec) ? level.var_31be45ec : map_center[1], isdefined(level.var_8ac94558) ? level.var_8ac94558 : 1200);
        level.var_f6bf445b = spawn("script_model", rotator_offset);
    } else {
        level.var_f6bf445b = spawn("script_model", airsupport::getmapcenter() + (isdefined(level.var_f2afd3a) ? level.var_f2afd3a : 0, isdefined(level.var_e500f46c) ? level.var_e500f46c : 0, 1200));
    }
    level.var_f6bf445b setmodel(#"tag_origin");
    level.var_f6bf445b.angles = vectorscale((0, 1, 0), 115);
    level.var_f6bf445b hide();
    level.var_f6bf445b thread rotaterig();
    level.var_f6bf445b thread swayrig();
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xbf37ae0b, Offset: 0xa78
// Size: 0x2e
function rotaterig() {
    for (;;) {
        self rotateyaw(360, 60);
        wait(60);
    }
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xf7f5cb23, Offset: 0xab0
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

// Namespace counteruav/counteruav
// Params 1, eflags: 0x0
// Checksum 0x3592ec11, Offset: 0xbc8
// Size: 0x14a
function generaterandompoints(count) {
    points = [];
    for (i = 0; i < count; i++) {
        point = airsupport::getrandommappoint(isdefined(level.cuav_map_x_offset) ? level.cuav_map_x_offset : 0, isdefined(level.cuav_map_y_offset) ? level.cuav_map_y_offset : 0, isdefined(level.cuav_map_x_percentage) ? level.cuav_map_x_percentage : 0.5, isdefined(level.cuav_map_y_percentage) ? level.cuav_map_y_percentage : 0.5);
        minflyheight = airsupport::getminimumflyheight();
        point = point + (0, 0, minflyheight + (isdefined(level.counter_uav_position_z_offset) ? level.counter_uav_position_z_offset : 1000));
        points[i] = point;
    }
    return points;
}

// Namespace counteruav/counteruav
// Params 1, eflags: 0x0
// Checksum 0xcf44aa77, Offset: 0xd20
// Size: 0x12e
function movementmanagerthink(teamorentnum) {
    while (1) {
        level waittill(#"counter_uav_updated");
        activecount = 0;
        while (level.activecounteruavs[teamorentnum] > 0) {
            if (activecount == 0) {
                activecount = level.activecounteruavs[teamorentnum];
            }
            currentindex = level.counter_uav_position_index[teamorentnum];
            newindex = currentindex;
            while (newindex == currentindex) {
                newindex = randomintrange(0, 20);
            }
            destination = level.counter_uav_positions[newindex];
            level.counter_uav_position_index[teamorentnum] = newindex;
            level notify("counter_uav_move_" + teamorentnum);
            wait(5 + randomintrange(5, 10));
        }
    }
}

// Namespace counteruav/counteruav
// Params 1, eflags: 0x1 linked
// Checksum 0x3f20a0e7, Offset: 0xe58
// Size: 0x5a
function getcurrentposition(teamorentnum) {
    baseposition = level.counter_uav_positions[level.counter_uav_position_index[teamorentnum]];
    offset = level.counter_uav_offsets[self.cuav_offset_index];
    return baseposition + offset;
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xb0e821c1, Offset: 0xec0
// Size: 0x2c
function assignfirstavailableoffsetindex() {
    self.cuav_offset_index = getfirstavailableoffsetindex();
    maintaincouteruaventities();
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xc28f6d15, Offset: 0xef8
// Size: 0x11e
function getfirstavailableoffsetindex() {
    available_offsets = [];
    for (i = 0; i < level.counter_uav_offsets.size; i++) {
        available_offsets[i] = 1;
    }
    foreach (cuav in level.counter_uav_entities) {
        if (isdefined(cuav)) {
            available_offsets[cuav.cuav_offset_index] = 0;
        }
    }
    for (i = 0; i < available_offsets.size; i++) {
        if (available_offsets[i]) {
            return i;
        }
    }
    /#
        util::warning("<unknown string>");
    #/
    return 0;
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xb8649efb, Offset: 0x1020
// Size: 0x66
function maintaincouteruaventities() {
    for (i = level.counter_uav_entities.size; i >= 0; i--) {
        if (!isdefined(level.counter_uav_entities[i])) {
            arrayremoveindex(level.counter_uav_entities, i);
        }
    }
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x0
// Checksum 0xa53e3f85, Offset: 0x1090
// Size: 0x34
function waitanddebugdrawoffsetlist() {
    /#
        level endon(#"game_ended");
        wait(10);
        debugdrawoffsetlist();
    #/
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x0
// Checksum 0xe47ffc22, Offset: 0x10d0
// Size: 0xd0
function debugdrawoffsetlist() {
    /#
        baseposition = level.counter_uav_positions[0];
        foreach (offset in level.counter_uav_offsets) {
            util::debug_sphere(baseposition + offset, 24, (0.95, 0.05, 0.05), 0.75, 9999999);
        }
    #/
}

// Namespace counteruav/counteruav
// Params 4, eflags: 0x1 linked
// Checksum 0x226d89d5, Offset: 0x11a8
// Size: 0x142
function buildoffsetlist(startoffset, depth, offset_x, offset_y) {
    offsets = [];
    for (col = 0; col < depth; col++) {
        itemcount = math::pow(2, col);
        startingindex = itemcount - 1;
        for (i = 0; i < itemcount; i++) {
            x = offset_x * col;
            y = 0;
            if (itemcount > 1) {
                y = i * offset_y;
                total_y = offset_y * startingindex;
                y = y - total_y / 2;
            }
            offsets[startingindex + i] = startoffset + (x, y, 0);
        }
    }
    return offsets;
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xffaa831c, Offset: 0x12f8
// Size: 0x6c
function function_af281272() {
    self endon(#"delete");
    waitresult = undefined;
    waitresult = self waittill(#"death");
    if (!isdefined(self)) {
        return;
    }
    destroycounteruav(waitresult.attacker, waitresult.weapon);
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xe0f45759, Offset: 0x1370
// Size: 0x2c0
function activatecounteruav() {
    if (self killstreakrules::iskillstreakallowed("counteruav", self.team) == 0) {
        return 0;
    }
    killstreak_id = self killstreakrules::killstreakstart("counteruav", self.team);
    if (killstreak_id == -1) {
        return 0;
    }
    counteruav = spawncounteruav(self, killstreak_id);
    if (!isdefined(counteruav)) {
        return 0;
    }
    counteruav clientfield::set("enemyvehicle", 1);
    counteruav.killstreak_id = killstreak_id;
    counteruav thread killstreaks::waittillemp(&destroycounteruavbyemp);
    counteruav thread killstreaks::waitfortimeout("counteruav", 30000, &ontimeout, "delete", "death", "crashing");
    counteruav thread killstreaks::waitfortimecheck(30000 / 2, &ontimecheck, "delete", "death", "crashing");
    counteruav thread function_af281272();
    counteruav thread killstreaks::function_2b6aa9e8("counteruav", &destroycounteruav, &onlowhealth, undefined);
    counteruav playloopsound("veh_uav_engine_loop", 1);
    counteruav function_7c61ce31();
    self killstreaks::play_killstreak_start_dialog("counteruav", self.team, killstreak_id);
    counteruav killstreaks::play_pilot_dialog_on_owner("arrive", "counteruav", killstreak_id);
    counteruav thread killstreaks::player_killstreak_threat_tracking("counteruav");
    self stats::function_e24eec31(getweapon("counteruav"), #"used", 1);
    return 1;
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x40cf2788, Offset: 0x1638
// Size: 0x1dc
function function_7c61ce31() {
    minflyheight = int(airsupport::getminimumflyheight());
    zoffset = minflyheight + (isdefined(level.var_97961f83) ? level.var_97961f83 : 2500);
    angle = randomint(360);
    radiusoffset = (isdefined(level.uav_rotation_radius) ? level.uav_rotation_radius : 4000) + randomint(isdefined(level.uav_rotation_random_offset) ? level.uav_rotation_random_offset : 1000);
    xoffset = cos(angle) * radiusoffset;
    yoffset = sin(angle) * radiusoffset;
    anglevector = vectornormalize((xoffset, yoffset, zoffset));
    anglevector = anglevector * zoffset;
    anglevector = (anglevector[0], anglevector[1], zoffset - level.var_f6bf445b.origin[2]);
    self linkto(level.var_f6bf445b, "tag_origin", anglevector, (0, angle + 90, 0));
}

// Namespace counteruav/counteruav
// Params 1, eflags: 0x1 linked
// Checksum 0xc82c41f1, Offset: 0x1820
// Size: 0x2c
function hackedprefunction(hacker) {
    cuav = self;
    cuav resetactivecounteruav();
}

// Namespace counteruav/counteruav
// Params 2, eflags: 0x1 linked
// Checksum 0xeede84e1, Offset: 0x1858
// Size: 0x27e
function spawncounteruav(owner, killstreak_id) {
    minflyheight = airsupport::getminimumflyheight();
    bundle = struct::get_script_bundle("killstreak", "killstreak_counteruav");
    cuav = spawnvehicle(bundle.ksvehicle, airsupport::getmapcenter() + (0, 0, minflyheight + (isdefined(level.counter_uav_position_z_offset) ? level.counter_uav_position_z_offset : 1000)), (0, 0, 0), "counteruav");
    cuav assignfirstavailableoffsetindex();
    cuav killstreaks::configure_team("counteruav", killstreak_id, owner, undefined, undefined, &configureteampost);
    cuav killstreak_hacking::enable_hacking("counteruav", &hackedprefunction, undefined);
    cuav.targetname = "counteruav";
    cuav util::make_sentient();
    cuav.weapon = getweapon("counteruav");
    cuav setweapon(cuav.weapon);
    killstreak_detect::killstreaktargetset(cuav);
    cuav thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile("crashing", undefined, 1);
    cuav setdrawinfrared(1);
    if (!isdefined(level.counter_uav_entities)) {
        level.counter_uav_entities = [];
    } else if (!isarray(level.counter_uav_entities)) {
        level.counter_uav_entities = array(level.counter_uav_entities);
    }
    level.counter_uav_entities[level.counter_uav_entities.size] = cuav;
    return cuav;
}

// Namespace counteruav/counteruav
// Params 2, eflags: 0x1 linked
// Checksum 0x295bc97f, Offset: 0x1ae0
// Size: 0xd4
function configureteampost(owner, ishacked) {
    cuav = self;
    if (ishacked == 0) {
        cuav teams::hidetosameteam();
    } else {
        cuav setvisibletoall();
    }
    cuav thread teams::waituntilteamchangesingleton(owner, "CUAV_watch_team_change_" + cuav getentitynumber(), &onteamchange, self.entnum, "death", "leaving", "crashing");
    cuav addactivecounteruav();
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x0
// Checksum 0x45f88912, Offset: 0x1bc0
// Size: 0x72
function listenformove() {
    self endon(#"death", #"leaving");
    while (1) {
        self thread counteruavmove();
        level waittill("counter_uav_move_" + self.team, "counter_uav_move_" + self.ownerentnum);
    }
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x842f1f92, Offset: 0x1c40
// Size: 0x14c
function counteruavmove() {
    self endon(#"death", #"leaving");
    level endon("counter_uav_move_" + self.team);
    destination = (0, 0, 0);
    if (level.teambased) {
        destination = self getcurrentposition(self.team);
    } else {
        destination = self getcurrentposition(self.ownerentnum);
    }
    lookangles = vectortoangles(destination - self.origin);
    rotationaccelerationduration = 0.5 * 0.2;
    rotationdecelerationduration = 0.5 * 0.2;
    travelaccelerationduration = 5 * 0.2;
    traveldecelerationduration = 5 * 0.2;
    self setgoal(destination, 1, 0);
}

// Namespace counteruav/counteruav
// Params 1, eflags: 0x1 linked
// Checksum 0xdceea08a, Offset: 0x1d98
// Size: 0x54
function playfx(name) {
    self endon(#"death");
    wait(0.1);
    if (isdefined(self)) {
        playfxontag(name, self, "tag_origin");
    }
}

// Namespace counteruav/counteruav
// Params 2, eflags: 0x1 linked
// Checksum 0x6c6d85f9, Offset: 0x1df8
// Size: 0x7c
function onlowhealth(attacker, weapon) {
    self.is_damaged = 1;
    params = level.killstreakbundle[#"counteruav"];
    if (isdefined(params.fxlowhealth)) {
        playfxontag(params.fxlowhealth, self, "tag_origin");
    }
}

// Namespace counteruav/counteruav
// Params 2, eflags: 0x1 linked
// Checksum 0x7e2a1304, Offset: 0x1e80
// Size: 0x2c
function onteamchange(entnum, event) {
    destroycounteruav(undefined, undefined);
}

// Namespace counteruav/counteruav
// Params 1, eflags: 0x1 linked
// Checksum 0x92b2cfa7, Offset: 0x1eb8
// Size: 0x1c
function onplayerjoinedteam(params) {
    hideallcounteruavstosameteam();
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xc17eb55f, Offset: 0x1ee0
// Size: 0xd4
function ontimeout() {
    self.leaving = 1;
    if (isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](self, 0);
    }
    self.owner globallogic_audio::play_taacom_dialog("timeout", "counteruav");
    self airsupport::leave(5);
    wait(5);
    self removeactivecounteruav();
    if (target_istarget(self)) {
        target_remove(self);
    }
    self delete();
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x9fb18c34, Offset: 0x1fc0
// Size: 0x34
function ontimecheck() {
    self killstreaks::play_pilot_dialog_on_owner("timecheck", "counteruav", self.killstreak_id);
}

// Namespace counteruav/counteruav
// Params 2, eflags: 0x1 linked
// Checksum 0xd4388cab, Offset: 0x2000
// Size: 0x44
function destroycounteruavbyemp(attacker, arg) {
    destroycounteruav(attacker, getweapon(#"emp"));
}

// Namespace counteruav/counteruav
// Params 2, eflags: 0x1 linked
// Checksum 0x11b0454c, Offset: 0x2050
// Size: 0x1ec
function destroycounteruav(attacker, weapon) {
    if (self.leaving !== 1) {
        self killstreaks::play_destroyed_dialog_on_owner("counteruav", self.killstreak_id);
    }
    attacker = self [[ level.figure_out_attacker ]](attacker);
    if (isdefined(attacker) && (!isdefined(self.owner) || self.owner util::isenemyplayer(attacker))) {
        attacker battlechatter::function_dd6a6012("counteruav", weapon);
        challenges::destroyedaircraft(attacker, weapon, 0, 0);
        self killstreaks::function_73566ec7(attacker, weapon, self.owner);
        luinotifyevent(#"player_callout", 2, #"hash_3544b7c59fa5c59c", attacker.entnum);
        attacker challenges::addflyswatterstat(weapon, self);
    }
    self.var_d02ddb8e = weapon;
    self playsound(#"evt_helicopter_midair_exp");
    self removeactivecounteruav();
    if (target_istarget(self)) {
        target_remove(self);
    }
    self thread deletecounteruav();
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x59c1a944, Offset: 0x2248
// Size: 0x13c
function deletecounteruav() {
    self notify(#"crashing");
    params = level.killstreakbundle[#"counteruav"];
    if (isdefined(params.ksexplosionfx)) {
        self thread playfx(params.ksexplosionfx);
    }
    if (isdefined(params.var_bb6c29b4) && isdefined(self.var_d02ddb8e) && self.var_d02ddb8e == getweapon(#"shock_rifle")) {
        self thread playfx(params.var_bb6c29b4);
    }
    wait(0.1);
    if (isdefined(self)) {
        self setmodel(#"tag_origin");
    }
    wait(0.2);
    if (isdefined(self)) {
        self notify(#"delete");
        self delete();
    }
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x8ac22074, Offset: 0x2390
// Size: 0x14a
function enemycounteruavactive() {
    if (level.teambased) {
        foreach (team, _ in level.teams) {
            if (team == self.team) {
                continue;
            }
            if (teamhasactivecounteruav(team)) {
                return 1;
            }
        }
    } else {
        enemies = self teams::getenemyplayers();
        foreach (player in enemies) {
            if (player hasactivecounteruav()) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xeecdf8a9, Offset: 0x24e8
// Size: 0x18
function hasactivecounteruav() {
    return level.activecounteruavs[self.entnum] > 0;
}

// Namespace counteruav/counteruav
// Params 1, eflags: 0x1 linked
// Checksum 0x1d5bdb72, Offset: 0x2508
// Size: 0x20
function teamhasactivecounteruav(team) {
    return level.activecounteruavs[team] > 0;
}

// Namespace counteruav/counteruav
// Params 1, eflags: 0x1 linked
// Checksum 0x20780f17, Offset: 0x2530
// Size: 0x20
function hasindexactivecounteruav(team_or_entnum) {
    return level.activecounteruavs[team_or_entnum] > 0;
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x1bf8ee7a, Offset: 0x2558
// Size: 0x1b8
function addactivecounteruav() {
    if (level.teambased) {
        level.activecounteruavs[self.team]++;
        foreach (team, _ in level.teams) {
            if (!util::function_fbce7263(team, self.team)) {
                continue;
            }
            if (killstreaks::hassatellite(team)) {
                self.owner challenges::blockedsatellite();
            }
        }
    } else {
        level.activecounteruavs[self.ownerentnum]++;
        keys = getarraykeys(level.activecounteruavs);
        for (i = 0; i < keys.size; i++) {
            if (keys[i] == self.ownerentnum) {
                continue;
            }
            if (killstreaks::hassatellite(keys[i])) {
                self.owner challenges::blockedsatellite();
                break;
            }
        }
    }
    level.activeplayercounteruavs[self.ownerentnum]++;
    level notify(#"counter_uav_updated");
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0xd8cf8a01, Offset: 0x2718
// Size: 0x54
function removeactivecounteruav() {
    cuav = self;
    cuav resetactivecounteruav();
    cuav killstreakrules::killstreakstop("counteruav", self.originalteam, self.killstreak_id);
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x8fa436b5, Offset: 0x2778
// Size: 0x180
function resetactivecounteruav() {
    if (level.teambased) {
        level.activecounteruavs[self.team]--;
        /#
            assert(level.activecounteruavs[self.team] >= 0);
        #/
        if (level.activecounteruavs[self.team] < 0) {
            level.activecounteruavs[self.team] = 0;
        }
    } else if (isdefined(self.owner)) {
        /#
            assert(isdefined(self.ownerentnum));
        #/
        if (!isdefined(self.ownerentnum)) {
            self.ownerentnum = self.owner getentitynumber();
        }
        level.activecounteruavs[self.ownerentnum]--;
        /#
            assert(level.activecounteruavs[self.ownerentnum] >= 0);
        #/
        if (level.activecounteruavs[self.ownerentnum] < 0) {
            level.activecounteruavs[self.ownerentnum] = 0;
        }
    }
    level.activeplayercounteruavs[self.ownerentnum]--;
    level notify(#"counter_uav_updated");
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x507681b6, Offset: 0x2900
// Size: 0xe4
function watchcounteruavs() {
    while (1) {
        level waittill(#"counter_uav_updated");
        foreach (player in level.players) {
            if (player enemycounteruavactive()) {
                player clientfield::set_to_player("counteruav", 1);
            } else {
                player clientfield::set_to_player("counteruav", 0);
            }
        }
    }
}

// Namespace counteruav/counteruav
// Params 0, eflags: 0x1 linked
// Checksum 0x42d24198, Offset: 0x29f0
// Size: 0x88
function hideallcounteruavstosameteam() {
    foreach (counteruav in level.counter_uav_entities) {
        if (isdefined(counteruav)) {
            counteruav teams::hidetosameteam();
        }
    }
}

