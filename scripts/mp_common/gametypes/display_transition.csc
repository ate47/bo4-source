// Atian COD Tools GSC decompiler test
#include scripts/core_common/postfx_shared.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace display_transition;

// Namespace display_transition/display_transition
// Params 0, eflags: 0x1 linked
// Checksum 0x3e444534, Offset: 0xa8
// Size: 0x14
function init_shared() {
    registerclientfields();
}

// Namespace display_transition/display_transition
// Params 0, eflags: 0x5 linked
// Checksum 0x44415d71, Offset: 0xc8
// Size: 0x5c
function private registerclientfields() {
    if (sessionmodeiswarzonegame()) {
        clientfield::register("clientuimodel", "eliminated_postfx", 12000, 1, "int", &function_c73ec9a, 0, 0);
    }
}

// Namespace display_transition/display_transition
// Params 7, eflags: 0x1 linked
// Checksum 0x3b512973, Offset: 0x130
// Size: 0xd4
function function_c73ec9a(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    isplaying = postfx::function_556665f2(#"hash_1e4c3120a3e08628");
    if (newval == 1) {
        if (!isplaying) {
            self codeplaypostfxbundle(#"hash_1e4c3120a3e08628");
        }
    } else if (newval == 0) {
        if (isplaying) {
            self postfx::stoppostfxbundle(#"hash_1e4c3120a3e08628");
        }
    }
}

