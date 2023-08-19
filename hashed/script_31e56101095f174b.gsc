// Atian COD Tools GSC decompiler test
#include script_30e0aa25775a6927;

#namespace planner;

// Namespace planner/planner
// Params 2, eflags: 0x5 linked
// Checksum 0x4ae3e704, Offset: 0xc8
// Size: 0x114
function private _blackboardsapplyundostate(planner, state) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isarray(planner.var_478b95b9));
    #/
    foreach (key, blackboard in planner.var_478b95b9) {
        if (isdefined(state[key])) {
            plannerblackboard::undo(blackboard, state[key]);
        } else {
            key = [];
        }
    }
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0x4a8d5b4, Offset: 0x1e8
// Size: 0x104
function private _blackboardscalculateundostate(planner) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isarray(planner.var_478b95b9));
    #/
    state = [];
    foreach (key, blackboard in planner.var_478b95b9) {
        state[key] = plannerblackboard::getundostacksize(blackboard) - 1;
    }
    return state;
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xcbb984fa, Offset: 0x2f8
// Size: 0xe0
function private _blackboardsreadmode(planner) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isarray(planner.var_478b95b9));
    #/
    foreach (blackboard in planner.var_478b95b9) {
        plannerblackboard::setreadmode(blackboard);
    }
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xf0354b9, Offset: 0x3e0
// Size: 0xe0
function private _blackboardsreadwritemode(planner) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isarray(planner.var_478b95b9));
    #/
    foreach (blackboard in planner.var_478b95b9) {
        plannerblackboard::setreadwritemode(blackboard);
    }
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0x2a554532, Offset: 0x4c8
// Size: 0x52
function private _initializeplannerfunctions(functype) {
    if (!isdefined(level.var_73bd1da2)) {
        level.var_73bd1da2 = [];
    }
    if (!isdefined(level.var_73bd1da2[functype])) {
        level.var_73bd1da2[functype] = [];
    }
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xb54d03a, Offset: 0x528
// Size: 0x1e
function private _plancalculateplanindex(planner) {
    return planner.plan.size - 1;
}

// Namespace planner/planner
// Params 2, eflags: 0x5 linked
// Checksum 0x9c8669c9, Offset: 0x550
// Size: 0x298
function private _planexpandaction(planner, action) {
    planner.api = action.api;
    pixbeginevent(action.api);
    aiprofile_beginentry(action.api);
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isstruct(action));
    #/
    /#
        assert(action.type == "<unknown string>");
    #/
    /#
        assert(isarray(planner.plan));
    #/
    var_76ec5906 = plannerutility::getplanneractionfunctions(action.api);
    var_a59b2ff9 = spawnstruct();
    var_a59b2ff9.name = action.api;
    if (isdefined(var_76ec5906[#"parameterize"])) {
        _blackboardsreadwritemode(planner);
        var_a59b2ff9.params = [[ var_76ec5906[#"parameterize"] ]](planner, action.constants);
        /#
            assert(isstruct(var_a59b2ff9.params), "<unknown string>" + action.api + "<unknown string>");
        #/
        _blackboardsreadmode(planner);
    } else {
        var_a59b2ff9.params = spawnstruct();
    }
    planner.plan[planner.plan.size] = var_a59b2ff9;
    planner.api = undefined;
    aiprofile_endentry();
    pixendevent();
    return 1;
}

// Namespace planner/planner
// Params 2, eflags: 0x5 linked
// Checksum 0x1bddcaca, Offset: 0x7f0
// Size: 0x170
function private _planexpandpostcondition(planner, postcondition) {
    planner.api = postcondition.api;
    pixbeginevent(postcondition.api);
    aiprofile_beginentry(postcondition.api);
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isstruct(postcondition));
    #/
    /#
        assert(postcondition.type == "<unknown string>");
    #/
    _blackboardsreadwritemode(planner);
    var_56c45b85 = plannerutility::getplannerapifunction(postcondition.api);
    [[ var_56c45b85 ]](planner, postcondition.constants);
    _blackboardsreadmode(planner);
    planner.api = undefined;
    aiprofile_endentry();
    pixendevent();
    return 1;
}

// Namespace planner/planner
// Params 2, eflags: 0x5 linked
// Checksum 0xab49430e, Offset: 0x968
// Size: 0x168
function private _planexpandprecondition(planner, precondition) {
    planner.api = precondition.api;
    pixbeginevent(precondition.api);
    aiprofile_beginentry(precondition.api);
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isstruct(precondition));
    #/
    /#
        assert(precondition.type == "<unknown string>");
    #/
    _blackboardsreadmode(planner);
    var_5dfe71df = plannerutility::getplannerapifunction(precondition.api);
    result = [[ var_5dfe71df ]](planner, precondition.constants);
    planner.api = undefined;
    aiprofile_endentry();
    pixendevent();
    return result;
}

// Namespace planner/planner
// Params 3, eflags: 0x5 linked
// Checksum 0xbeeb951f, Offset: 0xad8
// Size: 0x64
function private _planfindnextsibling(planner, var_282d21ef, var_472c6140) {
    /#
        assert(isstruct(planner));
    #/
    return var_282d21ef.node.children[var_472c6140 + 1];
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xb3a94d02, Offset: 0xb48
// Size: 0x44
function private _planstackhasnodes(planner) {
    /#
        assert(isstruct(planner));
    #/
    return planner.var_35cec6a8.size > 0;
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xebd0a9ec, Offset: 0xb98
// Size: 0x8c
function private _planstackpeeknode(planner) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(planner.var_35cec6a8.size > 0);
    #/
    var_2905a911 = planner.var_35cec6a8[planner.var_35cec6a8.size - 1];
    return var_2905a911;
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0x45ad52c3, Offset: 0xc30
// Size: 0xac
function private _planstackpopnode(planner) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(planner.var_35cec6a8.size > 0);
    #/
    var_2905a911 = planner.var_35cec6a8[planner.var_35cec6a8.size - 1];
    planner.var_35cec6a8.size - 1 = [];
    return var_2905a911;
}

// Namespace planner/planner
// Params 3, eflags: 0x5 linked
// Checksum 0x9014b843, Offset: 0xce8
// Size: 0x126
function private _planstackpushnode(planner, node, childindex = undefined) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isstruct(node));
    #/
    var_2905a911 = spawnstruct();
    var_2905a911.childindex = isdefined(childindex) ? childindex : -1;
    var_2905a911.node = node;
    var_2905a911.var_8aab7097 = _plancalculateplanindex(planner);
    var_2905a911.var_ad5606d2 = _blackboardscalculateundostate(planner);
    planner.var_35cec6a8[planner.var_35cec6a8.size] = var_2905a911;
}

// Namespace planner/planner
// Params 3, eflags: 0x5 linked
// Checksum 0x56d87ce2, Offset: 0xe18
// Size: 0x28a
function private _planpushvalidparent(planner, var_61a6896d, result) {
    while (_planstackhasnodes(planner)) {
        var_282d21ef = _planstackpeeknode(planner);
        /#
            assert(isdefined(var_282d21ef));
        #/
        switch (var_282d21ef.node.type) {
        case #"sequence":
            if (result) {
                var_89a9e74 = _planfindnextsibling(planner, var_282d21ef, var_61a6896d.childindex);
                if (isdefined(var_89a9e74)) {
                    _planstackpushnode(planner, var_89a9e74, var_61a6896d.childindex + 1);
                    return 1;
                }
            } else {
                _undoplan(planner, var_282d21ef.var_8aab7097);
                _blackboardsapplyundostate(planner, var_282d21ef.var_ad5606d2);
            }
            _planstackpopnode(planner);
            break;
        case #"selector":
        case #"planner":
            if (!result) {
                _undoplan(planner, var_282d21ef.var_8aab7097);
                _blackboardsapplyundostate(planner, var_282d21ef.var_ad5606d2);
                var_89a9e74 = _planfindnextsibling(planner, var_282d21ef, var_61a6896d.childindex);
                if (isdefined(var_89a9e74)) {
                    _planstackpushnode(planner, var_89a9e74, var_61a6896d.childindex + 1);
                    return 1;
                }
            }
            _planstackpopnode(planner);
            break;
        default:
            _planstackpopnode(planner);
            break;
        }
        var_61a6896d = var_282d21ef;
    }
    return result;
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xa6771835, Offset: 0x10b0
// Size: 0x24a
function private _planprocessstack(planner) {
    /#
        assert(isstruct(planner));
    #/
    result = 1;
    var_d64ac28a = 0;
LOC_00000058:
    while (_planstackhasnodes(planner)) {
        planner.planstarttime = getrealtime();
        var_2905a911 = _planstackpeeknode(planner);
        switch (var_2905a911.node.type) {
        case #"action":
            result = _planexpandaction(planner, var_2905a911.node);
            break;
        case #"postcondition":
            result = _planexpandpostcondition(planner, var_2905a911.node);
            break;
        case #"precondition":
            result = _planexpandprecondition(planner, var_2905a911.node);
            break;
        case #"selector":
        case #"sequence":
        case #"planner":
            _planstackpushnode(planner, var_2905a911.node.children[0], 0);
            continue;
        default:
            /#
                assert(0, "<unknown string>" + var_2905a911.node.type + "<unknown string>");
            #/
            break;
        }
        result = _planpushvalidparent(planner, var_2905a911, result);
    }
}

// Namespace planner/planner
// Params 2, eflags: 0x5 linked
// Checksum 0xd0c58196, Offset: 0x1308
// Size: 0xea
function private _undoplan(planner, var_8aab7097) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isarray(planner.plan));
    #/
    /#
        assert(var_8aab7097 < planner.plan.size);
    #/
    for (index = planner.plan.size - 1; index > var_8aab7097 && index >= 0; index--) {
        index = [];
    }
}

// Namespace planner/planner
// Params 3, eflags: 0x0
// Checksum 0xe5f66d2e, Offset: 0x1400
// Size: 0x58
function addaction(parent, actionname, constants) {
    node = createaction(actionname, constants);
    addchild(parent, node);
    return node;
}

// Namespace planner/planner
// Params 2, eflags: 0x1 linked
// Checksum 0x3539ae9f, Offset: 0x1460
// Size: 0xb2
function addchild(parent, node) {
    /#
        assert(isstruct(parent));
    #/
    /#
        assert(isstruct(node));
    #/
    /#
        assert(isarray(parent.children));
    #/
    parent.children[parent.children.size] = node;
}

// Namespace planner/planner
// Params 2, eflags: 0x0
// Checksum 0xe0d3a5b5, Offset: 0x1520
// Size: 0x2c
function addgoto(parent, var_a89b6e54) {
    addchild(parent, var_a89b6e54);
}

// Namespace planner/planner
// Params 1, eflags: 0x0
// Checksum 0xdb7675aa, Offset: 0x1558
// Size: 0x40
function addselector(parent) {
    node = createselector();
    addchild(parent, node);
    return node;
}

// Namespace planner/planner
// Params 1, eflags: 0x0
// Checksum 0xd28f8660, Offset: 0x15a0
// Size: 0x40
function addsequence(parent) {
    node = createsequence();
    addchild(parent, node);
    return node;
}

// Namespace planner/planner
// Params 3, eflags: 0x0
// Checksum 0xf15278b9, Offset: 0x15e8
// Size: 0x58
function addpostcondition(parent, functionname, constants) {
    node = createpostcondition(functionname, constants);
    addchild(parent, node);
    return node;
}

// Namespace planner/planner
// Params 3, eflags: 0x0
// Checksum 0x1e41c244, Offset: 0x1648
// Size: 0x58
function addprecondition(parent, functionname, constants) {
    node = createprecondition(functionname, constants);
    addchild(parent, node);
    return node;
}

// Namespace planner/planner
// Params 1, eflags: 0x1 linked
// Checksum 0xf72218f5, Offset: 0x16a8
// Size: 0x42
function cancel(planner) {
    /#
        assert(isstruct(planner));
    #/
    planner.cancel = 1;
}

// Namespace planner/planner
// Params 2, eflags: 0x1 linked
// Checksum 0x79c1ab7f, Offset: 0x16f8
// Size: 0xc6
function createaction(actionname, constants) {
    /#
        assert(!isdefined(constants) || isarray(constants));
    #/
    /#
        assert(ishash(actionname));
    #/
    node = spawnstruct();
    node.type = "action";
    node.api = actionname;
    node.constants = constants;
    return node;
}

// Namespace planner/planner
// Params 1, eflags: 0x1 linked
// Checksum 0xe4f462d8, Offset: 0x17c8
// Size: 0xc6
function createplanner(name) {
    /#
        assert(ishash(name));
    #/
    planner = spawnstruct();
    planner.cancel = 0;
    planner.children = [];
    planner.name = name;
    planner.planning = 0;
    planner.type = "planner";
    planner.var_478b95b9 = [];
    planner.var_478b95b9[0] = plannerblackboard::create([]);
    return planner;
}

// Namespace planner/planner
// Params 2, eflags: 0x1 linked
// Checksum 0xed52093f, Offset: 0x1898
// Size: 0x126
function createpostcondition(functionname, constants) {
    /#
        assert(ishash(functionname));
    #/
    /#
        assert(!isdefined(constants) || isarray(constants));
    #/
    /#
        assert(isfunctionptr(plannerutility::getplannerapifunction(functionname)), "<unknown string>" + function_9e72a96(functionname) + "<unknown string>");
    #/
    node = spawnstruct();
    node.type = "postcondition";
    node.api = functionname;
    node.constants = constants;
    return node;
}

// Namespace planner/planner
// Params 2, eflags: 0x1 linked
// Checksum 0x2148a93e, Offset: 0x19c8
// Size: 0x126
function createprecondition(functionname, constants) {
    /#
        assert(ishash(functionname));
    #/
    /#
        assert(!isdefined(constants) || isarray(constants));
    #/
    /#
        assert(isfunctionptr(plannerutility::getplannerapifunction(functionname)), "<unknown string>" + function_9e72a96(functionname) + "<unknown string>");
    #/
    node = spawnstruct();
    node.type = "precondition";
    node.api = functionname;
    node.constants = constants;
    return node;
}

// Namespace planner/planner
// Params 0, eflags: 0x1 linked
// Checksum 0x637c2a73, Offset: 0x1af8
// Size: 0x42
function createselector() {
    node = spawnstruct();
    node.children = [];
    node.type = "selector";
    return node;
}

// Namespace planner/planner
// Params 0, eflags: 0x1 linked
// Checksum 0xfebce52f, Offset: 0x1b48
// Size: 0x42
function createsequence() {
    node = spawnstruct();
    node.children = [];
    node.type = "sequence";
    return node;
}

// Namespace planner/planner
// Params 1, eflags: 0x1 linked
// Checksum 0x19fe12a6, Offset: 0x1b98
// Size: 0xd8
function createsubblackboard(planner) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isarray(planner.var_478b95b9));
    #/
    var_4f6482fb = planner.var_478b95b9.size;
    var_b14008cd = [];
    planner.var_478b95b9[var_4f6482fb] = plannerblackboard::create(var_b14008cd);
    plannerblackboard::setreadwritemode(planner.var_478b95b9[var_4f6482fb]);
    return var_4f6482fb;
}

