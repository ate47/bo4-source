#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\killstreaks\planemortar_shared;
#using scripts\core_common\clientfield_shared;

#namespace planemortar;

// Namespace planemortar/planemortar
// Params 0, eflags: 0x2
// Checksum 0xa21df441, Offset: 0x138
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"planemortar", &__init__, undefined, #"killstreaks");
}

// Namespace planemortar/planemortar
// Params 0, eflags: 0x1 linked
// Checksum 0x41aa442b, Offset: 0x188
// Size: 0x7c
function __init__() {
    init_shared();
    level.planemortarexhaustfx = "killstreaks/fx8_mortar_jet_thrusters";
    level.var_913789d7 = "killstreaks/fx8_mortar_jet_contrails";
    clientfield::register("scriptmover", "planemortar_contrail", 1, 1, "int", &planemortar_contrail, 0, 0);
}

// Namespace planemortar/planemortar
// Params 7, eflags: 0x1 linked
// Checksum 0xa72ec4f7, Offset: 0x210
// Size: 0xca
function planemortar_contrail(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    util::waittill_dobj(localclientnum);
    if (newval) {
        self.fx = util::playfxontag(localclientnum, level.planemortarexhaustfx, self, "tag_fx_engine_exhaust_back");
        self.fx = util::playfxontag(localclientnum, level.var_913789d7, self, "tag_body_animate");
    }
}

