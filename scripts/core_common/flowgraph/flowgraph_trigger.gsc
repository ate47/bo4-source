// Atian COD Tools GSC decompiler test
#using scripts\core_common\flowgraph\flowgraph_core.gsc;

#namespace flowgraph_trigger;

// Namespace flowgraph_trigger/flowgraph_trigger
// Params 2, eflags: 0x0
// Checksum 0x3dab4c11, Offset: 0x70
// Size: 0x88
function ontriggerentered(x, e_trigger) {
    e_trigger endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = e_trigger waittill(#"trigger");
        self flowgraph::kick(array(1, waitresult.activator));
    }
}

