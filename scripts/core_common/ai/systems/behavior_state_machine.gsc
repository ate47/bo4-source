#namespace behaviorstatemachine;

// Namespace behaviorstatemachine/behavior_state_machine
// Params 2, eflags: 0x1 linked
// Checksum 0x8a655ff4, Offset: 0x68
// Size: 0xa2
function registerbsmscriptapiinternal(functionname, scriptfunction) {
    if (!isdefined(level._bsmscriptfunctions)) {
        level._bsmscriptfunctions = [];
    }
    assert(isdefined(scriptfunction) && isdefined(scriptfunction), "<dev string:x38>");
    assert(!isdefined(level._bsmscriptfunctions[functionname]), "<dev string:x97>");
    level._bsmscriptfunctions[functionname] = scriptfunction;
}

