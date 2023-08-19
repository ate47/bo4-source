// Atian COD Tools GSC decompiler test
#namespace plannerblackboard;

// Namespace plannerblackboard/namespace_9fb97799
// Params 0, eflags: 0x2
// Checksum 0x88702a61, Offset: 0x78
// Size: 0x36
function autoexec main() {
    /#
        level.var_6c1b9dfc = getdvarint(#"ai_debugplannerblackboard", 0);
    #/
}

// Namespace plannerblackboard/namespace_9fb97799
// Params 1, eflags: 0x1 linked
// Checksum 0x3308c3ba, Offset: 0xb8
// Size: 0x42
function clearundostack(blackboard) {
    /#
        assert(isstruct(blackboard));
    #/
    blackboard.var_1119bda0 = [];
}

// Namespace plannerblackboard/namespace_9fb97799
// Params 1, eflags: 0x1 linked
// Checksum 0x1b56ba85, Offset: 0x108
// Size: 0x80
function create(var_f0d11344&) {
    /#
        assert(isarray(var_f0d11344));
    #/
    blackboard = spawnstruct();
    blackboard.var_1119bda0 = [];
    blackboard.values = var_f0d11344;
    setreadmode(blackboard);
    return blackboard;
}

// Namespace plannerblackboard/namespace_9fb97799
// Params 2, eflags: 0x1 linked
// Checksum 0x8f27e276, Offset: 0x190
// Size: 0xf8
function getattribute(blackboard, attribute) {
    /#
        assert(isstruct(blackboard));
    #/
    /#
        assert(isstring(attribute) || ishash(attribute));
    #/
    /#
        assert(isarray(blackboard.values));
    #/
    value = blackboard.values[attribute];
    if (isarray(value)) {
        return arraycopy(value);
    }
    return value;
}

// Namespace plannerblackboard/namespace_9fb97799
// Params 1, eflags: 0x1 linked
// Checksum 0x7c8cae92, Offset: 0x290
// Size: 0x70
function getundostacksize(blackboard) {
    /#
        assert(isstruct(blackboard));
    #/
    /#
        assert(isarray(blackboard.var_1119bda0));
    #/
    return blackboard.var_1119bda0.size;
}

// Namespace plannerblackboard/namespace_9fb97799
// Params 4, eflags: 0x1 linked
// Checksum 0x810511cb, Offset: 0x308
// Size: 0x2ba
function setattribute(blackboard, attribute, value, readonly = 0) {
    /#
        assert(isstruct(blackboard));
    #/
    /#
        assert(isstring(attribute) || ishash(attribute));
    #/
    /#
        assert(isarray(blackboard.values));
    #/
    /#
        assert(isarray(blackboard.var_1119bda0));
    #/
    /#
        assert(blackboard.mode === "<unknown string>");
    #/
    /#
        if (isdefined(level.var_6c1b9dfc) && level.var_6c1b9dfc > 0 && !readonly) {
            /#
                assert(!isstruct(value), "<unknown string>");
            #/
            if (isarray(value)) {
                foreach (var_6e6b46bf in value) {
                    /#
                        assert(!isstruct(var_6e6b46bf), "<unknown string>");
                    #/
                }
            }
        }
    #/
    var_b1d080df = spawnstruct();
    var_b1d080df.attribute = attribute;
    var_b1d080df.value = blackboard.values[attribute];
    blackboard.var_1119bda0[blackboard.var_1119bda0.size] = var_b1d080df;
    blackboard.values[attribute] = value;
}

// Namespace plannerblackboard/namespace_9fb97799
// Params 1, eflags: 0x1 linked
// Checksum 0x4c0c0d2f, Offset: 0x5d0
// Size: 0x1e
function setreadmode(blackboard) {
    blackboard.mode = "r";
}

// Namespace plannerblackboard/namespace_9fb97799
// Params 1, eflags: 0x1 linked
// Checksum 0x36137579, Offset: 0x5f8
// Size: 0x1e
function setreadwritemode(blackboard) {
    blackboard.mode = "rw";
}

// Namespace plannerblackboard/namespace_9fb97799
// Params 2, eflags: 0x1 linked
// Checksum 0x222613fb, Offset: 0x620
// Size: 0x15e
function undo(blackboard, var_933e99a5) {
    /#
        assert(isstruct(blackboard));
    #/
    /#
        assert(isarray(blackboard.values));
    #/
    /#
        assert(isarray(blackboard.var_1119bda0));
    #/
    /#
        assert(var_933e99a5 < blackboard.var_1119bda0.size);
    #/
    for (index = blackboard.var_1119bda0.size - 1; index > var_933e99a5; index--) {
        var_b1d080df = blackboard.var_1119bda0[index];
        blackboard.values[var_b1d080df.attribute] = var_b1d080df.value;
        arrayremoveindex(blackboard.var_1119bda0, index);
    }
}

