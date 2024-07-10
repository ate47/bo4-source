#namespace behaviortreenetworkutility;

// Namespace behaviortreenetworkutility/behavior_tree_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x20fa0909, Offset: 0x68
// Size: 0xcc
function registerbehaviortreescriptapi(functionname, functionptr, allowedcallsperframe) {
    if (!isdefined(level._behaviortreescriptfunctions)) {
        level._behaviortreescriptfunctions = [];
    }
    assert(isdefined(functionname) && isdefined(functionptr), "<dev string:x38>");
    assert(!isdefined(level._behaviortreescriptfunctions[functionname]), "<dev string:xa9>");
    level._behaviortreescriptfunctions[functionname] = functionptr;
    if (isdefined(allowedcallsperframe)) {
        registerlimitedbehaviortreeapi(functionname, allowedcallsperframe);
    }
}

// Namespace behaviortreenetworkutility/behavior_tree_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x8d3678bc, Offset: 0x140
// Size: 0x1e0
function registerbehaviortreeaction(actionname, startfuncptr, updatefuncptr, terminatefuncptr) {
    if (!isdefined(level._behaviortreeactions)) {
        level._behaviortreeactions = [];
    }
    assert(isdefined(actionname), "<dev string:x108>");
    assert(!isdefined(level._behaviortreeactions[actionname]), "<dev string:x151>" + actionname + "<dev string:x189>");
    level._behaviortreeactions[actionname] = array();
    if (isdefined(startfuncptr)) {
        assert(isfunctionptr(startfuncptr), "<dev string:x1a3>");
        level._behaviortreeactions[actionname][#"bhtn_action_start"] = startfuncptr;
    }
    if (isdefined(updatefuncptr)) {
        assert(isfunctionptr(updatefuncptr), "<dev string:x1e7>");
        level._behaviortreeactions[actionname][#"bhtn_action_update"] = updatefuncptr;
    }
    if (isdefined(terminatefuncptr)) {
        assert(isfunctionptr(terminatefuncptr), "<dev string:x22c>");
        level._behaviortreeactions[actionname][#"bhtn_action_terminate"] = terminatefuncptr;
    }
}

