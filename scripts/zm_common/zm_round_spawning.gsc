// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;

#namespace zm_round_spawning;

// Namespace zm_round_spawning
// Method(s) 2 Total 2
class class_2517dc3b {

    // Namespace class_2517dc3b/zm_round_spawning
    // Params 0, eflags: 0x9 linked
    // Checksum 0x6058913c, Offset: 0x19d0
    // Size: 0xe
    __constructor() {
        self.var_d7d3cd31 = [];
    }

    // Namespace class_2517dc3b/zm_round_spawning
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x19e8
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace zm_round_spawning
// Method(s) 2 Total 2
class class_557db8fd {

    // Namespace class_557db8fd/zm_round_spawning
    // Params 0, eflags: 0x9 linked
    // Checksum 0xead3c1a9, Offset: 0x18d8
    // Size: 0x4a
    __constructor() {
        self.var_123aa3d9 = 0;
        self.var_28ba9034 = 0;
        self.var_f6a3b5b0 = 0;
        self.var_de9ce9b0 = [];
        self.var_30bb6097 = [];
        self.var_74f6178a = 0;
    }

    // Namespace class_557db8fd/zm_round_spawning
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x1930
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x2
// Checksum 0x9548c1a3, Offset: 0x110
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_round_spawning", &__init__, &__main__, undefined);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x1 linked
// Checksum 0x3113696b, Offset: 0x160
// Size: 0xec
function function_cc103b38(str_archetype, n_round) {
    function_bc9fd0f8(n_round);
    if (!isdefined(level.var_ff78f6de)) {
        level.var_ff78f6de = [];
    } else if (!isarray(level.var_ff78f6de)) {
        level.var_ff78f6de = array(level.var_ff78f6de);
    }
    level.var_ff78f6de[n_round] = str_archetype;
    /#
        level.var_8640f511[n_round] = str_archetype;
        array::add_sorted(level.var_c8d852a1, n_round, 0);
    #/
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x1 linked
// Checksum 0xcdcbae40, Offset: 0x258
// Size: 0x23c
function function_376e51ef(str_archetype, n_round) {
    /#
        assert(isdefined(level.var_819e7dfd), "<unknown string>");
    #/
    /#
        assert(isdefined(level.var_819e7dfd[str_archetype]), str_archetype + "<unknown string>");
    #/
    if (level.var_819e7dfd[str_archetype].var_74f6178a) {
        return;
    }
    if (isdefined(n_round) && level.round_number < n_round) {
        if (!isdefined(level.var_b45615aa)) {
            level.var_b45615aa = [];
        } else if (!isarray(level.var_b45615aa)) {
            level.var_b45615aa = array(level.var_b45615aa);
        }
        if (!isdefined(level.var_b45615aa[n_round])) {
            level.var_b45615aa[n_round] = [];
        } else if (!isarray(level.var_b45615aa[n_round])) {
            level.var_b45615aa[n_round] = array(level.var_b45615aa[n_round]);
        }
        if (!isinarray(level.var_b45615aa[n_round], str_archetype)) {
            level.var_b45615aa[n_round][level.var_b45615aa[n_round].size] = str_archetype;
        }
        /#
            level.var_8640f511[n_round] = str_archetype;
            array::add_sorted(level.var_c8d852a1, n_round, 0);
        #/
        return;
    }
    function_adc96c10(str_archetype, level.round_number);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x1 linked
// Checksum 0x2088bf1b, Offset: 0x4a0
// Size: 0x17a
function function_306ce518(str_archetype, var_b77797) {
    /#
        assert(isdefined(level.var_819e7dfd), "<unknown string>");
    #/
    /#
        assert(isdefined(level.var_819e7dfd[str_archetype]), str_archetype + "<unknown string>");
    #/
    /#
        assert(!level.var_819e7dfd[str_archetype].var_74f6178a, "<unknown string>");
    #/
    if (!isdefined(level.var_819e7dfd[str_archetype].var_de9ce9b0)) {
        level.var_819e7dfd[str_archetype].var_de9ce9b0 = [];
    } else if (!isarray(level.var_819e7dfd[str_archetype].var_de9ce9b0)) {
        level.var_819e7dfd[str_archetype].var_de9ce9b0 = array(level.var_819e7dfd[str_archetype].var_de9ce9b0);
    }
    level.var_819e7dfd[str_archetype].var_de9ce9b0[level.var_819e7dfd[str_archetype].var_de9ce9b0.size] = var_b77797;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 7, eflags: 0x1 linked
// Checksum 0x3512690c, Offset: 0x628
// Size: 0x214
function function_b4a8f95a(var_616b394b, n_round, func_start, func_end, var_124f39da, var_84f505b1, b_ignore_cleanup = 1) {
    function_bc9fd0f8(n_round);
    if (!isdefined(level.var_45827161)) {
        level.var_45827161 = [];
    } else if (!isarray(level.var_45827161)) {
        level.var_45827161 = array(level.var_45827161);
    }
    var_a630f8a4 = new class_2517dc3b();
    if (isfunctionptr(var_616b394b)) {
        var_a630f8a4.var_a51dd114 = var_616b394b;
    } else {
        if (!isdefined(var_616b394b)) {
            var_616b394b = [];
        } else if (!isarray(var_616b394b)) {
            var_616b394b = array(var_616b394b);
        }
        var_a630f8a4.var_d7d3cd31 = var_616b394b;
    }
    var_a630f8a4.m_func_start = func_start;
    var_a630f8a4.m_func_end = func_end;
    var_a630f8a4.var_66a9e28e = var_124f39da;
    var_a630f8a4.var_e1c63487 = var_84f505b1;
    var_a630f8a4.var_dc071360 = b_ignore_cleanup;
    level.var_45827161[n_round] = var_a630f8a4;
    /#
        level.var_f5db924c[n_round] = var_a630f8a4;
        array::add_sorted(level.var_a06c0ea0, n_round, 0);
    #/
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x0
// Checksum 0x6e78d574, Offset: 0x848
// Size: 0xc4
function function_d36196b1(n_round) {
    if (isdefined(level.var_45827161) && isdefined(level.var_45827161[n_round])) {
        arrayremoveindex(level.var_45827161, n_round, 1);
        arrayremovevalue(level.var_865ea9f, n_round);
        /#
            arrayremoveindex(level.var_f5db924c, n_round, 1);
            arrayremovevalue(level.var_a06c0ea0, n_round);
        #/
        return true;
    }
    return false;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0x4b3f4712, Offset: 0x918
// Size: 0x44
function function_40229072(n_round = level.round_number) {
    return isdefined(level.var_45827161) && isdefined(level.var_45827161[n_round]);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x1 linked
// Checksum 0x50225db1, Offset: 0x968
// Size: 0x20c
function function_43aed0ca(n_round, var_b6a3a1ac = 1) {
    if (isdefined(level.var_45827161) && isdefined(level.var_45827161[n_round])) {
        var_a630f8a4 = level.var_45827161[n_round];
        arrayremoveindex(level.var_45827161, n_round, 1);
        arrayremovevalue(level.var_865ea9f, n_round);
        /#
            arrayremoveindex(level.var_f5db924c, n_round, 1);
            arrayremovevalue(level.var_a06c0ea0, n_round);
        #/
        for (var_bfda0037 = n_round + var_b6a3a1ac; isinarray(level.var_865ea9f, var_bfda0037); var_bfda0037++) {
        }
        level.var_45827161[var_bfda0037] = var_a630f8a4;
        if (!isdefined(level.var_865ea9f)) {
            level.var_865ea9f = [];
        } else if (!isarray(level.var_865ea9f)) {
            level.var_865ea9f = array(level.var_865ea9f);
        }
        level.var_865ea9f[level.var_865ea9f.size] = var_bfda0037;
        /#
            level.var_f5db924c[var_bfda0037] = var_a630f8a4;
            array::add_sorted(level.var_a06c0ea0, var_bfda0037, 0);
        #/
        return true;
    }
    return false;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0x2d73c545, Offset: 0xb80
// Size: 0x166
function function_f6cd912d(var_ef21400 = 0) {
    if (isdefined(level.var_45827161)) {
        var_af83ca3 = undefined;
        foreach (n_round, var_a630f8a4 in level.var_45827161) {
            if (var_ef21400 && n_round >= level.round_number || n_round > level.round_number) {
                if (!isdefined(var_af83ca3) || n_round < var_af83ca3) {
                    var_af83ca3 = n_round;
                }
            }
        }
        if (isdefined(var_af83ca3)) {
            var_a630f8a4 = level.var_45827161[var_af83ca3];
            s_special_round = {#archetypes:isdefined(var_a630f8a4.var_d7d3cd31) ? var_a630f8a4.var_d7d3cd31 : var_a630f8a4.var_a51dd114, #n_round:var_af83ca3};
            return s_special_round;
        }
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x0
// Checksum 0x99a0c598, Offset: 0xcf0
// Size: 0x124
function function_517a18d8(var_42078d2) {
    if (!isdefined(level.var_89fda7e[#"on_ai_killed"])) {
        level.var_89fda7e[#"on_ai_killed"] = [];
    } else if (!isarray(level.var_89fda7e[#"on_ai_killed"])) {
        level.var_89fda7e[#"on_ai_killed"] = array(level.var_89fda7e[#"on_ai_killed"]);
    }
    if (!isinarray(level.var_89fda7e[#"on_ai_killed"], var_42078d2)) {
        level.var_89fda7e[#"on_ai_killed"][level.var_89fda7e[#"on_ai_killed"].size] = var_42078d2;
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x0
// Checksum 0x79d39f88, Offset: 0xe20
// Size: 0x6c
function function_2463a38a(var_42078d2) {
    /#
        assert(isdefined(level.var_89fda7e[#"on_ai_killed"]), "<unknown string>");
    #/
    arrayremovevalue(level.var_89fda7e[#"on_ai_killed"], var_42078d2);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0x7fa69925, Offset: 0xe98
// Size: 0x124
function function_df803678(var_42078d2) {
    if (!isdefined(level.var_89fda7e[#"hash_23d7b4f508f08db0"])) {
        level.var_89fda7e[#"hash_23d7b4f508f08db0"] = [];
    } else if (!isarray(level.var_89fda7e[#"hash_23d7b4f508f08db0"])) {
        level.var_89fda7e[#"hash_23d7b4f508f08db0"] = array(level.var_89fda7e[#"hash_23d7b4f508f08db0"]);
    }
    if (!isinarray(level.var_89fda7e[#"hash_23d7b4f508f08db0"], var_42078d2)) {
        level.var_89fda7e[#"hash_23d7b4f508f08db0"][level.var_89fda7e[#"hash_23d7b4f508f08db0"].size] = var_42078d2;
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0xa4764c27, Offset: 0xfc8
// Size: 0x6c
function function_5bc2cea1(var_42078d2) {
    /#
        assert(isdefined(level.var_89fda7e[#"hash_23d7b4f508f08db0"]), "<unknown string>");
    #/
    arrayremovevalue(level.var_89fda7e[#"hash_23d7b4f508f08db0"], var_42078d2);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x1 linked
// Checksum 0x7a45bf78, Offset: 0x1040
// Size: 0x142
function function_2876740e(str_archetype, var_5b4c8565) {
    /#
        assert(isdefined(level.var_819e7dfd), "<unknown string>");
    #/
    /#
        assert(isdefined(level.var_819e7dfd[str_archetype]), str_archetype + "<unknown string>");
    #/
    if (!isdefined(level.var_819e7dfd[str_archetype].var_30bb6097)) {
        level.var_819e7dfd[str_archetype].var_30bb6097 = [];
    } else if (!isarray(level.var_819e7dfd[str_archetype].var_30bb6097)) {
        level.var_819e7dfd[str_archetype].var_30bb6097 = array(level.var_819e7dfd[str_archetype].var_30bb6097);
    }
    level.var_819e7dfd[str_archetype].var_30bb6097[level.var_819e7dfd[str_archetype].var_30bb6097.size] = var_5b4c8565;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x1 linked
// Checksum 0xd5b4bf0c, Offset: 0x1190
// Size: 0x9c
function function_9bf14a10(str_archetype, var_5b4c8565) {
    /#
        assert(isdefined(level.var_819e7dfd), "<unknown string>");
    #/
    /#
        assert(isdefined(level.var_819e7dfd[str_archetype]), str_archetype + "<unknown string>");
    #/
    arrayremovevalue(level.var_819e7dfd[str_archetype].var_30bb6097, var_5b4c8565, 0);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0x3666b9db, Offset: 0x1238
// Size: 0x2a
function function_d0db51fc(str_archetype) {
    return isinarray(level.var_5d2cd3b1, str_archetype);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0xa62fff13, Offset: 0x1270
// Size: 0x92
function function_c1571721(var_6504481a) {
    if (!isdefined(level.var_a5704584)) {
        level.var_a5704584 = [];
    } else if (!isarray(level.var_a5704584)) {
        level.var_a5704584 = array(level.var_a5704584);
    }
    level.var_a5704584[level.var_a5704584.size] = var_6504481a;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0x7993e5b9, Offset: 0x1310
// Size: 0x2c
function function_510039c1(var_6504481a) {
    arrayremovevalue(level.var_a5704584, var_6504481a);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0x8ba4021a, Offset: 0x1348
// Size: 0x92
function function_54fee373(var_dcf8380e) {
    if (!isdefined(level.var_ecbb7faa)) {
        level.var_ecbb7faa = [];
    } else if (!isarray(level.var_ecbb7faa)) {
        level.var_ecbb7faa = array(level.var_ecbb7faa);
    }
    level.var_ecbb7faa[level.var_ecbb7faa.size] = var_dcf8380e;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0x6a6ac397, Offset: 0x13e8
// Size: 0x2c
function function_375519eb(var_dcf8380e) {
    arrayremovevalue(level.var_ecbb7faa, var_dcf8380e);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x0
// Checksum 0xd33fb982, Offset: 0x1420
// Size: 0xba
function function_2669b95a(str_archetype, var_97bd4883) {
    /#
        assert(isdefined(level.var_819e7dfd), "<unknown string>");
    #/
    /#
        assert(isdefined(level.var_819e7dfd[str_archetype]), str_archetype + "<unknown string>");
    #/
    /#
        assert(isdefined(level.var_819e7dfd[var_97bd4883]), var_97bd4883 + "<unknown string>");
    #/
    level.var_819e7dfd[str_archetype].var_8988f7a0 = var_97bd4883;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 5, eflags: 0x1 linked
// Checksum 0x3a207127, Offset: 0x14e8
// Size: 0x276
function register_archetype(str_archetype, var_c48a6bb7, func_round_spawn, var_9a8e4fdb, var_376db024) {
    if (!isdefined(level.var_33e85fa1)) {
        level.var_33e85fa1 = [];
    } else if (!isarray(level.var_33e85fa1)) {
        level.var_33e85fa1 = array(level.var_33e85fa1);
    }
    if (!isdefined(level.var_819e7dfd)) {
        level.var_819e7dfd = [];
    } else if (!isarray(level.var_819e7dfd)) {
        level.var_819e7dfd = array(level.var_819e7dfd);
    }
    var_75b393f9 = new class_557db8fd();
    var_75b393f9.var_2ecba2c5 = str_archetype;
    var_75b393f9.var_8e73a12b = var_c48a6bb7;
    var_75b393f9.var_ef500cb7 = func_round_spawn;
    if (isdefined(var_9a8e4fdb)) {
        var_75b393f9.var_87ed2709 = var_9a8e4fdb;
    }
    var_376db024 = function_f2bdfd5a(str_archetype, var_376db024);
    var_75b393f9.var_f6a3b5b0 = var_376db024;
    if (!isdefined(level.var_33e85fa1[var_376db024])) {
        level.var_33e85fa1[var_376db024] = [];
    } else if (!isarray(level.var_33e85fa1[var_376db024])) {
        level.var_33e85fa1[var_376db024] = array(level.var_33e85fa1[var_376db024]);
    }
    if (!isinarray(level.var_33e85fa1[var_376db024], var_75b393f9)) {
        level.var_33e85fa1[var_376db024][level.var_33e85fa1[var_376db024].size] = var_75b393f9;
    }
    level.var_819e7dfd[str_archetype] = var_75b393f9;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x1 linked
// Checksum 0x97bb3f89, Offset: 0x1768
// Size: 0x13c
function __init__() {
    level.var_b7a8520a = array({#var_fadd1539:array(2, 2), #var_101fc930:array(0.75, 0.25)}, {#var_fadd1539:array(1, 1, 1, 1), #var_101fc930:array(0.25, 0.25, 0.25, 0.25)});
    level.var_5d2cd3b1 = [];
    level.var_89fda7e = [];
    level.var_65e3ac8a = 0;
    level flag::init(#"disable_special_rounds");
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x1 linked
// Checksum 0xe32300d7, Offset: 0x18b0
// Size: 0x1c
function __main__() {
    /#
        level thread devgui();
    #/
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x1 linked
// Checksum 0x4c158692, Offset: 0x1a88
// Size: 0x198
function function_b2dabfc() {
    if (!isdefined(level.var_33e85fa1)) {
        return;
    }
    level.var_8cb2d124 = array(0, 0, 0, 0);
    level.var_c1a3937d = [];
    level.var_5d2cd3b1 = [];
    level.var_722fb772 = undefined;
    level.var_fb9b5925 = 0;
    /#
        level.var_1113eecd = array(0, 0, 0, 0);
        level.var_d112f81e = array(0, 0, 0, 0);
        level.var_50cfb6c2 = array([], [], [], []);
        level.var_f4e76c2 = [];
        level.var_1c1a2394 = [];
        level.var_810c1c3 = 0;
        level.var_4d6c53ca = 0;
    #/
    if (!level function_12b8d86()) {
        var_dbce0c44 = function_b72a438d();
        /#
            level.var_e654b7de = var_dbce0c44;
        #/
        if (var_dbce0c44 > 0) {
            function_d7864087(var_dbce0c44);
        }
    }
    level notify(#"hash_5d3012139f083ccb");
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x1 linked
// Checksum 0xb861d863, Offset: 0x1c28
// Size: 0x2be
function function_4990741c() {
    if (!isdefined(level.var_33e85fa1)) {
        return 0;
    }
    var_79976254 = 0;
    if (level.var_c1a3937d.size) {
        if (level flag::get(#"infinite_round_spawning") && level.zombie_total <= 0) {
            if (!isdefined(level.var_722fb772) || level.var_722fb772 <= 0) {
                function_44298b05();
            }
            var_3c73ecd4 = level.var_722fb772;
            level.var_722fb772--;
        } else {
            var_3c73ecd4 = level.zombie_total;
        }
        var_a6559064 = 1 + level.var_38b15968 - var_3c73ecd4;
        if (var_a6559064 > level.var_fb9b5925 && isdefined(level.var_c1a3937d[var_a6559064])) {
            var_75b393f9 = level.var_819e7dfd[level.var_c1a3937d[var_a6559064]];
            var_79976254 = [[ var_75b393f9.var_ef500cb7 ]]();
            if (!(isdefined(var_79976254) && var_79976254) && isdefined(var_75b393f9.var_8988f7a0)) {
                var_9e2294d7 = level.var_819e7dfd[var_75b393f9.var_8988f7a0];
                var_79976254 = [[ var_9e2294d7.var_ef500cb7 ]]();
            }
            /#
                foreach (var_c28e5f72 in level.var_50cfb6c2) {
                    foreach (var_e5aaf7f4 in var_c28e5f72) {
                        if (var_e5aaf7f4.n_spawn == var_a6559064) {
                            var_e5aaf7f4.b_spawned = 1;
                        }
                    }
                }
            #/
        }
        if (var_a6559064 > level.var_fb9b5925) {
            level.var_fb9b5925 = var_a6559064;
        }
    }
    return var_79976254;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x5 linked
// Checksum 0x9582e1c5, Offset: 0x1ef0
// Size: 0x246
function private function_3d5b3f85(str_archetype) {
    if (!isdefined(level.var_5d2cd3b1)) {
        level.var_5d2cd3b1 = [];
    } else if (!isarray(level.var_5d2cd3b1)) {
        level.var_5d2cd3b1 = array(level.var_5d2cd3b1);
    }
    if (!isinarray(level.var_5d2cd3b1, str_archetype)) {
        level.var_5d2cd3b1[level.var_5d2cd3b1.size] = str_archetype;
    }
    var_31b155cf = randomintrangeinclusive(6, int(min(10, level.zombie_total)));
    level.var_c1a3937d[var_31b155cf] = str_archetype;
    /#
        var_e5aaf7f4 = {#b_spawned:0, #n_spawn:var_31b155cf, #str_archetype:str_archetype};
        if (!isdefined(level.var_50cfb6c2[0])) {
            level.var_50cfb6c2[0] = [];
        } else if (!isarray(level.var_50cfb6c2[0])) {
            level.var_50cfb6c2[0] = array(level.var_50cfb6c2[0]);
        }
        level.var_50cfb6c2[0][level.var_50cfb6c2[0].size] = var_e5aaf7f4;
        if (!isdefined(level.var_f4e76c2[str_archetype])) {
            level.var_f4e76c2[str_archetype] = 0;
        }
        level.var_f4e76c2[str_archetype]++;
    #/
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x5 linked
// Checksum 0x99ecf042, Offset: 0x2140
// Size: 0x16e
function private function_12b8d86() {
    var_6c6d9742 = 0;
    if (isdefined(level.var_ff78f6de)) {
        var_1d5eb847 = getarraykeys(level.var_ff78f6de);
        foreach (var_27100bc7 in var_1d5eb847) {
            if (var_27100bc7 <= level.round_number) {
                str_archetype = level.var_ff78f6de[var_27100bc7];
                function_adc96c10(str_archetype, var_27100bc7);
                arrayremoveindex(level.var_ff78f6de, var_27100bc7, 1);
                if (var_27100bc7 == level.round_number) {
                    var_6c6d9742 = 1;
                    /#
                        level.var_810c1c3 = 1;
                    #/
                    function_3d5b3f85(str_archetype);
                }
            }
        }
        if (!level.var_ff78f6de.size) {
            level.var_ff78f6de = undefined;
        }
    }
    return var_6c6d9742;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x5 linked
// Checksum 0xc6a4cc48, Offset: 0x22b8
// Size: 0x172
function private function_20956f95() {
    if (isdefined(level.var_b45615aa)) {
        foreach (n_round in getarraykeys(level.var_b45615aa)) {
            if (n_round <= level.round_number) {
                foreach (str_archetype in level.var_b45615aa[n_round]) {
                    if (!level.var_819e7dfd[str_archetype].var_74f6178a) {
                        function_adc96c10(str_archetype, n_round);
                    }
                }
                arrayremoveindex(level.var_b45615aa, n_round, 1);
            }
        }
        if (!level.var_b45615aa.size) {
            level.var_b45615aa = undefined;
        }
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x5 linked
// Checksum 0xc551db73, Offset: 0x2438
// Size: 0xb2
function private function_adc96c10(str_archetype, n_round) {
    foreach (var_b77797 in level.var_819e7dfd[str_archetype].var_de9ce9b0) {
        level thread [[ var_b77797 ]](n_round);
    }
    level.var_819e7dfd[str_archetype].var_74f6178a = 1;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x1 linked
// Checksum 0xff16b73e, Offset: 0x24f8
// Size: 0x154
function function_191ae5ec() {
    level function_20956f95();
    if (isdefined(level.var_45827161) && isdefined(level.var_45827161[level.round_number])) {
        if (level flag::get(#"disable_special_rounds")) {
            arrayremoveindex(level.var_45827161, level.round_number, 1);
            /#
                level.var_f5db924c[level.round_number].b_skipped = 1;
            #/
            return false;
        }
        if (zm_custom::function_928e94b9(level.var_45827161[level.round_number].var_d7d3cd31)) {
            if (isdefined(level.var_45827161[level.round_number].m_func_end)) {
                level [[ level.var_45827161[level.round_number].m_func_end ]](0);
                return false;
            }
        }
        level function_f3635804();
        return true;
    }
    return false;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x5 linked
// Checksum 0x4d778285, Offset: 0x2658
// Size: 0x17c
function private function_f3635804() {
    if (zm_utility::is_trials() && level flag::get("round_reset")) {
        return 0;
    }
    level flag::set("special_round");
    level.var_5d2cd3b1 = [];
    var_a630f8a4 = level.var_45827161[level.round_number];
    var_a630f8a4.var_a36c7a7a = level.round_wait_func;
    level.round_wait_func = &function_294bf81f;
    level.zombie_total = level [[ var_a630f8a4.var_66a9e28e ]]();
    function_6e064f4c(var_a630f8a4.var_d7d3cd31[0]);
    level.var_e2aef122 = level.zombie_total;
    level.var_fa6ba733 = 0;
    level callback::on_ai_killed(&function_e84b609c);
    level notify(#"zombie_total_set");
    /#
        level.var_4d6c53ca = 1;
    #/
    level thread function_bb169fc9(var_a630f8a4);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0xbf770f1d, Offset: 0x27e0
// Size: 0x37e
function function_6e064f4c(str_archetype) {
    var_148cc603 = level.zombie_total;
    if (isinarray(array(#"blight_father", #"brutus", #"gegenees"), hash(str_archetype))) {
        var_148cc603 = var_148cc603 * (isdefined(level.var_928a4995) ? level.var_928a4995 : 1);
    } else if (isinarray(array(#"stoker", #"gladiator", #"gladiator_marauder", #"gladiator_destroyer", #"werewolf"), hash(str_archetype))) {
        var_148cc603 = var_148cc603 * (isdefined(level.var_cd345b49) ? level.var_cd345b49 : 1);
    } else if (isinarray(array(#"bat", #"dog", #"zombie_dog"), hash(str_archetype))) {
        var_148cc603 = var_148cc603 * (isdefined(level.var_9d9b2113) ? level.var_9d9b2113 : 1);
    } else if (isinarray(array(#"nosferatu", #"skeleton", #"nova_crawler", #"tiger", #"catalyst", #"catalyst_corrosive", #"catalyst_electric", #"catalyst_plasma", #"catalyst_water"), hash(str_archetype))) {
        var_148cc603 = var_148cc603 * (isdefined(level.var_71bc2e8f) ? level.var_71bc2e8f : 1);
    }
    if (math::cointoss()) {
        level.zombie_total = floor(var_148cc603);
    } else {
        level.zombie_total = ceil(var_148cc603);
    }
    level.zombie_total = int(level.zombie_total);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x5 linked
// Checksum 0x97d82ef5, Offset: 0x2b68
// Size: 0x9c
function private function_bb169fc9(var_a630f8a4) {
    level [[ var_a630f8a4.m_func_start ]]();
    wait(1);
    level thread zm_audio::function_bca32e49("roundstart", "special", undefined, 2);
    wait(2);
    var_d25bbdd5 = level function_979b03db(var_a630f8a4);
    level thread function_30ed7851(var_a630f8a4, var_d25bbdd5);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x5 linked
// Checksum 0xa5a34d62, Offset: 0x2c10
// Size: 0x304
function private function_979b03db(var_a630f8a4) {
    level endon(#"intermission", #"end_of_round", #"restart_round", #"kill_round");
    while (true) {
        var_404e4288 = zombie_utility::get_current_zombie_count();
        if (var_404e4288 >= level.zombie_ai_limit) {
            wait(0.25);
            continue;
        }
        level flag::wait_till("spawn_zombies");
        if (isdefined(var_a630f8a4.var_a51dd114)) {
            str_archetype = level [[ var_a630f8a4.var_a51dd114 ]]();
        } else if (var_a630f8a4.var_d7d3cd31.size == 1) {
            str_archetype = var_a630f8a4.var_d7d3cd31[0];
        } else {
            str_archetype = array::random(var_a630f8a4.var_d7d3cd31);
        }
        if (!isdefined(level.var_5d2cd3b1)) {
            level.var_5d2cd3b1 = [];
        } else if (!isarray(level.var_5d2cd3b1)) {
            level.var_5d2cd3b1 = array(level.var_5d2cd3b1);
        }
        if (!isinarray(level.var_5d2cd3b1, str_archetype)) {
            level.var_5d2cd3b1[level.var_5d2cd3b1.size] = str_archetype;
        }
        var_75b393f9 = level.var_819e7dfd[str_archetype];
        /#
            assert(isdefined(var_75b393f9.var_87ed2709), "<unknown string>" + str_archetype);
        #/
        if (level.zombie_total > 0) {
            ai = [[ var_75b393f9.var_87ed2709 ]]();
        }
        if (isdefined(ai)) {
            ai.b_ignore_cleanup = var_a630f8a4.var_dc071360;
            ai.var_ba75c6dc = 1;
            level.zombie_total--;
        }
        ai = undefined;
        if (level.zombie_total <= 0 && zombie_utility::get_current_zombie_count() <= 0 && !level flag::get(#"hold_round_end")) {
            return 1;
        }
        level [[ var_a630f8a4.var_e1c63487 ]]();
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x1 linked
// Checksum 0x96b1fa37, Offset: 0x2f20
// Size: 0xc2
function function_30ed7851(var_a630f8a4, var_d25bbdd5 = 0) {
    level.round_wait_func = var_a630f8a4.var_a36c7a7a;
    level [[ var_a630f8a4.m_func_end ]](var_d25bbdd5);
    level callback::remove_on_ai_killed(&function_e84b609c);
    level thread function_926c3119(var_a630f8a4);
    level flag::clear("special_round");
    level.var_e2aef122 = undefined;
    level.var_fa6ba733 = undefined;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x5 linked
// Checksum 0x2f6506a9, Offset: 0x2ff0
// Size: 0x44
function private function_926c3119(var_a630f8a4) {
    if (!zm_utility::is_trials()) {
        arrayremovevalue(level.var_45827161, var_a630f8a4, 1);
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x1 linked
// Checksum 0x366ae6b0, Offset: 0x3040
// Size: 0x24
function function_294bf81f() {
    level flag::wait_till_clear("special_round");
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x1 linked
// Checksum 0x1e5de94a, Offset: 0x3070
// Size: 0x26e
function function_e84b609c(s_params) {
    if (isdefined(self.var_e700d5e2) && self.var_e700d5e2 || isdefined(self.var_2f68be48) && self.var_2f68be48) {
        return;
    }
    if (!(isdefined(self.var_ba75c6dc) && self.var_ba75c6dc)) {
        return;
    }
    if (isdefined(self.var_69a981e6) && self.var_69a981e6 && (!isdefined(s_params.eattacker) || s_params.eattacker.classname == "worldspawn")) {
        return;
    }
    level.var_fa6ba733++;
    /#
        assert(level flag::get("<unknown string>") || level flag::get("<unknown string>"), "<unknown string>");
    #/
    if (isdefined(level.var_89fda7e[#"on_ai_killed"])) {
        foreach (var_42078d2 in level.var_89fda7e[#"on_ai_killed"]) {
            self thread [[ var_42078d2 ]](s_params);
        }
    }
    if (isdefined(level.var_89fda7e[#"hash_23d7b4f508f08db0"]) && level.var_fa6ba733 == level.var_e2aef122) {
        self.no_powerups = 1;
        foreach (var_42078d2 in level.var_89fda7e[#"hash_23d7b4f508f08db0"]) {
            self thread [[ var_42078d2 ]](s_params);
        }
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x5 linked
// Checksum 0xc958e8d2, Offset: 0x32e8
// Size: 0x212
function private function_44298b05() {
    level.var_722fb772 = level.var_38b15968;
    var_d43195ce = array::randomize(getarraykeys(level.var_c1a3937d));
    var_e6f6bd65 = [];
    foreach (i, var_355f65e2 in getarraykeys(level.var_c1a3937d)) {
        var_bcdbf8f = var_d43195ce[i];
        var_b5393440 = level.var_c1a3937d[var_355f65e2];
        var_e6f6bd65[var_bcdbf8f] = var_b5393440;
        /#
            foreach (var_5c61255f in level.var_50cfb6c2) {
                foreach (var_1b5ee8a4 in var_5c61255f) {
                    if (var_1b5ee8a4.n_spawn == var_bcdbf8f) {
                        var_1b5ee8a4.str_archetype = var_b5393440;
                        var_1b5ee8a4.b_spawned = 0;
                    }
                }
            }
        #/
    }
    level.var_c1a3937d = var_e6f6bd65;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x5 linked
// Checksum 0xc47e628c, Offset: 0x3508
// Size: 0x26a
function private function_b72a438d() {
    n_points = function_f5600e93();
    if (isdefined(level.var_a5704584)) {
        foreach (var_b8e53971 in level.var_a5704584) {
            n_points = level [[ var_b8e53971 ]](n_points);
            /#
                assert(isdefined(n_points), "<unknown string>");
            #/
        }
    }
    if (n_points == 0) {
        return 0;
    }
    var_bc025f17 = array::random(level.var_b7a8520a);
    var_bc2bbe9e = array::randomize(array(0, 1, 2, 3));
    var_101fc930 = var_bc025f17.var_101fc930;
    var_fadd1539 = var_bc025f17.var_fadd1539;
    for (i = 0; i < var_101fc930.size; i++) {
        var_595aaf7 = [];
        for (j = 0; j < var_fadd1539[i]; j++) {
            if (!isdefined(var_595aaf7)) {
                var_595aaf7 = [];
            } else if (!isarray(var_595aaf7)) {
                var_595aaf7 = array(var_595aaf7);
            }
            var_595aaf7[var_595aaf7.size] = array::pop(var_bc2bbe9e, undefined, 0);
        }
        function_a845f70f(int(n_points * var_101fc930[i]), var_595aaf7);
    }
    return n_points;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x5 linked
// Checksum 0x6b0ff717, Offset: 0x3780
// Size: 0xa8
function private function_f5600e93() {
    if (level.round_number >= 20) {
        return (level.round_number * level.round_number * 2);
    }
    switch (level.round_number) {
    case 1:
        return 5;
    case 2:
        return 10;
    case 3:
        return 15;
    case 4:
        return 20;
    case 5:
    case 6:
    case 7:
        return 25;
    case 8:
    case 9:
        return 50;
    case 10:
    case 11:
        return 100;
    case 12:
    case 13:
    case 14:
        return (150 + 50 * (level.round_number - 12));
    default:
        return (300 + 100 * (level.round_number - 15));
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x5 linked
// Checksum 0x1c9f398d, Offset: 0x3930
// Size: 0x114
function private function_a845f70f(n_points, var_fadd1539) {
    for (i = 0; i < var_fadd1539.size; i++) {
        if (i == var_fadd1539.size - 1) {
            level.var_8cb2d124[var_fadd1539[i]] = n_points;
        } else {
            if (n_points < 5) {
                var_17e6541e = n_points;
            } else {
                var_17e6541e = randomintrangeinclusive(5, n_points - 5);
            }
            level.var_8cb2d124[var_fadd1539[i]] = var_17e6541e;
            n_points = n_points - var_17e6541e;
        }
        /#
            level.var_1113eecd[var_fadd1539[i]] = level.var_8cb2d124[var_fadd1539[i]];
        #/
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x5 linked
// Checksum 0x98111bc8, Offset: 0x3a50
// Size: 0xcc2
function private function_d7864087(var_dbce0c44) {
    var_c766fbe6 = [];
    foreach (var_75b393f9 in level.var_819e7dfd) {
        function_3cfb36aa(var_75b393f9, var_dbce0c44);
        var_75b393f9.var_28ba9034 = 0;
        var_c766fbe6[var_75b393f9.var_2ecba2c5] = 0;
    }
    var_29c2b5cc = array::sort_by_value(getarraykeys(level.var_33e85fa1));
    foreach (var_376db024 in var_29c2b5cc) {
        var_4ddf7815 = 0;
        while (var_376db024 <= var_dbce0c44 && !var_4ddf7815) {
            var_4ddf7815 = 1;
            foreach (var_75b393f9 in level.var_33e85fa1[var_376db024]) {
                if (var_c766fbe6[var_75b393f9.var_2ecba2c5] == var_75b393f9.var_123aa3d9) {
                    continue;
                }
                if (var_376db024 > var_dbce0c44) {
                    break;
                }
                var_c766fbe6[var_75b393f9.var_2ecba2c5]++;
                if (!isdefined(level.var_5d2cd3b1)) {
                    level.var_5d2cd3b1 = [];
                } else if (!isarray(level.var_5d2cd3b1)) {
                    level.var_5d2cd3b1 = array(level.var_5d2cd3b1);
                }
                if (!isinarray(level.var_5d2cd3b1, var_75b393f9.var_2ecba2c5)) {
                    level.var_5d2cd3b1[level.var_5d2cd3b1.size] = var_75b393f9.var_2ecba2c5;
                }
                var_dbce0c44 = var_dbce0c44 - var_376db024;
                var_4ddf7815 = 0;
            }
            function_6eba74f3();
        }
    }
    if (isdefined(level.var_ecbb7faa)) {
        foreach (var_7f07b7df in level.var_ecbb7faa) {
            var_c766fbe6 = level [[ var_7f07b7df ]](var_c766fbe6);
            /#
                assert(isdefined(var_c766fbe6), "<unknown string>");
            #/
        }
    }
    var_73f63202 = 0;
    foreach (var_75b393f9 in level.var_819e7dfd) {
        var_75b393f9.var_28ba9034 = var_c766fbe6[var_75b393f9.var_2ecba2c5];
        var_73f63202 = var_73f63202 + var_c766fbe6[var_75b393f9.var_2ecba2c5];
    }
    var_71cebc83 = 5 + level.var_412516cb;
    var_bceb5fe6 = level.zombie_total - var_71cebc83 - 10;
    if (var_bceb5fe6 < var_73f63202) {
        var_bceb5fe6 = var_73f63202;
        var_71cebc83 = 0;
    }
    var_d70d4601 = int(floor(var_bceb5fe6 / 4));
    var_a9facc6 = array(var_d70d4601, var_d70d4601, var_d70d4601, var_d70d4601);
    for (i = 0; i < var_bceb5fe6 % 4; i++) {
        var_a9facc6[i]++;
    }
    var_fe695913 = array([], [], [], []);
    foreach (var_376db024 in var_29c2b5cc) {
        foreach (var_75b393f9 in level.var_33e85fa1[var_376db024]) {
            if (var_75b393f9.var_28ba9034 == 0) {
                continue;
            }
            var_d2e7fe2e = 1;
            var_63839dc9 = 1;
            while (var_d2e7fe2e) {
                if (var_63839dc9) {
                    var_fadd1539 = array::randomize(getarraykeys(level.var_8cb2d124));
                    var_63839dc9 = 0;
                    foreach (var_4f8675aa in var_fadd1539) {
                        if (level.var_8cb2d124[var_4f8675aa] >= var_376db024 && var_fe695913[var_4f8675aa].size < var_a9facc6[var_4f8675aa]) {
                            if (!isdefined(var_fe695913[var_4f8675aa])) {
                                var_fe695913[var_4f8675aa] = [];
                            } else if (!isarray(var_fe695913[var_4f8675aa])) {
                                var_fe695913[var_4f8675aa] = array(var_fe695913[var_4f8675aa]);
                            }
                            var_fe695913[var_4f8675aa][var_fe695913[var_4f8675aa].size] = var_75b393f9.var_2ecba2c5;
                            level.var_8cb2d124[var_4f8675aa] = level.var_8cb2d124[var_4f8675aa] - var_376db024;
                            /#
                                level.var_d112f81e[var_4f8675aa] = level.var_d112f81e[var_4f8675aa] + var_376db024;
                            #/
                            var_75b393f9.var_28ba9034--;
                            var_63839dc9 = 1;
                        }
                        if (var_75b393f9.var_28ba9034 == 0) {
                            var_d2e7fe2e = 0;
                            break;
                        }
                    }
                    function_6eba74f3();
                    continue;
                }
                while (true) {
                    var_4f8675aa = function_24ccde2(var_fe695913, var_a9facc6);
                    if (!isdefined(var_4f8675aa)) {
                        var_d2e7fe2e = 0;
                        break;
                    }
                    if (!isdefined(var_fe695913[var_4f8675aa])) {
                        var_fe695913[var_4f8675aa] = [];
                    } else if (!isarray(var_fe695913[var_4f8675aa])) {
                        var_fe695913[var_4f8675aa] = array(var_fe695913[var_4f8675aa]);
                    }
                    var_fe695913[var_4f8675aa][var_fe695913[var_4f8675aa].size] = var_75b393f9.var_2ecba2c5;
                    level.var_8cb2d124[var_4f8675aa] = level.var_8cb2d124[var_4f8675aa] - var_376db024;
                    /#
                        level.var_d112f81e[var_4f8675aa] = level.var_d112f81e[var_4f8675aa] + var_376db024;
                    #/
                    var_75b393f9.var_28ba9034--;
                    function_6eba74f3();
                    if (var_75b393f9.var_28ba9034 == 0) {
                        var_d2e7fe2e = 0;
                        break;
                    }
                }
            }
            waitframe(1);
        }
    }
    foreach (n_index, var_26e567be in var_fe695913) {
        var_fe695913[n_index] = array::randomize(var_26e567be);
    }
    for (i = 0; i < 4; i++) {
        n_spawn = var_71cebc83 + var_a9facc6[i] * i;
        if (isdefined(var_fe695913[i]) && var_fe695913[i].size) {
            var_5dc6da8e = int(floor(var_a9facc6[i] / var_fe695913[i].size));
            foreach (str_archetype in var_fe695913[i]) {
                n_spawn = n_spawn + var_5dc6da8e;
                level.var_c1a3937d[n_spawn] = str_archetype;
                /#
                    var_e5aaf7f4 = {#b_spawned:0, #n_spawn:n_spawn, #str_archetype:str_archetype};
                    if (!isdefined(level.var_50cfb6c2[i])) {
                        level.var_50cfb6c2[i] = [];
                    } else if (!isarray(level.var_50cfb6c2[i])) {
                        level.var_50cfb6c2[i] = array(level.var_50cfb6c2[i]);
                    }
                    level.var_50cfb6c2[i][level.var_50cfb6c2[i].size] = var_e5aaf7f4;
                    if (!isdefined(level.var_f4e76c2[str_archetype])) {
                        level.var_f4e76c2[str_archetype] = 0;
                    }
                    level.var_f4e76c2[str_archetype]++;
                #/
                function_6eba74f3();
            }
        }
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x5 linked
// Checksum 0x5be948c0, Offset: 0x4720
// Size: 0x18e
function private function_3cfb36aa(var_75b393f9, var_dbce0c44) {
    /#
        level.var_1c1a2394[var_75b393f9.var_2ecba2c5] = 0;
    #/
    if (var_75b393f9.var_74f6178a) {
        var_148cc603 = [[ var_75b393f9.var_8e73a12b ]](var_dbce0c44);
        if (var_75b393f9.var_30bb6097.size) {
            /#
                level.var_1c1a2394[var_75b393f9.var_2ecba2c5] = 1;
            #/
            var_7ef5fc4b = undefined;
            foreach (var_5b4c8565 in var_75b393f9.var_30bb6097) {
                var_2fc1b4af = [[ var_5b4c8565 ]](var_148cc603);
                if (!isdefined(var_7ef5fc4b) || var_2fc1b4af < var_7ef5fc4b) {
                    var_7ef5fc4b = var_2fc1b4af;
                }
            }
            var_148cc603 = var_7ef5fc4b;
        }
        var_148cc603 = function_9eefccc1(var_148cc603, var_75b393f9.var_2ecba2c5);
        var_75b393f9.var_123aa3d9 = var_148cc603;
        return;
    }
    var_75b393f9.var_123aa3d9 = 0;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x5 linked
// Checksum 0x47ad3eb0, Offset: 0x48b8
// Size: 0xe6
function private function_24ccde2(var_fe695913, var_a9facc6) {
    var_2ae56f41 = undefined;
    var_c65bf701 = -1;
    for (i = 0; i < 4; i++) {
        if (var_fe695913[i].size < var_a9facc6[i]) {
            if (level.var_8cb2d124[i] > var_c65bf701) {
                var_2ae56f41 = i;
                var_c65bf701 = level.var_8cb2d124[i];
                continue;
            }
            if (level.var_8cb2d124[i] == var_c65bf701 && math::cointoss()) {
                var_2ae56f41 = i;
            }
        }
    }
    return var_2ae56f41;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x5 linked
// Checksum 0x92c7c6cb, Offset: 0x49a8
// Size: 0x334
function private function_9eefccc1(var_148cc603, str_archetype) {
    if (isinarray(array(#"blight_father", #"brutus", #"gegenees"), hash(str_archetype))) {
        var_148cc603 = var_148cc603 * (isdefined(level.var_928a4995) ? level.var_928a4995 : 1);
    } else if (isinarray(array(#"stoker", #"gladiator", #"gladiator_marauder", #"gladiator_destroyer", #"werewolf"), hash(str_archetype))) {
        var_148cc603 = var_148cc603 * (isdefined(level.var_cd345b49) ? level.var_cd345b49 : 1);
    } else if (isinarray(array(#"bat", #"dog", #"zombie_dog"), hash(str_archetype))) {
        var_148cc603 = var_148cc603 * (isdefined(level.var_9d9b2113) ? level.var_9d9b2113 : 1);
    } else if (isinarray(array(#"nosferatu", #"skeleton", #"nova_crawler", #"tiger", #"catalyst", #"catalyst_corrosive", #"catalyst_electric", #"catalyst_plasma", #"catalyst_water"), hash(str_archetype))) {
        var_148cc603 = var_148cc603 * (isdefined(level.var_71bc2e8f) ? level.var_71bc2e8f : 1);
    }
    if (math::cointoss()) {
        return floor(var_148cc603);
    }
    return ceil(var_148cc603);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 2, eflags: 0x5 linked
// Checksum 0xbb52ae1, Offset: 0x4ce8
// Size: 0x302
function private function_f2bdfd5a(str_archetype, var_376db024) {
    if (isinarray(array(#"blight_father", #"brutus", #"gegenees"), hash(str_archetype))) {
        var_376db024 = var_376db024 / (isdefined(level.var_928a4995) ? level.var_928a4995 : 1);
    } else if (isinarray(array(#"stoker", #"gladiator", #"gladiator_marauder", #"gladiator_destroyer", #"werewolf"), hash(str_archetype))) {
        var_376db024 = var_376db024 / (isdefined(level.var_cd345b49) ? level.var_cd345b49 : 1);
    } else if (isinarray(array(#"bat", #"dog", #"zombie_dog"), hash(str_archetype))) {
        var_376db024 = var_376db024 / (isdefined(level.var_9d9b2113) ? level.var_9d9b2113 : 1);
    } else if (isinarray(array(#"nosferatu", #"skeleton", #"nova_crawler", #"tiger", #"catalyst", #"catalyst_corrosive", #"catalyst_electric", #"catalyst_plasma", #"catalyst_water"), hash(str_archetype))) {
        var_376db024 = var_376db024 / (isdefined(level.var_71bc2e8f) ? level.var_71bc2e8f : 1);
    }
    return int(var_376db024);
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x5 linked
// Checksum 0x6123d8fb, Offset: 0x4ff8
// Size: 0x3e
function private function_6eba74f3() {
    level.var_65e3ac8a++;
    if (level.var_65e3ac8a > 20) {
        waitframe(1);
        level.var_65e3ac8a = 0;
    }
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 1, eflags: 0x5 linked
// Checksum 0x69eeb45, Offset: 0x5040
// Size: 0x14a
function private function_bc9fd0f8(n_round) {
    if (!isdefined(level.var_865ea9f)) {
        level.var_865ea9f = [];
    } else if (!isarray(level.var_865ea9f)) {
        level.var_865ea9f = array(level.var_865ea9f);
    }
    if (isinarray(level.var_865ea9f, n_round)) {
        /#
            assertmsg("<unknown string>" + n_round + "<unknown string>");
        #/
        return;
    }
    if (!isdefined(level.var_865ea9f)) {
        level.var_865ea9f = [];
    } else if (!isarray(level.var_865ea9f)) {
        level.var_865ea9f = array(level.var_865ea9f);
    }
    level.var_865ea9f[level.var_865ea9f.size] = n_round;
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x4
// Checksum 0x10438794, Offset: 0x5198
// Size: 0x448
function private devgui() {
    /#
        if (!isdefined(level.var_e654b7de)) {
            level.var_e654b7de = 0;
        }
        if (!isdefined(level.var_8640f511)) {
            level.var_8640f511 = [];
        }
        if (!isdefined(level.var_c8d852a1)) {
            level.var_c8d852a1 = [];
        }
        if (!isdefined(level.var_f5db924c)) {
            level.var_f5db924c = [];
        }
        if (!isdefined(level.var_a06c0ea0)) {
            level.var_a06c0ea0 = [];
        }
        if (!isdefined(level.var_f4e76c2)) {
            level.var_f4e76c2 = [];
        }
        if (!isdefined(level.var_1c1a2394)) {
            level.var_1c1a2394 = [];
        }
        if (!isdefined(level.var_1113eecd)) {
            level.var_1113eecd = array(0, 0, 0, 0);
        }
        if (!isdefined(level.var_d112f81e)) {
            level.var_d112f81e = array(0, 0, 0, 0);
        }
        if (!isdefined(level.var_50cfb6c2)) {
            level.var_50cfb6c2 = array([], [], [], []);
        }
        level.var_89976878 = 0;
        level.var_64675235 = 0;
        level.var_48babc04 = 0;
        level.var_465f07b = 0;
        level.var_25a6031 = 0;
        level.var_1bf0ebc1 = 0;
        level thread function_fc42d325();
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        while (true) {
            waitframe(1);
            str_command = getdvarstring(#"hash_5996494c7608f933", "<unknown string>");
            switch (str_command) {
            case #"summary":
                level.var_89976878 = !level.var_89976878;
                break;
            case #"intro_rounds":
                level.var_64675235 = !level.var_64675235;
                break;
            case #"special_rounds":
                level.var_48babc04 = !level.var_48babc04;
                break;
            case #"hash_4c928e124b9db907":
                level.var_1bf0ebc1 = !level.var_1bf0ebc1;
                break;
            case #"point_distribution":
                level.var_465f07b = !level.var_465f07b;
                break;
            case #"ai_composition":
                level.var_25a6031 = !level.var_25a6031;
                break;
            case #"all_off":
                level.var_89976878 = 0;
                level.var_64675235 = 0;
                level.var_48babc04 = 0;
                level.var_1bf0ebc1 = 0;
                level.var_465f07b = 0;
                level.var_25a6031 = 0;
                break;
            default:
                break;
            }
            setdvar(#"hash_5996494c7608f933", "<unknown string>");
        }
    #/
}

// Namespace zm_round_spawning/zm_round_spawning
// Params 0, eflags: 0x4
// Checksum 0x7794634e, Offset: 0x55e8
// Size: 0x1862
function private function_fc42d325() {
    /#
        while (true) {
            var_c708e6e1 = 120;
            if (level.var_89976878) {
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1.5, 2);
                var_c708e6e1 = var_c708e6e1 + 33;
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                var_c708e6e1 = var_c708e6e1 + 22;
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>" + level.var_38b15968 + "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                var_c708e6e1 = var_c708e6e1 + 22;
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>" + level.var_e654b7de + "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                var_c708e6e1 = var_c708e6e1 + 22;
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                var_c708e6e1 = var_c708e6e1 + 22;
                foreach (str_archetype in level.var_5d2cd3b1) {
                    str_text = "<unknown string>" + function_9e72a96(str_archetype);
                    if (isdefined(level.var_f4e76c2[str_archetype])) {
                        str_text = str_text + "<unknown string>" + level.var_f4e76c2[str_archetype];
                    }
                    str_text = str_text + "<unknown string>";
                    debug2dtext((510, var_c708e6e1, 0), str_text, (0, 1, 1), 1, (0, 0, 0), 0.8, 0.85, 2);
                    var_c708e6e1 = var_c708e6e1 + 18.7;
                }
                var_c708e6e1 = var_c708e6e1 + 33;
            }
            if (level.var_64675235) {
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1.5, 2);
                var_c708e6e1 = var_c708e6e1 + 33;
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                foreach (var_27100bc7 in level.var_c8d852a1) {
                    str_archetype = level.var_8640f511[var_27100bc7];
                    var_c708e6e1 = var_c708e6e1 + 22;
                    if (level.var_819e7dfd[str_archetype].var_74f6178a) {
                        str_color = (0, 1, 1);
                    } else {
                        str_color = (1, 0, 0);
                    }
                    str_text = "<unknown string>" + var_27100bc7 + "<unknown string>" + function_9e72a96(str_archetype) + "<unknown string>";
                    debug2dtext((510, var_c708e6e1, 0), str_text, str_color, 1, (0, 0, 0), 0.8, 1, 2);
                }
                var_c708e6e1 = var_c708e6e1 + 33;
            }
            if (level.var_48babc04) {
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1.5, 2);
                var_c708e6e1 = var_c708e6e1 + 33;
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                var_c708e6e1 = var_c708e6e1 + 22;
                if (level flag::get(#"disable_special_rounds")) {
                    debug2dtext((510, var_c708e6e1, 0), "<unknown string>", (1, 0, 0), 1, (0, 0, 0), 0.8, 1, 2);
                    var_c708e6e1 = var_c708e6e1 + 22;
                }
                foreach (n_special_round in level.var_a06c0ea0) {
                    var_a630f8a4 = level.var_f5db924c[n_special_round];
                    str_text = "<unknown string>" + n_special_round + "<unknown string>";
                    if (level flag::get(#"disable_special_rounds") || isdefined(var_a630f8a4.b_skipped) && var_a630f8a4.b_skipped) {
                        str_color = (1, 0, 0);
                    } else if (level.round_number > n_special_round) {
                        str_color = (0, 1, 1);
                    } else if (level.round_number == n_special_round) {
                        str_color = (1, 0.5, 0);
                        var_d74e1056 = "<unknown string>" + (isdefined(level.var_e2aef122) ? level.var_e2aef122 : "<unknown string>") + "<unknown string>";
                        var_62e3e77a = "<unknown string>" + level.zombie_total + "<unknown string>";
                        var_54997ac0 = "<unknown string>" + zombie_utility::get_current_zombie_count() + "<unknown string>";
                    } else {
                        str_color = (1, 0, 0);
                    }
                    if (isdefined(var_a630f8a4.var_a51dd114)) {
                        str_text = str_text + "<unknown string>";
                    } else {
                        foreach (str_archetype in var_a630f8a4.var_d7d3cd31) {
                            str_text = str_text + function_9e72a96(str_archetype) + "<unknown string>";
                        }
                    }
                    if (isdefined(var_a630f8a4.b_skipped) && var_a630f8a4.b_skipped) {
                        str_text = str_text + "<unknown string>";
                    }
                    debug2dtext((510, var_c708e6e1, 0), str_text, str_color, 1, (0, 0, 0), 0.8, 1, 2);
                    var_c708e6e1 = var_c708e6e1 + 22;
                    if (level.round_number == n_special_round && !level flag::get(#"disable_special_rounds")) {
                        debug2dtext((510, var_c708e6e1, 0), var_d74e1056, str_color, 1, (0, 0, 0), 0.8, 0.85, 2);
                        var_c708e6e1 = var_c708e6e1 + 18.7;
                        debug2dtext((510, var_c708e6e1, 0), var_62e3e77a, str_color, 1, (0, 0, 0), 0.8, 0.85, 2);
                        var_c708e6e1 = var_c708e6e1 + 18.7;
                        debug2dtext((510, var_c708e6e1, 0), var_54997ac0, str_color, 1, (0, 0, 0), 0.8, 0.85, 2);
                        var_c708e6e1 = var_c708e6e1 + 18.7;
                    }
                }
                var_c708e6e1 = var_c708e6e1 + 33;
            }
            if (level.var_1bf0ebc1) {
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1.5, 2);
                var_c708e6e1 = var_c708e6e1 + 33;
                debug2dtext((510, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                foreach (var_ec9d31d7 in level.var_33e85fa1) {
                    foreach (var_1bda1c94 in var_ec9d31d7) {
                        var_c708e6e1 = var_c708e6e1 + 22;
                        str_archetype = function_9e72a96(var_1bda1c94.var_2ecba2c5);
                        str_text = str_archetype + "<unknown string>" + var_1bda1c94.var_123aa3d9 + "<unknown string>";
                        if (var_1bda1c94.var_74f6178a) {
                            if (level.var_8640f511[level.round_number] === str_archetype && level.var_810c1c3) {
                                str_color = (1, 0, 1);
                                str_text = str_archetype + "<unknown string>";
                            } else if (isdefined(level.var_1c1a2394[str_archetype]) && level.var_1c1a2394[str_archetype]) {
                                str_color = (1, 0.5, 0);
                                str_text = str_text + "<unknown string>";
                            } else {
                                str_color = (0, 1, 1);
                            }
                        } else {
                            str_color = (1, 0, 0);
                            str_text = str_text + "<unknown string>";
                        }
                        debug2dtext((510, var_c708e6e1, 0), str_text, str_color, 1, (0, 0, 0), 0.8, 1, 2);
                    }
                }
                var_c708e6e1 = var_c708e6e1 + 33;
            }
            var_c708e6e1 = 120;
            if (level.var_465f07b) {
                debug2dtext((1020, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1.5, 2);
                var_c708e6e1 = var_c708e6e1 + 33;
                debug2dtext((1020, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                var_c708e6e1 = var_c708e6e1 + 22;
                if (level.var_810c1c3) {
                    str_text = "<unknown string>";
                    debug2dtext((1020, var_c708e6e1, 0), str_text, (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                } else if (isdefined(level.var_722fb772)) {
                    str_text = "<unknown string>" + level.var_e654b7de + "<unknown string>";
                    debug2dtext((1020, var_c708e6e1, 0), str_text, (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                } else {
                    var_a17bf02f = 0;
                    foreach (n_spent_points in level.var_d112f81e) {
                        var_a17bf02f = var_a17bf02f + n_spent_points;
                    }
                    str_text = "<unknown string>" + level.var_e654b7de + "<unknown string>" + var_a17bf02f + "<unknown string>";
                    debug2dtext((1020, var_c708e6e1, 0), str_text, (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                    for (i = 0; i < 4; i++) {
                        var_c708e6e1 = var_c708e6e1 + 22;
                        str_text = "<unknown string>" + i + 1 + "<unknown string>" + level.var_1113eecd[i] + "<unknown string>" + level.var_d112f81e[i] + "<unknown string>";
                        debug2dtext((1020, var_c708e6e1, 0), str_text, (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                    }
                }
                var_c708e6e1 = var_c708e6e1 + 33;
            }
            if (level.var_25a6031) {
                debug2dtext((1020, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1.5, 2);
                var_c708e6e1 = var_c708e6e1 + 33;
                debug2dtext((1020, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                if (level.var_810c1c3) {
                    var_c708e6e1 = var_c708e6e1 + 22;
                    str_text = "<unknown string>";
                    debug2dtext((1020, var_c708e6e1, 0), str_text, (1, 0, 0), 1, (0, 0, 0), 0.8, 1, 2);
                } else if (level.var_4d6c53ca) {
                    var_c708e6e1 = var_c708e6e1 + 22;
                    str_text = "<unknown string>";
                    debug2dtext((1020, var_c708e6e1, 0), str_text, (1, 0, 0), 1, (0, 0, 0), 0.8, 1, 2);
                } else if (isdefined(level.var_722fb772)) {
                    var_c708e6e1 = var_c708e6e1 + 22;
                    str_text = "<unknown string>";
                    debug2dtext((1020, var_c708e6e1, 0), str_text, (1, 0, 0), 1, (0, 0, 0), 0.8, 1, 2);
                }
                var_c708e6e1 = var_c708e6e1 + 22;
                debug2dtext((1020, var_c708e6e1, 0), "<unknown string>" + level.var_38b15968 + "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                var_c708e6e1 = var_c708e6e1 + 22;
                var_73f63202 = 0;
                foreach (var_4f529b46 in level.var_f4e76c2) {
                    var_73f63202 = var_73f63202 + var_4f529b46;
                }
                debug2dtext((1020, var_c708e6e1, 0), "<unknown string>" + var_73f63202 + "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                var_c708e6e1 = var_c708e6e1 + 22;
                foreach (str_archetype in level.var_5d2cd3b1) {
                    if (isdefined(level.var_f4e76c2[str_archetype])) {
                        str_text = "<unknown string>" + function_9e72a96(str_archetype) + "<unknown string>" + level.var_f4e76c2[str_archetype];
                        debug2dtext((1020, var_c708e6e1, 0), str_text, (0, 1, 1), 1, (0, 0, 0), 0.8, 0.85, 2);
                        var_c708e6e1 = var_c708e6e1 + 18.7;
                    }
                }
                if (level.var_810c1c3) {
                    debug2dtext((1020, var_c708e6e1, 0), "<unknown string>", (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                    var_c708e6e1 = var_c708e6e1 + 22;
                    var_e5aaf7f4 = level.var_50cfb6c2[0][0];
                    if (isdefined(var_e5aaf7f4)) {
                        if (var_e5aaf7f4.b_spawned) {
                            str_color = (0, 1, 1);
                        } else {
                            str_color = (1, 0, 0);
                        }
                        str_text = "<unknown string>" + var_e5aaf7f4.n_spawn + "<unknown string>" + function_9e72a96(var_e5aaf7f4.str_archetype) + "<unknown string>";
                        debug2dtext((1020, var_c708e6e1, 0), str_text, str_color, 1, (0, 0, 0), 0.8, 0.85, 2);
                        var_c708e6e1 = var_c708e6e1 + 18.7;
                    }
                } else {
                    for (i = 0; i < 4; i++) {
                        str_text = "<unknown string>" + i + 1 + "<unknown string>" + level.var_50cfb6c2[i].size + "<unknown string>";
                        debug2dtext((1020, var_c708e6e1, 0), str_text, (0, 1, 0), 1, (0, 0, 0), 0.8, 1, 2);
                        var_c708e6e1 = var_c708e6e1 + 22;
                        if (level.var_50cfb6c2[i].size < 10) {
                            foreach (var_e5aaf7f4 in level.var_50cfb6c2[i]) {
                                if (var_e5aaf7f4.b_spawned) {
                                    str_color = (0, 1, 1);
                                } else {
                                    str_color = (1, 0, 0);
                                }
                                str_text = "<unknown string>" + var_e5aaf7f4.n_spawn + "<unknown string>" + function_9e72a96(var_e5aaf7f4.str_archetype) + "<unknown string>";
                                debug2dtext((1020, var_c708e6e1, 0), str_text, str_color, 1, (0, 0, 0), 0.8, 0.85, 2);
                                var_c708e6e1 = var_c708e6e1 + 18.7;
                            }
                            continue;
                        }
                        str_text = "<unknown string>";
                        debug2dtext((1020, var_c708e6e1, 0), str_text, (0, 1, 1), 1, (0, 0, 0), 0.8, 0.85, 2);
                        var_c708e6e1 = var_c708e6e1 + 18.7;
                    }
                }
                var_c708e6e1 = var_c708e6e1 + 18.7;
            }
            waitframe(2);
        }
    #/
}

