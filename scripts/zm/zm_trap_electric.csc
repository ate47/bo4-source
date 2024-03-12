// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_trap_electric;

// Namespace zm_trap_electric/zm_trap_electric
// Params 0, eflags: 0x2
// Checksum 0xc79c188c, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trap_electric", &__init__, undefined, undefined);
}

// Namespace zm_trap_electric/zm_trap_electric
// Params 0, eflags: 0x1 linked
// Checksum 0x55f8272b, Offset: 0x160
// Size: 0x172
function __init__() {
    a_traps = struct::get_array("trap_electric", "targetname");
    foreach (trap in a_traps) {
        clientfield::register("world", trap.script_noteworthy, 1, 1, "int", &trap_fx_monitor, 0, 0);
    }
    clientfield::register("actor", "electrocute_ai_fx", 1, 1, "int", &electrocute_ai, 0, 0);
    level._effect[#"hash_6a97de5de4ae14a"] = #"zombie/fx_tesla_shock_zmb";
    level._effect[#"hash_21e93d9faa37cad"] = #"zombie/fx_tesla_shock_eyes_zmb";
}

// Namespace zm_trap_electric/zm_trap_electric
// Params 7, eflags: 0x1 linked
// Checksum 0x743b8674, Offset: 0x2e0
// Size: 0x8c
function trap_fx_monitor(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    exploder_name = "trap_electric_" + fieldname;
    if (newval) {
        exploder::exploder(exploder_name);
        return;
    }
    exploder::stop_exploder(exploder_name);
}

// Namespace zm_trap_electric/zm_trap_electric
// Params 7, eflags: 0x1 linked
// Checksum 0xf1227c65, Offset: 0x378
// Size: 0x1fe
function electrocute_ai(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        str_tag = "J_SpineUpper";
        if (isdefined(self.var_c8b0b5be)) {
            str_tag = self.var_c8b0b5be;
        } else if (self.archetype === #"zombie_dog") {
            str_tag = "J_Spine1";
        }
        self.n_shock_eyes_fx = util::playfxontag(localclientnum, level._effect[#"hash_21e93d9faa37cad"], self, "J_Eyeball_LE");
        if (isdefined(self) && isdefined(self.n_shock_eyes_fx)) {
            setfxignorepause(localclientnum, self.n_shock_eyes_fx, 1);
        }
        self.n_shock_fx = util::playfxontag(localclientnum, level._effect[#"hash_6a97de5de4ae14a"], self, str_tag);
        if (isdefined(self) && isdefined(self.n_shock_eyes_fx)) {
            setfxignorepause(localclientnum, self.n_shock_fx, 1);
        }
        return;
    }
    if (isdefined(self.n_shock_eyes_fx)) {
        deletefx(localclientnum, self.n_shock_eyes_fx, 1);
        self.n_shock_eyes_fx = undefined;
    }
    if (isdefined(self.n_shock_fx)) {
        deletefx(localclientnum, self.n_shock_fx, 1);
        self.n_shock_fx = undefined;
    }
}

