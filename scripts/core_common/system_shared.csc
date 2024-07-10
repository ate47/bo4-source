#using scripts\core_common\flagsys_shared.csc;

#namespace system;

// Namespace system/system_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xf613164, Offset: 0x88
// Size: 0x18e
function register(str_name, func_preinit, func_postinit, reqs) {
    if (isdefined(level.system_funcs) && isdefined(level.system_funcs[str_name])) {
        assert(level.system_funcs[str_name].ignore, "<dev string:x38>" + function_9e72a96(str_name) + "<dev string:x43>");
        return;
    }
    if (!isdefined(level.system_funcs)) {
        level.system_funcs = [];
    }
    level.system_funcs[str_name] = spawnstruct();
    level.system_funcs[str_name].prefunc = func_preinit;
    level.system_funcs[str_name].postfunc = func_postinit;
    level.system_funcs[str_name].reqs = reqs;
    level.system_funcs[str_name].predone = !isdefined(func_preinit);
    level.system_funcs[str_name].postdone = !isdefined(func_postinit);
    level.system_funcs[str_name].ignore = 0;
}

// Namespace system/system_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x2e313ddd, Offset: 0x220
// Size: 0x94
function exec_post_system(func) {
    if (!isdefined(func) || isdefined(func.ignore) && func.ignore) {
        return;
    }
    if (!func.postdone) {
        if (isdefined(func.reqs)) {
            function_5095b2c6(func);
        }
        func.postdone = 1;
        [[ func.postfunc ]]();
    }
}

// Namespace system/system_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe664e6a2, Offset: 0x2c0
// Size: 0x1e4
function function_5095b2c6(func) {
    assert(func.predone || func.ignore, "<dev string:x8d>");
    if (isdefined(func.reqs)) {
        if (isarray(func.reqs)) {
            foreach (req in func.reqs) {
                assert(isdefined(req), "<dev string:xf8>" + req + "<dev string:x120>");
                thread exec_post_system(level.system_funcs[req]);
            }
            return;
        }
        assert(isdefined(level.system_funcs[func.reqs]), "<dev string:xf8>" + (ishash(func.reqs) ? function_9e72a96(func.reqs) : func.reqs) + "<dev string:x120>");
        thread exec_post_system(level.system_funcs[func.reqs]);
    }
}

// Namespace system/system_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x136e5f24, Offset: 0x4b0
// Size: 0xbe
function run_post_systems() {
    foreach (func in level.system_funcs) {
        function_5095b2c6(func);
        thread exec_post_system(func);
    }
    level flagsys::set("system_init_complete");
    level.system_funcs = undefined;
}

// Namespace system/system_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa9198406, Offset: 0x578
// Size: 0x92
function exec_pre_system(func) {
    if (!isdefined(func) || isdefined(func.ignore) && func.ignore) {
        return;
    }
    if (!func.predone) {
        if (isdefined(func.reqs)) {
            function_8dfa23e0(func);
        }
        [[ func.prefunc ]]();
        func.predone = 1;
    }
}

// Namespace system/system_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf7cb479e, Offset: 0x618
// Size: 0x1a4
function function_8dfa23e0(func) {
    if (isdefined(func.reqs)) {
        if (isarray(func.reqs)) {
            foreach (req in func.reqs) {
                assert(isdefined(req), "<dev string:xf8>" + req + "<dev string:x120>");
                thread exec_pre_system(level.system_funcs[req]);
            }
            return;
        }
        assert(isdefined(level.system_funcs[func.reqs]), "<dev string:xf8>" + (ishash(func.reqs) ? function_9e72a96(func.reqs) : func.reqs) + "<dev string:x120>");
        thread exec_pre_system(level.system_funcs[func.reqs]);
    }
}

// Namespace system/system_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb8797dbe, Offset: 0x7c8
// Size: 0x98
function run_pre_systems() {
    foreach (func in level.system_funcs) {
        function_8dfa23e0(func);
        thread exec_pre_system(func);
    }
}

// Namespace system/system_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x205c29cc, Offset: 0x868
// Size: 0x2c
function wait_till(required_systems) {
    level flagsys::wait_till("system_init_complete");
}

// Namespace system/system_shared
// Params 1, eflags: 0x0
// Checksum 0xb1f4f633, Offset: 0x8a0
// Size: 0x9a
function ignore(str_name) {
    assert(!isdefined(level.gametype), "<dev string:x124>");
    if (!isdefined(level.system_funcs) || !isdefined(level.system_funcs[str_name])) {
        register(str_name, undefined, undefined, undefined);
    }
    level.system_funcs[str_name].ignore = 1;
}

