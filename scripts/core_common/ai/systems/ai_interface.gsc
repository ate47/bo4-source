// Atian COD Tools GSC decompiler test
#namespace ai_interface;

// Namespace ai_interface/ai_interface
// Params 0, eflags: 0x2
// Checksum 0x38936ac0, Offset: 0xb8
// Size: 0x36
function autoexec main() {
    /#
        level.__ai_debuginterface = getdvarint(#"ai_debuginterface", 0);
    #/
}

// Namespace ai_interface/ai_interface
// Params 3, eflags: 0x4
// Checksum 0x57640758, Offset: 0xf8
// Size: 0x32a
function private _checkvalue(archetype, attributename, value) {
    /#
        attribute = level.__ai_interface[archetype][attributename];
        switch (attribute[#"type"]) {
        case #"_interface_entity":
            break;
        case #"_interface_match":
            possiblevalues = attribute[#"values"];
            /#
                assert(!isarray(possiblevalues) || isinarray(possiblevalues, value), "<unknown string>" + value + "<unknown string>" + attributename + "<unknown string>");
            #/
            break;
        case #"_interface_numeric":
            maxvalue = attribute[#"max_value"];
            minvalue = attribute[#"min_value"];
            /#
                assert(isint(value) || isfloat(value), "<unknown string>" + attributename + "<unknown string>" + value + "<unknown string>");
            #/
            /#
                assert(!isdefined(maxvalue) && !isdefined(minvalue) || value <= maxvalue && value >= minvalue, "<unknown string>" + value + "<unknown string>" + minvalue + "<unknown string>" + maxvalue + "<unknown string>");
            #/
            break;
        case #"_interface_vector":
            if (isdefined(value)) {
                /#
                    assert(isvec(value), "<unknown string>" + attributename + "<unknown string>" + value + "<unknown string>");
                #/
            }
            break;
        default:
            /#
                assert("<unknown string>" + attribute[#"type"] + "<unknown string>" + attributename + "<unknown string>");
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
        if (isdefined(level.__ai_debuginterface) && level.__ai_debuginterface > 0) {
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
                assert(isarray(entity.__interface), "<unknown string>" + function_9e72a96(entity.archetype) + "<unknown string>" + "<unknown string>");
            #/
            /#
                assert(isarray(level.__ai_interface), "<unknown string>");
            #/
            /#
                assert(isarray(level.__ai_interface[entity.archetype]), "<unknown string>" + function_9e72a96(entity.archetype) + "<unknown string>");
            #/
            /#
                assert(isarray(level.__ai_interface[entity.archetype][attribute]), "<unknown string>" + attribute + "<unknown string>" + function_9e72a96(entity.archetype) + "<unknown string>");
            #/
            /#
                assert(isstring(level.__ai_interface[entity.archetype][attribute][#"type"]), "<unknown string>" + attribute + "<unknown string>");
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
    if (!isdefined(level.__ai_interface)) {
        level.__ai_interface = [];
    }
    if (!isdefined(level.__ai_interface[archetype])) {
        level.__ai_interface[archetype] = [];
    }
}

#namespace ai;

// Namespace ai/ai_interface
// Params 1, eflags: 0x1 linked
// Checksum 0xffd46be1, Offset: 0x880
// Size: 0x2a
function createinterfaceforentity(entity) {
    if (!isdefined(entity.__interface)) {
        entity.__interface = [];
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
    if (!isdefined(entity.__interface[attribute])) {
        return level.__ai_interface[entity.archetype][attribute][#"default_value"];
    }
    return entity.__interface[attribute];
}

// Namespace ai/ai_interface
// Params 2, eflags: 0x1 linked
// Checksum 0x209ea5aa, Offset: 0x950
// Size: 0x86
function hasaiattribute(entity, attribute) {
    return isdefined(entity) && isdefined(attribute) && isdefined(entity.archetype) && isdefined(level.__ai_interface) && isdefined(level.__ai_interface[entity.archetype]) && isdefined(level.__ai_interface[entity.archetype][attribute]);
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
            assert(!isdefined(level.__ai_interface[archetype][attribute]), "<unknown string>" + attribute + "<unknown string>" + archetype + "<unknown string>");
        #/
    #/
    level.__ai_interface[archetype][attribute] = [];
    level.__ai_interface[archetype][attribute][#"callback"] = callbackfunction;
    level.__ai_interface[archetype][attribute][#"default_value"] = defaultvalue;
    level.__ai_interface[archetype][attribute][#"type"] = "_interface_entity";
    /#
        ai_interface::_checkvalue(archetype, attribute, defaultvalue);
    #/
}

// Namespace ai/ai_interface
// Params 5, eflags: 0x1 linked
// Checksum 0x889e916d, Offset: 0xb68
// Size: 0x1f4
function registermatchedinterface(archetype, attribute, defaultvalue, possiblevalues, callbackfunction) {
    /#
        ai_interface::_checkregistrationprerequisites(archetype, attribute, callbackfunction);
        /#
            assert(!isdefined(possiblevalues) || isarray(possiblevalues), "<unknown string>");
        #/
    #/
    ai_interface::_initializelevelinterface(archetype);
    /#
        /#
            assert(!isdefined(level.__ai_interface[archetype][attribute]), "<unknown string>" + attribute + "<unknown string>" + archetype + "<unknown string>");
        #/
    #/
    level.__ai_interface[archetype][attribute] = [];
    level.__ai_interface[archetype][attribute][#"callback"] = callbackfunction;
    level.__ai_interface[archetype][attribute][#"default_value"] = defaultvalue;
    level.__ai_interface[archetype][attribute][#"type"] = "_interface_match";
    level.__ai_interface[archetype][attribute][#"values"] = possiblevalues;
    /#
        ai_interface::_checkvalue(archetype, attribute, defaultvalue);
    #/
}

// Namespace ai/ai_interface
// Params 6, eflags: 0x1 linked
// Checksum 0xc0361b74, Offset: 0xd68
// Size: 0x33c
function registernumericinterface(archetype, attribute, defaultvalue, minimum, maximum, callbackfunction) {
    /#
        ai_interface::_checkregistrationprerequisites(archetype, attribute, callbackfunction);
        /#
            assert(!isdefined(minimum) || isint(minimum) || isfloat(minimum), "<unknown string>");
        #/
        /#
            assert(!isdefined(maximum) || isint(maximum) || isfloat(maximum), "<unknown string>");
        #/
        /#
            assert(!isdefined(minimum) && !isdefined(maximum) || isdefined(minimum) && isdefined(maximum), "<unknown string>");
        #/
        /#
            assert(!isdefined(minimum) && !isdefined(maximum) || minimum <= maximum, "<unknown string>" + attribute + "<unknown string>" + "<unknown string>");
        #/
    #/
    ai_interface::_initializelevelinterface(archetype);
    /#
        /#
            assert(!isdefined(level.__ai_interface[archetype][attribute]), "<unknown string>" + attribute + "<unknown string>" + archetype + "<unknown string>");
        #/
    #/
    level.__ai_interface[archetype][attribute] = [];
    level.__ai_interface[archetype][attribute][#"callback"] = callbackfunction;
    level.__ai_interface[archetype][attribute][#"default_value"] = defaultvalue;
    level.__ai_interface[archetype][attribute][#"max_value"] = maximum;
    level.__ai_interface[archetype][attribute][#"min_value"] = minimum;
    level.__ai_interface[archetype][attribute][#"type"] = "_interface_numeric";
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
            assert(!isdefined(level.__ai_interface[archetype][attribute]), "<unknown string>" + attribute + "<unknown string>" + archetype + "<unknown string>");
        #/
    #/
    level.__ai_interface[archetype][attribute] = [];
    level.__ai_interface[archetype][attribute][#"callback"] = callbackfunction;
    level.__ai_interface[archetype][attribute][#"default_value"] = defaultvalue;
    level.__ai_interface[archetype][attribute][#"type"] = "_interface_vector";
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
    oldvalue = entity.__interface[attribute];
    if (!isdefined(oldvalue)) {
        oldvalue = level.__ai_interface[entity.archetype][attribute][#"default_value"];
    }
    entity.__interface[attribute] = value;
    callback = level.__ai_interface[entity.archetype][attribute][#"callback"];
    if (isfunctionptr(callback)) {
        [[ callback ]](entity, attribute, oldvalue, value);
    }
}

