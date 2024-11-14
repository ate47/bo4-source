#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\ai_shared;

#namespace zm_ai_white_nova_crawler;

// Namespace zm_ai_white_nova_crawler/zm_ai_white_nova_crawler
// Params 0, eflags: 0x2
// Checksum 0xfd247509, Offset: 0x2d0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_white_nova_crawler", &__init__, undefined, #"zm_ai_nova_crawler");
}

// Namespace zm_ai_white_nova_crawler/zm_ai_white_nova_crawler
// Params 0, eflags: 0x1 linked
// Checksum 0xe57f2da8, Offset: 0x320
// Size: 0x1e4
function __init__() {
    level._effect[#"fx8_nova_crawler_zombie_buff"] = "zm_ai/fx8_nova_crawler_zombie_buff";
    level._effect[#"hash_fa591e70e810d4a"] = "zm_ai/fx8_nova_crawler_gas_cloud_lg";
    clientfield::register("actor", "nova_buff_aura_clientfield", 8000, 1, "int", &function_be621cc7, 0, 0);
    clientfield::register("actor", "white_nova_crawler_phase_end_clientfield", 8000, 1, "counter", &function_18c564d0, 0, 0);
    clientfield::register("actor", "nova_gas_cloud_fx_clientfield", 8000, 1, "counter", &function_c9ef107f, 0, 0);
    clientfield::register("actor", "white_nova_crawler_spore_impact_clientfield", 8000, 1, "counter", &function_2a92d45, 0, 0);
    clientfield::register("scriptmover", "white_nova_crawler_spore_clientfield", 16000, 1, "int", &function_9ed375e1, 0, 0);
    ai::add_archetype_spawn_function(#"nova_crawler", &function_582a3075);
}

// Namespace zm_ai_white_nova_crawler/zm_ai_white_nova_crawler
// Params 1, eflags: 0x5 linked
// Checksum 0xdd0c08a1, Offset: 0x510
// Size: 0xee
function private function_582a3075(localclientnum) {
    if (!isdefined(self._effect)) {
        self._effect = [];
    }
    self._effect[#"hash_219e13e8868d7af4"] = "zm_ai/fx8_nova_crawler_explode";
    if (isdefined(self.var_9fde8624)) {
        if (self.var_9fde8624 == #"blue_nova_crawler") {
            self._effect[#"hash_219e13e8868d7af4"] = "zm_ai/fx8_nova_crawler_mq_explode";
            return;
        }
        if (self.var_9fde8624 == #"ranged_nova_crawler") {
            self._effect[#"hash_219e13e8868d7af4"] = "zm_ai/fx8_nova_crawler_elec_explode";
            self._effect[#"nova_crawler_phase_teleport_end_fx"] = "zm_ai/fx8_nova_crawler_elec_teleport_appear";
        }
    }
}

// Namespace zm_ai_white_nova_crawler/zm_ai_white_nova_crawler
// Params 7, eflags: 0x5 linked
// Checksum 0x56a28960, Offset: 0x608
// Size: 0xc6
function private function_be621cc7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newval === 1) {
        self.var_f09d143c = util::playfxontag(localclientnum, level._effect[#"fx8_nova_crawler_zombie_buff"], self, "j_spine4");
        return;
    }
    if (isdefined(self.var_f09d143c)) {
        stopfx(localclientnum, self.var_f09d143c);
        self.var_f09d143c = undefined;
    }
}

// Namespace zm_ai_white_nova_crawler/zm_ai_white_nova_crawler
// Params 7, eflags: 0x5 linked
// Checksum 0xa5a78595, Offset: 0x6d8
// Size: 0x9c
function private function_18c564d0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (isdefined(self._effect) && isdefined(self._effect[#"nova_crawler_phase_teleport_end_fx"])) {
        util::playfxontag(localclientnum, self._effect[#"nova_crawler_phase_teleport_end_fx"], self, "j_spine4");
    }
}

// Namespace zm_ai_white_nova_crawler/zm_ai_white_nova_crawler
// Params 7, eflags: 0x5 linked
// Checksum 0xdeea54f3, Offset: 0x780
// Size: 0xa4
function private function_c9ef107f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    fx_location = self gettagorigin("j_mainroot");
    if (isdefined(fx_location)) {
        playfx(localclientnum, level._effect[#"hash_fa591e70e810d4a"], fx_location);
    }
}

// Namespace zm_ai_white_nova_crawler/zm_ai_white_nova_crawler
// Params 7, eflags: 0x1 linked
// Checksum 0x44237e3e, Offset: 0x830
// Size: 0x8c
function function_2a92d45(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::waittill_dobj(localclientnum);
    if (isdefined(self) && newval) {
        function_239993de(localclientnum, "zm_ai/fx8_nova_crawler_gas_projectile_impact", self, "j_spine4");
    }
}

// Namespace zm_ai_white_nova_crawler/zm_ai_white_nova_crawler
// Params 7, eflags: 0x1 linked
// Checksum 0x295cdda8, Offset: 0x8c8
// Size: 0xce
function function_9ed375e1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (newval) {
        self.spore_fx = function_239993de(localclientnum, "zm_ai/fx8_nova_crawler_gas_projectile", self, "tag_origin");
        return;
    }
    if (isdefined(self.spore_fx)) {
        stopfx(localclientnum, self.spore_fx);
        self.spore_fx = undefined;
    }
}

