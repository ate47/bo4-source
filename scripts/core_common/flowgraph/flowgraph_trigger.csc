// Atian COD Tools GSC decompiler test
#include scripts/core_common/flowgraph/flowgraph_core.csc;

#namespace flowgraph_trigger;

// Namespace flowgraph_trigger/flowgraph_trigger
// Params 2, eflags: 0x0
// Checksum 0xc9a372e, Offset: 0x70
// Size: 0xa0
function ontriggerentered(x, e_trigger) {
    e_trigger endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = e_trigger waittill(#"trigger");
        e_entity = waitresult.activator;
        self flowgraph::kick(array(1, e_entity));
    }
}

