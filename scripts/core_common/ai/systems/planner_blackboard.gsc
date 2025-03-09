#namespace plannerblackboard;

/#

    // Namespace plannerblackboard/planner_blackboard
    // Params 0, eflags: 0x2
    // Checksum 0x88702a61, Offset: 0x78
    // Size: 0x36
    function autoexec main() {
        level.__ai_debugplannerblackboard = getdvarint(#"ai_debugplannerblackboard", 0);
    }

#/

// Namespace plannerblackboard/planner_blackboard
// Params 1, eflags: 0x0
// Checksum 0x3308c3ba, Offset: 0xb8
// Size: 0x42
function clearundostack(blackboard) {
    assert(isstruct(blackboard));
    blackboard.undostack = [];
}

// Namespace plannerblackboard/planner_blackboard
// Params 1, eflags: 0x0
// Checksum 0x1b56ba85, Offset: 0x108
// Size: 0x80
function create(&blackboardvalues) {
    assert(isarray(blackboardvalues));
    blackboard = spawnstruct();
    blackboard.undostack = [];
    blackboard.values = blackboardvalues;
    setreadmode(blackboard);
    return blackboard;
}

// Namespace plannerblackboard/planner_blackboard
// Params 2, eflags: 0x0
// Checksum 0x8f27e276, Offset: 0x190
// Size: 0xf8
function getattribute(blackboard, attribute) {
    assert(isstruct(blackboard));
    assert(isstring(attribute) || ishash(attribute));
    assert(isarray(blackboard.values));
    value = blackboard.values[attribute];
    if (isarray(value)) {
        return arraycopy(value);
    }
    return value;
}

// Namespace plannerblackboard/planner_blackboard
// Params 1, eflags: 0x0
// Checksum 0x7c8cae92, Offset: 0x290
// Size: 0x70
function getundostacksize(blackboard) {
    assert(isstruct(blackboard));
    assert(isarray(blackboard.undostack));
    return blackboard.undostack.size;
}

// Namespace plannerblackboard/planner_blackboard
// Params 4, eflags: 0x0
// Checksum 0x810511cb, Offset: 0x308
// Size: 0x2ba
function setattribute(blackboard, attribute, value, readonly = 0) {
    assert(isstruct(blackboard));
    assert(isstring(attribute) || ishash(attribute));
    assert(isarray(blackboard.values));
    assert(isarray(blackboard.undostack));
    assert(blackboard.mode === "<dev string:x38>");
    /#
        if (isdefined(level.__ai_debugplannerblackboard) && level.__ai_debugplannerblackboard > 0 && !readonly) {
            assert(!isstruct(value), "<dev string:x3d>");
            if (isarray(value)) {
                foreach (entryvalue in value) {
                    assert(!isstruct(entryvalue), "<dev string:x87>");
                }
            }
        }
    #/
    stackvalue = spawnstruct();
    stackvalue.attribute = attribute;
    stackvalue.value = blackboard.values[attribute];
    blackboard.undostack[blackboard.undostack.size] = stackvalue;
    blackboard.values[attribute] = value;
}

// Namespace plannerblackboard/planner_blackboard
// Params 1, eflags: 0x0
// Checksum 0x4c0c0d2f, Offset: 0x5d0
// Size: 0x1e
function setreadmode(blackboard) {
    blackboard.mode = "r";
}

// Namespace plannerblackboard/planner_blackboard
// Params 1, eflags: 0x0
// Checksum 0x36137579, Offset: 0x5f8
// Size: 0x1e
function setreadwritemode(blackboard) {
    blackboard.mode = "rw";
}

// Namespace plannerblackboard/planner_blackboard
// Params 2, eflags: 0x0
// Checksum 0x222613fb, Offset: 0x620
// Size: 0x15e
function undo(blackboard, stackindex) {
    assert(isstruct(blackboard));
    assert(isarray(blackboard.values));
    assert(isarray(blackboard.undostack));
    assert(stackindex < blackboard.undostack.size);
    for (index = blackboard.undostack.size - 1; index > stackindex; index--) {
        stackvalue = blackboard.undostack[index];
        blackboard.values[stackvalue.attribute] = stackvalue.value;
        arrayremoveindex(blackboard.undostack, index);
    }
}