// Namespace planner/planner
// Params 3, eflags: 0x1 linked
// Checksum 0x92932927, Offset: 0x1c78
// Size: 0x122
function getblackboardattribute(planner, attribute, var_5e5348b5 = 0) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isstring(attribute) || ishash(attribute));
    #/
    /#
        assert(isarray(planner.var_478b95b9));
    #/
    /#
        assert(isstruct(planner.var_478b95b9[var_5e5348b5]));
    #/
    return plannerblackboard::getattribute(planner.var_478b95b9[var_5e5348b5], attribute);
}

// Namespace planner/planner
// Params 2, eflags: 0x0
// Checksum 0xbe7bc252, Offset: 0x1da8
// Size: 0xba
function getblackboardvalues(planner, var_5e5348b5) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isarray(planner.var_478b95b9));
    #/
    /#
        assert(isstruct(planner.var_478b95b9[var_5e5348b5]));
    #/
    return planner.var_478b95b9[var_5e5348b5].values;
}

// Namespace planner/planner
// Params 2, eflags: 0x1 linked
// Checksum 0xa43d50b5, Offset: 0x1e70
// Size: 0xb4
function getsubblackboard(planner, var_5e5348b5) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isarray(planner.var_478b95b9));
    #/
    /#
        assert(var_5e5348b5 > 0 && var_5e5348b5 < planner.var_478b95b9.size);
    #/
    return planner.var_478b95b9[var_5e5348b5];
}

