// Atian COD Tools GSC decompiler test
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/mp_common/gametypes/match.gsc;
#include scripts/mp_common/gametypes/round.gsc;
#include scripts/mp_common/gametypes/globallogic_spawn.gsc;
#include scripts/mp_common/gametypes/globallogic_score.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include script_4c8dba49908aecc2;
#include scripts/killstreaks/killstreaks_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/spawning_shared.gsc;

#namespace dm;

// Namespace dm/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xb8d3ef01, Offset: 0x160
// Size: 0x294
function event_handler[gametype_init] main(eventstruct) {
    globallogic::init();
    util::registertimelimit(0, 1440);
    util::registerscorelimit(0, 50000);
    util::registerroundlimit(0, 10);
    util::registerroundwinlimit(0, 10);
    util::registernumlives(0, 100);
    globallogic::registerfriendlyfiredelay(level.gametype, 0, 0, 1440);
    level.scoreroundwinbased = getgametypesetting(#"cumulativeroundscores") == 0;
    level.teamscoreperkill = getgametypesetting(#"teamscoreperkill");
    level.teamscoreperdeath = getgametypesetting(#"teamscoreperdeath");
    level.teamscoreperheadshot = getgametypesetting(#"teamscoreperheadshot");
    level.killstreaksgivegamescore = getgametypesetting(#"killstreaksgivegamescore");
    level.onstartgametype = &onstartgametype;
    player::function_cf3aa03d(&onplayerkilled);
    level.onspawnplayer = &onspawnplayer;
    level.onendgame = &onendgame;
    level.var_cdb8ae2c = &function_a8da260c;
    globallogic_spawn::addsupportedspawnpointtype("ffa");
    globallogic_audio::set_leader_gametype_dialog("startFreeForAll", "hcStartFreeForAll", "gameBoost", "gameBoost", "bbStartFreeForAll", "hcbbStartFreeForAll");
    if (util::function_8570168d()) {
        level.is_dm = 1;
        namespace_9096c917::init();
    }
}

// Namespace dm/dm
// Params 0, eflags: 0x0
// Checksum 0x9ecf058c, Offset: 0x400
// Size: 0xb4
function function_a8da260c() {
    foreach (team, _ in level.teams) {
        spawning::add_spawn_points(team, "mp_dm_spawn");
    }
    spawning::place_spawn_points("mp_dm_spawn_start");
    spawning::updateallspawnpoints();
}

// Namespace dm/dm
// Params 1, eflags: 0x0
// Checksum 0x8d144cdc, Offset: 0x4c0
// Size: 0xc
function setupteam(team) {
    
}

// Namespace dm/dm
// Params 0, eflags: 0x0
// Checksum 0x65edacae, Offset: 0x4d8
// Size: 0x64
function onstartgametype() {
    level.displayroundendtext = 0;
    level thread onscoreclosemusic();
    if (!util::isoneround()) {
        level.displayroundendtext = 1;
    }
    globallogic_spawn::addspawns();
}

// Namespace dm/dm
// Params 1, eflags: 0x0
// Checksum 0xaac0b90a, Offset: 0x548
// Size: 0x74
function onendgame(var_c1e98979) {
    player = round::function_b5f4c9d8();
    if (isdefined(player)) {
        [[ level._setplayerscore ]](player, [[ level._getplayerscore ]](player) + 1);
    }
    match::set_winner(player);
}

// Namespace dm/dm
// Params 0, eflags: 0x0
// Checksum 0x7c88148f, Offset: 0x5c8
// Size: 0xb0
function onscoreclosemusic() {
    while (!level.gameended) {
        scorelimit = level.scorelimit;
        scorethreshold = scorelimit * 0.9;
        for (i = 0; i < level.players.size; i++) {
            scorecheck = [[ level._getplayerscore ]](level.players[i]);
            if (scorecheck >= scorethreshold) {
                return;
            }
        }
        wait(0.5);
    }
}

// Namespace dm/dm
// Params 1, eflags: 0x0
// Checksum 0xe9cab3cf, Offset: 0x680
// Size: 0x3c
function onspawnplayer(predictedspawn) {
    if (!level.inprematchperiod) {
        level.usestartspawns = 0;
    }
    spawning::onspawnplayer(predictedspawn);
}

// Namespace dm/dm
// Params 9, eflags: 0x0
// Checksum 0xa5512857, Offset: 0x6c8
// Size: 0x124
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (!isplayer(attacker) || self == attacker) {
        return;
    }
    if (!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || isdefined(level.killstreaksgivegamescore) && level.killstreaksgivegamescore) {
        attacker globallogic_score::givepointstowin(level.teamscoreperkill);
        self globallogic_score::givepointstowin(level.teamscoreperdeath * -1);
        if (smeansofdeath == "MOD_HEAD_SHOT") {
            attacker globallogic_score::givepointstowin(level.teamscoreperheadshot);
        }
    }
}

