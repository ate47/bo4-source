#using scripts\abilities\ability_player;
#using scripts\abilities\ability_util;
#using scripts\core_common\activecamo_shared;
#using scripts\core_common\bb_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\challenges_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\contracts_shared;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\loadout_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\persistence_shared;
#using scripts\core_common\player\player_role;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\potm_shared;
#using scripts\core_common\rank_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\util_shared;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\killstreaks\killstreaks_util;
#using scripts\mp_common\callbacks;
#using scripts\mp_common\challenges;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\gametypes\globallogic_audio;
#using scripts\mp_common\gametypes\globallogic_score;
#using scripts\mp_common\gametypes\globallogic_utils;
#using scripts\mp_common\gametypes\match;
#using scripts\mp_common\gametypes\outcome;
#using scripts\mp_common\scoreevents;
#using scripts\mp_common\util;

#namespace globallogic_score;

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x2
// Checksum 0x3ff5bb38, Offset: 0x3c8
// Size: 0x154
function autoexec __init__() {
    level.scoreevents_givekillstats = &givekillstats;
    level.scoreevents_processassist = &function_b1a3b359;
    clientfield::register("clientuimodel", "hudItems.scoreProtected", 1, 1, "int");
    clientfield::register("clientuimodel", "hudItems.minorActions.action0", 1, 1, "counter");
    clientfield::register("clientuimodel", "hudItems.minorActions.action1", 1, 1, "counter");
    clientfield::register("clientuimodel", "hudItems.hotStreak.level", 1, 3, "int");
    callback::on_joined_team(&set_character_spectate_on_index);
    callback::on_joined_spectate(&function_30ab51a4);
    callback::on_changed_specialist(&function_30ab51a4);
}

