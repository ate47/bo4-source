// Atian COD Tools GSC decompiler test
#namespace ai_interface;

// Namespace ai_interface/ai_interface
// Params 0, eflags: 0x2
// Checksum 0x38936ac0, Offset: 0xb8
// Size: 0x36
function autoexec main() {
    /#
        level.var_a513a512 = getdvarint(#"ai_debuginterface", 0);
    #/
}

// Namespace ai_interface/ai_interface
// Params 3, eflags: 0x4
// Checksum 0x57640758, Offset: 0xf8
// Size: 0x32a
function private _checkvalue(archetype, var_b5da1cda, value) {
    /#
        attribute = level.var_bd2a10d0[archetype][var_b5da1cda];
        switch (attribute[#"type"]) {
        case #"_interface_entity":
            break;
        case #"_interface_match":
            var_f714a114 = attribute[#"values"];
            /#
                assert(!isarray(var_f714a114) || isinarray(var_f714a114, value), "<unknown string>" + value + "<unknown string>" + var_b5da1cda + "<unknown string>");
            #/
            break;
        case #"_interface_numeric":
            maxvalue = attribute[#"max_value"];
            minvalue = attribute[#"min_value"];
            /#
                assert(isint(value) || isfloat(value), "<unknown string>" + var_b5da1cda + "<unknown string>" + value + "<unknown string>");
            #/
            /#
                assert(!isdefined(maxvalue) && !isdefined(minvalue) || value <= maxvalue && value >= minvalue, "<unknown string>" + value + "<unknown string>" + minvalue + "<unknown string>" + maxvalue + "<unknown string>");
            #/
            break;
        case #"_interface_vector":
            if (isdefined(value)) {
                /#
                    assert(isvec(value), "<unknown string>" + var_b5da1cda + "<unknown string>" + value + "<unknown string>");
                #/
            }
            break;
        default:
            /#
                assert("<unknown string>" + attribute[#"type"] + "<unknown string>" + var_b5da1cda + "<unknown string>");
            #/
            break;
        }
    #/
}

// Namespace ai_interface/ai_interface
// Params 2, eflags: 0x4
// Checksum 0xcc1f9c29, Offset: 0x430
// Size: 0x314
function private _checkprerequisites(entity, attribute) {
    /#
        if (isdefined(level.var_a513a512) && level.var_a513a512 > 0) {
            /#
                assert(isentity(entity) || isstruct(entity), "<unknown string>");
            #/
            /#
                assert(isactor(entity) || isvehicle(entity) || isstruct(entity) || isbot(entity), "<unknown string>");
            #/
            /#
                assert(isstring(attribute), "<unknown string>");
            #/
            /#
                assert(isarray(entity.var_36fe07c2), "<unknown string>" + function_9e72a96(entity.archetype) + "<unknown string>" + "<unknown string>");
            #/
            /#
                assert(isarray(level.var_bd2a10d0), "<unknown string>");
            #/
            /#
                assert(isarray(level.var_bd2a10d0[entity.archetype]), "<unknown string>" + function_9e72a96(entity.archetype) + "<unknown string>");
            #/
            /#
                assert(isarray(level.var_bd2a10d0[entity.archetype][attribute]), "<unknown string>" + attribute + "<unknown string>" + function_9e72a96(entity.archetype) + "<unknown string>");
            #/
            /#
                assert(isstring(level.var_bd2a10d0[entity.archetype][attribute][#"type"]), "<unknown string>" + attribute + "<unknown string>");
            #/
        }
    #/
}

// Namespace ai_interface/ai_interface
// Params 3, eflags: 0x4
// Checksum 0x568ed2a5, Offset: 0x750
// Size: 0xc4
function private _checkregistrationprerequisites(archetype, attribute, callbackfunction) {
    /#
        /#
            assert(ishash(archetype), "<unknown string>");
        #/
        /#
            assert(ishash(attribute), "<unknown string>");
        #/
        /#
            assert(!isdefined(callbackfunction) || isfunctionptr(callbackfunction), "<unknown string>");
        #/
    #/
}

// Namespace ai_interface/ai_interface
// Params 1, eflags: 0x5 linked
// Checksum 0xf36e74c5, Offset: 0x820
// Size: 0x52
function private _initializelevelinterface(archetype) {
    if (!isdefined(level.var_bd2a10d0)) {
        level.var_bd2a10d0 = [];
    }
    if (!isdefined(level.var_bd2a10d0[archetype])) {
        level.var_bd2a10d0[archetype] = [];
    }
}

#namespace ai;

// Namespace ai/ai_interface
// Params 1, eflags: 0x1 linked
// Checksum 0xffd46be1, Offset: 0x880
// Size: 0x2a
function createinterfaceforentity(entity) {
    if (!isdefined(entity.var_36fe07c2)) {
        entity.var_36fe07c2 = [];
    }
}

// Namespace ai/ai_interface
// Params 2, eflags: 0x1 linked
// Checksum 0x165a3d0, Offset: 0x8b8
// Size: 0x8c
function getaiattribute(entity, attribute) {
    /#
        ai_interface::_checkprerequisites(entity, attribute);
    #/
    if (!isdefined(entity.var_36fe07c2[attribute])) {
        return level.var_bd2a10d0[entity.archetype][attribute][#"default_value"];
    }
    return entity.var_36fe07c2[attribute];
}

// Namespace ai/ai_interface
// Params 2, eflags: 0x1 linked
// Checksum 0x209ea5aa, Offset: 0x950
// Size: 0x86
function hasaiattribute(entity, attribute) {
    return isdefined(entity) && isdefined(attribute) && isdefined(entity.archetype) && isdefined(level.var_bd2a10d0) && isdefined(level.var_bd2a10d0[entity.archetype]) && isdefined(level.var_bd2a10d0[entity.archetype][attribute]);
}

// Namespace ai/ai_interface
// Params 4, eflags: 0x1 linked
// Checksum 0x5aeedb23, Offset: 0x9e0
// Size: 0x17c
function registerentityinterface(archetype, attribute, defaultvalue, callbackfunction) {
    /#
        ai_interface::_checkregistrationprerequisites(archetype, attribute, callbackfunction);
    #/
    ai_interface::_initializelevelinterface(archetype);
    /#
        /#
            assert(!isdefined(level.var_bd2a10d0[archetype][attribute]), "<unknown string>" + attribute + "<unknown string>" + archetype + "<unknown string>");
        #/
    #/
    level.var_bd2a10d0[archetype][attribute] = [];
    level.var_bd2a10d0[archetype][attribute][#"callback"] = callbackfunction;
    level.var_bd2a10d0[archetype][attribute][#"default_value"] = defaultvalue;
    level.var_bd2a10d0[archetype][attribute][#"type"] = "_interface_entity";
    /#
        ai_interface::_checkvalue(archetype, attribute, defaultvalue);
    #/
}

// Namespace ai/ai_interface
// Params 5, eflags: 0x1 linked
// Checksum 0x889e916d, Offset: 0xb68
// Size: 0x1f4
function registermatchedinterface(archetype, attribute, defaultvalue, var_f714a114, callbackfunction) {
    /#
        ai_interface::_checkregistrationprerequisites(archetype, attribute, callbackfunction);
        /#
            assert(!isdefined(var_f714a114) || isarray(var_f714a114), "<unknown string>");
        #/
    #/
    ai_interface::_initializelevelinterface(archetype);
    /#
        /#
            assert(!isdefined(level.var_bd2a10d0[archetype][attribute]), "<unknown string>" + attribute + "<unknown string>" + archetype + "<unknown string>");
        #/
    #/
    level.var_bd2a10d0[archetype][attribute] = [];
    level.var_bd2a10d0[archetype][attribute][#"callback"] = callbackfunction;
    level.var_bd2a10d0[archetype][attribute][#"default_value"] = defaultvalue;
    level.var_bd2a10d0[archetype][attribute][#"type"] = "_interface_match";
    level.var_bd2a10d0[archetype][attribute][#"values"] = var_f714a114;
    /#
        ai_interface::_checkvalue(archetype, attribute, defaultvalue);
    #/
}

// Namespace ai/ai_interface
// Params 6, eflags: 0x1 linked
// Checksum 0xc0361b74, Offset: 0xd68
// Size: 0x33c
function registernumericinterface(archetype, attribute, defaultvalue, var_49a25f6c, var_53644110, callbackfunction) {
    /#
        ai_interface::_checkregistrationprerequisites(archetype, attribute, callbackfunction);
        /#
            assert(!isdefined(var_49a25f6c) || isint(var_49a25f6c) || isfloat(var_49a25f6c), "<unknown string>");
        #/
        /#
            assert(!isdefined(var_53644110) || isint(var_53644110) || isfloat(var_53644110), "<unknown string>");
        #/
        /#
            assert(!isdefined(var_49a25f6c) && !isdefined(var_53644110) || isdefined(var_49a25f6c) && isdefined(var_53644110), "<unknown string>");
        #/
        /#
            assert(!isdefined(var_49a25f6c) && !isdefined(var_53644110) || var_49a25f6c <= var_53644110, "<unknown string>" + attribute + "<unknown string>" + "<unknown string>");
        #/
    #/
    ai_interface::_initializelevelinterface(archetype);
    /#
        /#
            assert(!isdefined(level.var_bd2a10d0[archetype][attribute]), "<unknown string>" + attribute + "<unknown string>" + archetype + "<unknown string>");
        #/
    #/
    level.var_bd2a10d0[archetype][attribute] = [];
    level.var_bd2a10d0[archetype][attribute][#"callback"] = callbackfunction;
    level.var_bd2a10d0[archetype][attribute][#"default_value"] = defaultvalue;
    level.var_bd2a10d0[archetype][attribute][#"max_value"] = var_53644110;
    level.var_bd2a10d0[archetype][attribute][#"min_value"] = var_49a25f6c;
    level.var_bd2a10d0[archetype][attribute][#"type"] = "_interface_numeric";
    /#
        ai_interface::_checkvalue(archetype, attribute, defaultvalue);
    #/
}

// Namespace ai/ai_interface
// Params 4, eflags: 0x0
// Checksum 0xb1c188e9, Offset: 0x10b0
// Size: 0x17c
function registervectorinterface(archetype, attribute, defaultvalue, callbackfunction) {
    /#
        ai_interface::_checkregistrationprerequisites(archetype, attribute, callbackfunction);
    #/
    ai_interface::_initializelevelinterface(archetype);
    /#
        /#
            assert(!isdefined(level.var_bd2a10d0[archetype][attribute]), "<unknown string>" + attribute + "<unknown string>" + archetype + "<unknown string>");
        #/
    #/
    level.var_bd2a10d0[archetype][attribute] = [];
    level.var_bd2a10d0[archetype][attribute][#"callback"] = callbackfunction;
    level.var_bd2a10d0[archetype][attribute][#"default_value"] = defaultvalue;
    level.var_bd2a10d0[archetype][attribute][#"type"] = "_interface_vector";
    /#
        ai_interface::_checkvalue(archetype, attribute, defaultvalue);
    #/
}

// Namespace ai/ai_interface
// Params 3, eflags: 0x1 linked
// Checksum 0x6fbdc64, Offset: 0x1238
// Size: 0x130
function setaiattribute(entity, attribute, value) {
    /#
        ai_interface::_checkprerequisites(entity, attribute);
        ai_interface::_checkvalue(entity.archetype, attribute, value);
    #/
    oldvalue = entity.var_36fe07c2[attribute];
    if (!isdefined(oldvalue)) {
        oldvalue = level.var_bd2a10d0[entity.archetype][attribute][#"default_value"];
    }
    entity.var_36fe07c2[attribute] = value;
    callback = level.var_bd2a10d0[entity.archetype][attribute][#"callback"];
    if (isfunctionptr(callback)) {
        [[ callback ]](entity, attribute, oldvalue, value);
    }
}

