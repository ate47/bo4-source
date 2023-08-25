// Atian COD Tools GSC decompiler test
#namespace blackboard;

// Namespace blackboard/blackboard
// Params 4, eflags: 0x1 linked
// Checksum 0xc5c6c510, Offset: 0x68
// Size: 0x134
function registerblackboardattribute(entity, var_b5da1cda, defaultattributevalue, getterfunction) {
    /#
        assert(isdefined(entity.__blackboard), "<unknown string>");
    #/
    /#
        assert(!isdefined(entity.__blackboard[var_b5da1cda]), "<unknown string>" + var_b5da1cda + "<unknown string>");
    #/
    if (isdefined(getterfunction)) {
        /#
            assert(isfunctionptr(getterfunction));
        #/
        entity.__blackboard[var_b5da1cda] = getterfunction;
    } else {
        if (!isdefined(defaultattributevalue)) {
            defaultattributevalue = undefined;
        }
        entity.__blackboard[var_b5da1cda] = defaultattributevalue;
    }
    /#
        if (isactor(entity)) {
            entity trackblackboardattribute(var_b5da1cda);
        }
    #/
}

// Namespace blackboard/blackboard
// Params 2, eflags: 0x1 linked
// Checksum 0x79de3fa4, Offset: 0x1a8
// Size: 0xb2
function getstructblackboardattribute(struct, var_b5da1cda) {
    /#
        assert(isstruct(struct));
    #/
    if (isfunctionptr(struct.__blackboard[var_b5da1cda])) {
        getterfunction = struct.__blackboard[var_b5da1cda];
        attributevalue = struct [[ getterfunction ]]();
        return attributevalue;
    } else {
        return struct.__blackboard[var_b5da1cda];
    }
}

// Namespace blackboard/blackboard
// Params 3, eflags: 0x1 linked
// Checksum 0x159819cc, Offset: 0x268
// Size: 0xe2
function setstructblackboardattribute(struct, var_b5da1cda, attributevalue) {
    /#
        assert(isstruct(struct));
    #/
    if (isdefined(struct.__blackboard[var_b5da1cda])) {
        if (!isdefined(attributevalue) && isfunctionptr(struct.__blackboard[var_b5da1cda])) {
            return;
        }
        /#
            assert(!isfunctionptr(struct.__blackboard[var_b5da1cda]), "<unknown string>");
        #/
    }
    struct.__blackboard[var_b5da1cda] = attributevalue;
}

// Namespace blackboard/blackboard
// Params 1, eflags: 0x1 linked
// Checksum 0x92d887bb, Offset: 0x358
// Size: 0x7e
function createblackboardforentity(entity) {
    if (!isdefined(entity.__blackboard)) {
        entity.__blackboard = [];
        if (isentity(entity)) {
            entity createblackboardentries();
        }
    }
    if (!isdefined(level.var_9627844)) {
        level.var_9627844 = &setblackboardattribute;
    }
}

// Namespace blackboard/blackboard
// Params 1, eflags: 0x1 linked
// Checksum 0x680b7039, Offset: 0x3e0
// Size: 0xde
function cloneblackboardfromstruct(struct) {
    /#
        assert(isstruct(struct));
    #/
    blackboard = [];
    if (isdefined(struct.__blackboard)) {
        foreach (k, v in struct.__blackboard) {
            blackboard[k] = getstructblackboardattribute(struct, k);
        }
    }
    return blackboard;
}

