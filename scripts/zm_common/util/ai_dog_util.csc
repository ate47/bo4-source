#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm;

#namespace zombie_dog_util;

// Namespace zombie_dog_util/ai_dog_util
// Params 0, eflags: 0x2
// Checksum 0xbc038c3d, Offset: 0x148
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zombie_dog_util", &__init__, undefined, undefined);
}

// Namespace zombie_dog_util/ai_dog_util
// Params 0, eflags: 0x1 linked
// Checksum 0x6825a180, Offset: 0x190
// Size: 0xec
function __init__() {
    init_dog_fx();
    clientfield::register("actor", "dog_fx", 1, 1, "int", &dog_fx, 0, 0);
    clientfield::register("actor", "dog_spawn_fx", 1, 1, "counter", &dog_spawn_fx, 0, 0);
    clientfield::register("world", "dog_round_fog_bank", 1, 1, "int", &dog_round_fog_bank, 0, 0);
}

// Namespace zombie_dog_util/ai_dog_util
// Params 0, eflags: 0x1 linked
// Checksum 0x7ed781b4, Offset: 0x288
// Size: 0x182
function init_dog_fx() {
    level._effect[#"dog_eye_glow"] = #"hash_70696527ecb861ae";
    level._effect[#"hash_55d6ab2c7eecbad4"] = #"hash_249f091d13da3663";
    level._effect[#"hash_808a86715bfac90"] = #"hash_78f02617f4f71d8a";
    level._effect[#"hash_5e4d4083a69396b8"] = #"hash_36a9dd505e78a";
    level._effect[#"hash_33fd6545401e3622"] = #"hash_39b25de05718b20c";
    level._effect[#"hash_63f497890003547"] = #"hash_3055dc23ae9ca695";
    level._effect[#"dog_gib"] = #"hash_529c1a5672216926";
    level._effect[#"lightning_dog_spawn"] = #"hash_50a6b2497d454910";
}

// Namespace zombie_dog_util/ai_dog_util
// Params 7, eflags: 0x1 linked
// Checksum 0xd79da4f5, Offset: 0x418
// Size: 0x46c
function dog_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (newval) {
        self._eyeglow_fx_override = level._effect[#"dog_eye_glow"];
        self zm::createzombieeyes(localclientnum);
        self mapshaderconstant(localclientnum, 0, "scriptVector2", 0, zm::get_eyeball_on_luminance(), self zm::get_eyeball_color());
        if (!isdefined(self.var_93471229)) {
            self.var_93471229 = [];
        }
        if (isdefined(level.var_17c4823f) && !isdefined(self.var_a9305c6e)) {
            self.var_a9305c6e = self playloopsound(level.var_17c4823f);
        }
        array::add(self.var_93471229, util::playfxontag(localclientnum, level._effect[#"hash_808a86715bfac90"], self, "j_neck_end"));
        array::add(self.var_93471229, util::playfxontag(localclientnum, level._effect[#"hash_5e4d4083a69396b8"], self, "j_tail0"));
        array::add(self.var_93471229, util::playfxontag(localclientnum, level._effect[#"hash_5e4d4083a69396b8"], self, "j_tail1"));
        array::add(self.var_93471229, util::playfxontag(localclientnum, level._effect[#"hash_33fd6545401e3622"], self, "j_spine2"));
        array::add(self.var_93471229, util::playfxontag(localclientnum, level._effect[#"hash_63f497890003547"], self, "j_neck"));
        array::add(self.var_93471229, util::playfxontag(localclientnum, level._effect[#"hash_55d6ab2c7eecbad4"], self, "tag_eye"));
        return;
    }
    if (isdefined(self.var_a9305c6e)) {
        self stoploopsound(self.var_a9305c6e);
    }
    self mapshaderconstant(localclientnum, 0, "scriptVector2", 0, zm::get_eyeball_off_luminance(), self zm::get_eyeball_color());
    self zm::deletezombieeyes(localclientnum);
    if (isdefined(self.var_93471229)) {
        foreach (fxhandle in self.var_93471229) {
            deletefx(localclientnum, fxhandle);
        }
    }
    util::playfxontag(localclientnum, level._effect[#"dog_gib"], self, "j_spine2");
}

// Namespace zombie_dog_util/ai_dog_util
// Params 7, eflags: 0x1 linked
// Checksum 0x43f919db, Offset: 0x890
// Size: 0x74
function dog_spawn_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    util::playfxontag(localclientnum, level._effect[#"lightning_dog_spawn"], self, "j_spine2");
}

// Namespace zombie_dog_util/ai_dog_util
// Params 7, eflags: 0x1 linked
// Checksum 0xacaa680, Offset: 0x910
// Size: 0xd4
function dog_round_fog_bank(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        e_player = getlocalplayers()[localclientnum];
        e_player thread function_33593a44(localclientnum, 1, 2);
        return;
    }
    e_player = getlocalplayers()[localclientnum];
    e_player thread function_33593a44(localclientnum, 2, 1);
}

// Namespace zombie_dog_util/ai_dog_util
// Params 4, eflags: 0x5 linked
// Checksum 0xa2cfae5f, Offset: 0x9f0
// Size: 0x198
function private function_33593a44(localclientnum, var_312d65d1, var_68f7ce2e, n_time = 3) {
    self notify("3fd20b4701c90c8f");
    self endon("3fd20b4701c90c8f");
    n_blend = 0;
    n_increment = 1 / n_time / 0.05;
    if (var_312d65d1 == 1 && var_68f7ce2e == 2) {
        while (n_blend < 1) {
            function_be93487f(localclientnum, var_312d65d1 | var_68f7ce2e, 1 - n_blend, n_blend, 0, 0);
            n_blend += n_increment;
            wait 0.05;
        }
        return;
    }
    if (var_312d65d1 == 2 && var_68f7ce2e == 1) {
        while (n_blend < 1) {
            function_be93487f(localclientnum, var_312d65d1 | var_68f7ce2e, n_blend, 1 - n_blend, 0, 0);
            n_blend += n_increment;
            wait 0.05;
        }
    }
}

