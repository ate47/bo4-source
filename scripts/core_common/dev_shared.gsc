// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/gestures.gsc;

#namespace dev;

// Namespace dev/dev_shared
// Params 5, eflags: 0x0
// Checksum 0xccbb20e9, Offset: 0x78
// Size: 0xbc
function debug_sphere(origin, radius, color, alpha, time) {
    /#
        if (!isdefined(time)) {
            time = 1000;
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        sides = int(10 * (1 + int(radius) % 100));
        sphere(origin, radius, color, alpha, 1, sides, time);
    #/
}

// Namespace dev/dev_shared
// Params 0, eflags: 0x0
// Checksum 0xa1f88f5b, Offset: 0x140
// Size: 0x3e6
function devgui_test_chart_think() {
    /#
        waitframe(1);
        old_val = getdvarint(#"scr_debug_test_chart", 0);
        scale = 120;
        for (;;) {
            val = getdvarint(#"scr_debug_test_chart", 0);
            if (old_val != val) {
                if (isdefined(level.test_chart_model)) {
                    level.test_chart_model delete();
                    level.test_chart_model = undefined;
                }
                if (val) {
                    player = getplayers()[0];
                    direction = player getplayerangles();
                    direction_vec = anglestoforward((0, direction[1], 0));
                    direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
                    level.test_chart_model = spawn("<unknown string>", player geteye() + direction_vec);
                    level.test_chart_model setmodel(#"test_chart_model");
                    level.test_chart_model.angles = (0, direction[1], 0) + vectorscale((0, 1, 0), 90);
                }
            }
            if (val) {
                player = getplayers()[0];
                if (val == 1) {
                    level.test_chart_model setmodel(#"test_chart_model");
                } else if (val == 2) {
                    level.test_chart_model setmodel(#"hash_70a102226734fb49");
                } else if (val == 3) {
                    level.test_chart_model setmodel(#"hash_70a101226734f996");
                }
                direction = player getplayerangles();
                direction_vec = anglestoforward((0, direction[1], 0));
                direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
                level.test_chart_model.angles = (0, direction[1], 0) + vectorscale((0, 1, 0), 90);
                level.test_chart_model.origin = player geteye() + direction_vec;
                if (player meleebuttonpressed()) {
                    scale = scale + 10;
                }
                if (player sprintbuttonpressed()) {
                    scale = scale - 10;
                }
            }
            old_val = val;
            waitframe(1);
        }
    #/
}

// Namespace dev/dev_shared
// Params 0, eflags: 0x0
// Checksum 0xe8efbeb2, Offset: 0x530
// Size: 0xad4
function updateminimapsetting() {
    /#
        requiredmapaspectratio = getdvarfloat(#"scr_requiredmapaspectratio", 0);
        if (!isdefined(level.minimapheight)) {
            setdvar(#"scr_minimap_height", 0);
            level.minimapheight = 0;
        }
        minimapheight = getdvarfloat(#"scr_minimap_height", 0);
        if (minimapheight != level.minimapheight) {
            if (minimapheight <= 0) {
                util::gethostplayer() cameraactivate(0);
                level.minimapheight = minimapheight;
                level notify(#"end_draw_map_bounds");
            }
            if (minimapheight > 0) {
                level.minimapheight = minimapheight;
                players = getplayers();
                if (players.size > 0) {
                    player = util::gethostplayer();
                    corners = getentarray("<unknown string>", "<unknown string>");
                    if (corners.size == 2) {
                        viewpos = corners[0].origin + corners[1].origin;
                        viewpos = (viewpos[0] * 0.5, viewpos[1] * 0.5, viewpos[2] * 0.5);
                        level thread minimapwarn(corners);
                        maxcorner = (corners[0].origin[0], corners[0].origin[1], viewpos[2]);
                        mincorner = (corners[0].origin[0], corners[0].origin[1], viewpos[2]);
                        if (corners[1].origin[0] > corners[0].origin[0]) {
                            maxcorner = (corners[1].origin[0], maxcorner[1], maxcorner[2]);
                        } else {
                            mincorner = (corners[1].origin[0], mincorner[1], mincorner[2]);
                        }
                        if (corners[1].origin[1] > corners[0].origin[1]) {
                            maxcorner = (maxcorner[0], corners[1].origin[1], maxcorner[2]);
                        } else {
                            mincorner = (mincorner[0], corners[1].origin[1], mincorner[2]);
                        }
                        viewpostocorner = maxcorner - viewpos;
                        viewpos = (viewpos[0], viewpos[1], viewpos[2] + minimapheight);
                        northvector = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
                        eastvector = (northvector[1], 0 - northvector[0], 0);
                        disttotop = vectordot(northvector, viewpostocorner);
                        if (disttotop < 0) {
                            disttotop = 0 - disttotop;
                        }
                        disttoside = vectordot(eastvector, viewpostocorner);
                        if (disttoside < 0) {
                            disttoside = 0 - disttoside;
                        }
                        if (requiredmapaspectratio > 0) {
                            mapaspectratio = disttoside / disttotop;
                            if (mapaspectratio < requiredmapaspectratio) {
                                incr = requiredmapaspectratio / mapaspectratio;
                                disttoside = disttoside * incr;
                                addvec = vecscale(eastvector, vectordot(eastvector, maxcorner - viewpos) * (incr - 1));
                                mincorner = mincorner - addvec;
                                maxcorner = maxcorner + addvec;
                            } else {
                                incr = mapaspectratio / requiredmapaspectratio;
                                disttotop = disttotop * incr;
                                addvec = vecscale(northvector, vectordot(northvector, maxcorner - viewpos) * (incr - 1));
                                mincorner = mincorner - addvec;
                                maxcorner = maxcorner + addvec;
                            }
                        }
                        if (level.console) {
                            aspectratioguess = 1.77778;
                            angleside = 2 * atan(disttoside * 0.8 / minimapheight);
                            angletop = 2 * atan(disttotop * aspectratioguess * 0.8 / minimapheight);
                        } else {
                            aspectratioguess = 1.33333;
                            angleside = 2 * atan(disttoside / minimapheight);
                            angletop = 2 * atan(disttotop * aspectratioguess / minimapheight);
                        }
                        if (angleside > angletop) {
                            angle = angleside;
                        } else {
                            angle = angletop;
                        }
                        znear = minimapheight - 1000;
                        if (znear < 16) {
                            znear = 16;
                        }
                        if (znear > 10000) {
                            znear = 10000;
                        }
                        player camerasetposition(viewpos, (90, getnorthyaw(), 0));
                        player cameraactivate(1);
                        player takeallweapons();
                        setdvar(#"cg_drawgun", 0);
                        setdvar(#"cg_draw2d", 0);
                        setdvar(#"cg_drawfps", 0);
                        setdvar(#"fx_enable", 0);
                        setdvar(#"r_fog", 0);
                        setdvar(#"r_highloddist", 0);
                        setdvar(#"r_znear", znear);
                        setdvar(#"r_lodscalerigid", 0.1);
                        setdvar(#"cg_drawversion", 0);
                        setdvar(#"sm_enable", 1);
                        setdvar(#"player_view_pitch_down", 90);
                        setdvar(#"player_view_pitch_up", 0);
                        setdvar(#"cg_fov", angle);
                        setdvar(#"cg_drawminimap", 1);
                        setdvar(#"r_umbranumthreads", 1);
                        setdvar(#"r_umbradistancescale", 0.1);
                        setdvar(#"r_uselensfov", 0);
                        setdvar(#"hash_5ee9a4ac16993e50", 1);
                        setdvar(#"debug_show_viewpos", 0);
                        thread drawminimapbounds(viewpos, mincorner, maxcorner);
                    } else {
                        println("<unknown string>");
                    }
                } else {
                    setdvar(#"scr_minimap_height", 0);
                }
            }
        }
    #/
}

// Namespace dev/dev_shared
// Params 2, eflags: 0x0
// Checksum 0x270fadc7, Offset: 0x1010
// Size: 0x4a
function vecscale(vec, scalar) {
    /#
        return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
    #/
}

// Namespace dev/dev_shared
// Params 3, eflags: 0x0
// Checksum 0x8cbc3e27, Offset: 0x1068
// Size: 0x396
function drawminimapbounds(viewpos, mincorner, maxcorner) {
    /#
        level notify(#"end_draw_map_bounds");
        level endon(#"end_draw_map_bounds");
        viewheight = viewpos[2] - maxcorner[2];
        north = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
        diaglen = length(mincorner - maxcorner);
        mincorneroffset = mincorner - viewpos;
        mincorneroffset = vectornormalize((mincorneroffset[0], mincorneroffset[1], 0));
        mincorner = mincorner + vecscale(mincorneroffset, diaglen * 1 / 800);
        maxcorneroffset = maxcorner - viewpos;
        maxcorneroffset = vectornormalize((maxcorneroffset[0], maxcorneroffset[1], 0));
        maxcorner = maxcorner + vecscale(maxcorneroffset, diaglen * 1 / 800);
        diagonal = maxcorner - mincorner;
        side = vecscale(north, vectordot(diagonal, north));
        sidenorth = vecscale(north, abs(vectordot(diagonal, north)));
        corner0 = mincorner;
        corner1 = mincorner + side;
        corner2 = maxcorner;
        corner3 = maxcorner - side;
        toppos = vecscale(mincorner + maxcorner, 0.5) + vecscale(sidenorth, 0.51);
        textscale = diaglen * 0.003;
        while (1) {
            line(corner0, corner1);
            line(corner1, corner2);
            line(corner2, corner3);
            line(corner3, corner0);
            print3d(toppos, "<unknown string>", (1, 1, 1), 1, textscale);
            waitframe(1);
        }
    #/
}

// Namespace dev/dev_shared
// Params 1, eflags: 0x0
// Checksum 0xb0ff35b0, Offset: 0x1408
// Size: 0x10
function minimapwarn(corners) {
    /#
    #/
}

// Namespace dev/dev_shared
// Params 0, eflags: 0x0
// Checksum 0xdae5961e, Offset: 0x1420
// Size: 0x11e
function function_e5746ec1() {
    /#
        host = util::gethostplayer();
        all_players = getplayers();
        var_1645eaac = host getstance() == "<unknown string>";
        if (!isdefined(host) || var_1645eaac) {
            return all_players;
        }
        all_players = arraysort(all_players, host.origin);
        players = [];
        if (all_players.size == 1 || host getstance() == "<unknown string>") {
            players[0] = host;
        } else {
            players[0] = all_players[1];
        }
        return players;
    #/
}

// Namespace dev/dev_shared
// Params 2, eflags: 0x0
// Checksum 0xf7482fb4, Offset: 0x1548
// Size: 0xc8
function function_5639909a(bodytype, outfitindex) {
    /#
        players = function_e5746ec1();
        foreach (player in players) {
            player setcharacterbodytype(bodytype);
            player setcharacteroutfit(outfitindex);
        }
    #/
}

// Namespace dev/dev_shared
// Params 4, eflags: 0x0
// Checksum 0x7356cd84, Offset: 0x1618
// Size: 0x178
function function_f413b4d5(bodytype, outfitindex, var_c1154821, index) {
    /#
        players = function_e5746ec1();
        if (var_c1154821 == "<unknown string>") {
            foreach (player in players) {
                player function_fbc5a093(index);
            }
        } else {
            foreach (player in players) {
                if (var_c1154821 == "<unknown string>") {
                    player setcharacterwarpaintoutfit(outfitindex);
                }
                player function_ab96a9b5(var_c1154821, index);
            }
        }
    #/
}

// Namespace dev/dev_shared
// Params 1, eflags: 0x0
// Checksum 0x1b63a7b2, Offset: 0x1798
// Size: 0x3ca
function body_customization_process_command(character_index) {
    /#
        /#
            println("<unknown string>" + character_index + "<unknown string>");
        #/
        split = strtok(character_index, "<unknown string>");
        switch (split.size) {
        case 1:
            command0 = strtok(split[0], "<unknown string>");
            bodytype = int(command0[1]);
            /#
                println("<unknown string>" + bodytype + "<unknown string>");
            #/
            function_5639909a(bodytype, 0);
            break;
        case 2:
            command0 = strtok(split[0], "<unknown string>");
            bodytype = int(command0[1]);
            command1 = strtok(split[1], "<unknown string>");
            outfitindex = int(command1[1]);
            /#
                println("<unknown string>" + bodytype + "<unknown string>" + outfitindex + "<unknown string>");
            #/
            function_5639909a(bodytype, outfitindex);
            break;
        case 3:
            command0 = strtok(split[0], "<unknown string>");
            bodytype = int(command0[1]);
            command1 = strtok(split[1], "<unknown string>");
            outfitindex = int(command1[1]);
            var_e7f74d2b = strtok(split[2], "<unknown string>");
            var_c1154821 = var_e7f74d2b[0];
            index = int(var_e7f74d2b[1]);
            /#
                println("<unknown string>" + bodytype + "<unknown string>" + outfitindex + "<unknown string>" + var_c1154821 + "<unknown string>" + index + "<unknown string>");
            #/
            function_f413b4d5(bodytype, outfitindex, var_c1154821, index);
            break;
        default:
            break;
        }
    #/
}

// Namespace dev/dev_shared
// Params 5, eflags: 0x0
// Checksum 0x5a43aefc, Offset: 0x1b70
// Size: 0x120
function function_3cec5609(arr&, devgui_path, bodytype, outfitindex, optiontype) {
    /#
        foreach (index, option in arr) {
            if (option.isvalid) {
                util::add_debug_command(devgui_path + index + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + bodytype + "<unknown string>" + "<unknown string>" + outfitindex + "<unknown string>" + optiontype + "<unknown string>" + index + "<unknown string>");
            }
        }
    #/
}

// Namespace dev/dev_shared
// Params 1, eflags: 0x0
// Checksum 0x59966e49, Offset: 0x1c98
// Size: 0x44
function function_2c6232e5(in_string) {
    /#
        out_string = strreplace(in_string, "<unknown string>", "<unknown string>");
        return out_string;
    #/
}

// Namespace dev/dev_shared
// Params 1, eflags: 0x0
// Checksum 0x5b6530e7, Offset: 0x1ce8
// Size: 0x150
function function_970d4891(mode) {
    /#
        bodies = getallcharacterbodies(mode);
        foreach (playerbodytype in bodies) {
            body_name = function_2c6232e5(makelocalizedstring(getcharacterdisplayname(playerbodytype, mode))) + "<unknown string>" + function_9e72a96(getcharacterassetname(playerbodytype, mode));
            util::add_devgui("<unknown string>" + body_name + "<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>" + body_name);
        }
    #/
}

// Namespace dev/dev_shared
// Params 2, eflags: 0x0
// Checksum 0xdd3c4ed4, Offset: 0x1e40
// Size: 0x7fa
function body_customization_populate(mode, var_ef4940a5) {
    /#
        bodies = getallcharacterbodies(mode);
        body_customization_devgui_base = "<unknown string>" + "<unknown string>";
        foreach (playerbodytype in bodies) {
            body_name = function_2c6232e5(makelocalizedstring(getcharacterdisplayname(playerbodytype, mode))) + "<unknown string>" + function_9e72a96(getcharacterassetname(playerbodytype, mode));
            if (isdefined(var_ef4940a5) && var_ef4940a5 != body_name) {
                continue;
            }
            util::add_debug_command(body_customization_devgui_base + body_name + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + playerbodytype + "<unknown string>");
            var_13240050 = function_d299ef16(playerbodytype, mode);
            for (outfitindex = 0; outfitindex < var_13240050; outfitindex++) {
                var_9cf37283 = function_d7c3cf6c(playerbodytype, outfitindex, mode);
                if (var_9cf37283.valid) {
                    var_346660ac = function_2c6232e5(makelocalizedstring(function_9e72a96(var_9cf37283.var_74996050)));
                    var_1bf829f2 = outfitindex + "<unknown string>" + var_346660ac + "<unknown string>" + function_9e72a96(var_9cf37283.namehash) + "<unknown string>" + outfitindex;
                    var_a818c4e = body_customization_devgui_base + body_name + "<unknown string>" + var_1bf829f2;
                    util::add_debug_command(var_a818c4e + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + playerbodytype + "<unknown string>" + "<unknown string>" + outfitindex + "<unknown string>");
                    types = [7:{#field:"<unknown string>", #path:"<unknown string>"}, 6:{#field:"<unknown string>", #path:"<unknown string>"}, 5:{#field:"<unknown string>", #path:"<unknown string>"}, 4:{#field:"<unknown string>", #path:"<unknown string>"}, 3:{#field:"<unknown string>", #path:"<unknown string>"}, 2:{#field:"<unknown string>", #path:"<unknown string>"}, 1:{#field:"<unknown string>", #path:"<unknown string>"}, 0:{#field:"<unknown string>", #path:"<unknown string>"}];
                    foreach (type, data in types) {
                        foreach (index, option in var_9cf37283.options[type]) {
                            if (option.isvalid) {
                                util::waittill_can_add_debug_command();
                                util::add_debug_command(var_a818c4e + "<unknown string>" + data.path + "<unknown string>" + index + "<unknown string>" + index + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + playerbodytype + "<unknown string>" + "<unknown string>" + outfitindex + "<unknown string>" + data.field + "<unknown string>" + index + "<unknown string>");
                            }
                        }
                    }
                    for (var_56fe70a0 = 0; var_56fe70a0 < var_9cf37283.presets.size; var_56fe70a0++) {
                        preset = var_9cf37283.presets[var_56fe70a0];
                        if (!preset.isvalid) {
                            continue;
                        }
                        util::waittill_can_add_debug_command();
                        util::add_debug_command(var_a818c4e + "<unknown string>" + "<unknown string>" + var_56fe70a0 + "<unknown string>" + var_56fe70a0 + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + playerbodytype + "<unknown string>" + "<unknown string>" + outfitindex + "<unknown string>" + "<unknown string>" + "<unknown string>" + var_56fe70a0 + "<unknown string>");
                    }
                }
                if (isdefined(var_ef4940a5)) {
                    util::remove_devgui("<unknown string>" + body_name + "<unknown string>");
                }
            }
        }
    #/
}

// Namespace dev/dev_shared
// Params 1, eflags: 0x0
// Checksum 0xbddd4895, Offset: 0x2648
// Size: 0x138
function body_customization_devgui(mode) {
    /#
        function_970d4891(mode);
        for (;;) {
            var_f12e4923 = getdvarstring(#"hash_2195b248bfe1371e", "<unknown string>");
            if (var_f12e4923 != "<unknown string>") {
                level thread body_customization_populate(mode, var_f12e4923);
                setdvar(#"hash_2195b248bfe1371e", "<unknown string>");
            }
            character_index = getdvarstring(#"char_devgui", "<unknown string>");
            if (character_index != "<unknown string>") {
                body_customization_process_command(character_index);
                setdvar(#"char_devgui", "<unknown string>");
            }
            wait(0.5);
        }
    #/
}

// Namespace dev/dev_shared
// Params 2, eflags: 0x0
// Checksum 0x6e9695a3, Offset: 0x2788
// Size: 0xbc
function add_perk_devgui(name, specialties) {
    /#
        perk_devgui_base = "<unknown string>";
        perk_name = name;
        test = perk_devgui_base + perk_name + "<unknown string>" + "<unknown string>" + "<unknown string>" + specialties + "<unknown string>";
        util::add_debug_command(perk_devgui_base + perk_name + "<unknown string>" + "<unknown string>" + "<unknown string>" + specialties + "<unknown string>");
    #/
}

// Namespace dev/dev_shared
// Params 2, eflags: 0x0
// Checksum 0xa0b65a95, Offset: 0x2850
// Size: 0xcc
function function_373068ca(name, postfix) {
    /#
        if (!isdefined(postfix)) {
            postfix = "<unknown string>";
        }
        if (!isdefined(name)) {
            return;
        }
        if (name == "<unknown string>") {
            return;
        }
        util::waittill_can_add_debug_command();
        talentname = "<unknown string>" + name + postfix;
        cmd = "<unknown string>" + "<unknown string>" + "<unknown string>" + talentname;
        util::add_devgui("<unknown string>" + talentname, cmd);
    #/
}

// Namespace dev/dev_shared
// Params 2, eflags: 0x0
// Checksum 0x4248fc2b, Offset: 0x2928
// Size: 0xdc
function function_8263c0d5(name, postfix) {
    /#
        if (!isdefined(postfix)) {
            postfix = "<unknown string>";
        }
        if (!isdefined(name)) {
            return;
        }
        if (name == "<unknown string>") {
            return;
        }
        util::waittill_can_add_debug_command();
        talentname = "<unknown string>" + getsubstr(name, 7) + postfix;
        cmd = "<unknown string>" + "<unknown string>" + "<unknown string>" + talentname;
        util::add_devgui("<unknown string>" + talentname, cmd);
    #/
}

// Namespace dev/dev_shared
// Params 0, eflags: 0x0
// Checksum 0xc35e7327, Offset: 0x2a10
// Size: 0x17c
function function_a432e633() {
    /#
        gesture = getdvarstring(#"scr_givegesture");
        if (isdefined(gesture) && gesture != "<unknown string>") {
            foreach (player in level.players) {
                if (isbot(player)) {
                    continue;
                }
                player gestures::clear_gesture();
                player.loadoutgesture = getweapon(gesture);
                if (isdefined(player.loadoutgesture) && player.loadoutgesture != level.weaponnone) {
                    player gestures::give_gesture(player.loadoutgesture);
                }
            }
        }
        setdvar(#"scr_givegesture", "<unknown string>");
    #/
}

// Namespace dev/dev_shared
// Params 0, eflags: 0x0
// Checksum 0xa5c6773, Offset: 0x2b98
// Size: 0x90
function function_487bf571() {
    /#
        for (;;) {
            gesture = getdvarstring(#"scr_givegesture");
            if (gesture != "<unknown string>") {
                function_a432e633();
            }
            setdvar(#"scr_givegesture", "<unknown string>");
            wait(0.5);
        }
    #/
}

// Namespace dev/dev_shared
// Params 1, eflags: 0x0
// Checksum 0x18d0ac7a, Offset: 0x2c30
// Size: 0xca
function get_lookat_origin(player) {
    /#
        angles = player getplayerangles();
        forward = anglestoforward(angles);
        dir = vectorscale(forward, 8000);
        eye = player geteye();
        trace = bullettrace(eye, eye + dir, 0, undefined);
        return trace[#"position"];
    #/
}

// Namespace dev/dev_shared
// Params 2, eflags: 0x0
// Checksum 0x80adb512, Offset: 0x2d08
// Size: 0x6c
function draw_pathnode(node, color) {
    /#
        if (!isdefined(color)) {
            color = (1, 0, 1);
        }
        box(node.origin, vectorscale((-1, -1, 0), 16), vectorscale((1, 1, 1), 16), 0, color, 1, 0, 1);
    #/
}

// Namespace dev/dev_shared
// Params 2, eflags: 0x0
// Checksum 0x41b1948b, Offset: 0x2d80
// Size: 0x4e
function draw_pathnode_think(node, color) {
    /#
        level endon(#"draw_pathnode_stop");
        for (;;) {
            draw_pathnode(node, color);
            waitframe(1);
        }
    #/
}

// Namespace dev/dev_shared
// Params 0, eflags: 0x0
// Checksum 0xd865e538, Offset: 0x2dd8
// Size: 0x20
function draw_pathnodes_stop() {
    /#
        wait(5);
        level notify(#"draw_pathnode_stop");
    #/
}

// Namespace dev/dev_shared
// Params 1, eflags: 0x0
// Checksum 0xca466bcd, Offset: 0x2e00
// Size: 0x120
function node_get(player) {
    /#
        for (;;) {
            waitframe(1);
            origin = get_lookat_origin(player);
            node = getnearestnode(origin);
            if (!isdefined(node)) {
                continue;
            }
            if (player buttonpressed("<unknown string>")) {
                return node;
            } else if (player buttonpressed("<unknown string>")) {
                return undefined;
            }
            if (node.type == #"path") {
                draw_pathnode(node, (1, 0, 1));
            } else {
                draw_pathnode(node, (0.85, 0.85, 0.1));
            }
        }
    #/
}

// Namespace dev/dev_shared
// Params 0, eflags: 0x0
// Checksum 0x736182bf, Offset: 0x2f28
// Size: 0x1a6
function dev_get_node_pair() {
    /#
        player = util::gethostplayer();
        start = undefined;
        while (!isdefined(start)) {
            start = node_get(player);
            if (player buttonpressed("<unknown string>")) {
                level notify(#"draw_pathnode_stop");
                return undefined;
            }
        }
        level thread draw_pathnode_think(start, (0, 1, 0));
        while (player buttonpressed("<unknown string>")) {
            waitframe(1);
        }
        end = undefined;
        while (!isdefined(end)) {
            end = node_get(player);
            if (player buttonpressed("<unknown string>")) {
                level notify(#"draw_pathnode_stop");
                return undefined;
            }
        }
        level thread draw_pathnode_think(end, (0, 1, 0));
        level thread draw_pathnodes_stop();
        array = [];
        array[0] = start;
        array[1] = end;
        return array;
    #/
}

// Namespace dev/dev_shared
// Params 2, eflags: 0x0
// Checksum 0xdfd4b232, Offset: 0x30d8
// Size: 0x54
function draw_point(origin, color) {
    /#
        if (!isdefined(color)) {
            color = (1, 0, 1);
        }
        sphere(origin, 16, color, 0.25, 0, 16, 1);
    #/
}

// Namespace dev/dev_shared
// Params 1, eflags: 0x0
// Checksum 0x97abd4a0, Offset: 0x3138
// Size: 0xa0
function point_get(player) {
    /#
        for (;;) {
            waitframe(1);
            origin = get_lookat_origin(player);
            if (player buttonpressed("<unknown string>")) {
                return origin;
            } else if (player buttonpressed("<unknown string>")) {
                return undefined;
            }
            draw_point(origin, (1, 0, 1));
        }
    #/
}

// Namespace dev/dev_shared
// Params 0, eflags: 0x0
// Checksum 0x782a7195, Offset: 0x31e0
// Size: 0xfc
function dev_get_point_pair() {
    /#
        player = util::gethostplayer();
        start = undefined;
        points = [];
        while (!isdefined(start)) {
            start = point_get(player);
            if (!isdefined(start)) {
                return points;
            }
        }
        while (player buttonpressed("<unknown string>")) {
            waitframe(1);
        }
        end = undefined;
        while (!isdefined(end)) {
            end = point_get(player);
            if (!isdefined(end)) {
                return points;
            }
        }
        points[0] = start;
        points[1] = end;
        return points;
    #/
}

