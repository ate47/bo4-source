// Atian COD Tools GSC decompiler test
#namespace flowgraph;

// Namespace flowgraph/flowgraph_core
// Params 3, eflags: 0x4
// Checksum 0xb8e4830a, Offset: 0x70
// Size: 0x7d2
function private call_func(func, arg_count, args) {
    switch (arg_count) {
    case 0:
        return self [[ func ]]();
        break;
    case 1:
        return self [[ func ]](args[0]);
        break;
    case 2:
        return self [[ func ]](args[0], args[1]);
        break;
    case 3:
        return self [[ func ]](args[0], args[1], args[2]);
        break;
    case 4:
        return self [[ func ]](args[0], args[1], args[2], args[3]);
        break;
    case 5:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4]);
        break;
    case 6:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5]);
        break;
    case 7:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
        break;
    case 8:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
        break;
    case 9:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]);
        break;
    case 10:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
        break;
    case 11:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10]);
        break;
    case 12:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11]);
        break;
    case 13:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12]);
        break;
    case 14:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13]);
        break;
    case 15:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13], args[14]);
        break;
    case 16:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13], args[14], args[15]);
        break;
    default:
        /#
            assertmsg("<unknown string>");
        #/
        break;
    }
}

// Namespace flowgraph/flowgraph_core
// Params 1, eflags: 0x4
// Checksum 0x4434c83e, Offset: 0x850
// Size: 0x3e6
function private evaluate_constant(input_def) {
    /#
        assert(isdefined(input_def.constvalue));
    #/
    val = input_def.constvalue;
    switch (input_def.type) {
    case #"fx":
    case #"float":
    case #"weapon":
    case #"int":
    case #"variant":
    case #"scriptbundle":
    case #"xmodel":
    case #"xanim":
    case #"bool":
    case #"soundalias":
    case #"vector":
    case #"string":
        return val;
    case #"entityarray":
        /#
            assert(isstruct(val));
        #/
        /#
            assert(isdefined(val.value));
        #/
        /#
            assert(isdefined(val.key));
        #/
        return getentarray(val.value, val.key);
    case #"pathnode":
    case #"spawner":
    case #"ai":
    case #"entity":
    case #"vehicle":
        /#
            assert(isstruct(val) || isstring(val));
        #/
        if (isstruct(val)) {
            /#
                assert(isdefined(val.value));
            #/
            /#
                assert(isdefined(val.key));
            #/
            return getent(val.value, val.key);
            goto LOC_00000216;
        }
        /#
            assert(val == "<unknown string>" || val == "<unknown string>");
        #/
        if (val == "self") {
            return self.target;
            goto LOC_00000216;
        }
        return self.target.target;
    case #"struct":
    case #"array":
    case #"class":
    case #"null":
    case #"exec":
    LOC_00000216:
        /#
            assertmsg("<unknown string>");
        #/
        return undefined;
        break;
    }
    /#
        assertmsg("<unknown string>" + input_def.type + "<unknown string>");
    #/
    return undefined;
}

// Namespace flowgraph/flowgraph_core
// Params 2, eflags: 0x4
// Checksum 0x351e4eef, Offset: 0xc40
// Size: 0x88
function private get_node_output_param_index(node_def, param_name) {
    for (i = 0; i < node_def.outputs.size; i++) {
        if (node_def.outputs[i].name == param_name) {
            return i;
        }
    }
    /#
        assertmsg("<unknown string>");
    #/
    return -1;
}

// Namespace flowgraph/flowgraph_core
// Params 2, eflags: 0x4
// Checksum 0xcfed796b, Offset: 0xcd0
// Size: 0x88
function private get_node_input_param_index(node_def, param_name) {
    for (i = 0; i < node_def.inputs.size; i++) {
        if (node_def.inputs[i].name == param_name) {
            return i;
        }
    }
    /#
        assertmsg("<unknown string>");
    #/
    return -1;
}