// Namespace planner/planner
// Params 5, eflags: 0x1 linked
// Checksum 0x424ced55, Offset: 0x1f30
// Size: 0x286
function plan(planner, var_f0d11344, maxframetime = 3, starttime = undefined, var_302e19d3 = 0) {
    pixbeginevent(planner.name);
    aiprofile_beginentry(planner.name);
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isarray(var_f0d11344));
    #/
    planner.cancel = 0;
    planner.maxframetime = maxframetime;
    planner.plan = [];
    planner.planning = 1;
    planner.planstarttime = starttime;
    if (!isdefined(planner.planstarttime)) {
        planner.planstarttime = getrealtime();
    }
    if (!var_302e19d3) {
        planner.var_478b95b9 = [];
        planner.var_478b95b9[0] = plannerblackboard::create(var_f0d11344);
    }
    planner.var_35cec6a8 = [];
    _planstackpushnode(planner, planner);
    _planprocessstack(planner);
    planner.var_35cec6a8 = [];
    planner.planning = 0;
    foreach (var_9d76abb7 in planner.var_478b95b9) {
        plannerblackboard::clearundostack(var_9d76abb7);
    }
    aiprofile_endentry();
    pixendevent();
    return planner.plan;
}

// Namespace planner/planner
// Params 2, eflags: 0x0
// Checksum 0xba353c39, Offset: 0x21c0
// Size: 0xdc
function printplanner(planner, filename) {
    /#
        /#
            assert(isstruct(planner));
        #/
        file = openfile(filename, "<unknown string>");
        var_e798f9ca = randomint(2147483647);
        _printplannernode(file, planner, 0, var_e798f9ca);
        _printclearprintid(planner);
        closefile(file);
    #/
}

