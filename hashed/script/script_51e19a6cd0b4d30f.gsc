#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_1e38a8f6;

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 0, eflags: 0x1 linked
// Checksum 0x8f25d1af, Offset: 0xc8
// Size: 0xf4
function init() {
    registerclientfield("toplayer", "RGB_keyboard_manager", 1, 3, "int");
    if (function_8b1a219a() && getdvarint(#"hash_cca6902a7ce5273", 0) == 1) {
        callback::on_game_playing(&function_ca0a1ea4);
    }
    if (function_8b1a219a() && sessionmodeiszombiesgame() && util::get_game_type() == "ztutorial") {
        thread function_8431fef6();
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 0, eflags: 0x1 linked
// Checksum 0x7878d5a6, Offset: 0x1c8
// Size: 0x54
function function_ca0a1ea4() {
    if (level.console) {
        return;
    }
    level waittill(#"player_spawned");
    if (sessionmodeismultiplayergame()) {
        thread function_9e94a567();
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 0, eflags: 0x1 linked
// Checksum 0x5d2aec36, Offset: 0x228
// Size: 0x204
function function_9e94a567() {
    while (!(isdefined(level.gameended) && level.gameended)) {
        wait(0.5);
        score = 0;
        winning_teams = [];
        if (!isdefined(level.teams)) {
            continue;
        }
        foreach (team, _ in level.teams) {
            team_score = game.stat[#"teamscores"][team];
            if (team_score > score) {
                score = team_score;
                winning_teams = [];
            }
            if (team_score == score) {
                winning_teams[winning_teams.size] = team;
            }
        }
        if (winning_teams.size != 1) {
            event = 1;
        } else if (winning_teams[0] == "allies") {
            event = 2;
        } else if (winning_teams[0] == "axis") {
            event = 3;
        }
        foreach (player in level.players) {
            player clientfield::set_to_player("RGB_keyboard_manager", event);
        }
    }
}

// Namespace namespace_1e38a8f6/namespace_78f31cd9
// Params 0, eflags: 0x1 linked
// Checksum 0xeeb439d3, Offset: 0x438
// Size: 0x7c
function function_8431fef6() {
    level endon(#"game_ended");
    level waittill(#"hash_7d7ad8f95ddcdcbd");
    player = getplayers()[0];
    player clientfield::set_to_player("RGB_keyboard_manager", 4);
}

