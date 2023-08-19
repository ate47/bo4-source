// Atian COD Tools GSC decompiler test
#include scripts/core_common/clientfield_shared.gsc;

#namespace namespace_89cccaf9;

// Namespace namespace_89cccaf9/namespace_fe74fca2
// Params 0, eflags: 0x0
// Checksum 0x22244d81, Offset: 0x70
// Size: 0x1c
function function_a896ef13() {
    /#
        level thread function_44ee3a97();
    #/
}

// Namespace namespace_89cccaf9/namespace_fe74fca2
// Params 0, eflags: 0x0
// Checksum 0x84a7543, Offset: 0x98
// Size: 0x1c4
function function_44ee3a97() {
    /#
        setdvar(#"hash_6d29ea651549630a", "<unknown string>");
        setdvar(#"hash_5046a5532137148d", "<unknown string>");
        bgb_devgui_base = "<unknown string>";
        var_37d32aeb = array(1, 5, 10, 100);
        for (i = 0; i < var_37d32aeb.size; i++) {
            n_amount = var_37d32aeb[i];
            adddebugcommand(bgb_devgui_base + i + "<unknown string>" + n_amount + "<unknown string>" + n_amount + "<unknown string>");
        }
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + 1 + "<unknown string>");
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + 1 + "<unknown string>");
        level thread bgb_devgui_think();
    #/
}

// Namespace namespace_89cccaf9/namespace_fe74fca2
// Params 0, eflags: 0x0
// Checksum 0x95bea787, Offset: 0x268
// Size: 0x1c8
function bgb_devgui_think() {
    /#
        var_7d7c3f7e = 0;
        var_93267d22 = 0;
        for (;;) {
            var_fd1b24be = getdvarstring(#"hash_6d29ea651549630a");
            var_95e3ad39 = getdvarstring(#"hash_5046a5532137148d");
            if (var_fd1b24be != "<unknown string>") {
                var_7d7c3f7e = !var_7d7c3f7e;
                level clientfield::set("<unknown string>", var_7d7c3f7e);
                if (var_7d7c3f7e) {
                    iprintlnbold("<unknown string>");
                } else {
                    iprintlnbold("<unknown string>");
                }
            }
            if (var_95e3ad39 != "<unknown string>") {
                var_93267d22 = !var_93267d22;
                level clientfield::set("<unknown string>", var_93267d22);
                if (var_93267d22) {
                    iprintlnbold("<unknown string>");
                } else {
                    iprintlnbold("<unknown string>");
                }
            }
            setdvar(#"hash_6d29ea651549630a", "<unknown string>");
            setdvar(#"hash_5046a5532137148d", "<unknown string>");
            wait(0.5);
        }
    #/
}

