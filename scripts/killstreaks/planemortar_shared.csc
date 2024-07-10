#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace planemortar;

// Namespace planemortar/planemortar_shared
// Params 0, eflags: 0x0
// Checksum 0x1b6f82e7, Offset: 0x128
// Size: 0x8c
function init_shared() {
    if (!isdefined(level.var_6ea2bb2e)) {
        level.var_6ea2bb2e = {};
        level.planemortarexhaustfx = "killstreaks/fx8_mortar_jet_thrusters";
        level.var_913789d7 = "killstreaks/fx8_mortar_jet_contrails";
        clientfield::register("scriptmover", "planemortar_contrail", 1, 1, "int", &planemortar_contrail, 0, 0);
    }
}

// Namespace planemortar/planemortar_shared
// Params 7, eflags: 0x0
// Checksum 0x127da5dd, Offset: 0x1c0
// Size: 0xca
function planemortar_contrail(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    util::waittill_dobj(localclientnum);
    if (newval) {
        self.fx = util::playfxontag(localclientnum, level.planemortarexhaustfx, self, "tag_fx_engine_exhaust_back");
        self.fx = util::playfxontag(localclientnum, level.var_913789d7, self, "tag_body_animate");
    }
}

