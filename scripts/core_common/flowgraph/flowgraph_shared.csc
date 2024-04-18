// Atian COD Tools GSC decompiler test
#using scripts\core_common\flowgraph\flowgraph_core.csc;

#namespace flowgraph_logic;

// Namespace flowgraph_logic/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0x2c342ede, Offset: 0x70
// Size: 0x2a
function iffunc(x, b) {
    return array(b, !b);
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 3, eflags: 0x0
// Checksum 0xb4e595c3, Offset: 0xa8
// Size: 0x4a
function orfunc(x, b_a, b_b) {
    return array(b_a || b_b, !(b_a || b_b));
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 3, eflags: 0x0
// Checksum 0x8cb4ca75, Offset: 0x100
// Size: 0x4a
function andfunc(x, b_a, b_b) {
    return array(b_a && b_b, !(b_a && b_b));
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xc340ad2d, Offset: 0x158
// Size: 0x12
function notfunc(b_value) {
    return !b_value;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0x2b4caad2, Offset: 0x178
// Size: 0x1e
function lessthan(var_a, var_b) {
    return var_a < var_b;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0x3b1700ee, Offset: 0x1a0
// Size: 0x1e
function function_b457969e(var_a, var_b) {
    return var_a <= var_b;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0x90703674, Offset: 0x1c8
// Size: 0x1e
function greaterthan(var_a, var_b) {
    return var_a > var_b;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0xdb786be8, Offset: 0x1f0
// Size: 0x1e
function function_3743e19e(var_a, var_b) {
    return var_a >= var_b;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0xff19725a, Offset: 0x218
// Size: 0x1e
function equal(var_a, var_b) {
    return var_a == var_b;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 3, eflags: 0x0
// Checksum 0xba4b6669, Offset: 0x240
// Size: 0xa4
function function_5cb6d7c8(x, b_1, b_2) {
    if (isdefined(b_1) && b_1) {
        self flowgraph::kick(array(undefined, 1, 0), 1);
        return;
    }
    if (isdefined(b_2) && b_2) {
        self flowgraph::kick(array(undefined, 0, 1), 1);
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 4, eflags: 0x0
// Checksum 0x913d2ecc, Offset: 0x2f0
// Size: 0xfc
function function_4902305f(x, b_1, b_2, b_3) {
    if (isdefined(b_1) && b_1) {
        self flowgraph::kick(array(undefined, 1, 0, 0), 1);
        return;
    }
    if (isdefined(b_2) && b_2) {
        self flowgraph::kick(array(undefined, 0, 1, 0), 1);
        return;
    }
    if (isdefined(b_3) && b_3) {
        self flowgraph::kick(array(undefined, 0, 0, 1), 1);
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 5, eflags: 0x0
// Checksum 0x1a8510db, Offset: 0x3f8
// Size: 0x14c
function function_3b225c4(x, b_1, b_2, b_3, b_4) {
    if (isdefined(b_1) && b_1) {
        self flowgraph::kick(array(undefined, 1, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_2) && b_2) {
        self flowgraph::kick(array(undefined, 0, 1, 0, 0), 1);
        return;
    }
    if (isdefined(b_3) && b_3) {
        self flowgraph::kick(array(undefined, 0, 0, 1, 0), 1);
        return;
    }
    if (isdefined(b_4) && b_4) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 1), 1);
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 6, eflags: 0x0
// Checksum 0x8deeb39a, Offset: 0x550
// Size: 0x1bc
function function_f82f0ebe(x, b_1, b_2, b_3, b_4, b_5) {
    if (isdefined(b_1) && b_1) {
        self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_2) && b_2) {
        self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_3) && b_3) {
        self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0), 1);
        return;
    }
    if (isdefined(b_4) && b_4) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0), 1);
        return;
    }
    if (isdefined(b_5) && b_5) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1), 1);
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 7, eflags: 0x0
// Checksum 0xe3bea50d, Offset: 0x718
// Size: 0x214
function function_3f431ce5(x, b_1, b_2, b_3, b_4, b_5, b_6) {
    if (isdefined(b_1) && b_1) {
        self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_2) && b_2) {
        self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_3) && b_3) {
        self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_4) && b_4) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0), 1);
        return;
    }
    if (isdefined(b_5) && b_5) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0), 1);
        return;
    }
    if (isdefined(b_6) && b_6) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1), 1);
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 8, eflags: 0x0
// Checksum 0x8c4d92b8, Offset: 0x938
// Size: 0x274
function function_2d817962(x, b_1, b_2, b_3, b_4, b_5, b_6, b_7) {
    if (isdefined(b_1) && b_1) {
        self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_2) && b_2) {
        self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_3) && b_3) {
        self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_4) && b_4) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_5) && b_5) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0, 0), 1);
        return;
    }
    if (isdefined(b_6) && b_6) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1, 0), 1);
        return;
    }
    if (isdefined(b_7) && b_7) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 1), 1);
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 9, eflags: 0x0
// Checksum 0x87a820c2, Offset: 0xbb8
// Size: 0x2cc
function function_c8fcb052(x, b_1, b_2, b_3, b_4, b_5, b_6, b_7, b_8) {
    if (isdefined(b_1) && b_1) {
        self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_2) && b_2) {
        self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_3) && b_3) {
        self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_4) && b_4) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_5) && b_5) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0, 0, 0), 1);
        return;
    }
    if (isdefined(b_6) && b_6) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1, 0, 0), 1);
        return;
    }
    if (isdefined(b_7) && b_7) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 1, 0), 1);
        return;
    }
    if (isdefined(b_8) && b_8) {
        self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 0, 1), 1);
    }
}

