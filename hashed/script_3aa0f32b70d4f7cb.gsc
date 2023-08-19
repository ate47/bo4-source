// Atian COD Tools GSC decompiler test
#namespace behaviortreenetworkutility;

// Namespace behaviortreenetworkutility/namespace_d08cbf7c
// Params 3, eflags: 0x1 linked
// Checksum 0x20fa0909, Offset: 0x68
// Size: 0xcc
function registerbehaviortreescriptapi(functionname, functionptr, var_b9caf8b1) {
    if (!isdefined(level._behaviortreescriptfunctions)) {
        level._behaviortreescriptfunctions = [];
    }
    /#
        assert(isdefined(functionname) && isdefined(functionptr), "<unknown string>");
    #/
    /#
        assert(!isdefined(level._behaviortreescriptfunctions[functionname]), "<unknown string>");
    #/
    level._behaviortreescriptfunctions[functionname] = functionptr;
    if (isdefined(var_b9caf8b1)) {
        registerlimitedbehaviortreeapi(functionname, var_b9caf8b1);
    }
}

// Namespace behaviortreenetworkutility/namespace_d08cbf7c
// Params 4, eflags: 0x1 linked
// Checksum 0x8d3678bc, Offset: 0x140
// Size: 0x1e0
function registerbehaviortreeaction(actionname, var_be53f38d, var_2990edef, var_c9501750) {
    if (!isdefined(level._behaviortreeactions)) {
        level._behaviortreeactions = [];
    }
    /#
        assert(isdefined(actionname), "<unknown string>");
    #/
    /#
        assert(!isdefined(level._behaviortreeactions[actionname]), "<unknown string>" + actionname + "<unknown string>");
    #/
    level._behaviortreeactions[actionname] = array();
    if (isdefined(var_be53f38d)) {
        /#
            assert(isfunctionptr(var_be53f38d), "<unknown string>");
        #/
        level._behaviortreeactions[actionname][#"bhtn_action_start"] = var_be53f38d;
    }
    if (isdefined(var_2990edef)) {
        /#
            assert(isfunctionptr(var_2990edef), "<unknown string>");
        #/
        level._behaviortreeactions[actionname][#"bhtn_action_update"] = var_2990edef;
    }
    if (isdefined(var_c9501750)) {
        /#
            assert(isfunctionptr(var_c9501750), "<unknown string>");
        #/
        level._behaviortreeactions[actionname][#"bhtn_action_terminate"] = var_c9501750;
    }
}

