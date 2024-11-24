#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\values_shared;

#namespace zm_transform;

// Namespace zm_transform/zm_transformation
// Params 0, eflags: 0x2
// Checksum 0xeafbf076, Offset: 0x148
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_transform", &__init__, undefined, undefined);
}

// Namespace zm_transform/zm_transformation
// Params 0, eflags: 0x1 linked
// Checksum 0x5f2f0b38, Offset: 0x190
// Size: 0xe4
function __init__() {
    level.var_b175714d = [];
    level thread update();
    clientfield::register("actor", "transformation_spawn", 1, 1, "int");
    clientfield::register("actor", "transformation_stream_split", 1, 1, "int");
    level flag::init(#"hash_670ec83e1acfadff");
    level.var_50f7dbd5 = [];
    level.var_ebccd551 = [];
    /#
        level thread devgui();
    #/
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x0
// Checksum 0x79419667, Offset: 0x280
// Size: 0x108
function function_4da8230b(var_736940b3) {
    assert(ishash(var_736940b3), "<dev string:x38>");
    if (!isdefined(level.var_50f7dbd5)) {
        level.var_50f7dbd5 = [];
    } else if (!isarray(level.var_50f7dbd5)) {
        level.var_50f7dbd5 = array(level.var_50f7dbd5);
    }
    level.var_50f7dbd5[level.var_50f7dbd5.size] = var_736940b3;
    if (level.var_50f7dbd5.size == 1) {
        level flag::set(#"hash_670ec83e1acfadff");
        level notify(#"hash_239ebc19aab5a60b");
    }
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x0
// Checksum 0xd86b88c2, Offset: 0x390
// Size: 0x124
function function_6b183c78(var_736940b3) {
    assert(ishash(var_736940b3), "<dev string:x72>");
    foreach (index, name_hash in level.var_50f7dbd5) {
        if (name_hash == var_736940b3) {
            var_689205d = index;
            break;
        }
    }
    if (!isdefined(var_689205d)) {
        return;
    }
    arrayremoveindex(level.var_50f7dbd5, var_689205d);
    if (level.var_50f7dbd5.size == 0) {
        level flag::clear(#"hash_670ec83e1acfadff");
    }
}

// Namespace zm_transform/zm_transformation
// Params 0, eflags: 0x0
// Checksum 0xbcc1c046, Offset: 0x4c0
// Size: 0x22
function function_770908a2() {
    return level flag::get(#"hash_670ec83e1acfadff");
}

// Namespace zm_transform/zm_transformation
// Params 9, eflags: 0x1 linked
// Checksum 0xe4eacb44, Offset: 0x4f0
// Size: 0x4a6
function function_cfca77a7(var_42de336c, id, condition_func, cooldown_time, intro_func, outro_func, var_44c5827d, var_99fca475, var_accb1c92) {
    assert(!isdefined(level.var_b175714d[id]));
    /#
        if (!isdefined(var_42de336c)) {
            println("<dev string:xad>" + id + "<dev string:xca>");
            return;
        }
        if (isdefined(var_99fca475) && isentity(var_42de336c)) {
            spawner = var_42de336c;
            if (!isdefined(spawner.targetname) || spawner.targetname == "<dev string:x103>") {
                println("<dev string:xad>" + id + "<dev string:x106>" + var_99fca475 + "<dev string:x125>");
                return;
            }
            var_de6be79a = 0;
            scenedef = scene::get_scenedef(var_99fca475);
            foreach (object in scenedef.objects) {
                if (object.type === "<dev string:x13a>" && object.name === spawner.targetname) {
                    var_de6be79a = 1;
                    break;
                }
            }
            if (!var_de6be79a) {
                println("<dev string:xad>" + id + "<dev string:x142>" + spawner.targetname);
                return;
            }
        }
        if (isdefined(var_44c5827d) && !isdefined(var_99fca475)) {
            println("<dev string:xad>" + id + "<dev string:x187>");
            return;
        }
        if (!isdefined(var_44c5827d) && isdefined(var_99fca475)) {
            println("<dev string:xad>" + id + "<dev string:x1d4>");
            return;
        }
        if (!isentity(var_42de336c) && !isassetloaded("<dev string:x221>", var_42de336c)) {
            println("<dev string:xad>" + id + "<dev string:x22a>" + (ishash(var_42de336c) ? function_9e72a96(var_42de336c) : var_42de336c) + "<dev string:x245>");
            return;
        }
    #/
    level.var_b175714d[id] = {#condition:condition_func, #intro_func:intro_func, #outro_func:outro_func, #var_accb1c92:var_accb1c92, #var_44c5827d:var_44c5827d, #var_99fca475:var_99fca475, #cooldown_time:cooldown_time, #var_ebaa8de9:0, #var_33e393a7:0, #var_2939a01a:[]};
    if (isentity(var_42de336c)) {
        level.var_b175714d[id].spawner = var_42de336c;
        return;
    }
    level.var_b175714d[id].aitype = var_42de336c;
    if (!isdefined(level.var_170852dc)) {
        level.var_170852dc = [];
    }
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x1 linked
// Checksum 0xe7940957, Offset: 0x9a0
// Size: 0x106
function function_abf1dcb4(id) {
    if (level.var_ebccd551.size >= 10) {
        return true;
    }
    if (isdefined(level.var_88de5053) && level.var_ebccd551.size >= level.var_88de5053) {
        return true;
    }
    if (isdefined(level.var_b175714d[id]) && isdefined(level.var_b175714d[id].spawner)) {
        return isdefined(level.var_b175714d[id].spawner.var_ab46c56);
    } else if (isdefined(level.var_b175714d[id]) && isdefined(level.var_b175714d[id].aitype)) {
        return isdefined(level.var_170852dc[level.var_b175714d[id].aitype]);
    }
    return false;
}

// Namespace zm_transform/zm_transformation
// Params 4, eflags: 0x1 linked
// Checksum 0x7eb48892, Offset: 0xab0
// Size: 0x184
function function_9acf76e6(entity, id, var_c2a69066, var_2cf708f4 = 1) {
    if (!isdefined(level.var_b175714d[id])) {
        /#
            iprintlnbold("<dev string:x25c>" + id + "<dev string:x285>");
        #/
        return;
    }
    if (!isdefined(entity) || isdefined(entity.var_69a981e6) && entity.var_69a981e6) {
        /#
            iprintlnbold("<dev string:x29b>" + id + "<dev string:x2bc>");
        #/
        return;
    }
    if (function_abf1dcb4(id)) {
        /#
            iprintlnbold("<dev string:x29b>" + id + "<dev string:x2e3>");
        #/
        return;
    }
    if (function_331869(entity)) {
        function_1afce5aa(entity);
    }
    var_167b5341 = level.var_b175714d[id];
    entity thread transform(id, var_c2a69066, var_2cf708f4);
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x1 linked
// Checksum 0x5efe24b3, Offset: 0xc40
// Size: 0x68
function function_bdd8aba6(id) {
    if (!isdefined(level.var_b175714d[id])) {
        /#
            iprintlnbold("<dev string:x319>" + id + "<dev string:x285>");
        #/
        return;
    }
    level.var_b175714d[id].var_33e393a7++;
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x0
// Checksum 0x31561c3, Offset: 0xcb0
// Size: 0x58
function function_3f502557(id) {
    assert(level.var_b175714d[id].var_33e393a7 > 0);
    level.var_b175714d[id].var_33e393a7--;
}

// Namespace zm_transform/zm_transformation
// Params 2, eflags: 0x1 linked
// Checksum 0xb3ef1727, Offset: 0xd10
// Size: 0x1ac
function function_d2374144(entity, id) {
    assert(!(isdefined(entity.var_69a981e6) && entity.var_69a981e6));
    assert(!isinarray(level.var_b175714d[id].var_2939a01a, entity));
    assert(!(isdefined(entity.var_d41ca76d) && entity.var_d41ca76d));
    entity.var_d41ca76d = id;
    if (!isdefined(level.var_b175714d[id].var_2939a01a)) {
        level.var_b175714d[id].var_2939a01a = [];
    } else if (!isarray(level.var_b175714d[id].var_2939a01a)) {
        level.var_b175714d[id].var_2939a01a = array(level.var_b175714d[id].var_2939a01a);
    }
    level.var_b175714d[id].var_2939a01a[level.var_b175714d[id].var_2939a01a.size] = entity;
    entity thread function_525526be(id);
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x1 linked
// Checksum 0x93176be8, Offset: 0xec8
// Size: 0x88
function function_1afce5aa(entity) {
    assert(isdefined(entity.var_d41ca76d));
    assert(isinarray(level.var_b175714d[entity.var_d41ca76d].var_2939a01a, entity));
    entity notify(#"hash_610e5a8c0ec1a4b6");
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x1 linked
// Checksum 0x23cb3e14, Offset: 0xf58
// Size: 0x18
function function_331869(entity) {
    return isdefined(entity.var_d41ca76d);
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x1 linked
// Checksum 0x6b9fe301, Offset: 0xf78
// Size: 0x108
function function_e95ec8df(clear_active = 0) {
    foreach (transformation in level.var_b175714d) {
        transformation.var_33e393a7 = 0;
        foreach (var_d41ca76d in transformation.var_2939a01a) {
            var_d41ca76d notify(#"hash_610e5a8c0ec1a4b6");
        }
    }
}

// Namespace zm_transform/zm_transformation
// Params 0, eflags: 0x1 linked
// Checksum 0x6122e64b, Offset: 0x1088
// Size: 0x1d4
function function_fb608075() {
    if (!isdefined(level.var_ebccd551) || level.var_ebccd551.size == 0) {
        return;
    }
    var_4ff6ca41 = [];
    foreach (transformation in level.var_ebccd551) {
        if (isinarray(var_4ff6ca41, transformation.id)) {
            continue;
        }
        var_167b5341 = level.var_b175714d[transformation.id];
        if (isdefined(transformation.var_ad4fb608) && transformation.var_ad4fb608) {
            level scene::function_f81475ae(var_167b5341.var_99fca475);
            transformation.var_ad4fb608 = 0;
        }
        level scene::stop(var_167b5341.var_44c5827d, 1);
        level scene::stop(var_167b5341.var_99fca475, 1);
        if (!isdefined(var_4ff6ca41)) {
            var_4ff6ca41 = [];
        } else if (!isarray(var_4ff6ca41)) {
            var_4ff6ca41 = array(var_4ff6ca41);
        }
        var_4ff6ca41[var_4ff6ca41.size] = transformation.id;
    }
}

// Namespace zm_transform/zm_transformation
// Params 2, eflags: 0x1 linked
// Checksum 0x3ed91b56, Offset: 0x1268
// Size: 0x98
function function_5db4f2f5(entity, var_8763d10e) {
    if (!isdefined(entity) || isdefined(entity.var_69a981e6) && entity.var_69a981e6) {
        return false;
    }
    entity.var_982f937 = 1;
    if (isdefined(var_8763d10e) && var_8763d10e && function_331869(entity)) {
        function_1afce5aa(entity);
    }
    return true;
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x0
// Checksum 0x96200af8, Offset: 0x1308
// Size: 0x16
function function_1a1cb53(entity) {
    entity.var_982f937 = undefined;
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x1 linked
// Checksum 0x9ef3d6f6, Offset: 0x1328
// Size: 0x1c
function function_a261938f(entity) {
    return entity.var_982f937 !== 1;
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x5 linked
// Checksum 0xbd4ac679, Offset: 0x1350
// Size: 0xb6
function private function_525526be(id) {
    waitresult = self waittill(#"death", #"transformation_started", #"hash_610e5a8c0ec1a4b6");
    if (waitresult._notify != "death") {
        self.var_d41ca76d = undefined;
    }
    arrayremovevalue(level.var_b175714d[id].var_2939a01a, self);
    /#
        self notify(#"hash_6e3d9f8c484e3d01");
    #/
}

// Namespace zm_transform/zm_transformation
// Params 2, eflags: 0x5 linked
// Checksum 0x83cb06f0, Offset: 0x1410
// Size: 0x6e
function private function_4e679db4(id, def) {
    if (isdefined(def.spawner)) {
        def.spawner.var_ab46c56 = id;
        return;
    }
    if (isdefined(def.aitype)) {
        level.var_170852dc[def.aitype] = id;
    }
}

// Namespace zm_transform/zm_transformation
// Params 2, eflags: 0x5 linked
// Checksum 0x902f46a3, Offset: 0x1488
// Size: 0xd4
function private function_c81eb299(id, def) {
    if (isdefined(def.spawner)) {
        assert(def.spawner.var_ab46c56 == id, "<dev string:x342>");
        def.spawner.var_ab46c56 = undefined;
        return;
    }
    if (isdefined(def.aitype)) {
        assert(level.var_170852dc[def.aitype] == id, "<dev string:x342>");
        level.var_170852dc[def.aitype] = undefined;
    }
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x5 linked
// Checksum 0x51dd923d, Offset: 0x1568
// Size: 0x74
function private function_1050ba72(def) {
    if (isdefined(def.spawner)) {
        return def.spawner spawnfromspawner(0, 1);
    }
    if (isdefined(def.aitype)) {
        return spawnactor(def.aitype, (0, 0, 0), (0, 0, 0), undefined, 1);
    }
}

// Namespace zm_transform/zm_transformation
// Params 3, eflags: 0x5 linked
// Checksum 0xf1c2e78b, Offset: 0x15e8
// Size: 0xc16
function private transform(id, var_c2a69066, var_2cf708f4 = 1) {
    level endon(#"end_game");
    if (function_abf1dcb4(id)) {
        return;
    }
    var_167b5341 = level.var_b175714d[id];
    function_4e679db4(id, var_167b5341);
    var_e236d061 = {#id:id, #var_1a90140:self};
    if (!isdefined(level.var_ebccd551)) {
        level.var_ebccd551 = [];
    } else if (!isarray(level.var_ebccd551)) {
        level.var_ebccd551 = array(level.var_ebccd551);
    }
    level.var_ebccd551[level.var_ebccd551.size] = var_e236d061;
    aitype = isdefined(var_167b5341.spawner) ? var_167b5341.spawner.aitype : var_167b5341.aitype;
    if (isdefined(aitype)) {
        var_e236d061.archetype = getarchetypefromclassname(aitype);
    }
    self.var_69a981e6 = 1;
    self.var_e236d061 = var_e236d061;
    var_e3920264 = self.var_e3920264;
    n_health_percent = min(self.health / self.maxhealth, 1);
    self notify(#"transformation_started");
    if (isdefined(var_167b5341.intro_func)) {
        self [[ var_167b5341.intro_func ]]();
    }
    if (!isdefined(self) || !isalive(self)) {
        arrayremovevalue(level.var_ebccd551, var_e236d061);
        function_c81eb299(id, var_167b5341);
        level notify(#"transformation_interrupted", {#id:id});
        return;
    }
    if (!isdefined(var_167b5341.var_44c5827d)) {
        new_ai = function_1050ba72(var_167b5341);
        if (!isdefined(new_ai) || !isalive(new_ai)) {
            function_c81eb299(id, var_167b5341);
            arrayremovevalue(level.var_ebccd551, var_e236d061);
            level notify(#"transformation_interrupted", {#id:id});
            return;
        }
        var_e236d061.new_ai = new_ai;
        new_ai.health = int(max(new_ai.health * n_health_percent, 1));
        new_ai.var_e236d061 = var_e236d061;
        new_ai._starting_round_number = self._starting_round_number;
        function_c81eb299(id, var_167b5341);
        if (isdefined(var_167b5341.outro_func)) {
            new_ai [[ var_167b5341.outro_func ]](n_health_percent);
        }
        new_ai forceteleport(self.origin, self.angles);
        self zombie_utility::gib_random_parts();
        gibserverutils::annihilate(self);
        self val::set(#"zm_transformation", "hide", 2);
        if (var_2cf708f4) {
            self kill();
        }
        if (isdefined(var_c2a69066)) {
            thread [[ var_c2a69066 ]](new_ai);
        }
    } else {
        script_origin = {#origin:self.origin, #angles:self.angles};
        self val::set(#"zm_transformation", "ignoreall");
        a_ents = undefined;
        a_ents = array(self);
        self.animname = "spawner_zm_zombie";
        if (!isdefined(var_167b5341.var_accb1c92)) {
            self clientfield::set("transformation_stream_split", 1);
        }
        var_e236d061.var_ad4fb608 = 1;
        level scene::function_27f5972e(var_167b5341.var_99fca475);
        script_origin scene::play(var_167b5341.var_44c5827d, a_ents);
        if (!isdefined(self) || !isalive(self)) {
            if (isdefined(self)) {
                self clientfield::set("transformation_stream_split", 0);
            }
            var_e236d061.var_ad4fb608 = 0;
            level scene::function_f81475ae(var_167b5341.var_99fca475);
            arrayremovevalue(level.var_ebccd551, var_e236d061);
            function_c81eb299(id, var_167b5341);
            level notify(#"transformation_interrupted", {#id:id});
            return;
        }
        if (isdefined(var_167b5341.var_accb1c92)) {
            [[ var_167b5341.var_accb1c92 ]](self, var_167b5341);
        } else {
            settingsbundle = self ai::function_9139c839();
            if (isdefined(settingsbundle) && isdefined(settingsbundle.var_d354164e)) {
                foreach (var_127d3a7a in settingsbundle.var_d354164e) {
                    if (self.model === var_127d3a7a.var_a3c9023c) {
                        self.no_gib = 1;
                        self setmodel(var_127d3a7a.var_cdf1f53d);
                        break;
                    }
                }
            }
        }
        self clientfield::set("transformation_stream_split", 0);
        var_e236d061.var_ad4fb608 = 0;
        level scene::function_f81475ae(var_167b5341.var_99fca475);
        self zombie_utility::zombie_eye_glow_stop();
        new_ai = function_1050ba72(var_167b5341);
        if (!isalive(new_ai)) {
            arrayremovevalue(level.var_ebccd551, var_e236d061);
            function_c81eb299(id, var_167b5341);
            level notify(#"transformation_interrupted", {#id:id});
            return;
        }
        var_e236d061.new_ai = new_ai;
        new_ai function_bbaec2fd();
        new_ai.var_e236d061 = var_e236d061;
        new_ai._starting_round_number = self._starting_round_number;
        function_c81eb299(id, var_167b5341);
        if (isdefined(var_167b5341.outro_func)) {
            new_ai [[ var_167b5341.outro_func ]](n_health_percent);
        }
        if (!isdefined(new_ai) || !isalive(new_ai)) {
            arrayremovevalue(level.var_ebccd551, var_e236d061);
            level notify(#"transformation_interrupted", {#id:id});
            return;
        }
        a_ents = array(new_ai, self);
        self callback::function_d8abfc3d(#"on_ai_killed", &function_a51fe6f9, undefined, array(new_ai));
        script_origin scene::play(var_167b5341.var_99fca475, a_ents);
        if (isdefined(self)) {
            self callback::function_52ac9652(#"on_ai_killed", &function_a51fe6f9);
        }
        if (!isdefined(new_ai) || !isalive(new_ai)) {
            if (isdefined(self) && isalive(self) && self.allowdeath) {
                self kill();
            }
            arrayremovevalue(level.var_ebccd551, var_e236d061);
            level notify(#"transformation_interrupted", {#id:id});
            return;
        }
    }
    new_ai.var_e236d061 = undefined;
    arrayremovevalue(level.var_ebccd551, var_e236d061);
    level notify(#"transformation_complete", {#new_ai:array(new_ai), #id:id, #data:var_e3920264});
    if (isdefined(var_c2a69066)) {
        thread [[ var_c2a69066 ]](new_ai);
    }
}

// Namespace zm_transform/zm_transformation
// Params 2, eflags: 0x5 linked
// Checksum 0x7ffcae8a, Offset: 0x2208
// Size: 0xbc
function private function_a51fe6f9(params, new_ai) {
    if (isdefined(new_ai) && isalive(new_ai) && new_ai.allowdeath && isdefined(params.eattacker) && isplayer(params.eattacker)) {
        new_ai kill(undefined, params.eattacker, params.einflictor, params.weapon, 0, 1);
    }
}

// Namespace zm_transform/zm_transformation
// Params 0, eflags: 0x5 linked
// Checksum 0x51b38eb9, Offset: 0x22d0
// Size: 0x96
function private function_c3a1379e() {
    return !(isdefined(level.var_c9f5947d) && level.var_c9f5947d) && zombie_utility::get_current_zombie_count() + level.zombie_total <= 10 && !(isdefined(level.var_78acec0a) && level.var_78acec0a) && !level flag::get(#"infinite_round_spawning");
}

// Namespace zm_transform/zm_transformation
// Params 2, eflags: 0x5 linked
// Checksum 0x9c1202bd, Offset: 0x2370
// Size: 0x2b0
function private function_fad54d94(id, var_167b5341) {
    level endon(#"hash_670ec83e1acfadff", #"game_ended");
    if (var_167b5341.var_2939a01a.size > 0) {
        foreach (zombie in var_167b5341.var_2939a01a) {
            if (function_a261938f(zombie) && isdefined(var_167b5341.condition) && zombie [[ var_167b5341.condition ]]()) {
                zombie thread transform(id);
                return true;
            }
        }
    }
    if (var_167b5341.var_33e393a7 > 0) {
        zombies = zombie_utility::get_round_enemy_array();
        foreach (zombie in zombies) {
            if (!isdefined(zombie) || !isalive(zombie) || function_331869(zombie)) {
                continue;
            }
            if (function_a261938f(zombie) && isdefined(var_167b5341.condition) && zombie [[ var_167b5341.condition ]]()) {
                zombie thread transform(id);
                var_167b5341.var_33e393a7--;
                level.var_138b37c4++;
                if (level.var_138b37c4 >= 6) {
                    waitframe(1);
                    level.var_138b37c4 = 0;
                }
                return true;
            }
            level.var_138b37c4++;
            if (level.var_138b37c4 >= 6) {
                waitframe(1);
                level.var_138b37c4 = 0;
            }
        }
    }
    return false;
}

// Namespace zm_transform/zm_transformation
// Params 0, eflags: 0x5 linked
// Checksum 0x90e3d868, Offset: 0x2628
// Size: 0x32e
function private update() {
    level endoncallback(&function_4c0d0d28, #"end_game");
    var_52f926ed = 0;
    level.var_138b37c4 = 0;
    var_f38e5f93 = isdefined(level.var_f38e5f93) ? level.var_f38e5f93 : 1;
    while (true) {
        if (isdefined(var_52f926ed) && var_52f926ed) {
            wait var_f38e5f93;
        } else {
            wait 0.2;
        }
        level flag::wait_till_clear(#"hash_670ec83e1acfadff");
        if (function_c3a1379e()) {
            level notify(#"hash_239ebc19aab5a60b");
            function_e95ec8df();
            level waittill(#"start_of_round", #"force_transformations");
        }
        var_52f926ed = 0;
        time = gettime();
        keys = array::randomize(getarraykeys(level.var_b175714d));
        foreach (id in keys) {
            transformation = level.var_b175714d[id];
            if (level flag::get(#"hash_670ec83e1acfadff") || function_c3a1379e()) {
                break;
            }
            pixbeginevent("zm_transformation_update");
            if (transformation.var_ebaa8de9 > time) {
                pixendevent();
                continue;
            }
            if (function_abf1dcb4(id)) {
                pixendevent();
                continue;
            }
            var_52f926ed = function_fad54d94(id, transformation);
            pixendevent();
            if (isdefined(var_52f926ed) && var_52f926ed) {
                transformation.var_ebaa8de9 = isdefined(level.var_78acec0a) && level.var_78acec0a ? gettime() : gettime() + transformation.cooldown_time * 1000;
                break;
            }
        }
    }
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x5 linked
// Checksum 0xd4b17dcc, Offset: 0x2960
// Size: 0x2c
function private function_4c0d0d28(var_201c5b1f) {
    function_e95ec8df();
    function_fb608075();
}

// Namespace zm_transform/zm_transformation
// Params 0, eflags: 0x1 linked
// Checksum 0x732c7248, Offset: 0x2998
// Size: 0x24
function function_bbaec2fd() {
    self clientfield::set("transformation_spawn", 1);
}

/#

    // Namespace zm_transform/zm_transformation
    // Params 0, eflags: 0x4
    // Checksum 0x91f3342d, Offset: 0x29c8
    // Size: 0x4de
    function private devgui() {
        level waittill(#"start_zombie_round_logic");
        adddebugcommand("<dev string:x37d>");
        adddebugcommand("<dev string:x3d9>");
        adddebugcommand("<dev string:x427>");
        adddebugcommand("<dev string:x477>");
        foreach (id, transformation in level.var_b175714d) {
            adddebugcommand("<dev string:x4e3>" + function_9e72a96(id) + "<dev string:x50a>" + function_9e72a96(id) + "<dev string:x534>");
            adddebugcommand("<dev string:x539>" + function_9e72a96(id) + "<dev string:x560>" + function_9e72a96(id) + "<dev string:x534>");
            adddebugcommand("<dev string:x58a>" + function_9e72a96(id) + "<dev string:x5b1>" + function_9e72a96(id) + "<dev string:x534>");
        }
        registershack_walla = 0;
        while (true) {
            wait 0.2;
            cmd = getdvarstring(#"hash_439ed91bbc9ac4c0", "<dev string:x103>");
            if (cmd == "<dev string:x103>") {
                continue;
            }
            setdvar(#"hash_439ed91bbc9ac4c0", "<dev string:x103>");
            cmd = strtok(cmd, "<dev string:x5db>");
            switch (cmd[0]) {
            case #"toggle_status":
                registershack_walla = !registershack_walla;
                if (!registershack_walla) {
                    level notify(#"hash_53f34619e212c4cd");
                } else {
                    level thread show_status();
                }
                break;
            case #"force":
                var_167b5341 = level.var_b175714d[cmd[1]];
                if (!isdefined(var_167b5341)) {
                    break;
                }
                level thread function_3d080ace(cmd[1]);
                break;
            case #"spawn":
                var_167b5341 = level.var_b175714d[cmd[1]];
                if (!isdefined(var_167b5341)) {
                    break;
                }
                level.var_78acec0a = 1;
                level notify(#"force_transformations");
                level thread function_2f40be20(cmd[1]);
                break;
            case #"queue":
                level.var_78acec0a = 1;
                level notify(#"force_transformations");
                function_bdd8aba6(cmd[1]);
                break;
            case #"pause":
                function_4da8230b(#"hash_7a79688cef85b533");
                break;
            case #"resume":
                function_6b183c78(#"hash_7a79688cef85b533");
                break;
            case #"hash_5893e94d64f92905":
                function_6bcb49b5();
                break;
            }
        }
    }

    // Namespace zm_transform/zm_transformation
    // Params 0, eflags: 0x0
    // Checksum 0xfdebddc6, Offset: 0x2eb0
    // Size: 0x22
    function function_ece5c99c() {
        self.zombie_think_done = 1;
        self.completed_emerging_into_playable_area = 1;
    }

    // Namespace zm_transform/zm_transformation
    // Params 0, eflags: 0x0
    // Checksum 0x21945c2d, Offset: 0x2ee0
    // Size: 0x202
    function function_3f433f41() {
        if (!isdefined(level.zombie_spawners)) {
            return;
        }
        player = level.players[0];
        direction = player getplayerangles();
        direction_vec = anglestoforward(direction);
        eye = player geteye();
        scale = 8000;
        direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
        trace = bullettrace(eye, eye + direction_vec, 0, undefined);
        if (trace[#"fraction"] >= 1) {
            return;
        }
        random_spawner = array::random(level.zombie_spawners);
        zombie = random_spawner spawnfromspawner(random_spawner.targetname, 1, 0, 1);
        zombie.custom_location = &function_ece5c99c;
        zombie.b_ignore_cleanup = 1;
        if (!isdefined(zombie)) {
            return;
        }
        zombie forceteleport(trace[#"position"], player.angles + (0, 180, 0));
        return zombie;
    }

    // Namespace zm_transform/zm_transformation
    // Params 1, eflags: 0x4
    // Checksum 0x698e747b, Offset: 0x30f0
    // Size: 0x94
    function private function_3d080ace(var_70d26bfb) {
        zombie = function_3f433f41();
        if (!isdefined(zombie)) {
            return;
        }
        zombie endon(#"death");
        wait 0.5;
        while (function_abf1dcb4(var_70d26bfb)) {
            waitframe(1);
        }
        function_9acf76e6(zombie, var_70d26bfb);
    }

    // Namespace zm_transform/zm_transformation
    // Params 1, eflags: 0x4
    // Checksum 0xa767bbe0, Offset: 0x3190
    // Size: 0x74
    function private function_2f40be20(var_70d26bfb) {
        zombie = function_3f433f41();
        if (!isdefined(zombie)) {
            return;
        }
        zombie endon(#"death");
        zombie.var_641025d6 = gettime() + 500;
        function_d2374144(zombie, var_70d26bfb);
    }

    // Namespace zm_transform/zm_transformation
    // Params 1, eflags: 0x4
    // Checksum 0xc73b00b1, Offset: 0x3210
    // Size: 0x108
    function private function_4bad29d9(notifyhash) {
        foreach (var_deb567a8 in level.var_deb567a8) {
            if (!isdefined(var_deb567a8.id)) {
                var_deb567a8.var_735311f0 destroy();
            }
            var_deb567a8.title destroy();
            var_deb567a8.var_d189697d destroy();
            var_deb567a8.var_b99573ec destroy();
        }
        level.var_deb567a8 = undefined;
        level notify(#"hash_6e3d9f8c484e3d01");
    }

    // Namespace zm_transform/zm_transformation
    // Params 2, eflags: 0x4
    // Checksum 0x18abcc5d, Offset: 0x3320
    // Size: 0xbc
    function private create_hudelem(y, x) {
        if (!isdefined(x)) {
            x = 0;
        }
        var_aa917a22 = newdebughudelem();
        var_aa917a22.alignx = "<dev string:x5df>";
        var_aa917a22.horzalign = "<dev string:x5df>";
        var_aa917a22.aligny = "<dev string:x5e6>";
        var_aa917a22.vertalign = "<dev string:x5ef>";
        var_aa917a22.y = y;
        var_aa917a22.x = x;
        return var_aa917a22;
    }

    // Namespace zm_transform/zm_transformation
    // Params 0, eflags: 0x4
    // Checksum 0x8c83faa3, Offset: 0x33e8
    // Size: 0x4b0
    function private setup_status() {
        level.var_deb567a8 = array();
        y = 10;
        colors = array((1, 1, 1));
        var_e859a426 = create_hudelem(y);
        var_e859a426 settext("<dev string:x5f5>");
        y += 10;
        var_735311f0 = create_hudelem(y);
        var_af5fbf35 = create_hudelem(y, 160);
        var_af5fbf35 settext("<dev string:x614>");
        var_f4676cb4 = create_hudelem(y, 220);
        var_f4676cb4 settext("<dev string:x626>");
        if (!isdefined(level.var_deb567a8)) {
            level.var_deb567a8 = [];
        } else if (!isarray(level.var_deb567a8)) {
            level.var_deb567a8 = array(level.var_deb567a8);
        }
        level.var_deb567a8[level.var_deb567a8.size] = {#title:var_e859a426, #var_d189697d:var_af5fbf35, #var_b99573ec:var_f4676cb4, #var_735311f0:var_735311f0};
        i = 0;
        foreach (id, transformation in level.var_b175714d) {
            y += 10;
            current_color = colors[i % colors.size];
            id_elem = create_hudelem(y);
            id_elem settext(function_9e72a96(id));
            id_elem.color = current_color;
            id_elem.fontscale = 1.2;
            var_83db7237 = create_hudelem(y, 160);
            var_83db7237 settext(0);
            var_83db7237.color = current_color;
            var_83db7237.fontscale = 1.2;
            var_82f71158 = create_hudelem(y, 220);
            var_82f71158 settext(0);
            var_82f71158.color = current_color;
            var_82f71158.fontscale = 1.2;
            if (!isdefined(level.var_deb567a8)) {
                level.var_deb567a8 = [];
            } else if (!isarray(level.var_deb567a8)) {
                level.var_deb567a8 = array(level.var_deb567a8);
            }
            level.var_deb567a8[level.var_deb567a8.size] = {#title:id_elem, #var_d189697d:var_83db7237, #var_b99573ec:var_82f71158, #id:id, #color:current_color};
            i++;
        }
    }

    // Namespace zm_transform/zm_transformation
    // Params 1, eflags: 0x4
    // Checksum 0xbbd5b9d5, Offset: 0x38a0
    // Size: 0x1a
    function private function_9aa982db(notifyhash) {
        self.var_30acf8aa = undefined;
    }

    // Namespace zm_transform/zm_transformation
    // Params 2, eflags: 0x4
    // Checksum 0x79479171, Offset: 0x38c8
    // Size: 0xce
    function private function_4a065e66(id, color) {
        self endoncallback(&function_9aa982db, #"death", #"hash_6e3d9f8c484e3d01");
        level endoncallback(&function_9aa982db, #"hash_6e3d9f8c484e3d01");
        self.var_30acf8aa = 1;
        while (true) {
            record3dtext(function_9e72a96(id), self.origin + (0, 0, self.maxs[2]), color);
            waitframe(1);
        }
    }

    // Namespace zm_transform/zm_transformation
    // Params 0, eflags: 0x4
    // Checksum 0xb9cf2a22, Offset: 0x39a0
    // Size: 0x248
    function private show_status() {
        level notify(#"hash_53f34619e212c4cd");
        level endoncallback(&function_4bad29d9, #"hash_53f34619e212c4cd");
        setup_status();
        while (true) {
            waitframe(1);
            foreach (var_deb567a8 in level.var_deb567a8) {
                if (!isdefined(var_deb567a8.id)) {
                    var_deb567a8.var_735311f0 settext(function_770908a2() ? "<dev string:x641>" : "<dev string:x103>");
                    continue;
                }
                var_deb567a8.var_d189697d settext(level.var_b175714d[var_deb567a8.id].var_33e393a7);
                var_deb567a8.var_b99573ec settext(level.var_b175714d[var_deb567a8.id].var_2939a01a.size);
                foreach (ai in level.var_b175714d[var_deb567a8.id].var_2939a01a) {
                    if (!(isdefined(ai.var_30acf8aa) && ai.var_30acf8aa)) {
                        ai thread function_4a065e66(var_deb567a8.id, var_deb567a8.color);
                    }
                }
            }
        }
    }

    // Namespace zm_transform/zm_transformation
    // Params 0, eflags: 0x4
    // Checksum 0x914de01, Offset: 0x3bf0
    // Size: 0x54
    function private function_6bcb49b5() {
        level.var_dfd1a1c0 = !(isdefined(level.var_dfd1a1c0) && level.var_dfd1a1c0);
        if (level.var_dfd1a1c0) {
            level thread function_dfd1a1c0();
        }
    }

    // Namespace zm_transform/zm_transformation
    // Params 0, eflags: 0x4
    // Checksum 0xdb0883d5, Offset: 0x3c50
    // Size: 0x158
    function private function_dfd1a1c0() {
        self notify("<dev string:x64a>");
        self endon("<dev string:x64a>");
        while (level.var_dfd1a1c0) {
            var_c2624dfc = 200;
            var_b010a959 = 100;
            debug2dtext((var_c2624dfc, var_b010a959, 0), "<dev string:x65d>", (1, 1, 0), 1, (0, 0, 0), 0.8, 1);
            var_b010a959 += 25;
            foreach (pauser in level.var_50f7dbd5) {
                debug2dtext((var_c2624dfc, var_b010a959, 0), function_9e72a96(pauser), (1, 1, 1), 1, (0, 0, 0), 0.8, 1);
                var_b010a959 += 25;
            }
            waitframe(1);
        }
    }

#/
