// Atian COD Tools GSC decompiler test
#using scripts\core_common\exploder_shared.gsc;

#namespace flowgraph_fx;

// Namespace flowgraph_fx/flowgraph_fx
// Params 5, eflags: 0x0
// Checksum 0xc0c4af23, Offset: 0x70
// Size: 0x50
function playfxatposition(x, fx_effect, v_position, v_forward, v_up) {
    playfx(fx_effect, v_position, v_forward, v_up);
    return true;
}

// Namespace flowgraph_fx/flowgraph_fx
// Params 6, eflags: 0x0
// Checksum 0x2c7d6dd6, Offset: 0xc8
// Size: 0x60
function function_f4373d13(x, fx_effect, v_offset, v_forward, v_up, var_a1a2ff27) {
    playfxoncamera(fx_effect, v_offset, v_forward, v_up, var_a1a2ff27);
    return true;
}

#namespace namespace_84ba1809;

// Namespace namespace_84ba1809/flowgraph_fx
// Params 2, eflags: 0x0
// Checksum 0x3a53782d, Offset: 0x130
// Size: 0x30
function playexploder(x, str_name) {
    exploder::exploder(str_name);
    return true;
}

// Namespace namespace_84ba1809/flowgraph_fx
// Params 2, eflags: 0x0
// Checksum 0xadcb168e, Offset: 0x168
// Size: 0x30
function stopexploder(x, str_name) {
    exploder::stop_exploder(str_name);
    return true;
}

// Namespace namespace_84ba1809/flowgraph_fx
// Params 2, eflags: 0x0
// Checksum 0x2d7cc2ab, Offset: 0x1a0
// Size: 0x30
function killexploder(x, str_name) {
    exploder::kill_exploder(str_name);
    return true;
}

