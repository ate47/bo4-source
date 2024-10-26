#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace riotshield;

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x6b7b84ec, Offset: 0x100
// Size: 0xaa
function init_shared() {
    clientfield::register("scriptmover", "riotshield_state", 1, 2, "int", &shield_state_change, 0, 0);
    level._effect[#"riotshield_light"] = #"_t6/weapon/riotshield/fx_riotshield_depoly_lights";
    level._effect[#"riotshield_dust"] = #"_t6/weapon/riotshield/fx_riotshield_depoly_dust";
}

// Namespace riotshield/riotshield
// Params 7, eflags: 0x1 linked
// Checksum 0x5884a5d3, Offset: 0x1b8
// Size: 0xd2
function shield_state_change(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    switch (newval) {
    case 1:
        instant = oldval == 2;
        self thread riotshield_deploy_anim(localclientnum, instant);
        break;
    case 2:
        self thread riotshield_destroy_anim(localclientnum);
        break;
    }
}

// Namespace riotshield/riotshield
// Params 2, eflags: 0x1 linked
// Checksum 0xd6dc8954, Offset: 0x298
// Size: 0x16a
function riotshield_deploy_anim(localclientnum, instant) {
    self endon(#"death");
    self thread watch_riotshield_damage();
    self util::waittill_dobj(localclientnum);
    self useanimtree("generic");
    if (instant) {
        self setanimtime(#"o_riot_stand_deploy", 1);
    } else {
        self setanim(#"o_riot_stand_deploy", 1, 0, 1);
        util::playfxontag(localclientnum, level._effect[#"riotshield_dust"], self, "tag_origin");
    }
    if (!instant) {
        wait 0.8;
    }
    self.shieldlightfx = util::playfxontag(localclientnum, level._effect[#"riotshield_light"], self, "tag_fx");
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0xded557e6, Offset: 0x410
// Size: 0x128
function watch_riotshield_damage() {
    self endon(#"death");
    while (true) {
        waitresult = self waittill(#"damage");
        damage_type = waitresult.mod;
        self useanimtree("generic");
        if (damage_type == "MOD_MELEE" || damage_type == "MOD_MELEE_WEAPON_BUTT" || damage_type == "MOD_MELEE_ASSASSINATE") {
            self setanim(#"o_riot_stand_melee_front", 1, 0, 1);
            continue;
        }
        self setanim(#"o_riot_stand_shot", 1, 0, 1);
    }
}

// Namespace riotshield/riotshield
// Params 1, eflags: 0x1 linked
// Checksum 0xbab784ab, Offset: 0x540
// Size: 0xf4
function riotshield_destroy_anim(localclientnum) {
    self endon(#"death");
    if (isdefined(self.shieldlightfx)) {
        stopfx(localclientnum, self.shieldlightfx);
    }
    waitframe(1);
    self playsound(localclientnum, #"wpn_shield_destroy");
    self useanimtree("generic");
    self setanim(#"o_riot_stand_destroyed", 1, 0, 1);
    wait 1;
    self setforcenotsimple();
}