// Namespace planner/planner
// Params 1, eflags: 0x4
// Checksum 0x4786a905, Offset: 0x22a8
// Size: 0x96
function private _printclearprintid(var_b1b0f655) {
    /#
        var_b1b0f655.var_e798f9ca = undefined;
        if (isdefined(var_b1b0f655.children)) {
            for (index = 0; index < var_b1b0f655.children.size; index++) {
                if (isdefined(var_b1b0f655.children[index].var_e798f9ca)) {
                    _printclearprintid(var_b1b0f655.children[index]);
                }
            }
        }
    #/
}

// Namespace planner/planner
// Params 1, eflags: 0x4
// Checksum 0x863af71d, Offset: 0x2348
// Size: 0x256
function private function_3af5bab0(node) {
    /#
        text = node.type;
        if (isdefined(node.name)) {
            text = text + "<unknown string>" + node.name;
        }
        if (isdefined(node.api)) {
            text = text + "<unknown string>" + node.api;
        }
        if (isdefined(node.constants)) {
            text = text + "<unknown string>";
            first = 1;
            foreach (key, value in node.constants) {
                if (!first) {
                    text = text + "<unknown string>";
                }
                if (isint(value) || isfloat(value)) {
                    text = text + key + "<unknown string>" + value;
                } else if (isstring(value)) {
                    text = text + key + "<unknown string>" + value + "<unknown string>";
                } else if (isarray(value)) {
                    text = text + key + "<unknown string>";
                } else if (!isdefined(value)) {
                    text = text + key + "<unknown string>";
                }
                first = 0;
            }
        }
        if (isdefined(node.name) || isdefined(node.api)) {
            text = text + "<unknown string>";
        }
        return text;
    #/
}

