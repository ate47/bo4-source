#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\killstreaks\mp\supplydrop.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\dev_spawn.gsc;
#using scripts\mp_common\gametypes\dev_class.gsc;
#using scripts\mp_common\devgui.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace dev;

/#

    // Namespace dev/dev
    // Params 0, eflags: 0x2
    // Checksum 0xfc91a826, Offset: 0x130
    // Size: 0x4c
    function autoexec __init__system__() {
        system::register(#"dev", &__init__, undefined, #"spawning_shared");
    }

#/

// Namespace dev/dev
// Params 0, eflags: 0x0
// Checksum 0x1fc3f2ae, Offset: 0x188
// Size: 0x5e
function __init__() {
    callback::on_start_gametype(&init);
    callback::on_connect(&on_player_connected);
    /#
        level.devongetormakebot = &getormakebot;
    #/
}

// Namespace dev/dev
// Params 0, eflags: 0x0
// Checksum 0x2712da1e, Offset: 0x1f0
// Size: 0x3c0
function init() {
    /#
        if (getdvarstring(#"scr_show_hq_spawns") == "<dev string:x38>") {
            setdvar(#"scr_show_hq_spawns", "<dev string:x38>");
        }
        if (!isdefined(getdvar(#"scr_testscriptruntimeerror"))) {
            setdvar(#"scr_testscriptruntimeerror", "<dev string:x3b>");
        }
        if (getdvarstring(#"hash_42bc2c660a3d2ecd") == "<dev string:x38>") {
            setdvar(#"hash_42bc2c660a3d2ecd", "<dev string:x42>");
        }
        thread testscriptruntimeerror();
        thread testdvars();
        thread addenemyheli();
        thread addtestcarepackage();
        thread devhelipathdebugdraw();
        thread devstraferunpathdebugdraw();
        thread dev_class::dev_cac_init();
        thread dev_spawn::function_d8049496();
        thread globallogic_score::setplayermomentumdebug();
        setdvar(#"scr_giveperk", "<dev string:x38>");
        setdvar(#"scr_forceevent", "<dev string:x38>");
        setdvar(#"scr_draw_triggers", 0);
        setdvar(#"scr_givegesture", "<dev string:x38>");
        thread engagement_distance_debug_toggle();
        thread equipment_dev_gui();
        thread grenade_dev_gui();
        setdvar(#"debug_dynamic_ai_spawning", 0);
        level.dem_spawns = [];
        if (level.gametype == "<dev string:x46>") {
            extra_spawns = [];
            extra_spawns[0] = "<dev string:x4c>";
            extra_spawns[1] = "<dev string:x66>";
            extra_spawns[2] = "<dev string:x80>";
            extra_spawns[3] = "<dev string:x9a>";
            for (i = 0; i < extra_spawns.size; i++) {
                points = getentarray(extra_spawns[i], "<dev string:xb4>");
                if (isdefined(points) && points.size > 0) {
                    level.dem_spawns = arraycombine(level.dem_spawns, points, 1, 0);
                }
            }
        }
        for (;;) {
            updatedevsettings();
            wait(0.5);
        }
    #/
}

// Namespace dev/dev
// Params 0, eflags: 0x0
// Checksum 0x86af49b6, Offset: 0x5b8
// Size: 0x44
function on_player_connected() {
    /#
        if (isdefined(level.devgui_unlimited_ammo) && level.devgui_unlimited_ammo) {
            wait(1);
            self thread devgui_unlimited_ammo();
        }
    #/
}

/#

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xb47b5e1e, Offset: 0x608
    // Size: 0x3e6
    function updatehardpoints() {
        keys = getarraykeys(level.killstreaks);
        for (i = 0; i < keys.size; i++) {
            dvar = level.killstreaks[keys[i]].devdvar;
            enemydvar = level.killstreaks[keys[i]].devenemydvar;
            host = util::gethostplayer();
            if (isdefined(dvar) && getdvarint(dvar, 0) == 1) {
                foreach (player in level.players) {
                    if (isdefined(level.usingmomentum) && level.usingmomentum && isdefined(level.usingscorestreaks) && level.usingscorestreaks) {
                        player killstreaks::give(keys[i]);
                        continue;
                    }
                    if (isbot(player)) {
                        player.bot[#"killstreaks"] = [];
                        player.bot[#"killstreaks"][0] = killstreaks::get_menu_name(keys[i]);
                        killstreakweapon = killstreaks::get_killstreak_weapon(keys[i]);
                        player killstreaks::give_weapon(killstreakweapon, 1);
                        globallogic_score::_setplayermomentum(player, 2000);
                        continue;
                    }
                    player killstreaks::give(keys[i]);
                }
                setdvar(dvar, 0);
            }
            if (isdefined(enemydvar) && getdvarint(enemydvar, 0) == 1) {
                team = "<dev string:xc0>";
                player = util::gethostplayer();
                if (isdefined(player.team)) {
                    team = util::getotherteam(player.team);
                }
                ent = getormakebot(team);
                if (!isdefined(ent)) {
                    println("<dev string:xcd>");
                    continue;
                }
                wait(1);
                if (isbot(ent)) {
                    ent killstreaks::give(keys[i]);
                } else {
                    ent killstreaks::give(keys[i]);
                }
                setdvar(enemydvar, 0);
            }
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0xeb186fcf, Offset: 0x9f8
    // Size: 0x6c
    function warpalltohost(team) {
        host = util::gethostplayer();
        players = getplayers();
        function_30d59c86(team, host, players);
    }

    // Namespace dev/dev
    // Params 2, eflags: 0x0
    // Checksum 0x351897d5, Offset: 0xa70
    // Size: 0xb4
    function warpalltoplayer(team, player) {
        players = getplayers();
        target = undefined;
        for (i = 0; i < players.size; i++) {
            if (players[i].name == player) {
                target = players[i];
                break;
            }
        }
        function_30d59c86(team, player, players);
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xdb1372bc, Offset: 0xb30
    // Size: 0x3c
    function function_9758857b() {
        host = util::gethostplayer();
        function_e8b29265(host);
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0x4e89acd1, Offset: 0xb78
    // Size: 0x144
    function function_e8b29265(player) {
        players = [];
        foreach (team in level.teams) {
            players_on_team = getplayers(team);
            foreach (person in players_on_team) {
                if (isalive(person)) {
                    players[players.size] = person;
                    break;
                }
            }
        }
        function_30d59c86(undefined, player, players);
    }

    // Namespace dev/dev
    // Params 3, eflags: 0x0
    // Checksum 0x6caed7b4, Offset: 0xcc8
    // Size: 0x34c
    function function_30d59c86(team, target, players) {
        if (isdefined(target)) {
            origin = target.origin;
            nodes = getnodesinradius(origin, 128, 32, 128, #"path");
            angles = target getplayerangles();
            yaw = (0, angles[1], 0);
            forward = anglestoforward(yaw);
            spawn_origin = origin + forward * 128 + (0, 0, 16);
            if (!bullettracepassed(target geteye(), spawn_origin, 0, target)) {
                spawn_origin = undefined;
            }
            for (i = 0; i < players.size; i++) {
                if (players[i] == target) {
                    continue;
                }
                if (isdefined(team)) {
                    if (strstartswith(team, "<dev string:xe9>") && target.team == players[i].team) {
                        continue;
                    }
                    if (strstartswith(team, "<dev string:xf4>") && target.team != players[i].team) {
                        continue;
                    }
                }
                goal = undefined;
                if (isdefined(spawn_origin)) {
                    players[i] setorigin(spawn_origin);
                    goal = spawn_origin;
                } else if (nodes.size > 0) {
                    node = array::random(nodes);
                    players[i] setorigin(node.origin);
                    goal = node;
                } else {
                    players[i] setorigin(origin);
                    goal = origin;
                }
                if (isdefined(goal) && isbot(players[i])) {
                    players[i] setgoal(goal, 1);
                }
            }
        }
        setdvar(#"scr_playerwarp", "<dev string:x38>");
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xe9371c9b, Offset: 0x1020
    // Size: 0x41c
    function updatedevsettingszm() {
        if (level.players.size > 0) {
            if (getdvarint(#"r_streamdumpdistance", 0) == 3) {
                if (!isdefined(level.streamdumpteamindex)) {
                    level.streamdumpteamindex = 0;
                } else {
                    level.streamdumpteamindex++;
                }
                numpoints = 0;
                spawnpoints = [];
                location = level.scr_zm_map_start_location;
                if ((location == "<dev string:x102>" || location == "<dev string:x38>") && isdefined(level.default_start_location)) {
                    location = level.default_start_location;
                }
                match_string = level.scr_zm_ui_gametype + "<dev string:x10c>" + location;
                if (level.streamdumpteamindex < level.teams.size) {
                    structs = struct::get_array("<dev string:x110>", "<dev string:x120>");
                    if (isdefined(structs)) {
                        foreach (struct in structs) {
                            if (isdefined(struct.script_string)) {
                                tokens = strtok(struct.script_string, "<dev string:x134>");
                                foreach (token in tokens) {
                                    if (token == match_string) {
                                        spawnpoints[spawnpoints.size] = struct;
                                    }
                                }
                            }
                        }
                    }
                    if (!isdefined(spawnpoints) || spawnpoints.size == 0) {
                        spawnpoints = struct::get_array("<dev string:x138>", "<dev string:x14f>");
                    }
                    if (isdefined(spawnpoints)) {
                        numpoints = spawnpoints.size;
                    }
                }
                if (numpoints == 0) {
                    setdvar(#"r_streamdumpdistance", 0);
                    level.streamdumpteamindex = -1;
                    return;
                }
                averageorigin = (0, 0, 0);
                averageangles = (0, 0, 0);
                foreach (spawnpoint in spawnpoints) {
                    averageorigin += spawnpoint.origin / numpoints;
                    averageangles += spawnpoint.angles / numpoints;
                }
                level.players[0] setplayerangles(averageangles);
                level.players[0] setorigin(averageorigin);
                wait(5);
                setdvar(#"r_streamdumpdistance", 2);
            }
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x59f25f8a, Offset: 0x1448
    // Size: 0x2684
    function updatedevsettings() {
        player = util::gethostplayer();
        dev_spawn::function_c28b3d26();
        updateminimapsetting();
        if (level.players.size > 0) {
            updatehardpoints();
            playerwarp_string = getdvarstring(#"scr_playerwarp");
            if (playerwarp_string == "<dev string:x15c>") {
                warpalltohost();
            } else if (playerwarp_string == "<dev string:x163>") {
                warpalltohost(playerwarp_string);
            } else if (playerwarp_string == "<dev string:x172>") {
                warpalltohost(playerwarp_string);
            } else if (playerwarp_string == "<dev string:x184>") {
                function_9758857b();
            } else if (strstartswith(playerwarp_string, "<dev string:xe9>")) {
                name = getsubstr(playerwarp_string, 8);
                warpalltoplayer(playerwarp_string, name);
            } else if (strstartswith(playerwarp_string, "<dev string:xf4>")) {
                name = getsubstr(playerwarp_string, 11);
                warpalltoplayer(playerwarp_string, name);
            } else if (strstartswith(playerwarp_string, "<dev string:x19e>")) {
                name = getsubstr(playerwarp_string, 4);
                warpalltoplayer(undefined, name);
            } else if (playerwarp_string == "<dev string:x1a5>") {
                players = getplayers();
                setdvar(#"scr_playerwarp", "<dev string:x38>");
                if (!isdefined(level.devgui_start_spawn_index)) {
                    level.devgui_start_spawn_index = 0;
                }
                player = util::gethostplayer();
                spawns = level.spawn_start[player.pers[#"team"]];
                if (!isdefined(spawns) || spawns.size <= 0) {
                    return;
                }
                for (i = 0; i < players.size; i++) {
                    players[i] setorigin(spawns[level.devgui_start_spawn_index].origin);
                    players[i] setplayerangles(spawns[level.devgui_start_spawn_index].angles);
                }
                level.devgui_start_spawn_index++;
                if (level.devgui_start_spawn_index >= spawns.size) {
                    level.devgui_start_spawn_index = 0;
                }
            } else if (playerwarp_string == "<dev string:x1b8>") {
                players = getplayers();
                setdvar(#"scr_playerwarp", "<dev string:x38>");
                if (!isdefined(level.devgui_start_spawn_index)) {
                    level.devgui_start_spawn_index = 0;
                }
                player = util::gethostplayer();
                spawns = level.spawn_start[player.pers[#"team"]];
                if (!isdefined(spawns) || spawns.size <= 0) {
                    return;
                }
                for (i = 0; i < players.size; i++) {
                    players[i] setorigin(spawns[level.devgui_start_spawn_index].origin);
                    players[i] setplayerangles(spawns[level.devgui_start_spawn_index].angles);
                }
                level.devgui_start_spawn_index--;
                if (level.devgui_start_spawn_index < 0) {
                    level.devgui_start_spawn_index = spawns.size - 1;
                }
            } else if (playerwarp_string == "<dev string:x1cb>") {
                players = getplayers();
                setdvar(#"scr_playerwarp", "<dev string:x38>");
                if (!isdefined(level.devgui_spawn_index)) {
                    level.devgui_spawn_index = 0;
                }
                spawns = isdefined(level.var_3da2623a) ? level.var_3da2623a : level.spawnpoints;
                spawns = arraycombine(spawns, level.dem_spawns, 1, 0);
                if (!isdefined(spawns) || spawns.size <= 0) {
                    return;
                }
                for (i = 0; i < players.size; i++) {
                    players[i] setorigin(spawns[level.devgui_spawn_index].origin);
                    players[i] setplayerangles(spawns[level.devgui_spawn_index].angles);
                }
                level.devgui_spawn_index++;
                if (level.devgui_spawn_index >= spawns.size) {
                    level.devgui_spawn_index = 0;
                }
            } else if (playerwarp_string == "<dev string:x1d8>") {
                players = getplayers();
                setdvar(#"scr_playerwarp", "<dev string:x38>");
                if (!isdefined(level.devgui_spawn_index)) {
                    level.devgui_spawn_index = 0;
                }
                spawns = isdefined(level.var_3da2623a) ? level.var_3da2623a : level.spawnpoints;
                spawns = arraycombine(spawns, level.dem_spawns, 1, 0);
                if (!isdefined(spawns) || spawns.size <= 0) {
                    return;
                }
                for (i = 0; i < players.size; i++) {
                    players[i] setorigin(spawns[level.devgui_spawn_index].origin);
                    players[i] setplayerangles(spawns[level.devgui_spawn_index].angles);
                }
                level.devgui_spawn_index--;
                if (level.devgui_spawn_index < 0) {
                    level.devgui_spawn_index = spawns.size - 1;
                }
            } else if (getdvarstring(#"scr_devgui_spawn") != "<dev string:x38>") {
                player = util::gethostplayer();
                if (!isdefined(player.devgui_spawn_active)) {
                    player.devgui_spawn_active = 0;
                }
                if (!player.devgui_spawn_active) {
                    iprintln("<dev string:x1e5>");
                    iprintln("<dev string:x20a>");
                    player.devgui_spawn_active = 1;
                    player thread devgui_spawn_think();
                } else {
                    player notify(#"devgui_spawn_think");
                    player.devgui_spawn_active = 0;
                    player setactionslot(3, "<dev string:x22c>");
                }
                setdvar(#"scr_devgui_spawn", "<dev string:x38>");
            } else if (getdvarstring(#"hash_c9f8ff06a656024") != "<dev string:x38>") {
                player = util::gethostplayer();
                if (!isdefined(player.var_31922da4)) {
                    player.var_31922da4 = 0;
                }
                if (!player.var_31922da4) {
                    iprintln("<dev string:x1e5>");
                    iprintln("<dev string:x20a>");
                    player.var_31922da4 = 1;
                    player thread function_48a6b85();
                } else {
                    player notify(#"hash_47f3d9a9e91670d1");
                    player.var_31922da4 = 0;
                    player setactionslot(3, "<dev string:x22c>");
                }
                setdvar(#"hash_c9f8ff06a656024", "<dev string:x38>");
            } else if (getdvarstring(#"scr_player_ammo") != "<dev string:x38>") {
                players = getplayers();
                if (!isdefined(level.devgui_unlimited_ammo)) {
                    level.devgui_unlimited_ammo = 1;
                } else {
                    level.devgui_unlimited_ammo = !level.devgui_unlimited_ammo;
                }
                if (level.devgui_unlimited_ammo) {
                    iprintln("<dev string:x236>");
                } else {
                    iprintln("<dev string:x25d>");
                }
                for (i = 0; i < players.size; i++) {
                    if (level.devgui_unlimited_ammo) {
                        players[i] thread devgui_unlimited_ammo();
                        continue;
                    }
                    players[i] notify(#"devgui_unlimited_ammo");
                }
                setdvar(#"scr_player_ammo", "<dev string:x38>");
            } else if (getdvarstring(#"scr_player_momentum") != "<dev string:x38>") {
                if (!isdefined(level.devgui_unlimited_momentum)) {
                    level.devgui_unlimited_momentum = 1;
                } else {
                    level.devgui_unlimited_momentum = !level.devgui_unlimited_momentum;
                }
                if (level.devgui_unlimited_momentum) {
                    iprintln("<dev string:x287>");
                    level thread devgui_unlimited_momentum();
                } else {
                    iprintln("<dev string:x2b2>");
                    level notify(#"devgui_unlimited_momentum");
                }
                setdvar(#"scr_player_momentum", "<dev string:x38>");
            } else if (getdvarstring(#"scr_give_player_score") != "<dev string:x38>") {
                level thread devgui_increase_momentum(getdvarint(#"scr_give_player_score", 0));
                setdvar(#"scr_give_player_score", "<dev string:x38>");
            } else if (getdvarstring(#"hash_7d7add0fb8d419c8") != "<dev string:x38>") {
                level thread function_e88bdbcf();
                setdvar(#"hash_7d7add0fb8d419c8", "<dev string:x38>");
            } else if (getdvarstring(#"scr_player_zero_ammo") != "<dev string:x38>") {
                players = getplayers();
                for (i = 0; i < players.size; i++) {
                    player = players[i];
                    weapons = player getweaponslist();
                    arrayremovevalue(weapons, level.weaponbasemelee);
                    for (j = 0; j < weapons.size; j++) {
                        if (weapons[j] == level.weaponnone) {
                            continue;
                        }
                        player setweaponammostock(weapons[j], 0);
                        player setweaponammoclip(weapons[j], 0);
                    }
                }
                setdvar(#"scr_player_zero_ammo", "<dev string:x38>");
            } else if (getdvarstring(#"scr_emp_jammed") != "<dev string:x38>") {
                players = getplayers();
                for (i = 0; i < players.size; i++) {
                    player = players[i];
                    player setempjammed(getdvarint(#"scr_emp_jammed", 0));
                }
                setdvar(#"scr_emp_jammed", "<dev string:x38>");
            } else if (getdvarstring(#"scr_round_pause") != "<dev string:x38>") {
                if (!level.timerstopped) {
                    iprintln("<dev string:x2e0>");
                    globallogic_utils::pausetimer();
                } else {
                    iprintln("<dev string:x2f6>");
                    globallogic_utils::resumetimer();
                }
                setdvar(#"scr_round_pause", "<dev string:x38>");
            } else if (getdvarstring(#"scr_round_end") != "<dev string:x38>") {
                level globallogic::forceend();
                setdvar(#"scr_round_end", "<dev string:x38>");
            } else if (getdvarint(#"scr_health_debug", 0)) {
                players = getplayers();
                host = util::gethostplayer();
                if (!isdefined(host.devgui_health_debug)) {
                    host.devgui_health_debug = 0;
                }
                if (host.devgui_health_debug) {
                    host.devgui_health_debug = 0;
                    for (i = 0; i < players.size; i++) {
                        players[i] notify(#"devgui_health_debug");
                        if (isdefined(players[i].debug_health_bar)) {
                            players[i].debug_health_bar destroy();
                            players[i].debug_health_text destroy();
                            players[i].debug_health_bar = undefined;
                            players[i].debug_health_text = undefined;
                        }
                    }
                } else {
                    host.devgui_health_debug = 1;
                    for (i = 0; i < players.size; i++) {
                        players[i] thread devgui_health_debug();
                    }
                }
                setdvar(#"scr_health_debug", 0);
            } else if (getdvarstring(#"scr_show_hq_spawns") != "<dev string:x38>") {
                if (!isdefined(level.devgui_show_hq)) {
                    level.devgui_show_hq = 0;
                }
                if (level.gametype == "<dev string:x30d>" && isdefined(level.radios)) {
                    if (!level.devgui_show_hq) {
                        for (i = 0; i < level.radios.size; i++) {
                            color = (1, 0, 0);
                            level dev_spawn::showonespawnpoint(level.radios[i], color, "<dev string:x314>", 32, "<dev string:x325>");
                        }
                    } else {
                        level notify(#"hide_hq_points");
                    }
                    level.devgui_show_hq = !level.devgui_show_hq;
                }
                setdvar(#"scr_show_hq_spawns", "<dev string:x38>");
            }
            if (getdvarint(#"r_streamdumpdistance", 0) == 3) {
                if (!isdefined(level.streamdumpteamindex)) {
                    level.streamdumpteamindex = 0;
                } else {
                    level.streamdumpteamindex++;
                }
                numpoints = 0;
                if (level.streamdumpteamindex < level.teams.size) {
                    teamname = getarraykeys(level.teams)[level.streamdumpteamindex];
                    if (isdefined(level.spawn_start[teamname])) {
                        numpoints = level.spawn_start[teamname].size;
                    }
                }
                if (numpoints == 0) {
                    setdvar(#"r_streamdumpdistance", 0);
                    level.streamdumpteamindex = -1;
                } else {
                    averageorigin = (0, 0, 0);
                    averageangles = (0, 0, 0);
                    foreach (spawnpoint in level.spawn_start[teamname]) {
                        averageorigin += spawnpoint.origin / numpoints;
                        averageangles += spawnpoint.angles / numpoints;
                    }
                    level.players[0] setplayerangles(averageangles);
                    level.players[0] setorigin(averageorigin);
                    wait(5);
                    setdvar(#"r_streamdumpdistance", 2);
                }
            }
        }
        if (getdvarstring(#"scr_giveperk") == "<dev string:x42>") {
            players = getplayers();
            iprintln("<dev string:x330>");
            for (i = 0; i < players.size; i++) {
                players[i] clearperks();
                players[i].extraperks = undefined;
            }
            setdvar(#"scr_giveperk", "<dev string:x38>");
        }
        if (getdvarstring(#"scr_giveperk") != "<dev string:x38>") {
            perk = getdvarstring(#"scr_giveperk");
            specialties = strtok(perk, "<dev string:x354>");
            players = getplayers();
            iprintln("<dev string:x358>" + perk + "<dev string:x375>");
            for (i = 0; i < players.size; i++) {
                for (j = 0; j < specialties.size; j++) {
                    players[i] perks::perk_setperk(specialties[j]);
                    players[i].extraperks[specialties[j]] = 1;
                }
            }
            setdvar(#"scr_giveperk", "<dev string:x38>");
        }
        if (getdvarstring(#"scr_giveskill") == "<dev string:x42>") {
            players = getplayers();
            iprintln("<dev string:x379>");
            foreach (player in players) {
                if (!isdefined(player)) {
                    continue;
                }
                player function_e6f9e3cd();
                player loadout::function_3d16577a(player.team, player.curclass);
            }
            setdvar(#"scr_giveskill", "<dev string:x38>");
        }
        if (getdvarstring(#"scr_giveskill") != "<dev string:x38>") {
            talentname = getdvarstring(#"scr_giveskill");
            var_2fe3f7e3 = hash(talentname);
            players = getplayers();
            iprintln("<dev string:x39e>" + talentname + "<dev string:x375>");
            foreach (player in players) {
                if (!isdefined(player)) {
                    continue;
                }
                player function_b5feff95(var_2fe3f7e3);
                player loadout::function_3d16577a(player.team, player.curclass);
            }
            setdvar(#"scr_giveskill", "<dev string:x38>");
        }
        if (getdvarstring(#"scr_givetalent") == "<dev string:x42>") {
            players = getplayers();
            iprintln("<dev string:x3bc>");
            foreach (player in players) {
                if (!isdefined(player)) {
                    continue;
                }
                player function_e6f9e3cd();
                player loadout::function_3d16577a(player.team, player.curclass);
            }
            setdvar(#"scr_givetalent", "<dev string:x38>");
        }
        if (getdvarstring(#"scr_givetalent") != "<dev string:x38>") {
            talentname = getdvarstring(#"scr_givetalent");
            var_2fe3f7e3 = hash(talentname);
            players = getplayers();
            iprintln("<dev string:x3e1>" + talentname + "<dev string:x375>");
            foreach (player in players) {
                if (!isdefined(player)) {
                    continue;
                }
                player function_b5feff95(var_2fe3f7e3);
                player loadout::function_3d16577a(player.team, player.curclass);
            }
            setdvar(#"scr_givetalent", "<dev string:x38>");
        }
        if (getdvarstring(#"scr_forcegrenade") != "<dev string:x38>") {
            force_grenade_throw(getweapon(getdvarstring(#"scr_forcegrenade")));
            setdvar(#"scr_forcegrenade", "<dev string:x38>");
        }
        if (getdvarstring(#"scr_forceevent") != "<dev string:x38>") {
            event = getdvarstring(#"scr_forceevent");
            player = util::gethostplayer();
            forward = anglestoforward(player.angles);
            right = anglestoright(player.angles);
            if (event == "<dev string:x400>") {
                player dodamage(1, player.origin + forward);
            } else if (event == "<dev string:x40c>") {
                player dodamage(1, player.origin - forward);
            } else if (event == "<dev string:x417>") {
                player dodamage(1, player.origin - right);
            } else if (event == "<dev string:x422>") {
                player dodamage(1, player.origin + right);
            }
            setdvar(#"scr_forceevent", "<dev string:x38>");
        }
        if (getdvarstring(#"scr_takeperk") != "<dev string:x38>") {
            perk = getdvarstring(#"scr_takeperk");
            for (i = 0; i < level.players.size; i++) {
                level.players[i] perks::perk_unsetperk(perk);
                level.players[i].extraperks[perk] = undefined;
            }
            setdvar(#"scr_takeperk", "<dev string:x38>");
        }
        if (getdvarstring(#"scr_x_kills_y") != "<dev string:x38>") {
            nametokens = strtok(getdvarstring(#"scr_x_kills_y"), "<dev string:x134>");
            if (nametokens.size > 1) {
                thread xkillsy(nametokens[0], nametokens[1]);
            }
            setdvar(#"scr_x_kills_y", "<dev string:x38>");
        }
        if (getdvarstring(#"scr_usedogs") != "<dev string:x38>") {
            ownername = getdvarstring(#"scr_usedogs");
            setdvar(#"scr_usedogs", "<dev string:x38>");
            owner = undefined;
            for (index = 0; index < level.players.size; index++) {
                if (level.players[index].name == ownername) {
                    owner = level.players[index];
                }
            }
            if (isdefined(owner)) {
                owner killstreaks::trigger_killstreak("<dev string:x42e>");
            }
        }
        if (getdvarstring(#"scr_entdebug") != "<dev string:x38>") {
            ents = getentarray();
            level.entarray = [];
            level.entcounts = [];
            level.entgroups = [];
            for (index = 0; index < ents.size; index++) {
                classname = ents[index].classname;
                if (!issubstr(classname, "<dev string:x435>")) {
                    curent = ents[index];
                    level.entarray[level.entarray.size] = curent;
                    if (!isdefined(level.entcounts[classname])) {
                        level.entcounts[classname] = 0;
                    }
                    level.entcounts[classname]++;
                    if (!isdefined(level.entgroups[classname])) {
                        level.entgroups[classname] = [];
                    }
                    level.entgroups[classname][level.entgroups[classname].size] = curent;
                }
            }
        }
        if (getdvarint(#"debug_dynamic_ai_spawning", 0) && !isdefined(level.larry)) {
            thread larry_thread();
        } else if (!getdvarint(#"debug_dynamic_ai_spawning", 0)) {
            level notify(#"kill_larry");
        }
        if (getdvarint(#"scr_force_finalkillcam", 0) == 1) {
            level thread killcam::do_final_killcam();
            level thread waitthennotifyfinalkillcam();
        }
        if (getdvarint(#"scr_force_roundkillcam", 0) == 1) {
            level thread killcam::do_final_killcam();
            level thread waitthennotifyroundkillcam();
        }
        potm::debugupdate();
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xd8e8e590, Offset: 0x3ad8
    // Size: 0x44
    function waitthennotifyroundkillcam() {
        waitframe(1);
        level notify(#"play_final_killcam");
        setdvar(#"scr_force_roundkillcam", 0);
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xde174349, Offset: 0x3b28
    // Size: 0x4c
    function waitthennotifyfinalkillcam() {
        waitframe(1);
        level notify(#"play_final_killcam");
        waitframe(1);
        setdvar(#"scr_force_finalkillcam", 0);
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x7c5100a1, Offset: 0x3b80
    // Size: 0x976
    function function_48a6b85() {
        self notify("<dev string:x43e>");
        self endon("<dev string:x43e>");
        self endon(#"disconnect");
        dpad_left = 0;
        dpad_right = 0;
        dpad_up = 0;
        dpad_down = 0;
        if (!isdefined(level.var_94f4ca81)) {
            level.var_94f4ca81 = spawnstruct();
            level.var_94f4ca81.dataset = [];
            var_2e980658 = spawnstruct();
            var_2e980658.name = "<dev string:x451>";
            var_2e980658.spawns = level.spawnpoints;
            level.var_94f4ca81.dataset[0] = var_2e980658;
            var_bc7d1357 = spawnstruct();
            var_bc7d1357.name = "<dev string:x461>";
            var_bc7d1357.spawns = level.spawn_start[#"allies"];
            level.var_94f4ca81.dataset[1] = var_bc7d1357;
            var_2a1cb802 = spawnstruct();
            var_2a1cb802.name = "<dev string:x479>";
            var_2a1cb802.spawns = level.spawn_start[#"axis"];
            level.var_94f4ca81.dataset[2] = var_2a1cb802;
            var_c95c8eff = spawnstruct();
            var_c95c8eff.name = "<dev string:x48f>";
            var_c95c8eff.spawns = level.allspawnpoints;
            level.var_94f4ca81.dataset[3] = var_c95c8eff;
        }
        level.var_94f4ca81.teamfilter = "<dev string:x3b>";
        level.var_94f4ca81.currentsetindex = 0;
        level.var_94f4ca81.currentspawnindex = 0;
        var_f94a23 = 0;
        while (true) {
            self setactionslot(3, "<dev string:x38>");
            self setactionslot(4, "<dev string:x38>");
            if (!dpad_up && self buttonpressed("<dev string:x4a0>")) {
                level.var_94f4ca81.currentsetindex++;
                if (level.var_94f4ca81.currentsetindex >= level.var_94f4ca81.dataset.size) {
                    level.var_94f4ca81.currentsetindex = 0;
                }
                level.var_94f4ca81.currentspawnindex = 0;
                dpad_up = 1;
                var_f94a23 = 1;
            } else if (!self buttonpressed("<dev string:x4a0>")) {
                dpad_up = 0;
            }
            if (!dpad_down && self buttonpressed("<dev string:x4aa>")) {
                level.var_94f4ca81.currentsetindex--;
                if (level.var_94f4ca81.currentsetindex < 0) {
                    level.var_94f4ca81.currentsetindex = level.var_94f4ca81.dataset.size - 1;
                }
                level.var_94f4ca81.currentspawnindex = 0;
                var_f94a23 = 1;
                dpad_down = 1;
            } else if (!self buttonpressed("<dev string:x4aa>")) {
                dpad_down = 0;
            }
            if (!dpad_left && self buttonpressed("<dev string:x4b6>")) {
                while (true) {
                    level.var_94f4ca81.currentspawnindex--;
                    if (level.var_94f4ca81.currentspawnindex < 0) {
                        level.var_94f4ca81.currentspawnindex = level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].spawns.size - 1;
                    }
                    if (!(isdefined(level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].spawns[level.var_94f4ca81.currentspawnindex].ct) && level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].spawns[level.var_94f4ca81.currentspawnindex].ct)) {
                        break;
                    }
                }
                var_f94a23 = 1;
                dpad_left = 1;
            } else if (!self buttonpressed("<dev string:x4b6>")) {
                dpad_left = 0;
            }
            if (!dpad_right && self buttonpressed("<dev string:x4c2>")) {
                while (true) {
                    level.var_94f4ca81.currentspawnindex++;
                    if (level.var_94f4ca81.currentspawnindex >= level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].spawns.size) {
                        level.var_94f4ca81.currentspawnindex = 0;
                    }
                    if (!(isdefined(level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].spawns[level.var_94f4ca81.currentspawnindex].ct) && level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].spawns[level.var_94f4ca81.currentspawnindex].ct)) {
                        break;
                    }
                }
                var_f94a23 = 1;
                dpad_right = 1;
            } else if (!self buttonpressed("<dev string:x4c2>")) {
                dpad_right = 0;
            }
            if (var_f94a23) {
                origin = level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].spawns[level.var_94f4ca81.currentspawnindex].origin;
                angles = level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].spawns[level.var_94f4ca81.currentspawnindex].angles;
                println("<dev string:x4cf>" + level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].name);
                self setorigin(origin);
                self setplayerangles(angles);
                var_f94a23 = 0;
            }
            debug2dtext((100, 750, 0), "<dev string:x4f1>" + level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].name, (1, 0, 0));
            debug2dtext((100, 800, 0), "<dev string:x4fd>" + string(level.var_94f4ca81.currentspawnindex) + "<dev string:x507>" + string(level.var_94f4ca81.dataset[level.var_94f4ca81.currentsetindex].spawns.size), (1, 0, 0));
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xa0b29bc9, Offset: 0x4500
    // Size: 0x2e6
    function devgui_spawn_think() {
        self notify(#"devgui_spawn_think");
        self endon(#"devgui_spawn_think");
        self endon(#"disconnect");
        dpad_left = 0;
        dpad_right = 0;
        dpad_up = 0;
        dpad_down = 0;
        for (;;) {
            self setactionslot(3, "<dev string:x38>");
            self setactionslot(4, "<dev string:x38>");
            if (!dpad_left && self buttonpressed("<dev string:x4b6>")) {
                setdvar(#"scr_playerwarp", "<dev string:x1d8>");
                dpad_left = 1;
            } else if (!self buttonpressed("<dev string:x4b6>")) {
                dpad_left = 0;
            }
            if (!dpad_right && self buttonpressed("<dev string:x4c2>")) {
                setdvar(#"scr_playerwarp", "<dev string:x1cb>");
                dpad_right = 1;
            } else if (!self buttonpressed("<dev string:x4c2>")) {
                dpad_right = 0;
            }
            if (!dpad_up && self buttonpressed("<dev string:x4a0>")) {
                setdvar(#"scr_playerwarp", "<dev string:x1b8>");
                dpad_up = 1;
            } else if (!self buttonpressed("<dev string:x4a0>")) {
                dpad_up = 0;
            }
            if (!dpad_down && self buttonpressed("<dev string:x4aa>")) {
                setdvar(#"scr_playerwarp", "<dev string:x1a5>");
                dpad_down = 1;
            } else if (!self buttonpressed("<dev string:x4aa>")) {
                dpad_down = 0;
            }
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x58712dba, Offset: 0x47f0
    // Size: 0x1aa
    function devgui_unlimited_ammo() {
        self notify(#"devgui_unlimited_ammo");
        self endon(#"devgui_unlimited_ammo");
        self endon(#"disconnect");
        for (;;) {
            wait(1);
            primary_weapons = self getweaponslistprimaries();
            offhand_weapons_and_alts = array::exclude(self getweaponslist(1), primary_weapons);
            weapons = arraycombine(primary_weapons, offhand_weapons_and_alts, 0, 0);
            arrayremovevalue(weapons, level.weaponbasemelee);
            for (i = 0; i < weapons.size; i++) {
                weapon = weapons[i];
                if (weapon == level.weaponnone) {
                    continue;
                }
                if (killstreaks::is_killstreak_weapon(weapon)) {
                    continue;
                }
                if (weapon.iscliponly) {
                    continue;
                }
                if (self getfractionmaxammo(weapon) == 1) {
                    continue;
                }
                self givemaxammo(weapon);
            }
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xc5228d04, Offset: 0x49a8
    // Size: 0x11c
    function devgui_unlimited_momentum() {
        level notify(#"devgui_unlimited_momentum");
        level endon(#"devgui_unlimited_momentum");
        for (;;) {
            wait(1);
            players = getplayers();
            foreach (player in players) {
                if (!isdefined(player)) {
                    continue;
                }
                if (!isalive(player)) {
                    continue;
                }
                if (player.sessionstate != "<dev string:x512>") {
                    continue;
                }
                globallogic_score::_setplayermomentum(player, 5000);
            }
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0xccc4e4d0, Offset: 0x4ad0
    // Size: 0x108
    function devgui_increase_momentum(score) {
        players = getplayers();
        foreach (player in players) {
            if (!isdefined(player)) {
                continue;
            }
            if (!isalive(player)) {
                continue;
            }
            if (player.sessionstate != "<dev string:x512>") {
                continue;
            }
            player globallogic_score::giveplayermomentumnotification(score, #"kill", "<dev string:x51c>");
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0x22cdfe0c, Offset: 0x4be0
    // Size: 0xd8
    function function_e88bdbcf(score) {
        players = getplayers();
        foreach (player in players) {
            if (isdefined(player) && isalive(player) && player.sessionstate == "<dev string:x512>") {
                player globallogic_score::resetplayermomentum();
            }
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x165d25b2, Offset: 0x4cc0
    // Size: 0x320
    function devgui_health_debug() {
        self notify(#"devgui_health_debug");
        self endon(#"devgui_health_debug");
        self endon(#"disconnect");
        x = 80;
        y = 40;
        self.debug_health_bar = newdebughudelem(self);
        self.debug_health_bar.x = x + 80;
        self.debug_health_bar.y = y + 2;
        self.debug_health_bar.alignx = "<dev string:x52b>";
        self.debug_health_bar.aligny = "<dev string:x532>";
        self.debug_health_bar.horzalign = "<dev string:x538>";
        self.debug_health_bar.vertalign = "<dev string:x538>";
        self.debug_health_bar.alpha = 1;
        self.debug_health_bar.foreground = 1;
        self.debug_health_bar setshader(#"black", 1, 8);
        self.debug_health_text = newdebughudelem(self);
        self.debug_health_text.x = x + 80;
        self.debug_health_text.y = y;
        self.debug_health_text.alignx = "<dev string:x52b>";
        self.debug_health_text.aligny = "<dev string:x532>";
        self.debug_health_text.horzalign = "<dev string:x538>";
        self.debug_health_text.vertalign = "<dev string:x538>";
        self.debug_health_text.alpha = 1;
        self.debug_health_text.fontscale = 1;
        self.debug_health_text.foreground = 1;
        if (!isdefined(self.maxhealth) || self.maxhealth <= 0) {
            self.maxhealth = 100;
        }
        for (;;) {
            waitframe(1);
            width = self.health / self.maxhealth * 300;
            width = int(max(width, 1));
            self.debug_health_bar setshader(#"black", width, 8);
            self.debug_health_text setvalue(self.health);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x71bc8e79, Offset: 0x4fe8
    // Size: 0xbe
    function giveextraperks() {
        if (!isdefined(self.extraperks)) {
            return;
        }
        perks = getarraykeys(self.extraperks);
        for (i = 0; i < perks.size; i++) {
            println("<dev string:x545>" + self.name + "<dev string:x552>" + perks[i] + "<dev string:x55f>");
            self perks::perk_setperk(perks[i]);
        }
    }

    // Namespace dev/dev
    // Params 2, eflags: 0x0
    // Checksum 0xbe4a02d0, Offset: 0x50b0
    // Size: 0x14c
    function xkillsy(attackername, victimname) {
        attacker = undefined;
        victim = undefined;
        for (index = 0; index < level.players.size; index++) {
            if (level.players[index].name == attackername) {
                attacker = level.players[index];
                continue;
            }
            if (level.players[index].name == victimname) {
                victim = level.players[index];
            }
        }
        if (!isalive(attacker) || !isalive(victim)) {
            return;
        }
        victim thread [[ level.callbackplayerdamage ]](attacker, attacker, 1000, 0, "<dev string:x56f>", level.weaponnone, (0, 0, 0), (0, 0, 0), "<dev string:x3b>", (0, 0, 0), 0, 0, (1, 0, 0));
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xac8bfb5, Offset: 0x5208
    // Size: 0x24
    function testscriptruntimeerrorassert() {
        wait(1);
        assert(0);
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xffc9024f, Offset: 0x5238
    // Size: 0x2c
    function testscriptruntimeassertmsgassert() {
        wait(1);
        assertmsg("<dev string:x582>");
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x6727ef9, Offset: 0x5270
    // Size: 0x2c
    function testscriptruntimeerrormsgassert() {
        wait(1);
        errormsg("<dev string:x59b>");
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x719190c6, Offset: 0x52a8
    // Size: 0x44
    function testscriptruntimeerror2() {
        myundefined = "<dev string:x5b3>";
        if (myundefined == 1) {
            println("<dev string:x5ba>");
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xd5b8b887, Offset: 0x52f8
    // Size: 0x1c
    function testscriptruntimeerror1() {
        testscriptruntimeerror2();
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x4f5bd2d9, Offset: 0x5320
    // Size: 0x12c
    function testscriptruntimeerror() {
        wait(5);
        for (;;) {
            if (getdvarstring(#"scr_testscriptruntimeerror") != "<dev string:x3b>") {
                break;
            }
            wait(1);
        }
        myerror = getdvarstring(#"scr_testscriptruntimeerror");
        setdvar(#"scr_testscriptruntimeerror", "<dev string:x3b>");
        if (myerror == "<dev string:x5e2>") {
            testscriptruntimeerrorassert();
        } else if (myerror == "<dev string:x5eb>") {
            testscriptruntimeassertmsgassert();
        } else if (myerror == "<dev string:x5f7>") {
            testscriptruntimeerrormsgassert();
        } else {
            testscriptruntimeerror1();
        }
        thread testscriptruntimeerror();
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x8c34d7c7, Offset: 0x5458
    // Size: 0x104
    function testdvars() {
        wait(5);
        for (;;) {
            if (getdvarstring(#"scr_testdvar") != "<dev string:x38>") {
                break;
            }
            wait(1);
        }
        tokens = strtok(getdvarstring(#"scr_testdvar"), "<dev string:x134>");
        dvarname = tokens[0];
        dvarvalue = tokens[1];
        setdvar(dvarname, dvarvalue);
        setdvar(#"scr_testdvar", "<dev string:x38>");
        thread testdvars();
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x2f864775, Offset: 0x5568
    // Size: 0x234
    function addenemyheli() {
        wait(5);
        for (;;) {
            if (getdvarint(#"scr_spawnenemyheli", 0) > 0) {
                break;
            }
            wait(1);
        }
        enemyheli = getdvarint(#"scr_spawnenemyheli", 0);
        setdvar(#"scr_spawnenemyheli", 0);
        team = "<dev string:xc0>";
        player = util::gethostplayer();
        if (isdefined(player.pers[#"team"])) {
            team = util::getotherteam(player.pers[#"team"]);
        }
        ent = getormakebot(team);
        if (!isdefined(ent)) {
            println("<dev string:xcd>");
            wait(1);
            thread addenemyheli();
            return;
        }
        switch (enemyheli) {
        case 1:
            level.helilocation = ent.origin;
            ent thread helicopter::usekillstreakhelicopter("<dev string:x602>");
            wait(0.5);
            ent notify(#"confirm_location", {#position:level.helilocation});
            break;
        case 2:
            break;
        }
        thread addenemyheli();
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0xbddef818, Offset: 0x57a8
    // Size: 0xd8
    function getormakebot(team) {
        for (i = 0; i < level.players.size; i++) {
            if (level.players[i].team == team) {
                if (isbot(level.players[i])) {
                    return level.players[i];
                }
            }
        }
        ent = bot::add_bot(team);
        if (isdefined(ent)) {
            sound::play_on_players("<dev string:x617>");
            wait(1);
        }
        return ent;
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x60e92e2b, Offset: 0x5888
    // Size: 0x25c
    function addtestcarepackage() {
        wait(5);
        for (;;) {
            if (getdvarint(#"scr_givetestsupplydrop", 0) > 0) {
                break;
            }
            wait(1);
        }
        supplydrop = getdvarint(#"scr_givetestsupplydrop", 0);
        team = "<dev string:xc0>";
        player = util::gethostplayer();
        if (isdefined(player.pers[#"team"])) {
            switch (supplydrop) {
            case 2:
                team = util::getotherteam(player.pers[#"team"]);
                break;
            case 1:
            default:
                team = player.pers[#"team"];
                break;
            }
        }
        setdvar(#"scr_givetestsupplydrop", 0);
        ent = getormakebot(team);
        if (!isdefined(ent)) {
            println("<dev string:xcd>");
            wait(1);
            thread addtestcarepackage();
            return;
        }
        ent killstreakrules::killstreakstart("<dev string:x62b>", team);
        ent thread supplydrop::helidelivercrate(ent.origin, getweapon(#"supplydrop"), ent, team);
        thread addtestcarepackage();
    }

    // Namespace dev/dev
    // Params 6, eflags: 0x0
    // Checksum 0xfbf71a55, Offset: 0x5af0
    // Size: 0x76
    function print3duntilnotified(origin, text, color, alpha, scale, notification) {
        level endon(notification);
        for (;;) {
            print3d(origin, text, color, alpha, scale);
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 5, eflags: 0x0
    // Checksum 0xaf544df6, Offset: 0x5b70
    // Size: 0x66
    function lineuntilnotified(start, end, color, depthtest, notification) {
        level endon(notification);
        for (;;) {
            line(start, end, color, depthtest);
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xa57bd457, Offset: 0x5be0
    // Size: 0x184
    function engagement_distance_debug_toggle() {
        level endon(#"kill_engage_dist_debug_toggle_watcher");
        if (!isdefined(getdvarint(#"debug_engage_dists", 0))) {
            setdvar(#"debug_engage_dists", 0);
        }
        laststate = getdvarint(#"debug_engage_dists", 0);
        while (true) {
            currentstate = getdvarint(#"debug_engage_dists", 0);
            if (dvar_turned_on(currentstate) && !dvar_turned_on(laststate)) {
                weapon_engage_dists_init();
                thread debug_realtime_engage_dist();
                laststate = currentstate;
            } else if (!dvar_turned_on(currentstate) && dvar_turned_on(laststate)) {
                level notify(#"kill_all_engage_dist_debug");
                laststate = currentstate;
            }
            wait(0.3);
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0x12ae898c, Offset: 0x5d70
    // Size: 0x2a
    function dvar_turned_on(val) {
        if (val <= 0) {
            return 0;
        }
        return 1;
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x174fcfb4, Offset: 0x5da8
    // Size: 0x3e0
    function engagement_distance_debug_init() {
        level.debug_xpos = -50;
        level.debug_ypos = 250;
        level.debug_yinc = 18;
        level.debug_fontscale = 1.5;
        level.white = (1, 1, 1);
        level.green = (0, 1, 0);
        level.yellow = (1, 1, 0);
        level.red = (1, 0, 0);
        level.realtimeengagedist = newdebughudelem();
        level.realtimeengagedist.alignx = "<dev string:x52b>";
        level.realtimeengagedist.fontscale = level.debug_fontscale;
        level.realtimeengagedist.x = level.debug_xpos;
        level.realtimeengagedist.y = level.debug_ypos;
        level.realtimeengagedist.color = level.white;
        level.realtimeengagedist settext("<dev string:x639>");
        xpos = level.debug_xpos + 207;
        level.realtimeengagedist_value = newdebughudelem();
        level.realtimeengagedist_value.alignx = "<dev string:x52b>";
        level.realtimeengagedist_value.fontscale = level.debug_fontscale;
        level.realtimeengagedist_value.x = xpos;
        level.realtimeengagedist_value.y = level.debug_ypos;
        level.realtimeengagedist_value.color = level.white;
        level.realtimeengagedist_value setvalue(0);
        xpos += 37;
        level.realtimeengagedist_middle = newdebughudelem();
        level.realtimeengagedist_middle.alignx = "<dev string:x52b>";
        level.realtimeengagedist_middle.fontscale = level.debug_fontscale;
        level.realtimeengagedist_middle.x = xpos;
        level.realtimeengagedist_middle.y = level.debug_ypos;
        level.realtimeengagedist_middle.color = level.white;
        level.realtimeengagedist_middle settext("<dev string:x659>");
        xpos += 105;
        level.realtimeengagedist_offvalue = newdebughudelem();
        level.realtimeengagedist_offvalue.alignx = "<dev string:x52b>";
        level.realtimeengagedist_offvalue.fontscale = level.debug_fontscale;
        level.realtimeengagedist_offvalue.x = xpos;
        level.realtimeengagedist_offvalue.y = level.debug_ypos;
        level.realtimeengagedist_offvalue.color = level.white;
        level.realtimeengagedist_offvalue setvalue(0);
        hudobjarray = [];
        hudobjarray[0] = level.realtimeengagedist;
        hudobjarray[1] = level.realtimeengagedist_value;
        hudobjarray[2] = level.realtimeengagedist_middle;
        hudobjarray[3] = level.realtimeengagedist_offvalue;
        return hudobjarray;
    }

    // Namespace dev/dev
    // Params 2, eflags: 0x0
    // Checksum 0xd4b850cc, Offset: 0x6190
    // Size: 0x66
    function engage_dist_debug_hud_destroy(hudarray, killnotify) {
        level waittill(killnotify);
        for (i = 0; i < hudarray.size; i++) {
            hudarray[i] destroy();
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x1dcbc2e5, Offset: 0x6200
    // Size: 0x70c
    function weapon_engage_dists_init() {
        level.engagedists = [];
        genericpistol = spawnstruct();
        genericpistol.engagedistmin = 125;
        genericpistol.engagedistoptimal = 225;
        genericpistol.engagedistmulligan = 50;
        genericpistol.engagedistmax = 400;
        shotty = spawnstruct();
        shotty.engagedistmin = 50;
        shotty.engagedistoptimal = 200;
        shotty.engagedistmulligan = 75;
        shotty.engagedistmax = 350;
        genericsmg = spawnstruct();
        genericsmg.engagedistmin = 100;
        genericsmg.engagedistoptimal = 275;
        genericsmg.engagedistmulligan = 100;
        genericsmg.engagedistmax = 500;
        genericlmg = spawnstruct();
        genericlmg.engagedistmin = 325;
        genericlmg.engagedistoptimal = 550;
        genericlmg.engagedistmulligan = 150;
        genericlmg.engagedistmax = 850;
        genericriflesa = spawnstruct();
        genericriflesa.engagedistmin = 325;
        genericriflesa.engagedistoptimal = 550;
        genericriflesa.engagedistmulligan = 150;
        genericriflesa.engagedistmax = 850;
        genericriflebolt = spawnstruct();
        genericriflebolt.engagedistmin = 350;
        genericriflebolt.engagedistoptimal = 600;
        genericriflebolt.engagedistmulligan = 150;
        genericriflebolt.engagedistmax = 900;
        generichmg = spawnstruct();
        generichmg.engagedistmin = 390;
        generichmg.engagedistoptimal = 600;
        generichmg.engagedistmulligan = 100;
        generichmg.engagedistmax = 900;
        genericsniper = spawnstruct();
        genericsniper.engagedistmin = 950;
        genericsniper.engagedistoptimal = 1700;
        genericsniper.engagedistmulligan = 300;
        genericsniper.engagedistmax = 3000;
        engage_dists_add("<dev string:x672>", genericpistol);
        engage_dists_add("<dev string:x679>", genericpistol);
        engage_dists_add("<dev string:x681>", genericpistol);
        engage_dists_add("<dev string:x68b>", genericpistol);
        engage_dists_add("<dev string:x695>", genericsmg);
        engage_dists_add("<dev string:x6a0>", genericsmg);
        engage_dists_add("<dev string:x6ae>", genericsmg);
        engage_dists_add("<dev string:x6b5>", genericsmg);
        engage_dists_add("<dev string:x6bc>", genericsmg);
        engage_dists_add("<dev string:x6c4>", genericsmg);
        engage_dists_add("<dev string:x6cb>", genericsmg);
        engage_dists_add("<dev string:x6db>", shotty);
        engage_dists_add("<dev string:x6e5>", genericlmg);
        engage_dists_add("<dev string:x6eb>", genericlmg);
        engage_dists_add("<dev string:x6f7>", genericlmg);
        engage_dists_add("<dev string:x704>", genericlmg);
        engage_dists_add("<dev string:x717>", genericlmg);
        engage_dists_add("<dev string:x71e>", genericlmg);
        engage_dists_add("<dev string:x72b>", genericlmg);
        engage_dists_add("<dev string:x732>", genericlmg);
        engage_dists_add("<dev string:x73f>", genericlmg);
        engage_dists_add("<dev string:x746>", genericlmg);
        engage_dists_add("<dev string:x753>", genericriflesa);
        engage_dists_add("<dev string:x75e>", genericriflesa);
        engage_dists_add("<dev string:x76a>", genericriflesa);
        engage_dists_add("<dev string:x772>", genericriflesa);
        engage_dists_add("<dev string:x77d>", genericriflebolt);
        engage_dists_add("<dev string:x78b>", genericriflebolt);
        engage_dists_add("<dev string:x79a>", genericriflebolt);
        engage_dists_add("<dev string:x7a8>", genericriflebolt);
        engage_dists_add("<dev string:x7b1>", genericriflebolt);
        engage_dists_add("<dev string:x7bf>", generichmg);
        engage_dists_add("<dev string:x7c7>", generichmg);
        engage_dists_add("<dev string:x7d5>", generichmg);
        engage_dists_add("<dev string:x7dc>", generichmg);
        engage_dists_add("<dev string:x7e9>", genericsniper);
        engage_dists_add("<dev string:x7fe>", genericsniper);
        engage_dists_add("<dev string:x814>", genericsniper);
        engage_dists_add("<dev string:x829>", genericsniper);
        engage_dists_add("<dev string:x839>", genericsniper);
        engage_dists_add("<dev string:x847>", genericsniper);
        level thread engage_dists_watcher();
    }

    // Namespace dev/dev
    // Params 2, eflags: 0x0
    // Checksum 0x175747d0, Offset: 0x6918
    // Size: 0x42
    function engage_dists_add(weaponname, values) {
        level.engagedists[getweapon(weaponname)] = values;
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0xe4466db2, Offset: 0x6968
    // Size: 0x3e
    function get_engage_dists(weapon) {
        if (isdefined(level.engagedists[weapon])) {
            return level.engagedists[weapon];
        }
        return undefined;
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xded37649, Offset: 0x69b0
    // Size: 0x118
    function engage_dists_watcher() {
        level endon(#"kill_all_engage_dist_debug");
        level endon(#"kill_engage_dists_watcher");
        while (true) {
            player = util::gethostplayer();
            playerweapon = player getcurrentweapon();
            if (!isdefined(player.lastweapon)) {
                player.lastweapon = playerweapon;
            } else if (player.lastweapon == playerweapon) {
                waitframe(1);
                continue;
            }
            values = get_engage_dists(playerweapon);
            if (isdefined(values)) {
                level.weaponengagedistvalues = values;
            } else {
                level.weaponengagedistvalues = undefined;
            }
            player.lastweapon = playerweapon;
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xe0d76e4c, Offset: 0x6ad0
    // Size: 0x496
    function debug_realtime_engage_dist() {
        level endon(#"kill_all_engage_dist_debug");
        level endon(#"kill_realtime_engagement_distance_debug");
        hudobjarray = engagement_distance_debug_init();
        level thread engage_dist_debug_hud_destroy(hudobjarray, "<dev string:x85c>");
        level.debugrtengagedistcolor = level.green;
        player = util::gethostplayer();
        while (true) {
            lasttracepos = (0, 0, 0);
            direction = player getplayerangles();
            direction_vec = anglestoforward(direction);
            eye = player geteye();
            eye = (eye[0], eye[1], eye[2] + 20);
            trace = bullettrace(eye, eye + vectorscale(direction_vec, 100000), 1, player);
            tracepoint = trace[#"position"];
            tracenormal = trace[#"normal"];
            tracedist = int(distance(eye, tracepoint));
            if (tracepoint != lasttracepos) {
                lasttracepos = tracepoint;
                if (!isdefined(level.weaponengagedistvalues)) {
                    hudobj_changecolor(hudobjarray, level.white);
                    hudobjarray engagedist_hud_changetext("<dev string:x879>", tracedist);
                } else {
                    engagedistmin = level.weaponengagedistvalues.engagedistmin;
                    engagedistoptimal = level.weaponengagedistvalues.engagedistoptimal;
                    engagedistmulligan = level.weaponengagedistvalues.engagedistmulligan;
                    engagedistmax = level.weaponengagedistvalues.engagedistmax;
                    if (tracedist >= engagedistmin && tracedist <= engagedistmax) {
                        if (tracedist >= engagedistoptimal - engagedistmulligan && tracedist <= engagedistoptimal + engagedistmulligan) {
                            hudobjarray engagedist_hud_changetext("<dev string:x882>", tracedist);
                            hudobj_changecolor(hudobjarray, level.green);
                        } else {
                            hudobjarray engagedist_hud_changetext("<dev string:x88c>", tracedist);
                            hudobj_changecolor(hudobjarray, level.yellow);
                        }
                    } else if (tracedist < engagedistmin) {
                        hudobj_changecolor(hudobjarray, level.red);
                        hudobjarray engagedist_hud_changetext("<dev string:x891>", tracedist);
                    } else if (tracedist > engagedistmax) {
                        hudobj_changecolor(hudobjarray, level.red);
                        hudobjarray engagedist_hud_changetext("<dev string:x899>", tracedist);
                    }
                }
            }
            thread util::function_6844bea4(1, 5, 0.05, level.debugrtengagedistcolor, tracepoint, tracenormal);
            thread util::function_6844bea4(1, 1, 0.05, level.debugrtengagedistcolor, tracepoint, tracenormal);
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 2, eflags: 0x0
    // Checksum 0xe498fc66, Offset: 0x6f70
    // Size: 0x88
    function hudobj_changecolor(hudobjarray, newcolor) {
        for (i = 0; i < hudobjarray.size; i++) {
            hudobj = hudobjarray[i];
            if (hudobj.color != newcolor) {
                hudobj.color = newcolor;
                level.debugrtengagedistcolor = newcolor;
            }
        }
    }

    // Namespace dev/dev
    // Params 2, eflags: 0x0
    // Checksum 0xbc0431c0, Offset: 0x7000
    // Size: 0x2f6
    function engagedist_hud_changetext(engagedisttype, units) {
        if (!isdefined(level.lastdisttype)) {
            level.lastdisttype = "<dev string:x3b>";
        }
        if (engagedisttype == "<dev string:x882>") {
            self[1] setvalue(units);
            self[2] settext("<dev string:x8a0>");
            self[3].alpha = 0;
        } else if (engagedisttype == "<dev string:x88c>") {
            self[1] setvalue(units);
            self[2] settext("<dev string:x8b2>");
            self[3].alpha = 0;
        } else if (engagedisttype == "<dev string:x891>") {
            amountunder = level.weaponengagedistvalues.engagedistmin - units;
            self[1] setvalue(units);
            self[3] setvalue(amountunder);
            self[3].alpha = 1;
            if (level.lastdisttype != engagedisttype) {
                self[2] settext("<dev string:x8bf>");
            }
        } else if (engagedisttype == "<dev string:x899>") {
            amountover = units - level.weaponengagedistvalues.engagedistmax;
            self[1] setvalue(units);
            self[3] setvalue(amountover);
            self[3].alpha = 1;
            if (level.lastdisttype != engagedisttype) {
                self[2] settext("<dev string:x8d2>");
            }
        } else if (engagedisttype == "<dev string:x879>") {
            self[1] setvalue(units);
            self[2] settext("<dev string:x8e4>");
            self[3].alpha = 0;
        }
        level.lastdisttype = engagedisttype;
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xa18ea870, Offset: 0x7300
    // Size: 0x1da
    function larry_thread() {
        setdvar(#"bot_allowmovement", 0);
        setdvar(#"bot_allowaiming", 0);
        setdvar(#"bot_pressattackbtn", 0);
        setdvar(#"bot_pressmeleebtn", 0);
        level.larry = spawnstruct();
        player = util::gethostplayer();
        player thread larry_init(level.larry);
        level waittill(#"kill_larry");
        larry_hud_destroy(level.larry);
        if (isdefined(level.larry.model)) {
            level.larry.model delete();
        }
        if (isdefined(level.larry.ai)) {
            for (i = 0; i < level.larry.ai.size; i++) {
                kick(level.larry.ai[i] getentitynumber());
            }
        }
        level.larry = undefined;
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0xc70b1f2f, Offset: 0x74e8
    // Size: 0x254
    function larry_init(larry) {
        level endon(#"kill_larry");
        larry_hud_init(larry);
        larry.model = spawn("<dev string:x909>", (0, 0, 0));
        larry.model setmodel(#"defaultactor");
        larry.ai = [];
        wait(0.1);
        for (;;) {
            waitframe(1);
            if (larry.ai.size > 0) {
                larry.model hide();
                continue;
            }
            direction = self getplayerangles();
            direction_vec = anglestoforward(direction);
            eye = self geteye();
            trace = bullettrace(eye, eye + vectorscale(direction_vec, 8000), 0, undefined);
            dist = distance(eye, trace[#"position"]);
            position = eye + vectorscale(direction_vec, dist - 64);
            larry.model.origin = position;
            larry.model.angles = self.angles + (0, 180, 0);
            if (self usebuttonpressed()) {
                self larry_ai(larry);
                while (self usebuttonpressed()) {
                    waitframe(1);
                }
            }
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0x85dfc81a, Offset: 0x7748
    // Size: 0x224
    function larry_ai(larry) {
        var_572bc68e = "<dev string:xc0>";
        if (level.teambased) {
            foreach (team in level.teams) {
                if (team != self.team) {
                    var_572bc68e = team;
                    break;
                }
            }
        } else {
            foreach (team in level.teams) {
                if (getplayers(team).size == 0) {
                    var_572bc68e = team;
                    break;
                }
            }
        }
        larry.ai[larry.ai.size] = bot::add_bot(var_572bc68e);
        i = larry.ai.size - 1;
        larry.ai[i] thread larry_ai_thread(larry, larry.model.origin, larry.model.angles);
        larry.ai[i] thread larry_ai_damage(larry);
        larry.ai[i] thread larry_ai_health(larry);
    }

    // Namespace dev/dev
    // Params 3, eflags: 0x0
    // Checksum 0x567f1afa, Offset: 0x7978
    // Size: 0x1e0
    function larry_ai_thread(larry, origin, angles) {
        level endon(#"kill_larry");
        for (;;) {
            self waittill(#"spawned_player");
            larry.menu[larry.menu_health] setvalue(self.health);
            larry.menu[larry.menu_damage] settext("<dev string:x38>");
            larry.menu[larry.menu_range] settext("<dev string:x38>");
            larry.menu[larry.menu_hitloc] settext("<dev string:x38>");
            larry.menu[larry.menu_weapon] settext("<dev string:x38>");
            larry.menu[larry.menu_perks] settext("<dev string:x38>");
            self setorigin(origin);
            self setplayerangles(angles);
            self clearperks();
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0x62345de1, Offset: 0x7b60
    // Size: 0x2b8
    function larry_ai_damage(larry) {
        level endon(#"kill_larry");
        for (;;) {
            waitresult = self waittill(#"damage");
            attacker = waitresult.attacker;
            damage = waitresult.amount;
            point = waitresult.position;
            if (!isdefined(attacker)) {
                continue;
            }
            player = util::gethostplayer();
            if (!isdefined(player)) {
                continue;
            }
            if (attacker != player) {
                continue;
            }
            eye = player geteye();
            range = int(distance(eye, point));
            larry.menu[larry.menu_health] setvalue(self.health);
            larry.menu[larry.menu_damage] setvalue(damage);
            larry.menu[larry.menu_range] setvalue(range);
            if (isdefined(self.cac_debug_location)) {
                larry.menu[larry.menu_hitloc] settext(self.cac_debug_location);
            } else {
                larry.menu[larry.menu_hitloc] settext("<dev string:x918>");
            }
            if (isdefined(self.cac_debug_weapon)) {
                larry.menu[larry.menu_weapon] settext(self.cac_debug_weapon);
                continue;
            }
            larry.menu[larry.menu_weapon] settext("<dev string:x918>");
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0x43798fe0, Offset: 0x7e20
    // Size: 0x60
    function larry_ai_health(larry) {
        level endon(#"kill_larry");
        for (;;) {
            waitframe(1);
            larry.menu[larry.menu_health] setvalue(self.health);
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0x8619fbc0, Offset: 0x7e88
    // Size: 0x586
    function larry_hud_init(larry) {
        /#
            x = -45;
            y = 275;
            menu_name = "<dev string:x924>";
            larry.hud = new_hud(menu_name, undefined, x, y, 1);
            larry.hud setshader(#"white", 135, 65);
            larry.hud.alignx = "<dev string:x52b>";
            larry.hud.aligny = "<dev string:x532>";
            larry.hud.sort = 10;
            larry.hud.alpha = 0.6;
            larry.hud.color = (0, 0, 0.5);
            larry.menu[0] = new_hud(menu_name, "<dev string:x931>", x + 5, y + 10, 1);
            larry.menu[1] = new_hud(menu_name, "<dev string:x941>", x + 5, y + 20, 1);
            larry.menu[2] = new_hud(menu_name, "<dev string:x94b>", x + 5, y + 30, 1);
            larry.menu[3] = new_hud(menu_name, "<dev string:x954>", x + 5, y + 40, 1);
            larry.menu[4] = new_hud(menu_name, "<dev string:x964>", x + 5, y + 50, 1);
            larry.cleartextmarker = newdebughudelem();
            larry.cleartextmarker.alpha = 0;
            larry.cleartextmarker settext("<dev string:x96e>");
            larry.menu_health = larry.menu.size;
            larry.menu_damage = larry.menu.size + 1;
            larry.menu_range = larry.menu.size + 2;
            larry.menu_hitloc = larry.menu.size + 3;
            larry.menu_weapon = larry.menu.size + 4;
            larry.menu_perks = larry.menu.size + 5;
            x_offset = 70;
            larry.menu[larry.menu_health] = new_hud(menu_name, "<dev string:x38>", x + x_offset, y + 10, 1);
            larry.menu[larry.menu_damage] = new_hud(menu_name, "<dev string:x38>", x + x_offset, y + 20, 1);
            larry.menu[larry.menu_range] = new_hud(menu_name, "<dev string:x38>", x + x_offset, y + 30, 1);
            larry.menu[larry.menu_hitloc] = new_hud(menu_name, "<dev string:x38>", x + x_offset, y + 40, 1);
            larry.menu[larry.menu_weapon] = new_hud(menu_name, "<dev string:x38>", x + x_offset, y + 50, 1);
            larry.menu[larry.menu_perks] = new_hud(menu_name, "<dev string:x38>", x + x_offset, y + 60, 1);
        #/
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0xf94392b7, Offset: 0x8418
    // Size: 0xac
    function larry_hud_destroy(larry) {
        if (isdefined(larry.hud)) {
            larry.hud destroy();
            for (i = 0; i < larry.menu.size; i++) {
                larry.menu[i] destroy();
            }
            larry.cleartextmarker destroy();
        }
    }

    // Namespace dev/dev
    // Params 5, eflags: 0x0
    // Checksum 0x66e9120d, Offset: 0x84d0
    // Size: 0xce
    function new_hud(hud_name, msg, x, y, scale) {
        if (!isdefined(level.hud_array)) {
            level.hud_array = [];
        }
        if (!isdefined(level.hud_array[hud_name])) {
            level.hud_array[hud_name] = [];
        }
        hud = set_hudelem(msg, x, y, scale);
        level.hud_array[hud_name][level.hud_array[hud_name].size] = hud;
        return hud;
    }

    // Namespace dev/dev
    // Params 7, eflags: 0x0
    // Checksum 0xbb9a5cbe, Offset: 0x85a8
    // Size: 0x16a
    function set_hudelem(text, x, y, scale, alpha, sort, debug_hudelem) {
        /#
            if (!isdefined(alpha)) {
                alpha = 1;
            }
            if (!isdefined(scale)) {
                scale = 1;
            }
            if (!isdefined(sort)) {
                sort = 20;
            }
            hud = newdebughudelem();
            hud.debug_hudelem = 1;
            hud.location = 0;
            hud.alignx = "<dev string:x52b>";
            hud.aligny = "<dev string:x977>";
            hud.foreground = 1;
            hud.fontscale = scale;
            hud.sort = sort;
            hud.alpha = alpha;
            hud.x = x;
            hud.y = y;
            hud.og_scale = scale;
            if (isdefined(text)) {
                hud settext(text);
            }
            return hud;
        #/
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x230c0234, Offset: 0x8720
    // Size: 0x15c
    function print_weapon_name() {
        /#
            self notify(#"print_weapon_name");
            self endon(#"print_weapon_name");
            wait(0.2);
            if (self isswitchingweapons()) {
                waitresult = self waittill(#"weapon_change_complete");
                fail_safe = 0;
                while (waitresult.weapon == level.weaponnone) {
                    waitresult = self waittill(#"weapon_change_complete");
                    waitframe(1);
                    fail_safe++;
                    if (fail_safe > 120) {
                        break;
                    }
                }
            } else {
                weapon = self getcurrentweapon();
            }
            printweaponname = getdvarint(#"scr_print_weapon_name", 1);
            if (printweaponname) {
                iprintlnbold(getweaponname(weapon));
            }
        #/
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xfc01d5a6, Offset: 0x8888
    // Size: 0x236
    function set_equipment_list() {
        if (isdefined(level.dev_equipment)) {
            return;
        }
        level.dev_equipment = [];
        level.dev_equipment[1] = getweapon(#"acoustic_sensor");
        level.dev_equipment[2] = getweapon(#"camera_spike");
        level.dev_equipment[3] = getweapon(#"claymore");
        level.dev_equipment[4] = getweapon(#"satchel_charge");
        level.dev_equipment[5] = getweapon(#"scrambler");
        level.dev_equipment[6] = getweapon(#"tactical_insertion");
        level.dev_equipment[7] = getweapon(#"bouncingbetty");
        level.dev_equipment[8] = getweapon(#"trophy_system");
        level.dev_equipment[9] = getweapon(#"pda_hack");
        level.dev_equipment[10] = getweapon(#"threat_detector");
        level.dev_equipment[11] = getweapon(#"armor_station");
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xd5e73943, Offset: 0x8ac8
    // Size: 0x266
    function set_grenade_list() {
        if (isdefined(level.dev_grenade)) {
            return;
        }
        level.dev_grenade = [];
        level.dev_grenade[1] = getweapon(#"frag_grenade");
        level.dev_grenade[2] = getweapon(#"sticky_grenade");
        level.dev_grenade[3] = getweapon(#"hatchet");
        level.dev_grenade[4] = getweapon(#"willy_pete");
        level.dev_grenade[5] = getweapon(#"proximity_grenade");
        level.dev_grenade[6] = getweapon(#"flash_grenade");
        level.dev_grenade[7] = getweapon(#"concussion_grenade");
        level.dev_grenade[8] = getweapon(#"nightingale");
        level.dev_grenade[9] = getweapon(#"emp_grenade");
        level.dev_grenade[10] = getweapon(#"sensor_grenade");
        level.dev_grenade[11] = getweapon(#"incendiary_grenade");
        level.dev_grenade[12] = getweapon(#"sprint_boost_grenade");
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0xd6d71639, Offset: 0x8d38
    // Size: 0xb6
    function take_all_grenades_and_equipment(player) {
        for (i = 0; i < level.dev_equipment.size; i++) {
            player takeweapon(level.dev_equipment[i + 1]);
        }
        for (i = 0; i < level.dev_grenade.size; i++) {
            player takeweapon(level.dev_grenade[i + 1]);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x51b27c61, Offset: 0x8df8
    // Size: 0x150
    function equipment_dev_gui() {
        set_equipment_list();
        set_grenade_list();
        setdvar(#"scr_give_equipment", "<dev string:x38>");
        while (true) {
            wait(0.5);
            devgui_int = getdvarint(#"scr_give_equipment", 0);
            if (devgui_int != 0) {
                for (i = 0; i < level.players.size; i++) {
                    take_all_grenades_and_equipment(level.players[i]);
                    level.players[i] devgui::devgui_give_weapon(getweaponname(level.dev_equipment[devgui_int]));
                }
                setdvar(#"scr_give_equipment", 0);
            }
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x3914a135, Offset: 0x8f50
    // Size: 0x150
    function grenade_dev_gui() {
        set_equipment_list();
        set_grenade_list();
        setdvar(#"scr_give_grenade", "<dev string:x38>");
        while (true) {
            wait(0.5);
            devgui_int = getdvarint(#"scr_give_grenade", 0);
            if (devgui_int != 0) {
                for (i = 0; i < level.players.size; i++) {
                    take_all_grenades_and_equipment(level.players[i]);
                    level.players[i] devgui::devgui_give_weapon(getweaponname(level.dev_grenade[devgui_int]));
                }
                setdvar(#"scr_give_grenade", 0);
            }
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0x99d5b842, Offset: 0x90a8
    // Size: 0x27c
    function force_grenade_throw(weapon) {
        if (weapon == level.weaponnone) {
            return;
        }
        setdvar(#"bot_allowmovement", 0);
        setdvar(#"bot_allowaiming", 0);
        setdvar(#"bot_pressattackbtn", 0);
        setdvar(#"bot_pressmeleebtn", 0);
        setdvar(#"scr_botsallowkillstreaks", 0);
        host = util::gethostplayer();
        if (!isdefined(host.team)) {
            iprintln("<dev string:x980>");
            return;
        }
        bot = getormakebot(util::getotherteam(host.team));
        if (!isdefined(bot)) {
            iprintln("<dev string:xcd>");
            return;
        }
        angles = host getplayerangles();
        angles = (0, angles[1], 0);
        dir = anglestoforward(angles);
        dir = vectornormalize(dir);
        origin = host geteye() + vectorscale(dir, 256);
        velocity = vectorscale(dir, -1024);
        grenade = bot magicgrenadeplayer(weapon, origin, velocity);
        grenade setteam(bot.team);
        grenade setowner(bot);
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xc034646b, Offset: 0x9330
    // Size: 0x472
    function devstraferunpathdebugdraw() {
        white = (1, 1, 1);
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        violet = (0.4, 0, 0.6);
        maxdrawtime = 10;
        drawtime = maxdrawtime;
        origintextoffset = (0, 0, -50);
        endonmsg = "<dev string:x9a7>";
        while (true) {
            if (killstreaks::should_draw_debug("<dev string:x9c7>") > 0) {
                nodes = [];
                end = 0;
                node = getvehiclenode("<dev string:x9d5>", "<dev string:x14f>");
                if (!isdefined(node)) {
                    println("<dev string:x9e5>");
                    setdvar(#"scr_devstraferunpathdebugdraw", 0);
                    continue;
                }
                while (isdefined(node.target)) {
                    new_node = getvehiclenode(node.target, "<dev string:x14f>");
                    foreach (n in nodes) {
                        if (n == new_node) {
                            end = 1;
                        }
                    }
                    textscale = 30;
                    if (drawtime == maxdrawtime) {
                        node thread drawpathsegment(new_node, violet, violet, 1, textscale, origintextoffset, drawtime, endonmsg);
                    }
                    if (isdefined(node.script_noteworthy)) {
                        textscale = 10;
                        switch (node.script_noteworthy) {
                        case #"strafe_start":
                            textcolor = green;
                            textalpha = 1;
                            break;
                        case #"strafe_stop":
                            textcolor = red;
                            textalpha = 1;
                            break;
                        case #"strafe_leave":
                            textcolor = white;
                            textalpha = 1;
                            break;
                        }
                        switch (node.script_noteworthy) {
                        case #"strafe_stop":
                        case #"strafe_leave":
                        case #"strafe_start":
                            sides = 10;
                            radius = 100;
                            if (drawtime == maxdrawtime) {
                                sphere(node.origin, radius, textcolor, textalpha, 1, sides, int(drawtime * 1000));
                            }
                            node draworiginlines();
                            node drawnoteworthytext(textcolor, textalpha, textscale);
                            break;
                        }
                    }
                    if (end) {
                        break;
                    }
                    nodes[nodes.size] = new_node;
                    node = new_node;
                }
                drawtime -= 0.05;
                if (drawtime < 0) {
                    drawtime = maxdrawtime;
                }
                waitframe(1);
                continue;
            }
            wait(1);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xb46301a2, Offset: 0x97b0
    // Size: 0x3c4
    function devhelipathdebugdraw() {
        white = (1, 1, 1);
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        textcolor = white;
        textalpha = 1;
        textscale = 1;
        maxdrawtime = 10;
        drawtime = maxdrawtime;
        origintextoffset = (0, 0, -50);
        endonmsg = "<dev string:xa00>";
        while (true) {
            if (getdvarint(#"scr_devhelipathsdebugdraw", 0) > 0) {
                script_origins = getentarray("<dev string:xa1c>", "<dev string:xb4>");
                foreach (ent in script_origins) {
                    if (isdefined(ent.targetname)) {
                        switch (ent.targetname) {
                        case #"heli_start":
                            textcolor = blue;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        case #"heli_loop_start":
                            textcolor = green;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        case #"heli_attack_area":
                            textcolor = red;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        case #"heli_leave":
                            textcolor = white;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        }
                        switch (ent.targetname) {
                        case #"heli_leave":
                        case #"heli_attack_area":
                        case #"heli_start":
                        case #"heli_loop_start":
                            if (drawtime == maxdrawtime) {
                                ent thread drawpath(textcolor, white, textalpha, textscale, origintextoffset, drawtime, endonmsg);
                            }
                            ent draworiginlines();
                            ent drawtargetnametext(textcolor, textalpha, textscale);
                            ent draworigintext(textcolor, textalpha, textscale, origintextoffset);
                            break;
                        }
                    }
                }
                drawtime -= 0.05;
                if (drawtime < 0) {
                    drawtime = maxdrawtime;
                }
            }
            if (getdvarint(#"scr_devhelipathsdebugdraw", 0) == 0) {
                level notify(endonmsg);
                drawtime = maxdrawtime;
                wait(1);
            }
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x59e9627f, Offset: 0x9b80
    // Size: 0xfc
    function draworiginlines() {
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        line(self.origin, self.origin + anglestoforward(self.angles) * 10, red);
        line(self.origin, self.origin + anglestoright(self.angles) * 10, green);
        line(self.origin, self.origin + anglestoup(self.angles) * 10, blue);
    }

    // Namespace dev/dev
    // Params 4, eflags: 0x0
    // Checksum 0x763c3e5, Offset: 0x9c88
    // Size: 0x6c
    function drawtargetnametext(textcolor, textalpha, textscale, textoffset) {
        if (!isdefined(textoffset)) {
            textoffset = (0, 0, 0);
        }
        print3d(self.origin + textoffset, self.targetname, textcolor, textalpha, textscale);
    }

    // Namespace dev/dev
    // Params 4, eflags: 0x0
    // Checksum 0xf9dc4b4, Offset: 0x9d00
    // Size: 0x6c
    function drawnoteworthytext(textcolor, textalpha, textscale, textoffset) {
        if (!isdefined(textoffset)) {
            textoffset = (0, 0, 0);
        }
        print3d(self.origin + textoffset, self.script_noteworthy, textcolor, textalpha, textscale);
    }

    // Namespace dev/dev
    // Params 4, eflags: 0x0
    // Checksum 0xe76a92ab, Offset: 0x9d78
    // Size: 0xbc
    function draworigintext(textcolor, textalpha, textscale, textoffset) {
        if (!isdefined(textoffset)) {
            textoffset = (0, 0, 0);
        }
        originstring = "<dev string:xa2c>" + self.origin[0] + "<dev string:xa30>" + self.origin[1] + "<dev string:xa30>" + self.origin[2] + "<dev string:xa35>";
        print3d(self.origin + textoffset, originstring, textcolor, textalpha, textscale);
    }

    // Namespace dev/dev
    // Params 4, eflags: 0x0
    // Checksum 0xcedda150, Offset: 0x9e40
    // Size: 0xd4
    function drawspeedacceltext(textcolor, textalpha, textscale, textoffset) {
        if (isdefined(self.script_airspeed)) {
            print3d(self.origin + (0, 0, textoffset[2] * 2), "<dev string:xa39>" + self.script_airspeed, textcolor, textalpha, textscale);
        }
        if (isdefined(self.script_accel)) {
            print3d(self.origin + (0, 0, textoffset[2] * 3), "<dev string:xa4c>" + self.script_accel, textcolor, textalpha, textscale);
        }
    }

    // Namespace dev/dev
    // Params 7, eflags: 0x0
    // Checksum 0xf7870d44, Offset: 0x9f20
    // Size: 0x142
    function drawpath(linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg) {
        level endon(endonmsg);
        ent = self;
        entfirsttarget = ent.targetname;
        while (isdefined(ent.target)) {
            enttarget = getent(ent.target, "<dev string:x14f>");
            ent thread drawpathsegment(enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg);
            if (ent.targetname == "<dev string:xa5c>") {
                entfirsttarget = ent.target;
            } else if (ent.target == entfirsttarget) {
                break;
            }
            ent = enttarget;
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 8, eflags: 0x0
    // Checksum 0xf8bffe7f, Offset: 0xa070
    // Size: 0x116
    function drawpathsegment(enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg) {
        level endon(endonmsg);
        while (drawtime > 0) {
            if (isdefined(self.targetname) && self.targetname == "<dev string:x9d5>") {
                print3d(self.origin + textoffset, self.targetname, textcolor, textalpha, textscale);
            }
            line(self.origin, enttarget.origin, linecolor);
            self drawspeedacceltext(textcolor, textalpha, textscale, textoffset);
            drawtime -= 0.05;
            waitframe(1);
        }
    }

#/
