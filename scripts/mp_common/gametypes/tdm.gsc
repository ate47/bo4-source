// Atian COD Tools GSC decompiler test
#using scripts\mp_common\bb.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\dogtags.gsc;
#using scripts\killstreaks\mp\killstreaks.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using scripts\mp_common\gametypes\ct_tutorial_skirmish.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\gameobjects_shared.gsc;

#namespace tdm;

// Namespace tdm/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xd124a8fe, Offset: 0x1d0
// Size: 0x35e
function event_handler[gametype_init] main(eventstruct) {
    globallogic::init();
    util::registerroundswitch(0, 9);
    util::registertimelimit(0, 1440);
    util::registerscorelimit(0, 50000);
    util::registerroundscorelimit(0, 10000);
    util::registerroundlimit(0, 10);
    util::registerroundwinlimit(0, 10);
    util::registernumlives(0, 100);
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    level.scoreroundwinbased = getgametypesetting(#"cumulativeroundscores") == 0;
    level.teamscoreperkill = getgametypesetting(#"teamscoreperkill");
    level.teamscoreperdeath = getgametypesetting(#"teamscoreperdeath");
    level.teamscoreperheadshot = getgametypesetting(#"teamscoreperheadshot");
    level.killstreaksgivegamescore = getgametypesetting(#"killstreaksgivegamescore");
    level.overrideteamscore = 1;
    level.takelivesondeath = 1;
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    level.onroundswitch = &onroundswitch;
    level.onendround = &onendround;
    level.var_cdb8ae2c = &function_a8da260c;
    player::function_cf3aa03d(&onplayerkilled);
    globallogic_audio::set_leader_gametype_dialog("startTeamDeathmatch", "hcStartTeamDeathmatch", "gameBoost", "gameBoost", "bbStartTeamDeathmatch", "hcbbStartTeamDeathmatch");
    globallogic_spawn::addsupportedspawnpointtype("tdm");
    if (util::function_8570168d()) {
        ct_tutorial_skirmish::init();
    }
    if (getdvarint(#"hash_5795d85dc4b1b0d9", 0)) {
        level.var_49a15413 = getdvarint(#"hash_5795d85dc4b1b0d9", 0);
        level.scoremodifiercallback = &function_f9df98d3;
    }
}

// Namespace tdm/tdm
// Params 0, eflags: 0x1 linked
// Checksum 0xdd03835c, Offset: 0x538
// Size: 0xec
function function_a8da260c() {
    foreach (team, _ in level.teams) {
        spawning::add_spawn_points(team, "mp_tdm_spawn");
        spawning::place_spawn_points(spawning::gettdmstartspawnname(team));
        spawning::add_start_spawn_points(team, spawning::gettdmstartspawnname(team));
    }
    spawning::updateallspawnpoints();
}

// Namespace tdm/tdm
// Params 0, eflags: 0x1 linked
// Checksum 0x99d016f8, Offset: 0x630
// Size: 0xba
function onstartgametype() {
    level.displayroundendtext = 0;
    level thread onscoreclosemusic();
    if (!util::isoneround()) {
        level.displayroundendtext = 1;
        if (level.scoreroundwinbased) {
            globallogic_score::resetteamscores();
        }
    }
    if (isdefined(level.droppedtagrespawn) && level.droppedtagrespawn) {
        level.numlives = 1;
    }
    if (util::function_8570168d()) {
        level.playgadgetready = undefined;
    }
}

// Namespace tdm/tdm
// Params 1, eflags: 0x1 linked
// Checksum 0x52e1d7fe, Offset: 0x6f8
// Size: 0x64
function onspawnplayer(predictedspawn) {
    self.usingobj = undefined;
    if (level.usestartspawns && !level.ingraceperiod && !level.playerqueuedrespawn) {
        level.usestartspawns = 0;
    }
    spawning::onspawnplayer(predictedspawn);
}

// Namespace tdm/tdm
// Params 0, eflags: 0x1 linked
// Checksum 0x594955ff, Offset: 0x768
// Size: 0x24
function onroundswitch() {
    gametype::on_round_switch();
    globallogic_score::updateteamscorebyroundswon();
}

// Namespace tdm/tdm
// Params 1, eflags: 0x1 linked
// Checksum 0x73b850f6, Offset: 0x798
// Size: 0x24
function onendround(var_c1e98979) {
    function_e596b745(var_c1e98979);
}

// Namespace tdm/tdm
// Params 0, eflags: 0x1 linked
// Checksum 0x22f27d4, Offset: 0x7c8
// Size: 0x1a4
function onscoreclosemusic() {
    teamscores = [];
    while (!level.gameended) {
        scorelimit = level.scorelimit;
        scorethreshold = scorelimit * 0.1;
        scorethresholdstart = abs(scorelimit - scorethreshold);
        scorelimitcheck = scorelimit - 10;
        topscore = 0;
        runnerupscore = 0;
        foreach (team, _ in level.teams) {
            score = [[ level._getteamscore ]](team);
            if (score > topscore) {
                runnerupscore = topscore;
                topscore = score;
            } else if (score > runnerupscore) {
                runnerupscore = score;
            }
        }
        scoredif = topscore - runnerupscore;
        if (topscore >= scorelimit * 0.5) {
            level notify(#"sndmusichalfway");
            return;
        }
        wait(1);
    }
}

// Namespace tdm/tdm
// Params 9, eflags: 0x1 linked
// Checksum 0x3d8bb1cf, Offset: 0x978
// Size: 0x224
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (smeansofdeath == "MOD_META") {
        return;
    }
    if (isdefined(level.droppedtagrespawn) && level.droppedtagrespawn) {
        thread dogtags::checkallowspectating();
        should_spawn_tags = self dogtags::should_spawn_tags(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
        should_spawn_tags = should_spawn_tags && !globallogic_spawn::mayspawn();
        if (should_spawn_tags) {
            level thread dogtags::spawn_dog_tag(self, attacker, &dogtags::onusedogtag, 0);
        }
    }
    if (isplayer(attacker) == 0 || attacker.team == self.team) {
        return;
    }
    if (!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || isdefined(level.killstreaksgivegamescore) && level.killstreaksgivegamescore) {
        attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperkill);
        self globallogic_score::giveteamscoreforobjective(self.team, level.teamscoreperdeath * -1);
        if (smeansofdeath == "MOD_HEAD_SHOT") {
            attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperheadshot);
        }
    }
}

// Namespace tdm/tdm
// Params 1, eflags: 0x1 linked
// Checksum 0x6539d9e3, Offset: 0xba8
// Size: 0x114
function function_e596b745(var_c1e98979) {
    var_1e866967 = spawnstruct();
    var_1e866967.remainingtime = max(0, globallogic_utils::gettimeremaining());
    switch (var_c1e98979) {
    case 2:
        var_1e866967.wintype = "time_limit_reached";
        break;
    case 3:
        var_1e866967.wintype = "score_limit_reached";
        break;
    case 9:
    case 10:
    default:
        var_1e866967.wintype = "NA";
        break;
    }
    bb::function_bf5cad4e(var_1e866967);
}

// Namespace tdm/tdm
// Params 2, eflags: 0x1 linked
// Checksum 0x89c887c7, Offset: 0xcc8
// Size: 0x3e
function function_f9df98d3(type, value) {
    if (type === #"ekia") {
        return (value + level.var_49a15413);
    }
    return value;
}

