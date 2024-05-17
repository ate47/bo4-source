// Atian COD Tools GSC decompiler test
#using scripts\weapons\deployable.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace smart_cover;

// Namespace smart_cover/gadget_smart_cover
// Params 0, eflags: 0x0
// Checksum 0x78d3d525, Offset: 0x240
// Size: 0x264
function init_shared() {
    callback::on_localplayer_spawned(&on_local_player_spawned);
    clientfield::register("scriptmover", "smartcover_placed", 1, 5, "float", &smartcover_placed, 0, 0);
    clientfield::register("clientuimodel", "hudItems.smartCoverState", 1, 1, "int", undefined, 0, 0);
    clientfield::register("scriptmover", "start_smartcover_microwave", 1, 1, "int", &smartcover_start_microwave, 0, 0);
    level.smartcoversettings = spawnstruct();
    level.smartcoversettings.previewmodels = [];
    level.smartcoversettings.var_aef370a9 = [];
    level.smartcoversettings.weapon = getweapon(#"ability_smart_cover");
    deployable::register_deployable(level.smartcoversettings.weapon, 1);
    if (sessionmodeismultiplayergame()) {
        level.smartcoversettings.bundle = getscriptbundle(#"smartcover_settings_mp");
    } else if (sessionmodeiswarzonegame()) {
        level.smartcoversettings.bundle = getscriptbundle(#"smartcover_settings_wz");
    } else if (sessionmodeiscampaigngame()) {
        level.smartcoversettings.bundle = getscriptbundle(#"smartcover_settings_cp");
    }
    setupdvars();
}

// Namespace smart_cover/gadget_smart_cover
// Params 0, eflags: 0x0
// Checksum 0x219a8e38, Offset: 0x4b0
// Size: 0x28c
function setupdvars() {
    setdvar(#"hash_25f7092e7c7b66f2", 0);
    setdvar(#"hash_4332205cbf1cc384", 0);
    setdvar(#"smartcover_drawtime", 1000);
    setdvar(#"hash_436fc2fad44e9041", 1);
    setdvar(#"hash_1d8eb304f5cf8033", 1);
    setdvar(#"smartcover_tracedistance", level.smartcoversettings.bundle.var_1f0ae388);
    setdvar(#"hash_13c23fd3a4387b84", 8);
    setdvar(#"hash_55a8dba3350b8b7c", 4);
    setdvar(#"hash_4f4ce3cb18b004bc", 10);
    setdvar(#"hash_417afa70d515fba5", isdefined(level.smartcoversettings.bundle.var_76d79155) ? level.smartcoversettings.bundle.var_76d79155 : 0);
    setdvar(#"hash_71f8bd4cd30de4b3", isdefined(level.smartcoversettings.bundle.var_e35fc674) ? level.smartcoversettings.bundle.var_e35fc674 : 0);
    setdvar(#"hash_39a564d4801c4b2e", isdefined(level.smartcoversettings.bundle.var_1f0ae388) ? level.smartcoversettings.bundle.var_1f0ae388 : 0);
}

// Namespace smart_cover/gadget_smart_cover
// Params 7, eflags: 0x0
// Checksum 0x7bc02cc0, Offset: 0x748
// Size: 0xc6
function smartcover_start_microwave(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(level.smartcoversettings.bundle.var_f4e0e7d7) && level.smartcoversettings.bundle.var_f4e0e7d7 && newval == 1) {
        self thread startmicrowavefx(localclientnum);
        return;
    }
    if (newval == 0) {
        self notify(#"beam_stop");
    }
}

// Namespace smart_cover/gadget_smart_cover
// Params 7, eflags: 0x0
// Checksum 0x4570b1f3, Offset: 0x818
// Size: 0x19c
function smartcover_placed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    if (!isdefined(level.smartcoversettings.bundle.deployanim)) {
        return;
    }
    self useanimtree("generic");
    if (newval == 1) {
        self setanimrestart(level.smartcoversettings.bundle.deployanim, 1, 0, 1);
        return;
    }
    if (bwastimejump) {
        currentanimtime = self getanimtime(level.smartcoversettings.bundle.deployanim);
        var_f56117a2 = 1 - newval;
        if (var_f56117a2 < currentanimtime) {
            self setanimtime(level.smartcoversettings.bundle.deployanim, var_f56117a2);
        }
    }
}

// Namespace smart_cover/gadget_smart_cover
// Params 1, eflags: 0x0
// Checksum 0xaca90d1b, Offset: 0x9c0
// Size: 0xb0
function function_112e3e89(localclientnum) {
    if (!isdefined(level.smartcoversettings.previewmodels[localclientnum])) {
        return;
    }
    foreach (previewmodel in level.smartcoversettings.previewmodels[localclientnum]) {
        previewmodel hide();
    }
}

// Namespace smart_cover/gadget_smart_cover
// Params 1, eflags: 0x0
// Checksum 0xd5afd0f6, Offset: 0xa78
// Size: 0x4e
function function_fd04d5d5(localclientnum) {
    player = self;
    player function_112e3e89(localclientnum);
    level.smartcoversettings.var_aef370a9[localclientnum] = 0;
}

// Namespace smart_cover/gadget_smart_cover
// Params 1, eflags: 0x0
// Checksum 0x122af5e9, Offset: 0xad0
// Size: 0x328
function function_1c2930c7(localclientnum) {
    player = function_5c10bd79(localclientnum);
    player notify(#"hash_5c7dbac0591cb11f");
    player endon(#"hash_5c7dbac0591cb11f", #"game_ended");
    level endon(#"game_ended");
    level.smartcoversettings.var_aef370a9[localclientnum] = 1;
    function_722fc669(localclientnum);
    var_ccfe777 = 0;
    while (true) {
        waitframe(1);
        player = function_5c10bd79(localclientnum);
        if (!isdefined(player)) {
            break;
        }
        var_b43e8dc2 = player function_287dcf4b(level.smartcoversettings.bundle.var_63aab046, level.smartcoversettings.bundle.maxwidth, 1, 1, level.smartcoversettings.smartcoverweapon);
        if (!isdefined(var_b43e8dc2) && !var_ccfe777) {
            var_ccfe777 = 1;
            player function_112e3e89(localclientnum);
            player function_bf191832(0, (0, 0, 0), (0, 0, 0));
            continue;
        } else if (isdefined(var_b43e8dc2) && var_ccfe777) {
            var_ccfe777 = 0;
        } else if (!isdefined(var_b43e8dc2)) {
            player function_bf191832(0, (0, 0, 0), (0, 0, 0));
            continue;
        }
        if (isdefined(level.smartcoversettings.bundle.var_8fa9aac4) ? level.smartcoversettings.bundle.var_8fa9aac4 : 0) {
            if (var_b43e8dc2.var_bf9ca9b0) {
                previewmodel = player function_8fb44aff(localclientnum, var_b43e8dc2.origin, var_b43e8dc2.angles, var_b43e8dc2.isvalid, 0, 1);
                continue;
            }
            previewmodel = player function_8fb44aff(localclientnum, var_b43e8dc2.origin, var_b43e8dc2.angles, var_b43e8dc2.isvalid, 2, 3);
            previewmodel function_dbaf4647(localclientnum);
            previewmodel function_5a8becdc(localclientnum, player, var_b43e8dc2, 1);
        }
    }
}

// Namespace smart_cover/gadget_smart_cover
// Params 1, eflags: 0x0
// Checksum 0xeec8fce6, Offset: 0xe00
// Size: 0x4c
function function_59605cb(localclientnum) {
    player = self;
    player notify(#"hash_5c7dbac0591cb11f");
    player function_fd04d5d5(localclientnum);
}

// Namespace smart_cover/gadget_smart_cover
// Params 1, eflags: 0x0
// Checksum 0x774ecdf6, Offset: 0xe58
// Size: 0x7e
function function_17d973ec(localclientnum) {
    player = function_5c10bd79(localclientnum);
    player notify(#"hash_5c39bdc22418d792");
    player endon(#"hash_5c39bdc22418d792");
    if (!isdefined(player.smartcover)) {
        player.smartcover = spawnstruct();
    }
}

// Namespace smart_cover/gadget_smart_cover
// Params 1, eflags: 0x0
// Checksum 0x714a013a, Offset: 0xee0
// Size: 0x78
function function_5d802b86(localclientnum) {
    player = self;
    player endon(#"disconnect");
    player waittill(#"death");
    player function_59605cb(localclientnum);
    player notify(#"hash_5c39bdc22418d792");
}

// Namespace smart_cover/gadget_smart_cover
// Params 1, eflags: 0x0
// Checksum 0x93a55c8b, Offset: 0xf60
// Size: 0xc
function on_local_player_spawned(localclientnum) {
    
}

// Namespace smart_cover/gadget_smart_cover
// Params 2, eflags: 0x0
// Checksum 0x119aa0de, Offset: 0xf78
// Size: 0x88
function function_641491ac(localclientnum, modelname) {
    previewmodel = spawn(localclientnum, (0, 0, 0), "script_model");
    previewmodel setmodel(modelname);
    previewmodel hide();
    previewmodel notsolid();
    return previewmodel;
}

// Namespace smart_cover/gadget_smart_cover
// Params 1, eflags: 0x0
// Checksum 0x4a346657, Offset: 0x1008
// Size: 0x178
function function_722fc669(localclientnum) {
    player = self;
    if (isdefined(level.smartcoversettings.previewmodels[localclientnum])) {
        return;
    }
    level.smartcoversettings.previewmodels[localclientnum] = [];
    level.smartcoversettings.previewmodels[localclientnum][0] = function_641491ac(localclientnum, level.smartcoversettings.bundle.placementmodel);
    level.smartcoversettings.previewmodels[localclientnum][1] = function_641491ac(localclientnum, level.smartcoversettings.bundle.var_46732914);
    level.smartcoversettings.previewmodels[localclientnum][2] = function_641491ac(localclientnum, level.smartcoversettings.bundle.var_1b5c037d);
    level.smartcoversettings.previewmodels[localclientnum][3] = function_641491ac(localclientnum, level.smartcoversettings.bundle.var_76ac23f2);
}

// Namespace smart_cover/gadget_smart_cover
// Params 6, eflags: 0x0
// Checksum 0x790dcb58, Offset: 0x1188
// Size: 0x1b2
function function_8fb44aff(localclientnum, origin, angles, isvalid, var_eb65925c, var_4b3e5e0a) {
    player = self;
    previewmodel = undefined;
    var_80f43370 = undefined;
    var_ff5a387e = isvalid ? var_eb65925c : var_4b3e5e0a;
    for (var_a6932c26 = 0; var_a6932c26 < level.smartcoversettings.previewmodels[localclientnum].size; var_a6932c26++) {
        if (var_a6932c26 == var_ff5a387e) {
            continue;
        }
        level.smartcoversettings.previewmodels[localclientnum][var_a6932c26] hide();
    }
    level.smartcoversettings.previewmodels[localclientnum][var_ff5a387e].origin = origin;
    level.smartcoversettings.previewmodels[localclientnum][var_ff5a387e].angles = angles;
    level.smartcoversettings.previewmodels[localclientnum][var_ff5a387e] show();
    player function_bf191832(0, origin, angles);
    return level.smartcoversettings.previewmodels[localclientnum][var_ff5a387e];
}

// Namespace smart_cover/gadget_smart_cover
// Params 2, eflags: 0x0
// Checksum 0x2d590ec, Offset: 0x1348
// Size: 0x70
function function_d66a0190(row, column) {
    cellindex = row * level.smartcoversettings.bundle.rowcount + column;
    if (cellindex < 10) {
        return ("joint_0" + cellindex);
    }
    return "joint_" + cellindex;
}

// Namespace smart_cover/gadget_smart_cover
// Params 1, eflags: 0x0
// Checksum 0x77d40342, Offset: 0x13c0
// Size: 0xd0
function function_dbaf4647(localclientnum) {
    smartcover = self;
    for (rowindex = 0; rowindex < level.smartcoversettings.bundle.rowcount; rowindex++) {
        for (colindex = 1; colindex <= level.smartcoversettings.bundle.var_b118698f; colindex++) {
            celllabel = function_d66a0190(rowindex, colindex);
            smartcover showpart(localclientnum, celllabel);
        }
    }
}

// Namespace smart_cover/gadget_smart_cover
// Params 4, eflags: 0x0
// Checksum 0x11b80931, Offset: 0x1498
// Size: 0x478
function function_5a8becdc(localclientnum, player, buildinfo, var_4b1c8937) {
    smartcover = self;
    cellheight = level.smartcoversettings.bundle.maxheight / level.smartcoversettings.bundle.rowcount;
    cellwidth = level.smartcoversettings.bundle.maxwidth / level.smartcoversettings.bundle.var_b118698f;
    var_b963136f = int(buildinfo.width / cellwidth);
    var_227adab7 = buildinfo.width - cellwidth * var_b963136f;
    if (var_227adab7 > 0 && var_227adab7 / 2 < level.smartcoversettings.bundle.var_3dfbdbeb && var_b963136f + 2 <= level.smartcoversettings.bundle.var_b118698f) {
        var_b963136f += 2;
    }
    var_9de92bd5 = int(buildinfo.height / cellheight);
    var_2582dbd = buildinfo.height - cellheight * var_9de92bd5;
    if (var_2582dbd > 0 && var_2582dbd < level.smartcoversettings.bundle.var_3dfbdbeb && var_2582dbd < level.smartcoversettings.bundle.rowcount) {
        var_9de92bd5++;
    }
    cellstoremove = [];
    var_e465f403 = level.smartcoversettings.bundle.rowcount - var_9de92bd5;
    for (rowindex = 0; rowindex < var_e465f403; rowindex++) {
        rownum = level.smartcoversettings.bundle.rowcount - rowindex - 1;
        for (colindex = 1; colindex < level.smartcoversettings.bundle.var_b118698f; colindex++) {
            celllabel = function_d66a0190(rownum, colindex);
            smartcover hidepart(localclientnum, celllabel);
        }
    }
    var_f636c423 = level.smartcoversettings.bundle.var_b118698f - var_b963136f;
    for (var_688bc60 = 0; var_688bc60 < int(var_f636c423 / 2); var_688bc60++) {
        cola = var_688bc60 + 1;
        colb = level.smartcoversettings.bundle.var_b118698f - var_688bc60;
        for (rowindex = 0; rowindex < level.smartcoversettings.bundle.rowcount; rowindex++) {
            microwave_sh_turr = function_d66a0190(rowindex, cola);
            var_1ffc0b2e = function_d66a0190(rowindex, colb);
            smartcover hidepart(localclientnum, microwave_sh_turr);
            smartcover hidepart(localclientnum, var_1ffc0b2e);
        }
    }
}

/#

    // Namespace smart_cover/gadget_smart_cover
    // Params 2, eflags: 0x0
    // Checksum 0x30fc85c7, Offset: 0x1918
    // Size: 0xec
    function debug_trace(origin, trace) {
        if (trace[#"fraction"] < 1) {
            color = (0.95, 0.05, 0.05);
        } else {
            color = (0.05, 0.95, 0.05);
        }
        sphere(trace[#"position"], 5, color, 0.75, 1, 10, 100);
        util::debug_line(origin, trace[#"position"], color, 100);
    }

#/

// Namespace smart_cover/gadget_smart_cover
// Params 1, eflags: 0x0
// Checksum 0x6ddeadfe, Offset: 0x1a10
// Size: 0x508
function startmicrowavefx(localclientnum) {
    turret = self;
    turret endon(#"death");
    turret endon(#"beam_stop");
    turret.should_update_fx = 1;
    angles = turret.angles;
    origin = turret.origin + (0, 0, 30);
    microwavefxent = spawn(localclientnum, origin, "script_model");
    microwavefxent setmodel(#"tag_microwavefx");
    microwavefxent.angles = angles;
    microwavefxent.fxhandles = [];
    microwavefxent.fxnames = [];
    microwavefxent.fxhashs = [];
    self thread cleanupfx(localclientnum, microwavefxent);
    wait(0.3);
    while (true) {
        /#
            if (getdvarint(#"scr_microwave_turret_fx_debug", 0)) {
                turret.should_update_fx = 1;
                microwavefxent.fxhashs[#"center"] = 0;
            }
        #/
        if (turret.should_update_fx == 0) {
            wait(1);
            continue;
        }
        if (isdefined(level.last_microwave_turret_fx_trace) && level.last_microwave_turret_fx_trace == gettime()) {
            waitframe(1);
            continue;
        }
        angles = turret.angles;
        origin = turret.origin + (0, 0, 30);
        forward = anglestoforward(angles);
        forward = vectorscale(forward, (isdefined(level.smartcoversettings.bundle.var_b345c668) ? level.smartcoversettings.bundle.var_b345c668 : 0) + 40);
        var_e2e9fefa = anglestoforward(angles + (0, 55 / 3, 0));
        var_e2e9fefa = vectorscale(var_e2e9fefa, (isdefined(level.smartcoversettings.bundle.var_b345c668) ? level.smartcoversettings.bundle.var_b345c668 : 0) + 40);
        trace = bullettrace(origin, origin + forward, 0, turret);
        traceright = bullettrace(origin, origin - var_e2e9fefa, 0, turret);
        traceleft = bullettrace(origin, origin + var_e2e9fefa, 0, turret);
        /#
            if (getdvarint(#"scr_microwave_turret_fx_debug", 0)) {
                debug_trace(origin, trace);
                debug_trace(origin, traceright);
                debug_trace(origin, traceleft);
            }
        #/
        need_to_rebuild = microwavefxent microwavefxhash(trace, origin, "center");
        need_to_rebuild |= microwavefxent microwavefxhash(traceright, origin, "right");
        need_to_rebuild |= microwavefxent microwavefxhash(traceleft, origin, "left");
        level.last_microwave_turret_fx_trace = gettime();
        if (!need_to_rebuild) {
            wait(1);
            continue;
        }
        wait(0.1);
        microwavefxent playmicrowavefx(localclientnum, trace, traceright, traceleft, origin, turret.team);
        turret.should_update_fx = 0;
        wait(1);
    }
}

// Namespace smart_cover/gadget_smart_cover
// Params 3, eflags: 0x0
// Checksum 0x4df9581, Offset: 0x1f20
// Size: 0x1a8
function microwavefxhash(trace, origin, name) {
    hash = 0;
    counter = 2;
    for (i = 0; i < 5; i++) {
        endofhalffxsq = (i * 150 + 125) * (i * 150 + 125);
        endoffullfxsq = (i * 150 + 200) * (i * 150 + 200);
        tracedistsq = distancesquared(origin, trace[#"position"]);
        if (tracedistsq >= endofhalffxsq || i == 0) {
            if (tracedistsq < endoffullfxsq) {
                hash += 1;
            } else {
                hash += counter;
            }
        }
        counter *= 2;
    }
    if (!isdefined(self.fxhashs[name])) {
        self.fxhashs[name] = 0;
    }
    last_hash = self.fxhashs[name];
    self.fxhashs[name] = hash;
    return last_hash != hash;
}

// Namespace smart_cover/gadget_smart_cover
// Params 2, eflags: 0x0
// Checksum 0xb4c05205, Offset: 0x20d0
// Size: 0xd4
function cleanupfx(localclientnum, microwavefxent) {
    self waittill(#"death", #"beam_stop");
    foreach (handle in microwavefxent.fxhandles) {
        if (isdefined(handle)) {
            stopfx(localclientnum, handle);
        }
    }
    microwavefxent delete();
}

// Namespace smart_cover/gadget_smart_cover
// Params 4, eflags: 0x0
// Checksum 0x6e53822b, Offset: 0x21b0
// Size: 0xdc
function play_fx_on_tag(localclientnum, fxname, tag, team) {
    if (!isdefined(self.fxhandles[tag]) || fxname != self.fxnames[tag]) {
        stop_fx_on_tag(localclientnum, fxname, tag);
        self.fxnames[tag] = fxname;
        self.fxhandles[tag] = util::playfxontag(localclientnum, fxname, self, tag);
        setfxteam(localclientnum, self.fxhandles[tag], team);
    }
}

// Namespace smart_cover/gadget_smart_cover
// Params 3, eflags: 0x0
// Checksum 0x6bd5a195, Offset: 0x2298
// Size: 0x74
function stop_fx_on_tag(localclientnum, fxname, tag) {
    if (isdefined(self.fxhandles[tag])) {
        stopfx(localclientnum, self.fxhandles[tag]);
        self.fxhandles[tag] = undefined;
        self.fxnames[tag] = undefined;
    }
}

/#

    // Namespace smart_cover/gadget_smart_cover
    // Params 3, eflags: 0x0
    // Checksum 0x3353f5b5, Offset: 0x2318
    // Size: 0x94
    function render_debug_sphere(tag, color, fxname) {
        if (getdvarint(#"scr_microwave_turret_fx_debug", 0)) {
            origin = self gettagorigin(tag);
            sphere(origin, 2, color, 0.75, 1, 10, 100);
        }
    }

#/

// Namespace smart_cover/gadget_smart_cover
// Params 5, eflags: 0x0
// Checksum 0x9d8e8467, Offset: 0x23b8
// Size: 0xec
function stop_or_start_fx(localclientnum, fxname, tag, start, team) {
    if (start) {
        self play_fx_on_tag(localclientnum, fxname, tag, team);
        /#
            if (fxname == "<unknown string>") {
                render_debug_sphere(tag, (0.5, 0.5, 0), fxname);
            } else {
                render_debug_sphere(tag, (0, 1, 0), fxname);
            }
        #/
        return;
    }
    stop_fx_on_tag(localclientnum, fxname, tag);
    /#
        render_debug_sphere(tag, (1, 0, 0), fxname);
    #/
}

// Namespace smart_cover/gadget_smart_cover
// Params 6, eflags: 0x0
// Checksum 0x847c0412, Offset: 0x24b0
// Size: 0x5ec
function playmicrowavefx(localclientnum, trace, traceright, traceleft, origin, team) {
    for (i = 0; i < 5; i++) {
        endofhalffxsq = (i * 150 + 125) * (i * 150 + 125);
        endoffullfxsq = (i * 150 + 200) * (i * 150 + 200);
        tracedistsq = distancesquared(origin, trace[#"position"]);
        startfx = tracedistsq >= endofhalffxsq || i == 0;
        fxname = tracedistsq > endoffullfxsq ? "weapon/fx8_equip_smart_cover_microwave" : "weapon/fx8_equip_smart_cover_microwave_sm";
        switch (i) {
        case 0:
            self play_fx_on_tag(localclientnum, fxname, "tag_fx11", team);
            break;
        case 1:
            break;
        case 2:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx32", startfx, team);
            break;
        case 3:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx42", startfx, team);
            self stop_or_start_fx(localclientnum, fxname, "tag_fx43", startfx, team);
            break;
        case 4:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx53", startfx, team);
            break;
        }
        tracedistsq = distancesquared(origin, traceleft[#"position"]);
        startfx = tracedistsq >= endofhalffxsq;
        fxname = tracedistsq > endoffullfxsq ? "weapon/fx8_equip_smart_cover_microwave" : "weapon/fx8_equip_smart_cover_microwave_sm";
        switch (i) {
        case 0:
            break;
        case 1:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx22", startfx, team);
            break;
        case 2:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx33", startfx, team);
            break;
        case 3:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx44", startfx, team);
            break;
        case 4:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx54", startfx, team);
            self stop_or_start_fx(localclientnum, fxname, "tag_fx55", startfx, team);
            break;
        }
        tracedistsq = distancesquared(origin, traceright[#"position"]);
        startfx = tracedistsq >= endofhalffxsq;
        fxname = tracedistsq > endoffullfxsq ? "weapon/fx8_equip_smart_cover_microwave" : "weapon/fx8_equip_smart_cover_microwave_sm";
        switch (i) {
        case 0:
            break;
        case 1:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx21", startfx, team);
            break;
        case 2:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx31", startfx, team);
            break;
        case 3:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx41", startfx, team);
            break;
        case 4:
            self stop_or_start_fx(localclientnum, fxname, "tag_fx51", startfx, team);
            self stop_or_start_fx(localclientnum, fxname, "tag_fx52", startfx, team);
            break;
        }
    }
}