// Namespace planner/planner
// Params 4, eflags: 0x4
// Checksum 0x392185ff, Offset: 0x25a8
// Size: 0x1be
function private _printplannernode(file, var_b1b0f655, indent, var_e798f9ca) {
    /#
        /#
            assert(isstruct(var_b1b0f655));
        #/
        var_5a6f2acb = "<unknown string>";
        for (index = 0; index < indent; index++) {
            var_5a6f2acb = var_5a6f2acb + "<unknown string>";
        }
        text = "<unknown string>";
        if (var_b1b0f655.var_e798f9ca === var_e798f9ca) {
            text = text + "<unknown string>";
            text = text + function_3af5bab0(var_b1b0f655);
            fprintln(file, var_5a6f2acb + text);
            return;
        }
        var_b1b0f655.var_e798f9ca = var_e798f9ca;
        text = function_3af5bab0(var_b1b0f655);
        fprintln(file, var_5a6f2acb + text);
        if (isdefined(var_b1b0f655.children)) {
            for (index = 0; index < var_b1b0f655.children.size; index++) {
                _printplannernode(file, var_b1b0f655.children[index], indent + 1, var_e798f9ca);
            }
        }
    #/
}

// Namespace planner/planner
// Params 5, eflags: 0x1 linked
// Checksum 0xcb1f5636, Offset: 0x2770
// Size: 0x14c
function setblackboardattribute(planner, attribute, value, var_5e5348b5 = 0, readonly = 0) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isstring(attribute) || ishash(attribute));
    #/
    /#
        assert(isarray(planner.var_478b95b9));
    #/
    /#
        assert(isstruct(planner.var_478b95b9[var_5e5348b5]));
    #/
    plannerblackboard::setattribute(planner.var_478b95b9[var_5e5348b5], attribute, value, readonly);
}

