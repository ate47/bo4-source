#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace contracts;

// Namespace contracts/cwl_contracts
// Params 0, eflags: 0x2
// Checksum 0x130bdf16, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"cwl_contracts", &__init__, undefined, undefined);
}

// Namespace contracts/cwl_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0xabf36288, Offset: 0x108
// Size: 0x54
function __init__() {
    if (!isdefined(level.challengescallbacks)) {
        level.challengescallbacks = [];
    }
    init_player_contract_events();
    callback::on_finalize_initialization(&finalize_init);
}

// Namespace contracts/cwl_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x28ba0d70, Offset: 0x168
// Size: 0x1ac
function finalize_init() {
    callback::on_connect(&on_player_connect);
    if (can_process_contracts()) {
        challenges::registerchallengescallback("gameEnd", &function_a4c8ce2a);
        globallogic_score::registercontractwinevent(&contract_win);
        register_player_contract_event(#"score", &on_player_score, 2);
        register_player_contract_event(#"ekia", &on_ekia, 1);
        register_player_contract_event(#"objective_ekia", &on_objective_ekia);
        register_player_contract_event(#"damagedone", &on_damagedone, 1);
        level.var_79a93566 = &function_902ef0de;
        level.var_c3e2bb05 = 2;
        function_7364a587();
        /#
            thread devgui_setup();
        #/
    }
}

// Namespace contracts/cwl_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x2544b69, Offset: 0x320
// Size: 0x36e
function function_7364a587() {
    level.var_9d6b3096 = [];
    level.var_9d6b3096[#"koth_cwl"] = spawnstruct();
    level.var_9d6b3096[#"control_cwl"] = spawnstruct();
    level.var_9d6b3096[#"sd_cwl"] = spawnstruct();
    level.var_9d6b3096[#"koth_cwl"].var_9dd75c18 = 3000;
    level.var_9d6b3096[#"control_cwl"].var_9dd75c18 = 2500;
    level.var_9d6b3096[#"sd_cwl"].var_9dd75c18 = 500;
    level.var_9d6b3096[#"koth_cwl"].var_9a5a8dcf = 4000;
    level.var_9d6b3096[#"control_cwl"].var_9a5a8dcf = 3000;
    level.var_9d6b3096[#"sd_cwl"].var_9a5a8dcf = 1000;
    level.var_9d6b3096[#"koth_cwl"].var_f703cb6c = 20;
    level.var_9d6b3096[#"control_cwl"].var_f703cb6c = 15;
    level.var_9d6b3096[#"sd_cwl"].var_f703cb6c = 3;
    level.var_9d6b3096[#"koth_cwl"].var_39027dc7 = 30;
    level.var_9d6b3096[#"control_cwl"].var_39027dc7 = 25;
    level.var_9d6b3096[#"sd_cwl"].var_39027dc7 = 7;
    level.var_9d6b3096[#"koth_cwl"].var_81bbb381 = 3500;
    level.var_9d6b3096[#"control_cwl"].var_81bbb381 = 2500;
    level.var_9d6b3096[#"sd_cwl"].var_81bbb381 = 500;
    level.var_9d6b3096[#"koth_cwl"].var_9037b57b = 15;
    level.var_9d6b3096[#"control_cwl"].var_9037b57b = 10;
    level.var_9d6b3096[#"sd_cwl"].var_9037b57b = 1;
}

// Namespace contracts/cwl_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x54fb4c62, Offset: 0x698
// Size: 0x3c
function on_player_connect() {
    if (can_process_contracts()) {
        self setup_player_contracts(3, &function_58b2fea4);
    }
}

// Namespace contracts/cwl_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x71ea6a92, Offset: 0x6e0
// Size: 0xba
function can_process_contracts() {
    if (getdvarint(#"contracts_enabled", 0) == 0) {
        return 0;
    }
    if (getdvarint(#"contracts_enabled_cwl", 1) == 0) {
        return 0;
    }
    if (!sessionmodeismultiplayergame()) {
        return 0;
    }
    if (level.var_aa5e6547 !== 1) {
        return 0;
    }
    if (level.arenamatch !== 1) {
        return 0;
    }
    return challenges::canprocesschallenges();
}

// Namespace contracts/cwl_contracts
// Params 2, eflags: 0x1 linked
// Checksum 0xcfd2e476, Offset: 0x7a8
// Size: 0x12c
function on_player_score(new_score, delta_score) {
    gametype = level.gametype;
    if (!isdefined(level.var_9d6b3096[gametype])) {
        return;
    }
    player = self;
    old_score = new_score - delta_score;
    target_value = level.var_9d6b3096[gametype].var_9dd75c18;
    if (old_score < target_value) {
        if (new_score >= target_value) {
            player increment_cwl_contract(#"contract_wl_score_per_mode");
        }
        return;
    }
    var_2c74fba6 = level.var_9d6b3096[gametype].var_9a5a8dcf;
    if (old_score < var_2c74fba6 && new_score >= var_2c74fba6) {
        player increment_cwl_contract(#"hash_1075c38287814aa0");
    }
}

// Namespace contracts/cwl_contracts
// Params 1, eflags: 0x1 linked
// Checksum 0x791c7497, Offset: 0x8e0
// Size: 0xf4
function on_ekia(weapon) {
    gametype = level.gametype;
    if (!isdefined(level.var_9d6b3096[gametype])) {
        return;
    }
    player = self;
    var_350027d1 = player.pers[#"ekia"];
    if (var_350027d1 == level.var_9d6b3096[gametype].var_f703cb6c) {
        player increment_cwl_contract(#"hash_1d1b3fe36f24b6ac");
        return;
    }
    if (var_350027d1 == level.var_9d6b3096[gametype].var_39027dc7) {
        player increment_cwl_contract(#"hash_63e1c91ddca36b58");
    }
}

// Namespace contracts/cwl_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x9f01311, Offset: 0x9e0
// Size: 0xac
function on_objective_ekia() {
    gametype = level.gametype;
    if (!isdefined(level.var_9d6b3096[gametype])) {
        return;
    }
    player = self;
    objective_ekia = player.pers[#"objectiveekia"] + 1;
    if (objective_ekia == level.var_9d6b3096[gametype].var_9037b57b) {
        player increment_cwl_contract(#"hash_518ce6f8a5567a08");
    }
}

// Namespace contracts/cwl_contracts
// Params 1, eflags: 0x1 linked
// Checksum 0x2ad03354, Offset: 0xa98
// Size: 0xfc
function on_damagedone(damagedone) {
    player = self;
    if (player is_contract_active(#"hash_783240d7e11018c9")) {
        gametype = level.gametype;
        if (!isdefined(level.var_9d6b3096[gametype])) {
            return;
        }
        var_2e0944a3 = self.pers[#"damagedone"];
        var_5f607191 = var_2e0944a3 - damagedone;
        target_value = level.var_9d6b3096[gametype].var_81bbb381;
        if (var_5f607191 < target_value && var_2e0944a3 >= target_value) {
            player increment_cwl_contract(#"hash_783240d7e11018c9");
        }
    }
}

// Namespace contracts/cwl_contracts
// Params 2, eflags: 0x1 linked
// Checksum 0xea5a82d3, Offset: 0xba0
// Size: 0x5c
function increment_cwl_contract(var_38280f2f, delta = 1) {
    if (self is_contract_active(var_38280f2f)) {
        self function_902ef0de(var_38280f2f, delta);
    }
}

// Namespace contracts/cwl_contracts
// Params 2, eflags: 0x5 linked
// Checksum 0x71136050, Offset: 0xc08
// Size: 0x3c4
function private function_902ef0de(var_38280f2f, delta) {
    /#
        if (getdvarint(#"scr_contract_debug_multiplier", 0) > 0) {
            delta *= getdvarint(#"scr_contract_debug_multiplier", 1);
        }
    #/
    if (delta <= 0) {
        return;
    }
    target_value = self.pers[#"contracts"][var_38280f2f].target_value;
    old_progress = isdefined(self.pers[#"contracts"][var_38280f2f].current_value) ? self.pers[#"contracts"][var_38280f2f].current_value : self.pers[#"contracts"][var_38280f2f].var_59cb904f;
    if (old_progress == target_value) {
        return;
    }
    new_progress = int(old_progress + delta);
    if (new_progress > target_value) {
        new_progress = target_value;
    }
    if (new_progress != old_progress) {
        self.pers[#"contracts"][var_38280f2f].current_value = new_progress;
        if (isdefined(level.contract_ids[var_38280f2f])) {
            self luinotifyevent(#"hash_4b04b1cb4b3498d0", 2, level.contract_ids[var_38280f2f], new_progress);
        }
    }
    if (old_progress < target_value && target_value <= new_progress) {
        var_9d12108c = isdefined(self.team) && isdefined(self.timeplayed[self.team]) ? self.timeplayed[self.team] : 0;
        self.pers[#"contracts"][var_38280f2f].var_be5bf249 = self stats::get_stat_global(#"time_played_total") - self.pers[#"hash_5651f00c6c1790a4"] + var_9d12108c;
        if (isdefined(level.contract_ids[var_38280f2f])) {
            self luinotifyevent(#"hash_1739c4bd5baf83bc", 1, level.contract_ids[var_38280f2f]);
        }
    }
    /#
        if (getdvarint(#"scr_contract_debug", 0) > 0) {
            iprintln(function_9e72a96(var_38280f2f) + "<dev string:x38>" + new_progress + "<dev string:x46>" + target_value);
            if (old_progress < target_value && target_value <= new_progress) {
                iprintln(function_9e72a96(var_38280f2f) + "<dev string:x4a>");
            }
        }
    #/
}

// Namespace contracts/cwl_contracts
// Params 1, eflags: 0x1 linked
// Checksum 0x6f169b37, Offset: 0xfd8
// Size: 0x22
function function_58b2fea4(slot) {
    return function_d17bcd3c(slot);
}

// Namespace contracts/cwl_contracts
// Params 1, eflags: 0x1 linked
// Checksum 0x93cc4780, Offset: 0x1008
// Size: 0x1f4
function function_a4c8ce2a(data) {
    if (!isdefined(data)) {
        return;
    }
    player = data.player;
    if (!isplayer(player)) {
        return;
    }
    player increment_cwl_contract(#"contract_wl_play_games");
    team = player.team;
    if (isdefined(level.placement[team]) && player.score > 0) {
        var_414a209b = min(level.placement.size, 3);
        for (i = 0; i < var_414a209b; i++) {
            if (level.placement[team][i] == player) {
                player increment_contract(#"contract_wl_top_3_team");
                break;
            }
        }
    }
    var_67d27328 = player stats::get_stat(#"arenastats", 2, #"leagueplaystats", #"hash_36cd820c1ff6c16b");
    if (var_67d27328 > 0) {
        player increment_contract(#"hash_35e52e40ab6d1223", var_67d27328);
        player increment_contract(#"hash_421c3b5196a40f99", var_67d27328);
    }
    player function_78083139();
}

// Namespace contracts/cwl_contracts
// Params 1, eflags: 0x1 linked
// Checksum 0x4edb9382, Offset: 0x1208
// Size: 0xe4
function contract_win(winner) {
    winner increment_cwl_contract(#"contract_wl_win_games");
    winner increment_cwl_contract(#"hash_2809e14b0f3b4c5e");
    var_15b1abd9 = winner stats::get_stat_global(#"hash_a06075423336d9c");
    if (var_15b1abd9 > 0) {
        if (var_15b1abd9 % 4 == 0) {
            winner increment_cwl_contract(#"contract_wl_win_streak_hard");
        }
        if (var_15b1abd9 % 2 == 0) {
            winner increment_cwl_contract(#"hash_4a14b348f01ad76d");
        }
    }
}

/#

    // Namespace contracts/cwl_contracts
    // Params 0, eflags: 0x0
    // Checksum 0xae2da88e, Offset: 0x12f8
    // Size: 0x9c
    function devgui_setup() {
        devgui_base = "<dev string:x6b>";
        wait(3);
        function_e07e542b(devgui_base, undefined);
        function_17a92a99(devgui_base);
        function_7f05e018(devgui_base);
        function_ef925b75(devgui_base);
        function_295a8005(devgui_base);
    }

    // Namespace contracts/cwl_contracts
    // Params 1, eflags: 0x0
    // Checksum 0xe8695f22, Offset: 0x13a0
    // Size: 0x1f4
    function function_17a92a99(var_1d89ece6) {
        var_78a6fb52 = var_1d89ece6 + "<dev string:x7f>";
        var_c8d599b5 = "<dev string:x93>";
        util::function_3f749abc(var_78a6fb52 + "<dev string:xcf>", var_c8d599b5 + "<dev string:xdf>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:xfb>", var_c8d599b5 + "<dev string:x110>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x131>", var_c8d599b5 + "<dev string:x14a>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x16e>", var_c8d599b5 + "<dev string:x189>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x1ab>", var_c8d599b5 + "<dev string:x1cd>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x1e6>", var_c8d599b5 + "<dev string:x1fb>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x21c>", var_c8d599b5 + "<dev string:x231>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x24b>", var_c8d599b5 + "<dev string:x25f>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x278>", var_c8d599b5 + "<dev string:x297>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x2bb>", var_c8d599b5 + "<dev string:x2da>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x2fe>", var_c8d599b5 + "<dev string:x310>");
    }

    // Namespace contracts/cwl_contracts
    // Params 1, eflags: 0x0
    // Checksum 0xf46b14f1, Offset: 0x15a0
    // Size: 0x12c
    function function_7f05e018(var_1d89ece6) {
        var_78a6fb52 = var_1d89ece6 + "<dev string:x32e>";
        var_c8d599b5 = "<dev string:x93>";
        util::function_3f749abc(var_78a6fb52 + "<dev string:x343>", var_c8d599b5 + "<dev string:x34a>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x362>", var_c8d599b5 + "<dev string:x36e>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x38b>", var_c8d599b5 + "<dev string:x398>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x3b1>", var_c8d599b5 + "<dev string:x3c4>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x3e2>", var_c8d599b5 + "<dev string:x3f2>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x412>", var_c8d599b5 + "<dev string:x427>");
    }

    // Namespace contracts/cwl_contracts
    // Params 1, eflags: 0x0
    // Checksum 0x25cd7feb, Offset: 0x16d8
    // Size: 0xb4
    function function_ef925b75(var_1d89ece6) {
        var_78a6fb52 = var_1d89ece6 + "<dev string:x44c>";
        var_c8d599b5 = "<dev string:x93>";
        util::function_3f749abc(var_78a6fb52 + "<dev string:x463>", var_c8d599b5 + "<dev string:x474>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x491>", var_c8d599b5 + "<dev string:x4a7>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x4c9>", var_c8d599b5 + "<dev string:x4e3>");
    }

    // Namespace contracts/cwl_contracts
    // Params 1, eflags: 0x0
    // Checksum 0x42e9f9a5, Offset: 0x1798
    // Size: 0x8c
    function function_295a8005(var_1d89ece6) {
        var_78a6fb52 = var_1d89ece6 + "<dev string:x509>";
        var_c8d599b5 = "<dev string:x93>";
        util::function_3f749abc(var_78a6fb52 + "<dev string:x51b>", var_c8d599b5 + "<dev string:x52c>");
        util::function_3f749abc(var_78a6fb52 + "<dev string:x545>", var_c8d599b5 + "<dev string:x559>");
    }

#/
