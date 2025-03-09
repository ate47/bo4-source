#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_weap_tricannon;

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 0, eflags: 0x2
// Checksum 0x5c794a04, Offset: 0x170
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_tricannon", &__init__, undefined, undefined);
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 0, eflags: 0x0
// Checksum 0xd53c7177, Offset: 0x1b8
// Size: 0x22a
function __init__() {
    clientfield::register("actor", "water_tricannon_slow_fx", 1, 1, "int", &function_4c32ce00, 0, 0);
    clientfield::register("allplayers", "fire_tricannon_muzzle_fx", 1, 1, "counter", &function_af90fb8c, 0, 0);
    clientfield::register("allplayers", "water_tricannon_muzzle_fx", 1, 1, "counter", &function_39fb4ba9, 0, 0);
    level._effect[#"hash_1e93bf218f76b41a"] = #"hash_237782fa4c26f2f7";
    level._effect[#"hash_1e8cb3218f708108"] = #"hash_237076fa4c20bfe5";
    level._effect[#"hash_4b54be230d4f57e9"] = #"hash_78e90b082a3146ee";
    level._effect[#"hash_4b5aca230d53d7fb"] = #"hash_78e1ff082a2b13dc";
    level._effect[#"hash_506a28609ce7aaaa"] = #"hash_4a9c1296a695eb99";
    level._effect[#"hash_720e50199e045f64"] = #"hash_59e8f46ce39259a3";
    level._effect[#"hash_48c846b3b589b3f9"] = #"hash_50b3c0e6e329fec0";
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 7, eflags: 0x0
// Checksum 0xd5eb2f20, Offset: 0x3f0
// Size: 0x84
function function_4c32ce00(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle("rob_tricannon_character_ice");
        return;
    }
    self stoprenderoverridebundle("rob_tricannon_character_ice");
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 7, eflags: 0x0
// Checksum 0x2ea973a5, Offset: 0x480
// Size: 0x11c
function function_af90fb8c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (self zm_utility::function_f8796df3(localclientnum)) {
            while (isalive(self)) {
                s_result = self waittill(#"notetrack", #"death");
                if (s_result.notetrack === "fire" || s_result.notetrack === "rechamber") {
                    playviewmodelfx(localclientnum, level._effect[#"hash_48c846b3b589b3f9"], "tag_flash2");
                    break;
                }
            }
        }
    }
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 7, eflags: 0x0
// Checksum 0x532af67e, Offset: 0x5a8
// Size: 0x1a4
function function_39fb4ba9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (self.weapon === getweapon(#"ww_tricannon_water_t8_upgraded")) {
            b_packed = 1;
        }
        if (self zm_utility::function_f8796df3(localclientnum)) {
            if (b_packed === 1) {
                playviewmodelfx(localclientnum, level._effect[#"hash_506a28609ce7aaaa"], "tag_flash");
            } else {
                playviewmodelfx(localclientnum, level._effect[#"hash_4b54be230d4f57e9"], "tag_flash");
            }
            return;
        }
        if (b_packed === 1) {
            util::playfxontag(localclientnum, level._effect[#"hash_720e50199e045f64"], self, "tag_flash");
            return;
        }
        util::playfxontag(localclientnum, level._effect[#"hash_4b5aca230d53d7fb"], self, "tag_flash");
    }
}

