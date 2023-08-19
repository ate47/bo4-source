// Atian COD Tools GSC decompiler test
#include scripts/wz_common/gametypes/warzone.gsc;
#include scripts/wz_common/wz_contracts.gsc;
#include scripts/mp_common/item_world_util.gsc;
#include scripts/mp_common/player/player_record.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/core_common/infection.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include script_1d29de500c266470;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/match_record.gsc;
#include scripts/core_common/loot_tracking.gsc;
#include scripts/core_common/gamestate.gsc;
#include scripts/core_common/contracts_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace wz_progression;

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x2
// Checksum 0xc2496f01, Offset: 0x280
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"wz_progression", &__init__, &__main__, undefined);
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0x3076b6b, Offset: 0x2d0
// Size: 0x832
function __init__() {
    callback::on_revived(&function_3de8b6e0);
    callback::on_player_damage(&function_36e144fa);
    callback::on_vehicle_killed(&function_8920ad6e);
    callback::on_item_pickup(&function_106be0dc);
    callback::on_item_pickup(&on_item_pickup);
    callback::on_item_use(&function_393ec79e);
    callback::on_stash_open(&function_6c478b00);
    callback::add_callback(#"freefall", &function_c9a18304);
    callback::on_challenge_complete(&on_challenge_complete);
    callback::on_character_unlock(&on_character_unlock);
    callback::on_game_playing(&on_game_playing);
    callback::on_downed(&function_a117c988);
    callback::on_player_killed_with_params(&on_player_killed);
    callback::function_14dae612(&function_14dae612);
    callback::on_contract_complete(&on_contract_complete);
    level.var_c8453874 = &function_35ac33e1;
    level.var_959f44cf = &function_59c85637;
    level.merits = {};
    level.merits.kill = isdefined(getgametypesetting(#"wzmeritkill")) ? getgametypesetting(#"wzmeritkill") : 0;
    level.merits.win = isdefined(getgametypesetting(#"wzmeritwin")) ? getgametypesetting(#"wzmeritwin") : 0;
    level.merits.top5 = isdefined(getgametypesetting(#"wzmerittop5")) ? getgametypesetting(#"wzmerittop5") : 0;
    level.merits.top10 = isdefined(getgametypesetting(#"wzmerittop10")) ? getgametypesetting(#"wzmerittop10") : 0;
    level.merits.top15 = isdefined(getgametypesetting(#"wzmerittop15")) ? getgametypesetting(#"wzmerittop15") : 0;
    level.merits.top20 = isdefined(getgametypesetting(#"wzmerittop20")) ? getgametypesetting(#"wzmerittop20") : 0;
    level.merits.top25 = isdefined(getgametypesetting(#"wzmerittop25")) ? getgametypesetting(#"wzmerittop25") : 0;
    level.merits.top30 = isdefined(getgametypesetting(#"wzmerittop30")) ? getgametypesetting(#"wzmerittop30") : 0;
    level.merits.top50 = isdefined(getgametypesetting(#"wzmerittop50")) ? getgametypesetting(#"wzmerittop50") : 0;
    level.merits.top60 = isdefined(getgametypesetting(#"wzmerittop60")) ? getgametypesetting(#"wzmerittop60") : 0;
    level.merits.top75 = isdefined(getgametypesetting(#"wzmerittop75")) ? getgametypesetting(#"wzmerittop75") : 0;
    level.merits.lives = isdefined(getgametypesetting(#"wzmeritlives")) ? getgametypesetting(#"wzmeritlives") : 0;
    level.merits.killinfected = isdefined(getgametypesetting(#"wzmeritinfectedkill")) ? getgametypesetting(#"wzmeritinfectedkill") : 0;
    level.merits.var_56dcbb49 = isdefined(getgametypesetting(#"hash_5596ee09efc44216")) ? getgametypesetting(#"hash_5596ee09efc44216") : 0;
    level.merits.var_cbafe055 = isdefined(getgametypesetting(#"hash_6551049476c7127c")) ? getgametypesetting(#"hash_6551049476c7127c") : 0;
    level.merits.infectedwin = isdefined(getgametypesetting(#"wzmeritinfectedwin")) ? getgametypesetting(#"wzmeritinfectedwin") : 0;
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xb10
// Size: 0x4
function __main__() {
    
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0xdc93be09, Offset: 0xb20
// Size: 0xc4
function function_cfc02934() {
    var_88846d2d = getdvar(#"hash_4a5fd7d94cfc9dfd", 0) != 0 || getdvarint(#"hash_4a5fd7d94cfc9dfd", 0) != 0;
    if (isplayer(self) && !isbot(self) && var_88846d2d) {
        player = self;
        player giveachievement("wz_specialist_super_fan");
    }
}

// Namespace wz_progression/player_medal
// Params 1, eflags: 0x40
// Checksum 0x14ee8894, Offset: 0xbf0
// Size: 0xac
function event<player_medal> codecallback_medal(eventstruct) {
    if (isdefined(eventstruct) && isdefined(eventstruct.var_7fcb97e3) && isdefined(level.scoreinfo) && isdefined(level.scoreinfo[eventstruct.var_7fcb97e3])) {
        medalinfo = level.scoreinfo[eventstruct.var_7fcb97e3];
        self give_xp("medal", #"medalxp", medalinfo[#"xp"]);
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0x87622787, Offset: 0xca8
// Size: 0x12c
function on_contract_complete(params) {
    player = params.player;
    if (isdefined(player) && isdefined(player.pers) && isdefined(player.pers[#"contracts"]) && isdefined(player.pers[#"contracts"][params.var_38280f2f])) {
        contract = player.pers[#"contracts"][params.var_38280f2f];
        if (isdefined(contract) && isdefined(contract.xp) && contract.xp > 0) {
            player give_xp("contract", #"contractxp", contract.xp);
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 3, eflags: 0x1 linked
// Checksum 0x4bd25048, Offset: 0xde0
// Size: 0x31a
function give_xp(var_c14ca2e6, xpstat, amount) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    var_60a35182 = 0;
    if (isdefined(player.pers) && isdefined(player.pers[#"plevel"]) && player.pers[#"plevel"] == level.maxprestige) {
        var_60a35182 = 1;
    }
    if (isdefined(var_60a35182) && var_60a35182) {
        prevxp = player stats::get_stat_global("PARAGON_RANKXP");
        player addrankxpvalue(var_c14ca2e6, amount);
        curxp = player stats::get_stat_global("PARAGON_RANKXP");
    } else {
        prevxp = player stats::get_stat_global("RANKXP");
        player addrankxpvalue(var_c14ca2e6, amount);
        curxp = player stats::get_stat_global("RANKXP");
        if (isdefined(player.pers) && isdefined(player.pers[#"plevel"]) && player.pers[#"plevel"] == level.maxprestige - 1) {
            if (curxp == level.rankxpcap) {
                player.pers[#"plevel"] = level.maxprestige;
                player stats::set_stat_global(#"plevel", level.maxprestige);
                player stats::set_stat_global(#"paragon_rank", level.maxrank + 1);
                player stats::function_62b271d8(#"plevel", level.maxprestige);
            }
        }
    }
    var_a402c6e3 = curxp - prevxp;
    player stats::function_dad108fa(xpstat, var_a402c6e3);
    player.pers[#"hash_6344af0b142ed0b6"] = 1;
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0x65ed7575, Offset: 0x1108
// Size: 0x9c
function function_ec3a8858() {
    player = self;
    if (!isplayer(player)) {
        return 0;
    }
    if (isdefined(player.inventory) && isdefined(player.inventory.consumed)) {
        if ((isdefined(player.inventory.consumed.size) ? player.inventory.consumed.size : 0) > 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x5 linked
// Checksum 0x7219d7cd, Offset: 0x11b0
// Size: 0xc4
function private function_f874ca5e(placement_player) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (!isplayer(player)) {
        return;
    }
    player.pers[#"placement_player"] = placement_player;
    player match_record::set_player_stat(#"player_placement", placement_player);
    player stats::function_7a850245(#"placement_player", placement_player);
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0x62df5ab, Offset: 0x1280
// Size: 0x13a
function player_connected() {
    /#
        assert(isplayer(self));
    #/
    player = self;
    player.pers[#"jointime"] = gettime();
    player.pers[#"deathtime"] = 0;
    player.pers[#"teameliminatedtime"] = 0;
    player.pers[#"meritkills"] = 0;
    player.pers[#"meritprogression"] = 0;
    player.pers[#"hash_39220b202c67c56b"] = 0;
    player.pers[#"placement_player"] = 0;
    player.pers[#"placement_team"] = 0;
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0x9651a89d, Offset: 0x13c8
// Size: 0x352
function function_2c8aac6() {
    /#
        assert(isplayer(self));
    #/
    player = self;
    if (!player stats::function_f94325d3() || isbot(player) || !isdefined(player.pers)) {
        return;
    }
    if (isdefined(player.pers[#"hash_39220b202c67c56b"]) && player.pers[#"hash_39220b202c67c56b"]) {
        /#
            println("<unknown string>" + (isdefined(player.name) ? player.name : "<unknown string>") + "<unknown string>");
        #/
        return;
    }
    var_87ecbce6 = getdvarfloat(#"hash_138e4c481ef6cfb1", 0);
    var_7f6396f0 = getdvarfloat(#"hash_5bb505659db06d9b", 0);
    if (!isdefined(player.pers[#"teameliminatedtime"])) {
        player.pers[#"teameliminatedtime"] = gettime();
    }
    var_1ef5a3ba = player function_59c85637();
    player wz_contracts::function_9b431779(var_1ef5a3ba);
    player contracts::function_78083139();
    player challenges::function_659f7dc(var_1ef5a3ba, var_87ecbce6, var_7f6396f0);
    player function_4835d26a();
    /#
        println("<unknown string>" + (isdefined(player.name) ? player.name : "<unknown string>") + "<unknown string>" + player.pers[#"placement_player"] + "<unknown string>" + "<unknown string>" + player.pers[#"placement_team"] + "<unknown string>" + "<unknown string>" + player.pers[#"kills"] + "<unknown string>" + "<unknown string>" + player.pers[#"meritprogression"] + "<unknown string>");
    #/
    player.pers[#"hash_39220b202c67c56b"] = 1;
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0x821ea0b9, Offset: 0x1728
// Size: 0xc2
function function_59c85637() {
    if (self.pers[#"teameliminatedtime"]) {
        var_c06441ec = max(gettime() - self.pers[#"teameliminatedtime"], 0);
    } else {
        var_c06441ec = 0;
    }
    var_1ef5a3ba = 0;
    if (isdefined(self.pers[#"hash_150795bee4d46ce4"])) {
        var_1ef5a3ba = max(gettime() - self.pers[#"hash_150795bee4d46ce4"] - var_c06441ec, 0);
    }
    return var_1ef5a3ba;
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0x21da3b01, Offset: 0x17f8
// Size: 0x44
function player_disconnected() {
    self stats::function_b7f80d87(#"died", 1);
    self function_2c8aac6();
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x5 linked
// Checksum 0xa0a40b93, Offset: 0x1848
// Size: 0x64
function private function_fb20ad56() {
    player = self;
    /#
        assert(isplayer(player));
    #/
    player stats::function_d40764f3(#"hash_6d5e162204f447f4", 1);
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x5 linked
// Checksum 0x37972a56, Offset: 0x18b8
// Size: 0x64
function private function_d61fdbef() {
    player = self;
    /#
        assert(isplayer(player));
    #/
    player stats::function_d40764f3(#"hash_25f4611fc9d40aa8", 1);
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x5 linked
// Checksum 0x46d0955a, Offset: 0x1928
// Size: 0x64
function private function_67949803() {
    player = self;
    /#
        assert(isplayer(player));
    #/
    player stats::function_d40764f3(#"hash_63307a0460c698ac", 1);
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x5 linked
// Checksum 0x3f69fa02, Offset: 0x1998
// Size: 0x3bc
function private function_51cae91b(placement) {
    player = self;
    if (placement <= 5 && level.merits.top5 > 0) {
        player give_xp("top5", #"placementxp", level.merits.top5);
    } else if (placement <= 10 && level.merits.top10 > 0) {
        player give_xp("top10", #"placementxp", level.merits.top10);
    } else if (placement <= 15 && level.merits.top15 > 0) {
        player give_xp("top15", #"placementxp", level.merits.top15);
    } else if (placement <= 20 && level.merits.top20 > 0) {
        player give_xp("top20", #"placementxp", level.merits.top20);
    } else if (placement <= 25 && level.merits.top25 > 0) {
        player give_xp("top25", #"placementxp", level.merits.top25);
    } else if (placement <= 30 && level.merits.top30 > 0) {
        player give_xp("top30", #"placementxp", level.merits.top30);
    } else if (placement <= 50 && level.merits.top50 > 0) {
        player give_xp("top50", #"placementxp", level.merits.top50);
    } else if (placement <= 60 && level.merits.top60 > 0) {
        player give_xp("top60", #"placementxp", level.merits.top60);
    } else if (placement <= 75 && level.merits.top75 > 0) {
        player give_xp("top75", #"placementxp", level.merits.top75);
    }
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x5 linked
// Checksum 0xa7508084, Offset: 0x1d60
// Size: 0x64
function private function_a0fea1a9() {
    player = self;
    /#
        assert(isplayer(player));
    #/
    player stats::function_d40764f3(#"hash_6429d1fccdef2c9", 1);
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x5 linked
// Checksum 0xb0a08797, Offset: 0x1dd0
// Size: 0xec
function private function_3217b0d2() {
    player = self;
    /#
        assert(isplayer(player));
    #/
    player stats::function_d40764f3(#"hash_7b8d2c77874a1c24", 1);
    if (player function_ec3a8858()) {
        player stats::function_d40764f3(#"hash_337e05385393e3a6", 1);
    }
    if (!(isdefined(player.var_e4bec3d4) && player.var_e4bec3d4)) {
        player stats::function_d40764f3(#"hash_702849e1bf1e3915", 1);
    }
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x5 linked
// Checksum 0x864c8944, Offset: 0x1ec8
// Size: 0xfc
function private function_6a7970fe() {
    player = self;
    /#
        assert(isplayer(player));
    #/
    player stats::function_d40764f3(#"hash_5e9a745460a10f80", 1);
    if (isdefined(player.avenger) && player.avenger) {
        player stats::function_d40764f3(#"hash_5387d5e6f15c6b55", 1);
    }
    if (isdefined(player.items_picked_up) && player.items_picked_up.size <= 1) {
        player stats::function_d40764f3(#"hash_7158067d85c1402a", 1);
    }
}

// Namespace wz_progression/wz_progression
// Params 2, eflags: 0x1 linked
// Checksum 0x8db3a2d6, Offset: 0x1fd0
// Size: 0x2b0
function team_eliminated(team, team_placement) {
    if (!isdefined(team)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    a_players = getplayers(team);
    if (isdefined(level.var_29ab88df)) {
        level [[ level.var_29ab88df ]](a_players, team_placement);
    }
    /#
        println("<unknown string>" + (isdefined(team) ? team : "<unknown string>") + "<unknown string>" + team_placement + "<unknown string>");
    #/
    foreach (player in a_players) {
        if (!isdefined(player.pers) || isdefined(player.pers[#"hash_2283e9384383a6e9"]) && player.pers[#"hash_2283e9384383a6e9"]) {
            continue;
        }
        player.pers[#"hash_2283e9384383a6e9"] = 1;
        player.pers[#"teameliminatedtime"] = gettime();
        player.pers[#"placement_team"] = team_placement;
        player match_record::set_player_stat(#"team_placement", team_placement);
        player stats::function_7a850245(#"placement_team", team_placement);
        if (team_placement <= 15) {
            player function_a0fea1a9();
        }
        if (team_placement <= 10) {
            player function_3217b0d2();
        }
        if (team_placement <= 5) {
            player function_6a7970fe();
        }
        player function_51cae91b(team_placement);
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0x29961453, Offset: 0x2288
// Size: 0x5e0
function function_5648f82(team) {
    /#
        println("<unknown string>" + (isdefined(team) ? team : "<unknown string>"));
    #/
    if (isdefined(team)) {
        foreach (player in getplayers(team)) {
            if (!player stats::function_f94325d3()) {
                continue;
            }
            if (!isdefined(player.pers) || isdefined(player.pers[#"hash_2283e9384383a6e9"]) && player.pers[#"hash_2283e9384383a6e9"]) {
                continue;
            }
            player.pers[#"hash_2283e9384383a6e9"] = 1;
            player.pers[#"placement_team"] = 1;
            player.pers[#"placement_player"] = 1;
            player function_a0fea1a9();
            player function_3217b0d2();
            player function_6a7970fe();
            player function_fb20ad56();
            player function_d61fdbef();
            player function_67949803();
            player function_51cae91b(1);
            var_ced14f4b = level.merits.win;
            if (util::get_game_type() == "warzone_pandemic_quad") {
                if (getteamplatoon(team) == infection::function_76601b7d()) {
                    var_ced14f4b = level.merits.infectedwin;
                }
            }
            player give_xp("win", #"winxp", var_ced14f4b);
            player stats::function_dad108fa(#"wins_first", 1);
            player giveachievement("wz_first_win");
            var_4cf27874 = player stats::get_stat_global(#"wins");
            if (var_4cf27874 >= 9) {
                player giveachievement("wz_not_a_fluke");
            }
            isinfected = util::get_game_type() == "warzone_pandemic_quad" && getteamplatoon(team) == infection::function_76601b7d();
            if ((!isdefined(player.laststandcount) || player.laststandcount <= 0) && !isinfected) {
                player stats::function_d40764f3(#"wins_without_down", 1);
            }
            if (isdefined(player.pers[#"kills"]) && player.pers[#"kills"] == 0) {
                player stats::function_d40764f3(#"wins_without_kills", 1);
            }
            player_counts = warzone::function_de15dc32();
            if (isalive(player) && player_counts.alive == 1 && (isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1) > 1) {
                player stats::function_d40764f3(#"wins_last_alive", 1);
            }
            player function_f874ca5e(1);
            player match_record::set_player_stat(#"team_placement", 1);
            player stats::function_7a850245(#"placement_team", 1);
            player stats::function_b7f80d87(#"died", 1);
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 3, eflags: 0x1 linked
// Checksum 0x53efd407, Offset: 0x2870
// Size: 0x2ac
function on_vehicle_enter(vehicle, player, seatindex) {
    if (level.inprematchperiod) {
        return;
    }
    if (seatindex === 0) {
        vehicle thread function_f8072c71(player);
        if (!isdefined(player.var_e081a4e5)) {
            player.var_e081a4e5 = [];
        }
        var_b01d9212 = isairborne(vehicle);
        var_7c6311c4 = vehicle.vehicleclass === "boat";
        var_f03db647 = !var_b01d9212 && !var_7c6311c4;
        if (var_b01d9212 && !isdefined(player.var_e081a4e5[#"air"])) {
            player.var_e081a4e5[#"air"] = 1;
        } else if (var_7c6311c4 && !isdefined(player.var_e081a4e5[#"sea"])) {
            player.var_e081a4e5[#"sea"] = 1;
        } else if (var_f03db647 && !isdefined(player.var_e081a4e5[#"land"])) {
            player.var_e081a4e5[#"land"] = 1;
        }
        if (player.var_e081a4e5.size == 3) {
            if (!(isdefined(player.var_e081a4e5[#"all_used"]) && player.var_e081a4e5[#"all_used"])) {
                player.var_e081a4e5[#"all_used"] = 1;
                player stats::function_d40764f3(#"vehicle_used_all", 1);
            }
        }
        if (isdefined(player.lastdamagetime)) {
            time = gettime();
            if (time - player.lastdamagetime <= 3000) {
                player thread function_d0c523bf();
            }
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0x92a6f697, Offset: 0x2b28
// Size: 0x7c
function function_d0c523bf() {
    self endon(#"death", #"exit_vehicle", #"disconnect");
    wait(5);
    if (self isinvehicle()) {
        self stats::function_d40764f3(#"vehicle_escapes", 1);
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0xf1639481, Offset: 0x2bb0
// Size: 0x412
function function_f8072c71(player) {
    if (!isplayer(player) || !isdefined(self)) {
        return;
    }
    self endon(#"hash_2d45f3f009f1b3b3", #"death");
    player endon(#"death", #"exit_vehicle", #"disconnect");
    var_d98c5084 = self.origin;
    distancetraveled = 0;
    var_b01d9212 = isairborne(self);
    var_7c6311c4 = self.vehicleclass === "boat";
    var_f03db647 = !var_b01d9212 && !var_7c6311c4;
    while (isdefined(self) && isdefined(player)) {
        wait(1);
        if (isdefined(self) && isdefined(player)) {
            distancetraveled = int(distancetraveled + distance2d(self.origin, var_d98c5084));
            var_d98c5084 = self.origin;
            if (distancetraveled > 1000) {
                if (var_f03db647) {
                    player stats::function_dad108fa(#"distance_traveled_vehicle_land", distancetraveled);
                    var_ae40ba19 = player stats::get_stat_global(#"distance_traveled_vehicle_land");
                    var_7f444a72 = int(var_ae40ba19 / 63360);
                    var_a7f485eb = player stats::get_stat_global(#"hash_83f7445bc09cd22");
                    if (var_7f444a72 > var_a7f485eb) {
                        diff = var_7f444a72 - var_a7f485eb;
                        player stats::function_dad108fa(#"hash_83f7445bc09cd22", diff);
                    }
                }
                if (var_b01d9212) {
                    player stats::function_dad108fa(#"distance_traveled_vehicle_air", distancetraveled);
                    var_ae40ba19 = player stats::get_stat_global(#"distance_traveled_vehicle_air");
                    var_7f444a72 = int(var_ae40ba19 / 63360);
                    var_a7f485eb = player stats::get_stat_global(#"distance_traveled_vehicle_air_miles");
                    if (var_7f444a72 > var_a7f485eb) {
                        diff = var_7f444a72 - var_a7f485eb;
                        player stats::function_dad108fa(#"distance_traveled_vehicle_air_miles", diff);
                    }
                }
                if (var_7c6311c4) {
                    player stats::function_dad108fa(#"distance_traveled_vehicle_water", distancetraveled);
                    var_ae40ba19 = player stats::get_stat_global(#"distance_traveled_vehicle_water");
                    var_7f444a72 = int(var_ae40ba19 / 63360);
                    var_a7f485eb = player stats::get_stat_global(#"distance_traveled_vehicle_water_miles");
                    if (var_7f444a72 > var_a7f485eb) {
                        diff = var_7f444a72 - var_a7f485eb;
                        player stats::function_dad108fa(#"distance_traveled_vehicle_water_miles", diff);
                    }
                }
                distancetraveled = 0;
            }
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0x7a10546b, Offset: 0x2fd0
// Size: 0x4c
function on_exit_locked_on_vehicle(player) {
    if (isplayer(player)) {
        player stats::function_d40764f3(#"vehicle_lock_exits", 1);
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0x7bc0ade8, Offset: 0x3028
// Size: 0x5e
function function_c9a18304(eventstruct) {
    if (eventstruct.freefall) {
        if (isplayer(self)) {
            self thread function_da21a17c();
        }
    } else {
        self notify(#"hash_74973f333d2fabfa");
    }
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0x76f0dd1e, Offset: 0x3090
// Size: 0x1b8
function function_da21a17c() {
    self endon(#"hash_74973f333d2fabfa", #"death", #"disconnect");
    var_d98c5084 = self.origin;
    distancetraveled = 0;
    while (isdefined(self)) {
        wait(1);
        if (isdefined(self)) {
            distancetraveled = int(distancetraveled + distance2d(self.origin, var_d98c5084));
            var_d98c5084 = self.origin;
            if (distancetraveled > 1000) {
                self stats::function_dad108fa(#"distance_traveled_wingsuit", distancetraveled);
                distancetraveled = 0;
                var_ae40ba19 = self stats::get_stat_global(#"distance_traveled_wingsuit");
                var_7f444a72 = int(var_ae40ba19 / 63360);
                var_a7f485eb = self stats::get_stat_global(#"distance_traveled_wingsuit_miles");
                if (var_7f444a72 > var_a7f485eb) {
                    diff = var_7f444a72 - var_a7f485eb;
                    self stats::function_dad108fa(#"distance_traveled_wingsuit_miles", diff);
                }
            }
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0x4b740723, Offset: 0x3250
// Size: 0x3e
function function_3de8b6e0(params) {
    if (!gamestate::is_state("playing") || !isdefined(params.reviver)) {
        return;
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0xeba9122c, Offset: 0x3298
// Size: 0x26a
function function_36e144fa(params) {
    if (!(isdefined(self.var_e4bec3d4) && self.var_e4bec3d4)) {
        if (params.smeansofdeath == "MOD_DEATH_CIRCLE") {
            self.var_e4bec3d4 = 1;
        }
    }
    if (!isdefined(self.var_9854aa3a)) {
        self.var_9854aa3a = [];
    }
    attacker = params.eattacker;
    if (isplayer(attacker) && !isinarray(self.var_9854aa3a, attacker)) {
        if (!isdefined(self.var_9854aa3a)) {
            self.var_9854aa3a = [];
        } else if (!isarray(self.var_9854aa3a)) {
            self.var_9854aa3a = array(self.var_9854aa3a);
        }
        if (!isinarray(self.var_9854aa3a, attacker)) {
            self.var_9854aa3a[self.var_9854aa3a.size] = attacker;
        }
    }
    bare_hands = getweapon(#"bare_hands");
    var_c1f166f3 = self hasweapon(bare_hands);
    if (var_c1f166f3) {
        if (!isdefined(self.var_91ddc6c5)) {
            self.var_91ddc6c5 = [];
        }
        if (isplayer(attacker) && !isinarray(self.var_91ddc6c5, attacker)) {
            if (!isdefined(self.var_91ddc6c5)) {
                self.var_91ddc6c5 = [];
            } else if (!isarray(self.var_91ddc6c5)) {
                self.var_91ddc6c5 = array(self.var_91ddc6c5);
            }
            if (!isinarray(self.var_91ddc6c5, attacker)) {
                self.var_91ddc6c5[self.var_91ddc6c5.size] = attacker;
            }
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x5 linked
// Checksum 0x61efd1a7, Offset: 0x3510
// Size: 0x19a
function private function_a117c988() {
    if (isdefined(self.laststandparams)) {
        attacker = self.laststandparams.attacker;
        if (isdefined(attacker) && isdefined(attacker.var_121392a1) && isarray(attacker.var_121392a1)) {
            if (isdefined(attacker.var_121392a1[#"blind_base"]) || isdefined(attacker.var_121392a1[#"swat_grenade"]) || isdefined(attacker.var_121392a1[#"hash_1527a22d8a6fdc21"])) {
                self.laststandparams.var_6314a3a3 = 1;
            }
        }
        if (isplayer(attacker)) {
            vehicle = attacker getvehicleoccupied();
            if (isdefined(vehicle) && isvehicle(vehicle)) {
                seat = vehicle getoccupantseat(attacker);
                if (isdefined(seat)) {
                    if (seat === 0) {
                        self.laststandparams.var_adb68654 = 1;
                    }
                    if (seat > 0) {
                        self.laststandparams.var_69427d4d = 1;
                    }
                }
            }
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x5 linked
// Checksum 0xa8537181, Offset: 0x36b8
// Size: 0x144
function private on_player_killed(params) {
    victim = self;
    /#
        assert(isplayer(victim));
    #/
    if (isdefined(victim)) {
        victim.pers[#"deathtime"] = gettime();
        player_counts = warzone::function_de15dc32(victim);
        placement_player = player_counts.alive + 1;
        if (placement_player <= 25) {
            victim function_fb20ad56();
        }
        if (placement_player <= 10) {
            victim function_d61fdbef();
        }
        if (placement_player <= 5) {
            victim function_67949803();
        }
        victim stats::function_b7f80d87(#"died", 1);
        victim function_f874ca5e(placement_player);
    }
}

// Namespace wz_progression/wz_progression
// Params 3, eflags: 0x1 linked
// Checksum 0x30777106, Offset: 0x3808
// Size: 0xe4c
function function_35ac33e1(attacker, victim, var_c5948a69 = {}) {
    if (isdefined(attacker)) {
        var_ced14f4b = level.merits.kill;
        if (util::get_game_type() == "warzone_pandemic_quad") {
            var_ea0ef21e = isdefined(attacker) ? attacker clientfield::get_to_player("infected") : 0;
            var_507f7385 = isdefined(victim) ? victim clientfield::get_to_player("infected") : 0;
            if (isdefined(var_ea0ef21e) && var_ea0ef21e) {
                var_ced14f4b = level.merits.killinfected;
            } else if (isdefined(var_507f7385) && var_507f7385) {
                var_ced14f4b = level.merits.var_cbafe055;
            } else {
                var_ced14f4b = level.merits.var_56dcbb49;
            }
        }
        attacker give_xp("kill", #"killxp", var_ced14f4b);
        attacker stats::function_b7f80d87(#"kills", 1);
        if (isdefined(attacker.pers[#"timesrevived"]) && attacker.pers[#"timesrevived"] > 0) {
            attacker stats::function_d40764f3(#"hash_602e8101bd834f5d", 1);
        }
        var_2fba6abe = attacker.var_37ef8626;
        currenttime = gettime();
        if (isdefined(var_2fba6abe) && currenttime - var_2fba6abe <= 60000) {
            attacker stats::function_d40764f3(#"kills_early", 1);
            attacker callback::callback(#"hash_22c795c5dddbfc97");
        }
        if (var_c5948a69.sweapon === getweapon(#"bare_hands")) {
            attacker stats::function_d40764f3(#"kills_unarmed", 1);
        }
        if (isdefined(var_c5948a69.var_6314a3a3) && var_c5948a69.var_6314a3a3) {
            attacker stats::function_d40764f3(#"kills_while_stunned", 1);
        }
        if (attacker isplayerunderwater()) {
            attacker stats::function_d40764f3(#"kills_underwater", 1);
        }
        if (isdefined(victim)) {
            if (isdefined(victim.playerskilled)) {
                if (isdefined(victim.playerskilled[attacker.team]) && victim.playerskilled[attacker.team].size > 0) {
                    attacker.avenger = 1;
                }
            }
            if (isdefined(victim.team)) {
                maxteamplayers = isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1;
                if (!isdefined(attacker.playerskilled)) {
                    attacker.playerskilled = [];
                }
                if (!isdefined(attacker.playerskilled[victim.team])) {
                    attacker.playerskilled[victim.team] = [];
                } else if (!isarray(attacker.playerskilled[victim.team])) {
                    attacker.playerskilled[victim.team] = array(attacker.playerskilled[victim.team]);
                }
                if (!isinarray(attacker.playerskilled[victim.team], victim)) {
                    attacker.playerskilled[victim.team][attacker.playerskilled[victim.team].size] = victim;
                }
                if (isdefined(attacker.playerskilled[victim.team])) {
                    switch (attacker.playerskilled[victim.team].size) {
                    case 2:
                        attacker stats::function_d40764f3(#"hash_46971a941d93cbb4", 1);
                        if (maxteamplayers == 2) {
                            scoreevents::processscoreevent(#"hash_36b13ed6e99e6f06", attacker, undefined, var_c5948a69.sweapon);
                        }
                        break;
                    case 3:
                        attacker stats::function_d40764f3(#"hash_1b3182f99881069d", 1);
                        break;
                    case 4:
                        attacker stats::function_d40764f3(#"hash_736fa2bcc0b0bf62", 1);
                        attacker stats::function_d40764f3(#"squads_eliminated_unassisted", 1);
                        scoreevents::processscoreevent(#"hash_6f41f79a13199c79", attacker, undefined, var_c5948a69.sweapon);
                        break;
                    default:
                        break;
                    }
                }
            }
            if (isdefined(attacker.var_22002c3b)) {
                if (isinarray(attacker.var_22002c3b, victim)) {
                    attacker stats::function_d40764f3(#"kills_revenge", 1);
                }
            }
            if (victim isplayerunderwater()) {
                attacker stats::function_d40764f3(#"kills_underwater_enemy", 1);
            }
            if (isdefined(attacker.var_9854aa3a) && isinarray(attacker.var_9854aa3a, victim)) {
                attacker stats::function_d40764f3(#"kills_after_damage", 1);
            } else {
                attacker stats::function_d40764f3(#"kills_without_damage", 1);
            }
            if (isdefined(attacker.var_91ddc6c5)) {
                if (isinarray(attacker.var_91ddc6c5, victim)) {
                    attacker stats::function_d40764f3(#"kills_after_damage_unarmed", 1);
                }
            }
            vehicle = victim.var_156bf46e;
            if (isdefined(vehicle) && isvehicle(vehicle)) {
                var_b01d9212 = isairborne(vehicle);
                var_7c6311c4 = vehicle.vehicleclass === "boat";
                var_f03db647 = !var_b01d9212 && !var_7c6311c4;
                if (var_f03db647) {
                    attacker stats::function_d40764f3(#"kills_enemy_in_vehicle_land", 1);
                }
                if (var_b01d9212) {
                    attacker stats::function_d40764f3(#"kills_enemy_in_vehicle_air", 1);
                }
                if (var_7c6311c4) {
                    attacker stats::function_d40764f3(#"kills_enemy_in_vehicle_water", 1);
                }
            }
        }
        if (isdefined(var_c5948a69.var_adb68654) && var_c5948a69.var_adb68654) {
            attacker stats::function_d40764f3(#"kills_vehicle_driver", 1);
        }
        if (isdefined(var_c5948a69.var_69427d4d) && var_c5948a69.var_69427d4d) {
            attacker stats::function_d40764f3(#"kills_vehicle_passenger", 1);
        }
        weapon = var_c5948a69.sweapon;
        if (isdefined(weapon) && weapon != level.weaponnone && isdefined(var_c5948a69.attackerorigin) && isdefined(var_c5948a69.victimorigin) && isdefined(weapon.isbulletweapon) && weapon.isbulletweapon) {
            weaponclass = util::getweaponclass(weapon);
            dist_to_target = distance(var_c5948a69.attackerorigin, var_c5948a69.victimorigin);
            if (dist_to_target >= 13779 && weaponclass == #"weapon_sniper") {
                attacker stats::function_d40764f3(#"kills_longshot_sniper", 1);
            }
            var_5afc3871 = attacker function_65776b07();
            if (isdefined(var_5afc3871) && isdefined(var_5afc3871[#"talent_deadsilence"]) && weaponhasattachment(weapon, "suppressed")) {
                attacker stats::function_dad108fa(#"hash_41f134c3e727d877", 1);
                attacker callback::callback(#"hash_453c77a41df1963c");
            }
            height = var_c5948a69.attackerorigin[2] - var_c5948a69.victimorigin[2];
            if (height >= 240) {
                attacker stats::function_dad108fa(#"hash_35020c395a89befb", 1);
                attacker callback::callback(#"hash_7a9bdd3ee0ae95af");
            }
            if (!isdefined(attacker.pers[#"longestdistancekill"]) || dist_to_target > attacker.pers[#"longestdistancekill"]) {
                attacker.pers[#"longestdistancekill"] = dist_to_target;
                longestkill = dist_to_target * 0.0254;
                attacker.longestkill = int(floor(longestkill + 0.5));
                attacker stats::function_62b271d8(#"longest_distance_kill", int(dist_to_target));
                attacker stats::function_7a850245(#"longestdistancekill", int(attacker.pers[#"longestdistancekill"]));
            }
            var_c2d07ee0 = attacker stats::function_ed81f25e(#"longest_distance_kill");
            if (isdefined(var_c2d07ee0)) {
                if (dist_to_target > var_c2d07ee0) {
                    attacker stats::function_baa25a23(#"longest_distance_kill", int(dist_to_target));
                }
            }
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0x83692cb9, Offset: 0x4660
// Size: 0x9a
function function_c7aa9338(array) {
    foreach (ent in array) {
        if (util::function_fbce7263(ent.team, self.team)) {
            return 1;
        }
    }
    return 0;
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0x56bbea42, Offset: 0x4708
// Size: 0x1b4
function function_8920ad6e(params) {
    if (!gamestate::is_state("playing")) {
        return;
    }
    if (isplayer(params.eattacker)) {
        params.eattacker stats::function_d40764f3(#"vehicles_destroyed", 1);
    }
    if (isdefined(params.occupants)) {
        if (params.occupants.size > 0 && self function_c7aa9338(params.occupants)) {
            if (isplayer(params.eattacker)) {
                vehicle = params.eattacker getvehicleoccupied();
                if (isdefined(vehicle) && isvehicle(vehicle)) {
                    seat = vehicle getoccupantseat(params.eattacker);
                    if (isdefined(seat)) {
                        if (seat === 0) {
                            params.eattacker stats::function_d40764f3(#"vehicles_destroyed_occupied_using_vehicle", 1);
                        }
                    }
                }
                params.eattacker stats::function_d40764f3(#"vehicles_destroyed_occupied", 1);
            }
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0xf11fbdf1, Offset: 0x48c8
// Size: 0x1c4
function function_106be0dc(params) {
    if (!gamestate::is_state("playing") || !isdefined(params.item)) {
        return;
    }
    item = params.item;
    if (isplayer(self)) {
        self.pers[#"participation"]++;
        if (!isdefined(self.items_picked_up)) {
            self.items_picked_up = [];
        }
        if (!isdefined(self.items_picked_up[item.id])) {
            self.items_picked_up[item.id] = 1;
            self stats::function_d40764f3(#"items_picked_up", 1);
            self wz_contracts::function_cdc4c709();
            if (isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"armor") {
                self stats::function_d40764f3(#"items_armor_used", 1);
            }
            if (isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"backpack") {
                self stats::function_d40764f3(#"items_backpacks_used", 1);
            }
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0xeb56f48d, Offset: 0x4a98
// Size: 0x11c
function function_393ec79e(params) {
    if (!gamestate::is_state("playing") || !isdefined(params.item)) {
        return;
    }
    item = params.item;
    if (isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"health") {
        self stats::function_d40764f3(#"items_health_used", 1);
        if (isdefined(self.outsidedeathcircle) && self.outsidedeathcircle) {
            self stats::function_d40764f3(#"hash_154d42f200303577", 1);
            self match_record::function_34800eec(#"hash_154d42f200303577", 1);
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0xcfec798f, Offset: 0x4bc0
// Size: 0xbc
function function_6c478b00(params) {
    if (!gamestate::is_state("playing") || !isdefined(params.activator)) {
        return;
    }
    activator = params.activator;
    if (isplayer(activator)) {
        if (self === getdynent(#"dock_yard_stash_2")) {
            activator stats::function_d40764f3(#"cargo_supply_opened", 1);
        }
    }
}

// Namespace wz_progression/grenade_fire
// Params 1, eflags: 0x44
// Checksum 0x44bd2c0, Offset: 0x4c88
// Size: 0xe4
function event<grenade_fire> private function_4776caf4(eventstruct) {
    if (level.inprematchperiod) {
        return;
    }
    if (sessionmodeiswarzonegame() && isplayer(self) && isalive(self) && isdefined(eventstruct) && isdefined(eventstruct.weapon)) {
        if (eventstruct.weapon.name === #"basketball") {
            if (isdefined(eventstruct.projectile)) {
                ball = eventstruct.projectile;
                ball thread function_16de96c7(self);
            }
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0xfd7e0a8d, Offset: 0x4d78
// Size: 0x270
function function_16de96c7(player) {
    if (!isdefined(player) || !isdefined(self)) {
        return;
    }
    level endon(#"game_ended");
    self endon(#"stationary", #"death");
    player endon(#"disconnect", #"death");
    var_299b8419 = getentarray("basketball_hoop", "targetname");
    if (!isdefined(var_299b8419)) {
        return;
    }
    var_69a93dcf = 0;
    ball_velocity = self getvelocity();
    if (!isdefined(ball_velocity)) {
        return;
    }
    var_ace707d = 0;
    while (!var_69a93dcf && !var_ace707d) {
        ball_velocity = self getvelocity();
        if (ball_velocity[2] < 0) {
            var_b4331e2d = 0;
            foreach (basket in var_299b8419) {
                if (self.origin[2] < basket.origin[2]) {
                    var_b4331e2d++;
                }
                if (self istouching(basket)) {
                    var_69a93dcf = 1;
                    break;
                }
            }
            if (var_b4331e2d === var_299b8419.size) {
                var_ace707d = 1;
                break;
            }
            if (var_69a93dcf) {
                break;
            }
        }
        waitframe(1);
    }
    if (var_69a93dcf) {
        if (isplayer(player)) {
            player stats::function_d40764f3(#"baskets_made", 1);
        }
        goto LOC_0000026e;
    }
LOC_0000026e:
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0x93268a2, Offset: 0x4ff0
// Size: 0x32e
function on_game_playing(params) {
    level.var_98df02a8 = gettime();
    foreach (team, _ in level.teams) {
        players = getplayers(team);
        foreach (player in players) {
            if (isbot(player)) {
                continue;
            }
            player function_cfc02934();
            player stats::set_stat(#"afteractionreportstats", #"teammatecount", players.size);
            for (i = 0; i < players.size; i++) {
                teammate = players[i];
                player stats::set_stat(#"afteractionreportstats", #"teammates", i, #"name", teammate.name);
                player stats::set_stat(#"afteractionreportstats", #"teammates", i, #"xuid", teammate getxuid(1));
                if (isdefined(teammate.pers) && isdefined(teammate.pers[#"rank"])) {
                    player stats::set_stat(#"afteractionreportstats", #"teammates", i, #"rank", teammate.pers[#"rank"]);
                    player stats::set_stat(#"afteractionreportstats", #"teammates", i, #"plevel", teammate.pers[#"plevel"]);
                }
            }
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x1 linked
// Checksum 0x7c339b0f, Offset: 0x5328
// Size: 0x90
function function_14dae612() {
    players = getplayers();
    foreach (player in players) {
        player function_2c8aac6();
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0xdd36cf59, Offset: 0x53c0
// Size: 0x1dc
function on_challenge_complete(params) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    if (!isplayer(player) || !isdefined(player.pers)) {
        return;
    }
    if (isdefined(params) && isdefined(params.reward)) {
        player.pers[#"meritprogression"] = player.pers[#"meritprogression"] + params.reward;
    }
    player.pers[#"hash_6344af0b142ed0b6"] = 1;
    if (!isdefined(player.pers[#"participation"])) {
        player.pers[#"participation"] = 0;
    }
    player.pers[#"participation"]++;
    if (isdefined(params) && isdefined(params.reward)) {
        xpscale = player getxpscale();
        player stats::function_dad108fa(#"challengexp", int(params.reward * xpscale));
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0xebe27bda, Offset: 0x55a8
// Size: 0x7a4
function on_character_unlock(params) {
    if (isplayer(self)) {
        waitframe(1);
        player = self;
        var_bff5f1d6 = player stats::get_stat(#"characters", #"hash_44599132bf7320e8", #"unlocked");
        var_b88d2887 = player stats::get_stat(#"characters", #"hash_72350169be9133ae", #"unlocked");
        var_4a9b8b0b = player stats::get_stat(#"characters", #"hash_3f01badbd66b2962", #"unlocked");
        var_7052e449 = player stats::get_stat(#"characters", #"hash_77118b5dbb73e0b6", #"unlocked");
        if (var_bff5f1d6 && var_b88d2887 && var_4a9b8b0b && var_7052e449) {
            player giveachievement("wz_blackout_historian");
        }
        var_871f238c = player stats::get_stat(#"characters", #"hash_7f410b145dce17bd", #"unlocked");
        var_aa7878e8 = player stats::get_stat(#"characters", #"hash_63b894fa4d634238", #"unlocked");
        var_4e36df97 = player stats::get_stat(#"characters", #"hash_8596bc069593313", #"unlocked");
        var_a71f1b0f = player stats::get_stat(#"characters", #"hash_17c02481305f0e24", #"unlocked");
        var_199c1316 = player stats::get_stat(#"characters", #"hash_4b77f84c47802222", #"unlocked");
        var_6851d31e = player stats::get_stat(#"characters", #"hash_62361c68e083d401", #"unlocked");
        var_f67cceb4 = player stats::get_stat(#"characters", #"hash_69bbe1ec48f79df5", #"unlocked");
        var_7fec1dca = player stats::get_stat(#"characters", #"hash_7a9842f6bec0e568", #"unlocked");
        var_ccc5605d = player stats::get_stat(#"characters", #"hash_6999516e5e35a515", #"unlocked");
        var_620230a2 = player stats::get_stat(#"characters", #"hash_78c357c8a5680d67", #"unlocked");
        if (var_871f238c && var_aa7878e8 && var_4e36df97 && var_a71f1b0f && var_199c1316 && var_6851d31e && var_f67cceb4 && var_7fec1dca && var_ccc5605d && var_620230a2) {
            player giveachievement("wz_specialist_super_fan");
        }
        var_bae2998 = player stats::get_stat(#"characters", #"hash_4815f130a1c1d840", #"unlocked");
        var_db2f35af = player stats::get_stat(#"characters", #"hash_6f105a897d64112", #"unlocked");
        var_c7bf8a47 = player stats::get_stat(#"characters", #"hash_7fc15da2c5864d3c", #"unlocked");
        var_c0c6b37a = player stats::get_stat(#"characters", #"hash_4f0c567012b33fd9", #"unlocked");
        var_7434f372 = player stats::get_stat(#"characters", #"hash_23d5f8566508f9f5", #"unlocked");
        var_98f0457e = player stats::get_stat(#"characters", #"hash_36157750ed7c6584", #"unlocked");
        var_a5b8977e = player stats::get_stat(#"characters", #"hash_1d718be46a94371f", #"unlocked");
        var_35efd1cf = player stats::get_stat(#"characters", #"hash_66b69b90a30bcc88", #"unlocked");
        if (var_bae2998 && var_db2f35af && var_c7bf8a47 && var_c0c6b37a && var_7434f372 && var_98f0457e && var_a5b8977e && var_35efd1cf) {
            player giveachievement("wz_zombie_fanatic");
        }
    }
}

// Namespace wz_progression/wz_progression
// Params 1, eflags: 0x1 linked
// Checksum 0x97b5ff8b, Offset: 0x5d58
// Size: 0x134
function on_item_pickup(params) {
    if (!gamestate::is_state("playing") || !isdefined(params.item)) {
        return;
    }
    item = params.item;
    count = params.count;
    if (isplayer(self)) {
        if (isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"resource" && item_world_util::function_41f06d9d(item.var_a6762160) && count > 0) {
            self stats::function_dad108fa(#"items_paint_cans_collected", count);
            self stats::function_b7f80d87("paint_cans_collected", count);
        }
    }
}

// Namespace wz_progression/event_cf200f34
// Params 1, eflags: 0x44
// Checksum 0xbc6378d5, Offset: 0x5e98
// Size: 0x204
function event<event_cf200f34> private function_209450ae(eventstruct) {
    if (level.inprematchperiod) {
        return;
    }
    dynent = eventstruct.ent;
    if (dynent.targetname !== #"firing_range_target_challenge") {
        return;
    }
    attacker = eventstruct.attacker;
    weapon = eventstruct.weapon;
    position = eventstruct.position;
    direction = eventstruct.dir;
    if (!isplayer(attacker) || !isdefined(weapon) || !isdefined(position) || !isdefined(direction)) {
        return;
    }
    dist = distance(attacker.origin, dynent.origin);
    if (dist < 3550) {
        return;
    }
    targetangles = dynent.angles + vectorscale((0, 1, 0), 90);
    var_2bbc9717 = anglestoforward(targetangles);
    if (vectordot(var_2bbc9717, direction) >= 0) {
        return;
    }
    var_f748425e = dynent.origin + vectorscale((0, 0, 1), 45);
    if (distance2dsquared(var_f748425e, position) > 5 * 5) {
        return;
    }
    attacker stats::function_d40764f3(#"longest_firing_range_bullseye", 1);
}

// Namespace wz_progression/wz_progression
// Params 0, eflags: 0x0
// Checksum 0xebc4ac4b, Offset: 0x60a8
// Size: 0x5e
function function_f6dc1aa9() {
    /#
        while (1) {
            var_f748425e = self.origin + vectorscale((0, 0, 1), 45);
            sphere(var_f748425e, 5, (1, 1, 0));
            waitframe(1);
        }
    #/
}

