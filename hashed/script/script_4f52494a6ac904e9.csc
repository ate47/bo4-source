#using scripts\core_common\ai_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace namespace_1d05befd;

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 0, eflags: 0x2
// Checksum 0xe63fdaf9, Offset: 0x268
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_831eacd382054cc", &__init__, undefined, undefined);
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 0, eflags: 0x0
// Checksum 0xc2eca4c5, Offset: 0x2b0
// Size: 0x19c
function __init__() {
    ai::add_archetype_spawn_function(#"zombie", &function_65089f84);
    clientfield::register("actor", "zm_ai/zombie_electric_fx_clientfield", 21000, 1, "int", &zombie_electric_fx, 0, 0);
    clientfield::register("actor", "zombie_electric_burst_clientfield", 21000, 1, "counter", &function_8f477183, 0, 0);
    clientfield::register("actor", "zombie_electric_water_aoe_clientfield", 21000, 1, "counter", &function_c9f98c07, 0, 0);
    clientfield::register("actor", "zombie_electric_burst_stun_friendly_clientfield", 21000, 1, "int", &function_93585307, 0, 0);
    clientfield::register("toplayer", "zombie_electric_burst_postfx_clientfield", 21000, 1, "counter", &function_4d29fadf, 0, 0);
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 1, eflags: 0x4
// Checksum 0x1ae39c85, Offset: 0x458
// Size: 0x32
function private function_65089f84(localclientnum) {
    if (isdefined(self.subarchetype) && self.subarchetype == #"zombie_electric") {
    }
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 7, eflags: 0x4
// Checksum 0x643bb4b, Offset: 0x498
// Size: 0xce
function private zombie_electric_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (isdefined(self)) {
        if (newval) {
            self.var_2e07a8e7 = util::playfxontag(localclientnum, "zm_ai/fx8_elec_zombie_sparky_chest", self, "j_spine4");
            return;
        }
        if (isdefined(self.var_2e07a8e7)) {
            stopfx(localclientnum, self.var_2e07a8e7);
            self.var_2e07a8e7 = undefined;
        }
    }
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 7, eflags: 0x4
// Checksum 0x9f0f1a25, Offset: 0x570
// Size: 0x9c
function private function_8f477183(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (isdefined(self) && newval) {
        playfx(localclientnum, "zm_ai/fx8_elec_zombie_explode", self gettagorigin("j_spine4"));
    }
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 7, eflags: 0x4
// Checksum 0x187f96bd, Offset: 0x618
// Size: 0x9c
function private function_c9f98c07(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (isdefined(self) && newval) {
        playfx(localclientnum, "zm_ai/fx8_elec_zombie_blast_area", self gettagorigin("j_spine4"));
    }
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 7, eflags: 0x4
// Checksum 0x94f3792f, Offset: 0x6c0
// Size: 0x84
function private function_4d29fadf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self util::waittill_dobj(localclientnum);
    if (isdefined(self) && newval) {
        self thread postfx::playpostfxbundle(#"hash_2083fc2cc0fee308");
    }
}

// Namespace namespace_1d05befd/namespace_1d05befd
// Params 7, eflags: 0x4
// Checksum 0x2ecb0b5d, Offset: 0x750
// Size: 0x1ae
function private function_93585307(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (isdefined(self)) {
        if (newval) {
            if (!isdefined(self.var_2e07a8e7)) {
                self.var_2e07a8e7 = util::playfxontag(localclientnum, "zm_weapons/fx8_aat_elec_torso", self, "j_spine4");
            }
            if (!isdefined(self.var_d48778ce)) {
                self.var_d48778ce = util::playfxontag(localclientnum, "zm_weapons/fx8_aat_elec_eye", self, "j_eyeball_le");
            }
            if (!isdefined(self.var_93ee541d)) {
                self.var_93ee541d = self playloopsound("zmb_aat_kilowatt_stunned_lp");
            }
            return;
        }
        if (isdefined(self.var_2e07a8e7)) {
            stopfx(localclientnum, self.var_2e07a8e7);
            self.var_2e07a8e7 = undefined;
        }
        if (isdefined(self.var_d48778ce)) {
            stopfx(localclientnum, self.var_d48778ce);
            self.var_d48778ce = undefined;
        }
        if (isdefined(self.var_93ee541d)) {
            self stoploopsound(self.var_93ee541d);
            self.var_93ee541d = undefined;
        }
    }
}

