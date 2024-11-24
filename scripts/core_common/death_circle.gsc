#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\map;
#using scripts\core_common\match_record;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace death_circle;

// Namespace death_circle/death_circle
// Params 0, eflags: 0x2
// Checksum 0xf50554be, Offset: 0x320
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"death_circle", &__init__, undefined, undefined);
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x1 linked
// Checksum 0xe1f96268, Offset: 0x368
// Size: 0x254
function __init__() {
    level.var_d8958e58 = isdefined(getgametypesetting(#"deathcircle")) && getgametypesetting(#"deathcircle");
    level.var_e7bb2ba = isdefined(getgametypesetting(#"hash_74f1260346e4198e")) && getgametypesetting(#"hash_74f1260346e4198e");
    level.deathcircles = [];
    level.var_a425ed89 = 0;
    level.var_56baa802 = 0;
    level.var_a8077fea = [];
    level.deathcircletimescale = getdvarfloat(#"deathcircle_timescale", 1);
    level.var_326f5774 = getdvarfloat(#"hash_69ae65ef32a36959", 1);
    level.var_1f8ac687 = getdvarfloat(#"hash_263e72f970ac144d", 1);
    if (!level.var_d8958e58) {
        return;
    }
    clientfield::register("scriptmover", "deathcircleflag", 1, 1, "int");
    clientfield::register("toplayer", "deathcircleeffects", 1, 2, "int");
    clientfield::register("allplayers", "outsidedeathcircle", 1, 1, "int");
    callback::on_game_playing(&start);
    /#
        level thread devgui_loop();
        level thread debug_loop();
    #/
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x0
// Checksum 0x5293009a, Offset: 0x5c8
// Size: 0xfc
function init() {
    deathcircleindex = isdefined(getgametypesetting(#"hash_70072ee20a43ae21")) ? getgametypesetting(#"hash_70072ee20a43ae21") : 0;
    mapbundle = map::get_script_bundle();
    if (isdefined(mapbundle) && isarray(mapbundle.deathcirclelist) && deathcircleindex < mapbundle.deathcirclelist.size) {
        var_ae6c2bbe = getscriptbundle(mapbundle.deathcirclelist[deathcircleindex].var_47fd5ad2);
        function_5e412e4a(var_ae6c2bbe);
    }
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x1 linked
// Checksum 0x226fbeb3, Offset: 0x6d0
// Size: 0x2a8
function function_5e412e4a(var_ae6c2bbe) {
    function_d81873aa(isdefined(var_ae6c2bbe.var_64232072) ? var_ae6c2bbe.var_64232072 : 1);
    level.var_cb3d0e42 = isdefined(var_ae6c2bbe.var_8d8aa969) ? var_ae6c2bbe.var_8d8aa969 : 0;
    level.var_672f2d98 = isdefined(var_ae6c2bbe.var_672f2d98) ? var_ae6c2bbe.var_672f2d98 : 0;
    function_114f128a(isdefined(var_ae6c2bbe.var_904b645e) ? var_ae6c2bbe.var_904b645e : 0);
    level.var_6c870a00 = isdefined(var_ae6c2bbe.var_6c870a00) ? var_ae6c2bbe.var_6c870a00 : 10;
    level.var_ab9cd581 = isdefined(var_ae6c2bbe.var_ab9cd581) ? var_ae6c2bbe.var_ab9cd581 : 20;
    foreach (circle in var_ae6c2bbe.deathcirclelist) {
        var_b9aec05c = isdefined(circle.var_b9aec05c) ? circle.var_b9aec05c : 0;
        var_112f6f50 = isdefined(circle.var_112f6f50) ? circle.var_112f6f50 : 0;
        origin = (var_b9aec05c, var_112f6f50, 0);
        add_circle(origin, circle.var_95437170, circle.var_a3841ae2, circle.circleradius, circle.circledamage, circle.var_5a8689a9, circle.circledelay, circle.var_24ae2e27, circle.var_bb9f7c3f, circle.var_85589312, circle.var_50d5787c, circle.var_1dfb1051, circle.var_96584cff, circle.var_b97ecd26);
    }
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x1 linked
// Checksum 0x41c40c30, Offset: 0x980
// Size: 0x5e
function function_d81873aa(delaysec) {
    assert(delaysec >= 0, "<dev string:x38>" + "<dev string:x5a>");
    delaysec *= level.var_1f8ac687;
    level.var_a425ed89 = delaysec;
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x1 linked
// Checksum 0x50a7bbce, Offset: 0x9e8
// Size: 0x5e
function function_114f128a(delaysec) {
    assert(delaysec >= 0, "<dev string:x7d>" + "<dev string:x5a>");
    delaysec *= level.var_1f8ac687;
    level.var_eb37cf2e = delaysec;
}

// Namespace death_circle/death_circle
// Params 14, eflags: 0x1 linked
// Checksum 0x33096311, Offset: 0xa50
// Size: 0x330
function add_circle(var_3b9f4abf, mapwidth = 0, mapheight = 0, radius = 0, damage = 0, damageinterval = 0, waitsec = 0, scalesec = 0, var_227b1773 = 0, var_42682706 = 0, var_83c673f5 = 0, var_55ad5e4 = 0, var_c3bf31b = 0, var_18fa918d = 0) {
    assert(radius <= 150000, "<dev string:xa0>" + "<dev string:xbb>" + radius + "<dev string:xc7>" + 150000);
    var_55ad5e4 = int(var_55ad5e4 * 1000);
    var_c3bf31b = int(var_c3bf31b * 1000);
    waitsec *= level.var_326f5774;
    scalesec *= level.deathcircletimescale;
    circle = {#var_3b9f4abf:var_3b9f4abf, #mapwidth:mapwidth, #mapheight:mapheight, #origin:var_3b9f4abf, #radius:radius, #radiussq:radius * radius, #damage:damage, #damageinterval:damageinterval, #waitsec:waitsec, #scalesec:scalesec, #var_227b1773:var_227b1773, #var_42682706:var_42682706, #var_83c673f5:var_83c673f5, #var_55ad5e4:var_55ad5e4, #var_c3bf31b:var_c3bf31b, #var_18fa918d:var_18fa918d};
    level.deathcircles[level.deathcircles.size] = circle;
    level thread shuffle_circles();
    return circle;
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x5 linked
// Checksum 0x99378cc, Offset: 0xd88
// Size: 0x264
function private shuffle_circles() {
    level notify(#"shuffle_circles");
    level endon(#"game_ended", #"shuffle_circles");
    waitframe(1);
    var_b0b91d4 = level.deathcircles[0];
    if (!isdefined(var_b0b91d4)) {
        return;
    }
    finalindex = level.deathcircles.size - 1;
    if (finalindex < 1) {
        return;
    }
    var_8e3c3c5b = level.deathcircles[finalindex];
    attempts = 0;
    oobtriggers = getentarray("trigger_out_of_bounds_new", "classname");
    while (attempts < 20) {
        attempts++;
        var_b0b91d4.origin = function_3e47f08b(var_b0b91d4);
        if (function_9bae34b3(var_b0b91d4, var_8e3c3c5b, oobtriggers)) {
            waitframe(1);
            if (function_a0004b40(var_b0b91d4, var_8e3c3c5b, finalindex, oobtriggers)) {
                /#
                    iprintlnbold("<dev string:xfb>" + attempts);
                #/
                level flagsys::set(#"hash_43bac6444a9b65f3");
                return;
            }
            waitframe(1);
        }
    }
    /#
        iprintlnbold("<dev string:x110>" + attempts);
    #/
    foreach (circle in level.deathcircles) {
        circle.origin = circle.var_3b9f4abf;
    }
    level flagsys::set(#"hash_43bac6444a9b65f3");
}

// Namespace death_circle/death_circle
// Params 3, eflags: 0x5 linked
// Checksum 0xa6b3c572, Offset: 0xff8
// Size: 0x2ae
function private function_9bae34b3(var_b0b91d4, var_8e3c3c5b, oobtriggers) {
    maxdist = var_b0b91d4.radius - var_8e3c3c5b.radius;
    maxdistsq = maxdist * maxdist;
    attempts = 0;
    var_8e3c3c5b.attempts = 0;
    success = 0;
    while (var_8e3c3c5b.attempts < 100) {
        if (attempts >= 5) {
            attempts = 0;
            waitframe(1);
        }
        attempts++;
        var_8e3c3c5b.attempts++;
        origin = function_3e47f08b(var_8e3c3c5b);
        if (!isdefined(origin)) {
            x = var_b0b91d4.origin[0] + randomfloatrange(maxdist * -1, maxdist);
            y = var_b0b91d4.origin[1] + randomfloatrange(maxdist * -1, maxdist);
            origin = (x, y, 0);
        }
        distsq = distance2dsquared(var_b0b91d4.origin, origin);
        if (distsq > maxdistsq) {
            continue;
        }
        trace = groundtrace(origin + (0, 0, 10000), origin + (0, 0, -10000), 0, undefined);
        if (trace[#"fraction"] >= 1 || trace[#"surfacetype"] == "water" || trace[#"surfacetype"] == "watershallow") {
            continue;
        }
        if (function_f52fd8eb(origin, oobtriggers)) {
            continue;
        }
        var_8e3c3c5b.origin = origin;
        var_8e3c3c5b.tracepos = trace[#"position"];
        success = 1;
        break;
    }
    return success;
}

// Namespace death_circle/death_circle
// Params 4, eflags: 0x5 linked
// Checksum 0x45e4b1fc, Offset: 0x12b0
// Size: 0xe6
function private function_a0004b40(var_b0b91d4, lastcircle, finalindex, oobtriggers) {
    if (getdvarint(#"survival_prototype", 0)) {
        return true;
    }
    for (i = finalindex - 1; i > 0; i--) {
        circle = level.deathcircles[i];
        nextcircle = level.deathcircles[i + 1];
        if (!function_a84cfbd0(var_b0b91d4, circle, nextcircle, oobtriggers)) {
            return false;
        }
        waitframe(1);
    }
    return true;
}

// Namespace death_circle/death_circle
// Params 4, eflags: 0x5 linked
// Checksum 0x7051d141, Offset: 0x13a0
// Size: 0x28e
function private function_a84cfbd0(var_b0b91d4, circle, nextcircle, oobtriggers) {
    var_f811e54e = var_b0b91d4.radius - circle.radius;
    sqinterfaceattributes = var_f811e54e * var_f811e54e;
    var_897ef629 = circle.radius - nextcircle.radius;
    var_eccfdb0 = var_897ef629 * var_897ef629;
    pplate_pplatede = circle.radius * 0.01;
    var_e3cedc58 = pplate_pplatede * pplate_pplatede;
    attempts = 0;
    circle.attempts = 0;
    success = 0;
    while (circle.attempts < 100) {
        if (attempts >= 5) {
            attempts = 0;
            waitframe(1);
        }
        attempts++;
        circle.attempts++;
        x = nextcircle.origin[0] + randomfloatrange(var_897ef629 * -1, var_897ef629);
        y = nextcircle.origin[1] + randomfloatrange(var_897ef629 * -1, var_897ef629);
        origin = (x, y, 0);
        var_175e94e8 = distance2dsquared(var_b0b91d4.origin, origin);
        if (var_175e94e8 > sqinterfaceattributes) {
            continue;
        }
        var_6eb6c7b5 = distance2dsquared(nextcircle.origin, origin);
        if (var_6eb6c7b5 > var_eccfdb0 || var_6eb6c7b5 < var_e3cedc58) {
            continue;
        }
        if (function_f52fd8eb(origin, oobtriggers)) {
            continue;
        }
        circle.origin = origin;
        success = 1;
        break;
    }
    return success;
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x5 linked
// Checksum 0xf263a9f1, Offset: 0x1638
// Size: 0x154
function private function_3e47f08b(circle) {
    if (!isdefined(circle.var_3b9f4abf) || !isdefined(circle.mapwidth) || !isdefined(circle.mapheight)) {
        return undefined;
    }
    xoffset = 0;
    yoffset = 0;
    if (circle.mapwidth > 0) {
        halfwidth = circle.mapwidth / 2;
        xoffset = randomfloatrange(halfwidth * -1, halfwidth);
    }
    if (circle.mapheight > 0) {
        halfheight = circle.mapheight / 2;
        yoffset = randomfloatrange(halfheight * -1, halfheight);
    }
    origin = (circle.var_3b9f4abf[0] + xoffset, circle.var_3b9f4abf[1] + yoffset, circle.var_3b9f4abf[2]);
    return origin;
}

// Namespace death_circle/death_circle
// Params 2, eflags: 0x5 linked
// Checksum 0x543d300d, Offset: 0x1798
// Size: 0x92
function private function_f52fd8eb(origin, oobtriggers) {
    foreach (trigger in oobtriggers) {
        if (istouching(origin, trigger)) {
            return true;
        }
    }
    return false;
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x1 linked
// Checksum 0xfaa11b96, Offset: 0x1838
// Size: 0x2c
function function_55bf22ef() {
    waitframe(1);
    level clientfield::set_world_uimodel("hudItems.warzone.collapseTimerState", 1);
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x0
// Checksum 0xa27f32d4, Offset: 0x1870
// Size: 0x5c
function function_b57e3cde(enabled) {
    if (enabled) {
        self flagsys::set(#"hash_3bd867e0639cb28e");
        return;
    }
    self flagsys::clear(#"hash_3bd867e0639cb28e");
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x1 linked
// Checksum 0x483d0175, Offset: 0x18d8
// Size: 0x22
function function_dca12a73() {
    return flagsys::get(#"hash_3bd867e0639cb28e");
}

// Namespace death_circle/death_circle
// Params 2, eflags: 0x5 linked
// Checksum 0x95b0d906, Offset: 0x1908
// Size: 0x4a
function private function_ccac34f8(var_36aa237c, var_11dc771d) {
    wait var_36aa237c;
    level clientfield::set_world_uimodel("hudItems.warzone.collapse", var_11dc771d);
    level.var_56baa802 = var_11dc771d;
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x5 linked
// Checksum 0xcc424481, Offset: 0x1960
// Size: 0xa4
function private function_a1dbce4a() {
    self notify("5c3e968fb8c4a0c8");
    self endon("5c3e968fb8c4a0c8");
    self endon(#"death");
    if (level flagsys::get(#"hash_60fcdd11812a0134")) {
        return;
    }
    self ghost();
    level flagsys::wait_till(#"hash_60fcdd11812a0134");
    self show();
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x1 linked
// Checksum 0xdffdf033, Offset: 0x1a10
// Size: 0xc7c
function start() {
    level endoncallback(&cleanup_circle, #"game_ended", #"hash_12a8f2c59a67e4fc");
    if (!level.var_d8958e58 || level.deathcircles.size <= 0) {
        return;
    }
    /#
        function_ded40950();
    #/
    initcircle = level.deathcircles[0];
    waitsec = function_76c22343(initcircle.var_227b1773, initcircle.waitsec, initcircle.var_42682706);
    initcircle.var_23216f37 = waitsec;
    level flagsys::wait_till(#"insertion_teleport_completed");
    level.var_56baa802 = gettime() + int((waitsec + level.var_a425ed89) * 1000);
    level clientfield::set_world_uimodel("hudItems.warzone.collapse", level.var_56baa802);
    wait level.var_a425ed89;
    level.deathcircle = spawn("script_model", initcircle.origin);
    level.deathcircle.targetname = "death_circle";
    level.deathcircle setmodel("tag_origin");
    level.deathcircle setscale(initcircle.radius / 15000);
    level.deathcircle.radius = initcircle.radius;
    level.deathcircle clientfield::set("deathcircleflag", 1);
    level.deathcircle.damage = initcircle.damage;
    level.deathcircle.damageinterval = initcircle.damageinterval;
    level.deathcircle.var_18fa918d = initcircle.var_18fa918d;
    level.deathcircle.var_55ad5e4 = initcircle.var_55ad5e4;
    level.deathcircle.var_c3bf31b = initcircle.var_c3bf31b;
    level thread function_dc15ad60();
    circle = undefined;
    var_9275bfa4 = undefined;
    level flagsys::set(#"hash_405e46788e83af41");
    level callback::callback(#"hash_405e46788e83af41");
    level.var_74887eb = level.deathcircles.size;
    if (util::get_game_type() == #"warzone_bigteam_dbno_quad") {
        level.var_74887eb = level.deathcircles.size - 2;
    }
    level.var_245d4af9 = level.var_74887eb;
    level clientfield::set_world_uimodel("hudItems.warzone.collapseCount", level.var_74887eb);
    level.var_78442886 = -1;
    for (i = 0; i < level.deathcircles.size; i++) {
        if (i + 1 == level.deathcircles.size) {
            level callback::callback(#"hash_7119d854cd41a4fd");
        }
        level.deathcircleindex = i;
        level clientfield::set_world_uimodel("hudItems.warzone.collapseIndex", i);
        circle = level.deathcircles[i];
        nextcircle = level.deathcircles[i + 1];
        level.deathcircle.var_46fc3d6e = circle;
        level.deathcircle.nextcircle = nextcircle;
        if (isdefined(nextcircle)) {
            level notify(#"hash_1ff3496c9049969");
            var_7791d394 = nextcircle;
            if (isdefined(getgametypesetting(#"hash_21ab1ca7e18bddcd")) && getgametypesetting(#"hash_21ab1ca7e18bddcd")) {
                var_87f4757a = isdefined(getgametypesetting(#"hash_3e62d9528eca0a13")) ? getgametypesetting(#"hash_3e62d9528eca0a13") : 0;
                if (1 && level.deathcircles.size > var_87f4757a && i + 1 < var_87f4757a) {
                    var_7791d394 = level.deathcircles[var_87f4757a];
                }
            }
            if (isdefined(level.var_bd19c3a8)) {
                [[ level.var_bd19c3a8 ]]();
            }
            if (!isdefined(var_9275bfa4)) {
                var_9275bfa4 = spawn("script_model", var_7791d394.origin);
                var_9275bfa4.targetname = "next_death_circle";
                var_9275bfa4 setmodel("tag_origin");
                var_9275bfa4.team = #"neutral";
                var_9275bfa4 clientfield::set("deathcircleflag", 1);
            } else {
                var_9275bfa4 dontinterpolate();
                var_9275bfa4.origin = var_7791d394.origin;
            }
            scale = var_7791d394.radius / 15000;
            var_9275bfa4 setscale(scale);
            if (isdefined(getgametypesetting(#"hash_21ab1ca7e18bddcd")) && getgametypesetting(#"hash_21ab1ca7e18bddcd")) {
                var_9275bfa4 thread function_a1dbce4a();
            }
        } else if (isdefined(var_9275bfa4)) {
            var_9275bfa4 delete();
        }
        if (!isdefined(nextcircle) && isdefined(level.var_cb3d0e42) && level.var_cb3d0e42) {
            break;
        }
        if (waitsec > 0) {
            setmatchflag("bomb_timer_a", 1);
            setbombtimer("A", gettime() + 1000 + int(waitsec * 1000));
            level clientfield::set_world_uimodel("hudItems.warzone.collapseProgress", 0);
            waitframe(1);
            function_55bf22ef();
        }
        level countdown(waitsec, i, nextcircle);
        setmatchflag("bomb_timer_a", 0);
        level clientfield::set_world_uimodel("hudItems.warzone.collapseTimerState", 2);
        level.deathcircle.damage = circle.damage;
        level.deathcircle.damageinterval = circle.damageinterval;
        level.deathcircle.var_18fa918d = circle.var_18fa918d;
        level.deathcircle.var_55ad5e4 = circle.var_55ad5e4;
        level.deathcircle.var_c3bf31b = circle.var_c3bf31b;
        scalesec = function_76c22343(circle.var_227b1773, circle.scalesec, circle.var_83c673f5);
        circle.var_a301393a = scalesec;
        if (isdefined(nextcircle)) {
            waitsec = function_76c22343(nextcircle.var_227b1773, nextcircle.waitsec, nextcircle.var_42682706);
            nextcircle.var_23216f37 = waitsec;
            level clientfield::set_world_uimodel("hudItems.warzone.collapseProgress", 0);
            level thread function_ccac34f8(1, gettime() + int((scalesec + waitsec) * 1000));
        } else {
            setmatchflag("bomb_timer_b", 0);
        }
        level.var_78442886 = i;
        level callback::callback(#"hash_3057417db7f8acdd");
        if (isdefined(nextcircle)) {
            level.deathcircle function_9229c3b3(scalesec, nextcircle.radius, nextcircle.origin);
        } else {
            level.deathcircle function_9229c3b3(scalesec, 0, circle.origin);
        }
        level clientfield::set_world_uimodel("hudItems.warzone.collapseTimerState", 0);
        level callback::callback(#"hash_7912e21750e4010d");
    }
    if (level.deathcircle.radius <= 0) {
        level.deathcircle hide();
    }
    if (isdefined(level.var_672f2d98) && level.var_672f2d98) {
        var_904b645e = isdefined(level.var_eb37cf2e) ? level.var_eb37cf2e : 0;
        if (var_904b645e > 0) {
            setmatchflag("bomb_timer_a", 1);
            setbombtimer("A", gettime() + 1000 + int(var_904b645e * 1000));
            function_55bf22ef();
            wait var_904b645e;
            setmatchflag("bomb_timer_a", 0);
            level clientfield::set_world_uimodel("hudItems.warzone.collapseTimerState", 0);
        }
        if (isdefined(level.ontimelimit)) {
            [[ level.ontimelimit ]]();
        }
    }
}

// Namespace death_circle/death_circle
// Params 3, eflags: 0x5 linked
// Checksum 0x91502310, Offset: 0x2698
// Size: 0xee
function private function_76c22343(var_227b1773, value, var_ed2d510) {
    if (!(isdefined(level.var_e7bb2ba) && level.var_e7bb2ba)) {
        return value;
    }
    playercount = 0;
    foreach (player in getplayers()) {
        if (isalive(player)) {
            playercount++;
        }
    }
    if (playercount > var_227b1773) {
        return value;
    }
    return var_ed2d510;
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x5 linked
// Checksum 0x76a5dd3b, Offset: 0x2790
// Size: 0x2c
function private cleanup_circle(notifyhash) {
    level clientfield::set_world_uimodel("hudItems.warzone.collapseTimerState", 0);
}

// Namespace death_circle/death_circle
// Params 3, eflags: 0x5 linked
// Checksum 0xf222951a, Offset: 0x27c8
// Size: 0x184
function private countdown(waitsec, circleindex, nextcircle) {
    level endon(#"hash_3a3e3a27bf34fa8a");
    if (!isdefined(nextcircle)) {
        voiceevent("warCircleDetectedLast");
    } else if (circleindex == 0) {
        if (!(isdefined(getgametypesetting(#"hash_6873fc00b59bcd39")) && getgametypesetting(#"hash_6873fc00b59bcd39"))) {
            voiceevent("warCircleDetectedFirst");
        }
    } else {
        voiceevent("warCircleDetected");
    }
    if (waitsec > 15 && waitsec >= 45) {
        wait waitsec - 15;
        voiceevent("warCircleCollapseImminent");
        wait 15;
    } else {
        wait waitsec;
    }
    voiceevent("warCircleCollapseOccurring");
    playsoundatposition(#"hash_3fb30e7a85b2bf7e", (0, 0, 0));
}

// Namespace death_circle/death_circle
// Params 3, eflags: 0x5 linked
// Checksum 0xc2c85c0c, Offset: 0x2958
// Size: 0x286
function private function_9229c3b3(scalesec, newradius, neworigin) {
    level endon(#"game_ended", #"hash_12a8f2c59a67e4fc", #"hash_6adadb0779eac3c6");
    if (scalesec <= 0) {
        self.radius = newradius;
        if (newradius > 0) {
            self setscale(self.radius / 15000);
        }
        return;
    }
    level.deathcircle.scaling = 1;
    time = gettime();
    endtime = time + int(scalesec * 1000);
    level clientfield::set_world_uimodel("hudItems.warzone.collapseProgress", 0);
    self moveto(neworigin, scalesec);
    scaledelta = newradius - self.radius;
    frames = scalesec / float(function_60d95f53()) / 1000;
    framedelta = scaledelta / frames;
    progress = 0;
    var_6e09d4b7 = 1 / frames;
    while (time < endtime) {
        self.radius += framedelta;
        if (self.radius <= 0) {
            break;
        }
        self setscale(self.radius / 15000);
        progress += var_6e09d4b7;
        level clientfield::set_world_uimodel("hudItems.warzone.collapseProgress", progress);
        waitframe(1);
        time = gettime();
    }
    level clientfield::set_world_uimodel("hudItems.warzone.collapseProgress", 1);
    level.deathcircle.scaling = 0;
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x5 linked
// Checksum 0x4d626462, Offset: 0x2be8
// Size: 0x5a
function private function_8bd303cc() {
    player = self;
    if (isdefined(player) && !(isdefined(player.outsidedeathcircle) && player.outsidedeathcircle)) {
        player.outsidedeathcircle = 1;
        player.var_1f1736dc = gettime();
    }
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x5 linked
// Checksum 0xa2373a19, Offset: 0x2c50
// Size: 0xcc
function private function_ce0f27e0() {
    player = self;
    if (isdefined(player) && isdefined(player.outsidedeathcircle) && player.outsidedeathcircle) {
        player.outsidedeathcircle = 0;
        if (isdefined(player.var_1f1736dc)) {
            var_7dbb0472 = int(gettime() - player.var_1f1736dc);
            player stats::function_d40764f3(#"hash_44caad08afb32e51", var_7dbb0472);
            player match_record::function_34800eec(#"hash_3e8d4387ea9e7f42", var_7dbb0472);
        }
    }
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x0
// Checksum 0xcae9468e, Offset: 0x2d28
// Size: 0x98
function function_a086017a(point) {
    if (!isdefined(level.deathcircle)) {
        return true;
    }
    distsq = distance2dsquared(point, level.deathcircle.origin);
    radiussq = level.deathcircle.radius * level.deathcircle.radius;
    if (distsq > radiussq) {
        return false;
    }
    return true;
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x5 linked
// Checksum 0x511d969, Offset: 0x2dc8
// Size: 0x78e
function private function_dc15ad60() {
    level endoncallback(&cleanup_feedback, #"game_ended", #"hash_12a8f2c59a67e4fc");
    while (!isdefined(level.deathcircle)) {
        waitframe(1);
    }
    var_f4d9a132 = gettime() + int(level.deathcircle.damageinterval * 1000);
    updatepass = 0;
    while (isdefined(level.deathcircle)) {
        radiussq = level.deathcircle.radius * level.deathcircle.radius;
        origin = level.deathcircle.origin;
        dodamage = gettime() >= var_f4d9a132;
        level.var_a8077fea = [];
        time = gettime();
        foreach (i, player in getplayers()) {
            if (isdefined(level.deathcircle.scaling) && level.deathcircle.scaling && i % 5 == updatepass) {
                player function_ba02cfb5();
            }
            if (!isalive(player)) {
                player function_60d14da8(0);
                player clientfield::set("outsidedeathcircle", 0);
                player hide_effects();
                player function_ce0f27e0();
                continue;
            }
            distsq = distance2dsquared(player.origin, origin);
            if (distsq > radiussq && !player function_dca12a73()) {
                level.var_a8077fea[level.var_a8077fea.size] = player;
                if (!isdefined(player.var_b8328141)) {
                    player.var_b8328141 = time + level.deathcircle.var_55ad5e4;
                }
                damage = level.deathcircle.damage;
                if (!isdefined(player.var_6cd69660)) {
                    player.var_6cd69660 = 0;
                }
                if (player.var_6cd69660 == 0 && time + level.deathcircle.var_55ad5e4 < player.var_b8328141) {
                    player.var_b8328141 = time + level.deathcircle.var_55ad5e4;
                } else if (player.var_6cd69660 != 0 && time + level.deathcircle.var_c3bf31b < player.var_b8328141) {
                    player.var_b8328141 = time + level.deathcircle.var_c3bf31b;
                }
                if (time >= player.var_b8328141) {
                    player.var_6cd69660 += level.deathcircle.var_18fa918d;
                    player.var_b8328141 = time + level.deathcircle.var_c3bf31b;
                }
                player.deathcircledamage = damage + player.var_6cd69660;
                if (player.deathcircledamage >= level.var_ab9cd581) {
                    intensity = 3;
                } else if (player.deathcircledamage >= level.var_6c870a00) {
                    intensity = 2;
                } else {
                    intensity = 1;
                }
                player function_60d14da8(1);
                player clientfield::set("outsidedeathcircle", 1);
                player show_effects(intensity);
                player function_8bd303cc();
                if (dodamage) {
                    damage = player.deathcircledamage;
                    if (player hasperk(#"specialty_outlander")) {
                        damage = int(ceil(damage * 0.5));
                    }
                    if (isdefined(player.var_a62dbeca)) {
                        damage = int(min(player.var_a62dbeca, damage));
                    }
                    player dodamage(damage, origin, level.deathcircle, undefined, undefined, "MOD_DEATH_CIRCLE");
                    player stats::function_d40764f3(#"hash_3498c2a577aa328e", int(damage));
                    player match_record::function_34800eec(#"hash_3498c2a577aa328e", int(damage));
                }
                continue;
            }
            player function_60d14da8(0);
            player clientfield::set("outsidedeathcircle", 0);
            player hide_effects();
            player function_ce0f27e0();
            player.var_6cd69660 = 0;
            player.var_b8328141 = time + level.deathcircle.var_55ad5e4;
        }
        if (dodamage) {
            var_f4d9a132 = gettime() + int(level.deathcircle.damageinterval * 1000);
        }
        updatepass = (updatepass + 1) % 5;
        waitframe(1);
    }
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x5 linked
// Checksum 0x976b6a04, Offset: 0x3560
// Size: 0xa8
function private cleanup_feedback(notifyhash) {
    foreach (player in getplayers()) {
        player function_60d14da8(0);
        player hide_effects();
    }
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x1 linked
// Checksum 0xf73747ce, Offset: 0x3610
// Size: 0x3b4
function function_ba02cfb5() {
    var_46fc3d6e = level.deathcircle.var_46fc3d6e;
    nextcircle = level.deathcircle.nextcircle;
    playerorigin = self function_664f77db();
    if (isdefined(nextcircle) && distance2dsquared(playerorigin, nextcircle.origin) <= nextcircle.radiussq) {
        self clientfield::set_player_uimodel("hudItems.distanceFromDeathCircle", 1);
        return;
    }
    if (distance2dsquared(playerorigin, var_46fc3d6e.origin) >= var_46fc3d6e.radiussq) {
        self clientfield::set_player_uimodel("hudItems.distanceFromDeathCircle", 0);
        return;
    }
    nextcenter = isdefined(nextcircle) ? nextcircle.origin : var_46fc3d6e.origin;
    dir = vectornormalize(playerorigin - nextcenter);
    nextpoint = nextcenter;
    if (isdefined(nextcircle)) {
        nextpoint = nextcenter + dir * nextcircle.radius;
    }
    prevpoint = function_936b3f09(nextcenter, dir, var_46fc3d6e);
    totaldist = distance2d(prevpoint, nextpoint);
    playerdist = distance2d(prevpoint, playerorigin);
    self clientfield::set_player_uimodel("hudItems.distanceFromDeathCircle", playerdist / totaldist);
    /#
        if (self ishost() && getdvarint(#"deathcircle_debug", 0)) {
            var_36b41a8 = getdvarint(#"hash_411ea20c685d88c1", 1);
            radius = 30 * var_36b41a8;
            sphere(nextpoint, radius, (0, 1, 0), 1, 0, 10, 5);
            line(playerorigin, nextpoint, (0, 1, 0), 1, 0, 5);
            sphere(prevpoint, radius, (1, 0, 0), 1, 0, 10, 5);
            line(playerorigin, prevpoint, (1, 0, 0), 1, 0, 5);
            deathpoint = function_936b3f09(nextcenter, dir, level.deathcircle);
            sphere(deathpoint, 25 * var_36b41a8, (1, 0, 1), 1, 0, 10, 5);
        }
    #/
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x1 linked
// Checksum 0x8508ad9e, Offset: 0x39d0
// Size: 0x102
function function_664f77db() {
    if (self.spectatorclient != -1) {
        player = getentbynum(self.spectatorclient);
        if (isplayer(player)) {
            return (player.origin[0], player.origin[1], 0);
        }
    } else if (self.currentspectatingclient != -1) {
        player = getentbynum(self.currentspectatingclient);
        if (isplayer(player)) {
            return (player.origin[0], player.origin[1], 0);
        }
    }
    return (self.origin[0], self.origin[1], 0);
}

// Namespace death_circle/death_circle
// Params 3, eflags: 0x1 linked
// Checksum 0x742a1dc6, Offset: 0x3ae0
// Size: 0xf0
function function_936b3f09(p, d, circle) {
    m = p - circle.origin;
    b = vectordot(m, d);
    c = vectordot(m, m) - circle.radius * circle.radius;
    discr = b * b - c;
    t = b * -1 + sqrt(discr);
    return p + t * d;
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x1 linked
// Checksum 0x4af57df, Offset: 0x3bd8
// Size: 0x2c
function show_effects(intensity) {
    self clientfield::set_to_player("deathcircleeffects", intensity);
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x1 linked
// Checksum 0x607ed9d5, Offset: 0x3c10
// Size: 0x24
function hide_effects() {
    self clientfield::set_to_player("deathcircleeffects", 0);
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x0
// Checksum 0xc10f75e6, Offset: 0x3c40
// Size: 0x48a
function function_27d5d349() {
    if (!isdefined(level.deathcircle)) {
        return;
    }
    for (i = 0; i < level.deathcircles.size; i++) {
        assert(i < 14, "<dev string:x129>");
        circle = level.deathcircles[i];
        match_record::function_7a93acec(#"death_circle", i, #"origin", circle.origin);
        match_record::set_stat(#"death_circle", i, #"radius", int(circle.radius));
        match_record::set_stat(#"death_circle", i, #"damage", int(circle.damage));
        match_record::set_stat(#"death_circle", i, #"damage_interval", circle.damageinterval);
        match_record::set_stat(#"death_circle", i, #"wait_sec", isdefined(circle.var_23216f37) ? circle.var_23216f37 : circle.waitsec);
        match_record::set_stat(#"death_circle", i, #"scale_sec", isdefined(circle.var_a301393a) ? circle.var_a301393a : circle.scalesec);
        match_record::set_stat(#"death_circle", i, #"final", 0);
        if (i == level.deathcircleindex) {
            i++;
            match_record::function_7a93acec(#"death_circle", i, #"origin", level.deathcircle.origin);
            match_record::set_stat(#"death_circle", i, #"radius", level.deathcircle.radius);
            match_record::set_stat(#"death_circle", i, #"damage", level.deathcircle.damage);
            match_record::set_stat(#"death_circle", i, #"damage_interval", level.deathcircle.damageinterval);
            match_record::set_stat(#"death_circle", i, #"wait_sec", isdefined(circle.var_23216f37) ? circle.var_23216f37 : circle.waitsec);
            match_record::set_stat(#"death_circle", i, #"scale_sec", isdefined(circle.var_a301393a) ? circle.var_a301393a : circle.scalesec);
            match_record::set_stat(#"death_circle", i, #"final", 1);
            break;
        }
    }
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x0
// Checksum 0x73c1a6c1, Offset: 0x40d8
// Size: 0x7c
function function_49443399() {
    time = 0;
    for (i = 0; i < level.deathcircles.size - 1; i++) {
        time += level.deathcircles[i].scalesec + level.deathcircles[i].waitsec;
    }
    return time;
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x1 linked
// Checksum 0x33d6c49b, Offset: 0x4160
// Size: 0x36
function function_9956f107() {
    if (!isdefined(level.deathcircle) || isdefined(level.deathcircle.nextcircle)) {
        return false;
    }
    return true;
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x0
// Checksum 0x3f66c07d, Offset: 0x41a0
// Size: 0xe6
function function_d66a3de1() {
    if (isdefined(level.deathcirclerespawn) && level.deathcirclerespawn) {
        var_8e3c3c5b = level.deathcircles.size - 1;
        if (var_8e3c3c5b < 0) {
            var_8e3c3c5b = 0;
        }
        if (isdefined(level.deathcirclerespawn) && level.deathcirclerespawn && (isdefined(level.var_78442886) ? level.var_78442886 : 0) >= var_8e3c3c5b) {
            return false;
        }
        if (isdefined(level.var_78442886) && isdefined(level.var_245d4af9) && level.var_78442886 >= level.var_245d4af9) {
            return false;
        }
        return true;
    }
    return false;
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x0
// Checksum 0x53cdf0f0, Offset: 0x4290
// Size: 0x84
function function_4dc40125() {
    if (isdefined(level.deathcirclerespawn) && level.deathcirclerespawn && function_9956f107()) {
        return (isdefined(level.deathcircle.scaling) && level.deathcircle.scaling || level.deathcircle.radius <= 0);
    }
    return false;
}

/#

    // Namespace death_circle/death_circle
    // Params 0, eflags: 0x4
    // Checksum 0xe3e87346, Offset: 0x4320
    // Size: 0x306
    function private devgui_loop() {
        level endon(#"game_ended");
        while (!canadddebugcommand()) {
            waitframe(1);
        }
        adddebugcommand("<dev string:x162>");
        adddebugcommand("<dev string:x185>");
        adddebugcommand("<dev string:x1b5>");
        adddebugcommand("<dev string:x1e1>");
        adddebugcommand("<dev string:x20f>" + 150000);
        adddebugcommand("<dev string:x230>");
        if (getdvarint(#"testcircleradius", 0) > 0) {
            adddebugcommand("<dev string:x255>");
            adddebugcommand("<dev string:x2a0>");
        }
        adddebugcommand("<dev string:x2f1>");
        adddebugcommand("<dev string:x339>");
        adddebugcommand("<dev string:x38b>");
        adddebugcommand("<dev string:x3d1>");
        adddebugcommand("<dev string:x42f>");
        adddebugcommand("<dev string:x47b>");
        adddebugcommand("<dev string:x4d1>");
        while (true) {
            wait 0.25;
            dvarstr = getdvarstring(#"devgui_deathcircle", "<dev string:x519>");
            if (dvarstr == "<dev string:x519>") {
                continue;
            }
            setdvar(#"devgui_deathcircle", "<dev string:x519>");
            args = strtok(dvarstr, "<dev string:x51c>");
            switch (args[0]) {
            case #"clear":
                devgui_clear();
                break;
            case #"shuffle":
                level thread devgui_shuffle(args[1]);
                break;
            }
        }
    }

    // Namespace death_circle/death_circle
    // Params 0, eflags: 0x4
    // Checksum 0x3bf53e00, Offset: 0x4630
    // Size: 0x4c
    function private devgui_clear() {
        level notify(#"hash_12a8f2c59a67e4fc");
        if (isdefined(level.deathcircle)) {
            level.deathcircle delete();
        }
    }

    // Namespace death_circle/death_circle
    // Params 0, eflags: 0x4
    // Checksum 0xf7fde768, Offset: 0x4688
    // Size: 0x502
    function private debug_loop() {
        level endon(#"game_ended");
        while (true) {
            if (getdvarint(#"deathcircle_debug", 0)) {
                var_36b41a8 = getdvarint(#"hash_411ea20c685d88c1", 1);
                debugindex = getdvarint(#"hash_31a5138991bbbf63", -1);
                var_a15ea324 = getdvarint(#"hash_118a6d37e5aa4589", 0);
                maxindex = level.deathcircles.size - 1;
                if (debugindex >= 0) {
                    circle = level.deathcircles[debugindex];
                    if (isdefined(circle)) {
                        color = circle_color(debugindex, maxindex);
                        draw_circle(circle, debugindex, var_36b41a8, color, var_a15ea324);
                    }
                } else {
                    minimaporigins = getentarray("<dev string:x520>", "<dev string:x531>");
                    foreach (minimaporigin in minimaporigins) {
                        sphere(minimaporigin.origin, 50 * var_36b41a8, (0, 1, 1));
                        print3d(minimaporigin.origin, "<dev string:x53e>", (1, 1, 1), 1, var_36b41a8);
                    }
                    index = 0;
                    foreach (circle in level.deathcircles) {
                        color = circle_color(index, maxindex);
                        draw_circle(circle, index, var_36b41a8, color, var_a15ea324);
                        index++;
                    }
                    host = util::gethostplayer();
                    if (isdefined(host)) {
                        trace = groundtrace(host.origin, host.origin + (0, 0, -10000), 0, undefined);
                        var_95341914 = (0, 1, 0);
                        if (trace[#"fraction"] < 1) {
                            switch (trace[#"surfacetype"]) {
                            case #"water":
                            case #"watershallow":
                                var_95341914 = (1, 0, 0);
                                break;
                            }
                        }
                        sphere(trace[#"position"], 10 * var_36b41a8, var_95341914);
                        if (isarray(level.var_47947565)) {
                            foreach (center in level.var_47947565) {
                                if (distance2dsquared(host.origin, center) < 20000 * 20000) {
                                    sphere(center, 20 * var_36b41a8, (1, 0, 1));
                                }
                            }
                        }
                    }
                }
            }
            waitframe(1);
        }
    }

    // Namespace death_circle/death_circle
    // Params 0, eflags: 0x4
    // Checksum 0x890eb671, Offset: 0x4b98
    // Size: 0x29c
    function private function_ded40950() {
        testcircleradius = getdvarint(#"testcircleradius", 0);
        if (testcircleradius < 0) {
            testcircleradius = 0;
        } else if (testcircleradius > 150000) {
            testcircleradius = 150000;
        }
        if (testcircleradius > 0) {
            level.deathcircles = [];
            level.var_a425ed89 = 0;
            centerstr = getdvarstring(#"hash_76b26d6e696b82e8", "<dev string:x519>");
            damage = getdvarint(#"testcircledamage", 0);
            damageinterval = getdvarint(#"hash_700ae39acbcd84e5", 60);
            waitsec = getdvarint(#"hash_5779bb38cf5f61a9", 36000);
            scalesec = getdvarint(#"hash_537f05a2ad3b9d7a", 60);
            intensity = getdvarint(#"hash_16271dbe4d00b41e", 1);
            center = (level.mapcenter[0], level.mapcenter[1], 0);
            if (centerstr != "<dev string:x519>") {
                var_ad7b95c0 = strtok(centerstr, "<dev string:x54f>");
                center = (float(var_ad7b95c0[0]), float(var_ad7b95c0[1]), 0);
            }
            add_circle(center, 0, 0, testcircleradius, damage, damageinterval, waitsec, scalesec, intensity);
            level thread function_81ccccb6();
        }
    }

    // Namespace death_circle/death_circle
    // Params 0, eflags: 0x4
    // Checksum 0x479a335, Offset: 0x4e40
    // Size: 0x14c
    function private function_81ccccb6() {
        level endon(#"game_ended");
        waitframe(1);
        while (isdefined(level.deathcircle)) {
            radius = getdvarint(#"testcircleradius", 0);
            intensity = getdvarint(#"hash_16271dbe4d00b41e", 0);
            if (radius < 1) {
                radius = 1;
            } else if (radius > 150000) {
                radius = 150000;
            }
            if (!(isdefined(level.deathcircle.scaling) && level.deathcircle.scaling)) {
                level.deathcircle.radius = radius;
                level.deathcircle setscale(radius / 15000);
            }
            level.deathcircle.intensity = intensity;
            waitframe(1);
        }
    }

    // Namespace death_circle/death_circle
    // Params 1, eflags: 0x4
    // Checksum 0x7dd71f79, Offset: 0x4f98
    // Size: 0xf4
    function private devgui_shuffle(count) {
        if (!isdefined(count)) {
            count = 1;
        }
        devgui_clear();
        count = int(count);
        if (count > 1) {
            level.var_47947565 = [];
            for (i = 0; i < count; i++) {
                shuffle_circles();
                level.var_47947565[i] = level.deathcircles[level.deathcircles.size - 1].tracepos;
            }
            return;
        }
        level.var_47947565 = undefined;
        shuffle_circles();
    }

    // Namespace death_circle/death_circle
    // Params 1, eflags: 0x4
    // Checksum 0xb108789c, Offset: 0x5098
    // Size: 0x2a2
    function private simulate(var_1baf9723) {
        sim_count = 1000;
        var_9a165bb5 = 100;
        assert(var_1baf9723);
        var_f3ca456b = [];
        for (i = 0; i < sim_count; i++) {
            devgui_shuffle();
            for (c = 0; c < level.deathcircles.size; c++) {
                circle = {#origin_x:level.deathcircles[c].origin[0], #origin_y:level.deathcircles[c].origin[1], #radius:level.deathcircles[c].radius, #index:c};
                if (!isdefined(var_f3ca456b)) {
                    var_f3ca456b = [];
                } else if (!isarray(var_f3ca456b)) {
                    var_f3ca456b = array(var_f3ca456b);
                }
                var_f3ca456b[var_f3ca456b.size] = circle;
            }
            if (var_f3ca456b.size + level.deathcircles.size >= var_9a165bb5) {
                var_de130ab9 = {#var_91393a2d:var_1baf9723};
                function_92d1707f(#"hash_3a9b483e717d26be", #"info", var_de130ab9, #"circles", var_f3ca456b);
                wait 1;
                var_f3ca456b = [];
            }
        }
        if (var_f3ca456b.size >= 0) {
            var_de130ab9 = {#var_91393a2d:var_1baf9723};
            function_92d1707f(#"hash_3a9b483e717d26be", #"info", var_de130ab9, #"circles", var_f3ca456b);
            wait 1;
        }
    }

    // Namespace death_circle/death_circle
    // Params 5, eflags: 0x4
    // Checksum 0xa6828e2f, Offset: 0x5348
    // Size: 0x754
    function private draw_circle(circle, index, var_36b41a8, color, groundtrace) {
        var_e96493f7 = 30 * var_36b41a8;
        origin = circle.origin;
        if (groundtrace) {
            trace = groundtrace(origin + (0, 0, 10000), origin + (0, 0, -10000), 0, undefined);
            origin = trace[#"position"];
        }
        printoffset = (0, 0, -15 * var_36b41a8);
        printorigin = origin;
        print3d(printorigin, index, (1, 1, 1), 1, var_36b41a8);
        printorigin += printoffset;
        print3d(printorigin, "<dev string:x553>" + circle.radius, (1, 1, 1), 1, var_36b41a8);
        printorigin += printoffset;
        print3d(printorigin, "<dev string:x55e>" + circle.damage, (1, 1, 1), 1, var_36b41a8);
        printorigin += printoffset;
        print3d(printorigin, "<dev string:x569>" + circle.damageinterval, (1, 1, 1), 1, var_36b41a8);
        printorigin += printoffset;
        print3d(printorigin, "<dev string:x57d>" + (isdefined(circle.var_227b1773) ? circle.var_227b1773 : "<dev string:x593>"), (1, 1, 1), 1, var_36b41a8);
        printorigin += printoffset;
        print3d(printorigin, "<dev string:x597>" + (isdefined(circle.waitsec) ? circle.waitsec : "<dev string:x593>") + "<dev string:x5a4>" + (isdefined(circle.var_42682706) ? circle.var_42682706 : "<dev string:x593>") + "<dev string:x5a9>", (1, 1, 1), 1, var_36b41a8);
        printorigin += printoffset;
        print3d(printorigin, "<dev string:x5ad>" + (isdefined(circle.scalesec) ? circle.scalesec : "<dev string:x593>") + "<dev string:x5a4>" + (isdefined(circle.var_83c673f5) ? circle.var_83c673f5 : "<dev string:x593>") + "<dev string:x5a9>", (1, 1, 1), 1, var_36b41a8);
        printorigin += printoffset;
        print3d(printorigin, "<dev string:x5bb>" + (isdefined(circle.attempts) ? circle.attempts : "<dev string:x593>"), (1, 1, 1), 1, var_36b41a8);
        printorigin += printoffset;
        sphere(origin, var_e96493f7, color);
        circle(origin, circle.radius, color, 0, 1);
        if (isdefined(circle.var_3b9f4abf) && isdefined(circle.mapwidth) && isdefined(circle.mapheight)) {
            var_3b9f4abf = (circle.var_3b9f4abf[0], circle.var_3b9f4abf[1], origin[2]);
            var_e96493f7 = 20 * var_36b41a8;
            halfwidth = circle.mapwidth / 2;
            halfheight = circle.mapheight / 2;
            var_b99d691b = var_3b9f4abf + (halfwidth, halfheight, 0);
            var_91d25b4a = var_3b9f4abf + (halfwidth, halfheight * -1, 0);
            var_3c4ec32 = var_3b9f4abf + (halfwidth * -1, halfheight * -1, 0);
            var_55e2210d = var_3b9f4abf + (halfwidth * -1, halfheight, 0);
            sphere(var_3b9f4abf, var_e96493f7, (1, 0, 1));
            print3d(var_3b9f4abf, "<dev string:x5c8>", (1, 1, 1), 1, var_36b41a8);
            sphere(var_b99d691b, var_e96493f7, (1, 0, 1));
            print3d(var_b99d691b, "<dev string:x5d7>", (1, 1, 1), 1, var_36b41a8);
            sphere(var_91d25b4a, var_e96493f7, (1, 0, 1));
            print3d(var_91d25b4a, "<dev string:x5dc>", (1, 1, 1), 1, var_36b41a8);
            sphere(var_3c4ec32, var_e96493f7, (1, 0, 1));
            print3d(var_3c4ec32, "<dev string:x5e1>", (1, 1, 1), 1, var_36b41a8);
            sphere(var_55e2210d, var_e96493f7, (1, 0, 1));
            print3d(var_55e2210d, "<dev string:x5e6>", (1, 1, 1), 1, var_36b41a8);
            line(var_b99d691b, var_91d25b4a, (1, 0, 1));
            line(var_91d25b4a, var_3c4ec32, (1, 0, 1));
            line(var_3c4ec32, var_55e2210d, (1, 0, 1));
            line(var_55e2210d, var_b99d691b, (1, 0, 1));
        }
    }

    // Namespace death_circle/death_circle
    // Params 2, eflags: 0x0
    // Checksum 0x48d5f9b5, Offset: 0x5aa8
    // Size: 0x12c
    function circle_color(circleindex, maxindex) {
        colorscale = array((0, 1, 0), (1, 0.5, 0), (1, 1, 0), (1, 0, 0));
        if (circleindex >= maxindex) {
            return colorscale[colorscale.size - 1];
        } else if (circleindex <= 0) {
            return colorscale[0];
        }
        var_30de3274 = circleindex * colorscale.size / maxindex;
        var_30de3274 -= 1;
        colorindex = int(var_30de3274);
        colorfrac = var_30de3274 - colorindex;
        utilitycolor = vectorlerp(colorscale[colorindex], colorscale[colorindex + 1], colorfrac);
        return utilitycolor;
    }

#/