// Namespace globallogic_score/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xcd76c6d1, Offset: 0x528
// Size: 0x26
function event_handler[gametype_init] main(eventstruct) {
    profilestart();
    level thread function_39193e3a();
    profilestop();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x98011d09, Offset: 0x558
// Size: 0x114
function function_39193e3a() {
    self notify("18852d080139d2c5");
    self endon("18852d080139d2c5");
    level endon(#"game_ended");
    while (true) {
        waitresult = level waittill(#"hero_gadget_activated");
        if (isdefined(waitresult.weapon) && isdefined(waitresult.player)) {
            player = waitresult.player;
            if (isdefined(player.pers[#"hash_53919d92ff1d039"])) {
                scoreevents::function_6f51d1e9("battle_command_ultimate_command", player.pers[#"hash_53919d92ff1d039"], undefined, undefined);
                player.pers[#"hash_53919d92ff1d039"] = undefined;
            }
        }
    }
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x83a3c7a8, Offset: 0x678
// Size: 0x98
function function_eaa4e6f7() {
    if (!level.timelimit || level.forcedend) {
        gamelength = float(globallogic_utils::gettimepassed()) / 1000;
        gamelength = min(gamelength, 1200);
    } else {
        gamelength = level.timelimit * 60;
    }
    return gamelength;
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x6f8805e5, Offset: 0x718
// Size: 0x48
function function_61f303f5(game_length) {
    totaltimeplayed = self.timeplayed[#"total"];
    if (totaltimeplayed > game_length) {
        totaltimeplayed = game_length;
    }
    return totaltimeplayed;
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xf039a304, Offset: 0x768
// Size: 0x8e
function function_c9de50a6(player) {
    for (pidx = 0; pidx < min(level.placement[#"all"].size, 3); pidx++) {
        if (level.placement[#"all"][pidx] != player) {
            continue;
        }
        return true;
    }
    return false;
}

// Namespace globallogic_score/globallogic_score
// Params 3, eflags: 0x0
// Checksum 0xaa750aa0, Offset: 0x800
// Size: 0xca
function function_78e7b549(scale, type, game_length) {
    total_time_played = self function_61f303f5(game_length);
    spm = self rank::getspm();
    playerscore = int(scale * game_length / 60 * spm * total_time_played / game_length);
    self thread givematchbonus(type, playerscore);
    self.matchbonus = playerscore;
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x8b28d392, Offset: 0x8d8
// Size: 0x3e6
function updatematchbonusscores(outcome) {
    if (!game.timepassed) {
        return;
    }
    if (!level.rankedmatch) {
        updatecustomgamewinner(outcome);
        return;
    }
    gamelength = function_eaa4e6f7();
    tie = outcome::get_flag(outcome, "tie");
    if (tie) {
        winnerscale = 0.75;
        loserscale = 0.75;
    } else {
        winnerscale = 1;
        loserscale = 0.5;
    }
    winning_team = outcome::get_winning_team(outcome);
    players = level.players;
    foreach (player in players) {
        if (player.timeplayed[#"total"] < 1 || player.pers[#"participation"] < 1) {
            player thread rank::endgameupdate();
            continue;
        }
        if (level.hostforcedend && player ishost()) {
            continue;
        }
        if (player.pers[#"score"] < 0) {
            continue;
        }
        if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == #"spectator") {
            continue;
        }
        if (level.teambased) {
            if (tie) {
                player function_78e7b549(winnerscale, "tie", gamelength);
            } else if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == winning_team) {
                player function_78e7b549(winnerscale, "win", gamelength);
            } else {
                player function_78e7b549(loserscale, "loss", gamelength);
            }
        } else if (function_c9de50a6(player)) {
            player function_78e7b549(winnerscale, "win", gamelength);
        } else {
            player function_78e7b549(loserscale, "loss", gamelength);
        }
        player.pers[#"totalmatchbonus"] = player.pers[#"totalmatchbonus"] + player.matchbonus;
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xd81ba441, Offset: 0xcc8
// Size: 0x26e
function updatecustomgamewinner(outcome) {
    if (!level.mpcustommatch) {
        return;
    }
    winner_team = outcome::get_winning_team(outcome);
    tie = outcome::get_flag(outcome, "tie");
    foreach (player in level.players) {
        if (!isdefined(winner_team)) {
            player.pers[#"victory"] = 0;
        } else if (level.teambased) {
            if (player.team == winner_team) {
                player.pers[#"victory"] = 2;
            } else if (tie) {
                player.pers[#"victory"] = 1;
            } else {
                player.pers[#"victory"] = 0;
            }
        } else if (function_c9de50a6(player)) {
            player.pers[#"victory"] = 2;
        } else {
            player.pers[#"victory"] = 0;
        }
        player.victory = player.pers[#"victory"];
        player.pers[#"sbtimeplayed"] = player.timeplayed[#"total"];
        player.sbtimeplayed = player.pers[#"sbtimeplayed"];
    }
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0x737fea38, Offset: 0xf40
// Size: 0xf4
function givematchbonus(scoretype, score) {
    self endon(#"disconnect");
    level waittill(#"give_match_bonus");
    if (!isdefined(self)) {
        return;
    }
    if (sessionmodeiswarzonegame()) {
        return;
    }
    if (scoreevents::shouldaddrankxp(self)) {
        if (isdefined(self.pers) && isdefined(self.pers[#"totalmatchbonus"])) {
            score = self.pers[#"totalmatchbonus"];
        }
        self addrankxpvalue(scoretype, score);
    }
    self rank::endgameupdate();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x51a79597, Offset: 0x1040
// Size: 0x128
function gethighestscoringplayer() {
    players = level.players;
    winner = undefined;
    tie = 0;
    for (i = 0; i < players.size; i++) {
        if (!isdefined(players[i].pointstowin)) {
            continue;
        }
        if (players[i].pointstowin < 1) {
            continue;
        }
        if (!isdefined(winner) || players[i].pointstowin > winner.pointstowin) {
            winner = players[i];
            tie = 0;
            continue;
        }
        if (players[i].pointstowin == winner.pointstowin) {
            tie = 1;
        }
    }
    if (tie || !isdefined(winner)) {
        return undefined;
    }
    return winner;
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x35a55a63, Offset: 0x1170
// Size: 0x11c
function function_15683f39() {
    players = level.players;
    highestscoringplayer = undefined;
    tie = 0;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (!isdefined(player.score)) {
            continue;
        }
        if (player.score < 1) {
            continue;
        }
        if (!isdefined(highestscoringplayer) || player.score > highestscoringplayer.score) {
            highestscoringplayer = player;
            tie = 0;
            continue;
        }
        if (player.score == highestscoringplayer.score) {
            tie = 1;
        }
    }
    if (tie || !isdefined(highestscoringplayer)) {
        return undefined;
    }
    return highestscoringplayer;
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xc8987ca2, Offset: 0x1298
// Size: 0x3c
function resetplayerscorechainandmomentum(player) {
    player thread _setplayermomentum(self, 0);
    player thread resetscorechain();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x2c8c7cb8, Offset: 0x12e0
// Size: 0x2e
function resetscorechain() {
    self notify(#"reset_score_chain");
    self.scorechain = 0;
    self.rankupdatetotal = 0;
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x7400b03d, Offset: 0x1318
// Size: 0x74
function scorechaintimer() {
    self notify(#"score_chain_timer");
    self endon(#"reset_score_chain", #"score_chain_timer", #"death", #"disconnect");
    wait 20;
    self thread resetscorechain();
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x56ba89de, Offset: 0x1398
// Size: 0x52
function roundtonearestfive(score) {
    rounding = score % 5;
    if (rounding <= 2) {
        return (score - rounding);
    }
    return score + 5 - rounding;
}

// Namespace globallogic_score/globallogic_score
// Params 9, eflags: 0x0
// Checksum 0x9048ac92, Offset: 0x13f8
// Size: 0x394
function giveplayermomentumnotification(score, label, descvalue, countstowardrampage, weapon, combatefficiencybonus = 0, eventindex, event, var_36f23f1f) {
    score += combatefficiencybonus;
    if (isdefined(level.var_5ee570bd) && level.var_5ee570bd) {
        score = rank::function_bcb5e246(event);
        if (!isdefined(score)) {
            score = 0;
        }
    }
    if (score != 0) {
        if (!isdefined(eventindex)) {
            eventindex = 1;
        }
        self luinotifyevent(#"score_event", 4, label, score, combatefficiencybonus, eventindex);
        self function_b552ffa9(#"score_event", 4, label, score, combatefficiencybonus, eventindex);
        potm::function_d6b60141(#"score_event", self, label, score, combatefficiencybonus, eventindex);
    }
    if (isdefined(event) && isdefined(level.scoreinfo[event][#"job_type"]) && level.scoreinfo[event][#"job_type"] == "hotstreak") {
        if (!isdefined(var_36f23f1f) || var_36f23f1f < 2) {
            self luinotifyevent(#"challenge_coin_received", 1, eventindex);
            self function_b552ffa9(#"challenge_coin_received", 1, eventindex);
        } else {
            self luinotifyevent(#"challenge_coin_received", 2, eventindex, var_36f23f1f);
            self function_b552ffa9(#"challenge_coin_received", 2, eventindex, var_36f23f1f);
        }
    }
    score = score;
    if (score > 0 && self hasperk(#"specialty_earnmoremomentum")) {
        score = roundtonearestfive(int(score * getdvarfloat(#"perk_killstreakmomentummultiplier", 0) + 0.5));
    }
    if (isalive(self)) {
        if (isdefined(level.var_bdff8e21) && level.var_bdff8e21) {
            score = event === #"kill" ? 1 : 0;
        }
        _setplayermomentum(self, self.pers[#"momentum"] + score);
    }
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x3787ceaf, Offset: 0x1798
// Size: 0x11e
function resetplayermomentum() {
    if (isdefined(level.usingscorestreaks) && level.usingscorestreaks) {
        _setplayermomentum(self, 0);
        self thread resetscorechain();
        weaponslist = self getweaponslist();
        for (idx = 0; idx < weaponslist.size; idx++) {
            weapon = weaponslist[idx];
            if (killstreaks::is_killstreak_weapon(weapon)) {
                quantity = killstreaks::get_killstreak_quantity(weapon);
                if (isdefined(quantity) && quantity > 0) {
                    self killstreaks::change_killstreak_quantity(weapon, quantity * -1);
                }
            }
        }
    }
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0xe7ab6f1a, Offset: 0x18c0
// Size: 0x1dc
function resetplayermomentumonspawn() {
    if (isdefined(level.usingscorestreaks) && level.usingscorestreaks) {
        var_a4e87ee3 = isdefined(self.deathtime) && self.deathtime > 0;
        var_a68a55cd = self function_80172c6();
        if (var_a4e87ee3 && var_a68a55cd > 0) {
            var_28749ebe = isdefined(self.var_28749ebe) ? self.var_28749ebe : 0;
            var_347218dd = var_a68a55cd > var_28749ebe;
            if (var_347218dd) {
                self.var_28749ebe = var_28749ebe + 1;
                var_a4e87ee3 = 0;
            } else {
                self.var_28749ebe = undefined;
            }
        } else {
            self.var_28749ebe = undefined;
        }
        if (var_a4e87ee3) {
            new_momentum = int(self.pers[#"momentum"] * (1 - math::clamp(self function_3ef59ab3(), 0, 1)));
            _setplayermomentum(self, new_momentum);
            self thread resetscorechain();
        }
        var_8c68675a = var_a68a55cd > (isdefined(self.var_28749ebe) ? self.var_28749ebe : 0);
        self clientfield::set_player_uimodel("hudItems.scoreProtected", var_8c68675a);
    }
}

// Namespace globallogic_score/globallogic_score
// Params 6, eflags: 0x0
// Checksum 0x81e46611, Offset: 0x1aa8
// Size: 0x314
function giveplayermomentum(event, player, victim, descvalue, weapon, var_36f23f1f) {
    if (isdefined(level.disablemomentum) && level.disablemomentum == 1) {
        return;
    }
    if (level.var_aa5e6547 === 1 && getdvarint(#"hash_1aa5f986ed71357d", 1) != 0) {
        if (isdefined(player) && !isalive(player)) {
            return;
        }
    }
    score = player rank::getscoreinfovalue(event);
    assert(isdefined(score));
    label = rank::getscoreinfolabel(event);
    eventindex = level.scoreinfo[event][#"row"];
    countstowardrampage = rank::doesscoreinfocounttowardrampage(event);
    combatefficiencyscore = 0;
    if (player ability_util::gadget_combat_efficiency_enabled()) {
        combatefficiencyscore = rank::function_4587103(event);
        if (isdefined(combatefficiencyscore) && combatefficiencyscore > 0) {
            player ability_util::gadget_combat_efficiency_power_drain(combatefficiencyscore);
            slot = -1;
            if (isdefined(weapon)) {
                slot = player gadgetgetslot(weapon);
                hero_slot = player ability_util::gadget_slot_for_type(11);
            }
        }
    }
    if (event == "death") {
        _setplayermomentum(victim, victim.pers[#"momentum"] + score);
    }
    if (level.gameended) {
        return;
    }
    if (!isdefined(label)) {
        player giveplayermomentumnotification(score, #"hash_480234a872bd64ac", descvalue, countstowardrampage, weapon, combatefficiencyscore, eventindex, event, var_36f23f1f);
        return;
    }
    player giveplayermomentumnotification(score, label, descvalue, countstowardrampage, weapon, combatefficiencyscore, eventindex, event, var_36f23f1f);
}

// Namespace globallogic_score/globallogic_score
// Params 6, eflags: 0x0
// Checksum 0x7952ccb1, Offset: 0x1dc8
// Size: 0x346
function giveplayerscore(event, player, victim, descvalue, weapon = level.weaponnone, var_36f23f1f) {
    scorediff = 0;
    momentum = player.pers[#"momentum"];
    giveplayermomentum(event, player, victim, descvalue, weapon, var_36f23f1f);
    newmomentum = player.pers[#"momentum"];
    if (level.overrideplayerscore) {
        return 0;
    }
    pixbeginevent(#"hash_50e89abe6f3fe4f1");
    score = player.pers[#"score"];
    [[ level.onplayerscore ]](event, player, victim);
    newscore = player.pers[#"score"];
    pixendevent();
    isusingheropower = 0;
    if (player ability_player::is_using_any_gadget()) {
        isusingheropower = 1;
    }
    scorediff = newscore - score;
    mpplayerscore = {};
    mpplayerscore.gamemode = level.gametype;
    mpplayerscore.spawnid = getplayerspawnid(player);
    mpplayerscore.playerspecialist = function_b14806c6(player player_role::get(), currentsessionmode());
    mpplayerscore.gametime = function_f8d53445();
    mpplayerscore.type = ishash(event) ? event : hash(event);
    mpplayerscore.isscoreevent = scoreevents::isregisteredevent(event);
    mpplayerscore.player = player.name;
    mpplayerscore.delta = scorediff;
    mpplayerscore.deltamomentum = newmomentum - momentum;
    mpplayerscore.team = player.team;
    mpplayerscore.isusingheropower = isusingheropower;
    self thread function_3172cf59(player, newscore, weapon, mpplayerscore);
    if (scorediff > 0) {
        return scorediff;
    }
    return 0;
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0xb39b9261, Offset: 0x2118
// Size: 0x76
function function_e1573815() {
    if (!isdefined(level.var_a5c930dd)) {
        level.var_a5c930dd = 0;
    }
    if (!isdefined(level.var_445b1bca)) {
        level.var_445b1bca = 0;
    }
    while (level.var_a5c930dd == gettime() || level.var_445b1bca == gettime()) {
        waitframe(1);
    }
    level.var_a5c930dd = gettime();
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0x3ffb944e, Offset: 0x2198
// Size: 0x574
function function_3172cf59(player, newscore, weapon, mpplayerscore) {
    player endon(#"disconnect");
    function_e1573815();
    pixbeginevent(#"hash_12a44df598cfa600");
    event = mpplayerscore.type;
    scorediff = mpplayerscore.delta;
    if (sessionmodeismultiplayergame() && !isbot(player)) {
        function_92d1707f(#"hash_120b2cf3162c3bc1", mpplayerscore);
    }
    player bb::add_to_stat("score", mpplayerscore.delta);
    if (!isbot(player)) {
        if (!isdefined(player.pers[#"scoreeventcache"])) {
            player.pers[#"scoreeventcache"] = [];
        }
        if (!isdefined(player.pers[#"scoreeventcache"][event])) {
            player.pers[#"scoreeventcache"][event] = 1;
        } else {
            player.pers[#"scoreeventcache"][event] = player.pers[#"scoreeventcache"][event] + 1;
        }
    }
    if (scorediff <= 0) {
        pixendevent();
        return;
    }
    recordplayerstats(player, "score", newscore);
    challengesenabled = !level.disablechallenges;
    player stats::function_bb7eedf0(#"score", scorediff);
    if (challengesenabled) {
        player stats::function_dad108fa(#"career_score", scorediff);
        scoreevents = function_3cbc4c6c(weapon.var_2e4a8800);
        var_8a4cfbd = weapon.var_76ce72e8 && isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1;
        if (var_8a4cfbd) {
            player stats::function_dad108fa(#"score_specialized_equipment", scorediff);
        } else if (weapon.issignatureweapon) {
            player stats::function_dad108fa(#"score_specialized_weapons", scorediff);
        }
    }
    if (level.hardcoremode) {
        player stats::function_dad108fa(#"score_hc", scorediff);
        if (challengesenabled) {
            player stats::function_dad108fa(#"career_score_hc", scorediff);
        }
    } else if (!level.arenamatch) {
        player stats::function_bb7eedf0(#"score_core", scorediff);
    }
    if (level.arenamatch) {
        player stats::function_bb7eedf0(#"score_arena", scorediff);
    }
    if (level.multiteam) {
        player stats::function_dad108fa(#"score_multiteam", scorediff);
        if (challengesenabled) {
            player stats::function_dad108fa(#"career_score_multiteam", scorediff);
        }
    }
    player contracts::player_contract_event(#"score", newscore, scorediff);
    if (isdefined(weapon) && killstreaks::is_killstreak_weapon(weapon)) {
        killstreak = killstreaks::get_from_weapon(weapon);
        killstreakpurchased = 0;
        if (isdefined(killstreak) && isdefined(level.killstreaks[killstreak])) {
            killstreakpurchased = player util::is_item_purchased(level.killstreaks[killstreak].menuname);
        }
        player contracts::player_contract_event(#"killstreak_score", scorediff, killstreakpurchased);
    }
    pixendevent();
}

// Namespace globallogic_score/globallogic_score
// Params 3, eflags: 0x0
// Checksum 0xf4c5293a, Offset: 0x2718
// Size: 0x144
function default_onplayerscore(event, player, victim) {
    score = player rank::getscoreinfovalue(event);
    rolescore = player rank::getscoreinfoposition(event);
    objscore = 0;
    if (player rank::function_f7b5d9fa(event)) {
        objscore = score;
    }
    assert(isdefined(score));
    if (level.var_aa5e6547 === 1 && getdvarint(#"hash_1aa5f986ed71357d", 1) != 0) {
        if (isdefined(player) && !isalive(player)) {
            score = 0;
            objscore = 0;
            rolescore = 0;
        }
    }
    function_889ed975(player, score, objscore, rolescore);
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0xf4421e75, Offset: 0x2868
// Size: 0x7a
function function_37d62931(player, amount) {
    player.pers[#"objectives"] = player.pers[#"objectives"] + amount;
    player.objectives = player.pers[#"objectives"];
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0xd1688f71, Offset: 0x28f0
// Size: 0x352
function _setplayerscore(player, score, var_e21e8076, var_53c3aa0b) {
    if (score != player.pers[#"score"]) {
        player.pers[#"score"] = score;
        player.score = player.pers[#"score"];
        recordplayerstats(player, "score", player.pers[#"score"]);
    }
    if (isdefined(var_53c3aa0b) && var_53c3aa0b != player.pers[#"rolescore"]) {
        player.pers[#"rolescore"] = var_53c3aa0b;
        player.rolescore = player.pers[#"rolescore"];
    }
    if (isdefined(var_e21e8076) && var_e21e8076 != player.pers[#"objscore"]) {
        if (isarenamode()) {
            amount = var_e21e8076 - player.pers[#"objscore"] + player stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"objective_score", #"arenavalue");
            player stats::set_stat(#"playerstatsbygametype", level.var_12323003, #"objective_score", #"arenavalue", amount);
        } else {
            amount = var_e21e8076 - player.pers[#"objscore"] + player stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"objective_score", #"statvalue");
            player stats::set_stat(#"playerstatsbygametype", level.var_12323003, #"objective_score", #"statvalue", amount);
        }
        player.pers[#"objscore"] = var_e21e8076;
        player.objscore = player.pers[#"objscore"];
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x8a7de263, Offset: 0x2c50
// Size: 0x28
function _getplayerscore(player) {
    return player.pers[#"score"];
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0x2d82328, Offset: 0x2c80
// Size: 0x6c
function function_17a678b7(player, scoresub) {
    score = player.pers[#"score"] - scoresub;
    if (score < 0) {
        score = 0;
    }
    _setplayerscore(player, score);
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0x5d64e67f, Offset: 0x2cf8
// Size: 0x18c
function function_889ed975(player, score_add, var_252f7989, var_f8258842) {
    /#
        var_1eb7c454 = getdvarfloat(#"hash_eae9a8ee387705d", 1);
        score_add = int(score_add * var_1eb7c454);
        var_252f7989 = int(var_252f7989 * var_1eb7c454);
        var_f8258842 = int(var_f8258842 * var_1eb7c454);
    #/
    score = player.pers[#"score"] + score_add;
    var_e21e8076 = player.pers[#"objscore"];
    if (isdefined(var_252f7989)) {
        var_e21e8076 += var_252f7989;
    }
    var_53c3aa0b = player.pers[#"rolescore"];
    if (isdefined(var_f8258842)) {
        var_53c3aa0b += var_f8258842;
    }
    _setplayerscore(player, score, var_e21e8076, var_53c3aa0b);
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x493359e, Offset: 0x2e90
// Size: 0x180
function playtop3sounds() {
    waitframe(1);
    globallogic::updateplacement();
    for (i = 0; i < level.placement[#"all"].size; i++) {
        prevscoreplace = level.placement[#"all"][i].prevscoreplace;
        if (!isdefined(prevscoreplace)) {
            prevscoreplace = 1;
        }
        currentscoreplace = i + 1;
        for (j = i - 1; j >= 0; j--) {
            if (level.placement[#"all"][i].score == level.placement[#"all"][j].score) {
                currentscoreplace--;
            }
        }
        wasinthemoney = prevscoreplace <= 3;
        isinthemoney = currentscoreplace <= 3;
        level.placement[#"all"][i].prevscoreplace = currentscoreplace;
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x7844c620, Offset: 0x3018
// Size: 0xc4
function setpointstowin(points) {
    self.pers[#"pointstowin"] = math::clamp(points, 0, 65000);
    self.pointstowin = self.pers[#"pointstowin"];
    self thread globallogic::checkscorelimit();
    self thread globallogic::checkroundscorelimit();
    self thread globallogic::checkplayerscorelimitsoon();
    level thread playtop3sounds();
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xc811533b, Offset: 0x30e8
// Size: 0x3c
function givepointstowin(points) {
    self setpointstowin(self.pers[#"pointstowin"] + points);
}

// Namespace globallogic_score/globallogic_score
// Params 3, eflags: 0x0
// Checksum 0xd0e15ede, Offset: 0x3130
// Size: 0x272
function _setplayermomentum(player, momentum, updatescore = 1) {
    momentum = math::clamp(momentum, 0, 2000);
    oldmomentum = player.pers[#"momentum"];
    if (momentum == oldmomentum) {
        return;
    }
    if (updatescore) {
        player bb::add_to_stat("momentum", momentum - oldmomentum);
    }
    if (momentum > oldmomentum) {
        highestmomentumcost = 0;
        numkillstreaks = 0;
        if (isdefined(player.killstreak)) {
            numkillstreaks = player.killstreak.size;
        }
        killstreaktypearray = [];
        for (currentkillstreak = 0; currentkillstreak < numkillstreaks; currentkillstreak++) {
            killstreaktype = killstreaks::get_by_menu_name(player.killstreak[currentkillstreak]);
            if (isdefined(killstreaktype)) {
                momentumcost = player function_dceb5542(level.killstreaks[killstreaktype].itemindex);
                if (momentumcost > highestmomentumcost) {
                    highestmomentumcost = momentumcost;
                }
                killstreaktypearray[killstreaktypearray.size] = killstreaktype;
            }
        }
        _giveplayerkillstreakinternal(player, momentum, oldmomentum, killstreaktypearray);
        while (highestmomentumcost > 0 && momentum >= highestmomentumcost) {
            oldmomentum = 0;
            momentum -= highestmomentumcost;
            _giveplayerkillstreakinternal(player, momentum, oldmomentum, killstreaktypearray);
        }
    }
    player.pers[#"momentum"] = momentum;
    player.momentum = player.pers[#"momentum"];
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0xa4a1e06a, Offset: 0x33b0
// Size: 0x5c8
function _giveplayerkillstreakinternal(player, momentum, oldmomentum, killstreaktypearray) {
    var_2b85d59c = isdefined(level.var_2b85d59c) && level.var_2b85d59c;
    for (killstreaktypeindex = 0; killstreaktypeindex < killstreaktypearray.size; killstreaktypeindex++) {
        killstreaktype = killstreaktypearray[killstreaktypeindex];
        momentumcost = player function_dceb5542(level.killstreaks[killstreaktype].itemindex);
        if (momentumcost > oldmomentum && momentumcost <= momentum) {
            weapon = killstreaks::get_killstreak_weapon(killstreaktype);
            was_already_at_max_stacking = 0;
            if (isdefined(level.usingscorestreaks) && level.usingscorestreaks) {
                if (isdefined(level.var_ed3e6ff3)) {
                    player [[ level.var_ed3e6ff3 ]](weapon, momentum);
                }
                if (weapon.iscarriedkillstreak) {
                    if (!isdefined(player.pers[#"held_killstreak_ammo_count"][weapon])) {
                        player.pers[#"held_killstreak_ammo_count"][weapon] = 0;
                    }
                    if (!isdefined(player.pers[#"killstreak_quantity"][weapon])) {
                        player.pers[#"killstreak_quantity"][weapon] = 0;
                    }
                    currentweapon = player getcurrentweapon();
                    if (currentweapon == weapon) {
                        if (player.pers[#"killstreak_quantity"][weapon] < level.scorestreaksmaxstacking) {
                            player.pers[#"killstreak_quantity"][weapon]++;
                        }
                    } else {
                        player.pers[#"held_killstreak_clip_count"][weapon] = weapon.clipsize;
                        player.pers[#"held_killstreak_ammo_count"][weapon] = weapon.maxammo;
                        player loadout::function_3ba6ee5d(weapon, player.pers[#"held_killstreak_ammo_count"][weapon]);
                    }
                } else {
                    old_killstreak_quantity = player killstreaks::get_killstreak_quantity(weapon);
                    new_killstreak_quantity = player killstreaks::change_killstreak_quantity(weapon, 1);
                    was_already_at_max_stacking = new_killstreak_quantity == old_killstreak_quantity;
                    if (!was_already_at_max_stacking) {
                        player challenges::earnedkillstreak();
                        player contracts::increment_contract(#"hash_3ddcd024e6e13a32");
                        if (player ability_util::gadget_is_active(12)) {
                            scoreevents::processscoreevent(#"focus_earn_scorestreak", player, undefined, undefined);
                            player scoreevents::specialistmedalachievement();
                            player scoreevents::specialiststatabilityusage(4, 1);
                            if (player.heroability.name == "gadget_combat_efficiency") {
                                player stats::function_e24eec31(player.heroability, #"scorestreaks_earned", 1);
                                if (!isdefined(player.scorestreaksearnedperuse)) {
                                    player.scorestreaksearnedperuse = 0;
                                }
                                player.scorestreaksearnedperuse++;
                                if (player.scorestreaksearnedperuse >= 3) {
                                    scoreevents::processscoreevent(#"focus_earn_multiscorestreak", player, undefined, undefined);
                                    player.scorestreaksearnedperuse = 0;
                                }
                            }
                        }
                    }
                }
                if (!was_already_at_max_stacking) {
                    player killstreaks::add_to_notification_queue(level.killstreaks[killstreaktype].menuname, new_killstreak_quantity, killstreaktype, var_2b85d59c, 0);
                }
                continue;
            }
            player killstreaks::add_to_notification_queue(level.killstreaks[killstreaktype].menuname, 0, killstreaktype, var_2b85d59c, 0);
            activeeventname = "reward_active";
            if (isdefined(weapon)) {
                neweventname = weapon.name + "_active";
                if (scoreevents::isregisteredevent(neweventname)) {
                    activeeventname = neweventname;
                }
            }
        }
    }
}

/#

    // Namespace globallogic_score/globallogic_score
    // Params 0, eflags: 0x0
    // Checksum 0x2b7d6d8c, Offset: 0x3980
    // Size: 0xf8
    function setplayermomentumdebug() {
        setdvar(#"sv_momentumpercent", 0);
        while (true) {
            wait 1;
            momentumpercent = getdvarfloat(#"sv_momentumpercent", 0);
            if (momentumpercent != 0) {
                player = util::gethostplayer();
                if (!isdefined(player)) {
                    return;
                }
                if (isdefined(player.killstreak)) {
                    _setplayermomentum(player, int(2000 * momentumpercent / 100));
                }
            }
        }
    }

#/

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0x4ed547a7, Offset: 0x3a80
// Size: 0x1c4
function giveteamscore(event, team, player, victim) {
    if (level.overrideteamscore) {
        return;
    }
    pixbeginevent(#"hash_66d4a941ef078585");
    teamscore = game.stat[#"teamscores"][team];
    [[ level.onteamscore ]](event, team);
    pixendevent();
    newscore = game.stat[#"teamscores"][team];
    if (sessionmodeismultiplayergame()) {
        mpteamscores = {#gametime:function_f8d53445(), #event:event, #team:team, #diff:newscore - teamscore, #score:newscore};
        function_92d1707f(#"hash_48d5ef92d24477d2", mpteamscores);
    }
    if (teamscore == newscore) {
        return;
    }
    updateteamscores(team);
    thread globallogic::checkscorelimit();
    thread globallogic::checkroundscorelimit();
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0x3eb670a3, Offset: 0x3c50
// Size: 0x144
function giveteamscoreforobjective_delaypostprocessing(team, score) {
    teamscore = game.stat[#"teamscores"][team];
    onteamscore_incrementscore(score, team);
    newscore = game.stat[#"teamscores"][team];
    if (sessionmodeismultiplayergame()) {
        mpteamobjscores = {#gametime:function_f8d53445(), #team:team, #diff:newscore - teamscore, #score:newscore};
        function_92d1707f(#"hash_22921c2c027fa389", mpteamobjscores);
    }
    if (teamscore == newscore) {
        return;
    }
    updateteamscores(team);
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xf1e0a1d8, Offset: 0x3da0
// Size: 0xa4
function postprocessteamscores(teams) {
    foreach (team in teams) {
        onteamscore_postprocess(team);
    }
    thread globallogic::checkscorelimit();
    thread globallogic::checkroundscorelimit();
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0xc069859, Offset: 0x3e50
// Size: 0x194
function giveteamscoreforobjective(team, score) {
    if (!isdefined(level.teams[team])) {
        return;
    }
    teamscore = game.stat[#"teamscores"][team];
    onteamscore(score, team);
    newscore = game.stat[#"teamscores"][team];
    if (sessionmodeismultiplayergame()) {
        mpteamobjscores = {#gametime:function_f8d53445(), #team:team, #diff:newscore - teamscore, #score:newscore};
        function_92d1707f(#"hash_22921c2c027fa389", mpteamobjscores);
    }
    if (teamscore == newscore) {
        return;
    }
    updateteamscores(team);
    thread globallogic::checkscorelimit();
    thread globallogic::checkroundscorelimit();
    thread globallogic::checksuddendeathscorelimit(team);
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0x8ff3fb95, Offset: 0x3ff0
// Size: 0xb4
function _setteamscore(team, teamscore) {
    if (teamscore == game.stat[#"teamscores"][team]) {
        return;
    }
    game.stat[#"teamscores"][team] = math::clamp(teamscore, 0, 1000000);
    updateteamscores(team);
    thread globallogic::checkscorelimit();
    thread globallogic::checkroundscorelimit();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0xfaac10dd, Offset: 0x40b0
// Size: 0xc4
function resetteamscores() {
    if (level.scoreroundwinbased || util::isfirstround()) {
        foreach (team, _ in level.teams) {
            game.stat[#"teamscores"][team] = 0;
        }
    }
    updateallteamscores();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x815c718c, Offset: 0x4180
// Size: 0x24
function resetallscores() {
    resetteamscores();
    resetplayerscores();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0xa3052bd3, Offset: 0x41b0
// Size: 0xa6
function resetplayerscores() {
    players = level.players;
    winner = undefined;
    tie = 0;
    for (i = 0; i < players.size; i++) {
        if (isdefined(players[i].pers[#"score"])) {
            _setplayerscore(players[i], 0);
        }
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xee59b3f1, Offset: 0x4260
// Size: 0x54
function updateteamscores(team) {
    setteamscore(team, game.stat[#"teamscores"][team]);
    level thread globallogic::checkteamscorelimitsoon(team);
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x806731f1, Offset: 0x42c0
// Size: 0x80
function updateallteamscores() {
    foreach (team, _ in level.teams) {
        updateteamscores(team);
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x879ccfdd, Offset: 0x4348
// Size: 0x26
function _getteamscore(team) {
    return game.stat[#"teamscores"][team];
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0xad196461, Offset: 0x4378
// Size: 0xea
function gethighestteamscoreteam() {
    score = 0;
    winning_teams = [];
    foreach (team, _ in level.teams) {
        team_score = game.stat[#"teamscores"][team];
        if (team_score > score) {
            score = team_score;
            winning_teams = [];
        }
        if (team_score == score) {
            winning_teams[team] = team;
        }
    }
    return winning_teams;
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0x9942190, Offset: 0x4470
// Size: 0xa0
function areteamarraysequal(teamsa, teamsb) {
    if (teamsa.size != teamsb.size) {
        return false;
    }
    foreach (team in teamsa) {
        if (!isdefined(teamsb[team])) {
            return false;
        }
    }
    return true;
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0x2f926182, Offset: 0x4518
// Size: 0x44
function onteamscore(score, team) {
    onteamscore_incrementscore(score, team);
    onteamscore_postprocess(team);
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0xe321562f, Offset: 0x4568
// Size: 0x18c
function onteamscore_incrementscore(score, team) {
    game.stat[#"teamscores"][team] = game.stat[#"teamscores"][team] + score;
    if (game.stat[#"teamscores"][team] < 0) {
        game.stat[#"teamscores"][team] = 0;
    }
    if (level.clampscorelimit) {
        if (level.scorelimit && game.stat[#"teamscores"][team] > level.scorelimit) {
            game.stat[#"teamscores"][team] = level.scorelimit;
        }
        if (level.roundscorelimit && game.stat[#"teamscores"][team] > util::get_current_round_score_limit()) {
            game.stat[#"teamscores"][team] = util::get_current_round_score_limit();
        }
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x7d7cd0bd, Offset: 0x4700
// Size: 0x286
function onteamscore_postprocess(team) {
    if (level.splitscreen) {
        return;
    }
    if (level.scorelimit == 1) {
        return;
    }
    iswinning = gethighestteamscoreteam();
    if (iswinning.size == 0) {
        return;
    }
    if (gettime() - level.laststatustime < 5000) {
        return;
    }
    if (areteamarraysequal(iswinning, level.waswinning)) {
        return;
    }
    if (iswinning.size == 1) {
        level.laststatustime = gettime();
        foreach (team in iswinning) {
            if (isdefined(level.waswinning[team])) {
                if (level.waswinning.size == 1) {
                    continue;
                }
            }
            if (isdefined(level.var_e7b05b51) ? level.var_e7b05b51 : 1) {
                globallogic_audio::leader_dialog("gameLeadTaken", team, undefined, "status");
            }
        }
    } else {
        return;
    }
    if (level.waswinning.size == 1) {
        foreach (team in level.waswinning) {
            if (isdefined(iswinning[team])) {
                if (iswinning.size == 1) {
                    continue;
                }
                if (level.waswinning.size > 1) {
                    continue;
                }
            }
            if (isdefined(level.var_e7b05b51) ? level.var_e7b05b51 : 1) {
                globallogic_audio::leader_dialog("gameLeadLost", team, undefined, "status");
            }
        }
    }
    level.waswinning = iswinning;
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0xccabad93, Offset: 0x4990
// Size: 0x6c
function default_onteamscore(event, team) {
    score = rank::getscoreinfovalue(event);
    assert(isdefined(score));
    onteamscore(score, team);
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0x1b9b7d88, Offset: 0x4a08
// Size: 0x8c
function initpersstat(dataname, record_stats) {
    if (!isdefined(self.pers[dataname])) {
        self.pers[dataname] = 0;
    }
    if (!isdefined(record_stats) || record_stats == 1) {
        recordplayerstats(self, dataname, int(self.pers[dataname]));
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x8388a9f7, Offset: 0x4aa0
// Size: 0x18
function getpersstat(dataname) {
    return self.pers[dataname];
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0x6a8e2016, Offset: 0x4ac0
// Size: 0x104
function incpersstat(dataname, increment, record_stats, includegametype) {
    pixbeginevent(#"incpersstat");
    if (isdefined(self.pers[dataname])) {
        self.pers[dataname] = self.pers[dataname] + increment;
    }
    if (isdefined(includegametype) && includegametype) {
        self stats::function_bb7eedf0(dataname, increment);
    } else {
        self stats::function_dad108fa(dataname, increment);
    }
    if (!isdefined(record_stats) || record_stats == 1) {
        self thread threadedrecordplayerstats(dataname);
    }
    pixendevent();
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xf885c6f0, Offset: 0x4bd0
// Size: 0x74
function threadedrecordplayerstats(dataname) {
    self endon(#"disconnect");
    waittillframeend();
    if (isdefined(self) && isdefined(self.pers) && isdefined(self.pers[dataname])) {
        recordplayerstats(self, dataname, self.pers[dataname]);
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xd16a31b2, Offset: 0x4c50
// Size: 0x3dc
function updatewinstats(winner) {
    winner stats::function_bb7eedf0(#"losses", -1);
    winner.pers[#"outcome"] = #"win";
    winner stats::function_bb7eedf0(#"wins", 1);
    if (level.rankedmatch && !level.disablestattracking && sessionmodeismultiplayergame()) {
        if (winner stats::get_stat_global(#"wins") > 49) {
            winner giveachievement("mp_trophy_vanquisher");
        }
    }
    if (level.hardcoremode) {
        winner stats::function_dad108fa(#"wins_hc", 1);
    } else if (!level.arenamatch) {
        winner stats::function_dad108fa(#"wins_core", 1);
    }
    if (level.arenamatch) {
        winner stats::function_dad108fa(#"wins_arena", 1);
    }
    if (level.multiteam) {
        winner stats::function_dad108fa(#"wins_multiteam", 1);
    }
    winner updatestatratio("wlratio", "wins", "losses");
    restorewinstreaks(winner);
    winner stats::function_bb7eedf0(#"cur_win_streak", 1);
    winner notify(#"win");
    winner.lootxpmultiplier = 1;
    cur_gamemode_win_streak = winner stats::function_ed81f25e(#"cur_win_streak");
    gamemode_win_streak = winner stats::function_ed81f25e(#"win_streak");
    cur_win_streak = winner stats::get_stat_global(#"cur_win_streak");
    if (isdefined(cur_gamemode_win_streak) && isdefined(gamemode_win_streak) && cur_gamemode_win_streak > gamemode_win_streak) {
        winner stats::function_baa25a23(#"win_streak", cur_gamemode_win_streak);
    }
    if (bot::is_bot_ranked_match()) {
        combattrainingwins = winner stats::get_stat(#"combattrainingwins");
        winner stats::set_stat(#"combattrainingwins", combattrainingwins + 1);
    }
    if (level.var_aa5e6547 === 1) {
        winner stats::function_dad108fa(#"hash_a06075423336d9c", 1);
    }
    updateweaponcontractwin(winner);
    updatecontractwin(winner);
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0xc2e13e48, Offset: 0x5038
// Size: 0x6e
function canupdateweaponcontractstats() {
    if (getdvarint(#"enable_weapon_contract", 0) == 0) {
        return false;
    }
    if (!level.rankedmatch && !level.arenamatch) {
        return false;
    }
    if (sessionmodeiswarzonegame()) {
        return false;
    }
    return true;
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xb322f61e, Offset: 0x50b0
// Size: 0x9c
function updateweaponcontractstart(player) {
    if (!canupdateweaponcontractstats()) {
        return;
    }
    if (player stats::get_stat(#"weaponcontractdata", #"starttimestamp") == 0) {
        player stats::set_stat(#"weaponcontractdata", #"starttimestamp", getutc());
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xdd5d3f78, Offset: 0x5158
// Size: 0x18c
function updateweaponcontractwin(winner) {
    if (!canupdateweaponcontractstats()) {
        return;
    }
    matcheswon = winner stats::get_stat(#"weaponcontractdata", #"currentvalue") + 1;
    winner stats::set_stat(#"weaponcontractdata", #"currentvalue", matcheswon);
    if ((isdefined(winner stats::get_stat(#"weaponcontractdata", #"completetimestamp")) ? winner stats::get_stat(#"weaponcontractdata", #"completetimestamp") : 0) == 0) {
        targetvalue = getdvarint(#"weapon_contract_target_value", 100);
        if (matcheswon >= targetvalue) {
            winner stats::set_stat(#"weaponcontractdata", #"completetimestamp", getutc());
        }
    }
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0xdd50f17b, Offset: 0x52f0
// Size: 0x120
function updateweaponcontractplayed() {
    if (!canupdateweaponcontractstats()) {
        return;
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.pers[#"team"])) {
            continue;
        }
        matchesplayed = player stats::get_stat(#"weaponcontractdata", #"matchesplayed") + 1;
        player stats::set_stat(#"weaponcontractdata", #"matchesplayed", matchesplayed);
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x7b30f428, Offset: 0x5418
// Size: 0x9a
function updatecontractwin(winner) {
    if (!isdefined(level.updatecontractwinevents)) {
        return;
    }
    foreach (contractwinevent in level.updatecontractwinevents) {
        if (!isdefined(contractwinevent)) {
            continue;
        }
        [[ contractwinevent ]](winner);
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x70ccc51c, Offset: 0x54c0
// Size: 0xaa
function registercontractwinevent(event) {
    if (!isdefined(level.updatecontractwinevents)) {
        level.updatecontractwinevents = [];
    }
    if (!isdefined(level.updatecontractwinevents)) {
        level.updatecontractwinevents = [];
    } else if (!isarray(level.updatecontractwinevents)) {
        level.updatecontractwinevents = array(level.updatecontractwinevents);
    }
    level.updatecontractwinevents[level.updatecontractwinevents.size] = event;
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xa98ab2b6, Offset: 0x5578
// Size: 0xa0
function updatelossstats(loser) {
    loser.pers[#"outcome"] = #"loss";
    loser stats::function_bb7eedf0(#"losses", 1);
    loser updatestatratio("wlratio", "wins", "losses");
    loser notify(#"loss");
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xc477a793, Offset: 0x5620
// Size: 0x8c
function updatelosslatejoinstats(loser) {
    loser stats::function_bb7eedf0(#"losses", -1);
    loser stats::function_bb7eedf0(#"losses_late_join", 1);
    loser updatestatratio("wlratio", "wins", "losses");
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xb1386940, Offset: 0x56b8
// Size: 0x130
function updatetiestats(loser) {
    loser stats::function_bb7eedf0(#"losses", -1);
    loser.pers[#"outcome"] = #"draw";
    loser stats::function_bb7eedf0(#"ties", 1);
    loser updatestatratio("wlratio", "wins", "losses");
    if (!level.disablestattracking) {
        loser stats::set_stat_global(#"cur_win_streak", 0);
        if (level.var_aa5e6547 === 1) {
            loser stats::set_stat_global(#"hash_a06075423336d9c", 0);
        }
    }
    loser notify(#"tie");
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0xddbf360b, Offset: 0x57f0
// Size: 0x520
function updatewinlossstats() {
    if (!util::waslastround() && !level.hostforcedend) {
        return;
    }
    players = level.players;
    updateweaponcontractplayed();
    if (match::function_75f97ac7()) {
        if (level.hostforcedend && match::function_517c0ce0()) {
            return;
        }
        winner = match::get_winner();
        updatewinstats(winner);
        if (!level.teambased) {
            placement = level.placement[#"all"];
            topthreeplayers = min(3, placement.size);
            for (index = 1; index < topthreeplayers; index++) {
                nexttopplayer = placement[index];
                updatewinstats(nexttopplayer);
            }
            foreach (player in players) {
                if (winner == player) {
                    continue;
                }
                for (index = 1; index < topthreeplayers; index++) {
                    if (player == placement[index]) {
                        break;
                    }
                }
                if (index < topthreeplayers) {
                    continue;
                }
                if (level.rankedmatch && !level.leaguematch && player.pers[#"latejoin"] === 1) {
                    updatelosslatejoinstats(player);
                }
            }
        }
        return;
    }
    if (match::get_flag("tie")) {
        foreach (player in players) {
            if (!isdefined(player.pers[#"team"])) {
                continue;
            }
            if (level.hostforcedend && player ishost()) {
                continue;
            }
            updatetiestats(player);
        }
        return;
    }
    foreach (player in players) {
        if (!isdefined(player.pers[#"team"])) {
            continue;
        }
        if (level.hostforcedend && player ishost()) {
            continue;
        }
        if (match::get_flag("tie")) {
            updatetiestats(player);
            continue;
        }
        if (match::function_a2b53e17(player)) {
            updatewinstats(player);
            continue;
        }
        if (level.rankedmatch && !level.leaguematch && player.pers[#"latejoin"] === 1) {
            updatelosslatejoinstats(player);
        }
        if (!level.disablestattracking) {
            player stats::set_stat_global(#"cur_win_streak", 0);
            if (level.var_aa5e6547 === 1) {
                player stats::set_stat_global(#"hash_a06075423336d9c", 0);
            }
        }
    }
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x8bb21020, Offset: 0x5d18
// Size: 0x164
function backupandclearwinstreaks() {
    if (isdefined(level.freerun) && level.freerun) {
        return;
    }
    self.pers[#"winstreak"] = self stats::get_stat_global(#"cur_win_streak");
    if (!level.disablestattracking) {
        self stats::set_stat_global(#"cur_win_streak", 0);
        if (level.var_aa5e6547 === 1) {
            self.pers[#"winstreakcwl"] = self stats::get_stat_global(#"hash_a06075423336d9c");
            self stats::set_stat_global(#"hash_a06075423336d9c", 0);
        }
    }
    self.pers[#"winstreakforgametype"] = self stats::function_ed81f25e(#"cur_win_streak");
    self stats::function_baa25a23(#"cur_win_streak", 0);
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x3c9ef21c, Offset: 0x5e88
// Size: 0x104
function restorewinstreaks(winner) {
    if (!level.disablestattracking) {
        winner stats::set_stat_global(#"cur_win_streak", winner.pers[#"winstreak"]);
        if (level.var_aa5e6547 === 1) {
            winner stats::set_stat_global(#"hash_a06075423336d9c", winner.pers[#"winstreakcwl"]);
        }
    }
    winner stats::function_baa25a23(#"cur_win_streak", isdefined(winner.pers[#"winstreakforgametype"]) ? winner.pers[#"winstreakforgametype"] : 0);
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x5e11d801, Offset: 0x5f98
// Size: 0x8e
function inckillstreaktracker(weapon) {
    self endon(#"disconnect");
    waittillframeend();
    if (weapon.name == #"artillery") {
        self.pers[#"artillery_kills"]++;
    }
    if (weapon.name == #"dog_bite") {
        self.pers[#"dog_kills"]++;
    }
}

// Namespace globallogic_score/globallogic_score
// Params 6, eflags: 0x0
// Checksum 0xaa86bca3, Offset: 0x6030
// Size: 0x2ec
function trackattackerkill(name, rank, xp, prestige, xuid, weapon) {
    self endon(#"disconnect");
    attacker = self;
    waittillframeend();
    pixbeginevent(#"trackattackerkill");
    if (!isdefined(attacker.pers[#"killed_players"][name])) {
        attacker.pers[#"killed_players"][name] = 0;
    }
    if (!isdefined(attacker.pers[#"killed_players_with_specialist"][name])) {
        attacker.pers[#"killed_players_with_specialist"][name] = 0;
    }
    if (!isdefined(attacker.killedplayerscurrent[name])) {
        attacker.killedplayerscurrent[name] = 0;
    }
    attacker.pers[#"killed_players"][name]++;
    attacker.killedplayerscurrent[name]++;
    if (weapon.isheavyweapon) {
        attacker.pers[#"killed_players_with_specialist"][name]++;
    }
    if (attacker.pers[#"nemesis_name"] == name) {
        attacker challenges::killednemesis();
    }
    attacker function_e7b4c25c(name, 1.5, rank, prestige, xp, xuid);
    if (!isdefined(attacker.lastkilledvictim) || !isdefined(attacker.lastkilledvictimcount)) {
        attacker.lastkilledvictim = name;
        attacker.lastkilledvictimcount = 0;
    }
    if (attacker.lastkilledvictim == name) {
        attacker.lastkilledvictimcount++;
        if (attacker.lastkilledvictimcount >= 5) {
            attacker.lastkilledvictimcount = 0;
            attacker stats::function_dad108fa(#"streaker", 1);
        }
    } else {
        attacker.lastkilledvictim = name;
        attacker.lastkilledvictimcount = 1;
    }
    pixendevent();
}

// Namespace globallogic_score/globallogic_score
// Params 5, eflags: 0x0
// Checksum 0x8cdea921, Offset: 0x6328
// Size: 0x234
function trackattackeedeath(attackername, rank, xp, prestige, xuid) {
    self endon(#"disconnect");
    waittillframeend();
    pixbeginevent(#"trackattackeedeath");
    if (!isdefined(self.pers[#"killed_by"][attackername])) {
        self.pers[#"killed_by"][attackername] = 0;
    }
    self.pers[#"killed_by"][attackername]++;
    self function_e7b4c25c(attackername, 1.5, rank, prestige, xp, xuid);
    if (self.pers[#"nemesis_name"] == attackername && self.pers[#"nemesis_tracking"][attackername].value >= 2) {
        self setclientuivisibilityflag("killcam_nemesis", 1);
    } else {
        self setclientuivisibilityflag("killcam_nemesis", 0);
    }
    selfkillstowardsattacker = 0;
    if (isdefined(self.pers[#"killed_players"][attackername])) {
        selfkillstowardsattacker = self.pers[#"killed_players"][attackername];
    }
    self luinotifyevent(#"track_victim_death", 2, self.pers[#"killed_by"][attackername], selfkillstowardsattacker);
    pixendevent();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x651cd981, Offset: 0x6568
// Size: 0x6
function default_iskillboosting() {
    return false;
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0xede92e18, Offset: 0x6578
// Size: 0x47c
function givekillstats(smeansofdeath, weapon, evictim, var_e7a369ea) {
    self endon(#"disconnect");
    if (self === var_e7a369ea) {
        self.kills += 1;
    }
    laststandparams = undefined;
    if (isdefined(evictim)) {
        laststandparams = evictim.laststandparams;
    }
    waittillframeend();
    if (level.rankedmatch && self [[ level.iskillboosting ]]()) {
        /#
            self iprintlnbold("<dev string:x38>");
        #/
        return;
    }
    pixbeginevent(#"givekillstats");
    if (self === var_e7a369ea) {
        self activecamo::function_896ac347(weapon, #"kills", 1);
        self activecamo::function_1af985ba(weapon);
        self incpersstat(#"kills", 1, 1, 1);
        self.kills = self getpersstat(#"kills");
        self updatestatratio("kdratio", "kills", "deaths");
        if (isdefined(evictim) && isplayer(evictim) && isdefined(evictim.attackerdamage)) {
            if (isarray(evictim.attackerdamage) && isdefined(self.clientid) && isdefined(evictim.attackerdamage[self.clientid]) && evictim.attackerdamage.size == 1) {
                stats::function_dad108fa(#"direct_action_kills", 1);
            }
        }
        if (isdefined(level.var_c8453874)) {
            [[ level.var_c8453874 ]](self, evictim, laststandparams);
        }
    }
    if (isdefined(evictim) && isplayer(evictim)) {
        self incpersstat(#"ekia", 1, 1, 1);
        self stats::function_e24eec31(weapon, #"ekia", 1);
        self contracts::player_contract_event(#"ekia", weapon);
        self.ekia = self getpersstat(#"ekia");
    }
    attacker = self;
    if (smeansofdeath === "MOD_HEAD_SHOT" && !killstreaks::is_killstreak_weapon(weapon)) {
        self activecamo::function_896ac347(weapon, #"headshots", 1);
        attacker thread incpersstat(#"headshots", 1, 1, 0);
        attacker.headshots = attacker.pers[#"headshots"];
        if (isdefined(evictim)) {
            evictim recordkillmodifier("headshot");
        }
        if (attacker.headshots % 5 == 0) {
            self contracts::increment_contract(#"hash_ca75e54eb5e5ef8");
        }
    }
    pixendevent();
}

// Namespace globallogic_score/globallogic_score
// Params 3, eflags: 0x0
// Checksum 0xc63dec9d, Offset: 0x6a00
// Size: 0x1d4
function setinflictorstat(einflictor, eattacker, weapon) {
    if (!isdefined(eattacker)) {
        return;
    }
    weaponpickedup = 0;
    if (isdefined(eattacker.pickedupweapons) && isdefined(eattacker.pickedupweapons[weapon])) {
        weaponpickedup = 1;
    }
    if (!isdefined(einflictor)) {
        eattacker stats::function_eec52333(weapon, #"hits", 1, eattacker.class_num, weaponpickedup);
        return;
    }
    if (!isdefined(einflictor.playeraffectedarray)) {
        einflictor.playeraffectedarray = [];
    }
    foundnewplayer = 1;
    for (i = 0; i < einflictor.playeraffectedarray.size; i++) {
        if (einflictor.playeraffectedarray[i] == self) {
            foundnewplayer = 0;
            break;
        }
    }
    if (foundnewplayer) {
        einflictor.playeraffectedarray[einflictor.playeraffectedarray.size] = self;
        if (weapon.rootweapon.name == "tabun_gas") {
            eattacker stats::function_e24eec31(weapon, #"used", 1);
        }
        eattacker stats::function_eec52333(weapon, #"hits", 1, eattacker.class_num, weaponpickedup);
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xc4a0deec, Offset: 0x6be0
// Size: 0x154
function processshieldassist(killedplayer) {
    self endon(#"disconnect");
    killedplayer endon(#"disconnect");
    waitframe(1);
    util::waittillslowprocessallowed();
    if (!isdefined(level.teams[self.pers[#"team"]])) {
        return;
    }
    if (self.pers[#"team"] == killedplayer.pers[#"team"]) {
        return;
    }
    if (!level.teambased) {
        return;
    }
    self incpersstat(#"assists", 1, 1, 1);
    self.assists = self getpersstat(#"assists");
    currentweapon = self getcurrentweapon();
    scoreevents::processscoreevent(#"shield_assist", self, killedplayer, currentweapon);
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0xfb8fe7c8, Offset: 0x6d40
// Size: 0x354
function function_b1a3b359(killedplayer, damagedone, weapon, assist_level = undefined) {
    self endon(#"disconnect");
    killedplayer endon(#"disconnect");
    if (!isdefined(level.teams[self.pers[#"team"]])) {
        return;
    }
    if (self.pers[#"team"] == killedplayer.pers[#"team"]) {
        return;
    }
    if (!level.teambased) {
        return;
    }
    assist_level = "assist";
    assist_level_value = int(ceil(damagedone / 25));
    if (assist_level_value < 1) {
        assist_level_value = 1;
    } else if (assist_level_value > 3) {
        assist_level_value = 3;
    }
    assist_level = assist_level + "_" + assist_level_value * 25;
    self incpersstat(#"assists", 1, 1, 1);
    self.assists = self getpersstat(#"assists");
    if (isdefined(weapon)) {
        weaponpickedup = 0;
        if (isdefined(self.pickedupweapons) && isdefined(self.pickedupweapons[weapon])) {
            weaponpickedup = 1;
        }
        self stats::function_eec52333(weapon, #"assists", 1, self.class_num, weaponpickedup);
    }
    if (!level.var_724cf71) {
        switch (weapon.name) {
        case #"hash_577b41452577c37f":
        case #"concussion_grenade":
            assist_level = "assist_concussion";
            break;
        case #"hash_af1a40bb1375dab":
        case #"flash_grenade":
            assist_level = "assist_flash";
            break;
        case #"hash_4cd586d22c20b3cf":
        case #"emp_grenade":
            assist_level = "assist_emp";
            break;
        case #"proximity_grenade":
        case #"proximity_grenade_aoe":
            assist_level = "assist_proximity";
            break;
        }
        self challenges::assisted();
        scoreevents::processscoreevent(assist_level, self, killedplayer, weapon);
        return;
    }
    self challenges::function_57ca42c6(weapon);
}

// Namespace globallogic_score/globallogic_score
// Params 3, eflags: 0x0
// Checksum 0x8a41ad5e, Offset: 0x70a0
// Size: 0xe8
function function_f38e3d84(attacker, inflictor, weapon) {
    if (!isdefined(attacker) || !isdefined(attacker.team) || self util::isenemyplayer(attacker) == 0) {
        return false;
    }
    if (self == attacker || attacker.classname == "trigger_hurt_new" || attacker.classname == "worldspawn") {
        return false;
    }
    if (killstreaks::is_killstreak_weapon(weapon)) {
        return false;
    }
    if (attacker.team == #"spectator") {
        return false;
    }
    return true;
}

// Namespace globallogic_score/globallogic_score
// Params 3, eflags: 0x0
// Checksum 0x4147edc5, Offset: 0x7190
// Size: 0x1f4
function processkillstreakassists(attacker, inflictor, weapon) {
    if (!function_f38e3d84(attacker, inflictor, weapon)) {
        return;
    }
    params = {#players:[], #attacker:attacker, #inflictor:inflictor, #weapon:weapon};
    foreach (player in level.players) {
        if (util::function_fbce7263(player.team, attacker.team)) {
            continue;
        }
        if (player == attacker) {
            continue;
        }
        if (player.sessionstate != "playing") {
            continue;
        }
        if (!isdefined(params.players)) {
            params.players = [];
        } else if (!isarray(params.players)) {
            params.players = array(params.players);
        }
        params.players[params.players.size] = player;
    }
    callback::callback(#"hash_425352b435722271", params);
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x9df388d1, Offset: 0x7390
// Size: 0xa4
function updateteamscorebyroundswon() {
    if (level.scoreroundwinbased) {
        foreach (team, _ in level.teams) {
            [[ level._setteamscore ]](team, game.stat[#"roundswon"][team]);
        }
    }
}

// Namespace globallogic_score/globallogic_score
// Params 6, eflags: 0x0
// Checksum 0x129b543d, Offset: 0x7440
// Size: 0x316
function function_e7b4c25c(nemesis_name, value, nemesis_rank, var_15574043, nemesis_xp, nemesis_xuid) {
    if (!isdefined(self.pers[#"nemesis_tracking"][nemesis_name])) {
        self.pers[#"nemesis_tracking"][nemesis_name] = {#name:nemesis_name, #value:0};
    }
    self.pers[#"nemesis_tracking"][nemesis_name].value = self.pers[#"nemesis_tracking"][nemesis_name].value + value;
    var_b5c193c6 = self.pers[#"nemesis_tracking"][self.pers[#"nemesis_name"]];
    if (self.pers[#"nemesis_name"] == "" || !isdefined(var_b5c193c6) || self.pers[#"nemesis_tracking"][nemesis_name].value > var_b5c193c6.value) {
        assert(isdefined(nemesis_name), "<dev string:x81>" + self.name);
        assert(isstring(nemesis_name), "<dev string:xa4>" + nemesis_name + "<dev string:xaf>" + self.name);
        self.pers[#"nemesis_name"] = nemesis_name;
        self.pers[#"nemesis_rank"] = nemesis_rank;
        self.pers[#"nemesis_rankicon"] = var_15574043;
        self.pers[#"nemesis_xp"] = nemesis_xp;
        self.pers[#"nemesis_xuid"] = nemesis_xuid;
        return;
    }
    if (isdefined(self.pers[#"nemesis_name"]) && self.pers[#"nemesis_name"] == nemesis_name) {
        self.pers[#"nemesis_rank"] = nemesis_rank;
        self.pers[#"nemesis_xp"] = nemesis_xp;
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x5cce31f, Offset: 0x7760
// Size: 0x54
function function_30ab51a4(params) {
    if (isdefined(self) && isdefined(self.pers)) {
        self.pers[#"hash_49e7469988944ecf"] = undefined;
        self.pers[#"hash_53919d92ff1d039"] = undefined;
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0x38ffa882, Offset: 0x77c0
// Size: 0x34
function set_character_spectate_on_index(params) {
    if (params.var_b66879ad === 0) {
        return;
    }
    function_30ab51a4(params);
}

