// Atian COD Tools GSC decompiler test
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\userspawnselection.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace gametype;

// Namespace gametype/gametype
// Params 0, eflags: 0x1 linked
// Checksum 0xe724b7d0, Offset: 0xc8
// Size: 0x16e
function init() {
    bundle = function_302bd0b9();
    level.var_d1455682 = bundle;
    level.var_812be535 = 0;
    if (!isdefined(bundle)) {
        return;
    }
    level.teambased = isgametypeteambased();
    setvisiblescoreboardcolumns(bundle.scoreboard_1, bundle.scoreboard_2, bundle.scoreboard_3, bundle.scoreboard_4, bundle.scoreboard_5, bundle.var_d4259e74, bundle.var_54dd9ff6, bundle.var_5ee7b40a, bundle.var_6d3350a1, bundle.var_26d52900);
    globallogic_audio::set_leader_gametype_dialog(bundle.var_ef0e6936, bundle.var_92ea240c, bundle.var_39d466bc, bundle.var_fd58840f, "", "");
    if (!isdefined(game.switchedsides)) {
        game.switchedsides = 0;
    }
    level.onroundswitch = &on_round_switch;
}

// Namespace gametype/gametype
// Params 0, eflags: 0x1 linked
// Checksum 0xef3b58d4, Offset: 0x240
// Size: 0x7c
function on_start_game_type() {
    bundle = level.var_d1455682;
    if (!isdefined(bundle)) {
        return;
    }
    function_f2f4dfa7();
    util::function_9540d9b6();
    if (!util::isoneround() && level.scoreroundwinbased) {
        globallogic_score::resetteamscores();
    }
}

// Namespace gametype/gametype
// Params 0, eflags: 0x1 linked
// Checksum 0x8673dc05, Offset: 0x2c8
// Size: 0x7c
function on_round_switch() {
    bundle = level.var_d1455682;
    if (!isdefined(bundle)) {
        return;
    }
    if (isdefined(level.var_d1455682.switchsides) && level.var_d1455682.switchsides) {
        game.switchedsides = !game.switchedsides;
        userspawnselection::onroundchange();
    }
}

// Namespace gametype/gametype
// Params 1, eflags: 0x5 linked
// Checksum 0xc4cca1cd, Offset: 0x350
// Size: 0x20
function private function_788fb510(value) {
    if (!isdefined(value)) {
        return "";
    }
    return value;
}

// Namespace gametype/gametype
// Params a, eflags: 0x1 linked
// Checksum 0x704f31f2, Offset: 0x378
// Size: 0x1ec
function setvisiblescoreboardcolumns(col1, col2, col3, col4, col5, col6, col7, col8, col9, col10) {
    col1 = function_788fb510(col1);
    col2 = function_788fb510(col2);
    col3 = function_788fb510(col3);
    col4 = function_788fb510(col4);
    col5 = function_788fb510(col5);
    col6 = function_788fb510(col6);
    col7 = function_788fb510(col7);
    col8 = function_788fb510(col8);
    col9 = function_788fb510(col9);
    col10 = function_788fb510(col10);
    if (!level.rankedmatch) {
        setscoreboardcolumns(col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, "sbtimeplayed", "shotshit", "shotsmissed", "victory");
    } else {
        setscoreboardcolumns(col1, col2, col3, col4, col5, col6, col7, col8, col9, col10);
    }
}

// Namespace gametype/gametype
// Params 0, eflags: 0x1 linked
// Checksum 0x7a6c199, Offset: 0x570
// Size: 0x8c
function function_f2f4dfa7() {
    if (isdefined(level.var_d1455682.switchsides) && level.var_d1455682.switchsides && game.switchedsides) {
        util::set_team_mapping(game.defenders, game.attackers);
    } else {
        util::set_team_mapping(game.attackers, game.defenders);
    }
}

