// Atian COD Tools GSC decompiler test
#using scripts\mp_common\item_world_util.gsc;
#using scripts\mp_common\item_world.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace item_world_debug;

// Namespace item_world_debug/item_world_debug
// Params 0, eflags: 0x2
// Checksum 0xdd14695d, Offset: 0xa8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"item_world_debug", &__init__, undefined, #"item_world");
}

// Namespace item_world_debug/item_world_debug
// Params 0, eflags: 0x4
// Checksum 0xa157f489, Offset: 0xf8
// Size: 0xa4
function private __init__() {
    if (!isdefined(getgametypesetting(#"useitemspawns")) || getgametypesetting(#"useitemspawns") == 0) {
        return;
    }
    /#
        level thread _setup_devgui();
    #/
    /#
        level thread function_cdd9b388();
    #/
    /#
        level thread function_91ef342();
    #/
}

/#

    // Namespace item_world_debug/item_world_debug
    // Params 2, eflags: 0x4
    // Checksum 0xf882caa3, Offset: 0x1a8
    // Size: 0xc0
    function private function_13d7bba(xoffset, yoffset) {
        elem = newdebughudelem();
        elem.alignx = "<unknown string>";
        elem.horzalign = "<unknown string>";
        elem.x = xoffset + 0;
        elem.y = yoffset;
        elem.fontscale = 1;
        elem.color = (1, 1, 1);
        elem.fontstyle3d = "<unknown string>";
        return elem;
    }

    // Namespace item_world_debug/item_world_debug
    // Params 2, eflags: 0x4
    // Checksum 0xae9ac26b, Offset: 0x270
    // Size: 0x326
    function private function_11421106(typestring, type) {
        tab = "<unknown string>";
        return typestring + "<unknown string>" + (isdefined(level.var_efeab371[type]) ? level.var_efeab371[type] : 0) + "<unknown string>" + int((isdefined(level.var_efeab371[type]) ? level.var_efeab371[type] : 0) / int(max(level.var_66e56764, 1)) * 100) + "<unknown string>" + tab + "<unknown string>" + (isdefined(level.var_d80c35aa[type]) ? level.var_d80c35aa[type] : 0) + "<unknown string>" + int((isdefined(level.var_d80c35aa[type]) ? level.var_d80c35aa[type] : 0) / int(max(level.var_136445c0, 1)) * 100) + "<unknown string>" + tab + "<unknown string>" + (isdefined(level.var_8d9ad8e8[type]) ? level.var_8d9ad8e8[type] : 0) + "<unknown string>" + int((isdefined(level.var_8d9ad8e8[type]) ? level.var_8d9ad8e8[type] : 0) / int(max(level.var_5720c09a, 1)) * 100) + "<unknown string>" + tab + "<unknown string>" + (isdefined(level.var_ecf16fd3[type]) ? level.var_ecf16fd3[type] : 0) + "<unknown string>" + int((isdefined(level.var_ecf16fd3[type]) ? level.var_ecf16fd3[type] : 0) / int(max(level.var_2850ef5, 1)) * 100) + "<unknown string>";
    }

    // Namespace item_world_debug/item_world_debug
    // Params 0, eflags: 0x4
    // Checksum 0xf0ab61c3, Offset: 0x5a0
    // Size: 0x214
    function private function_bebe535() {
        n_total = 0;
        var_9243cc66 = 0;
        foreach (i, list in level.var_2e96a450) {
            str_set = function_9e72a96(i);
            println(str_set + "<unknown string>" + list);
            n_total += list;
            a_tokens = strtok(str_set, "<unknown string>");
            foreach (token in a_tokens) {
                if (token === "<unknown string>" || token === "<unknown string>") {
                    var_9243cc66 += list;
                    break;
                }
            }
        }
        if (isdefined(level.var_2e96a450[#"paint_can_items"])) {
            var_9243cc66 -= level.var_2e96a450[#"paint_can_items"];
        }
        println("<unknown string>" + n_total);
        println("<unknown string>" + var_9243cc66);
    }

    // Namespace item_world_debug/item_world_debug
    // Params 0, eflags: 0x4
    // Checksum 0x8ad82149, Offset: 0x7c0
    // Size: 0xb0
    function private function_2248268e() {
        vehicles = getvehiclearray();
        foreach (vehicle in vehicles) {
            if (isdefined(vehicle.scriptvehicletype)) {
                println(vehicle.scriptvehicletype);
            }
        }
    }

    // Namespace item_world_debug/item_world_debug
    // Params 0, eflags: 0x4
    // Checksum 0xb018b76e, Offset: 0x878
    // Size: 0x724
    function private function_b6ea080() {
        self notify("<unknown string>");
        self endon("<unknown string>");
        file = openfile("<unknown string>", "<unknown string>");
        if (file == -1) {
            iprintlnbold("<unknown string>");
            return;
        }
        println("<unknown string>");
        mapname = util::get_map_name();
        if (mapname === "<unknown string>" || mapname == "<unknown string>") {
            world_items = ["<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>"];
        } else {
            world_items = ["<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>"];
        }
        count = 0;
        item_count = 0;
        while (count < world_items.size) {
            itemlist = function_91b29d2a(world_items[count]);
            foreach (item in itemlist) {
                the_item = item_world::function_2e3efdda(item.origin, undefined, 1, 1, -1, 1);
                if (the_item.size > 0) {
                    type = "<unknown string>";
                    if (isdefined(the_item[0].itementry) && isdefined(the_item[0].itementry.itemtype)) {
                        switch (the_item[0].itementry.itemtype) {
                        case #"ammo":
                            type = "<unknown string>";
                            break;
                        case #"weapon":
                            type = "<unknown string>";
                            break;
                        case #"health":
                            type = "<unknown string>";
                            break;
                        case #"armor":
                            type = "<unknown string>";
                            break;
                        case #"equipment":
                            type = "<unknown string>";
                            break;
                        case #"backpack":
                            type = "<unknown string>";
                            break;
                        case #"generic":
                            type = "<unknown string>";
                            break;
                        case #"cash":
                            type = "<unknown string>";
                            break;
                        case #"killstreak":
                            type = "<unknown string>";
                            break;
                        case #"attachment":
                            type = "<unknown string>";
                            break;
                        case #"resource":
                            type = "<unknown string>";
                            break;
                        default:
                            type = "<unknown string>";
                            break;
                        }
                    }
                    if (isdefined(the_item[0].itementry)) {
                        debug_string = the_item[0].itementry.name + "<unknown string>" + function_9e72a96(the_item[0].targetname) + "<unknown string>" + the_item[0].origin + "<unknown string>" + type;
                        fprintln(file, debug_string);
                        item_count++;
                    }
                }
            }
            count++;
        }
        println("<unknown string>" + item_count + "<unknown string>");
        println("<unknown string>");
        closefile(file);
    }

    // Namespace item_world_debug/item_world_debug
    // Params 0, eflags: 0x4
    // Checksum 0x62366dce, Offset: 0xfa8
    // Size: 0x754
    function private function_938d798a() {
        str_filename = util::get_map_name() + "<unknown string>";
        file = openfile(str_filename, "<unknown string>");
        if (file == -1) {
            iprintlnbold("<unknown string>" + str_filename);
            return;
        }
        freadln(file);
        freadln(file);
        freadln(file);
        freadln(file);
        var_7099d03 = [];
        while (freadln(file) > 0) {
            a_vec = [];
            var_aae1fec0 = fgetarg(file, 0);
            a_str_keys = strtok2(var_aae1fec0, "<unknown string>");
            a_vec[0] = float(a_str_keys[5]);
            var_aae1fec0 = fgetarg(file, 1);
            a_vec[1] = float(var_aae1fec0);
            var_aae1fec0 = fgetarg(file, 2);
            a_vec[2] = float(var_aae1fec0);
            var_4e94b449 = strtok2(var_aae1fec0, "<unknown string>");
            v_origin = (a_vec[0], a_vec[1], a_vec[2]);
            v_stand = getclosestpointonnavmesh(v_origin, 192);
            switch (var_4e94b449[2]) {
            case #"overlaps":
                var_e45e8f33 = (0, 0, 1);
                var_6f08946b = fgetarg(file, 3);
                var_dd52f0fe = fgetarg(file, 4);
                var_d8aec942 = (float(var_4e94b449[6]), float(var_6f08946b), float(var_dd52f0fe));
                break;
            case #"is":
                var_e45e8f33 = (1, 0, 0);
                var_d8aec942 = undefined;
                break;
            }
            var_7099d03[var_7099d03.size] = {#origin:v_origin, #stand:v_stand, #var_e45e8f33:var_e45e8f33, #var_d8aec942:var_d8aec942};
        }
        closefile(file);
        wait(0.5);
        iprintlnbold("<unknown string>");
        adddebugcommand("<unknown string>");
        player = util::gethostplayer();
        if (!isdefined(level.var_eedfa327)) {
            level.var_eedfa327 = 0;
        }
        n_index = 0;
        var_d4714efb = 0;
        while (level.var_938d798a) {
            if (player jumpbuttonpressed() && player function_78931318("<unknown string>")) {
                if (level.var_eedfa327 < var_7099d03.size - 1) {
                    level.var_eedfa327++;
                } else {
                    level.var_eedfa327 = 0;
                }
            } else if (player jumpbuttonpressed() && player function_78931318("<unknown string>")) {
                if (level.var_eedfa327 <= 0) {
                    level.var_eedfa327 = var_7099d03.size - 1;
                } else {
                    level.var_eedfa327--;
                }
            }
            if (level.var_eedfa327 != var_d4714efb) {
                sphere(var_7099d03[level.var_eedfa327].origin, 8, var_7099d03[level.var_eedfa327].var_e45e8f33, 0.5, 0, 16, 300);
                if (isdefined(var_7099d03[level.var_eedfa327].var_d8aec942)) {
                    sphere(var_7099d03[level.var_eedfa327].var_d8aec942, 8, var_7099d03[level.var_eedfa327].var_e45e8f33, 0.5, 0, 16, 300);
                }
                if (isdefined(var_7099d03[level.var_eedfa327].stand)) {
                    v_player_pos = var_7099d03[level.var_eedfa327].stand;
                } else {
                    v_player_pos = var_7099d03[level.var_eedfa327].origin;
                }
                var_543a44a5 = vectortoangles(var_7099d03[level.var_eedfa327].origin - v_player_pos + (0, 0, 36));
                player setorigin(v_player_pos);
                player setplayerangles(var_543a44a5);
                var_d4714efb = level.var_eedfa327;
                iprintlnbold("<unknown string>" + level.var_eedfa327);
                wait(0.1);
            }
            waitframe(1);
        }
        iprintlnbold("<unknown string>");
    }

    // Namespace item_world_debug/item_world_debug
    // Params 0, eflags: 0x4
    // Checksum 0xec58082d, Offset: 0x1708
    // Size: 0x2b4
    function private function_f9efe895() {
        var_7f0b4b6b = [];
        buoy_stash = [];
        var_7f0b4b6b = function_91b29d2a("<unknown string>");
        buoy_stash = function_91b29d2a("<unknown string>");
        var_7f0b4b6b = arraycombine(var_7f0b4b6b, buoy_stash, 1, 0);
        player = util::gethostplayer();
        n_index = 0;
        var_d4714efb = 0;
        wait(1);
        iprintlnbold("<unknown string>");
        while (level.var_f9efe895) {
            if (player adsbuttonpressed() && player function_78931318("<unknown string>")) {
                if (n_index < var_7f0b4b6b.size - 1) {
                    n_index++;
                } else {
                    n_index = 0;
                }
            } else if (player adsbuttonpressed() && player function_78931318("<unknown string>")) {
                if (n_index == 0) {
                    n_index = var_7f0b4b6b.size - 1;
                } else {
                    n_index--;
                }
            }
            if (n_index != var_d4714efb) {
                v_player_pos = var_7f0b4b6b[n_index].origin + anglestoforward(var_7f0b4b6b[n_index].angles) * 96;
                var_543a44a5 = vectortoangles(var_7f0b4b6b[n_index].origin - v_player_pos + (0, 0, 36));
                player setorigin(v_player_pos);
                player setplayerangles(var_543a44a5);
                var_d4714efb = n_index;
                iprintlnbold("<unknown string>" + n_index);
                wait(0.1);
            }
            waitframe(1);
        }
        iprintlnbold("<unknown string>");
    }

    // Namespace item_world_debug/item_world_debug
    // Params 0, eflags: 0x4
    // Checksum 0xd8773e30, Offset: 0x19c8
    // Size: 0x32c
    function private function_f0d72128() {
        var_df1e5fef = [];
        var_df1e5fef = function_91b29d2a("<unknown string>");
        player = util::gethostplayer();
        if (!isdefined(level.var_99026891)) {
            level.var_99026891 = var_df1e5fef.size - 1;
        }
        var_d4714efb = 0;
        v_offset = (0, 0, 50);
        wait(1);
        iprintlnbold("<unknown string>");
        adddebugcommand("<unknown string>");
        while (level.var_f0d72128) {
            if (player jumpbuttonpressed() && player function_78931318("<unknown string>")) {
                if (level.var_99026891 < var_df1e5fef.size - 1) {
                    level.var_99026891++;
                } else {
                    level.var_99026891 = 0;
                }
            } else if (player jumpbuttonpressed() && player function_78931318("<unknown string>")) {
                if (level.var_99026891 == 0) {
                    level.var_99026891 = var_df1e5fef.size - 1;
                } else {
                    level.var_99026891--;
                }
            }
            if (level.var_99026891 != var_d4714efb) {
                debugstar(var_df1e5fef[level.var_99026891].origin, 190, (1, 1, 1));
                v_player_pos = var_df1e5fef[level.var_99026891].origin - anglestoright(var_df1e5fef[level.var_99026891].angles) * 128;
                var_543a44a5 = vectortoangles(var_df1e5fef[level.var_99026891].origin - v_player_pos);
                v_player_pos -= v_offset;
                player setorigin(v_player_pos);
                player setplayerangles(var_543a44a5);
                var_d4714efb = level.var_99026891;
                iprintlnbold("<unknown string>" + level.var_99026891);
                wait(0.1);
            }
            waitframe(1);
        }
        iprintlnbold("<unknown string>");
    }

    // Namespace item_world_debug/item_world_debug
    // Params 1, eflags: 0x0
    // Checksum 0xa3eb1c0a, Offset: 0x1d00
    // Size: 0x164
    function function_78931318(str_button) {
        switch (str_button) {
        case #"down":
            str_btn = "<unknown string>";
            var_7a00db94 = "<unknown string>";
            break;
        case #"left":
            str_btn = "<unknown string>";
            var_7a00db94 = "<unknown string>";
            break;
        case #"right":
            str_btn = "<unknown string>";
            var_7a00db94 = "<unknown string>";
            break;
        case #"up":
            str_btn = "<unknown string>";
            var_7a00db94 = "<unknown string>";
            break;
        }
        if (isdefined(str_btn)) {
            if (self buttonpressed(str_btn) || self buttonpressed(var_7a00db94)) {
                while (self buttonpressed(str_btn) || self buttonpressed(var_7a00db94)) {
                    waitframe(1);
                }
                return 1;
            }
        }
        return 0;
    }

    // Namespace item_world_debug/item_world_debug
    // Params 0, eflags: 0x4
    // Checksum 0x5f7575a9, Offset: 0x1e70
    // Size: 0x34a4
    function private function_cdd9b388() {
        while (true) {
            if (getdvarint(#"hash_326974dd9b8c3414", 0)) {
                wait(1);
            } else {
                waitframe(1);
            }
            if (!isdefined(level flagsys::get(#"item_world_initialized"))) {
                continue;
            }
            if (getdvarint(#"hash_4341150bd02e99a1", 0) > 0) {
                xoffset = 20;
                yoffset = 160;
                var_27afd540 = 15;
                var_9e681fbf = 10;
                if (!isdefined(level.var_f0d0335b)) {
                    level.var_f0d0335b = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540 + var_9e681fbf;
                }
                if (!isdefined(level.var_7f7d26cc)) {
                    level.var_7f7d26cc = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540;
                }
                if (!isdefined(level.var_6deb23ed)) {
                    level.var_6deb23ed = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540 + var_9e681fbf;
                }
                if (!isdefined(level.var_5c6c77b3)) {
                    level.var_5c6c77b3 = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540;
                }
                if (!isdefined(level.var_5471e557)) {
                    level.var_5471e557 = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540;
                }
                if (!isdefined(level.var_544a823a)) {
                    level.var_544a823a = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540;
                }
                if (!isdefined(level.var_eaa15f28)) {
                    level.var_eaa15f28 = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540;
                }
                if (!isdefined(level.var_6fc93583)) {
                    level.var_6fc93583 = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540;
                }
                if (!isdefined(level.var_f2a04fda)) {
                    level.var_f2a04fda = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540;
                }
                if (!isdefined(level.var_721a3621)) {
                    level.var_721a3621 = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540;
                }
                if (!isdefined(level.var_67220c03)) {
                    level.var_67220c03 = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540 + var_9e681fbf;
                }
                if (!isdefined(level.var_58faba13)) {
                    level.var_58faba13 = function_13d7bba(xoffset, yoffset);
                    yoffset += var_27afd540;
                }
                tab = "<unknown string>";
                level.var_f0d0335b settext("<unknown string>" + (isdefined(level.var_d80c35aa[#"blank"]) ? level.var_d80c35aa[#"blank"] : 0) + "<unknown string>" + int((isdefined(level.var_d80c35aa[#"blank"]) ? level.var_d80c35aa[#"blank"] : 0) / int(max(level.var_136445c0, 1) + (isdefined(level.var_d80c35aa[#"blank"]) ? level.var_d80c35aa[#"blank"] : 0)) * 100) + "<unknown string>");
                level.var_7f7d26cc settext("<unknown string>" + level.var_136445c0 + (isdefined(level.var_d80c35aa[#"blank"]) ? level.var_d80c35aa[#"blank"] : 0));
                level.var_6deb23ed settext("<unknown string>" + level.var_66e56764 + tab + tab + "<unknown string>" + level.var_136445c0 + tab + tab + "<unknown string>" + level.var_5720c09a + tab + tab + "<unknown string>" + level.var_2850ef5);
                level.var_5c6c77b3 settext(function_11421106("<unknown string>", "<unknown string>"));
                level.var_5471e557 settext(function_11421106("<unknown string>", "<unknown string>"));
                level.var_544a823a settext(function_11421106("<unknown string>", "<unknown string>"));
                level.var_eaa15f28 settext(function_11421106("<unknown string>", "<unknown string>"));
                level.var_6fc93583 settext(function_11421106("<unknown string>", "<unknown string>"));
                level.var_f2a04fda settext(function_11421106("<unknown string>", "<unknown string>"));
                level.var_721a3621 settext(function_11421106("<unknown string>", "<unknown string>"));
                level.var_67220c03 settext(function_11421106("<unknown string>", "<unknown string>"));
                level.var_58faba13 settext("<unknown string>" + (isdefined(level.var_f2db6a7f) ? level.var_f2db6a7f : 0));
            } else {
                if (isdefined(level.var_f0d0335b)) {
                    level.var_f0d0335b destroy();
                }
                if (isdefined(level.var_7f7d26cc)) {
                    level.var_7f7d26cc destroy();
                }
                if (isdefined(level.var_6deb23ed)) {
                    level.var_6deb23ed destroy();
                }
                if (isdefined(level.var_5c6c77b3)) {
                    level.var_5c6c77b3 destroy();
                }
                if (isdefined(level.var_5471e557)) {
                    level.var_5471e557 destroy();
                }
                if (isdefined(level.var_544a823a)) {
                    level.var_544a823a destroy();
                }
                if (isdefined(level.var_eaa15f28)) {
                    level.var_eaa15f28 destroy();
                }
                if (isdefined(level.var_6fc93583)) {
                    level.var_6fc93583 destroy();
                }
                if (isdefined(level.var_f2a04fda)) {
                    level.var_f2a04fda destroy();
                }
                if (isdefined(level.var_721a3621)) {
                    level.var_721a3621 destroy();
                }
                if (isdefined(level.var_67220c03)) {
                    level.var_67220c03 destroy();
                }
                if (isdefined(level.var_58faba13)) {
                    level.var_58faba13 destroy();
                }
            }
            if (getdvarint(#"hash_66ec171c69a26bfe", 0) > 0) {
                level clientfield::set("<unknown string>", 0);
            }
            if (getdvarint(#"hash_cc335a24301e7a1", 0) > 0) {
                if (!level.var_1d8e6dd8) {
                    level.var_1d8e6dd8 = 1;
                    level thread function_b6ea080();
                }
            }
            if (getdvarint(#"hash_7701b1eb7e173692", 0)) {
                if (!level.var_938d798a) {
                    wait(0.5);
                    level.var_938d798a = 1;
                    level thread function_938d798a();
                }
            }
            if (getdvarint(#"hash_7701b1eb7e173692", 0) == 0) {
                level.var_938d798a = 0;
            }
            if (getdvarint(#"hash_cb3296a761d4f6c", 0)) {
                if (!level.var_f9efe895) {
                    wait(0.5);
                    level.var_f9efe895 = 1;
                    level thread function_f9efe895();
                }
            }
            if (getdvarint(#"hash_cb3296a761d4f6c", 0) == 0) {
                level.var_f9efe895 = 0;
            }
            if (getdvarint(#"hash_4f4c47d52d6ad262", 0)) {
                if (!level.var_f0d72128) {
                    wait(0.5);
                    level.var_f0d72128 = 1;
                    level thread function_f0d72128();
                }
            }
            if (getdvarint(#"hash_4f4c47d52d6ad262", 0) == 0) {
                level.var_f0d72128 = 0;
            }
            if (getdvarint(#"hash_170b29b9b506feed", 0)) {
                setdvar(#"hash_170b29b9b506feed", 0);
                level thread function_bebe535();
            }
            if (getdvarint(#"hash_38ea7228f76d733f", 0)) {
                setdvar(#"hash_38ea7228f76d733f", 0);
                level thread function_2248268e();
            }
            if (getdvarint(#"hash_cc335a24301e7a1", 0) == 0) {
                level.var_1d8e6dd8 = 0;
            }
            if (getdvarint(#"hash_3fdd3b60f349d462", 0) > 0) {
                players = getplayers();
                if (players.size <= 0) {
                    continue;
                }
                origin = players[0].origin;
                var_f4b807cb = item_world::function_2e3efdda(origin, undefined, 128, 2000);
                foreach (item in var_f4b807cb) {
                    print3d(item.origin + (0, 0, 10), "<unknown string>" + item.networkid + "<unknown string>" + item.itementry.name, (1, 0.5, 0), 1, 0.4);
                }
            }
            if (getdvarint(#"hash_326974dd9b8c3414", 0)) {
                itemtype = getdvarint(#"hash_326974dd9b8c3414", 1);
                players = getplayers();
                if (players.size <= 0) {
                    continue;
                }
                origin = players[0].origin;
                if (itemtype == 13) {
                    atv_spawn = function_91b29d2a(#"atv_spawn");
                    cargo_truck_spawn = function_91b29d2a(#"cargo_truck_spawn");
                    cargo_truck_clearing_spawn = function_91b29d2a(#"cargo_truck_clearing_spawn");
                    heli_spawn = function_91b29d2a(#"heli_spawn");
                    heli_clearing_spawn = function_91b29d2a(#"heli_clearing_spawn");
                    zodiac_spawn = function_91b29d2a(#"zodiac_spawn");
                    var_e8750c36 = function_91b29d2a(#"zodiac_spawn_docks");
                    var_1901b1fa = function_91b29d2a(#"zodiac_spawn_hydro");
                    var_453c640c = function_91b29d2a(#"zodiac_spawn_nuketown");
                    var_b351e4a0 = function_91b29d2a(#"zodiac_spawn_skyscraper");
                    var_e4dc1e88 = function_91b29d2a(#"zodiac_spawn_hijacked");
                    muscle_car_spawn = function_91b29d2a(#"muscle_car_spawn");
                    arav_spawn = function_91b29d2a(#"arav_spawn");
                    suv_spawn = function_91b29d2a(#"suv_spawn");
                    pbr_spawn = function_91b29d2a(#"pbr_spawn");
                    foreach (vehicle in atv_spawn) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 0, 0), 1, 0, 10, 20);
                    }
                    foreach (vehicle in cargo_truck_spawn) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 1, 0), 1, 0, 10, 20);
                    }
                    foreach (vehicle in cargo_truck_clearing_spawn) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 1, 0), 1, 0, 10, 20);
                    }
                    foreach (vehicle in heli_spawn) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 0, 1), 1, 0, 10, 20);
                    }
                    foreach (vehicle in heli_clearing_spawn) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 0, 1), 1, 0, 10, 20);
                    }
                    foreach (vehicle in zodiac_spawn) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
                    }
                    foreach (vehicle in var_e8750c36) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
                    }
                    foreach (vehicle in var_1901b1fa) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
                    }
                    foreach (vehicle in var_453c640c) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
                    }
                    foreach (vehicle in var_b351e4a0) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
                    }
                    foreach (vehicle in var_e4dc1e88) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
                    }
                    foreach (vehicle in muscle_car_spawn) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (0, 1, 1), 1, 0, 10, 20);
                    }
                    foreach (vehicle in suv_spawn) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (0, 1, 1), 1, 0, 10, 20);
                    }
                    foreach (vehicle in arav_spawn) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (0.501961, 0.501961, 0), 1, 0, 10, 20);
                    }
                    foreach (vehicle in pbr_spawn) {
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        sphere(vehicle.origin, radius, (0, 1, 0), 1, 0, 10, 20);
                    }
                } else if (itemtype == 14) {
                    vehicles = getvehiclearray();
                    foreach (vehicle in vehicles) {
                        color = (0.75, 0.75, 0.75);
                        radius = 128;
                        var_84dd2a8b = 4096;
                        if (distancesquared(origin, vehicle.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, vehicle.origin) / var_84dd2a8b * radius, 1);
                        }
                        if (isdefined(vehicle.scriptvehicletype)) {
                            color = (1, 1, 1);
                            switch (vehicle.scriptvehicletype) {
                            case #"player_atv":
                                color = (0, 1, 1);
                                break;
                            case #"cargo_truck_wz":
                                color = (1, 1, 0);
                                break;
                            case #"tactical_raft_wz":
                                color = (1, 0.5, 0);
                                break;
                            case #"helicopter_light":
                                color = (1, 0, 1);
                                break;
                            }
                            sphere(vehicle.origin, radius, color, 1, 0, 10, 20);
                        }
                    }
                } else if (itemtype == 12) {
                    var_83f919af = function_91b29d2a(#"world_stash");
                    foreach (point in var_83f919af) {
                        player = level.players[0];
                        if (vectordot(player.origin, point.origin) > 0) {
                            color = (0, 0, 1);
                            radius = 128;
                            var_84dd2a8b = 4096;
                            if (distancesquared(origin, point.origin) < var_84dd2a8b * var_84dd2a8b) {
                                radius = max(distance(origin, point.origin) / var_84dd2a8b * radius, 1);
                            }
                            stash_items = item_world::function_2e3efdda(point.origin, undefined, 100, 1);
                            if (stash_items.size > 0) {
                                switch (stash_items[0].targetname) {
                                case #"world_dynent_stash_health":
                                    color = (1, 0, 0);
                                    break;
                                case #"world_dynent_stash_supply":
                                    color = (0, 1, 0);
                                    break;
                                case #"hash_ea6664e89a0bff6":
                                    color = (0.501961, 0.501961, 0);
                                    break;
                                }
                                sphere(point.origin, radius, color, 1, 0, 10, 20);
                                continue;
                            }
                            color = (0.75, 0.75, 0.75);
                            sphere(point.origin, radius, color, 1, 0, 10, 20);
                        }
                    }
                } else if (itemtype == 18) {
                    a_homunculi = getdynentarray("<unknown string>");
                    zombie_apoc_homunculus = getdynent("<unknown string>");
                    if (isdefined(zombie_apoc_homunculus)) {
                        if (!isdefined(a_homunculi)) {
                            a_homunculi = [];
                        } else if (!isarray(a_homunculi)) {
                            a_homunculi = array(a_homunculi);
                        }
                        a_homunculi[a_homunculi.size] = zombie_apoc_homunculus;
                    }
                    foreach (d_homunculus in a_homunculi) {
                        if (function_8a8a409b(d_homunculus)) {
                            sphere(d_homunculus.origin, 256, (0, 1, 0), 1, 0, 10, 20);
                        }
                    }
                } else {
                    var_f4b807cb = item_world::function_2e3efdda(origin, undefined, 4000, 30000, -1, 0);
                    foreach (item in var_f4b807cb) {
                        if (isdefined(item.itementry) && isdefined(item.itementry.rarity)) {
                            switch (item.itementry.rarity) {
                            case #"common":
                                color = (0, 1, 0);
                                break;
                            case #"rare":
                                color = (0, 0, 1);
                                break;
                            case #"legendary":
                                color = (1, 0, 1);
                                break;
                            case #"epic":
                                color = (1, 0.5, 0);
                                break;
                            default:
                                color = (1, 0, 0);
                                break;
                            }
                        } else {
                            color = (1, 0, 0);
                        }
                        radius = 64;
                        var_84dd2a8b = 2048;
                        if (distancesquared(origin, item.origin) < var_84dd2a8b * var_84dd2a8b) {
                            radius = max(distance(origin, item.origin) / var_84dd2a8b * radius, 1);
                        }
                        switch (itemtype) {
                        case 1:
                            color = (1, 0, 1);
                            sphere(item.origin, radius, color, 1, 0, 10, 20);
                            if (isdefined(item.targetname)) {
                                print3d(item.origin + (0, 0, 32), function_9e72a96(item.targetname), color, 1, 0.3, 20);
                            }
                            break;
                        case 2:
                            if (isdefined(item.itementry)) {
                                sphere(item.origin, radius, color, 1, 0, 10, 20);
                            }
                        case 3:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"ammo") {
                                sphere(item.origin, radius, color, 1, 0, 10, 20);
                            }
                            break;
                        case 4:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"weapon") {
                                sphere(item.origin, radius, color, 1, 0, 10, 20);
                            }
                            break;
                        case 5:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"health") {
                                if (item.itementry.name == "<unknown string>") {
                                    sphere(item.origin, radius, (0, 1, 0), 1, 0, 10, 20);
                                } else if (item.itementry.name == "<unknown string>") {
                                    sphere(item.origin, radius, (0, 0, 1), 1, 0, 10, 20);
                                } else if (item.itementry.name == "<unknown string>") {
                                    sphere(item.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
                                } else {
                                    sphere(item.origin, radius, color, 1, 0, 10, 20);
                                }
                            }
                            break;
                        case 6:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"armor") {
                                if (item.itementry.name == "<unknown string>") {
                                    sphere(item.origin, radius, (0, 1, 0), 1, 0, 10, 20);
                                } else if (item.itementry.name == "<unknown string>") {
                                    sphere(item.origin, radius, (0, 0, 1), 1, 0, 10, 20);
                                } else if (item.itementry.name == "<unknown string>") {
                                    sphere(item.origin, radius, (1, 1, 0), 1, 0, 10, 20);
                                } else {
                                    sphere(item.origin, radius, color, 1, 0, 10, 20);
                                }
                            }
                            break;
                        case 7:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"equipment") {
                                sphere(item.origin, radius, color, 1, 0, 10, 20);
                            }
                            break;
                        case 8:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"backpack") {
                                sphere(item.origin, radius, color, 1, 0, 10, 20);
                            }
                            break;
                        case 9:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"attachment") {
                                sphere(item.origin, radius, color, 1, 0, 10, 20);
                            }
                            break;
                        case 10:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"generic") {
                                sphere(item.origin, radius, color, 1, 0, 10, 20);
                            }
                            break;
                        case 11:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"killstreak") {
                                sphere(item.origin, radius, color, 1, 0, 10, 20);
                            }
                            break;
                        case 15:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"quest") {
                                sphere(item.origin, radius, (1, 0.5, 0), 1, 0, 10, 20);
                            }
                            break;
                        case 16:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"cash") {
                                sphere(item.origin, radius, color, 1, 0, 10, 20);
                            }
                            break;
                        case 17:
                            if (isdefined(item.itementry) && item.itementry.itemtype === #"resource") {
                                sphere(item.origin, radius, color, 1, 0, 10, 20);
                            }
                            break;
                        }
                    }
                }
            }
            if (getdvarint(#"hash_5d7b010a8d4f8666", 0)) {
                if (isdefined(level.var_8819644a)) {
                    foreach (info in level.var_8819644a) {
                        vehicle = info.vehicle;
                        spawnpoint = info.origin;
                        players = getplayers();
                        if (players.size <= 0) {
                            continue;
                        }
                        origin = players[0].origin;
                        if (isdefined(vehicle)) {
                            radius = 64;
                            var_84dd2a8b = 2048;
                            if (distancesquared(origin, spawnpoint) < var_84dd2a8b * var_84dd2a8b) {
                                radius = max(distance(origin, spawnpoint) / var_84dd2a8b * radius, 10);
                            }
                            sphere(spawnpoint, radius, (1, 1, 0), 1, 0, 10, 20);
                            line(spawnpoint, vehicle.origin, (0, 1, 0));
                            sphere(vehicle.origin, radius, (1, 0, 0), 1, 0, 10, 20);
                        }
                    }
                }
            }
        }
    }

    // Namespace item_world_debug/item_world_debug
    // Params 0, eflags: 0x4
    // Checksum 0xe576c1d, Offset: 0x5320
    // Size: 0x254
    function private _setup_devgui() {
        while (!canadddebugcommand()) {
            waitframe(1);
        }
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
    }

    // Namespace item_world_debug/item_world_debug
    // Params 0, eflags: 0x0
    // Checksum 0x39cc041c, Offset: 0x5580
    // Size: 0x8e
    function function_91ef342() {
        level endon(#"game_ended");
        while (true) {
            r = level waittill(#"devgui_bot");
            switch (r.args[0]) {
            case #"hash_29f59f6b62fdbf94":
                function_c07eae4e();
                break;
            }
        }
    }

    // Namespace item_world_debug/item_world_debug
    // Params 0, eflags: 0x0
    // Checksum 0xf86cfcaa, Offset: 0x5618
    // Size: 0x244
    function function_c07eae4e() {
        var_6e5bbee1 = [];
        itemcount = function_8322cf16();
        for (i = 0; i < itemcount; i++) {
            item = function_b1702735(i);
            if (isdefined(item.itementry) && item.itementry.itemtype == "<unknown string>" && item.itementry.weapon.isprimary) {
                array::add(var_6e5bbee1, item_world_util::function_35e06774(item.itementry), 0);
            }
        }
        var_6e5bbee1 = array::randomize(var_6e5bbee1);
        if (var_6e5bbee1.size == 0) {
            return;
        }
        players = getplayers();
        var_9db8ea1b = 0;
        foreach (player in players) {
            if (isbot(player)) {
                weapon = var_6e5bbee1[var_9db8ea1b];
                player giveweapon(weapon);
                player givemaxammo(weapon);
                player switchtoweaponimmediate(weapon);
                var_9db8ea1b++;
                if (var_9db8ea1b >= var_6e5bbee1.size) {
                    var_9db8ea1b = 0;
                }
            }
        }
    }

#/
