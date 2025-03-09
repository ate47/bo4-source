#using script_324d329b31b9b4ec;
#using scripts\core_common\ai_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\renderoverridebundle;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\killstreaks\killstreak_bundles;

#namespace swat_team;

// Namespace swat_team/swat_team
// Params 0, eflags: 0x2
// Checksum 0x6412f6c7, Offset: 0x208
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"swat_team", &__init__, undefined, #"killstreaks");
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x0
// Checksum 0xe34d6b35, Offset: 0x258
// Size: 0x1e4
function __init__() {
    ir_strobe::init_shared();
    bundle = struct::get_script_bundle("killstreak", "killstreak_swat_team");
    ai::add_archetype_spawn_function("human", &spawned, bundle);
    clientfield::register("actor", "swat_light_strobe", 1, 1, "int", &function_3deaa7d0, 0, 0);
    clientfield::register("scriptmover", "swat_light_strobe", 1, 1, "int", &function_92ec578c, 0, 0);
    clientfield::register("actor", "swat_shocked", 1, 1, "int", &function_8fa6561f, 0, 0);
    clientfield::register("vehicle", "swat_helicopter_death_fx", 1, getminbitcountfornum(2), "int", &function_266f2abf, 0, 0);
    clientfield::register("actor", "swat_rob_state", 1, 1, "int", &function_d9dea06b, 0, 0);
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x0
// Checksum 0x8197dd02, Offset: 0x448
// Size: 0xac
function spawned(local_client_num, bundle) {
    if (self.subarchetype === #"human_lmg") {
        if (self.team === #"free" && isdefined(level.var_fd6018ca) && level.var_fd6018ca) {
            self killstreak_bundles::spawned(local_client_num, level.var_c80088b7);
            return;
        }
        self killstreak_bundles::spawned(local_client_num, bundle);
    }
}

// Namespace swat_team/swat_team
// Params 7, eflags: 0x0
// Checksum 0x72951bdc, Offset: 0x500
// Size: 0x8c
function function_266f2abf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forward = self.origin + (0, 0, 1) - self.origin;
        playfx(localclientnum, "killstreaks/fx_heli_exp_lg", self.origin, forward);
    }
}

// Namespace swat_team/swat_team
// Params 7, eflags: 0x0
// Checksum 0xa7837985, Offset: 0x598
// Size: 0x94
function function_3deaa7d0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        util::playfxontag(localclientnum, "light/fx8_light_plyr_strobe", self, "tag_char_vis_light_strobe_01");
        util::playfxontag(localclientnum, "light/fx8_light_plyr_strobe", self, "tag_char_vis_light_strobe_02");
    }
}

// Namespace swat_team/swat_team
// Params 7, eflags: 0x0
// Checksum 0xcf8c02c6, Offset: 0x638
// Size: 0x6c
function function_92ec578c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        util::playfxontag(localclientnum, "light/fx8_light_plyr_strobe", self, "tag_flash");
    }
}

// Namespace swat_team/swat_team
// Params 7, eflags: 0x0
// Checksum 0xfb1ca420, Offset: 0x6b0
// Size: 0xa4
function function_8fa6561f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.zmpowerupinstakill_introduction = util::playfxontag(localclientnum, "player/fx8_plyr_shocked_3p", self, "j_spineupper");
        return;
    }
    if (isdefined(self.zmpowerupinstakill_introduction)) {
        stopfx(localclientnum, self.zmpowerupinstakill_introduction);
    }
}

// Namespace swat_team/swat_team
// Params 7, eflags: 0x4
// Checksum 0x355fdfe8, Offset: 0x760
// Size: 0xbc
function private function_d9dea06b(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newvalue) {
        if (self flag::exists(#"friendly")) {
            self renderoverridebundle::stop_bundle(#"friendly", sessionmodeiscampaigngame() ? #"rob_sonar_set_friendlyequip_cp" : #"rob_sonar_set_friendlyequip_mp", 0);
        }
    }
}