#namespace flowgraph_loops;

// Namespace flowgraph_loops/flowgraph_shared
// Params 3, eflags: 0x0
// Checksum 0x411f429b, Offset: 0xe90
// Size: 0x9e
function forloop(x, i_begin, i_end) {
    i_step = 1;
    if (i_end < i_begin) {
        i_step = -1;
    }
    for (i = i_begin; i != i_end; i += i_step) {
        self flowgraph::kick(array(1, i), 1);
    }
}

// Namespace flowgraph_loops/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0x5914fc50, Offset: 0xf38
// Size: 0xa0
function foreachloop(x, a_items) {
    foreach (item in a_items) {
        self flowgraph::kick(array(1, item), 1);
    }
}

// Namespace flowgraph_loops/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0xa7824d6d, Offset: 0xfe0
// Size: 0x70
function whileloop(x, b_condition) {
    while (b_condition) {
        self flowgraph::kick(1, 1);
        inputs = self flowgraph::collect_inputs();
        b_condition = inputs[1];
    }
}

#namespace flowgraph_sequence;

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x970f8c0f, Offset: 0x1058
// Size: 0x6c
function sequence2(x) {
    self flowgraph::kick(array(1, 0), 1);
    self flowgraph::kick(array(0, 1), 1);
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xee506965, Offset: 0x10d0
// Size: 0x9c
function sequence3(x) {
    self flowgraph::kick(array(1, 0, 0), 1);
    self flowgraph::kick(array(0, 1, 0), 1);
    self flowgraph::kick(array(0, 0, 1), 1);
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x87cf5492, Offset: 0x1178
// Size: 0xcc
function sequence4(x) {
    self flowgraph::kick(array(1, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 1, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 1, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 1), 1);
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xa69b56d4, Offset: 0x1250
// Size: 0x124
function sequence5(x) {
    self flowgraph::kick(array(1, 0, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 1, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 1, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 1, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 0, 1), 1);
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x241c8235, Offset: 0x1380
// Size: 0x15c
function sequence6(x) {
    self flowgraph::kick(array(1, 0, 0, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 1, 0, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 1, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 1, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 0, 1, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 0, 0, 1), 1);
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xe486625c, Offset: 0x14e8
// Size: 0x194
function sequence7(x) {
    self flowgraph::kick(array(1, 0, 0, 0, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 1, 0, 0, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 1, 0, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 1, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 0, 1, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 0, 0, 1, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 1), 1);
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x3703391d, Offset: 0x1688
// Size: 0x1cc
function sequence8(x) {
    self flowgraph::kick(array(1, 0, 0, 0, 0, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 1, 0, 0, 0, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 1, 0, 0, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 1, 0, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 0, 1, 0, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 0, 0, 1, 0, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 1, 0), 1);
    self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 0, 1), 1);
}

#namespace flowgraph_util;

// Namespace flowgraph_util/flowgraph_shared
// Params 0, eflags: 0x0
// Checksum 0x7232357a, Offset: 0x1860
// Size: 0x24
function onflowgraphrun() {
    self.owner waittill(#"flowgraph_run");
    return true;
}

// Namespace flowgraph_util/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0xaaabdbfc, Offset: 0x1890
// Size: 0x1e
function waitfunc(x, f_seconds) {
    wait(f_seconds);
    return true;
}

// Namespace flowgraph_util/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x244e7e3a, Offset: 0x18b8
// Size: 0x10
function createthread(x) {
    return true;
}

#namespace flowgraph_random;

// Namespace flowgraph_random/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0xb3b1c3b8, Offset: 0x18d0
// Size: 0x2a
function randomfloatinrangefunc(f_min, f_max) {
    return randomfloatrange(f_min, f_max);
}

// Namespace flowgraph_random/flowgraph_shared
// Params 0, eflags: 0x0
// Checksum 0xfe78589a, Offset: 0x1908
// Size: 0x5a
function randomunitvector() {
    return vectornormalize((randomfloat(1), randomfloat(1), randomfloat(1)));
}

#namespace flowgraph_math;

// Namespace flowgraph_math/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0x780e360f, Offset: 0x1970
// Size: 0x1e
function multiply(var_1, var_2) {
    return var_1 * var_1;
}

// Namespace flowgraph_math/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0x9a70ee6, Offset: 0x1998
// Size: 0x1e
function divide(var_1, var_2) {
    return var_1 / var_2;
}

// Namespace flowgraph_math/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0xfa678c11, Offset: 0x19c0
// Size: 0x1e
function add(var_1, var_2) {
    return var_1 + var_2;
}

// Namespace flowgraph_math/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0xdb786a7c, Offset: 0x19e8
// Size: 0x1e
function subtract(var_1, var_2) {
    return var_1 - var_2;
}

// Namespace flowgraph_math/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x82a385e3, Offset: 0x1a10
// Size: 0x16
function negate(v) {
    return v * -1;
}

// Namespace flowgraph_math/flowgraph_shared
// Params 2, eflags: 0x0
// Checksum 0x86aeb7c3, Offset: 0x1a30
// Size: 0x2a
function vectordotfunc(v_1, v_2) {
    return vectordot(v_1, v_2);
}

#namespace flowgraph_lighting;

// Namespace flowgraph_lighting/flowgraph_shared
// Params 0, eflags: 0x0
// Checksum 0xe6db1724, Offset: 0x1a68
// Size: 0x12
function getlightingstatefunc() {
    return getlightingstate();
}

#namespace flowgraph_level;

// Namespace flowgraph_level/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x8b585807, Offset: 0x1a88
// Size: 0x18
function function_35dc468d(str_field) {
    return level.(str_field);
}

// Namespace flowgraph_level/flowgraph_shared
// Params 3, eflags: 0x0
// Checksum 0x782cffd9, Offset: 0x1aa8
// Size: 0x32
function function_f9d5c4b0(x, str_field, var_value) {
    level.(str_field) = var_value;
    return true;
}

#namespace namespace_22752a75;

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xbfefbc26, Offset: 0x1ae8
// Size: 0x10
function function_8892c7a6(i_value) {
    return i_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x5f390463, Offset: 0x1b00
// Size: 0x10
function function_28c4ae67(var_2eb63fd3) {
    return var_2eb63fd3;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xe1dbb817, Offset: 0x1b18
// Size: 0x10
function function_36bf9c6c(b_value) {
    return b_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xeca19849, Offset: 0x1b30
// Size: 0x10
function function_fe4cf085(str_value) {
    return str_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x1b79fea8, Offset: 0x1b48
// Size: 0x10
function function_3ece9d7e(var_4cb0cd3c) {
    return var_4cb0cd3c;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xbbf65583, Offset: 0x1b60
// Size: 0x10
function function_68a5d644(var_30e9e231) {
    return var_30e9e231;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xe79173b2, Offset: 0x1b78
// Size: 0x10
function vectorconstant(v_value) {
    return v_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x40e0c1b1, Offset: 0x1b90
// Size: 0x10
function pathnodeconstant(var_f4af12cc) {
    return var_f4af12cc;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x11045df2, Offset: 0x1ba8
// Size: 0x10
function function_9ef80b8b(e_value) {
    return e_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xf7450190, Offset: 0x1bc0
// Size: 0x10
function introduction_minigun(ai_value) {
    return ai_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x7fe80736, Offset: 0x1bd8
// Size: 0x10
function function_513da14e(var_162b6305) {
    return var_162b6305;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x4f0ef050, Offset: 0x1bf0
// Size: 0x10
function function_7cbb60c3(var_e7355b57) {
    return var_e7355b57;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xb21e2110, Offset: 0x1c08
// Size: 0x10
function function_f2357a4d(var_52d6c2bd) {
    return var_52d6c2bd;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x5d1a1d6e, Offset: 0x1c20
// Size: 0x10
function function_79f7d941(var_value) {
    return var_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xde6ba660, Offset: 0x1c38
// Size: 0x10
function function_fdafe394(var_e477c3b) {
    return var_e477c3b;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xe1bb3362, Offset: 0x1c50
// Size: 0x10
function function_28848a6a(var_6b11d5a) {
    return var_6b11d5a;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x44badfd1, Offset: 0x1c68
// Size: 0x10
function function_8f5a9b3e(fx_value) {
    return fx_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0x17120a3c, Offset: 0x1c80
// Size: 0x10
function function_a5f771ce(var_e0bddaf5) {
    return var_e0bddaf5;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1, eflags: 0x0
// Checksum 0xa80fa1ec, Offset: 0x1c98
// Size: 0x10
function function_527fa489(var_5ab747e5) {
    return var_5ab747e5;
}

