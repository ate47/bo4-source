#namespace blackboard;

// Namespace blackboard/blackboard
// Params 4, eflags: 0x1 linked
// Checksum 0xc5c6c510, Offset: 0x68
// Size: 0x134
function registerblackboardattribute(entity, attributename, defaultattributevalue, getterfunction) {
    assert(isdefined(entity.__blackboard), "<dev string:x38>");
    assert(!isdefined(entity.__blackboard[attributename]), "<dev string:x77>" + attributename + "<dev string:x91>");
    if (isdefined(getterfunction)) {
        assert(isfunctionptr(getterfunction));
        entity.__blackboard[attributename] = getterfunction;
    } else {
        if (!isdefined(defaultattributevalue)) {
            defaultattributevalue = undefined;
        }
        entity.__blackboard[attributename] = defaultattributevalue;
    }
    /#
        if (isactor(entity)) {
            entity trackblackboardattribute(attributename);
        }
    #/
}

// Namespace blackboard/blackboard
// Params 2, eflags: 0x1 linked
// Checksum 0x79de3fa4, Offset: 0x1a8
// Size: 0xb2
function getstructblackboardattribute(struct, attributename) {
    assert(isstruct(struct));
    if (isfunctionptr(struct.__blackboard[attributename])) {
        getterfunction = struct.__blackboard[attributename];
        attributevalue = struct [[ getterfunction ]]();
        return attributevalue;
    }
    return struct.__blackboard[attributename];
}

// Namespace blackboard/blackboard
// Params 3, eflags: 0x1 linked
// Checksum 0x159819cc, Offset: 0x268
// Size: 0xe2
function setstructblackboardattribute(struct, attributename, attributevalue) {
    assert(isstruct(struct));
    if (isdefined(struct.__blackboard[attributename])) {
        if (!isdefined(attributevalue) && isfunctionptr(struct.__blackboard[attributename])) {
            return;
        }
        assert(!isfunctionptr(struct.__blackboard[attributename]), "<dev string:xa8>");
    }
    struct.__blackboard[attributename] = attributevalue;
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
    if (!isdefined(level._setblackboardattributefunc)) {
        level._setblackboardattributefunc = &setblackboardattribute;
    }
}

// Namespace blackboard/blackboard
// Params 1, eflags: 0x1 linked
// Checksum 0x680b7039, Offset: 0x3e0
// Size: 0xde
function cloneblackboardfromstruct(struct) {
    assert(isstruct(struct));
    blackboard = [];
    if (isdefined(struct.__blackboard)) {
        foreach (k, v in struct.__blackboard) {
            blackboard[k] = getstructblackboardattribute(struct, k);
        }
    }
    return blackboard;
}

