// Atian COD Tools GSC decompiler test
#using scripts\zm_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_aoe;

// Namespace zm_aoe
// Method(s) 2 Total 2
class class_698343df {

    // Namespace class_698343df/zm_aoe
    // Params 0, eflags: 0x89 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x1b0
    // Size: 0x4
    __constructor() {
        
    }

    // Namespace class_698343df/zm_aoe
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x1c0
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace zm_aoe/zm_aoe
// Params 0, eflags: 0x2
// Checksum 0x40973cbf, Offset: 0x160
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_aoe", &__init__, &__main__, undefined);
}

// Namespace zm_aoe/zm_aoe
// Params 0, eflags: 0x1 linked
// Checksum 0x5b471977, Offset: 0x260
// Size: 0xb4
function __init__() {
    clientfield::register("scriptmover", "aoe_state", 1, getminbitcountfornum(4), "int", &function_dcc24343, 0, 0);
    clientfield::register("scriptmover", "aoe_id", 1, getminbitcountfornum(8), "int", &function_6bcf2a61, 0, 0);
}

// Namespace zm_aoe/zm_aoe
// Params 0, eflags: 0x5 linked
// Checksum 0x606eb934, Offset: 0x320
// Size: 0x11c
function private __main__() {
    function_15dea507(1, "zm_aoe_spear", "zm_aoe_spear");
    function_15dea507(2, "zm_aoe_spear_small", "zm_aoe_spear_small");
    function_15dea507(3, "zm_aoe_spear_big", "zm_aoe_spear_big");
    function_15dea507(4, "zm_aoe_strafe_storm", "zm_aoe_strafe_storm");
    function_15dea507(5, "zm_aoe_chaos_bolt", "zm_aoe_chaos_bolt");
    function_15dea507(6, "zm_aoe_chaos_bolt_2", "zm_aoe_chaos_bolt_2");
    function_15dea507(7, "zm_aoe_chaos_bolt_annihilate", "zm_aoe_chaos_bolt_annihilate");
}

// Namespace zm_aoe/zm_aoe
// Params 1, eflags: 0x5 linked
// Checksum 0x43a774df, Offset: 0x448
// Size: 0xec
function private function_e969e75(aoeid) {
    /#
        assert(isdefined(level.var_400ae143));
    #/
    if (!isdefined(level.var_400ae143)) {
        level.var_400ae143 = [];
    }
    foreach (var_46f1b5eb in level.var_400ae143) {
        /#
            assert(isdefined(var_46f1b5eb.aoeid));
        #/
        if (var_46f1b5eb.aoeid == aoeid) {
            return var_46f1b5eb;
        }
    }
    return undefined;
}

// Namespace zm_aoe/zm_aoe
// Params 3, eflags: 0x1 linked
// Checksum 0xf7181c5f, Offset: 0x540
// Size: 0x246
function function_15dea507(aoeid, type, var_5ff737c1) {
    /#
        assert(isdefined(var_5ff737c1));
    #/
    var_6ec6e01 = getscriptbundle(var_5ff737c1);
    if (!isdefined(var_6ec6e01)) {
        return;
    }
    if (!isdefined(level.var_400ae143)) {
        level.var_400ae143 = [];
    }
    arraykeys = getarraykeys(level.var_400ae143);
    /#
        assert(!isinarray(arraykeys, hash(type)));
    #/
    var_46f1b5eb = new class_698343df();
    level.var_400ae143[type] = var_46f1b5eb;
    var_46f1b5eb.startfx = var_6ec6e01.start_effect;
    var_46f1b5eb.endfx = var_6ec6e01.end_effect;
    var_46f1b5eb.loopfx = var_6ec6e01.loop_effect;
    var_46f1b5eb.startsound = var_6ec6e01.var_e41627fe;
    var_46f1b5eb.endsound = var_6ec6e01.var_99ec7d60;
    var_46f1b5eb.loopsound = var_6ec6e01.var_1ee49376;
    var_46f1b5eb.startrumble = var_6ec6e01.startrumble;
    var_46f1b5eb.endrumble = var_6ec6e01.endrumble;
    var_46f1b5eb.var_a8609f98 = var_6ec6e01.var_a8609f98;
    var_46f1b5eb.earthquakescale = var_6ec6e01.earthquakescale;
    var_46f1b5eb.earthquakeduration = var_6ec6e01.earthquakeduration;
    var_46f1b5eb.effectradius = var_6ec6e01.effectradius;
    var_46f1b5eb.aoeid = aoeid;
}

// Namespace zm_aoe/zm_aoe
// Params 7, eflags: 0x5 linked
// Checksum 0xfe437ba8, Offset: 0x790
// Size: 0x3fc
function private function_dcc24343(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (!isdefined(self.aoeid)) {
        return;
    }
    player = function_5c10bd79(localclientnum);
    aoeorigin = self.origin;
    distsq = distancesquared(player.origin, aoeorigin);
    var_46f1b5eb = function_e969e75(self.aoeid);
    if (!isdefined(var_46f1b5eb)) {
        return;
    }
    if (newval == 1) {
        if (isdefined(var_46f1b5eb.startfx)) {
            playfx(localclientnum, var_46f1b5eb.startfx, self.origin, (0, 0, 1));
        }
        if (isdefined(var_46f1b5eb.startsound)) {
            playsound(localclientnum, var_46f1b5eb.startsound, self.origin);
        }
        if (isdefined(var_46f1b5eb.effectradius) && distsq <= var_46f1b5eb.effectradius * var_46f1b5eb.effectradius) {
            if (isdefined(var_46f1b5eb.earthquakescale)) {
                earthquake(localclientnum, var_46f1b5eb.earthquakescale, var_46f1b5eb.earthquakeduration, self.origin, var_46f1b5eb.effectradius);
            }
            if (isdefined(var_46f1b5eb.startrumble)) {
                function_36e4ebd4(localclientnum, var_46f1b5eb.startrumble);
            }
        }
        return;
    }
    if (newval == 2) {
        if (isdefined(var_46f1b5eb.loopfx)) {
            self.aoefx = playfx(localclientnum, var_46f1b5eb.loopfx, self.origin, (0, 0, 1));
        }
        if (isdefined(var_46f1b5eb.loopsound)) {
            self.var_e0952422 = self playloopsound(var_46f1b5eb.loopsound);
        }
        return;
    }
    if (newval == 3 || newval == 4) {
        if (isdefined(self.aoefx)) {
            stopfx(localclientnum, self.aoefx);
        }
        if (isdefined(self.var_e0952422)) {
            self stoploopsound(self.var_e0952422);
            self.var_e0952422 = undefined;
        }
        if (isdefined(var_46f1b5eb.endfx)) {
            playfx(localclientnum, var_46f1b5eb.endfx, self.origin, (0, 0, 1));
        }
        if (isdefined(var_46f1b5eb.endsound)) {
            playsound(localclientnum, var_46f1b5eb.endsound, self.origin);
        }
        if (isdefined(var_46f1b5eb.effectradius) && distsq <= var_46f1b5eb.effectradius * var_46f1b5eb.effectradius) {
            if (isdefined(var_46f1b5eb.startrumble)) {
                function_36e4ebd4(localclientnum, var_46f1b5eb.endrumble);
            }
        }
    }
}

// Namespace zm_aoe/zm_aoe
// Params 7, eflags: 0x5 linked
// Checksum 0x51145609, Offset: 0xb98
// Size: 0x4a
function private function_6bcf2a61(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.aoeid = newval;
}

