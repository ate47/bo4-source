// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/postfx_shared.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace gadget_health_regen;

// Namespace gadget_health_regen/gadget_health_regen
// Params 0, eflags: 0x2
// Checksum 0x803579da, Offset: 0x100
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_health_regen", &__init__, undefined, undefined);
}

// Namespace gadget_health_regen/gadget_health_regen
// Params 0, eflags: 0x1 linked
// Checksum 0x3daf790b, Offset: 0x148
// Size: 0xbc
function __init__() {
    clientfield::register("toplayer", "healthregen", 1, 1, "int", &function_31f57700, 0, 1);
    clientfield::register("clientuimodel", "hudItems.healingActive", 1, 1, "int", undefined, 0, 1);
    clientfield::register("clientuimodel", "hudItems.numHealthPickups", 1, 2, "int", undefined, 0, 1);
}

// Namespace gadget_health_regen/gadget_health_regen
// Params 7, eflags: 0x1 linked
// Checksum 0x9cf9b43, Offset: 0x210
// Size: 0x144
function function_31f57700(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (sessionmodeismultiplayergame() || sessionmodeiswarzonegame()) {
        if (newval) {
            if (!(isdefined(self.var_b072e263) && self.var_b072e263)) {
                self.var_e5996046 = self playloopsound(#"hash_390aa7d4252c46b5", 0.25);
                self.var_b072e263 = 1;
                self postfx::playpostfxbundle("pstfx_health_regen");
            }
        } else if (isdefined(self.var_b072e263) && self.var_b072e263) {
            self stoploopsound(self.var_e5996046);
            self.var_b072e263 = undefined;
            self postfx::exitpostfxbundle("pstfx_health_regen");
        }
    }
}

