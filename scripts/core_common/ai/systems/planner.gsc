// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\systems\planner_blackboard.gsc;

#namespace planner;

// Namespace planner/planner
// Params 2, eflags: 0x5 linked
// Checksum 0x4ae3e704, Offset: 0xc8
// Size: 0x114
function private _blackboardsapplyundostate(planner, state) {
    assert(isstruct(planner));
    assert(isarray(planner.blackboards));
    foreach (key, blackboard in planner.blackboards) {
        if (isdefined(state[key])) {
            plannerblackboard::undo(blackboard, state[key]);
            continue;
        }
        planner.blackboards[key] = undefined;
    }
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0x4a8d5b4, Offset: 0x1e8
// Size: 0x104
function private _blackboardscalculateundostate(planner) {
    assert(isstruct(planner));
    assert(isarray(planner.blackboards));
    state = [];
    foreach (key, blackboard in planner.blackboards) {
        state[key] = plannerblackboard::getundostacksize(blackboard) - 1;
    }
    return state;
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xcbb984fa, Offset: 0x2f8
// Size: 0xe0
function private _blackboardsreadmode(planner) {
    assert(isstruct(planner));
    assert(isarray(planner.blackboards));
    foreach (blackboard in planner.blackboards) {
        plannerblackboard::setreadmode(blackboard);
    }
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xf0354b9, Offset: 0x3e0
// Size: 0xe0
function private _blackboardsreadwritemode(planner) {
    assert(isstruct(planner));
    assert(isarray(planner.blackboards));
    foreach (blackboard in planner.blackboards) {
        plannerblackboard::setreadwritemode(blackboard);
    }
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0x2a554532, Offset: 0x4c8
// Size: 0x52
function private _initializeplannerfunctions(functype) {
    if (!isdefined(level._plannerscriptfunctions)) {
        level._plannerscriptfunctions = [];
    }
    if (!isdefined(level._plannerscriptfunctions[functype])) {
        level._plannerscriptfunctions[functype] = [];
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
    assert(isstruct(planner));
    assert(isstruct(action));
    assert(action.type == "<unknown string>");
    assert(isarray(planner.plan));
    actionfuncs = plannerutility::getplanneractionfunctions(action.api);
    actioninfo = spawnstruct();
    actioninfo.name = action.api;
    if (isdefined(actionfuncs[#"parameterize"])) {
        _blackboardsreadwritemode(planner);
        actioninfo.params = [[ actionfuncs[#"parameterize"] ]](planner, action.constants);
        assert(isstruct(actioninfo.params), "<unknown string>" + action.api + "<unknown string>");
        _blackboardsreadmode(planner);
    } else {
        actioninfo.params = spawnstruct();
    }
    planner.plan[planner.plan.size] = actioninfo;
    planner.api = undefined;
    aiprofile_endentry();
    pixendevent();
    return true;
}

// Namespace planner/planner
// Params 2, eflags: 0x5 linked
// Checksum 0x1bddcaca, Offset: 0x7f0
// Size: 0x170
function private _planexpandpostcondition(planner, postcondition) {
    planner.api = postcondition.api;
    pixbeginevent(postcondition.api);
    aiprofile_beginentry(postcondition.api);
    assert(isstruct(planner));
    assert(isstruct(postcondition));
    assert(postcondition.type == "<unknown string>");
    _blackboardsreadwritemode(planner);
    postconditionfunc = plannerutility::getplannerapifunction(postcondition.api);
    [[ postconditionfunc ]](planner, postcondition.constants);
    _blackboardsreadmode(planner);
    planner.api = undefined;
    aiprofile_endentry();
    pixendevent();
    return true;
}

// Namespace planner/planner
// Params 2, eflags: 0x5 linked
// Checksum 0xab49430e, Offset: 0x968
// Size: 0x168
function private _planexpandprecondition(planner, precondition) {
    planner.api = precondition.api;
    pixbeginevent(precondition.api);
    aiprofile_beginentry(precondition.api);
    assert(isstruct(planner));
    assert(isstruct(precondition));
    assert(precondition.type == "<unknown string>");
    _blackboardsreadmode(planner);
    preconditionfunc = plannerutility::getplannerapifunction(precondition.api);
    result = [[ preconditionfunc ]](planner, precondition.constants);
    planner.api = undefined;
    aiprofile_endentry();
    pixendevent();
    return result;
}

// Namespace planner/planner
// Params 3, eflags: 0x5 linked
// Checksum 0xbeeb951f, Offset: 0xad8
// Size: 0x64
function private _planfindnextsibling(planner, parentnodeentry, currentchildindex) {
    assert(isstruct(planner));
    return parentnodeentry.node.children[currentchildindex + 1];
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xb3a94d02, Offset: 0xb48
// Size: 0x44
function private _planstackhasnodes(planner) {
    assert(isstruct(planner));
    return planner.nodestack.size > 0;
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xebd0a9ec, Offset: 0xb98
// Size: 0x8c
function private _planstackpeeknode(planner) {
    assert(isstruct(planner));
    assert(planner.nodestack.size > 0);
    nodeentry = planner.nodestack[planner.nodestack.size - 1];
    return nodeentry;
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0x45ad52c3, Offset: 0xc30
// Size: 0xac
function private _planstackpopnode(planner) {
    assert(isstruct(planner));
    assert(planner.nodestack.size > 0);
    nodeentry = planner.nodestack[planner.nodestack.size - 1];
    planner.nodestack[planner.nodestack.size - 1] = undefined;
    return nodeentry;
}

// Namespace planner/planner
// Params 3, eflags: 0x5 linked
// Checksum 0x9014b843, Offset: 0xce8
// Size: 0x126
function private _planstackpushnode(planner, node, childindex = undefined) {
    assert(isstruct(planner));
    assert(isstruct(node));
    nodeentry = spawnstruct();
    nodeentry.childindex = isdefined(childindex) ? childindex : -1;
    nodeentry.node = node;
    nodeentry.planindex = _plancalculateplanindex(planner);
    nodeentry.undostate = _blackboardscalculateundostate(planner);
    planner.nodestack[planner.nodestack.size] = nodeentry;
}

// Namespace planner/planner
// Params 3, eflags: 0x5 linked
// Checksum 0x56d87ce2, Offset: 0xe18
// Size: 0x28a
function private _planpushvalidparent(planner, childnodeentry, result) {
    while (_planstackhasnodes(planner)) {
        parentnodeentry = _planstackpeeknode(planner);
        assert(isdefined(parentnodeentry));
        switch (parentnodeentry.node.type) {
        case #"sequence":
            if (result) {
                nextchildnode = _planfindnextsibling(planner, parentnodeentry, childnodeentry.childindex);
                if (isdefined(nextchildnode)) {
                    _planstackpushnode(planner, nextchildnode, childnodeentry.childindex + 1);
                    return 1;
                }
            } else {
                _undoplan(planner, parentnodeentry.planindex);
                _blackboardsapplyundostate(planner, parentnodeentry.undostate);
            }
            _planstackpopnode(planner);
            break;
        case #"selector":
        case #"planner":
            if (!result) {
                _undoplan(planner, parentnodeentry.planindex);
                _blackboardsapplyundostate(planner, parentnodeentry.undostate);
                nextchildnode = _planfindnextsibling(planner, parentnodeentry, childnodeentry.childindex);
                if (isdefined(nextchildnode)) {
                    _planstackpushnode(planner, nextchildnode, childnodeentry.childindex + 1);
                    return 1;
                }
            }
            _planstackpopnode(planner);
            break;
        default:
            _planstackpopnode(planner);
            break;
        }
        childnodeentry = parentnodeentry;
    }
    return result;
}

// Namespace planner/planner
// Params 1, eflags: 0x5 linked
// Checksum 0xa6771835, Offset: 0x10b0
// Size: 0x24a
function private _planprocessstack(planner) {
    assert(isstruct(planner));
    result = 1;
    waitedinthrottle = 0;
    while (_planstackhasnodes(planner)) {
        planner.planstarttime = getrealtime();
        nodeentry = _planstackpeeknode(planner);
        switch (nodeentry.node.type) {
        case #"action":
            result = _planexpandaction(planner, nodeentry.node);
            break;
        case #"postcondition":
            result = _planexpandpostcondition(planner, nodeentry.node);
            break;
        case #"precondition":
            result = _planexpandprecondition(planner, nodeentry.node);
            break;
        case #"selector":
        case #"sequence":
        case #"planner":
            _planstackpushnode(planner, nodeentry.node.children[0], 0);
            continue;
        default:
            assert(0, "<unknown string>" + nodeentry.node.type + "<unknown string>");
            break;
        }
        result = _planpushvalidparent(planner, nodeentry, result);
    }
}

// Namespace planner/planner
// Params 2, eflags: 0x5 linked
// Checksum 0xd0c58196, Offset: 0x1308
// Size: 0xea
function private _undoplan(planner, planindex) {
    assert(isstruct(planner));
    assert(isarray(planner.plan));
    assert(planindex < planner.plan.size);
    for (index = planner.plan.size - 1; index > planindex && index >= 0; index--) {
        planner.plan[index] = undefined;
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
    assert(isstruct(parent));
    assert(isstruct(node));
    assert(isarray(parent.children));
    parent.children[parent.children.size] = node;
}

// Namespace planner/planner
// Params 2, eflags: 0x0
// Checksum 0xe0d3a5b5, Offset: 0x1520
// Size: 0x2c
function addgoto(parent, gotonode) {
    addchild(parent, gotonode);
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
    assert(isstruct(planner));
    planner.cancel = 1;
}

// Namespace planner/planner
// Params 2, eflags: 0x1 linked
// Checksum 0x79c1ab7f, Offset: 0x16f8
// Size: 0xc6
function createaction(actionname, constants) {
    assert(!isdefined(constants) || isarray(constants));
    assert(ishash(actionname));
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
    assert(ishash(name));
    planner = spawnstruct();
    planner.cancel = 0;
    planner.children = [];
    planner.name = name;
    planner.planning = 0;
    planner.type = "planner";
    planner.blackboards = [];
    planner.blackboards[0] = plannerblackboard::create([]);
    return planner;
}

// Namespace planner/planner
// Params 2, eflags: 0x1 linked
// Checksum 0xed52093f, Offset: 0x1898
// Size: 0x126
function createpostcondition(functionname, constants) {
    assert(ishash(functionname));
    assert(!isdefined(constants) || isarray(constants));
    assert(isfunctionptr(plannerutility::getplannerapifunction(functionname)), "<unknown string>" + function_9e72a96(functionname) + "<unknown string>");
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
    assert(ishash(functionname));
    assert(!isdefined(constants) || isarray(constants));
    assert(isfunctionptr(plannerutility::getplannerapifunction(functionname)), "<unknown string>" + function_9e72a96(functionname) + "<unknown string>");
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
    assert(isstruct(planner));
    assert(isarray(planner.blackboards));
    newblackboardindex = planner.blackboards.size;
    defaultvalues = [];
    planner.blackboards[newblackboardindex] = plannerblackboard::create(defaultvalues);
    plannerblackboard::setreadwritemode(planner.blackboards[newblackboardindex]);
    return newblackboardindex;
}

// Namespace planner/planner
// Params 3, eflags: 0x1 linked
// Checksum 0x92932927, Offset: 0x1c78
// Size: 0x122
function getblackboardattribute(planner, attribute, blackboardindex = 0) {
    assert(isstruct(planner));
    assert(isstring(attribute) || ishash(attribute));
    assert(isarray(planner.blackboards));
    assert(isstruct(planner.blackboards[blackboardindex]));
    return plannerblackboard::getattribute(planner.blackboards[blackboardindex], attribute);
}

// Namespace planner/planner
// Params 2, eflags: 0x0
// Checksum 0xbe7bc252, Offset: 0x1da8
// Size: 0xba
function getblackboardvalues(planner, blackboardindex) {
    assert(isstruct(planner));
    assert(isarray(planner.blackboards));
    assert(isstruct(planner.blackboards[blackboardindex]));
    return planner.blackboards[blackboardindex].values;
}

// Namespace planner/planner
// Params 2, eflags: 0x1 linked
// Checksum 0xa43d50b5, Offset: 0x1e70
// Size: 0xb4
function getsubblackboard(planner, blackboardindex) {
    assert(isstruct(planner));
    assert(isarray(planner.blackboards));
    assert(blackboardindex > 0 && blackboardindex < planner.blackboards.size);
    return planner.blackboards[blackboardindex];
}

// Namespace planner/planner
// Params 5, eflags: 0x1 linked
// Checksum 0x424ced55, Offset: 0x1f30
// Size: 0x286
function plan(planner, blackboardvalues, maxframetime = 3, starttime = undefined, var_302e19d3 = 0) {
    pixbeginevent(planner.name);
    aiprofile_beginentry(planner.name);
    assert(isstruct(planner));
    assert(isarray(blackboardvalues));
    planner.cancel = 0;
    planner.maxframetime = maxframetime;
    planner.plan = [];
    planner.planning = 1;
    planner.planstarttime = starttime;
    if (!isdefined(planner.planstarttime)) {
        planner.planstarttime = getrealtime();
    }
    if (!var_302e19d3) {
        planner.blackboards = [];
        planner.blackboards[0] = plannerblackboard::create(blackboardvalues);
    }
    planner.nodestack = [];
    _planstackpushnode(planner, planner);
    _planprocessstack(planner);
    planner.nodestack = [];
    planner.planning = 0;
    foreach (subblackboard in planner.blackboards) {
        plannerblackboard::clearundostack(subblackboard);
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
        assert(isstruct(planner));
        file = openfile(filename, "<unknown string>");
        printid = randomint(2147483647);
        _printplannernode(file, planner, 0, printid);
        _printclearprintid(planner);
        closefile(file);
    #/
}

// Namespace planner/planner
// Params 1, eflags: 0x4
// Checksum 0x4786a905, Offset: 0x22a8
// Size: 0x96
function private _printclearprintid(plannernode) {
    /#
        plannernode.printid = undefined;
        if (isdefined(plannernode.children)) {
            for (index = 0; index < plannernode.children.size; index++) {
                if (isdefined(plannernode.children[index].printid)) {
                    _printclearprintid(plannernode.children[index]);
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
            text += "<unknown string>" + node.name;
        }
        if (isdefined(node.api)) {
            text += "<unknown string>" + node.api;
        }
        if (isdefined(node.constants)) {
            text += "<unknown string>";
            first = 1;
            foreach (key, value in node.constants) {
                if (!first) {
                    text += "<unknown string>";
                }
                if (isint(value) || isfloat(value)) {
                    text += key + "<unknown string>" + value;
                } else if (isstring(value)) {
                    text += key + "<unknown string>" + value + "<unknown string>";
                } else if (isarray(value)) {
                    text += key + "<unknown string>";
                } else if (!isdefined(value)) {
                    text += key + "<unknown string>";
                }
                first = 0;
            }
        }
        if (isdefined(node.name) || isdefined(node.api)) {
            text += "<unknown string>";
        }
        return text;
    #/
}

// Namespace planner/planner
// Params 4, eflags: 0x4
// Checksum 0x392185ff, Offset: 0x25a8
// Size: 0x1be
function private _printplannernode(file, plannernode, indent, printid) {
    /#
        assert(isstruct(plannernode));
        indentspace = "<unknown string>";
        for (index = 0; index < indent; index++) {
            indentspace += "<unknown string>";
        }
        text = "<unknown string>";
        if (plannernode.printid === printid) {
            text += "<unknown string>";
            text += function_3af5bab0(plannernode);
            fprintln(file, indentspace + text);
            return;
        }
        plannernode.printid = printid;
        text = function_3af5bab0(plannernode);
        fprintln(file, indentspace + text);
        if (isdefined(plannernode.children)) {
            for (index = 0; index < plannernode.children.size; index++) {
                _printplannernode(file, plannernode.children[index], indent + 1, printid);
            }
        }
    #/
}

// Namespace planner/planner
// Params 5, eflags: 0x1 linked
// Checksum 0xcb1f5636, Offset: 0x2770
// Size: 0x14c
function setblackboardattribute(planner, attribute, value, blackboardindex = 0, readonly = 0) {
    assert(isstruct(planner));
    assert(isstring(attribute) || ishash(attribute));
    assert(isarray(planner.blackboards));
    assert(isstruct(planner.blackboards[blackboardindex]));
    plannerblackboard::setattribute(planner.blackboards[blackboardindex], attribute, value, readonly);
}

// Namespace planner/planner
// Params 1, eflags: 0x1 linked
// Checksum 0x2c749ce5, Offset: 0x28c8
// Size: 0x76
function subblackboardcount(planner) {
    assert(isstruct(planner));
    assert(isarray(planner.blackboards));
    return planner.blackboards.size - 1;
}

#namespace plannerutility;

// Namespace plannerutility/planner
// Params 1, eflags: 0x1 linked
// Checksum 0x6772921, Offset: 0x2948
// Size: 0x4aa
function createplannerfromasset(assetname) {
    htnasset = gethierarchicaltasknetwork(assetname);
    if (isdefined(htnasset) && htnasset.nodes.size > 0) {
        plannernodes = [];
        if (htnasset.nodes.size >= 1) {
            node = htnasset.nodes[0];
            plannernodes[0] = planner::createplanner(node.name);
        }
        for (nodeindex = 1; nodeindex < htnasset.nodes.size; nodeindex++) {
            node = htnasset.nodes[nodeindex];
            switch (node.type) {
            case #"action":
                plannernodes[nodeindex] = planner::createaction(node.name, node.constants);
                break;
            case #"postcondition":
                plannernodes[nodeindex] = planner::createpostcondition(node.name, node.constants);
                break;
            case #"precondition":
                plannernodes[nodeindex] = planner::createprecondition(node.name, node.constants);
                break;
            case #"planner":
                plannernodes[nodeindex] = planner::createplanner(node.name);
                break;
            case #"selector":
                plannernodes[nodeindex] = planner::createselector();
                break;
            case #"sequence":
                plannernodes[nodeindex] = planner::createsequence();
                break;
            case #"goto":
                plannernodes[nodeindex] = spawnstruct();
                break;
            }
        }
        for (nodeindex = 0; nodeindex < htnasset.nodes.size; nodeindex++) {
            parentnode = plannernodes[nodeindex];
            htnnode = htnasset.nodes[nodeindex];
            if (!isdefined(htnnode.childindexes) || htnnode.type == #"goto") {
                continue;
            }
            for (childindex = 0; childindex < htnnode.childindexes.size; childindex++) {
                assert(htnnode.childindexes[childindex] < plannernodes.size);
                childnum = htnnode.childindexes[childindex];
                childnode = plannernodes[childnum];
                for (htnchildnode = htnasset.nodes[childnum]; htnchildnode.type === #"goto"; htnchildnode = htnasset.nodes[childnum]) {
                    assert(isdefined(htnchildnode.childindexes));
                    assert(htnchildnode.childindexes.size == 1);
                    childnum = htnchildnode.childindexes[0];
                    childnode = plannernodes[childnum];
                }
                planner::addchild(parentnode, childnode);
            }
        }
        return plannernodes[0];
    }
}

// Namespace plannerutility/planner
// Params 1, eflags: 0x1 linked
// Checksum 0xaea18e2e, Offset: 0x2e00
// Size: 0xbe
function getplannerapifunction(functionname) {
    assert(ishash(functionname) && functionname != "<unknown string>", "<unknown string>");
    assert(isdefined(level._plannerscriptfunctions[#"api"][functionname]), "<unknown string>" + function_9e72a96(functionname) + "<unknown string>");
    return level._plannerscriptfunctions[#"api"][functionname];
}

// Namespace plannerutility/planner
// Params 1, eflags: 0x1 linked
// Checksum 0x68becd93, Offset: 0x2ec8
// Size: 0xbe
function getplanneractionfunctions(actionname) {
    assert(ishash(actionname) && actionname != "<unknown string>", "<unknown string>");
    assert(isdefined(level._plannerscriptfunctions[#"action"][actionname]), "<unknown string>" + function_9e72a96(actionname) + "<unknown string>");
    return level._plannerscriptfunctions[#"action"][actionname];
}

// Namespace plannerutility/planner
// Params 2, eflags: 0x1 linked
// Checksum 0x9aea3328, Offset: 0x2f90
// Size: 0x13c
function registerplannerapi(functionname, functionptr) {
    assert(ishash(functionname) && functionname != "<unknown string>", "<unknown string>");
    assert(isfunctionptr(functionptr), "<unknown string>" + function_9e72a96(functionname) + "<unknown string>");
    planner::_initializeplannerfunctions(#"api");
    assert(!isdefined(level._plannerscriptfunctions[#"api"][functionname]), "<unknown string>" + functionname + "<unknown string>");
    level._plannerscriptfunctions[#"api"][functionname] = functionptr;
}

// Namespace plannerutility/planner
// Params 5, eflags: 0x1 linked
// Checksum 0xc1ae2c31, Offset: 0x30d8
// Size: 0x246
function registerplanneraction(actionname, paramfuncptr, initializefuncptr, updatefuncptr, terminatefuncptr) {
    assert(ishash(actionname) && actionname != "<unknown string>", "<unknown string>");
    planner::_initializeplannerfunctions("Action");
    assert(!isdefined(level._plannerscriptfunctions[#"action"][actionname]), "<unknown string>" + function_9e72a96(actionname) + "<unknown string>");
    level._plannerscriptfunctions[#"action"][actionname] = [];
    if (isfunctionptr(paramfuncptr)) {
        level._plannerscriptfunctions[#"action"][actionname][#"parameterize"] = paramfuncptr;
    }
    if (isfunctionptr(initializefuncptr)) {
        level._plannerscriptfunctions[#"action"][actionname][#"initialize"] = initializefuncptr;
    }
    if (isfunctionptr(updatefuncptr)) {
        level._plannerscriptfunctions[#"action"][actionname][#"update"] = updatefuncptr;
    }
    if (isfunctionptr(terminatefuncptr)) {
        level._plannerscriptfunctions[#"action"][actionname][#"terminate"] = terminatefuncptr;
    }
}