// Namespace planner/planner
// Params 1, eflags: 0x1 linked
// Checksum 0x2c749ce5, Offset: 0x28c8
// Size: 0x76
function subblackboardcount(planner) {
    /#
        assert(isstruct(planner));
    #/
    /#
        assert(isarray(planner.var_478b95b9));
    #/
    return planner.var_478b95b9.size - 1;
}

#namespace plannerutility;

// Namespace plannerutility/planner
// Params 1, eflags: 0x1 linked
// Checksum 0x6772921, Offset: 0x2948
// Size: 0x4aa
function createplannerfromasset(assetname) {
    var_499fd284 = gethierarchicaltasknetwork(assetname);
    if (isdefined(var_499fd284) && var_499fd284.nodes.size > 0) {
        var_8f7d8e13 = [];
        if (var_499fd284.nodes.size >= 1) {
            node = var_499fd284.nodes[0];
            var_8f7d8e13[0] = planner::createplanner(node.name);
        }
        for (nodeindex = 1; nodeindex < var_499fd284.nodes.size; nodeindex++) {
            node = var_499fd284.nodes[nodeindex];
            switch (node.type) {
            case #"action":
                var_8f7d8e13[nodeindex] = planner::createaction(node.name, node.constants);
                continue;
            case #"postcondition":
                var_8f7d8e13[nodeindex] = planner::createpostcondition(node.name, node.constants);
                continue;
            case #"precondition":
                var_8f7d8e13[nodeindex] = planner::createprecondition(node.name, node.constants);
                continue;
            case #"planner":
                var_8f7d8e13[nodeindex] = planner::createplanner(node.name);
                continue;
            case #"selector":
                var_8f7d8e13[nodeindex] = planner::createselector();
                continue;
            case #"sequence":
                var_8f7d8e13[nodeindex] = planner::createsequence();
                continue;
            case #"goto":
                var_8f7d8e13[nodeindex] = spawnstruct();
                continue;
            }
        }
        for (nodeindex = 0; nodeindex < var_499fd284.nodes.size; nodeindex++) {
            var_d0615c83 = var_8f7d8e13[nodeindex];
            var_b39c71db = var_499fd284.nodes[nodeindex];
            if (!isdefined(var_b39c71db.childindexes) || var_b39c71db.type == #"goto") {
                continue;
            }
            for (childindex = 0; childindex < var_b39c71db.childindexes.size; childindex++) {
                /#
                    assert(var_b39c71db.childindexes[childindex] < var_8f7d8e13.size);
                #/
                var_eb4974e6 = var_b39c71db.childindexes[childindex];
                var_2198d3d0 = var_8f7d8e13[var_eb4974e6];
                var_db1a2f59 = var_499fd284.nodes[var_eb4974e6];
                while (var_db1a2f59.type === #"goto") {
                    /#
                        assert(isdefined(var_db1a2f59.childindexes));
                    #/
                    /#
                        assert(var_db1a2f59.childindexes.size == 1);
                    #/
                    var_eb4974e6 = var_db1a2f59.childindexes[0];
                    var_2198d3d0 = var_8f7d8e13[var_eb4974e6];
                    var_db1a2f59 = var_499fd284.nodes[var_eb4974e6];
                }
                planner::addchild(var_d0615c83, var_2198d3d0);
            }
        }
        return var_8f7d8e13[0];
    }
}

