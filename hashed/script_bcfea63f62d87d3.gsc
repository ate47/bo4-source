// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_77b8863;

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x2
// Checksum 0xa4ac92c2, Offset: 0x170
// Size: 0x5c
function autoexec main() {
    clientfield::register("scriptmover", "towers_boss_dust_ball_fx", 1, getminbitcountfornum(4), "int", &function_72955447, 0, 0);
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 7, eflags: 0x1 linked
// Checksum 0x89e857ee, Offset: 0x1d8
// Size: 0x19c
function function_72955447(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.fx = util::playfxontag(localclientnum, "maps/zm_towers/fx8_boss_attack_slam_trail_lg", self, "tag_origin");
    } else if (newval == 2) {
        if (isdefined(self.fx)) {
            stopfx(localclientnum, self.fx);
        }
        self.fx = util::playfxontag(localclientnum, "maps/zm_towers/fx8_boss_attack_slam_trail", self, "tag_origin");
    } else if (newval == 3) {
        if (isdefined(self.fx)) {
            stopfx(localclientnum, self.fx);
        }
        self.fx = util::playfxontag(localclientnum, "maps/zm_towers/fx8_boss_death_soul_trail", self, "tag_origin");
    } else if (isdefined(self.fx)) {
        self.fx = util::playfxontag(localclientnum, "maps/zm_towers/fx8_boss_attack_slam_trail_end", self, "tag_origin");
        stopfx(localclientnum, self.fx);
    }
}