// Namespace flowgraph/flowgraph_core
// Params 1, eflags: 0x4
// Checksum 0x27a5ac0e, Offset: 0xd60
// Size: 0xf8
function private is_auto_exec_node(node_def) {
    if (node_def.nodeclass == #"event") {
        foreach (input_def in node_def.inputs) {
            if (input_def.type == #"exec") {
                if (isdefined(input_def.connections) && input_def.connections.size > 0) {
                    return 0;
                }
            } else if (!isdefined(input_def.constvalue)) {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace flowgraph/flowgraph_core
// Params 2, eflags: 0x4
// Checksum 0x13c4b0b8, Offset: 0xe60
// Size: 0x466
function private get_graph_def(graph_name, force_refresh = 0) {
    if (!isdefined(level.flowgraphdefs)) {
        level.flowgraphdefs = [];
    }
    if (isdefined(level.flowgraphdefs[graph_name]) && !force_refresh) {
        return level.flowgraphdefs[graph_name];
    }
    graph_def = getflowgraphdef(graph_name);
    indexed_nodes = [];
    foreach (node in graph_def.nodes) {
        indexed_nodes[node.uuid] = node;
    }
    graph_def.nodes = indexed_nodes;
    foreach (wire_def in graph_def.wires) {
        output_node = graph_def.nodes[wire_def.outputnodeuuid];
        /#
            assert(isdefined(output_node), "<unknown string>" + graph_name + "<unknown string>");
        #/
        input_node = graph_def.nodes[wire_def.inputnodeuuid];
        /#
            assert(isdefined(input_node), "<unknown string>" + graph_name + "<unknown string>");
        #/
        output_param_index = get_node_output_param_index(output_node, wire_def.outputparamname);
        input_param_index = get_node_input_param_index(input_node, wire_def.inputparamname);
        output_param = output_node.outputs[output_param_index];
        input_param = input_node.inputs[input_param_index];
        if (!isdefined(output_param.connections)) {
            output_param.connections = [];
        }
        if (!isdefined(input_param.connections)) {
            input_param.connections = [];
        }
        output_link = spawnstruct();
        output_link.node = input_node;
        output_link.paramindex = input_param_index;
        output_param.connections[output_param.connections.size] = output_link;
        input_link = spawnstruct();
        input_link.node = output_node;
        input_link.paramindex = output_param_index;
        input_param.connections[input_param.connections.size] = input_link;
    }
    graph_def.wires = undefined;
    foreach (node in graph_def.nodes) {
        node.is_auto_exec = is_auto_exec_node(node);
    }
    level.flowgraphdefs[graph_name] = graph_def;
    return graph_def;
}

// Namespace flowgraph/flowgraph_core
// Params 0, eflags: 0x4
// Checksum 0x8aef321f, Offset: 0x12d0
// Size: 0x7a
function private collect_outputs() {
    if (self.def.nodeclass == #"data" && self.evaluation_key != self.owner.evaluation_key) {
        self exec();
        self.evaluation_key = self.owner.evaluation_key;
    }
    return self.outputs;
}

// Namespace flowgraph/flowgraph_core
// Params 0, eflags: 0x4
// Checksum 0xdb7c6629, Offset: 0x1358
// Size: 0xe4
function private exec() {
    /#
        level endon(#"flowgraph_mychanges");
    #/
    if (self.def.nodeclass != #"thread") {
        self notify(#"kill_previous_exec");
        self endon(#"kill_previous_exec");
    }
    inputs = self collect_inputs();
    outputs = self call_func(self.def.func, self.def.inputs.size, inputs);
    if (isdefined(outputs)) {
        self kick(outputs);
    }
}

// Namespace flowgraph/flowgraph_core
// Params 0, eflags: 0x4
// Checksum 0x12e0f1a7, Offset: 0x1448
// Size: 0xb4
function private mychanges_watcher() {
    /#
        if (self.target != level) {
            self.target endon(#"death", #"delete");
        }
        level waittill(#"flowgraph_mychanges");
        get_graph_def(self.def.name, 1);
        self.target run({#flowgraph_asset:self.def.name});
    #/
}

// Namespace flowgraph/flowgraph_core
// Params 2, eflags: 0x0
// Checksum 0x46068fb4, Offset: 0x1508
// Size: 0x29a
function kick(outputs = [], block = 0) {
    if (!isarray(outputs)) {
        outputs = array(outputs);
    }
    /#
        assert(isarray(outputs), "<unknown string>" + self.def.uuid + "<unknown string>");
    #/
    /#
        assert(outputs.size == self.def.outputs.size, "<unknown string>" + self.def.uuid + "<unknown string>" + self.def.outputs.size + "<unknown string>");
    #/
    self.outputs = outputs;
    for (i = 0; i < self.def.outputs.size; i++) {
        output_def = self.def.outputs[i];
        if (output_def.type == #"exec" && self.outputs[i] && isdefined(output_def.connections)) {
            foreach (connection_def in output_def.connections) {
                self.owner.evaluation_key++;
                node_inst = self.owner.nodes[connection_def.node.uuid];
                if (block) {
                    node_inst exec();
                } else {
                    node_inst thread exec();
                }
            }
        }
    }
}

// Namespace flowgraph/flowgraph_core
// Params 0, eflags: 0x0
// Checksum 0x71ae6190, Offset: 0x17b0
// Size: 0x300
function collect_inputs() {
    inputs = [];
    input_index = 0;
    foreach (input_def in self.def.inputs) {
        if (isdefined(input_def.constvalue)) {
            inputs[input_index] = self evaluate_constant(input_def);
        } else if (isdefined(input_def.connections)) {
            if (input_def.type == #"exec") {
                result = 0;
                foreach (connection_def in input_def.connections) {
                    node_inst = self.owner.nodes[connection_def.node.uuid];
                    outputs = node_inst collect_outputs();
                    result = result || outputs[connection_def.paramindex];
                }
                inputs[input_index] = result;
            } else {
                /#
                    assert(input_def.connections.size == 1, "<unknown string>" + input_def.name + "<unknown string>");
                #/
                connection_def = input_def.connections[0];
                node_inst = self.owner.nodes[connection_def.node.uuid];
                outputs = node_inst collect_outputs();
                result = outputs[connection_def.paramindex];
                inputs[input_index] = result;
            }
        } else if (input_def.type == #"exec" && self.def.is_auto_exec) {
            inputs[input_index] = 1;
        } else {
            input_index = [];
        }
        input_index++;
    }
    return inputs;
}

// Namespace flowgraph/flowgraph_run
// Params 1, eflags: 0x40
// Checksum 0x54036293, Offset: 0x1ab8
// Size: 0x278
function event_handler[flowgraph_run] run(eventstruct) {
    graph_def = get_graph_def(eventstruct.flowgraph_asset);
    /#
        assert(isdefined(graph_def), "<unknown string>" + eventstruct.flowgraph_asset + "<unknown string>");
    #/
    graph_inst = spawnstruct();
    graph_inst.def = graph_def;
    graph_inst.nodes = [];
    if (isdefined(self)) {
        graph_inst.target = self;
    } else {
        graph_inst.target = level;
    }
    graph_inst.evaluation_key = 0;
    foreach (node_def in graph_def.nodes) {
        node_inst = spawnstruct();
        node_inst.owner = graph_inst;
        node_inst.def = node_def;
        node_inst.target = graph_inst.target;
        node_inst.evaluation_key = 0;
        graph_inst.nodes[node_inst.def.uuid] = node_inst;
    }
    foreach (node_inst in graph_inst.nodes) {
        if (node_inst.def.is_auto_exec) {
            node_inst thread exec();
        }
    }
    /#
        graph_inst thread mychanges_watcher();
    #/
    graph_inst notify(#"flowgraph_run");
}

