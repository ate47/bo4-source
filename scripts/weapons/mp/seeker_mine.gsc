// Atian COD Tools GSC decompiler test
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\core_common\gestures.gsc;
#using script_57491143f0b931b5;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\weapons\arc.gsc;
#using scripts\core_common\vehicles\seeker_mine.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace seeker_mine_mp;

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x2
// Checksum 0x4588bf1, Offset: 0x330
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"seeker_mine_mp", &__init__, undefined, undefined);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0x8e357bc, Offset: 0x378
// Size: 0x326
function __init__() {
    level.seeker_mine = [];
    level.var_36d0df18 = &function_3019d870;
    level.var_9d47488 = spawnstruct();
    level.var_9d47488.script = &function_c3d93fc;
    level.var_9d47488.weapon = getweapon("eq_seeker_mine");
    level.var_9d47488.prompt = seeker_mine_prompt::register("seeker_mine_prompt");
    level.var_9d47488.var_8e526d12 = getweapon(#"hash_27d90cc12712230f");
    level.var_9d47488.var_42f768ff = getweapon(#"hash_1ca0e9052a71989");
    level.var_9d47488.var_4bbc3170 = getweapon(#"hash_597ead6ff2ce9284");
    level.var_f93c9e9c = &function_b6ee86e3;
    function_5aa948ab();
    callback::on_connect(&onplayerconnect);
    callback::on_spawned(&onspawned);
    callback::on_finalize_initialization(&function_1c601b99);
    clientfield::register("allplayers", "seeker_mine_shock", 1, 2, "int");
    clientfield::register("scriptmover", "seeker_mine_fx", 1, 2, "int");
    var_e37678fe = getweapon("seeker_mine_arc");
    bundle = getscriptbundle("seeker_mine_arc_settings");
    arc::init_arc(var_e37678fe, bundle);
    level.var_a7010207 = getweapon(#"eq_seeker_mine");
    if (isdefined(level.var_a7010207.customsettings)) {
        level.var_4b3541d4 = getscriptbundle(level.var_a7010207.customsettings);
        return;
    }
    level.var_4b3541d4 = getscriptbundle("seeker_mine_custom_settings");
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0x479c30ac, Offset: 0x6a8
// Size: 0x37e
function function_5aa948ab() {
    level.var_9d47488.tunables = getscriptbundle("seeker_mine_tunables");
    if (!isdefined(level.var_9d47488.tunables.var_2fa95b34)) {
        level.var_9d47488.tunables.var_2fa95b34 = 0;
    }
    if (!isdefined(level.var_9d47488.tunables.var_170c494e)) {
        level.var_9d47488.tunables.var_170c494e = 0;
    }
    if (!isdefined(level.var_9d47488.tunables.var_b9cf9139)) {
        level.var_9d47488.tunables.var_b9cf9139 = 0;
    }
    if (!isdefined(level.var_9d47488.tunables.var_5ee35075)) {
        level.var_9d47488.tunables.var_5ee35075 = 0;
    }
    if (!isdefined(level.var_9d47488.tunables.var_9bdbf8df)) {
        level.var_9d47488.tunables.var_9bdbf8df = 0;
    }
    if (!isdefined(level.var_9d47488.tunables.var_c0c99398)) {
        level.var_9d47488.tunables.var_c0c99398 = 0;
    }
    if (!isdefined(level.var_9d47488.tunables.var_9abfd5cf)) {
        level.var_9d47488.tunables.var_9abfd5cf = 0;
    }
    if (!isdefined(level.var_9d47488.tunables.var_e8e9a9cc)) {
        level.var_9d47488.tunables.var_e8e9a9cc = 0;
    }
    if (!isdefined(level.var_9d47488.tunables.var_a06eff0b)) {
        level.var_9d47488.tunables.var_a06eff0b = 0;
    }
    level.var_9d47488.tunables.var_1f80b74 = level.var_9d47488.tunables.var_170c494e + level.var_9d47488.tunables.var_b9cf9139 + level.var_9d47488.tunables.var_5ee35075 + level.var_9d47488.tunables.var_9bdbf8df + level.var_9d47488.tunables.var_2fa95b34;
    level.var_9d47488.tunables.maxduration = level.var_9d47488.tunables.var_1f80b74 + level.var_9d47488.tunables.var_c0c99398;
    if (!isdefined(level.var_9d47488.tunables.yaw)) {
        level.var_9d47488.tunables.yaw = 0;
    }
    if (!isdefined(level.var_9d47488.tunables.pitch)) {
        level.var_9d47488.tunables.pitch = 0;
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0x3aa4f0bc, Offset: 0xa30
// Size: 0x86
function onplayerconnect() {
    self.entnum = self getentitynumber();
    level.seeker_mine[self.entnum] = spawnstruct();
    level.seeker_mine[self.entnum].killstreak_id = -1;
    level.seeker_mine[self.entnum].mines = [];
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0xc810879c, Offset: 0xac0
// Size: 0x2a
function onspawned() {
    self.var_beee9523 = 0;
    self.var_dda9b735 = spawnstruct();
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x0
// Checksum 0x500e9845, Offset: 0xaf8
// Size: 0x3c
function onteamchanged(entnum, event) {
    abandoned = 1;
    function_53df8a4c(entnum, abandoned);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x0
// Checksum 0xcb156289, Offset: 0xb40
// Size: 0x2c
function onemp(attacker, ownerentnum) {
    function_53df8a4c(ownerentnum);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0xeca4796e, Offset: 0xb78
// Size: 0x40
function function_1c601b99() {
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](level.var_9d47488.weapon, &function_bff5c062);
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0x31b46461, Offset: 0xbc0
// Size: 0x194
function function_bff5c062(var_c75e900a, attackingplayer) {
    if (var_c75e900a vehicle_ai::get_current_state() !== "discharge") {
        if (isdefined(var_c75e900a.var_f8bc2316)) {
            var_c75e900a influencers::remove_influencer(var_c75e900a.var_f8bc2316);
        }
        var_c75e900a setteam(attackingplayer.team);
        var_c75e900a.team = attackingplayer.team;
        var_c75e900a.owner = attackingplayer;
        var_c75e900a setowner(attackingplayer);
        var_c75e900a.ishacked = 1;
        var_c75e900a.favoriteenemy = undefined;
        if (issentient(var_c75e900a)) {
            var_c75e900a clearenemy();
        }
        var_c75e900a vehicle_ai::set_state("seek");
        if (isdefined(level.var_f1edf93f)) {
            var_eb79e7c3 = [[ level.var_f1edf93f ]]();
            var_c75e900a.var_672e0d51 = gettime() + int(var_eb79e7c3 * 1000);
        }
        var_c75e900a thread function_a8552c0a();
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0x3bf9ed11, Offset: 0xd60
// Size: 0x7c
function function_c3d93fc(grenade, weapon) {
    var_2272245d = getweapon("eq_seeker_mine");
    if (isdefined(var_2272245d) && var_2272245d.name == weapon.name) {
        self function_d573e71(grenade, weapon);
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0x78ddb1fe, Offset: 0xde8
// Size: 0x234
function function_d573e71(grenade, weapon) {
    grenade endon(#"death");
    waitresult = grenade waittilltimeout(1.5, #"stationary");
    if (waitresult._notify === "timeout") {
        results = groundtrace(grenade.origin + (0, 0, 400), grenade.origin + (0, 0, -400), 0, grenade);
        if (isdefined(results) && isdefined(results[#"position"]) && isdefined(results[#"normal"])) {
            origin = results[#"position"];
            newpos = getclosestpointonnavmesh(origin, 2000, 20, 1);
            if (isdefined(newpos)) {
                origin = newpos;
            }
            angles = vectortoangles(results[#"normal"]);
        }
    } else {
        z_offset = getdvar(#"hash_22cbaf883dcda013", 0);
        origin = grenade.origin + (0, 0, z_offset);
        angles = grenade.angles;
    }
    newangles = (0, angles[1], 0);
    self function_3019d870(origin, newangles);
    waitframe(2);
    grenade delete();
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0xf3a3dde7, Offset: 0x1028
// Size: 0x3f4
function function_3019d870(origin, angles) {
    originalowner = self;
    originalownerentnum = originalowner.entnum;
    mine = spawnvehicle("veh_seeker_mine_mp", origin, angles, "dynamic_spawn_ai");
    mine.arcweapon = getweapon("seeker_mine_arc");
    mine.weapon = getweapon("eq_seeker_mine");
    mine setweapon(mine.weapon);
    mine.var_16d479de = &function_6db15645;
    mine.var_f5037060 = &function_724e8f1c;
    mine.var_8a41c722 = &cleartarget;
    mine.var_a5b686b6 = 0;
    mine.var_1f13c7f1 = getweapon(#"eq_seeker_mine").var_1f13c7f1;
    mine.var_69ea963 = &function_c7561b46;
    mine.var_8ac0d510 = 1;
    mine util::make_sentient();
    if (!isdefined(mine)) {
        return;
    }
    mines = level.seeker_mine[originalownerentnum].mines;
    for (i = 0; i < mines.size - 2; i++) {
        mines[i] seeker_mine::function_afd97197();
    }
    if (isdefined(level.var_9bf1e805)) {
        mine thread [[ level.var_9bf1e805 ]](self);
    }
    if (!isdefined(level.seeker_mine[originalownerentnum].mines)) {
        level.seeker_mine[originalownerentnum].mines = [];
    } else if (!isarray(level.seeker_mine[originalownerentnum].mines)) {
        level.seeker_mine[originalownerentnum].mines = array(level.seeker_mine[originalownerentnum].mines);
    }
    level.seeker_mine[originalownerentnum].mines[level.seeker_mine[originalownerentnum].mines.size] = mine;
    mine killstreaks::configure_team("raps", "raps", originalowner, undefined, undefined, &configureteampost);
    mine clientfield::set("enemyvehicle", 1);
    mine setinvisibletoall();
    mine thread autosetvisibletoall();
    mine playsound("mpl_seeker_mine_activate");
    mine vehicle::toggle_sounds(1);
    mine thread function_f43b3686(originalowner);
    mine thread function_5731c02c();
}

// Namespace seeker_mine_mp/seeker_mine
// Params 1, eflags: 0x1 linked
// Checksum 0x68897681, Offset: 0x1428
// Size: 0x48
function function_c7561b46(target) {
    if (isplayer(target) && target isgrappling()) {
        return false;
    }
    return true;
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0x2f2f5dc3, Offset: 0x1478
// Size: 0xf2
function function_5731c02c() {
    self endon(#"death");
    while (true) {
        if (!isdefined(self.owner) || !isdefined(self.owner.team) || self.owner.team != self.team || !self.owner hasweapon(level.var_9d47488.weapon) && !(isdefined(self.ishacked) && self.ishacked)) {
            self notify(#"abandoned");
            self.abandoned = 1;
            self function_afd97197();
            break;
        }
        waitframe(1);
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0xe26e6edb, Offset: 0x1578
// Size: 0x34
function configureteampost(owner, ishacked) {
    mine = self;
    mine thread function_a8552c0a();
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0xe8d511cb, Offset: 0x15b8
// Size: 0x3c
function autosetvisibletoall() {
    self endon(#"death");
    waitframe(1);
    waitframe(1);
    self setvisibletoall();
}

// Namespace seeker_mine_mp/seeker_mine
// Params 1, eflags: 0x1 linked
// Checksum 0xddc30c8, Offset: 0x1600
// Size: 0x21c
function function_f43b3686(originalowner) {
    originalownerentnum = originalowner.entnum;
    waitresult = self waittill(#"death");
    attacker = waitresult.attacker;
    weapon = waitresult.weapon;
    attacker = self [[ level.figure_out_attacker ]](attacker);
    if (isdefined(attacker) && isplayer(attacker)) {
        if (isdefined(self.var_d8d780c1)) {
            attacker.var_f6201e80 = self.var_d8d780c1[0];
        }
        if (isdefined(self.owner) && self.owner != attacker && self.owner.team != attacker.team) {
            self.owner globallogic_score::function_5829abe3(attacker, weapon, level.var_9d47488.weapon);
        }
        if (isdefined(level.var_d2600afc)) {
            self [[ level.var_d2600afc ]](attacker, self.owner, self.arcweapon, weapon);
        }
    }
    if (isdefined(level.var_4b3541d4.var_bb6c29b4) && isdefined(weapon) && weapon == getweapon(#"shock_rifle")) {
        playfx(level.var_4b3541d4.var_bb6c29b4, self.origin);
    }
    arrayremovevalue(level.seeker_mine[originalownerentnum].mines, self);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0xd8b8c4a5, Offset: 0x1828
// Size: 0xd8
function function_53df8a4c(entnum, abandoned = 0) {
    foreach (mine in level.seeker_mine[entnum].mines) {
        if (isalive(mine)) {
            mine.owner = undefined;
            mine.abandoned = abandoned;
            mine function_afd97197();
        }
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0x2da4c7b8, Offset: 0x1908
// Size: 0x8e
function function_a8552c0a() {
    mine = self;
    preset = getinfluencerpreset("raps");
    if (!isdefined(preset)) {
        return;
    }
    enemy_team_mask = mine influencers::get_enemy_team_mask(mine.team);
    mine.var_f8bc2316 = mine influencers::create_entity_influencer("raps", enemy_team_mask);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0x254e3e8b, Offset: 0x19a0
// Size: 0xc8
function function_f0eb3dbb() {
    name = "tag_shocker_";
    dir = "l";
    if (randomfloat(1) < 0.5) {
        dir = "r";
    }
    count = "_0" + randomint(4) + 1;
    suffix = "_fx";
    tag = name + dir + count + suffix;
    return tag;
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x5 linked
// Checksum 0xb971b3c4, Offset: 0x1a70
// Size: 0xc8
function private shock_rumble_loop() {
    self notify(#"shock_rumble_loop");
    self endon(#"shock_rumble_loop", #"death", #"disconnect");
    waitframe(1);
    if (!isplayer(self)) {
        return;
    }
    while (isdefined(self) && (isdefined(self.var_dda9b735.isshocked) ? self.var_dda9b735.isshocked : 0)) {
        self playrumbleonentity("shock_rumble");
        wait(0.1);
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 1, eflags: 0x1 linked
// Checksum 0x1dae890f, Offset: 0x1b40
// Size: 0x2a4
function function_6db15645(target) {
    if (self.var_a5b686b6 >= 3) {
        scoreevents::processscoreevent(#"hash_4c3a3c0de382362f", self.owner, target, self.arcweapon);
    }
    if (isdefined(self.owner)) {
        if (target status_effect::function_3c54ae98(5) > 0) {
            self.owner damagefeedback::update(undefined, undefined, "resistance", self.arcweapon, target, undefined, undefined, undefined, undefined, 1);
        } else {
            self.owner util::show_hit_marker(0, 1);
        }
    }
    target.var_dda9b735.state = 0;
    target.var_a7679005 = self.owner;
    target.var_7ef2427c = self.arcweapon;
    target freezecontrolsallowlook(1);
    target allowjump(0);
    target allowmelee(0);
    target disableweaponcycling();
    target thread shock_rumble_loop();
    self.var_a5b686b6++;
    target clientfield::set("seeker_mine_shock", 1);
    self thread function_a78e666b(target, "j_spineupper", (0, 0, 10), 0);
    tag = "tag_origin";
    pos = (0, 0, target getplayerviewheight() - 10);
    forward = anglestoforward(target.angles);
    pos -= forward * 5;
    self thread function_a78e666b(target, tag, pos, 1);
    target thread watchtargetdeath(self);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 4, eflags: 0x1 linked
// Checksum 0xd2f436dc, Offset: 0x1df0
// Size: 0x28c
function function_a78e666b(target, tag, offset = (0, 0, 0), var_9bd28e34) {
    self endon(#"death");
    target endon(#"death");
    util::wait_network_frame();
    tagfx = function_f0eb3dbb();
    tagpos = self gettagorigin(tagfx);
    if (!isdefined(tagpos)) {
        return;
    }
    pos = target gettagorigin(tag);
    if (!isdefined(pos)) {
        pos = (0, 0, 0);
    }
    pos += offset;
    var_1a9a5cee = spawn("script_model", pos);
    var_1a9a5cee setmodel("tag_origin");
    beam = beamlaunch(self, var_1a9a5cee, tagfx, "tag_origin", self.arcweapon);
    if (var_9bd28e34) {
        var_1a9a5cee setinvisibletoall();
        var_1a9a5cee setvisibletoplayer(target);
        if (isdefined(beam)) {
            beam setinvisibletoall();
            beam setvisibletoplayer(target);
        }
    } else {
        var_1a9a5cee setinvisibletoplayer(target);
        if (isdefined(beam)) {
            beam setinvisibletoplayer(target);
        }
    }
    var_1a9a5cee thread function_9a66b97b(target, tag, offset, tagpos, self);
    level thread function_7fe95ae0(var_1a9a5cee);
    target thread function_d688b485(var_1a9a5cee);
    self thread function_d688b485(var_1a9a5cee);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 5, eflags: 0x1 linked
// Checksum 0xfd5b61a7, Offset: 0x2088
// Size: 0x1de
function function_9a66b97b(target, tag, offset = (0, 0, 0), tagpos, seekermine) {
    seekermine endon(#"death");
    self endon(#"death");
    target endon(#"death");
    self clientfield::set("seeker_mine_fx", 1);
    while (true) {
        pos = target gettagorigin(tag);
        if (!isdefined(pos)) {
            pos = (0, 0, 0);
        }
        pos += offset;
        self.origin = pos;
        dir = pos - tagpos;
        dir = vectornormalize(dir);
        self.angles = vectortoangles(dir);
        if (isdefined(target.var_dda9b735.state) && (target.var_dda9b735.state == 4 || target.var_dda9b735.state == 2)) {
            self clientfield::set("seeker_mine_fx", 2);
            target clientfield::set("seeker_mine_shock", 2);
        }
        waitframe(1);
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 1, eflags: 0x1 linked
// Checksum 0x642dc697, Offset: 0x2270
// Size: 0x164
function watchtargetdeath(seekermine) {
    seekermine endon(#"death");
    params = self waittill(#"death");
    var_86e4cf17 = isdefined(params.attacker) && isplayer(params.attacker) && isdefined(seekermine.owner) && seekermine.owner == params.attacker;
    if (isdefined(params.mod) && params.mod == "MOD_HEAD_SHOT" && var_86e4cf17) {
        scoreevents::processscoreevent(#"seeker_shock_mine_paralyzed_headshot", seekermine.owner, self, params.weapon);
        seekermine.owner globallogic_score::specialistmedalachievement(level.var_9d47488.weapon, undefined);
    }
    wait(2);
    if (isdefined(seekermine)) {
        seekermine function_afd97197();
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 1, eflags: 0x1 linked
// Checksum 0x427db631, Offset: 0x23e0
// Size: 0x6c
function function_d688b485(var_1a9a5cee) {
    var_1a9a5cee endon(#"death");
    self waittill(#"death");
    if (isdefined(var_1a9a5cee)) {
        var_1a9a5cee delete();
        self.seeker_fx delete();
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 1, eflags: 0x1 linked
// Checksum 0x81429d82, Offset: 0x2458
// Size: 0x44
function function_7fe95ae0(var_1a9a5cee) {
    var_1a9a5cee endon(#"death");
    wait(11);
    if (isdefined(var_1a9a5cee)) {
        var_1a9a5cee delete();
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 3, eflags: 0x1 linked
// Checksum 0xfbd2af2e, Offset: 0x24a8
// Size: 0x156
function function_724e8f1c(var_26b2b1bb, arcsource, depth) {
    /#
        if (isgodmode(self)) {
            return 0;
        }
    #/
    if (isplayer(self)) {
        if (!(isdefined(self.var_cf18d244) && self.var_cf18d244)) {
            self function_3653370a(var_26b2b1bb, arcsource);
        } else {
            self.var_dda9b735.isshocked = 1;
            self thread function_e380fde7(undefined, "gestable_shocked_reaction", level.var_9d47488.tunables.var_1f80b74 + level.var_9d47488.tunables.var_9abfd5cf, 1, 0);
            self.seekermine = arcsource;
            self.var_8103e91a = var_26b2b1bb;
        }
        function_1750438e(level.var_9d47488.tunables.var_1aab44e0, arcsource.arcweapon, arcsource.owner);
        return self.seeker_mine_se.var_77449e9;
    }
    return 0;
}

// Namespace seeker_mine_mp/seeker_mine
// Params 3, eflags: 0x1 linked
// Checksum 0x2cd3d42e, Offset: 0x2608
// Size: 0xac
function function_1750438e(effect, weapon, owner) {
    if (isdefined(self.seeker_mine_se)) {
        self status_effect::function_408158ef(self.seeker_mine_se.setype, self.seeker_mine_se.var_18d16a6b);
        self.seeker_mine_se = undefined;
    }
    if (isdefined(effect)) {
        self.seeker_mine_se = getstatuseffect(effect);
        self status_effect::status_effect_apply(self.seeker_mine_se, weapon, owner);
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 3, eflags: 0x1 linked
// Checksum 0xb4b664f7, Offset: 0x26c0
// Size: 0x144
function cleartarget(target, var_26b2b1bb, seekermine) {
    function_1750438e();
    target freezecontrolsallowlook(0);
    target setviewclamp(0, 0, 0, 0);
    target allowjump(1);
    target allowmelee(1);
    target stoprumble("shock_rumble");
    target enableweaponcycling();
    target clientfield::set("seeker_mine_shock", 0);
    if (isdefined(target.var_dda9b735)) {
        target.var_dda9b735.isshocked = 0;
    }
    target.var_bb257569 = gettime() + 3000;
    if (isdefined(seekermine)) {
        seekermine function_afd97197();
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0x305447a7, Offset: 0x2810
// Size: 0x3c
function function_afd97197() {
    self seeker_mine::function_afd97197();
    self clientfield::set("enemyvehicle", 0);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0xf9049f8c, Offset: 0x2858
// Size: 0x15c
function function_3653370a(var_26b2b1bb, seekermine) {
    self notify(#"hash_3319597daca726ad");
    self.var_dda9b735.state = 0;
    self.var_dda9b735.prompt = 0;
    self.var_dda9b735.isshocked = 1;
    self thread function_e380fde7(undefined, "gestable_shocked_reaction", level.var_9d47488.tunables.var_1f80b74 + level.var_9d47488.tunables.var_9abfd5cf, 1, 0);
    self.seekermine = seekermine;
    self.var_8103e91a = var_26b2b1bb;
    self thread function_6c31fc8f(seekermine, var_26b2b1bb);
    self thread function_e56220fe();
    self thread function_dfbbefb8();
    self thread function_6c023d11();
    self thread function_f6f0c876(var_26b2b1bb, seekermine);
    self thread function_ef690fef(seekermine, var_26b2b1bb);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0x177dbbc3, Offset: 0x29c0
// Size: 0x6c
function function_ef690fef(seekermine, var_26b2b1bb) {
    self endon(#"death");
    seekermine endon(#"death");
    self waittill(#"minigame_laststand");
    function_b6ee86e3(seekermine, var_26b2b1bb);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0x42d1be30, Offset: 0x2a38
// Size: 0x74
function function_6c31fc8f(seekermine, var_26b2b1bb) {
    self endon(#"death");
    seekermine waittill(#"death");
    self notify(#"hash_11759ff8ab95f65c");
    self notify(#"seekermine_minigame_complete");
    function_b6ee86e3(seekermine, var_26b2b1bb);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 1, eflags: 0x1 linked
// Checksum 0xfb1e53b, Offset: 0x2ab8
// Size: 0x7c
function function_44cae5c5(time) {
    self waittilltimeout(time, #"death");
    if (!isdefined(self)) {
        return;
    }
    if (level.var_9d47488.prompt seeker_mine_prompt::is_open(self)) {
        level.var_9d47488.prompt seeker_mine_prompt::close(self);
    }
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0xafdec948, Offset: 0x2b40
// Size: 0x1e2
function function_dfbbefb8() {
    self endon(#"death", #"seekermine_minigame_complete");
    level notify(#"hash_f7be71cd0b3dc06");
    if (!(self status_effect::function_3c54ae98(5) > 0)) {
        level.var_9d47488.prompt seeker_mine_prompt::open(self, 0);
        self thread function_44cae5c5(level.var_9d47488.tunables.var_1f80b74);
    }
    wait(level.var_9d47488.tunables.var_2fa95b34);
    self.var_dda9b735.prompt = 1;
    if (self status_effect::function_3c54ae98(5) > 0) {
        return;
    }
    self thread function_7d2591b();
    wait(level.var_9d47488.tunables.var_170c494e);
    self.var_dda9b735.prompt = 2;
    self.var_dda9b735.var_aacd5e7c = gettime();
    wait(level.var_9d47488.tunables.var_5ee35075);
    wait(level.var_9d47488.tunables.var_b9cf9139);
    self.var_dda9b735.prompt = 0;
    wait(level.var_9d47488.tunables.var_9bdbf8df);
    self notify(#"hash_13bc4f053f8da5b0");
    self.var_dda9b735.prompt = 3;
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0x58291166, Offset: 0x2d30
// Size: 0xc4
function function_7d2591b() {
    self endon(#"death", #"seekermine_minigame_complete");
    waittime = level.var_9d47488.tunables.var_170c494e * 1000;
    starttime = gettime();
    do {
        progress = (gettime() - starttime) / waittime;
        level.var_9d47488.prompt seeker_mine_prompt::set_progress(self, 1 - progress);
        waitframe(1);
    } while (progress < 1.2);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0x707ed74b, Offset: 0x2e00
// Size: 0x3e
function function_6c023d11() {
    self endon(#"death");
    while (isdefined(self.seekermine)) {
        waitframe(1);
    }
    self notify(#"hash_89051c7805b3d19");
}

// Namespace seeker_mine_mp/seeker_mine
// Params 0, eflags: 0x1 linked
// Checksum 0xd4114d6f, Offset: 0x2e48
// Size: 0x266
function function_e56220fe() {
    self endon(#"death");
    var_d04b86 = self usebuttonpressed();
    while (self.var_dda9b735.prompt < 3) {
        pressed = self usebuttonpressed();
        if (var_d04b86) {
            if (!pressed) {
                var_d04b86 = 0;
            }
        } else if (self status_effect::function_3c54ae98(5) > 0 && self.var_dda9b735.prompt == 1) {
            self.var_dda9b735.state = 1;
            break;
        } else if (pressed) {
            if (self.var_dda9b735.prompt == 1) {
                self.var_dda9b735.state = 1;
            } else if (self.var_dda9b735.prompt == 2) {
                lastservertime = self function_eec9eb49();
                if (lastservertime < self.var_dda9b735.var_aacd5e7c) {
                    self.var_dda9b735.state = 1;
                } else {
                    self.var_dda9b735.state = 2;
                }
            } else {
                self.var_dda9b735.state = 2;
            }
            break;
        }
        level.var_9d47488.prompt seeker_mine_prompt::set_promptstate(self, self.var_dda9b735.state);
        waitframe(1);
    }
    if (self.var_dda9b735.state == 0) {
        self.var_dda9b735.state = 4;
    }
    level.var_9d47488.prompt seeker_mine_prompt::set_promptstate(self, self.var_dda9b735.state);
    self notify(#"seekermine_minigame_complete");
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0x8c25d616, Offset: 0x30b8
// Size: 0x51c
function function_f6f0c876(var_26b2b1bb, seekermine) {
    self endon(#"hash_11759ff8ab95f65c");
    waitresult = self waittill(#"seekermine_minigame_complete", #"death");
    if (waitresult._notify == "death") {
        return;
    }
    self notify(#"hash_13bc4f053f8da5b0");
    gesturetable = "gestable_shocked_reaction";
    var_84a7f98e = undefined;
    waitduration = 0;
    animdelay = 0;
    islooping = 1;
    if (!isdefined(seekermine)) {
        self.var_dda9b735.state = 3;
    }
    switch (self.var_dda9b735.state) {
    case 4:
        waitduration = level.var_9d47488.tunables.var_9abfd5cf;
        println("<unknown string>");
        self playsoundtoplayer(#"hash_951679e7e599a15", self);
        if (isdefined(level.var_9d47488.tunables.var_a60d049b)) {
            self playrumbleonentity(level.var_9d47488.tunables.var_a60d049b);
        }
        self battlechatter::pain_vox("MOD_ELECTROCUTED", self.arcweapon);
        function_1750438e(level.var_9d47488.tunables.var_7553d738, seekermine.arcweapon, seekermine.owner);
        break;
    case 1:
        gesturetable = "gestable_shocked_success";
        var_84a7f98e = getweapon(#"hash_597ead6ff2ce9284");
        islooping = 0;
        self playsoundtoplayer(#"hash_74864310c6a986a8", self);
        self battlechatter::function_72b65730();
        function_1750438e(level.var_9d47488.tunables.var_df3ed3fd, seekermine.arcweapon, seekermine.owner);
        animdelay = level.var_9d47488.tunables.var_a06eff0b;
        println("<unknown string>");
        break;
    case 2:
        waitduration = level.var_9d47488.tunables.var_c0c99398;
        self playsoundtoplayer(#"hash_951679e7e599a15", self);
        self battlechatter::pain_vox("MOD_ELECTROCUTED", self.arcweapon);
        function_1750438e(level.var_9d47488.tunables.var_292fba11, seekermine.arcweapon, seekermine.owner);
        println("<unknown string>");
        break;
    case 3:
        gesturetable = "gestable_shocked_success";
        var_84a7f98e = getweapon(#"hash_597ead6ff2ce9284");
        islooping = 0;
        self playsoundtoplayer(#"hash_74864310c6a986a8", self);
        println("<unknown string>");
        break;
    default:
        assert(0);
        break;
    }
    self thread function_e380fde7(var_84a7f98e, gesturetable, waitduration, islooping, animdelay);
    self thread function_24d08109(seekermine, waitduration, var_26b2b1bb, self.var_dda9b735.state);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 4, eflags: 0x1 linked
// Checksum 0x9abd7288, Offset: 0x35e0
// Size: 0xcc
function function_24d08109(seekermine, waitduration, var_26b2b1bb, state) {
    self notify("d5876c031211735");
    self endon("d5876c031211735");
    self endon(#"death");
    self waittilltimeout(waitduration, #"hash_89051c7805b3d19");
    if (state == 1) {
        wait(level.var_9d47488.tunables.var_e8e9a9cc);
    } else {
        thread function_e380fde7(undefined, undefined, 0, 0, 0);
    }
    cleartarget(self, var_26b2b1bb, seekermine);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 2, eflags: 0x1 linked
// Checksum 0xb863661b, Offset: 0x36b8
// Size: 0x5c
function function_b6ee86e3(seekermine, var_26b2b1bb) {
    level.var_9d47488.prompt seeker_mine_prompt::close(self);
    self function_24d08109(seekermine, 0, var_26b2b1bb, 3);
}

// Namespace seeker_mine_mp/seeker_mine
// Params 5, eflags: 0x1 linked
// Checksum 0xba0ee68a, Offset: 0x3720
// Size: 0x2e2
function function_e380fde7(var_84a7f98e, gesturetable, waitduration, islooping, animdelay) {
    self notify("49a0bba57c17e324");
    self endon("49a0bba57c17e324");
    self endon(#"death");
    wait(animdelay);
    if (isdefined(var_84a7f98e) && var_84a7f98e == level.weaponnone) {
        var_84a7f98e = undefined;
    }
    if (isdefined(gesturetable)) {
        newgesture = self gestures::function_c77349d4(gesturetable);
    }
    if (isdefined(self.var_dda9b735.gesture) && (isdefined(var_84a7f98e) || isdefined(newgesture) && newgesture != self.var_dda9b735.gesture)) {
        self stopgestureviewmodel(self.var_dda9b735.gesture, 50, 1);
        self.var_dda9b735.gesture = undefined;
        self.var_dda9b735.islooping = undefined;
    }
    if (isdefined(var_84a7f98e) && var_84a7f98e != getweapon(#"none")) {
        self.var_dda9b735.gesture = undefined;
        self.var_dda9b735.islooping = undefined;
        self thread gestures::function_f3e2696f(self, var_84a7f98e, undefined, 1.5, undefined, undefined, undefined);
    } else if (isdefined(newgesture)) {
        while (isdefined(self.var_dda9b735.isshocked) ? self.var_dda9b735.isshocked : 0) {
            if (self gestures::play_gesture(newgesture, undefined, 1)) {
                self.var_dda9b735.gesture = newgesture;
                self.var_dda9b735.islooping = islooping;
                break;
            }
            waitframe(1);
        }
    }
    if (isdefined(self.var_dda9b735.islooping) && self.var_dda9b735.islooping) {
        self waittilltimeout(waitduration, #"hash_89051c7805b3d19");
        if (isdefined(self) && isdefined(self.var_dda9b735.gesture)) {
            self stopgestureviewmodel(self.var_dda9b735.gesture, 0, 0);
            self.var_dda9b735.gesture = undefined;
            self.var_dda9b735.islooping = undefined;
        }
    }
}

