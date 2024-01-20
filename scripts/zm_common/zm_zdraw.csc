// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\util.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_zdraw;

// Namespace zm_zdraw/zm_zdraw
// Params 0, eflags: 0x2
// Checksum 0xb4884c3d, Offset: 0xb8
// Size: 0x4c
function autoexec __init__system__() {
    /#
        system::register(#"zdraw", &__init__, &__main__, undefined);
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 0, eflags: 0x0
// Checksum 0x8010f6f8, Offset: 0x110
// Size: 0x9c
function __init__() {
    /#
        setdvar(#"zdraw", "<unknown string>");
        level.zdraw = spawnstruct();
        function_c9f70832();
        function_99bd35ec();
        function_b36498d3();
        level thread function_c78d9e67();
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 0, eflags: 0x0
// Checksum 0x62d83da0, Offset: 0x1b8
// Size: 0x8
function __main__() {
    /#
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 0, eflags: 0x0
// Checksum 0x8e6f4794, Offset: 0x1c8
// Size: 0x46e
function function_c9f70832() {
    /#
        level.zdraw.colors = [];
        level.zdraw.colors[#"red"] = (1, 0, 0);
        level.zdraw.colors[#"green"] = (0, 1, 0);
        level.zdraw.colors[#"blue"] = (0, 0, 1);
        level.zdraw.colors[#"yellow"] = (1, 1, 0);
        level.zdraw.colors[#"orange"] = (1, 0.5, 0);
        level.zdraw.colors[#"cyan"] = (0, 1, 1);
        level.zdraw.colors[#"purple"] = (1, 0, 1);
        level.zdraw.colors[#"black"] = (0, 0, 0);
        level.zdraw.colors[#"white"] = (1, 1, 1);
        level.zdraw.colors[#"grey"] = vectorscale((1, 1, 1), 0.75);
        level.zdraw.colors[#"gray1"] = vectorscale((1, 1, 1), 0.1);
        level.zdraw.colors[#"gray2"] = vectorscale((1, 1, 1), 0.2);
        level.zdraw.colors[#"gray3"] = vectorscale((1, 1, 1), 0.3);
        level.zdraw.colors[#"gray4"] = vectorscale((1, 1, 1), 0.4);
        level.zdraw.colors[#"gray5"] = vectorscale((1, 1, 1), 0.5);
        level.zdraw.colors[#"gray6"] = vectorscale((1, 1, 1), 0.6);
        level.zdraw.colors[#"gray7"] = vectorscale((1, 1, 1), 0.7);
        level.zdraw.colors[#"gray8"] = vectorscale((1, 1, 1), 0.8);
        level.zdraw.colors[#"gray9"] = vectorscale((1, 1, 1), 0.9);
        level.zdraw.colors[#"slate"] = (0.439216, 0.501961, 0.564706);
        level.zdraw.colors[#"pink"] = (1, 0.752941, 0.796078);
        level.zdraw.colors[#"olive"] = vectorscale((1, 1, 0), 0.501961);
        level.zdraw.colors[#"brown"] = (0.545098, 0.270588, 0.0745098);
        level.zdraw.colors[#"default"] = (1, 1, 1);
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 0, eflags: 0x0
// Checksum 0xde040baf, Offset: 0x640
// Size: 0x22e
function function_99bd35ec() {
    /#
        level.zdraw.commands = [];
        level.zdraw.commands[#"color"] = &function_54389019;
        level.zdraw.commands[#"alpha"] = &function_82f2d020;
        level.zdraw.commands[#"duration"] = &function_cb18c560;
        level.zdraw.commands[#"seconds"] = &function_82201799;
        level.zdraw.commands[#"scale"] = &function_f7176625;
        level.zdraw.commands[#"radius"] = &function_a026f442;
        level.zdraw.commands[#"sides"] = &function_912c8db9;
        level.zdraw.commands[#"text"] = &function_b5cdeec6;
        level.zdraw.commands[#"star"] = &function_da7503f4;
        level.zdraw.commands[#"sphere"] = &function_3a2c5c6b;
        level.zdraw.commands[#"line"] = &function_25fd7d2a;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 0, eflags: 0x0
// Checksum 0xb84fe35e, Offset: 0x878
// Size: 0xf2
function function_b36498d3() {
    /#
        level.zdraw.color = level.zdraw.colors[#"default"];
        level.zdraw.alpha = 1;
        level.zdraw.scale = 1;
        level.zdraw.duration = int(1 * 62.5);
        level.zdraw.radius = 8;
        level.zdraw.sides = 10;
        level.zdraw.var_eeef5e89 = (0, 0, 0);
        level.zdraw.var_f78505a1 = 0;
        level.zdraw.var_d15c03f8 = "<unknown string>";
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 0, eflags: 0x0
// Checksum 0x997a3fab, Offset: 0x978
// Size: 0xf8
function function_c78d9e67() {
    /#
        level notify(#"hash_79dc2eb04ee1da22");
        level endon(#"hash_79dc2eb04ee1da22");
        for (;;) {
            cmd = getdvarstring(#"zdraw");
            if (cmd.size) {
                function_b36498d3();
                params = strtok(cmd, "<unknown string>");
                function_cd7ed6c5(params, 0, 1);
                setdvar(#"zdraw", "<unknown string>");
            }
            wait(0.5);
        }
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 3, eflags: 0x0
// Checksum 0x1f0db96a, Offset: 0xa78
// Size: 0xdc
function function_cd7ed6c5(var_a99ac828, startat, toplevel) {
    /#
        if (!isdefined(toplevel)) {
            toplevel = 0;
        }
        while (isdefined(var_a99ac828[startat])) {
            if (isdefined(level.zdraw.commands[var_a99ac828[startat]])) {
                startat = [[ level.zdraw.commands[var_a99ac828[startat]] ]](var_a99ac828, startat + 1);
            } else {
                if (isdefined(toplevel) && toplevel) {
                    function_96c207f("<unknown string>" + var_a99ac828[startat]);
                }
                return startat;
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0x9652cc8a, Offset: 0xb60
// Size: 0x15e
function function_3a2c5c6b(var_a99ac828, startat) {
    /#
        while (isdefined(var_a99ac828[startat])) {
            if (function_b0f457f2(var_a99ac828[startat])) {
                var_769ff4d7 = function_b59acc83(var_a99ac828, startat);
                if (var_769ff4d7 > startat) {
                    startat = var_769ff4d7;
                    center = level.zdraw.var_eeef5e89;
                    sphere(center, level.zdraw.radius, level.zdraw.color, level.zdraw.alpha, 1, level.zdraw.sides, level.zdraw.duration);
                    level.zdraw.var_eeef5e89 = (0, 0, 0);
                }
            } else {
                var_769ff4d7 = function_cd7ed6c5(var_a99ac828, startat);
                if (var_769ff4d7 > startat) {
                    startat = var_769ff4d7;
                } else {
                    return startat;
                }
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0xb6a0aca1, Offset: 0xcc8
// Size: 0x126
function function_da7503f4(var_a99ac828, startat) {
    /#
        while (isdefined(var_a99ac828[startat])) {
            if (function_b0f457f2(var_a99ac828[startat])) {
                var_769ff4d7 = function_b59acc83(var_a99ac828, startat);
                if (var_769ff4d7 > startat) {
                    startat = var_769ff4d7;
                    center = level.zdraw.var_eeef5e89;
                    debugstar(center, level.zdraw.duration, level.zdraw.color);
                    level.zdraw.var_eeef5e89 = (0, 0, 0);
                }
            } else {
                var_769ff4d7 = function_cd7ed6c5(var_a99ac828, startat);
                if (var_769ff4d7 > startat) {
                    startat = var_769ff4d7;
                } else {
                    return startat;
                }
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0xc0ddd9fb, Offset: 0xdf8
// Size: 0x186
function function_25fd7d2a(var_a99ac828, startat) {
    /#
        level.zdraw.linestart = undefined;
        while (isdefined(var_a99ac828[startat])) {
            if (function_b0f457f2(var_a99ac828[startat])) {
                var_769ff4d7 = function_b59acc83(var_a99ac828, startat);
                if (var_769ff4d7 > startat) {
                    startat = var_769ff4d7;
                    lineend = level.zdraw.var_eeef5e89;
                    if (isdefined(level.zdraw.linestart)) {
                        line(level.zdraw.linestart, lineend, level.zdraw.color, level.zdraw.alpha, 1, level.zdraw.duration);
                    }
                    level.zdraw.linestart = lineend;
                    level.zdraw.var_eeef5e89 = (0, 0, 0);
                }
            } else {
                var_769ff4d7 = function_cd7ed6c5(var_a99ac828, startat);
                if (var_769ff4d7 > startat) {
                    startat = var_769ff4d7;
                } else {
                    return startat;
                }
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0x52b1da06, Offset: 0xf88
// Size: 0x1de
function function_b5cdeec6(var_a99ac828, startat) {
    /#
        level.zdraw.text = "<unknown string>";
        if (isdefined(var_a99ac828[startat])) {
            var_769ff4d7 = function_7bf700e4(var_a99ac828, startat);
            if (var_769ff4d7 > startat) {
                startat = var_769ff4d7;
                level.zdraw.text = level.zdraw.var_d15c03f8;
                level.zdraw.var_d15c03f8 = "<unknown string>";
            }
        }
        while (isdefined(var_a99ac828[startat])) {
            if (function_b0f457f2(var_a99ac828[startat])) {
                var_769ff4d7 = function_b59acc83(var_a99ac828, startat);
                if (var_769ff4d7 > startat) {
                    startat = var_769ff4d7;
                    center = level.zdraw.var_eeef5e89;
                    print3d(center, level.zdraw.text, level.zdraw.color, level.zdraw.alpha, level.zdraw.scale, level.zdraw.duration);
                    level.zdraw.var_eeef5e89 = (0, 0, 0);
                }
            } else {
                var_769ff4d7 = function_cd7ed6c5(var_a99ac828, startat);
                if (var_769ff4d7 > startat) {
                    startat = var_769ff4d7;
                } else {
                    return startat;
                }
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0x196cf798, Offset: 0x1170
// Size: 0x170
function function_54389019(var_a99ac828, startat) {
    /#
        if (isdefined(var_a99ac828[startat])) {
            if (function_b0f457f2(var_a99ac828[startat])) {
                var_769ff4d7 = function_b59acc83(var_a99ac828, startat);
                if (var_769ff4d7 > startat) {
                    startat = var_769ff4d7;
                    level.zdraw.color = level.zdraw.var_eeef5e89;
                    level.zdraw.var_eeef5e89 = (0, 0, 0);
                } else {
                    level.zdraw.color = (1, 1, 1);
                }
            } else {
                if (isdefined(level.zdraw.colors[var_a99ac828[startat]])) {
                    level.zdraw.color = level.zdraw.colors[var_a99ac828[startat]];
                } else {
                    level.zdraw.color = (1, 1, 1);
                    function_96c207f("<unknown string>" + var_a99ac828[startat]);
                }
                startat = startat + 1;
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0xe7c01b8b, Offset: 0x12e8
// Size: 0xb4
function function_82f2d020(var_a99ac828, startat) {
    /#
        if (isdefined(var_a99ac828[startat])) {
            var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
            if (var_769ff4d7 > startat) {
                startat = var_769ff4d7;
                level.zdraw.alpha = level.zdraw.var_f78505a1;
                level.zdraw.var_f78505a1 = 0;
            } else {
                level.zdraw.alpha = 1;
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0xe28ea788, Offset: 0x13a8
// Size: 0xb4
function function_f7176625(var_a99ac828, startat) {
    /#
        if (isdefined(var_a99ac828[startat])) {
            var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
            if (var_769ff4d7 > startat) {
                startat = var_769ff4d7;
                level.zdraw.scale = level.zdraw.var_f78505a1;
                level.zdraw.var_f78505a1 = 0;
            } else {
                level.zdraw.scale = 1;
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0x737c9516, Offset: 0x1468
// Size: 0xe0
function function_cb18c560(var_a99ac828, startat) {
    /#
        if (isdefined(var_a99ac828[startat])) {
            var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
            if (var_769ff4d7 > startat) {
                startat = var_769ff4d7;
                level.zdraw.duration = int(level.zdraw.var_f78505a1);
                level.zdraw.var_f78505a1 = 0;
            } else {
                level.zdraw.duration = int(1 * 62.5);
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0x67bd00f, Offset: 0x1550
// Size: 0xe8
function function_82201799(var_a99ac828, startat) {
    /#
        if (isdefined(var_a99ac828[startat])) {
            var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
            if (var_769ff4d7 > startat) {
                startat = var_769ff4d7;
                level.zdraw.duration = int(62.5 * level.zdraw.var_f78505a1);
                level.zdraw.var_f78505a1 = 0;
            } else {
                level.zdraw.duration = int(1 * 62.5);
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0x4d851c0, Offset: 0x1640
// Size: 0xb4
function function_a026f442(var_a99ac828, startat) {
    /#
        if (isdefined(var_a99ac828[startat])) {
            var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
            if (var_769ff4d7 > startat) {
                startat = var_769ff4d7;
                level.zdraw.radius = level.zdraw.var_f78505a1;
                level.zdraw.var_f78505a1 = 0;
            } else {
                level.zdraw.radius = 8;
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0xfe548077, Offset: 0x1700
// Size: 0xc4
function function_912c8db9(var_a99ac828, startat) {
    /#
        if (isdefined(var_a99ac828[startat])) {
            var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
            if (var_769ff4d7 > startat) {
                startat = var_769ff4d7;
                level.zdraw.sides = int(level.zdraw.var_f78505a1);
                level.zdraw.var_f78505a1 = 0;
            } else {
                level.zdraw.sides = 10;
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 1, eflags: 0x0
// Checksum 0x77aa84ed, Offset: 0x17d0
// Size: 0x86
function function_b0f457f2(param) {
    /#
        if (isdefined(param) && (isint(param) || isfloat(param) || isstring(param) && strisnumber(param))) {
            return 1;
        }
        return 0;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0x7796c86, Offset: 0x1860
// Size: 0x258
function function_b59acc83(var_a99ac828, startat) {
    /#
        if (isdefined(var_a99ac828[startat])) {
            var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
            if (var_769ff4d7 > startat) {
                startat = var_769ff4d7;
                level.zdraw.var_eeef5e89 = (level.zdraw.var_f78505a1, level.zdraw.var_eeef5e89[1], level.zdraw.var_eeef5e89[2]);
                level.zdraw.var_f78505a1 = 0;
            } else {
                function_96c207f("<unknown string>");
                return startat;
            }
            var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
            if (var_769ff4d7 > startat) {
                startat = var_769ff4d7;
                level.zdraw.var_eeef5e89 = (level.zdraw.var_eeef5e89[0], level.zdraw.var_f78505a1, level.zdraw.var_eeef5e89[2]);
                level.zdraw.var_f78505a1 = 0;
            } else {
                function_96c207f("<unknown string>");
                return startat;
            }
            var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
            if (var_769ff4d7 > startat) {
                startat = var_769ff4d7;
                level.zdraw.var_eeef5e89 = (level.zdraw.var_eeef5e89[0], level.zdraw.var_eeef5e89[1], level.zdraw.var_f78505a1);
                level.zdraw.var_f78505a1 = 0;
            } else {
                function_96c207f("<unknown string>");
                return startat;
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0xa04eee9b, Offset: 0x1ac0
// Size: 0x86
function revive_getdvar(var_a99ac828, startat) {
    /#
        if (isdefined(var_a99ac828[startat])) {
            if (function_b0f457f2(var_a99ac828[startat])) {
                level.zdraw.var_f78505a1 = float(var_a99ac828[startat]);
                startat = startat + 1;
            }
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 2, eflags: 0x0
// Checksum 0x399780a6, Offset: 0x1b50
// Size: 0x56
function function_7bf700e4(var_a99ac828, startat) {
    /#
        if (isdefined(var_a99ac828[startat])) {
            level.zdraw.var_d15c03f8 = var_a99ac828[startat];
            startat = startat + 1;
        }
        return startat;
    #/
}

// Namespace zm_zdraw/zm_zdraw
// Params 1, eflags: 0x0
// Checksum 0x19f93c1, Offset: 0x1bb0
// Size: 0x34
function function_96c207f(msg) {
    /#
        println("<unknown string>" + msg);
    #/
}

