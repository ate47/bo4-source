// Atian COD Tools GSC decompiler test
#using scripts\weapons\deployable.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace concertina_wire;

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0x2dd80671, Offset: 0x158
// Size: 0x1a4
function init_shared(var_4b51853b) {
    clientfield::register("scriptmover", "concertinaWire_placed", 1, 5, "float", &function_6873a657, 0, 0);
    clientfield::register("scriptmover", "concertinaWireDestroyed", 1, 1, "int", &function_8455c7c0, 0, 0);
    clientfield::register("scriptmover", "concertinaWireDroopyBits", 1, 3, "int", &function_3a927971, 0, 0);
    level.var_87226c31 = spawnstruct();
    level.var_87226c31.bundle = getscriptbundle(var_4b51853b);
    level.var_87226c31.var_3e7344ee = getweapon(#"eq_concertina_wire");
    level.var_87226c31.var_546a220c = "concertina_wire_objective_default";
    level.var_87226c31.var_925bbb2 = [];
    deployable::register_deployable(level.var_87226c31.var_3e7344ee, 1);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x0
// Checksum 0x23fa725b, Offset: 0x308
// Size: 0x76
function function_34a7968c(localclientnum) {
    self notify("c298d246402eaf6");
    self endon("c298d246402eaf6");
    self endon(#"death");
    player = function_5c10bd79(localclientnum);
    player waittill(#"death");
    self.var_ad9b20ac = undefined;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 7, eflags: 0x1 linked
// Checksum 0x4ce3fc4f, Offset: 0x388
// Size: 0x3c
function function_8455c7c0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 7, eflags: 0x1 linked
// Checksum 0x8996e56f, Offset: 0x3d0
// Size: 0x1ac
function function_3a927971(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    if (1 == newval || 3 == newval) {
        self function_d309e55a("wire_10", 1);
        self function_d309e55a("wire_09", 1);
    } else {
        self function_d309e55a("wire_10", 0);
        self function_d309e55a("wire_09", 0);
    }
    if (2 == newval || 3 == newval) {
        self function_d309e55a("wire_02", 1);
        self function_d309e55a("wire_03", 1);
    } else {
        self function_d309e55a("wire_02", 0);
        self function_d309e55a("wire_03", 0);
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 7, eflags: 0x1 linked
// Checksum 0x61772105, Offset: 0x588
// Size: 0x20c
function function_6873a657(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    if (!isdefined(level.var_87226c31) || !isdefined(level.var_87226c31.bundle) || !isdefined(level.var_87226c31.bundle.deployanim)) {
        return;
    }
    self useanimtree("generic");
    var_f56117a2 = 1 - newval;
    if (bnewent || newval == 1) {
        self setanim(level.var_87226c31.bundle.deployanim, 1, var_f56117a2, 0);
    }
    if (bwastimejump) {
        currentanimtime = self getanimtime(level.var_87226c31.bundle.deployanim);
        if (var_f56117a2 < currentanimtime || bnewent) {
            self setanimtime(level.var_87226c31.bundle.deployanim, var_f56117a2);
        }
    } else {
        self setanimtime(level.var_87226c31.bundle.deployanim, var_f56117a2);
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x0
// Checksum 0xcdc64fad, Offset: 0x7a0
// Size: 0x2b2
function function_1c2930c7(localclientnum) {
    player = function_5c10bd79(localclientnum);
    player notify(#"hash_5c7dbac0591cb11f");
    player endon(#"hash_5c7dbac0591cb11f", #"game_ended");
    level endon(#"game_ended");
    level.var_87226c31.var_aef370a9[localclientnum] = 1;
    var_ccfe777 = 0;
    while (1) {
        waitframe(1);
        player = function_5c10bd79(localclientnum);
        if (!isdefined(player)) {
            break;
        }
        var_b43e8dc2 = player function_287dcf4b(level.var_87226c31.bundle.var_63aab046, level.var_87226c31.bundle.maxwidth, 0, 0, level.var_87226c31.var_3e7344ee);
        if (!isdefined(var_b43e8dc2) && !var_ccfe777) {
            var_ccfe777 = 1;
            player function_bf191832(0, (0, 0, 0), (0, 0, 0));
            continue;
        } else if (isdefined(var_b43e8dc2) && var_ccfe777) {
            var_ccfe777 = 0;
        } else if (!isdefined(var_b43e8dc2)) {
            player function_bf191832(0, (0, 0, 0), (0, 0, 0));
            continue;
        }
        if (isdefined(level.var_87226c31.bundle.var_8fa9aac4) ? level.var_87226c31.bundle.var_8fa9aac4 : 0) {
            if (var_b43e8dc2.var_bf9ca9b0) {
                previewmodel = player function_8fb44aff(localclientnum, var_b43e8dc2.origin, var_b43e8dc2.angles, var_b43e8dc2.isvalid, 0, 1);
            } else {
                previewmodel = player function_8fb44aff(localclientnum, var_b43e8dc2.origin, var_b43e8dc2.angles, var_b43e8dc2.isvalid, 2, 3);
            }
        }
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 6, eflags: 0x1 linked
// Checksum 0xf5da2e47, Offset: 0xa60
// Size: 0x54
function function_8fb44aff(localclientnum, origin, angles, isvalid, var_eb65925c, var_4b3e5e0a) {
    self function_bf191832(0, origin, angles);
}