// Namespace plannerutility/planner
// Params 1, eflags: 0x1 linked
// Checksum 0xaea18e2e, Offset: 0x2e00
// Size: 0xbe
function getplannerapifunction(functionname) {
    /#
        assert(ishash(functionname) && functionname != "<unknown string>", "<unknown string>");
    #/
    /#
        assert(isdefined(level.var_73bd1da2[#"api"][functionname]), "<unknown string>" + function_9e72a96(functionname) + "<unknown string>");
    #/
    return level.var_73bd1da2[#"api"][functionname];
}

// Namespace plannerutility/planner
// Params 1, eflags: 0x1 linked
// Checksum 0x68becd93, Offset: 0x2ec8
// Size: 0xbe
function getplanneractionfunctions(actionname) {
    /#
        assert(ishash(actionname) && actionname != "<unknown string>", "<unknown string>");
    #/
    /#
        assert(isdefined(level.var_73bd1da2[#"action"][actionname]), "<unknown string>" + function_9e72a96(actionname) + "<unknown string>");
    #/
    return level.var_73bd1da2[#"action"][actionname];
}

// Namespace plannerutility/planner
// Params 2, eflags: 0x1 linked
// Checksum 0x9aea3328, Offset: 0x2f90
// Size: 0x13c
function registerplannerapi(functionname, functionptr) {
    /#
        assert(ishash(functionname) && functionname != "<unknown string>", "<unknown string>");
    #/
    /#
        assert(isfunctionptr(functionptr), "<unknown string>" + function_9e72a96(functionname) + "<unknown string>");
    #/
    planner::_initializeplannerfunctions(#"api");
    /#
        assert(!isdefined(level.var_73bd1da2[#"api"][functionname]), "<unknown string>" + functionname + "<unknown string>");
    #/
    level.var_73bd1da2[#"api"][functionname] = functionptr;
}

// Namespace plannerutility/planner
// Params 5, eflags: 0x1 linked
// Checksum 0xc1ae2c31, Offset: 0x30d8
// Size: 0x246
function registerplanneraction(actionname, var_6b9ec33b, var_fe4a8f46, var_2990edef, var_c9501750) {
    /#
        assert(ishash(actionname) && actionname != "<unknown string>", "<unknown string>");
    #/
    planner::_initializeplannerfunctions("Action");
    /#
        assert(!isdefined(level.var_73bd1da2[#"action"][actionname]), "<unknown string>" + function_9e72a96(actionname) + "<unknown string>");
    #/
    level.var_73bd1da2[#"action"][actionname] = [];
    if (isfunctionptr(var_6b9ec33b)) {
        level.var_73bd1da2[#"action"][actionname][#"parameterize"] = var_6b9ec33b;
    }
    if (isfunctionptr(var_fe4a8f46)) {
        level.var_73bd1da2[#"action"][actionname][#"initialize"] = var_fe4a8f46;
    }
    if (isfunctionptr(var_2990edef)) {
        level.var_73bd1da2[#"action"][actionname][#"update"] = var_2990edef;
    }
    if (isfunctionptr(var_c9501750)) {
        level.var_73bd1da2[#"action"][actionname][#"terminate"] = var_c9501750;
    }
}

