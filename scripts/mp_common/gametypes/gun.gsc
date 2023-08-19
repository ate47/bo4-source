// Atian COD Tools GSC decompiler test
#include scripts/mp_common/draft.gsc;
#include scripts/abilities/ability_util.gsc;
#include scripts/weapons/weapon_utils.gsc;
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/mp_common/player/player_loadout.gsc;
#include scripts/mp_common/gametypes/round.gsc;
#include scripts/mp_common/gametypes/match.gsc;
#include scripts/mp_common/gametypes/globallogic_spawn.gsc;
#include scripts/mp_common/gametypes/globallogic_score.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/core_common/player/player_loadout.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/spawning_shared.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/rank_shared.gsc;
#include scripts/core_common/persistence_shared.gsc;
#include scripts/core_common/gameobjects_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace gun;

// Namespace gun/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x5d1de2eb, Offset: 0x318
// Size: 0x10c4
function event<gametype_init> main(eventstruct) {
    globallogic::init();
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    player::function_cf3aa03d(&onplayerkilled);
    level.onendgame = &onendgame;
    level.var_cdb8ae2c = &function_a8da260c;
    level.var_a962eeb6 = &function_486a8395;
    callback::on_connect(&onconnect);
    globallogic_audio::set_leader_gametype_dialog("startGunGame", "hcSstartGunGame", "", "", "bbStartGunGame", "hcbbSstartGunGame");
    level.givecustomloadout = &givecustomloadout;
    level.var_6c480499 = getgametypesetting(#"setbacks");
    level.inactivitykick = 120;
    level.var_f46d16f0 = 1;
    setdvar(#"hash_137c8b2b96ac6c72", 0.2);
    setdvar(#"compassradarpingfadetime", 0.75);
    globallogic_spawn::addsupportedspawnpointtype("gg");
    level.var_4e727991 = [];
    var_a807bb30 = getgametypesetting(#"gunselection");
    if (var_a807bb30 == 4) {
        var_a807bb30 = randomintrange(0, 4);
    }
    switch (var_a807bb30) {
    case 0:
        function_5f3fa9d1(#"pistol_standard_t8");
        function_5f3fa9d1(#"pistol_burst_t8", "grip");
        function_5f3fa9d1(#"shotgun_semiauto_t8");
        function_5f3fa9d1(#"shotgun_pump_t8", "extbarrel", "quickdraw");
        function_5f3fa9d1(#"smg_fastfire_t8", "steadyaim", "extclip");
        function_5f3fa9d1(#"smg_accurate_t8", "extbarrel", "extbarrel2");
        function_5f3fa9d1(#"smg_handling_t8", "stalker", "quickdraw");
        function_5f3fa9d1(#"ar_accurate_t8", "grip", "grip2", "reflex");
        function_5f3fa9d1(#"ar_fastfire_t8", "elo", "steadyaim", "stalker");
        function_5f3fa9d1(#"ar_damage_t8", "reflex", "extbarrel");
        function_5f3fa9d1(#"ar_stealth_t8", "elo", "suppressed");
        function_5f3fa9d1(#"tr_midburst_t8", "quickdraw", "grip");
        function_5f3fa9d1(#"tr_powersemi_t8", "uber");
        function_5f3fa9d1(#"lmg_standard_t8", "stalker", "reflex");
        function_5f3fa9d1(#"lmg_spray_t8", "rf", "uber");
        function_5f3fa9d1(#"sniper_powersemi_t8", "is");
        function_5f3fa9d1(#"sniper_quickscope_t8", "uber");
        function_5f3fa9d1(#"sniper_powerbolt_t8", "adsreload", "mms");
        function_5f3fa9d1(#"launcher_standard_t8", "damage", "supply");
        function_5f3fa9d1(#"special_ballisticknife_t8_dw");
        break;
    case 1:
        function_5f3fa9d1(#"pistol_revolver_t8");
        function_5f3fa9d1(#"pistol_standard_t8", "suppressed");
        function_5f3fa9d1(#"pistol_burst_t8", "elo", "quickdraw");
        function_5f3fa9d1(#"shotgun_pump_t8", "elo", "quickdraw");
        function_5f3fa9d1(#"shotgun_semiauto_t8", "steadyaim");
        function_5f3fa9d1(#"smg_standard_t8", "mixclip", "reflex");
        function_5f3fa9d1(#"smg_capacity_t8", "grip");
        function_5f3fa9d1(#"smg_fastfire_t8", "extclip", "uber");
        function_5f3fa9d1(#"smg_accurate_t8", "suppressed");
        function_5f3fa9d1(#"smg_handling_t8", "dw");
        function_5f3fa9d1(#"ar_fastfire_t8", "elo", "uber");
        function_5f3fa9d1(#"ar_modular_t8", "extclip", "grip");
        function_5f3fa9d1(#"ar_stealth_t8", "uber");
        function_5f3fa9d1(#"ar_damage_t8", "extbarrel");
        function_5f3fa9d1(#"tr_midburst_t8", "elo");
        function_5f3fa9d1(#"lmg_standard_t8", "quickdraw");
        function_5f3fa9d1(#"lmg_spray_t8", "uber");
        function_5f3fa9d1(#"sniper_quickscope_t8", "is", "steadyaim");
        function_5f3fa9d1(#"launcher_standard_t8", "damage");
        function_5f3fa9d1(#"special_ballisticknife_t8_dw");
        break;
    case 2:
        function_5f3fa9d1(#"pistol_revolver_t8", "uber");
        function_5f3fa9d1(#"smg_standard_t8", "ir", "reflex");
        function_5f3fa9d1(#"smg_accurate_t8", "uber", "acog");
        function_5f3fa9d1(#"ar_modular_t8", "extclip", "holo");
        function_5f3fa9d1(#"ar_accurate_t8", "dualoptic", "grip");
        function_5f3fa9d1(#"ar_fastfire_t8", "holo", "uber");
        function_5f3fa9d1(#"ar_damage_t8", "mms", "extbarrel");
        function_5f3fa9d1(#"ar_stealth_t8", "mms", "extbarrel");
        function_5f3fa9d1(#"tr_longburst_t8", "acog", "quickdraw", "quickdraw2");
        function_5f3fa9d1(#"tr_midburst_t8", "ir");
        function_5f3fa9d1(#"tr_powersemi_t8", "dualoptic");
        function_5f3fa9d1(#"lmg_standard_t8", "ir");
        function_5f3fa9d1(#"lmg_heavy_t8", "dualoptic", "uber");
        function_5f3fa9d1(#"lmg_spray_t8", "ir");
        function_5f3fa9d1(#"sniper_fastrechamber_t8", "uber");
        function_5f3fa9d1(#"sniper_quickscope_t8", "swayreduc");
        function_5f3fa9d1(#"sniper_powersemi_t8", "ir");
        function_5f3fa9d1(#"sniper_powerbolt_t8", "adsreload", "swayreduc");
        function_5f3fa9d1(#"launcher_standard_t8", "damage");
        function_5f3fa9d1(#"special_ballisticknife_t8_dw");
        break;
    case 3:
        function_5f3fa9d1(#"pistol_fullauto_t8", "reflex", "grip", "fastreload");
        function_5f3fa9d1(#"pistol_revolver_t8");
        function_5f3fa9d1(#"shotgun_fullauto_t8", "grip", "reflex");
        function_5f3fa9d1(#"smg_folding_t8", "elo", "grip");
        function_5f3fa9d1(#"smg_capacity_t8", "grip");
        function_5f3fa9d1(#"smg_fastburst_t8", "reflex", "steadyaim");
        function_5f3fa9d1(#"ar_standard_t8", "quickdraw", "fastreload");
        function_5f3fa9d1(#"ar_stealth_t8", "elo", "uber");
        function_5f3fa9d1(#"ar_damage_t8", "holo", "extbarrel");
        function_5f3fa9d1(#"ar_fastfire_t8", "elo", "uber");
        function_5f3fa9d1(#"ar_accurate_t8", "holo", "extbarrel");
        function_5f3fa9d1(#"tr_longburst_t8", "quickdraw", "quickdraw2");
        function_5f3fa9d1(#"tr_powersemi_t8", "fastreload");
        function_5f3fa9d1(#"lmg_standard_t8", "ir");
        function_5f3fa9d1(#"lmg_heavy_t8", "holo", "uber");
        function_5f3fa9d1(#"sniper_powersemi_t8", "is");
        function_5f3fa9d1(#"sniper_quickscope_t8", "steadyaim");
        function_5f3fa9d1(#"sniper_powerbolt_t8", "adsreload", "swayreduc");
        function_5f3fa9d1(#"launcher_standard_t8", "damage");
        function_5f3fa9d1(#"special_ballisticknife_t8_dw");
        break;
    }
    util::registertimelimit(0, 1440);
    util::registerroundlimit(0, 10);
    util::registerroundwinlimit(0, 10);
    util::registernumlives(0, 100);
}

// Namespace gun/gun
// Params 0, eflags: 0x1 linked
// Checksum 0xae68b79c, Offset: 0x13e8
// Size: 0xdc
function function_a8da260c() {
    foreach (team, _ in level.teams) {
        spawning::add_spawn_points(team, "mp_dm_spawn");
        spawning::place_spawn_points("mp_dm_spawn_start");
    }
    level.spawn_start = spawning::get_spawnpoint_array("mp_dm_spawn_start");
    spawning::updateallspawnpoints();
}

// Namespace gun/gun
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x14d0
// Size: 0x4
function onconnect() {
    
}

// Namespace gun/gun
// Params 0, eflags: 0x1 linked
// Checksum 0x9ed709bb, Offset: 0x14e0
// Size: 0x8c
function onstartgametype() {
    level.var_da82e6d4 = rank::getscoreinfovalue("kill_gun");
    util::registerscorelimit(level.var_4e727991.size * level.var_da82e6d4, level.var_4e727991.size * level.var_da82e6d4);
    level.displayroundendtext = 0;
    globallogic_spawn::addspawns();
}

// Namespace gun/gun
// Params 0, eflags: 0x1 linked
// Checksum 0x80b9eba5, Offset: 0x1578
// Size: 0x194
function inactivitykick() {
    self endon(#"disconnect", #"death");
    if (sessionmodeisprivate()) {
        return;
    }
    if (level.inactivitykick == 0) {
        return;
    }
    while (level.inactivitykick > self.timeplayed[#"total"]) {
        wait(1);
    }
    if (self.pers[#"participation"] == 0 && self.pers[#"time_played_moving"] < 1) {
        globallogic::gamehistoryplayerkicked();
        kick(self getentitynumber(), "GAME/DROPPEDFORINACTIVITY");
    }
    if (self.pers[#"participation"] == 0 && self.timeplayed[#"total"] > 60) {
        globallogic::gamehistoryplayerkicked();
        kick(self getentitynumber(), "GAME/DROPPEDFORINACTIVITY");
    }
}

// Namespace gun/gun
// Params 1, eflags: 0x1 linked
// Checksum 0xf137785, Offset: 0x1718
// Size: 0x6c
function onspawnplayer(predictedspawn) {
    if (!level.inprematchperiod) {
        level.usestartspawns = 0;
    }
    spawning::onspawnplayer(predictedspawn);
    self thread function_b7a266c8();
    self thread inactivitykick();
}

// Namespace gun/gun
// Params 9, eflags: 0x1 linked
// Checksum 0x81ea9961, Offset: 0x1790
// Size: 0x1f4
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    level.usestartspawns = 0;
    if (smeansofdeath == "MOD_SUICIDE" || smeansofdeath == "MOD_TRIGGER_HURT") {
        self thread function_ed2c6050();
        return;
    }
    if (isdefined(attacker) && isplayer(attacker)) {
        if (attacker == self) {
            self thread function_ed2c6050(attacker);
            return;
        }
        if (isdefined(attacker.var_6f5a82a) && attacker.var_6f5a82a + 3000 > gettime()) {
            scoreevents::processscoreevent(#"hash_3eed4672b9e50444", attacker, self, weapon);
        }
        if (weapon_utils::ismeleemod(smeansofdeath)) {
            scoreevents::processscoreevent(#"hash_62b00603fb96ce71", attacker, self, weapon);
            if (globallogic_score::gethighestscoringplayer() === self) {
                scoreevents::processscoreevent(#"hash_293752851784df04", attacker, self, weapon);
            }
            self thread function_ed2c6050(attacker);
        }
        if (smeansofdeath != "MOD_MELEE_WEAPON_BUTT") {
            attacker thread function_e53834b2(weapon);
        }
    }
}

// Namespace gun/gun
// Params 1, eflags: 0x1 linked
// Checksum 0xa8b1508e, Offset: 0x1990
// Size: 0x3c
function onendgame(var_c1e98979) {
    player = round::function_b5f4c9d8();
    match::set_winner(player);
}

// Namespace gun/gun
// Params 9, eflags: 0x1 linked
// Checksum 0xd7953c95, Offset: 0x19d8
// Size: 0x16a
function function_5f3fa9d1(weaponname, attachment1, attachment2, attachment3, attachment4, attachment5, attachment6, attachment7, var_d7d306d5) {
    attachments = [];
    if (isdefined(attachment1)) {
        attachments[attachments.size] = attachment1;
    }
    if (isdefined(attachment2)) {
        attachments[attachments.size] = attachment2;
    }
    if (isdefined(attachment3)) {
        attachments[attachments.size] = attachment3;
    }
    if (isdefined(attachment4)) {
        attachments[attachments.size] = attachment4;
    }
    if (isdefined(attachment5)) {
        attachments[attachments.size] = attachment5;
    }
    if (isdefined(attachment6)) {
        attachments[attachments.size] = attachment6;
    }
    if (isdefined(attachment7)) {
        attachments[attachments.size] = attachment7;
    }
    if (isdefined(var_d7d306d5)) {
        attachments[attachments.size] = var_d7d306d5;
    }
    weapon = getweapon(weaponname, attachments);
    level.var_4e727991[level.var_4e727991.size] = weapon;
}

// Namespace gun/gun
// Params 1, eflags: 0x1 linked
// Checksum 0x9bb33dee, Offset: 0x1b50
// Size: 0x4c
function takeoldweapon(oldweapon) {
    self endon(#"death", #"disconnect");
    wait(1);
    self takeweapon(oldweapon);
}

// Namespace gun/gun
// Params 1, eflags: 0x1 linked
// Checksum 0x4511776, Offset: 0x1ba8
// Size: 0x428
function givecustomloadout(takeoldweapon = 0) {
    self loadout::init_player(!takeoldweapon);
    self function_e6f9e3cd();
    self clearperks();
    perks = self getloadoutperks(0);
    foreach (perk in perks) {
        self setperk(perk);
    }
    if (takeoldweapon) {
        oldweapon = self getcurrentweapon();
        weapons = self getweaponslist();
        foreach (weapon in weapons) {
            if (weapon != oldweapon) {
                self takeweapon(weapon);
            }
        }
        self thread takeoldweapon(oldweapon);
    }
    if (!isdefined(self.var_91e03d9e)) {
        self.var_91e03d9e = 0;
    }
    currentweapon = level.var_4e727991[self.var_91e03d9e];
    self giveweapon(currentweapon);
    self switchtoweapon(currentweapon);
    if (self.firstspawn !== 0) {
        self setspawnweapon(currentweapon);
    }
    primaryoffhand = level.var_34d27b26;
    primaryoffhandcount = 0;
    self giveweapon(primaryoffhand);
    self setweaponammostock(primaryoffhand, primaryoffhandcount);
    self switchtooffhand(primaryoffhand);
    e_whippings = isdefined(getgametypesetting(#"hash_4ca06c610b5d53bd")) ? getgametypesetting(#"hash_4ca06c610b5d53bd") : 0;
    if (!e_whippings) {
        secondaryoffhand = getweapon(#"gadget_health_regen");
        secondaryoffhandcount = 0;
        self giveweapon(secondaryoffhand);
        self setweaponammoclip(secondaryoffhand, secondaryoffhandcount);
        self switchtooffhand(secondaryoffhand);
        loadout = self loadout::get_loadout_slot("specialgrenade");
        loadout.weapon = secondaryoffhand;
        loadout.count = secondaryoffhandcount;
        self ability_util::function_36a15b60(secondaryoffhand);
    }
    self setactionslot(3, "flourish_callouts");
    return currentweapon;
}

// Namespace gun/gun
// Params 1, eflags: 0x1 linked
// Checksum 0x303a1678, Offset: 0x1fd8
// Size: 0x19e
function function_e53834b2(var_aa415589) {
    self endon(#"disconnect", #"hash_7db8ed2ad531c87d");
    level endon(#"game_ended");
    waitframe(1);
    if (var_aa415589.rootweapon == level.var_4e727991[self.var_91e03d9e].rootweapon || isdefined(level.var_4e727991[self.var_91e03d9e].dualwieldweapon) && level.var_4e727991[self.var_91e03d9e].dualwieldweapon.rootweapon == var_aa415589.rootweapon) {
        if (self.var_91e03d9e < level.var_4e727991.size - 1) {
            self.var_91e03d9e++;
            if (isalive(self)) {
                self thread givecustomloadout(1);
            }
        }
        pointstowin = self.pers[#"pointstowin"];
        if (pointstowin < level.scorelimit) {
            scoreevents::processscoreevent(#"hash_795a2dd5e3a84200", self, undefined, var_aa415589);
            self globallogic_score::givepointstowin(level.var_da82e6d4);
        }
        self.var_6f5a82a = gettime();
    }
}

// Namespace gun/gun
// Params 1, eflags: 0x1 linked
// Checksum 0xd0763058, Offset: 0x2180
// Size: 0x23c
function function_ed2c6050(attacker) {
    self endon(#"disconnect");
    self notify(#"hash_7db8ed2ad531c87d");
    var_75ab01aa = self.var_91e03d9e;
    for (i = 0; i < level.var_6c480499; i++) {
        if (self.var_91e03d9e <= 0) {
            break;
        }
        self globallogic_score::givepointstowin(level.var_da82e6d4 * -1);
        globallogic_score::_setplayerscore(self, self.score - level.var_da82e6d4);
        self.var_91e03d9e--;
    }
    if (var_75ab01aa != self.var_91e03d9e && isalive(self)) {
        self thread givecustomloadout(1);
    }
    if (isdefined(attacker)) {
        self stats::function_bb7eedf0(#"hash_32e29284b36e4d45", 1);
        attacker recordgameevent("capture");
    }
    self stats::function_bb7eedf0(#"hash_74e72b5f43ad59be", 1);
    self.pers[#"humiliated"]++;
    self.humiliated = self.pers[#"humiliated"];
    self recordgameevent("return");
    self playlocalsound(#"mpl_wager_humiliate");
    self globallogic_audio::leader_dialog_on_player("humiliated");
}

// Namespace gun/gun
// Params 0, eflags: 0x1 linked
// Checksum 0x4322e6d7, Offset: 0x23c8
// Size: 0x70
function function_b7a266c8() {
    self endon(#"death", #"disconnect");
    while (1) {
        wait(0.1);
        weapon = self getcurrentweapon();
        self givemaxammo(weapon);
    }
}

// Namespace gun/gun
// Params 0, eflags: 0x1 linked
// Checksum 0xa0fee671, Offset: 0x2440
// Size: 0x10a
function function_486a8395() {
    var_6399b7fa = 3;
    /#
    #/
    var_f67da88e = level.var_4e727991.size;
    foreach (player in level.activeplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.var_91e03d9e)) {
            continue;
        }
        var_496c57a9 = level.var_4e727991.size - player.var_91e03d9e;
        if (var_f67da88e > var_496c57a9) {
            var_f67da88e = var_496c57a9;
        }
        if (var_6399b7fa >= var_f67da88e) {
            /#
            #/
            return 0;
        }
    }
    /#
    #/
    return 1;
}

