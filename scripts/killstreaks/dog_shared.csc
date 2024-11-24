#using scripts\core_common\ai_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\renderoverridebundle;
#using scripts\core_common\util_shared;

#namespace dog;

// Namespace dog/dog_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x86530503, Offset: 0x128
// Size: 0x15c
function init_shared() {
    if (!isdefined(level.system_dog)) {
        level.system_dog = {};
        clientfield::register("clientuimodel", "hudItems.dogState", 1, 2, "int", undefined, 0, 0);
        clientfield::register("actor", "dogState", 1, 1, "int", &function_654bd68b, 0, 0);
        clientfield::register("actor", "ks_dog_bark", 1, 1, "int", &function_14740469, 0, 0);
        clientfield::register("actor", "ks_shocked", 1, 1, "int", &function_e464e22b, 0, 0);
    }
    ai::add_archetype_spawn_function("mp_dog", &function_b0f3bc1f);
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb032979f, Offset: 0x290
// Size: 0x24
function function_b0f3bc1f(localclientnum) {
    self thread watchdeath(localclientnum);
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa589f3eb, Offset: 0x2c0
// Size: 0x74
function watchdeath(localclientnum) {
    self waittill(#"death");
    if (isdefined(self) && self hasdobj(localclientnum)) {
        self clearanim(#"ai_nomad_dog_additive_bark_01", 0.1);
    }
}

// Namespace dog/dog_shared
// Params 7, eflags: 0x5 linked
// Checksum 0xa14ff6e5, Offset: 0x340
// Size: 0xbc
function private function_654bd68b(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newvalue) {
        if (self flag::exists(#"friendly")) {
            self renderoverridebundle::stop_bundle(#"friendly", sessionmodeiscampaigngame() ? #"rob_sonar_set_friendlyequip_cp" : #"rob_sonar_set_friendlyequip_mp", 0);
        }
    }
}

// Namespace dog/dog_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x4ed86f94, Offset: 0x408
// Size: 0x104
function function_14740469(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (isdefined(self) && self hasdobj(localclientnum)) {
            self setflaggedanimknobrestart(#"hash_506d2ece42569653", #"ai_nomad_dog_additive_bark_01", 1, 0.1, 1);
        }
        return;
    }
    if (isdefined(self) && self hasdobj(localclientnum)) {
        self clearanim(#"ai_nomad_dog_additive_bark_01", 0.1);
    }
}

// Namespace dog/dog_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x25353510, Offset: 0x518
// Size: 0xcc
function function_e464e22b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (isdefined(self.zmpowerupinstakill_introduction)) {
            stopfx(localclientnum, self.zmpowerupinstakill_introduction);
        }
        self.zmpowerupinstakill_introduction = util::playfxontag(localclientnum, "weapon/fx8_hero_sig_lightning_death_dog", self, "j_spine3");
        return;
    }
    if (isdefined(self.zmpowerupinstakill_introduction)) {
        stopfx(localclientnum, self.zmpowerupinstakill_introduction);
    }
}

