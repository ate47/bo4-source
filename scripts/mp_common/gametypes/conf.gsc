// Atian COD Tools GSC decompiler test
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/mp_common/gametypes/spawning.gsc;
#include scripts/mp_common/gametypes/match.gsc;
#include scripts/mp_common/gametypes/hostmigration.gsc;
#include scripts/mp_common/gametypes/globallogic_score.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/mp_common/gametypes/dogtags.gsc;
#include script_4c8dba49908aecc2;
#include scripts/killstreaks/killstreaks_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/spawning_shared.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/gameobjects_shared.gsc;

#namespace conf;

// Namespace conf/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x6837875, Offset: 0x158
// Size: 0x26c
function event<gametype_init> main(eventstruct) {
    globallogic::init();
    util::registertimelimit(0, 1440);
    util::registerscorelimit(0, 50000);
    util::registerroundlimit(0, 10);
    util::registerroundswitch(0, 9);
    util::registerroundwinlimit(0, 10);
    util::registernumlives(0, 100);
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    level.scoreroundwinbased = getgametypesetting(#"cumulativeroundscores") == 0;
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    player::function_cf3aa03d(&onplayerkilled);
    level.overrideteamscore = 1;
    level.teamscoreperkill = getgametypesetting(#"teamscoreperkill");
    level.teamScorePerKillConfirmed = getgametypesetting(#"teamScorePerKillConfirmed");
    level.teamScorePerKillDenied = getgametypesetting(#"teamScorePerKillDenied");
    level.var_cdb8ae2c = &function_a8da260c;
    globallogic_audio::set_leader_gametype_dialog("startKillConfirmed", "hcStartKillConfirmed", "gameBoost", "gameBoost", "bbStartKillConfirmed", "hcbbStartKillConfirmed");
    if (util::function_8570168d()) {
        level.var_c7494a5d = 1;
        namespace_9096c917::init();
    }
}

// Namespace conf/conf
// Params 0, eflags: 0x0
// Checksum 0x3afdf3b3, Offset: 0x3d0
// Size: 0xec
function function_a8da260c() {
    foreach (team, _ in level.teams) {
        spawning::place_spawn_points(spawning::gettdmstartspawnname(team));
        spawning::add_spawn_points(team, "mp_tdm_spawn");
        spawning::add_start_spawn_points(team, spawning::gettdmstartspawnname(team));
    }
    spawning::updateallspawnpoints();
}

// Namespace conf/conf
// Params 0, eflags: 0x0
// Checksum 0x238cc39, Offset: 0x4c8
// Size: 0x36
function onstartgametype() {
    dogtags::init();
    if (!util::isoneround()) {
        level.displayroundendtext = 1;
    }
}

// Namespace conf/conf
// Params 9, eflags: 0x0
// Checksum 0x47065c9c, Offset: 0x508
// Size: 0x11c
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (!isplayer(attacker) || attacker.team == self.team) {
        return;
    }
    level thread dogtags::spawn_dog_tag(self, attacker, &onuse, 1);
    if (!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || isdefined(level.killstreaksgivegamescore) && level.killstreaksgivegamescore) {
        attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperkill);
    }
}

// Namespace conf/conf
// Params 1, eflags: 0x0
// Checksum 0x73c096db, Offset: 0x630
// Size: 0x286
function onuse(player) {
    tacinsertboost = 0;
    player.pers[#"objectives"]++;
    player.objectives = player.pers[#"objectives"];
    if (player.team != self.attackerteam) {
        tacinsertboost = self.tacinsert;
        if (isdefined(self.attacker) && self.attacker.team == self.attackerteam) {
            self.attacker luinotifyevent(#"player_callout", 2, #"hash_2645b0c08b8b19b9", player.entnum);
        }
        if (!tacinsertboost) {
            player globallogic_score::giveteamscoreforobjective(player.team, level.teamScorePerKillDenied);
        }
    } else {
        /#
            /#
                assert(isdefined(player.var_d6610c31));
            #/
            /#
                assert(isdefined(player.var_26eb86ef));
            #/
        #/
        player.pers[#"killsconfirmed"]++;
        player.killsconfirmed = player.pers[#"killsconfirmed"];
        player globallogic_score::giveteamscoreforobjective(player.team, level.teamScorePerKillConfirmed);
        if (!tacinsertboost) {
            currenttime = gettime();
            if (player.var_d6610c31 + 4000 > currenttime) {
                player.var_26eb86ef++;
                if (player.var_26eb86ef >= 3) {
                    scoreevents::processscoreevent(#"hash_72c5b3896c4a8809", player, undefined, undefined);
                    player.var_26eb86ef = 0;
                }
            } else {
                player.var_26eb86ef = 1;
            }
            player.var_d6610c31 = currenttime;
        }
    }
}

// Namespace conf/conf
// Params 1, eflags: 0x0
// Checksum 0x5361eec2, Offset: 0x8c0
// Size: 0x7c
function onspawnplayer(predictedspawn) {
    self.usingobj = undefined;
    if (level.usestartspawns && !level.ingraceperiod) {
        level.usestartspawns = 0;
    }
    self.var_d6610c31 = 0;
    self.var_26eb86ef = 0;
    spawning::onspawnplayer(predictedspawn);
    dogtags::on_spawn_player();
}

