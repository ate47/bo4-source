// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_shared.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\rat.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_turned.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_placeable_mine.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_devgui;

/#

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x2
    // Checksum 0x3f475459, Offset: 0x1c0
    // Size: 0x4c
    function autoexec __init__system__() {
        system::register(#"zm_devqui", &__init__, &__main__, undefined);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x2d484b07, Offset: 0x218
    // Size: 0x25c
    function __init__() {
        setdvar(#"zombie_devgui", "<unknown string>");
        setdvar(#"scr_force_weapon", "<unknown string>");
        setdvar(#"scr_zombie_round", 1);
        setdvar(#"scr_zombie_dogs", 1);
        setdvar(#"scr_spawn_tesla", "<unknown string>");
        setdvar(#"scr_zombie_variant_type", -1);
        level.devgui_add_weapon = &devgui_add_weapon;
        level.devgui_add_ability = &devgui_add_ability;
        level thread zombie_devgui_think();
        thread zombie_weapon_devgui_think();
        thread function_3b534f9c();
        thread function_1e285ac2();
        thread devgui_zombie_healthbar();
        thread dev::devgui_test_chart_think();
        if (!isdefined(getdvar(#"scr_testscriptruntimeerror"))) {
            setdvar(#"scr_testscriptruntimeerror", "<unknown string>");
        }
        level thread dev::body_customization_devgui(0);
        thread testscriptruntimeerror();
        callback::on_connect(&player_on_connect);
        add_custom_devgui_callback(&function_2f5772bf);
        thread init_debug_center_screen();
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x86a657bd, Offset: 0x480
    // Size: 0xdc
    function __main__() {
        level thread zombie_devgui_player_commands();
        level thread zombie_devgui_validation_commands();
        level thread function_358c899d();
        level thread function_5ac8947e();
        level thread zombie_draw_traversals();
        level thread function_8817dd98();
        level thread function_e9b89aac();
        level thread function_38184bf8();
        level thread function_b5d522f8();
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xfb13e6c1, Offset: 0x568
    // Size: 0x8
    function zombie_devgui_player_commands() {
        
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x85a15c50, Offset: 0x578
    // Size: 0xf6
    function function_358c899d() {
        test_scores = array(1, 10, 50, 100, 3500, 9999);
        i = 0;
        foreach (score in test_scores) {
            adddebugcommand("<unknown string>" + score + "<unknown string>" + i + "<unknown string>" + score + "<unknown string>");
            i++;
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xc6876dbf, Offset: 0x678
    // Size: 0x1f8
    function function_5ac8947e() {
        setdvar(#"zombie_devgui_hud", "<unknown string>");
        while (true) {
            cmd = getdvar(#"zombie_devgui_hud", "<unknown string>");
            if (cmd == "<unknown string>") {
                wait(0.1);
                continue;
            }
            if (strstartswith(cmd, "<unknown string>")) {
                str = strreplace(cmd, "<unknown string>", "<unknown string>");
                score = int(str);
                players = getplayers();
                foreach (player in players) {
                    if (isplayer(player)) {
                        player luinotifyevent(#"score_event", 2, #"hash_60899927812586a1", score);
                        break;
                    }
                }
            }
            setdvar(#"zombie_devgui_hud", "<unknown string>");
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x65edaa59, Offset: 0x878
    // Size: 0x44
    function player_on_connect() {
        level flag::wait_till("<unknown string>");
        wait(1);
        if (isdefined(self)) {
            zombie_devgui_player_menu(self);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x718ad292, Offset: 0x8c8
    // Size: 0x44
    function zombie_devgui_player_menu_clear(playername) {
        rootclear = "<unknown string>" + playername + "<unknown string>";
        adddebugcommand(rootclear);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 2, eflags: 0x0
    // Checksum 0xeb90334b, Offset: 0x918
    // Size: 0xb4
    function function_c7dd7a17(archetype, var_9fde8624) {
        if (!isdefined(var_9fde8624)) {
            var_9fde8624 = "<unknown string>";
        }
        displayname = archetype;
        if (isdefined(var_9fde8624) && var_9fde8624 != "<unknown string>") {
            displayname = displayname + "<unknown string>" + var_9fde8624;
        }
        adddebugcommand("<unknown string>" + displayname + "<unknown string>" + archetype + "<unknown string>" + var_9fde8624 + "<unknown string>");
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x4
    // Checksum 0x6aab7568, Offset: 0x9d8
    // Size: 0x3dc
    function private function_2f5772bf(cmd) {
        if (strstartswith(cmd, "<unknown string>")) {
            player = level.players[0];
            direction = player getplayerangles();
            direction_vec = anglestoforward(direction);
            eye = player geteye();
            direction_vec = (direction_vec[0] * 8000, direction_vec[1] * 8000, direction_vec[2] * 8000);
            trace = bullettrace(eye, eye + direction_vec, 0, undefined);
            ai = undefined;
            ai_info = strreplace(cmd, "<unknown string>", "<unknown string>");
            ai_info = strtok(ai_info, "<unknown string>");
            aitype = ai_info[0];
            if (ai_info.size > 1) {
                var_9fde8624 = ai_info[1];
            }
            spawners = getspawnerarray();
            foreach (spawner in spawners) {
                if (isdefined(spawner.archetype) && spawner.archetype == aitype && (!isdefined(var_9fde8624) || isdefined(spawner.var_9fde8624) && spawner.var_9fde8624 == var_9fde8624)) {
                    ai_spawner = spawner;
                    break;
                }
            }
            if (!isdefined(ai_spawner)) {
                iprintln("<unknown string>" + aitype);
                return;
            }
            ai_spawner.script_forcespawn = 1;
            ai = zombie_utility::spawn_zombie(ai_spawner, undefined, ai_spawner);
            if (isdefined(ai)) {
                if (ai.team != ai_spawner.team) {
                    ai.team = ai_spawner.team;
                }
                wait(0.5);
                if (isvehicle(ai)) {
                    ai.origin = trace[#"position"];
                    ai function_a57c34b7(trace[#"position"]);
                    return;
                }
                ai forceteleport(trace[#"position"], player.angles + (0, 180, 0));
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x57098601, Offset: 0xdc0
    // Size: 0x65c
    function zombie_devgui_player_menu(player) {
        zombie_devgui_player_menu_clear(player.name);
        ip1 = player getentitynumber() + 1;
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ip1 + "<unknown string>");
        if (isdefined(level.validcharacters)) {
            for (i = 0; i < level.validcharacters.size; i++) {
                ci = level.validcharacters[i];
                var_b82273f = getcharacterfields(ci, currentsessionmode());
                adddebugcommand("<unknown string>" + player.name + "<unknown string>" + ip1 + "<unknown string>" + ci + "<unknown string>" + var_b82273f.chrname + "<unknown string>" + ci + 1 + "<unknown string>" + ip1 + "<unknown string>" + ci + "<unknown string>");
            }
        }
        if (isdefined(level.var_e2c54606)) {
            level thread [[ level.var_e2c54606 ]](player, ip1);
        }
        self thread zombie_devgui_player_menu_clear_on_disconnect(player);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xa9844e93, Offset: 0x1428
    // Size: 0x54
    function zombie_devgui_player_menu_clear_on_disconnect(player) {
        playername = player.name;
        player waittill(#"disconnect");
        zombie_devgui_player_menu_clear(playername);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x6b92d174, Offset: 0x1488
    // Size: 0x442
    function function_38184bf8() {
        while (true) {
            var_c635168c = getdvarint(#"hash_67d19b13a4ab8b94", 0);
            if (var_c635168c >= 0 && isdefined(level.zone_paths[var_c635168c])) {
                zone_paths = level.zone_paths[var_c635168c];
                foreach (var_375627f0, zone_path in zone_paths) {
                    zone = level.zones[var_375627f0];
                    print_origin = undefined;
                    if (isdefined(zone.nodes[0])) {
                        print_origin = zone.nodes[0].origin;
                    }
                    if (!isdefined(print_origin)) {
                        print_origin = zone.volumes[0].origin;
                    }
                    color = (1, 0, 0);
                    if (zone_path.cost < 4) {
                        color = (0, 1, 0);
                    } else if (zone_path.cost < 8) {
                        color = (1, 0.5, 0);
                    }
                    circle(print_origin, 30, color);
                    print3d(print_origin, function_9e72a96(var_375627f0), color, 1, 0.5);
                    print3d(print_origin + (0, 0, -10), "<unknown string>" + zone_path.cost, color, 1, 0.5);
                    if (isdefined(zone_path.to_zone)) {
                        to_zone = level.zones[zone_path.to_zone];
                        if (isdefined(to_zone.nodes[0])) {
                            var_fbe06d06 = to_zone.nodes[0].origin;
                        }
                        if (!isdefined(var_fbe06d06)) {
                            var_fbe06d06 = to_zone.volumes[0].origin;
                        }
                        line(print_origin, var_fbe06d06, color, 0, 0);
                    }
                }
                foreach (zone_name, zone in level.zones) {
                    if (!isdefined(zone_paths[zone_name])) {
                        print_origin = undefined;
                        if (isdefined(zone.nodes[0])) {
                            print_origin = zone.nodes[0].origin;
                        }
                        if (!isdefined(print_origin)) {
                            print_origin = zone.volumes[0].origin;
                        }
                        print3d(print_origin, function_9e72a96(zone_name), (1, 0, 0), 1, 0.5);
                        circle(print_origin, 30, (1, 0, 0));
                        circle(print_origin, 35, (1, 0, 0));
                        circle(print_origin, 40, (1, 0, 0));
                    }
                }
            }
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x5be74d84, Offset: 0x18d8
    // Size: 0x220
    function zombie_devgui_validation_commands() {
        setdvar(#"validation_devgui_command", "<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        while (true) {
            cmd = getdvarstring(#"validation_devgui_command");
            if (cmd != "<unknown string>") {
                switch (cmd) {
                case #"structs":
                    thread bunker_entrance_zoned();
                    break;
                case #"spawner":
                    zombie_spawner_validation();
                    break;
                case #"zone_adj":
                    if (!isdefined(level.toggle_zone_adjacencies_validation)) {
                        level.toggle_zone_adjacencies_validation = 1;
                    } else {
                        level.toggle_zone_adjacencies_validation = !level.toggle_zone_adjacencies_validation;
                    }
                    thread zone_adjacencies_validation();
                    break;
                case #"zone_paths":
                    break;
                case #"pathing":
                    thread zombie_pathing_validation();
                default:
                    break;
                }
                setdvar(#"validation_devgui_command", "<unknown string>");
            }
            util::wait_network_frame();
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xa241276d, Offset: 0x1b00
    // Size: 0x1a2
    function function_edce7be0() {
        spawners = getspawnerarray();
        var_26193d02 = [];
        foreach (spawner in spawners) {
            have_spawner = 0;
            foreach (unique_spawner in var_26193d02) {
                if (spawner.classname === unique_spawner.classname) {
                    have_spawner = 1;
                    break;
                }
            }
            if (have_spawner) {
                continue;
            }
            if (!isdefined(var_26193d02)) {
                var_26193d02 = [];
            } else if (!isarray(var_26193d02)) {
                var_26193d02 = array(var_26193d02);
            }
            if (!isinarray(var_26193d02, spawner)) {
                var_26193d02[var_26193d02.size] = spawner;
            }
        }
        return var_26193d02;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xe79417ec, Offset: 0x1cb0
    // Size: 0xd0
    function function_6758ede4(zone) {
        if (isdefined(zone.nodes)) {
            foreach (node in zone.nodes) {
                node_region = getnoderegion(node);
                if (!isdefined(node_region)) {
                    thread drawvalidation(node.origin, undefined, undefined, undefined, node);
                }
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 2, eflags: 0x0
    // Checksum 0xecbef189, Offset: 0x1d88
    // Size: 0x166
    function function_995340b7(zone, var_87f65b00) {
        if (!isdefined(zone.a_loc_types[#"wait_location"]) || zone.a_loc_types[#"wait_location"].size <= 0) {
            if (isdefined(var_87f65b00) && var_87f65b00) {
                level.validation_errors_count++;
                if (isdefined(zone.nodes) && zone.nodes.size > 0) {
                    origin = zone.nodes[0].origin + (0, 0, 32);
                } else {
                    origin = zone.volumes[0].origin;
                }
                thread drawvalidation(origin, zone.name);
                println("<unknown string>" + zone.name);
                iprintlnbold("<unknown string>" + zone.name);
            }
            return 0;
        }
        return 1;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 4, eflags: 0x0
    // Checksum 0xfbd98aa1, Offset: 0x1ef8
    // Size: 0x2f0
    function function_1f0bc660(zone, enemy, spawner, spawn_location) {
        if (!isdefined(zone.a_loc_types[spawn_location])) {
            return enemy;
        }
        foreach (spawn_point in zone.a_loc_types[spawn_location]) {
            if (!isdefined(enemy)) {
                enemy = zombie_utility::spawn_zombie(spawner, spawner.targetname, spawn_point);
            }
            spawn_point_origin = spawn_point.origin;
            if (isdefined(spawn_point.script_string) && spawn_point.script_string != "<unknown string>") {
                spawn_point_origin = enemy validate_to_board(spawn_point, spawn_point_origin);
            }
            if (!ispointonnavmesh(spawn_point_origin, enemy getpathfindingradius() + 1)) {
                new_spawn_point_origin = getclosestpointonnavmesh(spawn_point_origin, 64, enemy getpathfindingradius() + 1);
            } else {
                new_spawn_point_origin = spawn_point_origin;
            }
            var_d37fcf94 = isdefined(spawn_point.script_noteworthy) && !issubstr(spawn_point.script_noteworthy, "<unknown string>");
            if (isdefined(var_d37fcf94) && var_d37fcf94 && !isdefined(new_spawn_point_origin) && !(isdefined(spawn_point.var_f0596bbb) && spawn_point.var_f0596bbb)) {
                level.validation_errors_count++;
                thread drawvalidation(spawn_point_origin);
                println("<unknown string>" + spawn_point_origin);
                iprintlnbold("<unknown string>" + spawn_point_origin);
                spawn_point.var_f0596bbb = 1;
            }
            if (!isdefined(new_spawn_point_origin)) {
                continue;
            }
            ispath = enemy validate_to_wait_point(zone, new_spawn_point_origin, spawn_point);
        }
        return enemy;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xb327592d, Offset: 0x21f0
    // Size: 0x38e
    function zombie_spawner_validation() {
        level.validation_errors_count = 0;
        if (!isdefined(level.toggle_spawner_validation)) {
            level.toggle_spawner_validation = 1;
            zombie_devgui_open_sesame();
            spawners = function_edce7be0();
            foreach (zone in level.zones) {
                function_6758ede4(zone);
                function_995340b7(zone, 1);
            }
            foreach (spawner in spawners) {
                if (!isdefined(spawner.aitype)) {
                    continue;
                }
                archetype = getarchetypefromclassname(spawner.aitype);
                if (!isdefined(archetype)) {
                    continue;
                }
                var_f41ab3f2 = spawner ai::function_9139c839().spawnlocations;
                if (!isdefined(var_f41ab3f2)) {
                    continue;
                }
                var_4d7c27e3 = 0;
                enemy = undefined;
                foreach (zone in level.zones) {
                    if (!function_995340b7(zone)) {
                        continue;
                    }
                    foreach (var_37121713 in var_f41ab3f2) {
                        enemy = function_1f0bc660(zone, enemy, spawner, var_37121713.spawnlocation);
                        if (isdefined(enemy)) {
                            var_4d7c27e3 = 1;
                        }
                    }
                }
                if (!var_4d7c27e3) {
                    iprintlnbold("<unknown string>" + spawner.aitype);
                }
            }
            println("<unknown string>" + level.validation_errors_count);
            iprintlnbold("<unknown string>" + level.validation_errors_count);
            level.validation_errors_count = undefined;
            return;
        }
        level.toggle_spawner_validation = !level.toggle_spawner_validation;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 2, eflags: 0x0
    // Checksum 0xf014a65d, Offset: 0x2588
    // Size: 0x2c6
    function validate_to_board(spawn_point, spawn_point_origin_backup) {
                for (j = 0; j < level.exterior_goals.size; j++) {
            if (isdefined(level.exterior_goals[j].script_string) && level.exterior_goals[j].script_string == spawn_point.script_string) {
                node = level.exterior_goals[j];
                break;
            }
        }
        if (isdefined(node)) {
            ispath = self canpath(spawn_point.origin, node.origin);
            if (!ispath) {
                level.validation_errors_count++;
                thread drawvalidation(spawn_point_origin_backup, undefined, undefined, node.origin, undefined, self.archetype);
                if (isdefined(self.archetype)) {
                    println("<unknown string>" + function_9e72a96(self.archetype) + "<unknown string>" + spawn_point_origin_backup + "<unknown string>" + spawn_point.targetname);
                    iprintlnbold("<unknown string>" + function_9e72a96(self.archetype) + "<unknown string>" + spawn_point_origin_backup + "<unknown string>" + spawn_point.targetname);
                } else {
                    println("<unknown string>" + spawn_point_origin_backup + "<unknown string>" + spawn_point.targetname);
                    iprintlnbold("<unknown string>" + spawn_point_origin_backup + "<unknown string>" + spawn_point.targetname);
                }
            }
            nodeforward = anglestoforward(node.angles);
            nodeforward = vectornormalize(nodeforward);
            spawn_point_origin = node.origin + nodeforward * 100;
            return spawn_point_origin;
        }
        return spawn_point_origin_backup;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 3, eflags: 0x0
    // Checksum 0x29670c9f, Offset: 0x2858
    // Size: 0x2a8
    function validate_to_wait_point(zone, new_spawn_point_origin, spawn_point) {
        foreach (loc in zone.a_loc_types[#"wait_location"]) {
            if (isdefined(loc)) {
                wait_point = loc.origin;
                if (isdefined(wait_point)) {
                    new_wait_point = getclosestpointonnavmesh(wait_point, self getpathfindingradius(), 30);
                    if (isdefined(new_spawn_point_origin) && isdefined(new_wait_point)) {
                        ispath = self findpath(new_spawn_point_origin, new_wait_point);
                        if (ispath) {
                            return 1;
                        }
                        level.validation_errors_count++;
                        thread drawvalidation(new_spawn_point_origin, undefined, new_wait_point, undefined, undefined, self.archetype);
                        if (isdefined(self.archetype)) {
                            println("<unknown string>" + function_9e72a96(self.archetype) + "<unknown string>" + new_spawn_point_origin + "<unknown string>" + spawn_point.targetname);
                            iprintlnbold("<unknown string>" + function_9e72a96(self.archetype) + "<unknown string>" + new_spawn_point_origin + "<unknown string>" + spawn_point.targetname);
                        } else {
                            println("<unknown string>" + new_spawn_point_origin + "<unknown string>" + spawn_point.targetname);
                            iprintlnbold("<unknown string>" + new_spawn_point_origin + "<unknown string>" + spawn_point.targetname);
                        }
                        return 0;
                    }
                }
            }
        }
        return 0;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 6, eflags: 0x0
    // Checksum 0xc5cb946e, Offset: 0x2b08
    // Size: 0x456
    function drawvalidation(origin, zone_name, nav_mesh_wait_point, boards_point, zone_node, archetype) {
        if (!isdefined(zone_name)) {
            zone_name = undefined;
        }
        if (!isdefined(nav_mesh_wait_point)) {
            nav_mesh_wait_point = undefined;
        }
        if (!isdefined(boards_point)) {
            boards_point = undefined;
        }
        if (!isdefined(zone_node)) {
            zone_node = undefined;
        }
        if (!isdefined(archetype)) {
            archetype = undefined;
        }
        if (isdefined(archetype)) {
            archetype = function_9e72a96(archetype);
        }
        while (true) {
            if (isdefined(level.toggle_spawner_validation) && level.toggle_spawner_validation) {
                if (!isdefined(origin)) {
                    break;
                }
                if (isdefined(zone_name)) {
                    circle(origin, 32, (1, 0, 0));
                    print3d(origin, "<unknown string>" + zone_name, (1, 1, 1), 1, 0.5);
                } else if (isdefined(nav_mesh_wait_point)) {
                    circle(origin, 32, (0, 0, 1));
                    if (isdefined(archetype)) {
                        print3d(origin, archetype + "<unknown string>" + origin, (1, 1, 1), 1, 0.5);
                    } else {
                        print3d(origin, "<unknown string>" + origin, (1, 1, 1), 1, 0.5);
                    }
                    line(origin, nav_mesh_wait_point, (1, 0, 0));
                    circle(nav_mesh_wait_point, 32, (1, 0, 0));
                    print3d(nav_mesh_wait_point, "<unknown string>" + nav_mesh_wait_point, (1, 1, 1), 1, 0.5);
                } else if (isdefined(boards_point)) {
                    circle(origin, 32, (0, 0, 1));
                    if (isdefined(archetype)) {
                        print3d(origin, archetype + "<unknown string>" + origin, (1, 1, 1), 1, 0.5);
                    } else {
                        print3d(origin, "<unknown string>" + origin, (1, 1, 1), 1, 0.5);
                    }
                    line(origin, boards_point, (1, 0, 0));
                    circle(boards_point, 32, (1, 0, 0));
                    print3d(boards_point, "<unknown string>" + boards_point, (1, 1, 1), 1, 0.5);
                } else if (isdefined(zone_node)) {
                    circle(origin, 32, (1, 0, 0));
                    print3d(origin, "<unknown string>" + (isdefined(zone_node.targetname) ? zone_node.targetname : "<unknown string>") + "<unknown string>" + origin + "<unknown string>", (1, 1, 1), 1, 0.5);
                } else {
                    circle(origin, 32, (0, 0, 1));
                    print3d(origin, "<unknown string>" + origin, (1, 1, 1), 1, 0.5);
                }
            }
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xa8708549, Offset: 0x2f68
    // Size: 0x2d2
    function zone_adjacencies_validation() {
        zombie_devgui_open_sesame();
        while (true) {
            if (isdefined(level.toggle_zone_adjacencies_validation) && level.toggle_zone_adjacencies_validation) {
                if (!isdefined(getplayers()[0].zone_name)) {
                    waitframe(1);
                    continue;
                }
                str_zone = getplayers()[0].zone_name;
                keys = getarraykeys(level.zones);
                offset = 0;
                foreach (key in keys) {
                    if (key === str_zone) {
                        draw_zone_adjacencies_validation(level.zones[key], 2, key);
                        continue;
                    }
                    if (isdefined(level.zones[str_zone].adjacent_zones[key])) {
                        if (level.zones[str_zone].adjacent_zones[key].is_connected) {
                            offset += 10;
                            draw_zone_adjacencies_validation(level.zones[key], 1, key, level.zones[str_zone], offset);
                        } else {
                            draw_zone_adjacencies_validation(level.zones[key], 0, key);
                        }
                        continue;
                    }
                    draw_zone_adjacencies_validation(level.zones[key], 0, key);
                }
                foreach (zone in level.zones) {
                    function_f4669d7b(level.zones, zone);
                }
            }
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 5, eflags: 0x0
    // Checksum 0xd0444b7d, Offset: 0x3248
    // Size: 0x294
    function draw_zone_adjacencies_validation(zone, status, name, current_zone, offset) {
        if (!isdefined(current_zone)) {
            current_zone = undefined;
        }
        if (!isdefined(offset)) {
            offset = 0;
        }
        if (!isdefined(zone.volumes[0]) && !isdefined(zone.nodes[0])) {
            return;
        }
        if (isdefined(zone.nodes[0])) {
            print_origin = zone.nodes[0].origin;
        }
        if (!isdefined(print_origin)) {
            print_origin = zone.volumes[0].origin;
        }
        if (status == 2) {
            circle(print_origin, 30, (0, 1, 0));
            print3d(print_origin, function_9e72a96(name), (0, 1, 0), 1, 0.5);
            return;
        }
        if (status == 1) {
            circle(print_origin, 30, (0, 0, 1));
            print3d(print_origin, function_9e72a96(name), (0, 0, 1), 1, 0.5);
            if (isdefined(current_zone.nodes[0])) {
                print_origin = current_zone.nodes[0].origin;
            }
            if (!isdefined(print_origin)) {
                print_origin = current_zone.volumes[0].origin;
            }
            print3d(print_origin + (0, 20, offset * -1), function_9e72a96(name), (0, 0, 1), 1, 0.5);
            return;
        }
        circle(print_origin, 30, (1, 0, 0));
        print3d(print_origin, function_9e72a96(name), (1, 0, 0), 1, 0.5);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 2, eflags: 0x0
    // Checksum 0x89da69ea, Offset: 0x34e8
    // Size: 0x1e8
    function function_f4669d7b(zones, zone) {
        if (!isdefined(zone.volumes[0]) && !isdefined(zone.nodes[0])) {
            return;
        }
        if (isdefined(zone.nodes[0])) {
            origin = zone.nodes[0].origin;
        }
        if (!isdefined(origin)) {
            origin = zone.volumes[0].origin;
        }
        foreach (var_4c973d00, adjacent in zone.adjacent_zones) {
            adjacent_zone = zones[var_4c973d00];
            if (adjacent_zone.nodes.size && isdefined(adjacent_zone.nodes[0].origin)) {
                var_16c82636 = adjacent_zone.nodes[0].origin;
            }
            if (!isdefined(var_16c82636)) {
                var_16c82636 = adjacent_zone.volumes[0].origin;
            }
            if (adjacent.is_connected) {
                line(origin, var_16c82636, (0, 1, 0), 0, 0);
                continue;
            }
            line(origin, var_16c82636, (1, 0, 0), 0, 0);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x48c306cf, Offset: 0x36d8
    // Size: 0x142
    function zombie_pathing_validation() {
        if (!isdefined(level.zombie_spawners[0])) {
            return;
        }
        if (!isdefined(level.zombie_pathing_validation)) {
            level.zombie_pathing_validation = 1;
        }
        zombie_devgui_open_sesame();
        setdvar(#"zombie_default_max", 0);
        zombie_devgui_goto_round(20);
        wait(2);
        spawner = level.zombie_spawners[0];
        slums_station = (808, -1856, 544);
        enemy = zombie_utility::spawn_zombie(spawner, spawner.targetname);
        wait(1);
        while (isdefined(enemy) && enemy.completed_emerging_into_playable_area !== 1) {
            waitframe(1);
        }
        if (isdefined(enemy)) {
            enemy forceteleport(slums_station);
            enemy.b_ignore_cleanup = 1;
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 3, eflags: 0x0
    // Checksum 0xbf932f6a, Offset: 0x3828
    // Size: 0xf4
    function function_bcc8843e(weapon_name, up, root) {
        util::waittill_can_add_debug_command();
        rootslash = "<unknown string>";
        if (isdefined(root) && root.size) {
            rootslash = root + "<unknown string>";
        }
        uppath = "<unknown string>" + up;
        if (up.size < 1) {
            uppath = "<unknown string>";
        }
        cmd = "<unknown string>" + rootslash + weapon_name + uppath + "<unknown string>" + weapon_name + "<unknown string>";
        adddebugcommand(cmd);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 3, eflags: 0x0
    // Checksum 0xea51778d, Offset: 0x3928
    // Size: 0x264
    function devgui_add_weapon_entry(weapon, root, n_order) {
        weapon_name = getweaponname(weapon);
        if (isdefined(root) && root.size) {
            adddebugcommand("<unknown string>" + root + "<unknown string>" + n_order + "<unknown string>" + weapon_name + "<unknown string>" + weapon_name + "<unknown string>");
            return;
        }
        if (getdvarint(#"zm_debug_attachments", 0)) {
            var_876795bf = weapon.supportedattachments;
            weapon_root = "<unknown string>" + weapon_name + "<unknown string>";
            adddebugcommand(weapon_root + weapon_name + "<unknown string>" + weapon_name + "<unknown string>");
            foreach (var_96bc131f in var_876795bf) {
                if (var_96bc131f != "<unknown string>" && var_96bc131f != "<unknown string>") {
                    util::waittill_can_add_debug_command();
                    var_29c3a74d = weapon_name + "<unknown string>" + var_96bc131f;
                    adddebugcommand(weapon_root + var_29c3a74d + "<unknown string>" + var_29c3a74d + "<unknown string>");
                }
            }
            return;
        }
        adddebugcommand("<unknown string>" + weapon_name + "<unknown string>" + weapon_name + "<unknown string>");
    }

    // Namespace zm_devgui/zm_devgui
    // Params 7, eflags: 0x0
    // Checksum 0x598d8395, Offset: 0x3b98
    // Size: 0x17c
    function devgui_add_weapon(weapon, upgrade, in_box, cost, weaponvo, weaponvoresp, ammo_cost) {
        level endon(#"game_ended");
        if (in_box) {
            level thread function_bcc8843e(getweaponname(weapon), "<unknown string>", "<unknown string>");
        }
        util::waittill_can_add_debug_command();
        if (zm_loadout::is_offhand_weapon(weapon) && !zm_loadout::is_melee_weapon(weapon)) {
            devgui_add_weapon_entry(weapon, "<unknown string>", 2);
            return;
        }
        if (zm_loadout::is_melee_weapon(weapon)) {
            devgui_add_weapon_entry(weapon, "<unknown string>", 3);
            return;
        }
        if (zm_weapons::is_wonder_weapon(weapon)) {
            devgui_add_weapon_entry(weapon, "<unknown string>", 5);
            return;
        }
        devgui_add_weapon_entry(weapon);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x32247b74, Offset: 0x3d20
    // Size: 0x370
    function function_3b534f9c() {
        level.zombie_devgui_gun = getdvarstring(#"hash_1c9225f4f6e82068");
        for (;;) {
            wait(0.1);
            cmd = getdvarstring(#"hash_1c9225f4f6e82068");
            if (isdefined(cmd) && cmd.size > 0) {
                level.zombie_devgui_gun = cmd;
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zombie_devgui_weapon_give(level.zombie_devgui_gun);
                }
                setdvar(#"hash_1c9225f4f6e82068", "<unknown string>");
            }
            wait(0.1);
            cmd = getdvarstring(#"hash_1c9228f4f6e82581");
            if (isdefined(cmd) && cmd.size > 0) {
                level.zombie_devgui_gun = cmd;
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zombie_devgui_weapon_give(level.zombie_devgui_gun);
                }
                setdvar(#"hash_1c9228f4f6e82581", "<unknown string>");
            }
            wait(0.1);
            cmd = getdvarstring(#"hash_1c9227f4f6e823ce");
            if (isdefined(cmd) && cmd.size > 0) {
                level.zombie_devgui_gun = cmd;
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zombie_devgui_weapon_give(level.zombie_devgui_gun);
                }
                setdvar(#"hash_1c9227f4f6e823ce", "<unknown string>");
            }
            wait(0.1);
            cmd = getdvarstring(#"hash_1c922af4f6e828e7");
            if (isdefined(cmd) && cmd.size > 0) {
                level.zombie_devgui_gun = cmd;
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zombie_devgui_weapon_give(level.zombie_devgui_gun);
                }
                setdvar(#"hash_1c922af4f6e828e7", "<unknown string>");
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x98c2f4ad, Offset: 0x4098
    // Size: 0x100
    function zombie_weapon_devgui_think() {
        level.zombie_devgui_gun = getdvarstring(#"zombie_devgui_gun");
        for (;;) {
            wait(0.25);
            cmd = getdvarstring(#"zombie_devgui_gun");
            if (isdefined(cmd) && cmd.size > 0) {
                level.zombie_devgui_gun = cmd;
                array::thread_all(getplayers(), &zombie_devgui_weapon_give, level.zombie_devgui_gun);
                setdvar(#"zombie_devgui_gun", "<unknown string>");
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x4ef46c56, Offset: 0x41a0
    // Size: 0x22c
    function zombie_devgui_weapon_give(weapon_name) {
        split = strtok(function_9e72a96(weapon_name), "<unknown string>");
        switch (split.size) {
        case 1:
        default:
            weapon = getweapon(split[0]);
            break;
        case 2:
            weapon = getweapon(split[0], split[1]);
            break;
        case 3:
            weapon = getweapon(split[0], split[1], split[2]);
            break;
        case 4:
            weapon = getweapon(split[0], split[1], split[2], split[3]);
            break;
        case 5:
            weapon = getweapon(split[0], split[1], split[2], split[3], split[4]);
            break;
        }
        if (zm_loadout::is_melee_weapon(weapon) && isdefined(zm_melee_weapon::find_melee_weapon(weapon))) {
            self zm_melee_weapon::award_melee_weapon(weapon_name);
            return;
        }
        self function_2d4d7fd9(weapon);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xfbbe4370, Offset: 0x43d8
    // Size: 0x7c
    function function_2d4d7fd9(weapon) {
        if (self hasweapon(weapon, 1)) {
            self takeweapon(weapon, 1);
        }
        self thread function_bb54e671(weapon);
        self zm_weapons::weapon_give(weapon);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x4acf7498, Offset: 0x4460
    // Size: 0x174
    function function_bb54e671(weapon) {
        self notify(#"hash_7c6363440c125d8b");
        self endon(#"disconnect", #"hash_7c6363440c125d8b");
        if (!isdefined(self.var_8d5839f4)) {
            self.var_8d5839f4 = [];
        } else if (!isarray(self.var_8d5839f4)) {
            self.var_8d5839f4 = array(self.var_8d5839f4);
        }
        self.var_8d5839f4[self.var_8d5839f4.size] = weapon;
        while (true) {
            self waittill(#"weapon_change_complete");
            foreach (weapon in arraycopy(self.var_8d5839f4)) {
                if (!self hasweapon(weapon)) {
                    arrayremovevalue(self.var_8d5839f4, weapon);
                }
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 5, eflags: 0x0
    // Checksum 0xee4b3732, Offset: 0x45e0
    // Size: 0x164
    function devgui_add_ability(name, upgrade_active_func, stat_name, stat_desired_value, game_end_reset_if_not_achieved) {
        online_game = sessionmodeisonlinegame();
        if (!online_game) {
            return;
        }
        if (!(isdefined(level.devgui_watch_abilities) && level.devgui_watch_abilities)) {
            cmd = "<unknown string>";
            adddebugcommand(cmd);
            cmd = "<unknown string>";
            adddebugcommand(cmd);
            level thread zombie_ability_devgui_think();
            level.devgui_watch_abilities = 1;
        }
        cmd = "<unknown string>" + name + "<unknown string>" + name + "<unknown string>";
        adddebugcommand(cmd);
        cmd = "<unknown string>" + name + "<unknown string>" + name + "<unknown string>";
        adddebugcommand(cmd);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xfda336dc, Offset: 0x4750
    // Size: 0x10
    function zombie_devgui_ability_give(name) {
        
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xc4e84079, Offset: 0x4768
    // Size: 0x10
    function zombie_devgui_ability_take(name) {
        
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x608beb64, Offset: 0x4780
    // Size: 0x208
    function zombie_ability_devgui_think() {
        level.zombie_devgui_give_ability = getdvarstring(#"zombie_devgui_give_ability");
        level.zombie_devgui_take_ability = getdvarstring(#"zombie_devgui_take_ability");
        for (;;) {
            wait(0.25);
            cmd = getdvarstring(#"zombie_devgui_give_ability");
            if (!isdefined(level.zombie_devgui_give_ability) || level.zombie_devgui_give_ability != cmd) {
                if (cmd == "<unknown string>") {
                    level flag::set("<unknown string>");
                } else if (cmd == "<unknown string>") {
                    level flag::clear("<unknown string>");
                } else {
                    level.zombie_devgui_give_ability = cmd;
                    array::thread_all(getplayers(), &zombie_devgui_ability_give, level.zombie_devgui_give_ability);
                }
            }
            wait(0.25);
            cmd = getdvarstring(#"zombie_devgui_take_ability");
            if (!isdefined(level.zombie_devgui_take_ability) || level.zombie_devgui_take_ability != cmd) {
                level.zombie_devgui_take_ability = cmd;
                array::thread_all(getplayers(), &zombie_devgui_ability_take, level.zombie_devgui_take_ability);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 2, eflags: 0x0
    // Checksum 0x28aebe3a, Offset: 0x4990
    // Size: 0xf4
    function zombie_healthbar(pos, dsquared) {
        if (distancesquared(pos, self.origin) > dsquared) {
            return;
        }
        rate = 1;
        if (isdefined(self.maxhealth)) {
            rate = self.health / self.maxhealth;
        }
        color = (1 - rate, rate, 0);
        text = "<unknown string>" + int(self.health);
        print3d(self.origin + (0, 0, 0), text, color, 1, 0.5, 1);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xc1213246, Offset: 0x4a90
    // Size: 0x132
    function devgui_zombie_healthbar() {
        while (true) {
            if (getdvarint(#"scr_zombie_healthbars", 0) == 1) {
                e_player = getplayers()[0];
                if (isalive(e_player)) {
                    a_ai_zombies = getaispeciesarray("<unknown string>", "<unknown string>");
                    foreach (ai_zombie in a_ai_zombies) {
                        ai_zombie zombie_healthbar(e_player.origin, 360000);
                    }
                }
            }
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xca5f9b83, Offset: 0x4bd0
    // Size: 0x86
    function zombie_devgui_watch_input() {
        level flag::wait_till("<unknown string>");
        wait(1);
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            players[i] thread watch_debug_input();
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x8afe681c, Offset: 0x4c60
    // Size: 0x5c
    function damage_player() {
        self val::set(#"damage_player", "<unknown string>", 1);
        self dodamage(self.health / 2, self.origin);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xdc1d6321, Offset: 0x4cc8
    // Size: 0xb4
    function kill_player() {
        self val::set(#"kill_player", "<unknown string>", 1);
        death_from = (randomfloatrange(-20, 20), randomfloatrange(-20, 20), randomfloatrange(-20, 20));
        self dodamage(self.health + 666, self.origin + death_from);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x4b430987, Offset: 0x4d88
    // Size: 0x6c
    function force_drink() {
        wait(0.01);
        build_weapon = getweapon(#"zombie_builder");
        self thread gestures::function_f3e2696f(self, build_weapon, undefined, 2.5, undefined, undefined, undefined);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x17e467c2, Offset: 0x4e00
    // Size: 0x1c
    function zombie_devgui_dpad_none() {
        self thread watch_debug_input();
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x3672dd81, Offset: 0x4e28
    // Size: 0x2c
    function zombie_devgui_dpad_death() {
        self thread watch_debug_input(&kill_player);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x4d5b8c8b, Offset: 0x4e60
    // Size: 0x2c
    function zombie_devgui_dpad_damage() {
        self thread watch_debug_input(&damage_player);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x53718cc9, Offset: 0x4e98
    // Size: 0x2c
    function zombie_devgui_dpad_changeweapon() {
        self thread watch_debug_input(&force_drink);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x614d3496, Offset: 0x4ed0
    // Size: 0xc2
    function watch_debug_input(callback) {
        self endon(#"disconnect");
        self notify(#"watch_debug_input");
        self endon(#"watch_debug_input");
        level.devgui_dpad_watch = 0;
        if (isdefined(callback)) {
            level.devgui_dpad_watch = 1;
            for (;;) {
                if (self actionslottwobuttonpressed()) {
                    self thread [[ callback ]]();
                    while (self actionslottwobuttonpressed()) {
                        waitframe(1);
                    }
                }
                waitframe(1);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x62987c7e, Offset: 0x4fa0
    // Size: 0x2ca8
    function zombie_devgui_think() {
        level notify(#"zombie_devgui_think");
        level endon(#"zombie_devgui_think");
        for (;;) {
            cmd = getdvarstring(#"zombie_devgui");
            switch (cmd) {
            case #"money":
                players = getplayers();
                array::thread_all(players, &zombie_devgui_give_money);
                break;
            case #"player1_money":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zombie_devgui_give_money();
                }
                break;
            case #"player2_money":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zombie_devgui_give_money();
                }
                break;
            case #"player3_money":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zombie_devgui_give_money();
                }
                break;
            case #"player4_money":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zombie_devgui_give_money();
                }
                break;
            case #"moneydown":
                players = getplayers();
                array::thread_all(players, &zombie_devgui_take_money);
                break;
            case #"player1_moneydown":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zombie_devgui_take_money();
                }
                break;
            case #"player2_moneydown":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zombie_devgui_take_money();
                }
                break;
            case #"player3_moneydown":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zombie_devgui_take_money();
                }
                break;
            case #"player4_moneydown":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zombie_devgui_take_money();
                }
                break;
            case #"ammodown":
                players = getplayers();
                array::thread_all(players, &function_dc7312be);
                break;
            case #"hash_428dbd0a89fc5d32":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread function_dc7312be();
                }
                break;
            case #"hash_119220b211e16ba9":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread function_dc7312be();
                }
                break;
            case #"hash_6cdf097974c7bcd0":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread function_dc7312be();
                }
                break;
            case #"hash_5e281497ef267e37":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread function_dc7312be();
                }
                break;
            case #"hash_59a96f9816430398":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zombie_devgui_give_xp(1000);
                }
                break;
            case #"hash_423b4f1fbe6391dd":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zombie_devgui_give_xp(1000);
                }
                break;
            case #"hash_50580bf75ed9e65e":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zombie_devgui_give_xp(1000);
                }
                break;
            case #"hash_4e18caaf131ec443":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zombie_devgui_give_xp(1000);
                }
                break;
            case #"hash_1dec476dd3df3678":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zombie_devgui_give_xp(10000);
                }
                break;
            case #"hash_6e595ff08330f5b7":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zombie_devgui_give_xp(10000);
                }
                break;
            case #"hash_5f82c3562c428cea":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zombie_devgui_give_xp(10000);
                }
                break;
            case #"hash_52e4da7d7d47cf69":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zombie_devgui_give_xp(10000);
                }
                break;
            case #"health":
                array::thread_all(getplayers(), &zombie_devgui_give_health);
                break;
            case #"player1_health":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zombie_devgui_give_health();
                }
                break;
            case #"player2_health":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zombie_devgui_give_health();
                }
                break;
            case #"player3_health":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zombie_devgui_give_health();
                }
                break;
            case #"player4_health":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zombie_devgui_give_health();
                }
                break;
            case #"minhealth":
                array::thread_all(getplayers(), &zombie_devgui_low_health);
                break;
            case #"player1_minhealth":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zombie_devgui_low_health();
                }
                break;
            case #"player2_minhealth":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zombie_devgui_low_health();
                }
                break;
            case #"player3_minhealth":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zombie_devgui_low_health();
                }
                break;
            case #"player4_minhealth":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zombie_devgui_low_health();
                }
                break;
            case #"ammo":
                array::thread_all(getplayers(), &zombie_devgui_toggle_ammo);
                break;
            case #"ignore":
                array::thread_all(getplayers(), &zombie_devgui_toggle_ignore);
                break;
            case #"player1_ignore":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zombie_devgui_toggle_ignore();
                }
                break;
            case #"player2_ignore":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zombie_devgui_toggle_ignore();
                }
                break;
            case #"player3_ignore":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zombie_devgui_toggle_ignore();
                }
                break;
            case #"player4_ignore":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zombie_devgui_toggle_ignore();
                }
                break;
            case #"invul_on":
                zombie_devgui_invulnerable(undefined, 1);
                break;
            case #"invul_off":
                zombie_devgui_invulnerable(undefined, 0);
                break;
            case #"player1_invul_on":
                zombie_devgui_invulnerable(0, 1);
                break;
            case #"player1_invul_off":
                zombie_devgui_invulnerable(0, 0);
                break;
            case #"player2_invul_on":
                zombie_devgui_invulnerable(1, 1);
                break;
            case #"player2_invul_off":
                zombie_devgui_invulnerable(1, 0);
                break;
            case #"player3_invul_on":
                zombie_devgui_invulnerable(2, 1);
                break;
            case #"player3_invul_off":
                zombie_devgui_invulnerable(2, 0);
                break;
            case #"player4_invul_on":
                zombie_devgui_invulnerable(3, 1);
                break;
            case #"player4_invul_off":
                zombie_devgui_invulnerable(3, 0);
                break;
            case #"revive_all":
                array::thread_all(getplayers(), &zombie_devgui_revive);
                break;
            case #"player1_revive":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zombie_devgui_revive();
                }
                break;
            case #"player2_revive":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zombie_devgui_revive();
                }
                break;
            case #"player3_revive":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zombie_devgui_revive();
                }
                break;
            case #"player4_revive":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zombie_devgui_revive();
                }
                break;
            case #"player1_kill":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zombie_devgui_kill();
                }
                break;
            case #"player2_kill":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zombie_devgui_kill();
                }
                break;
            case #"player3_kill":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zombie_devgui_kill();
                }
                break;
            case #"player4_kill":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zombie_devgui_kill();
                }
                break;
            case #"hash_7f4d70c7ded8e94a":
                if (zm_utility::get_story() === 2) {
                    array::random(getplayers()) giveweapon(getweapon(#"homunculus"));
                }
                array::thread_all(getplayers(), &function_8d799ebd);
                break;
            case #"hash_505efa1825e2cb99":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread function_8d799ebd();
                }
                break;
            case #"hash_15233852e3dc3500":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread function_8d799ebd();
                }
                break;
            case #"hash_5cb5edc4858d92f7":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread function_8d799ebd();
                }
                break;
            case #"hash_6d57ff86c541a5fe":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread function_8d799ebd();
                }
                break;
            case #"hash_2c320318aed843b2":
                array::thread_all(getplayers(), &zm_laststand::function_3d685b5f, 100);
                break;
            case #"hash_72783b08840a3ab7":
                players = getplayers();
                if (players.size >= 1) {
                    players[0] thread zm_laststand::function_3d685b5f(100);
                }
                break;
            case #"hash_447712ef48d6ea0":
                players = getplayers();
                if (players.size >= 2) {
                    players[1] thread zm_laststand::function_3d685b5f(100);
                }
                break;
            case #"hash_2a15f60adbba0cf5":
                players = getplayers();
                if (players.size >= 3) {
                    players[2] thread zm_laststand::function_3d685b5f(100);
                }
                break;
            case #"hash_430eb4715f49a5fe":
                players = getplayers();
                if (players.size >= 4) {
                    players[3] thread zm_laststand::function_3d685b5f(100);
                }
                break;
            case #"specialty_quickrevive":
                level.solo_lives_given = 0;
            case #"specialty_vultureaid":
            case #"specialty_showonradar":
            case #"specialty_fastmeleerecovery":
            case #"specialty_electriccherry":
            case #"specialty_deadshot":
            case #"specialty_widowswine":
            case #"specialty_doubletap2":
            case #"specialty_staminup":
            case #"specialty_additionalprimaryweapon":
            case #"specialty_phdflopper":
                zombie_devgui_give_perk(cmd);
                break;
            case #"remove_perks":
                zombie_devgui_take_perks(cmd);
                break;
            case #"lose_points_team":
            case #"insta_kill":
            case #"hero_weapon_power":
            case #"nuke":
            case #"pack_a_punch":
            case #"carpenter":
            case #"double_points":
            case #"tesla":
            case #"minigun":
            case #"extra_lives":
            case #"zmarcade_key":
            case #"bonfire_sale":
            case #"lose_perk":
            case #"bonus_points_player":
            case #"meat_stink":
            case #"empty_clip":
            case #"bonus_points_team":
            case #"full_ammo":
            case #"free_perk":
            case #"random_weapon":
            case #"fire_sale":
                zombie_devgui_give_powerup(cmd, 1);
                break;
            case #"next_bonfire_sale":
            case #"next_extra_lives":
            case #"next_bonus_points_player":
            case #"next_minigun":
            case #"next_lose_points_team":
            case #"next_empty_clip":
            case #"next_full_ammo":
            case #"next_random_weapon":
            case #"next_fire_sale":
            case #"next_pack_a_punch":
            case #"next_bonus_points_team":
            case #"next_lose_perk":
            case #"next_free_perk":
            case #"next_carpenter":
            case #"next_zmarcade_key":
            case #"next_tesla":
            case #"next_hero_weapon_power":
            case #"next_nuke":
            case #"next_meat_stink":
            case #"next_insta_kill":
            case #"next_double_points":
                zombie_devgui_give_powerup(getsubstr(cmd, 5), 0);
                break;
            case #"round":
                zombie_devgui_goto_round(getdvarint(#"scr_zombie_round", 0));
                break;
            case #"round_next":
                zombie_devgui_goto_round(level.round_number + 1);
                break;
            case #"round_prev":
                zombie_devgui_goto_round(level.round_number - 1);
                break;
            case #"chest_warp":
                array::thread_all(getplayers(), &function_4bb7eb36);
                break;
            case #"pap_warp":
                array::thread_all(getplayers(), &function_84f0a909);
                break;
            case #"chest_move":
                if (isdefined(level.chest_accessed)) {
                    level notify(#"devgui_chest_end_monitor");
                    level.var_401aaa92 = 1;
                }
                break;
            case #"chest_never_move":
                if (isdefined(level.chest_accessed)) {
                    level.var_401aaa92 = 0;
                    level thread zombie_devgui_chest_never_move();
                }
                break;
            case #"chest":
                if (isdefined(level.zombie_weapons[getweapon(getdvarstring(#"scr_force_weapon"))])) {
                }
                break;
            case #"give_claymores":
                array::thread_all(getplayers(), &zombie_devgui_give_placeable_mine, getweapon(#"claymore"));
                break;
            case #"give_bouncingbetties":
                array::thread_all(getplayers(), &zombie_devgui_give_placeable_mine, getweapon(#"bouncingbetty"));
                break;
            case #"give_frags":
                array::thread_all(getplayers(), &zombie_devgui_give_frags);
                break;
            case #"give_sticky":
                array::thread_all(getplayers(), &zombie_devgui_give_sticky);
                break;
            case #"give_monkey":
                array::thread_all(getplayers(), &zombie_devgui_give_monkey);
                break;
            case #"give_bhb":
                array::thread_all(getplayers(), &zombie_devgui_give_bhb);
                break;
            case #"give_quantum":
                array::thread_all(getplayers(), &zombie_devgui_give_qed);
                break;
            case #"give_dolls":
                array::thread_all(getplayers(), &zombie_devgui_give_dolls);
                break;
            case #"give_emp_bomb":
                array::thread_all(getplayers(), &zombie_devgui_give_emp_bomb);
                break;
            case #"dog_round":
                zombie_devgui_dog_round(getdvarint(#"scr_zombie_dogs", 0));
                break;
            case #"dog_round_skip":
                zombie_devgui_dog_round_skip();
                break;
            case #"print_variables":
                zombie_devgui_dump_zombie_vars();
                break;
            case #"pack_current_weapon":
                zombie_devgui_pack_current_weapon();
                break;
            case #"hash_f9c9f7dd75a4047":
                function_8c9f2dea();
                break;
            case #"hash_5605531ad17b5408":
                function_b7ef4b8();
                break;
            case #"hash_2dde14d5c2960aea":
                function_9b4d61fa();
                break;
            case #"hash_465e01a5b9f4f28e":
                function_cdc3d061();
                break;
            case #"hash_26abd478093a24d0":
                zombie_devgui_repack_current_weapon();
                break;
            case #"unpack_current_weapon":
                zombie_devgui_unpack_current_weapon();
                break;
            case #"hash_3c2b067b1510118c":
                function_c8949116();
                break;
            case #"hash_769c6d03952dd107":
                function_9d21f44b();
                break;
            case #"hash_68e9afed4aa9c0dd":
                function_e2a97bab();
                break;
            case #"hash_3f4888627ed06269":
                function_1a560cfc();
                break;
            case #"hash_73ecd8731ecdf6b0":
                function_c8ee84ba();
                break;
            case #"hash_49563ad3930e97e4":
                function_c83c6fa();
                break;
            case #"reopt_current_weapon":
                zombie_devgui_reopt_current_weapon();
                break;
            case #"weapon_take_all_fallback":
                zombie_devgui_take_weapons(1);
                break;
            case #"weapon_take_all":
                zombie_devgui_take_weapons(0);
                break;
            case #"weapon_take_current":
                zombie_devgui_take_weapon();
                break;
            case #"power_on":
                level flag::set("<unknown string>");
                level clientfield::set("<unknown string>", 1);
                power_trigs = getentarray("<unknown string>", "<unknown string>");
                foreach (trig in power_trigs) {
                    if (isdefined(trig.script_int)) {
                        level flag::set("<unknown string>" + trig.script_int);
                        level clientfield::set("<unknown string>", trig.script_int + 1);
                    }
                }
                break;
            case #"power_off":
                level flag::clear("<unknown string>");
                level clientfield::set("<unknown string>", 0);
                power_trigs = getentarray("<unknown string>", "<unknown string>");
                foreach (trig in power_trigs) {
                    if (isdefined(trig.script_int)) {
                        level flag::clear("<unknown string>" + trig.script_int);
                        level clientfield::set("<unknown string>", trig.script_int);
                    }
                }
                break;
            case #"zombie_dpad_none":
                array::thread_all(getplayers(), &zombie_devgui_dpad_none);
                break;
            case #"zombie_dpad_damage":
                array::thread_all(getplayers(), &zombie_devgui_dpad_damage);
                break;
            case #"zombie_dpad_kill":
                array::thread_all(getplayers(), &zombie_devgui_dpad_death);
                break;
            case #"zombie_dpad_drink":
                array::thread_all(getplayers(), &zombie_devgui_dpad_changeweapon);
                break;
            case #"director_easy":
                zombie_devgui_director_easy();
                break;
            case #"open_sesame":
                zombie_devgui_open_sesame();
                break;
            case #"allow_fog":
                zombie_devgui_allow_fog();
                break;
            case #"disable_kill_thread_toggle":
                zombie_devgui_disable_kill_thread_toggle();
                break;
            case #"check_kill_thread_every_frame_toggle":
                zombie_devgui_check_kill_thread_every_frame_toggle();
                break;
            case #"kill_thread_test_mode_toggle":
                zombie_devgui_kill_thread_test_mode_toggle();
                break;
            case #"zombie_failsafe_debug_flush":
                level notify(#"zombie_failsafe_debug_flush");
                break;
            case #"rat_navmesh":
                level thread rat::derriesezombiespawnnavmeshtest(0, 0);
                break;
            case #"spawn":
                devgui_zombie_spawn();
                break;
            case #"spawn_dummy":
                function_6f066ef();
                break;
            case #"spawn_near":
                function_7c17d00f();
                break;
            case #"spawn_all":
                devgui_all_spawn();
                break;
            case #"crawler":
                devgui_make_crawler();
                break;
            case #"toggle_show_spawn_locations":
                devgui_toggle_show_spawn_locations();
                break;
            case #"toggle_show_exterior_goals":
                devgui_toggle_show_exterior_goals();
                break;
            case #"draw_traversals":
                zombie_devgui_draw_traversals();
                break;
            case #"dump_traversals":
                function_bbeaa2da();
                break;
            case #"debug_hud":
                array::thread_all(getplayers(), &devgui_debug_hud);
                break;
            case #"reverse_carpenter":
                function_f12b8a34();
                break;
            case #"keyline_always":
                zombie_devgui_keyline_always();
                break;
            case #"hash_1e51dfcdbebdf936":
                robotsupportsovercover_manager_();
                break;
            case #"debug_counts":
                function_92523b12();
                break;
            case #"hash_604a84ea1690f781":
                thread function_3a5618f8();
                break;
            case #"hash_72a10718318ec7ff":
                function_21f1fbf1();
                break;
            case #"debug_navmesh_zone":
                function_e395a714();
                break;
            case #"hash_7fafc507d5398c0b":
                function_567ee21f();
                break;
            case #"hash_3ede275f03a4aa2b":
                function_1762ff96();
                break;
            case #"hash_74f6277a8a40911e":
                function_e5713258();
                break;
            case #"hash_3d647b897ae5dca6":
                function_f298dd5c();
                break;
            case #"hash_3f826ccc785705ba":
                function_26417ea7();
                break;
            case #"hash_683b625d2ace3726":
                function_fb88b423();
                break;
            case #"hash_3f9e70ff9f34194a":
                function_1b531660();
                break;
            case #"hash_4369eeba583c6d2d":
                function_61a7bb28();
                break;
            case #"hash_757311298fe0366e":
                function_184b9c6a();
                break;
            case #"hash_27a8af524430a8e1":
                function_986a2585();
                break;
            case #"hash_5995af694f312813":
                function_faf7abce();
                break;
            case 0:
                break;
            default:
                if (isdefined(level.custom_devgui)) {
                    if (isarray(level.custom_devgui)) {
                        foreach (devgui in level.custom_devgui) {
                            b_result = [[ devgui ]](cmd);
                            if (isdefined(b_result) && b_result) {
                                break;
                            }
                        }
                    } else {
                        [[ level.custom_devgui ]](cmd);
                    }
                }
                break;
            }
            setdvar(#"zombie_devgui", "<unknown string>");
            wait(0.5);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xdf6e2df5, Offset: 0x7c50
    // Size: 0x172
    function add_custom_devgui_callback(callback) {
        if (isdefined(level.custom_devgui)) {
            if (!isarray(level.custom_devgui)) {
                cdgui = level.custom_devgui;
                level.custom_devgui = [];
                if (!isdefined(level.custom_devgui)) {
                    level.custom_devgui = [];
                } else if (!isarray(level.custom_devgui)) {
                    level.custom_devgui = array(level.custom_devgui);
                }
                level.custom_devgui[level.custom_devgui.size] = cdgui;
            }
        } else {
            level.custom_devgui = [];
        }
        if (!isdefined(level.custom_devgui)) {
            level.custom_devgui = [];
        } else if (!isarray(level.custom_devgui)) {
            level.custom_devgui = array(level.custom_devgui);
        }
        level.custom_devgui[level.custom_devgui.size] = callback;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x80ec21bb, Offset: 0x7dd0
    // Size: 0x64
    function devgui_all_spawn() {
        player = util::gethostplayer();
        bot::add_bots(3, player.team);
        wait(0.1);
        zombie_devgui_goto_round(8);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x4d11fefa, Offset: 0x7e40
    // Size: 0x3e
    function devgui_toggle_show_spawn_locations() {
        if (!isdefined(level.toggle_show_spawn_locations)) {
            level.toggle_show_spawn_locations = 1;
            return;
        }
        level.toggle_show_spawn_locations = !level.toggle_show_spawn_locations;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x16017f04, Offset: 0x7e88
    // Size: 0x3e
    function devgui_toggle_show_exterior_goals() {
        if (!isdefined(level.toggle_show_exterior_goals)) {
            level.toggle_show_exterior_goals = 1;
            return;
        }
        level.toggle_show_exterior_goals = !level.toggle_show_exterior_goals;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x784768f3, Offset: 0x7ed0
    // Size: 0x258
    function function_567ee21f() {
        level.var_377c39e4 = !(isdefined(level.var_377c39e4) && level.var_377c39e4);
        if (level.var_377c39e4) {
            foreach (player in level.players) {
                player setclientplayerpushamount(1);
            }
            foreach (ai in getaiteamarray(#"axis")) {
                ai pushplayer(1);
            }
            return;
        }
        foreach (player in level.players) {
            player setclientplayerpushamount(0);
        }
        foreach (ai in getaiteamarray(#"axis")) {
            ai pushplayer(0);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x89fb6019, Offset: 0x8130
    // Size: 0x1ea
    function devgui_zombie_spawn() {
        player = getplayers()[0];
        spawnername = undefined;
        spawnername = "<unknown string>";
        direction = player getplayerangles();
        direction_vec = anglestoforward(direction);
        eye = player geteye();
        scale = 8000;
        direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
        trace = bullettrace(eye, eye + direction_vec, 0, undefined);
        guy = undefined;
        spawners = getentarray(spawnername, "<unknown string>");
        spawner = array::random(spawners);
        guy = zombie_utility::spawn_zombie(spawner);
        if (isdefined(guy)) {
            guy.script_string = "<unknown string>";
            wait(0.5);
            guy forceteleport(trace[#"position"], player.angles + (0, 180, 0));
        }
        return guy;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xef4f4c73, Offset: 0x8328
    // Size: 0xdc
    function function_6f066ef() {
        player = getplayers()[0];
        forward = anglestoforward(player.angles);
        spawn = player.origin + forward * 25;
        guy = devgui_zombie_spawn();
        if (isdefined(guy)) {
            guy pathmode("<unknown string>");
            guy forceteleport(spawn, player.angles);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x9f850ba9, Offset: 0x8410
    // Size: 0xd4
    function function_7c17d00f() {
        player = getplayers()[0];
        forward = anglestoforward(player.angles);
        spawn = player.origin + forward * 100;
        guy = devgui_zombie_spawn();
        if (isdefined(guy)) {
            guy forceteleport(spawn, player.angles + (0, 180, 0));
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xb511df2e, Offset: 0x84f0
    // Size: 0x1d0
    function devgui_make_crawler() {
        zombies = zombie_utility::get_round_enemy_array();
        foreach (zombie in zombies) {
            gib_style = [];
            gib_style[gib_style.size] = "<unknown string>";
            gib_style[gib_style.size] = "<unknown string>";
            gib_style[gib_style.size] = "<unknown string>";
            gib_style = zombie_death::randomize_array(gib_style);
            zombie.a.gib_ref = gib_style[0];
            zombie zombie_utility::function_df5afb5e(1);
            zombie allowedstances("<unknown string>");
            zombie setphysparams(15, 0, 24);
            zombie allowpitchangle(1);
            zombie setpitchorient();
            health = zombie.health;
            health *= 0.1;
            zombie thread zombie_death::do_gib();
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x3cf4b58b, Offset: 0x86c8
    // Size: 0x3e4
    function zombie_devgui_open_sesame() {
        setdvar(#"zombie_unlock_all", 1);
        level flag::set("<unknown string>");
        level clientfield::set("<unknown string>", 1);
        power_trigs = getentarray("<unknown string>", "<unknown string>");
        foreach (trig in power_trigs) {
            if (isdefined(trig.script_int)) {
                level flag::set("<unknown string>" + trig.script_int);
                level clientfield::set("<unknown string>", trig.script_int + 1);
            }
        }
        players = getplayers();
        array::thread_all(players, &zombie_devgui_give_money);
        zombie_doors = getentarray("<unknown string>", "<unknown string>");
        for (i = 0; i < zombie_doors.size; i++) {
            if (!(isdefined(zombie_doors[i].has_been_opened) && zombie_doors[i].has_been_opened)) {
                zombie_doors[i] notify(#"trigger", {#activator:players[0]});
            }
            if (isdefined(zombie_doors[i].power_door_ignore_flag_wait) && zombie_doors[i].power_door_ignore_flag_wait) {
                zombie_doors[i] notify(#"power_on");
            }
            waitframe(1);
        }
        zombie_airlock_doors = getentarray("<unknown string>", "<unknown string>");
        for (i = 0; i < zombie_airlock_doors.size; i++) {
            zombie_airlock_doors[i] notify(#"trigger", {#activator:players[0]});
            waitframe(1);
        }
        zombie_debris = getentarray("<unknown string>", "<unknown string>");
        for (i = 0; i < zombie_debris.size; i++) {
            if (isdefined(zombie_debris[i])) {
                zombie_debris[i] notify(#"trigger", {#activator:players[0]});
            }
            waitframe(1);
        }
        level notify(#"open_sesame");
        wait(1);
        setdvar(#"zombie_unlock_all", 0);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xd2eb060b, Offset: 0x8ab8
    // Size: 0xa4
    function any_player_in_noclip() {
        foreach (player in getplayers()) {
            if (player isinmovemode("<unknown string>", "<unknown string>")) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x14b6d01f, Offset: 0x8b68
    // Size: 0x168
    function diable_fog_in_noclip() {
        level.fog_disabled_in_noclip = 1;
        level endon(#"allowfoginnoclip");
        level flag::wait_till("<unknown string>");
        while (true) {
            while (!any_player_in_noclip()) {
                wait(1);
            }
            setdvar(#"scr_fog_disable", 1);
            setdvar(#"r_fog_disable", 1);
            if (isdefined(level.culldist)) {
                setculldist(0);
            }
            while (any_player_in_noclip()) {
                wait(1);
            }
            setdvar(#"scr_fog_disable", 0);
            setdvar(#"r_fog_disable", 0);
            if (isdefined(level.culldist)) {
                setculldist(level.culldist);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x6fef1827, Offset: 0x8cd8
    // Size: 0xac
    function zombie_devgui_allow_fog() {
        if (isdefined(level.fog_disabled_in_noclip) && level.fog_disabled_in_noclip) {
            level notify(#"allowfoginnoclip");
            level.fog_disabled_in_noclip = 0;
            setdvar(#"scr_fog_disable", 0);
            setdvar(#"r_fog_disable", 0);
            return;
        }
        thread diable_fog_in_noclip();
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x8dce3184, Offset: 0x8d90
    // Size: 0x34
    function zombie_devgui_give_money() {
        level.devcheater = 1;
        self zm_score::add_to_player_score(100000);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x41fb37a5, Offset: 0x8dd0
    // Size: 0xbc
    function zombie_devgui_take_money() {
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        if (self.score > 100) {
            self zm_score::player_reduce_points("<unknown string>");
            return;
        }
        self zm_score::player_reduce_points("<unknown string>");
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x143802e7, Offset: 0x8e98
    // Size: 0x1ac
    function function_dc7312be() {
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        if (!self zm_utility::is_drinking()) {
            weapon = self getcurrentweapon();
            if (weapon != level.weaponnone && weapon != level.weaponzmfists && !(isdefined(weapon.isflourishweapon) && weapon.isflourishweapon)) {
                ammo = self getweaponammostock(weapon);
                max = weapon.maxammo;
                if (isdefined(max) && isdefined(ammo)) {
                    if (ammo > max / 10) {
                        self setweaponammostock(weapon, int(ammo / 2));
                        return;
                    }
                    self setweaponammostock(weapon, 0);
                }
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x91852de6, Offset: 0x9050
    // Size: 0xb4
    function zombie_devgui_give_xp(amount) {
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        self addrankxp("<unknown string>", self.currentweapon, undefined, undefined, 1, amount / 50);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xbf3c3664, Offset: 0x9110
    // Size: 0x174
    function zombie_devgui_turn_player(index) {
        players = getplayers();
        if (!isdefined(index) || index >= players.size) {
            player = players[0];
        } else {
            player = players[index];
        }
        assert(isdefined(player));
        assert(isplayer(player));
        assert(isalive(player));
        level.devcheater = 1;
        if (player hasperk(#"specialty_playeriszombie")) {
            println("<unknown string>");
            player zm_turned::turn_to_human();
            return;
        }
        println("<unknown string>");
        player zm_turned::turn_to_zombie();
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xf0749d8d, Offset: 0x9290
    // Size: 0x1e4
    function function_4bb7eb36() {
        entnum = self getentitynumber();
        chest = level.chests[level.chest_index];
        origin = chest.zbarrier.origin;
        forward = anglestoforward(chest.zbarrier.angles);
        right = anglestoright(chest.zbarrier.angles);
        var_21f5823e = vectortoangles(right);
        plorigin = origin - 48 * right;
        switch (entnum) {
        case 0:
            plorigin += 16 * right;
            break;
        case 1:
            plorigin += 16 * forward;
            break;
        case 2:
            plorigin -= 16 * right;
            break;
        case 3:
            plorigin -= 16 * forward;
            break;
        }
        self setorigin(plorigin);
        self setplayerangles(var_21f5823e);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x2f128ae2, Offset: 0x9480
    // Size: 0x1fc
    function function_84f0a909() {
        entnum = self getentitynumber();
        paps = getentarray("<unknown string>", "<unknown string>");
        pap = paps[0];
        if (!isdefined(pap)) {
            return;
        }
        origin = pap.origin;
        forward = anglestoforward(pap.angles);
        right = anglestoright(pap.angles);
        var_21f5823e = vectortoangles(right * -1);
        plorigin = origin + 72 * right;
        switch (entnum) {
        case 0:
            plorigin -= 16 * right;
            break;
        case 1:
            plorigin += 16 * forward;
            break;
        case 2:
            plorigin += 16 * right;
            break;
        case 3:
            plorigin -= 16 * forward;
            break;
        }
        self setorigin(plorigin);
        self setplayerangles(var_21f5823e);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xcdebdee7, Offset: 0x9688
    // Size: 0x2c
    function zombie_devgui_cool_jetgun() {
        if (isdefined(level.zm_devgui_jetgun_never_overheat)) {
            self thread [[ level.zm_devgui_jetgun_never_overheat ]]();
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x238af8d4, Offset: 0x96c0
    // Size: 0x8e
    function zombie_devgui_preserve_turbines() {
        self endon(#"disconnect");
        self notify(#"preserve_turbines");
        self endon(#"preserve_turbines");
        if (!(isdefined(self.preserving_turbines) && self.preserving_turbines)) {
            self.preserving_turbines = 1;
            while (true) {
                self.turbine_health = 1200;
                wait(1);
            }
        }
        self.preserving_turbines = 0;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xe4c051e2, Offset: 0x9758
    // Size: 0x156
    function zombie_devgui_equipment_stays_healthy() {
        self endon(#"disconnect");
        self notify(#"preserve_equipment");
        self endon(#"preserve_equipment");
        if (!(isdefined(self.preserving_equipment) && self.preserving_equipment)) {
            self.preserving_equipment = 1;
            while (true) {
                self.equipment_damage = [];
                self.shielddamagetaken = 0;
                if (isdefined(level.destructible_equipment)) {
                    foreach (equip in level.destructible_equipment) {
                        if (isdefined(equip)) {
                            equip.shielddamagetaken = 0;
                            equip.damage = 0;
                            equip.headchopper_kills = 0;
                            equip.springpad_kills = 0;
                            equip.subwoofer_kills = 0;
                        }
                    }
                }
                wait(0.1);
            }
        }
        self.preserving_equipment = 0;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x12ff7f51, Offset: 0x98b8
    // Size: 0x12
    function zombie_devgui_disown_equipment() {
        self.deployed_equipment = [];
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x67082c7a, Offset: 0x98d8
    // Size: 0xb4
    function zombie_devgui_equipment_give(equipment) {
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        level.devcheater = 1;
        if (zm_equipment::is_included(equipment)) {
            self zm_equipment::buy(equipment);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xcfe7c6c5, Offset: 0x9998
    // Size: 0x156
    function zombie_devgui_give_placeable_mine(weapon) {
        self endon(#"disconnect");
        self notify(#"give_planted_grenade_thread");
        self endon(#"give_planted_grenade_thread");
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        level.devcheater = 1;
        if (!zm_loadout::is_placeable_mine(weapon)) {
            return;
        }
        if (isdefined(self zm_loadout::get_player_placeable_mine())) {
            self takeweapon(self zm_loadout::get_player_placeable_mine());
        }
        self thread zm_placeable_mine::setup_for_player(weapon);
        while (true) {
            self givemaxammo(weapon);
            wait(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xcdfe86aa, Offset: 0x9af8
    // Size: 0x15e
    function zombie_devgui_give_claymores() {
        self endon(#"disconnect");
        self notify(#"give_planted_grenade_thread");
        self endon(#"give_planted_grenade_thread");
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        level.devcheater = 1;
        if (isdefined(self zm_loadout::get_player_placeable_mine())) {
            self takeweapon(self zm_loadout::get_player_placeable_mine());
        }
        wpn_type = zm_placeable_mine::get_first_available();
        if (wpn_type != level.weaponnone) {
            self thread zm_placeable_mine::setup_for_player(wpn_type);
        }
        while (true) {
            self givemaxammo(wpn_type);
            wait(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xf4284224, Offset: 0x9c60
    // Size: 0x156
    function zombie_devgui_give_lethal(weapon) {
        self endon(#"disconnect");
        self notify(#"give_lethal_grenade_thread");
        self endon(#"give_lethal_grenade_thread");
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        level.devcheater = 1;
        if (isdefined(self zm_loadout::get_player_lethal_grenade())) {
            self takeweapon(self zm_loadout::get_player_lethal_grenade());
        }
        self giveweapon(weapon);
        self zm_loadout::set_player_lethal_grenade(weapon);
        while (true) {
            self givemaxammo(weapon);
            wait(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xec9ce825, Offset: 0x9dc0
    // Size: 0x3c
    function zombie_devgui_give_frags() {
        zombie_devgui_give_lethal(getweapon(#"eq_frag_grenade"));
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x73de0669, Offset: 0x9e08
    // Size: 0x3c
    function zombie_devgui_give_sticky() {
        zombie_devgui_give_lethal(getweapon(#"sticky_grenade"));
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xd719d26a, Offset: 0x9e50
    // Size: 0x15e
    function zombie_devgui_give_monkey() {
        self endon(#"disconnect");
        self notify(#"give_tactical_grenade_thread");
        self endon(#"give_tactical_grenade_thread");
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        level.devcheater = 1;
        if (isdefined(self zm_loadout::get_player_tactical_grenade())) {
            self takeweapon(self zm_loadout::get_player_tactical_grenade());
        }
        if (isdefined(level.zombiemode_devgui_cymbal_monkey_give)) {
            self [[ level.zombiemode_devgui_cymbal_monkey_give ]]();
            while (true) {
                self givemaxammo(getweapon(#"cymbal_monkey"));
                wait(1);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x8bcb07a2, Offset: 0x9fb8
    // Size: 0x146
    function zombie_devgui_give_bhb() {
        self endon(#"disconnect");
        self notify(#"give_tactical_grenade_thread");
        self endon(#"give_tactical_grenade_thread");
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        level.devcheater = 1;
        if (isdefined(self zm_loadout::get_player_tactical_grenade())) {
            self takeweapon(self zm_loadout::get_player_tactical_grenade());
        }
        if (isdefined(level.var_5076c574)) {
            self [[ level.var_5076c574 ]]();
            while (true) {
                self givemaxammo(level.w_black_hole_bomb);
                wait(1);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x99992061, Offset: 0xa108
    // Size: 0x146
    function zombie_devgui_give_qed() {
        self endon(#"disconnect");
        self notify(#"give_tactical_grenade_thread");
        self endon(#"give_tactical_grenade_thread");
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        level.devcheater = 1;
        if (isdefined(self zm_loadout::get_player_tactical_grenade())) {
            self takeweapon(self zm_loadout::get_player_tactical_grenade());
        }
        if (isdefined(level.var_3079bbd7)) {
            self [[ level.var_3079bbd7 ]]();
            while (true) {
                self givemaxammo(level.w_quantum_bomb);
                wait(1);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x140ef41c, Offset: 0xa258
    // Size: 0x146
    function zombie_devgui_give_dolls() {
        self endon(#"disconnect");
        self notify(#"give_tactical_grenade_thread");
        self endon(#"give_tactical_grenade_thread");
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        level.devcheater = 1;
        if (isdefined(self zm_loadout::get_player_tactical_grenade())) {
            self takeweapon(self zm_loadout::get_player_tactical_grenade());
        }
        if (isdefined(level.var_42cebfa6)) {
            self [[ level.var_42cebfa6 ]]();
            while (true) {
                self givemaxammo(level.w_nesting_dolls);
                wait(1);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xde309a5c, Offset: 0xa3a8
    // Size: 0x15e
    function zombie_devgui_give_emp_bomb() {
        self endon(#"disconnect");
        self notify(#"give_tactical_grenade_thread");
        self endon(#"give_tactical_grenade_thread");
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        level.devcheater = 1;
        if (isdefined(self zm_loadout::get_player_tactical_grenade())) {
            self takeweapon(self zm_loadout::get_player_tactical_grenade());
        }
        if (isdefined(level.var_153af402)) {
            self [[ level.var_153af402 ]]();
            while (true) {
                self givemaxammo(getweapon(#"emp_grenade"));
                wait(1);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 2, eflags: 0x0
    // Checksum 0x40bd1121, Offset: 0xa510
    // Size: 0x104
    function zombie_devgui_invulnerable(playerindex, onoff) {
        players = getplayers();
        if (!isdefined(playerindex)) {
            for (i = 0; i < players.size; i++) {
                zombie_devgui_invulnerable(i, onoff);
            }
            return;
        }
        if (players.size > playerindex) {
            if (onoff) {
                players[playerindex] val::set(#"zombie_devgui", "<unknown string>", 0);
                return;
            }
            players[playerindex] val::reset(#"zombie_devgui", "<unknown string>");
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x66dec21a, Offset: 0xa620
    // Size: 0x124
    function zombie_devgui_kill() {
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        self val::set(#"devgui_kill", "<unknown string>", 1);
        death_from = (randomfloatrange(-20, 20), randomfloatrange(-20, 20), randomfloatrange(-20, 20));
        self dodamage(self.health + 666, self.origin + death_from);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x55c9b9b, Offset: 0xa750
    // Size: 0x2e8
    function zombie_devgui_toggle_ammo() {
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        self notify(#"devgui_toggle_ammo");
        self endon(#"devgui_toggle_ammo");
        self.ammo4evah = !(isdefined(self.ammo4evah) && self.ammo4evah);
        while (isdefined(self) && self.ammo4evah) {
            if (!self zm_utility::is_drinking()) {
                weapon = self getcurrentweapon();
                if (weapon != level.weaponnone && weapon != level.weaponzmfists && !(isdefined(weapon.isflourishweapon) && weapon.isflourishweapon)) {
                    self setweaponoverheating(0, 0);
                    max = weapon.maxammo;
                    if (isdefined(max)) {
                        self setweaponammostock(weapon, max);
                    }
                    if (isdefined(self zm_loadout::get_player_tactical_grenade())) {
                        self givemaxammo(self zm_loadout::get_player_tactical_grenade());
                    }
                    if (isdefined(self zm_loadout::get_player_lethal_grenade())) {
                        self givemaxammo(self zm_loadout::get_player_lethal_grenade());
                    }
                }
                for (i = 0; i < 3; i++) {
                    if (isdefined(self._gadgets_player[i]) && self hasweapon(self._gadgets_player[i])) {
                        if (!self util::gadget_is_in_use(i) && self gadgetcharging(i)) {
                            self gadgetpowerset(i, self._gadgets_player[i].gadget_powermax);
                        }
                    }
                }
            }
            wait(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x3bf28487, Offset: 0xaa40
    // Size: 0x134
    function zombie_devgui_toggle_ignore() {
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        if (!isdefined(self.devgui_ignoreme)) {
            self.devgui_ignoreme = 0;
        }
        self.devgui_ignoreme = !self.devgui_ignoreme;
        if (self.devgui_ignoreme) {
            self val::set(#"devgui", "<unknown string>");
        } else {
            self val::reset(#"devgui", "<unknown string>");
        }
        if (self.ignoreme) {
            setdvar(#"ai_showfailedpaths", 0);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x115d2e97, Offset: 0xab80
    // Size: 0x6e
    function zombie_devgui_revive() {
        assert(isdefined(self));
        assert(isplayer(self));
        if (laststand::player_is_in_laststand()) {
            self notify(#"auto_revive");
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x86c0e906, Offset: 0xabf8
    // Size: 0x12c
    function zombie_devgui_give_health() {
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        self notify(#"devgui_health");
        self endon(#"devgui_health", #"disconnect", #"death");
        level.devcheater = 1;
        while (true) {
            self.maxhealth = 100000;
            self.health = 100000;
            self waittill(#"player_revived", #"perk_used", #"spawned_player");
            wait(2);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x5de2700b, Offset: 0xad30
    // Size: 0x124
    function zombie_devgui_low_health() {
        assert(isdefined(self));
        assert(isplayer(self));
        assert(isalive(self));
        self notify(#"devgui_health");
        self endon(#"devgui_health", #"disconnect", #"death");
        level.devcheater = 1;
        while (true) {
            self.maxhealth = 10;
            self.health = 10;
            self waittill(#"player_revived", #"perk_used", #"spawned_player");
            wait(2);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x3e245252, Offset: 0xae60
    // Size: 0x136
    function zombie_devgui_give_perk(perk) {
        vending_machines = zm_perks::get_perk_machines();
        level.devcheater = 1;
        if (vending_machines.size < 1) {
            return;
        }
        foreach (player in getplayers()) {
            for (i = 0; i < vending_machines.size; i++) {
                if (vending_machines[i].script_noteworthy == perk) {
                    vending_machines[i] notify(#"trigger", {#activator:player});
                    break;
                }
            }
            wait(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x51e2d2b1, Offset: 0xafa0
    // Size: 0x19e
    function zombie_devgui_take_perks(cmd) {
        vending_machines = zm_perks::get_perk_machines();
        perks = [];
        for (i = 0; i < vending_machines.size; i++) {
            perk = vending_machines[i].script_noteworthy;
            if (isdefined(self.perk_purchased) && self.perk_purchased == perk) {
                continue;
            }
            perks[perks.size] = perk;
        }
        foreach (player in getplayers()) {
            foreach (perk in perks) {
                perk_str = perk + "<unknown string>";
                player notify(perk_str);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xb15df5fa, Offset: 0xb148
    // Size: 0x34
    function function_fd6c1b3c(cmd) {
        if (isdefined(level.perk_random_devgui_callback)) {
            self [[ level.perk_random_devgui_callback ]](cmd);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xb2e372da, Offset: 0xb188
    // Size: 0x34
    function function_82f7d6a1(cmd) {
        if (isdefined(level.perk_random_devgui_callback)) {
            self [[ level.perk_random_devgui_callback ]](cmd);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xd21bba1e, Offset: 0xb1c8
    // Size: 0x34
    function function_68bd1e17(cmd) {
        if (isdefined(level.perk_random_devgui_callback)) {
            self [[ level.perk_random_devgui_callback ]](cmd);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x28b85622, Offset: 0xb208
    // Size: 0x34
    function function_7565dd74(cmd) {
        if (isdefined(level.perk_random_devgui_callback)) {
            self [[ level.perk_random_devgui_callback ]](cmd);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x63a71863, Offset: 0xb248
    // Size: 0x34
    function function_87979c2c(cmd) {
        if (isdefined(level.perk_random_devgui_callback)) {
            self [[ level.perk_random_devgui_callback ]](cmd);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x57b09077, Offset: 0xb288
    // Size: 0x34
    function function_2cbcab61(cmd) {
        if (isdefined(level.perk_random_devgui_callback)) {
            self [[ level.perk_random_devgui_callback ]](cmd);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x8b47f4f1, Offset: 0xb2c8
    // Size: 0x34
    function function_18fc6a29(cmd) {
        if (isdefined(level.perk_random_devgui_callback)) {
            self [[ level.perk_random_devgui_callback ]](cmd);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 3, eflags: 0x0
    // Checksum 0xb5643b5a, Offset: 0xb308
    // Size: 0x2a4
    function zombie_devgui_give_powerup(powerup_name, now, origin) {
        player = getplayers()[0];
        found = 0;
        level.devcheater = 1;
        if (isdefined(now) && !now) {
            for (i = 0; i < level.zombie_powerup_array.size; i++) {
                if (level.zombie_powerup_array[i] == powerup_name) {
                    level.zombie_powerup_index = i;
                    found = 1;
                    break;
                }
            }
            if (!found) {
                return;
            }
            level.zombie_devgui_power = 1;
            zombie_utility::set_zombie_var(#"zombie_drop_item", 1);
            level.powerup_drop_count = 0;
            return;
        }
        direction = player getplayerangles();
        direction_vec = anglestoforward(direction);
        eye = player geteye();
        scale = 8000;
        direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
        trace = bullettrace(eye, eye + direction_vec, 0, undefined);
        if (!isdefined(level.zombie_powerups) || !isdefined(level.zombie_powerups[powerup_name])) {
            return;
        }
        if (isdefined(origin)) {
            level thread zm_powerups::specific_powerup_drop(powerup_name, origin, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
            return;
        }
        level thread zm_powerups::specific_powerup_drop(powerup_name, trace[#"position"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 2, eflags: 0x0
    // Checksum 0xc7afd5b9, Offset: 0xb5b8
    // Size: 0x20c
    function zombie_devgui_give_powerup_player(powerup_name, now) {
        player = self;
        found = 0;
        level.devcheater = 1;
        if (isdefined(now) && !now) {
            for (i = 0; i < level.zombie_powerup_array.size; i++) {
                if (level.zombie_powerup_array[i] == powerup_name) {
                    level.zombie_powerup_index = i;
                    found = 1;
                    break;
                }
            }
            if (!found) {
                return;
            }
            level.zombie_devgui_power = 1;
            zombie_utility::set_zombie_var(#"zombie_drop_item", 1);
            level.powerup_drop_count = 0;
            return;
        }
        direction = player getplayerangles();
        direction_vec = anglestoforward(direction);
        eye = player geteye();
        scale = 8000;
        direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
        trace = bullettrace(eye, eye + direction_vec, 0, undefined);
        level thread zm_powerups::specific_powerup_drop(powerup_name, trace[#"position"], undefined, undefined, player);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x78434c5e, Offset: 0xb7d0
    // Size: 0x19e
    function zombie_devgui_goto_round(target_round) {
        player = getplayers()[0];
        if (target_round < 1) {
            target_round = 1;
        }
        level.devcheater = 1;
        level.zombie_total = 0;
        level.zombie_health = zombie_utility::ai_calculate_health(zombie_utility::get_zombie_var(#"zombie_health_start"), target_round);
        zm_round_logic::set_round_number(target_round - 1);
        level notify(#"kill_round");
        wait(1);
        zombies = getaiteamarray(level.zombie_team);
        if (isdefined(zombies)) {
            for (i = 0; i < zombies.size; i++) {
                if (isdefined(zombies[i].ignore_devgui_death) && zombies[i].ignore_devgui_death) {
                    continue;
                }
                zombies[i] dodamage(zombies[i].health + 666, zombies[i].origin);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xfe9f142a, Offset: 0xb978
    // Size: 0x34
    function zombie_devgui_monkey_round() {
        if (isdefined(level.var_141b0a3a)) {
            zombie_devgui_goto_round(level.var_141b0a3a);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x2c61f62f, Offset: 0xb9b8
    // Size: 0x34
    function zombie_devgui_thief_round() {
        if (isdefined(level.var_3a35aed4)) {
            zombie_devgui_goto_round(level.var_3a35aed4);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x7104dca3, Offset: 0xb9f8
    // Size: 0xec
    function zombie_devgui_dog_round(num_dogs) {
        if (!isdefined(level.var_57c1626e) || !level.var_57c1626e) {
            return;
        }
        if (!isdefined(level.var_a3f67fc2) || !level.var_a3f67fc2) {
            return;
        }
        if (!isdefined(level.enemy_dog_spawns) || level.enemy_dog_spawns.size < 1) {
            return;
        }
        if (!level flag::get("<unknown string>")) {
            setdvar(#"force_dogs", num_dogs);
        }
        zombie_devgui_goto_round(level.round_number + 1);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x1db515ea, Offset: 0xbaf0
    // Size: 0x34
    function zombie_devgui_dog_round_skip() {
        if (isdefined(level.next_dog_round)) {
            zombie_devgui_goto_round(level.next_dog_round);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xf26b683b, Offset: 0xbb30
    // Size: 0xfc
    function zombie_devgui_dump_zombie_vars() {
        if (!isdefined(level.zombie_vars)) {
            return;
        }
        if (level.zombie_vars.size > 0) {
            println("<unknown string>");
        } else {
            return;
        }
        var_names = getarraykeys(level.zombie_vars);
        for (i = 0; i < level.zombie_vars.size; i++) {
            key = var_names[i];
            println(key + "<unknown string>" + zombie_utility::get_zombie_var(key));
        }
        println("<unknown string>");
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xb23469f5, Offset: 0xbc38
    // Size: 0x1a6
    function zombie_devgui_pack_current_weapon() {
        players = getplayers();
        reviver = players[0];
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            if (!players[i] laststand::player_is_in_laststand() && players[i].sessionstate !== "<unknown string>") {
                weap = players[i] getcurrentweapon();
                weapon = players[i] get_upgrade(weap);
                if (isdefined(weapon)) {
                    players[i] takeweapon(weap);
                    weapon = players[i] zm_weapons::give_build_kit_weapon(weapon);
                    players[i] thread aat::remove(weapon);
                    players[i] zm_weapons::function_7c5dd4bd(weapon);
                    players[i] switchtoweapon(weapon);
                }
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xd8b81b1, Offset: 0xbde8
    // Size: 0x156
    function zombie_devgui_repack_current_weapon() {
        players = getplayers();
        reviver = players[0];
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            if (!players[i] laststand::player_is_in_laststand() && players[i].sessionstate !== "<unknown string>") {
                weap = players[i] getcurrentweapon();
                if (isdefined(level.aat_in_use) && level.aat_in_use && zm_weapons::weapon_supports_aat(weap)) {
                    players[i] thread aat::acquire(weap);
                    players[i] zm_pap_util::repack_weapon(weap, 4);
                }
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xb11381c1, Offset: 0xbf48
    // Size: 0x176
    function zombie_devgui_unpack_current_weapon() {
        players = getplayers();
        reviver = players[0];
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            if (!players[i] laststand::player_is_in_laststand() && players[i].sessionstate !== "<unknown string>") {
                weap = players[i] getcurrentweapon();
                weapon = zm_weapons::get_base_weapon(weap);
                players[i] takeweapon(weap);
                weapon = players[i] zm_weapons::give_build_kit_weapon(weapon);
                players[i] zm_weapons::function_7c5dd4bd(weapon);
                players[i] switchtoweapon(weapon);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 2, eflags: 0x0
    // Checksum 0xcbcaaf2, Offset: 0xc0c8
    // Size: 0x74
    function function_55c6dedd(str_weapon, xp) {
        if (!isdefined(str_weapon) || !level.onlinegame) {
            return;
        }
        if (0 > xp) {
            xp = 0;
        }
        self stats::set_stat(#"ranked_item_stats", str_weapon, #"xp", xp);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x8673b935, Offset: 0xc148
    // Size: 0xf6
    function function_335cdac(weapon) {
        gunlevels = [];
        table = popups::devgui_notif_getgunleveltablename();
        weapon_name = weapon.rootweapon.name;
        for (i = 0; i < 15; i++) {
            var_4a3def14 = tablelookup(table, 2, weapon_name, 0, i, 1);
            if ("<unknown string>" == var_4a3def14) {
                break;
            }
            gunlevels[i] = int(var_4a3def14);
        }
        return gunlevels;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 2, eflags: 0x0
    // Checksum 0x12633b62, Offset: 0xc248
    // Size: 0x88
    function function_72e79f3b(weapon, var_56c1b8d) {
        xp = 0;
        gunlevels = function_335cdac(weapon);
        if (gunlevels.size) {
            xp = gunlevels[gunlevels.size - 1];
            if (var_56c1b8d < gunlevels.size) {
                xp = gunlevels[var_56c1b8d];
            }
        }
        return xp;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x43aef60e, Offset: 0xc2d8
    // Size: 0x64
    function function_af7d932(weapon) {
        xp = 0;
        gunlevels = function_335cdac(weapon);
        if (gunlevels.size) {
            xp = gunlevels[gunlevels.size - 1];
        }
        return xp;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xa54b50bd, Offset: 0xc348
    // Size: 0x12e
    function function_c8949116() {
        players = getplayers();
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player laststand::player_is_in_laststand()) {
                weapon = player getcurrentweapon();
                itemindex = getbaseweaponitemindex(weapon);
                var_56c1b8d = player getcurrentgunrank(itemindex);
                xp = function_72e79f3b(weapon, var_56c1b8d);
                player function_55c6dedd(weapon.name, xp);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x41d52991, Offset: 0xc480
    // Size: 0x12e
    function function_9d21f44b() {
        players = getplayers();
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player laststand::player_is_in_laststand()) {
                weapon = player getcurrentweapon();
                itemindex = getbaseweaponitemindex(weapon);
                var_56c1b8d = player getcurrentgunrank(itemindex);
                xp = function_72e79f3b(weapon, var_56c1b8d);
                player function_55c6dedd(weapon.name, xp - 50);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x62e369c5, Offset: 0xc5b8
    // Size: 0x10e
    function function_e2a97bab() {
        players = getplayers();
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player laststand::player_is_in_laststand()) {
                weapon = player getcurrentweapon();
                itemindex = getbaseweaponitemindex(weapon);
                xp = function_af7d932(weapon);
                player function_55c6dedd(weapon.name, xp);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x9947fa85, Offset: 0xc6d0
    // Size: 0xee
    function function_1a560cfc() {
        players = getplayers();
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player laststand::player_is_in_laststand()) {
                weapon = player getcurrentweapon();
                itemindex = getbaseweaponitemindex(weapon);
                player function_55c6dedd(weapon.name, 0);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xc2291b56, Offset: 0xc7c8
    // Size: 0x150
    function function_c8ee84ba() {
        players = getplayers();
        level.devcheater = 1;
        a_weapons = enumerateweapons("<unknown string>");
        for (weapon_index = 0; weapon_index < a_weapons.size; weapon_index++) {
            weapon = a_weapons[weapon_index];
            itemindex = getbaseweaponitemindex(weapon);
            if (!itemindex) {
                continue;
            }
            xp = function_af7d932(weapon);
            for (i = 0; i < players.size; i++) {
                player = players[i];
                if (!player laststand::player_is_in_laststand()) {
                    player function_55c6dedd(weapon.name, xp);
                }
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x49b128d3, Offset: 0xc920
    // Size: 0x138
    function function_c83c6fa() {
        players = getplayers();
        level.devcheater = 1;
        a_weapons = enumerateweapons("<unknown string>");
        for (weapon_index = 0; weapon_index < a_weapons.size; weapon_index++) {
            weapon = a_weapons[weapon_index];
            itemindex = getbaseweaponitemindex(weapon);
            if (!itemindex) {
                continue;
            }
            for (i = 0; i < players.size; i++) {
                player = players[i];
                if (!player laststand::player_is_in_laststand()) {
                    player function_55c6dedd(weapon.name, 0);
                }
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x98a66a81, Offset: 0xca60
    // Size: 0x124
    function function_cbdab30d(xp) {
        if (self.pers[#"rankxp"] > xp) {
            self.pers[#"rank"] = 0;
            self setrank(0);
            self stats::set_stat(#"playerstatslist", #"rank", #"statvalue", 0);
        }
        self.pers[#"rankxp"] = xp;
        self rank::updaterank();
        self stats::set_stat(#"playerstatslist", #"rank", #"statvalue", self.pers[#"rank"]);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xcd2b130d, Offset: 0xcb90
    // Size: 0x34
    function function_5c26ad27(var_56c1b8d) {
        return int(rank::getrankinfominxp(var_56c1b8d));
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x33682366, Offset: 0xcbd0
    // Size: 0x44
    function function_5da832fa() {
        xp = 0;
        xp = function_5c26ad27(level.ranktable.size - 1);
        return xp;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xf0ed7a7a, Offset: 0xcc20
    // Size: 0xde
    function function_8c9f2dea() {
        players = getplayers();
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player laststand::player_is_in_laststand()) {
                var_56c1b8d = player rank::getrank();
                xp = function_5c26ad27(var_56c1b8d);
                player function_cbdab30d(xp);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x1f7b688c, Offset: 0xcd08
    // Size: 0xe6
    function function_b7ef4b8() {
        players = getplayers();
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player laststand::player_is_in_laststand()) {
                var_56c1b8d = player rank::getrank();
                xp = function_5c26ad27(var_56c1b8d);
                player function_cbdab30d(xp - 50);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x7185f53a, Offset: 0xcdf8
    // Size: 0xbe
    function function_9b4d61fa() {
        players = getplayers();
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player laststand::player_is_in_laststand()) {
                xp = function_5da832fa();
                player function_cbdab30d(xp);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x657cd36d, Offset: 0xcec0
    // Size: 0x9e
    function function_cdc3d061() {
        players = getplayers();
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player laststand::player_is_in_laststand()) {
                player function_cbdab30d(0);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x6e03058d, Offset: 0xcf68
    // Size: 0x166
    function zombie_devgui_reopt_current_weapon() {
        players = getplayers();
        reviver = players[0];
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            if (!players[i] laststand::player_is_in_laststand()) {
                weapon = players[i] getcurrentweapon();
                if (isdefined(players[i].pack_a_punch_weapon_options)) {
                    players[i].pack_a_punch_weapon_options[weapon] = undefined;
                }
                players[i] takeweapon(weapon);
                weapon = players[i] zm_weapons::give_build_kit_weapon(weapon);
                players[i] zm_weapons::function_7c5dd4bd(weapon);
                players[i] switchtoweapon(weapon);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x1f1a0e6c, Offset: 0xd0d8
    // Size: 0xe6
    function zombie_devgui_take_weapon() {
        players = getplayers();
        reviver = players[0];
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            if (!players[i] laststand::player_is_in_laststand()) {
                players[i] takeweapon(players[i] getcurrentweapon());
                players[i] zm_weapons::switch_back_primary_weapon(undefined);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xda252a1b, Offset: 0xd1c8
    // Size: 0xd6
    function zombie_devgui_take_weapons(give_fallback) {
        players = getplayers();
        reviver = players[0];
        level.devcheater = 1;
        for (i = 0; i < players.size; i++) {
            if (!players[i] laststand::player_is_in_laststand()) {
                players[i] takeallweapons();
                if (give_fallback) {
                    players[i] zm_weapons::give_fallback_weapon();
                }
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xa78180a8, Offset: 0xd2a8
    // Size: 0x7c
    function get_upgrade(weapon) {
        if (isdefined(level.zombie_weapons[weapon]) && isdefined(level.zombie_weapons[weapon].upgrade_name)) {
            return zm_weapons::get_upgrade_weapon(weapon, 0);
        }
        return zm_weapons::get_upgrade_weapon(weapon, 1);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x365cf321, Offset: 0xd330
    // Size: 0x28
    function zombie_devgui_director_easy() {
        if (isdefined(level.var_e5cb87fe)) {
            [[ level.var_e5cb87fe ]]();
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xd01f6a5a, Offset: 0xd360
    // Size: 0x48
    function zombie_devgui_chest_never_move() {
        level notify(#"devgui_chest_end_monitor");
        level endon(#"devgui_chest_end_monitor");
        for (;;) {
            level.chest_accessed = 0;
            wait(5);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xe138997d, Offset: 0xd3b0
    // Size: 0x46
    function zombie_devgui_disable_kill_thread_toggle() {
        if (!(isdefined(level.disable_kill_thread) && level.disable_kill_thread)) {
            level.disable_kill_thread = 1;
            return;
        }
        level.disable_kill_thread = 0;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x6f8305a2, Offset: 0xd400
    // Size: 0x46
    function zombie_devgui_check_kill_thread_every_frame_toggle() {
        if (!(isdefined(level.check_kill_thread_every_frame) && level.check_kill_thread_every_frame)) {
            level.check_kill_thread_every_frame = 1;
            return;
        }
        level.check_kill_thread_every_frame = 0;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xfd49e5eb, Offset: 0xd450
    // Size: 0x46
    function zombie_devgui_kill_thread_test_mode_toggle() {
        if (!(isdefined(level.kill_thread_test_mode) && level.kill_thread_test_mode)) {
            level.kill_thread_test_mode = 1;
            return;
        }
        level.kill_thread_test_mode = 0;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 5, eflags: 0x0
    // Checksum 0x1332bb02, Offset: 0xd4a0
    // Size: 0x50e
    function showonespawnpoint(spawn_point, color, notification, height, print) {
        if (!isdefined(height) || height <= 0) {
            height = util::get_player_height();
        }
        if (!isdefined(print)) {
            print = spawn_point.classname;
        }
        center = spawn_point.origin;
        forward = anglestoforward(spawn_point.angles);
        right = anglestoright(spawn_point.angles);
        forward = vectorscale(forward, 16);
        right = vectorscale(right, 16);
        a = center + forward - right;
        b = center + forward + right;
        c = center - forward + right;
        d = center - forward - right;
        thread lineuntilnotified(a, b, color, 0, notification);
        thread lineuntilnotified(b, c, color, 0, notification);
        thread lineuntilnotified(c, d, color, 0, notification);
        thread lineuntilnotified(d, a, color, 0, notification);
        thread lineuntilnotified(a, a + (0, 0, height), color, 0, notification);
        thread lineuntilnotified(b, b + (0, 0, height), color, 0, notification);
        thread lineuntilnotified(c, c + (0, 0, height), color, 0, notification);
        thread lineuntilnotified(d, d + (0, 0, height), color, 0, notification);
        a += (0, 0, height);
        b += (0, 0, height);
        c += (0, 0, height);
        d += (0, 0, height);
        thread lineuntilnotified(a, b, color, 0, notification);
        thread lineuntilnotified(b, c, color, 0, notification);
        thread lineuntilnotified(c, d, color, 0, notification);
        thread lineuntilnotified(d, a, color, 0, notification);
        center += (0, 0, height / 2);
        arrow_forward = anglestoforward(spawn_point.angles);
        arrowhead_forward = anglestoforward(spawn_point.angles);
        arrowhead_right = anglestoright(spawn_point.angles);
        arrow_forward = vectorscale(arrow_forward, 32);
        arrowhead_forward = vectorscale(arrowhead_forward, 24);
        arrowhead_right = vectorscale(arrowhead_right, 8);
        a = center + arrow_forward;
        b = center + arrowhead_forward - arrowhead_right;
        c = center + arrowhead_forward + arrowhead_right;
        thread lineuntilnotified(center, a, color, 0, notification);
        thread lineuntilnotified(a, b, color, 0, notification);
        thread lineuntilnotified(a, c, color, 0, notification);
        thread print3duntilnotified(spawn_point.origin + (0, 0, height), print, color, 1, 1, notification);
        return;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 6, eflags: 0x0
    // Checksum 0xbc1c6f84, Offset: 0xd9b8
    // Size: 0x76
    function print3duntilnotified(origin, text, color, alpha, scale, notification) {
        level endon(notification);
        for (;;) {
            print3d(origin, text, color, alpha, scale);
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 5, eflags: 0x0
    // Checksum 0xfb53d4bc, Offset: 0xda38
    // Size: 0x66
    function lineuntilnotified(start, end, color, depthtest, notification) {
        level endon(notification);
        for (;;) {
            line(start, end, color, depthtest);
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x9d89aa85, Offset: 0xdaa8
    // Size: 0x2ec
    function devgui_debug_hud() {
        if (isdefined(self zm_loadout::get_player_lethal_grenade())) {
            self givemaxammo(self zm_loadout::get_player_lethal_grenade());
        }
        wpn_type = zm_placeable_mine::get_first_available();
        if (wpn_type != level.weaponnone) {
            self thread zm_placeable_mine::setup_for_player(wpn_type);
        }
        if (isdefined(level.zombiemode_devgui_cymbal_monkey_give)) {
            if (isdefined(self zm_loadout::get_player_tactical_grenade())) {
                self takeweapon(self zm_loadout::get_player_tactical_grenade());
            }
            self [[ level.zombiemode_devgui_cymbal_monkey_give ]]();
        } else if (isdefined(self zm_loadout::get_player_tactical_grenade())) {
            self givemaxammo(self zm_loadout::get_player_tactical_grenade());
        }
        if (isdefined(level.zombie_include_equipment) && !isdefined(self zm_equipment::get_player_equipment())) {
            equipment = getarraykeys(level.zombie_include_equipment);
            if (isdefined(equipment[0])) {
                self zombie_devgui_equipment_give(equipment[0]);
            }
        }
        for (i = 0; i < 10; i++) {
            zombie_devgui_give_powerup("<unknown string>", 1, self.origin);
            wait(0.25);
        }
        zombie_devgui_give_powerup("<unknown string>", 1, self.origin);
        wait(0.25);
        zombie_devgui_give_powerup("<unknown string>", 1, self.origin);
        wait(0.25);
        zombie_devgui_give_powerup("<unknown string>", 1, self.origin);
        wait(0.25);
        zombie_devgui_give_powerup("<unknown string>", 1, self.origin);
        wait(0.25);
        zombie_devgui_give_powerup("<unknown string>", 1, self.origin);
        wait(0.25);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x9c1f3c05, Offset: 0xdda0
    // Size: 0x3e
    function zombie_devgui_draw_traversals() {
        if (!isdefined(level.toggle_draw_traversals)) {
            level.toggle_draw_traversals = 1;
            return;
        }
        level.toggle_draw_traversals = !level.toggle_draw_traversals;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xc5efdf86, Offset: 0xdde8
    // Size: 0x3e
    function zombie_devgui_keyline_always() {
        if (!isdefined(level.toggle_keyline_always)) {
            level.toggle_keyline_always = 1;
            return;
        }
        level.toggle_keyline_always = !level.toggle_keyline_always;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xa8dd2e12, Offset: 0xde30
    // Size: 0x94
    function robotsupportsovercover_manager_() {
        if (level flag::get("<unknown string>")) {
            level flag::clear("<unknown string>");
            iprintln("<unknown string>");
            return;
        }
        level flag::set("<unknown string>");
        iprintln("<unknown string>");
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xc5efc42e, Offset: 0xded0
    // Size: 0x3e
    function function_92523b12() {
        if (!isdefined(level.var_5171ee4a)) {
            level.var_5171ee4a = 1;
            return;
        }
        level.var_5171ee4a = !level.var_5171ee4a;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xc4d92ed, Offset: 0xdf18
    // Size: 0x290
    function wait_for_zombie(crawler) {
        nodes = getallnodes();
        while (true) {
            ai = getactorarray();
            zombie = ai[0];
            if (isdefined(zombie)) {
                foreach (node in nodes) {
                    if (node.type == #"begin" || node.type == #"end" || node.type == #"bad node") {
                        if (isdefined(node.animscript)) {
                            zombie setblackboardattribute("<unknown string>", "<unknown string>");
                            zombie setblackboardattribute("<unknown string>", node.animscript);
                            table = "<unknown string>";
                            if (isdefined(crawler) && crawler) {
                                table = "<unknown string>";
                            }
                            if (isdefined(zombie.debug_traversal_ast)) {
                                table = zombie.debug_traversal_ast;
                            }
                            anim_results = zombie astsearch(table);
                            if (!isdefined(anim_results[#"animation"])) {
                                if (isdefined(crawler) && crawler) {
                                    node.bad_crawler_traverse = 1;
                                } else {
                                    node.bad_traverse = 1;
                                }
                                continue;
                            }
                            if (anim_results[#"animation"] == "<unknown string>") {
                                teleport = 1;
                            }
                        }
                    }
                }
                break;
            }
            wait(0.25);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xe1a5396c, Offset: 0xe1b0
    // Size: 0x212
    function zombie_draw_traversals() {
        level thread wait_for_zombie();
        level thread wait_for_zombie(1);
        nodes = getallnodes();
        while (true) {
            if (isdefined(level.toggle_draw_traversals) && level.toggle_draw_traversals) {
                foreach (node in nodes) {
                    if (isdefined(node.animscript)) {
                        txt_color = (0, 0.8, 0.6);
                        circle_color = (1, 1, 1);
                        if (isdefined(node.bad_traverse) && node.bad_traverse) {
                            txt_color = (1, 0, 0);
                            circle_color = (1, 0, 0);
                        }
                        circle(node.origin, 16, circle_color);
                        print3d(node.origin, node.animscript, txt_color, 1, 0.5);
                        if (isdefined(node.bad_crawler_traverse) && node.bad_crawler_traverse) {
                            print3d(node.origin + (0, 0, -12), "<unknown string>", (1, 0, 0), 1, 0.5);
                        }
                    }
                }
            }
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xb1a6a467, Offset: 0xe3d0
    // Size: 0x1cc
    function function_bbeaa2da() {
        nodes = getallnodes();
        var_43e9aabd = [];
        foreach (node in nodes) {
            if (isdefined(node.animscript) && node.animscript != "<unknown string>") {
                var_43e9aabd[node.animscript] = 1;
            }
        }
        var_cb16f0db = getarraykeys(var_43e9aabd);
        sortednames = array::sort_by_value(var_cb16f0db, 1);
        println("<unknown string>");
        foreach (name in sortednames) {
            println("<unknown string>" + name);
        }
        println("<unknown string>");
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xc9d2516f, Offset: 0xe5a8
    // Size: 0x1de
    function function_e9b89aac() {
        while (true) {
            if (isdefined(level.zones) && (getdvarint(#"zombiemode_debug_zones", 0) || getdvarint(#"hash_756b3f2accaa1678", 0))) {
                foreach (zone in level.zones) {
                    foreach (node in zone.nodes) {
                        node_region = getnoderegion(node);
                        var_747013f8 = node.targetname;
                        if (isdefined(node_region)) {
                            var_747013f8 = node_region + "<unknown string>" + node.targetname;
                        }
                        print3d(node.origin + (0, 0, 12), var_747013f8, (0, 1, 0), 1, 1);
                    }
                }
            }
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xd70d59fc, Offset: 0xe790
    // Size: 0xde
    function function_e395a714() {
        if (!isdefined(level.var_9a11ee76)) {
            level.var_9a11ee76 = 0;
        }
        foreach (player in level.players) {
            if (level.var_9a11ee76) {
                player notify(#"hash_d592b5d81b7b3a7");
                continue;
            }
            player thread function_fb482cad();
        }
        level.var_9a11ee76 = !level.var_9a11ee76;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xf02fe7e4, Offset: 0xe878
    // Size: 0x3e
    function function_2fcf8a4a(notifyhash) {
        if (isdefined(self.var_d35d1d3d)) {
            self.var_d35d1d3d destroy();
            self.var_d35d1d3d = undefined;
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xbe11d569, Offset: 0xe8c0
    // Size: 0x186
    function function_fb482cad() {
        self notify(#"hash_d592b5d81b7b3a7");
        self endoncallback(&function_2fcf8a4a, #"hash_d592b5d81b7b3a7", #"disconnect");
        while (true) {
            if (!isdefined(self.var_d35d1d3d)) {
                self.var_d35d1d3d = newdebughudelem(self);
                self.var_d35d1d3d.alignx = "<unknown string>";
                self.var_d35d1d3d.horzalign = "<unknown string>";
                self.var_d35d1d3d.aligny = "<unknown string>";
                self.var_d35d1d3d.vertalign = "<unknown string>";
                self.var_d35d1d3d.color = (1, 1, 1);
                self.var_d35d1d3d.alpha = 1;
            }
            debug_text = "<unknown string>";
            if (isdefined(self.cached_zone_volume)) {
                debug_text = "<unknown string>";
            } else if (isdefined(self.var_3b65cdd7)) {
                debug_text = "<unknown string>";
            }
            self.var_d35d1d3d settext(debug_text);
            self waittill(#"zone_change");
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xdad07844, Offset: 0xea50
    // Size: 0x21e
    function function_8817dd98() {
        while (true) {
            if (isdefined(level.var_5171ee4a) && level.var_5171ee4a) {
                if (!isdefined(level.var_fcfab54a)) {
                    level.var_fcfab54a = newdebughudelem();
                    level.var_fcfab54a.alignx = "<unknown string>";
                    level.var_fcfab54a.x = 2;
                    level.var_fcfab54a.y = 160;
                    level.var_fcfab54a.fontscale = 1.5;
                    level.var_fcfab54a.color = (1, 1, 1);
                }
                zombie_count = zombie_utility::get_current_zombie_count();
                zombie_left = level.zombie_total;
                zombie_runners = 0;
                var_536fd32b = zombie_utility::get_zombie_array();
                foreach (ai_zombie in var_536fd32b) {
                    if (ai_zombie.zombie_move_speed == "<unknown string>") {
                        zombie_runners++;
                    }
                }
                level.var_fcfab54a settext("<unknown string>" + zombie_count + "<unknown string>" + zombie_left + "<unknown string>" + zombie_runners);
            } else if (isdefined(level.var_fcfab54a)) {
                level.var_fcfab54a destroy();
            }
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x344b39f2, Offset: 0xec78
    // Size: 0x24
    function testscriptruntimeerrorassert() {
        wait(1);
        assert(0);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xf08ecf0e, Offset: 0xeca8
    // Size: 0x44
    function testscriptruntimeerror2() {
        myundefined = "<unknown string>";
        if (myundefined == 1) {
            println("<unknown string>");
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x210183ea, Offset: 0xecf8
    // Size: 0x1c
    function testscriptruntimeerror1() {
        testscriptruntimeerror2();
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xe86e26af, Offset: 0xed20
    // Size: 0xdc
    function testscriptruntimeerror() {
        wait(5);
        for (;;) {
            if (getdvarstring(#"scr_testscriptruntimeerror") != "<unknown string>") {
                break;
            }
            wait(1);
        }
        myerror = getdvarstring(#"scr_testscriptruntimeerror");
        setdvar(#"scr_testscriptruntimeerror", "<unknown string>");
        if (myerror == "<unknown string>") {
            testscriptruntimeerrorassert();
        } else {
            testscriptruntimeerror1();
        }
        thread testscriptruntimeerror();
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x9e7ff92c, Offset: 0xee08
    // Size: 0x27e
    function function_f12b8a34() {
        barriers = struct::get_array("<unknown string>", "<unknown string>");
        if (isdefined(level._additional_carpenter_nodes)) {
            barriers = arraycombine(barriers, level._additional_carpenter_nodes, 0, 0);
        }
        foreach (barrier in barriers) {
            if (isdefined(barrier.zbarrier)) {
                a_pieces = barrier.zbarrier getzbarrierpieceindicesinstate("<unknown string>");
                if (isdefined(a_pieces)) {
                    for (xx = 0; xx < a_pieces.size; xx++) {
                        chunk = a_pieces[xx];
                        barrier.zbarrier zbarrierpieceusedefaultmodel(chunk);
                        barrier.zbarrier.chunk_health[chunk] = 0;
                    }
                }
                for (x = 0; x < barrier.zbarrier getnumzbarrierpieces(); x++) {
                    barrier.zbarrier setzbarrierpiecestate(x, "<unknown string>");
                    barrier.zbarrier showzbarrierpiece(x);
                }
            }
            if (isdefined(barrier.clip)) {
                barrier.clip triggerenable(1);
                barrier.clip disconnectpaths();
            } else {
                zm_blockers::blocker_connect_paths(barrier.neg_start, barrier.neg_end);
            }
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x1ddf0500, Offset: 0xf090
    // Size: 0x8c
    function function_29dcbd58() {
        var_a6f3b62c = getdvarint(#"hash_1e8ebf0a767981dd", 0);
        return array(array(var_a6f3b62c / 2, 30), array(var_a6f3b62c - 1, 20));
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xa94a69b, Offset: 0xf128
    // Size: 0x264
    function function_3a5618f8() {
        self endon(#"hash_63ae1cb168b8e0d7");
        setdvar(#"cg_drawscriptusage", 1);
        var_a6f3b62c = getdvarint(#"hash_1e8ebf0a767981dd", 0);
        timescale = getdvarint(#"hash_7438b7c847f3c0", 0);
        var_59ed21fc = function_29dcbd58();
        setdvar(#"runtime_time_scale", timescale);
        while (level.round_number < var_a6f3b62c) {
            foreach (round_info in var_59ed21fc) {
                if (level.round_number < round_info[0]) {
                    wait(round_info[1]);
                    break;
                }
            }
            ai_enemies = getaiteamarray(#"axis");
            foreach (ai in ai_enemies) {
                ai kill();
            }
            adddebugcommand("<unknown string>");
            wait(0.2);
        }
        setdvar(#"runtime_time_scale", 1);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xe3922a74, Offset: 0xf398
    // Size: 0x44
    function function_21f1fbf1() {
        self notify(#"hash_63ae1cb168b8e0d7");
        setdvar(#"runtime_time_scale", 1);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x41277b29, Offset: 0xf3e8
    // Size: 0x78
    function function_1762ff96() {
        level.var_afb69372 = !(isdefined(self.var_afb69372) && self.var_afb69372);
        if (isdefined(level.var_afb69372) && level.var_afb69372) {
            level thread function_b7e34647();
            return;
        }
        level notify(#"hash_2876f101dd7375df");
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x90d8a883, Offset: 0xf468
    // Size: 0x232
    function function_b7e34647() {
        level endon(#"hash_2876f101dd7375df");
        while (true) {
            zombies = [];
            foreach (archetype in level.var_58903b1f) {
                ai = getaiarchetypearray(archetype, level.zombie_team);
                if (ai.size) {
                    zombies = arraycombine(zombies, ai, 0, 0);
                }
            }
            foreach (zombie in zombies) {
                if (isdefined(zombie.need_closest_player) && zombie.need_closest_player) {
                    record3dtext("<unknown string>", zombie.origin + (0, 0, 72), (1, 0, 0));
                    continue;
                }
                record3dtext("<unknown string>", zombie.origin + (0, 0, 72), (0, 1, 0));
                if (isdefined(zombie.var_26f25576)) {
                    record3dtext(gettime() - zombie.var_26f25576, zombie.origin + (0, 0, 54), (1, 1, 1));
                }
            }
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x49e3507b, Offset: 0xf6a8
    // Size: 0x84
    function function_1e285ac2() {
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        level thread function_c774d870();
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xe41c0031, Offset: 0xf738
    // Size: 0x298
    function function_c774d870() {
        for (;;) {
            wait(0.25);
            cmd = getdvarint(#"hash_5b8785c3d6383b3a", 0);
            if (isdefined(cmd) && cmd == 1) {
                iprintlnbold("<unknown string>");
                zm::function_1442d44f();
                setdvar(#"hash_5b8785c3d6383b3a", 0);
            }
            cmd = getdvarstring(#"hash_2d9d21912cbffb75");
            if (isdefined(cmd) && cmd == 1) {
                iprintlnbold("<unknown string>");
                level.gamedifficulty = 0;
                setdvar(#"hash_2d9d21912cbffb75", 0);
                setdvar(#"hash_5b8785c3d6383b3a", 1);
            }
            cmd = getdvarstring(#"hash_2b205a3ab882058c");
            if (isdefined(cmd) && cmd == 1) {
                iprintlnbold("<unknown string>");
                level.gamedifficulty = 1;
                setdvar(#"hash_2b205a3ab882058c", 0);
                setdvar(#"hash_5b8785c3d6383b3a", 1);
            }
            cmd = getdvarstring(#"hash_393960bacf784966");
            if (isdefined(cmd) && cmd == 1) {
                iprintlnbold("<unknown string>");
                level.gamedifficulty = 2;
                setdvar(#"hash_393960bacf784966", 0);
                setdvar(#"hash_5b8785c3d6383b3a", 1);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x4
    // Checksum 0xca9f8245, Offset: 0xf9d8
    // Size: 0xae
    function private function_255c7194() {
        player = getplayers()[0];
        queryresult = positionquery_source_navigation(player.origin, 256, 512, 128, 20);
        if (isdefined(queryresult) && queryresult.data.size > 0) {
            return queryresult.data[0];
        }
        return {#origin:player.origin};
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x4
    // Checksum 0xde17c415, Offset: 0xfa90
    // Size: 0x116
    function private function_b4dcb9ce() {
        player = getplayers()[0];
        direction = player getplayerangles();
        direction_vec = anglestoforward(direction);
        eye = player geteye();
        scale = 8000;
        direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
        trace = bullettrace(eye, eye + direction_vec, 0, player);
        return {#origin:trace[#"position"]};
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xf74f75f0, Offset: 0xfbb0
    // Size: 0xdc
    function spawn_archetype(spawner_name) {
        spawners = getspawnerarray(spawner_name, "<unknown string>");
        spawn_point = function_b4dcb9ce();
        if (spawners.size == 0) {
            iprintln("<unknown string>" + spawner_name + "<unknown string>");
            return;
        }
        entity = spawners[0] spawnfromspawner(0, 1);
        if (isdefined(entity)) {
            entity forceteleport(spawn_point.origin);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xacbae6ad, Offset: 0xfc98
    // Size: 0xb8
    function kill_archetype(archetype) {
        enemies = getaiarchetypearray(archetype);
        foreach (enemy in enemies) {
            if (isalive(enemy)) {
                enemy kill();
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xd6f61fd7, Offset: 0xfd58
    // Size: 0x27c
    function function_8d799ebd() {
        level.devcheater = 1;
        if (!self laststand::player_is_in_laststand()) {
            self zm_hero_weapon::function_1bb7f7b1(3);
            self zm_perks::function_869a50c0(4);
            var_5d62d3c8 = array::randomize(array(#"ar_accurate_t8", #"ar_fastfire_t8", #"ar_stealth_t8", #"ar_modular_t8", #"smg_capacity_t8", #"tr_powersemi_t8"));
            foreach (w_primary in self getweaponslistprimaries()) {
                self takeweapon(w_primary);
            }
            for (i = 0; i < zm_utility::get_player_weapon_limit(self); i++) {
                weapon = getweapon(var_5d62d3c8[i]);
                weapon = get_upgrade(weapon.rootweapon);
                weapon = self zm_weapons::give_build_kit_weapon(weapon);
                if (isdefined(level.aat_in_use) && level.aat_in_use && zm_weapons::weapon_supports_aat(weapon)) {
                    self thread aat::acquire(weapon);
                    self zm_pap_util::repack_weapon(weapon, 4);
                }
            }
            self switchtoweapon(weapon);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x87b56543, Offset: 0xffe0
    // Size: 0x5a
    function function_f298dd5c() {
        /#
            if (!isdefined(level.var_9db63456)) {
                level.var_9db63456 = 0;
            }
        #/
        if (!isdefined(level.var_9db63456)) {
            level.var_9db63456 = 1;
        }
        level.var_9db63456 = !level.var_9db63456;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x6d611fd3, Offset: 0x10048
    // Size: 0x86
    function function_e5713258() {
        if (isdefined(level.var_33571ef1) && level.var_33571ef1) {
            level notify(#"hash_147174071dbfe31e");
        } else {
            level thread function_15ee6847();
        }
        level.var_33571ef1 = !(isdefined(level.var_33571ef1) && level.var_33571ef1);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xfe71b5e6, Offset: 0x100d8
    // Size: 0x27e
    function function_15ee6847() {
        self notify("<unknown string>");
        self endon("<unknown string>");
        level endon(#"hash_147174071dbfe31e");
        while (true) {
            teststring = "<unknown string>";
            foreach (player in level.players) {
                teststring += "<unknown string>" + player getentitynumber() + "<unknown string>";
                if (player.sessionstate == "<unknown string>") {
                    teststring += "<unknown string>";
                    continue;
                }
                if (isdefined(self.hostmigrationcontrolsfrozen) && self.hostmigrationcontrolsfrozen) {
                    teststring += "<unknown string>";
                    continue;
                }
                if (player zm_player::in_life_brush()) {
                    teststring += "<unknown string>";
                    continue;
                }
                if (player zm_player::in_kill_brush()) {
                    teststring += "<unknown string>";
                    continue;
                }
                if (!player zm_player::in_enabled_playable_area()) {
                    teststring += "<unknown string>";
                    continue;
                }
                if (isdefined(level.player_out_of_playable_area_override) && !(isdefined(player [[ level.player_out_of_playable_area_override ]]()) && player [[ level.player_out_of_playable_area_override ]]())) {
                    teststring += "<unknown string>";
                    continue;
                }
                teststring += "<unknown string>";
            }
            debug2dtext((400, 100, 0), teststring, (1, 1, 0), undefined, (0, 0, 0), 0.75, 1, 1);
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x3b629030, Offset: 0x10360
    // Size: 0x32
    function function_26417ea7() {
        level.var_565d6ce0 = !(isdefined(level.var_565d6ce0) && level.var_565d6ce0);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x3054d939, Offset: 0x103a0
    // Size: 0xa8
    function function_fb88b423() {
        zombies = getaiarray();
        foreach (zombie in zombies) {
            zombie zombie_utility::setup_zombie_knockdown(level.players[0]);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xacf6c406, Offset: 0x10450
    // Size: 0x1b8
    function init_debug_center_screen() {
        waitframe(1);
        setdvar(#"debug_center_screen", 0);
        level flag::wait_till("<unknown string>");
        zero_idle_movement = 0;
        devgui_base = "<unknown string>";
        adddebugcommand(devgui_base + "<unknown string>" + "<unknown string>" + "<unknown string>");
        for (;;) {
            if (getdvarint(#"debug_center_screen", 0)) {
                if (!isdefined(level.center_screen_debug_hudelem_active) || level.center_screen_debug_hudelem_active == 0) {
                    thread debug_center_screen();
                    zero_idle_movement = getdvarint(#"zero_idle_movement", 0);
                    if (zero_idle_movement == 0) {
                        setdvar(#"zero_idle_movement", 1);
                        zero_idle_movement = 1;
                    }
                }
            } else {
                level notify(#"stop center screen debug");
                if (zero_idle_movement == 1) {
                    setdvar(#"zero_idle_movement", 0);
                    zero_idle_movement = 0;
                }
            }
            wait(0.5);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xe2ca90c8, Offset: 0x10610
    // Size: 0x24a
    function debug_center_screen() {
        level.center_screen_debug_hudelem_active = 1;
        wait(0.1);
        level.center_screen_debug_hudelem1 = newdebughudelem(level.players[0]);
        level.center_screen_debug_hudelem1.alignx = "<unknown string>";
        level.center_screen_debug_hudelem1.aligny = "<unknown string>";
        level.center_screen_debug_hudelem1.fontscale = 1;
        level.center_screen_debug_hudelem1.alpha = 0.5;
        level.center_screen_debug_hudelem1.x = 320 - 1;
        level.center_screen_debug_hudelem1.y = 240;
        level.center_screen_debug_hudelem1 setshader("<unknown string>", 1000, 1);
        level.center_screen_debug_hudelem2 = newdebughudelem(level.players[0]);
        level.center_screen_debug_hudelem2.alignx = "<unknown string>";
        level.center_screen_debug_hudelem2.aligny = "<unknown string>";
        level.center_screen_debug_hudelem2.fontscale = 1;
        level.center_screen_debug_hudelem2.alpha = 0.5;
        level.center_screen_debug_hudelem2.x = 320 - 1;
        level.center_screen_debug_hudelem2.y = 240;
        level.center_screen_debug_hudelem2 setshader("<unknown string>", 1, 480);
        level waittill(#"stop center screen debug");
        level.center_screen_debug_hudelem1 destroy();
        level.center_screen_debug_hudelem2 destroy();
        level.center_screen_debug_hudelem_active = 0;
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x7c9404a9, Offset: 0x10868
    // Size: 0x270
    function function_b5d522f8() {
        self notify("<unknown string>");
        self endon("<unknown string>");
        function_7c9dd642();
        setdvar(#"hash_46eec505e691414c", "<unknown string>");
        setdvar(#"hash_74f1952a0f93d08e", -1);
        while (true) {
            wait(0.1);
            var_9261da43 = getdvar(#"hash_46eec505e691414c", "<unknown string>");
            var_10acd4fa = getdvar(#"hash_74f1952a0f93d08e", -1);
            if (var_9261da43 == "<unknown string>" && var_10acd4fa == -1) {
                continue;
            }
            player = level.players[0];
            if (isplayer(player)) {
                if (var_9261da43 != "<unknown string>") {
                    args = strtok(var_9261da43, "<unknown string>");
                    level zm_ui_inventory::function_7df6bb60(args[0], int(args[1]), player);
                }
                if (var_10acd4fa != -1) {
                    if (var_10acd4fa > 0) {
                        player zm_ui_inventory::function_d8f1d200(#"hash_336cbe1bb6ff213");
                    } else {
                        player zm_ui_inventory::function_d8f1d200(#"");
                    }
                }
            }
            setdvar(#"hash_46eec505e691414c", "<unknown string>");
            setdvar(#"hash_74f1952a0f93d08e", -1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xdc9b60fe, Offset: 0x10ae0
    // Size: 0x21c
    function function_7c9dd642() {
        while (!isdefined(level.var_a16c38d9)) {
            wait(0.1);
        }
        path = "<unknown string>";
        cmd = "<unknown string>";
        keys = getarraykeys(level.var_a16c38d9);
        foreach (key in keys) {
            mapping = level.var_a16c38d9[key];
            num = pow(2, mapping.numbits);
            for (i = 0; i < num; i++) {
                cmdarg = function_9e72a96(key) + "<unknown string>" + i;
                util::add_devgui(path + function_9e72a96(key) + "<unknown string>" + i, cmd + cmdarg);
            }
        }
        var_30a96cf9 = "<unknown string>";
        cmd = "<unknown string>";
        util::add_devgui(var_30a96cf9 + "<unknown string>", cmd + 1);
        util::add_devgui(var_30a96cf9 + "<unknown string>", cmd + 0);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x417ec1e8, Offset: 0x10d08
    // Size: 0x3d2
    function bunker_entrance_zoned() {
        self notify("<unknown string>");
        self endon("<unknown string>");
        if (getdvarint(#"hash_4cebb1d3b0ee545a", 0) == 0) {
            setdvar(#"hash_4cebb1d3b0ee545a", 1);
        } else {
            setdvar(#"hash_4cebb1d3b0ee545a", 0);
            return;
        }
        a_s_key = struct::get_array(1, "<unknown string>");
        a_e_all = getentitiesinradius((0, 0, 0), 640000);
        a_e_key = [];
        foreach (ent in a_e_all) {
            if (isdefined(ent.var_61330f48) && ent.var_61330f48) {
                array::add(a_e_key, ent);
            }
        }
        a_key = arraycombine(a_s_key, a_e_key, 0, 0);
        while (getdvarint(#"hash_4cebb1d3b0ee545a", 0)) {
            foreach (key in a_key) {
                var_91d1913b = distance2d(level.players[0].origin, key.origin);
                n_radius = 0.015 * var_91d1913b;
                if (n_radius > 768) {
                    n_radius = 768;
                }
                if (var_91d1913b > 64 && var_91d1913b < 2000) {
                    v_color = (0, 0, 1);
                    if (isdefined(key.targetname)) {
                        str_type = function_9e72a96(key.targetname);
                    } else if (isdefined(key.model)) {
                        str_type = function_9e72a96(key.model);
                    } else {
                        str_type = key.origin;
                    }
                    sphere(key.origin, n_radius, v_color);
                    print3d(key.origin + (0, 0, 24), str_type, v_color);
                }
            }
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xb861e774, Offset: 0x110e8
    // Size: 0x8c
    function function_1b531660() {
        if (!isdefined(level.var_77e1430c)) {
            level.var_77e1430c = 0;
        }
        level.var_77e1430c = !level.var_77e1430c;
        if (level.var_77e1430c) {
            callback::on_ai_damage(&function_e7321799);
            return;
        }
        callback::remove_on_ai_damage(&function_e7321799);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x35a0423a, Offset: 0x11180
    // Size: 0x10c
    function function_e7321799(params) {
        damage = params.idamage;
        location = params.vpoint;
        target = self;
        smeansofdeath = params.smeansofdeath;
        if (smeansofdeath == "<unknown string>" || smeansofdeath == "<unknown string>") {
            location = self.origin + (0, 0, 60);
        }
        if (damage) {
            thread function_2cde0af9("<unknown string>" + damage, (1, 1, 1), location, (randomfloatrange(-1, 1), randomfloatrange(-1, 1), 2), 30);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 5, eflags: 0x0
    // Checksum 0x4ff3775a, Offset: 0x11298
    // Size: 0xcc
    function function_2cde0af9(text, color, start, velocity, frames) {
        location = start;
        alpha = 1;
        for (i = 0; i < frames; i++) {
            print3d(location, text, color, alpha, 0.6, 1);
            location += velocity;
            alpha -= 1 / frames * 2;
            waitframe(1);
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xb781ceab, Offset: 0x11370
    // Size: 0x168
    function function_61a7bb28() {
        foreach (e_player in getplayers()) {
            if (!e_player laststand::player_is_in_laststand() && e_player.sessionstate !== "<unknown string>") {
                weapon = e_player getcurrentweapon();
                if (weaponhasattachment(weapon, "<unknown string>")) {
                    continue;
                }
                weapon = getweapon(weapon.name, arraycombine(weapon.attachments, array("<unknown string>"), 0, 0));
                e_player function_2d4d7fd9(weapon);
                e_player function_f45a88df(weapon);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x5b5ad82f, Offset: 0x114e0
    // Size: 0x108
    function function_986a2585() {
        foreach (e_player in getplayers()) {
            if (!e_player laststand::player_is_in_laststand() && e_player.sessionstate !== "<unknown string>") {
                weapon = e_player getcurrentweapon();
                if (!weaponhasattachment(weapon, "<unknown string>")) {
                    continue;
                }
                e_player function_3fb8b14(weapon, 1);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0xddcc8491, Offset: 0x115f0
    // Size: 0x100
    function function_184b9c6a() {
        foreach (e_player in getplayers()) {
            if (!e_player laststand::player_is_in_laststand() && e_player.sessionstate !== "<unknown string>") {
                weapon = e_player getcurrentweapon();
                if (!weaponhasattachment(weapon, "<unknown string>")) {
                    continue;
                }
                e_player function_f45a88df(weapon);
            }
        }
    }

    // Namespace zm_devgui/zm_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x3a7e65ec, Offset: 0x116f8
    // Size: 0x74
    function function_f45a88df(weapon) {
        var_fd8cbdfd = self function_ddd45573(weapon);
        if (!isdefined(var_fd8cbdfd) || var_fd8cbdfd == 0) {
            var_fd8cbdfd = 1;
        } else {
            var_fd8cbdfd++;
        }
        self function_3fb8b14(weapon, var_fd8cbdfd);
    }

    // Namespace zm_devgui/zm_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x569401e, Offset: 0x11778
    // Size: 0x128
    function function_faf7abce() {
        foreach (e_player in getplayers()) {
            if (!e_player laststand::player_is_in_laststand() && e_player.sessionstate !== "<unknown string>") {
                weapon = e_player getcurrentweapon();
                var_1c3b8b11 = e_player function_b1298bfb(weapon);
                if (!isdefined(var_1c3b8b11) || var_1c3b8b11 == 0) {
                    var_1c3b8b11 = 1;
                } else {
                    var_1c3b8b11++;
                }
                e_player function_a85d2581(weapon, var_1c3b8b11);
            }
        }
    }

#/
