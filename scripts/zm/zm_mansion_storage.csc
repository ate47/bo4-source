#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\serverfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm_common\load;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_sq_modules;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_wallbuy;
#using scripts\zm_common\zm_weapons;

#namespace mansion_storage;

// Namespace mansion_storage/zm_mansion_storage
// Params 0, eflags: 0x1 linked
// Checksum 0x89ee0360, Offset: 0x368
// Size: 0x372
function init() {
    clientfield::register("scriptmover", "" + #"hash_65a58403194ef1b4", 8000, 1, "int", &function_438d8674, 0, 0);
    clientfield::register("world", "" + #"start_billiards", 8000, 1, "int", &start_billiards, 0, 0);
    serverfield::register("billiard_ball_sunk_sf", 8000, getminbitcountfornum(9), "int");
    clientfield::register("world", "" + #"hash_354bb8ac5de6640a", 8000, getminbitcountfornum(9), "int", &function_954a27a2, 0, 0);
    clientfield::register("world", "" + #"hash_75594bca6b54706e", 8000, 1, "int", &function_68e49445, 0, 0);
    clientfield::register("world", "" + #"hash_2c115514da4cee51", 17000, 1, "int", &function_2dbadedf, 0, 0);
    clientfield::register("scriptmover", "" + #"barrel_drip", 8000, 1, "counter", &function_3e37bb63, 0, 0);
    clientfield::register("scriptmover", "" + #"barrel_spray", 8000, 1, "counter", &function_5e130882, 0, 0);
    level._effect[#"barrel_drip"] = #"hash_657c3b5d3d9bfdfa";
    level._effect[#"barrel_splash"] = #"hash_42bcb312df258591";
    level._effect[#"hash_6a63e8eb86cc88e2"] = #"hash_5934158bcfb9c884";
    level._effect[#"hash_345c6b60fb9b8682"] = #"hash_782ae54493a94c4a";
}

// Namespace mansion_storage/zm_mansion_storage
// Params 7, eflags: 0x1 linked
// Checksum 0xf317cebb, Offset: 0x6e8
// Size: 0x74
function function_438d8674(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_1789fef86cd8b57e"], self, "tag_origin");
}

// Namespace mansion_storage/zm_mansion_storage
// Params 7, eflags: 0x1 linked
// Checksum 0x12dedf1c, Offset: 0x768
// Size: 0x7a
function function_3e37bb63(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.fx = util::playfxontag(localclientnum, level._effect[#"barrel_drip"], self, "tag_origin");
}

// Namespace mansion_storage/zm_mansion_storage
// Params 7, eflags: 0x1 linked
// Checksum 0xae520a7b, Offset: 0x7f0
// Size: 0xb4
function function_5e130882(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.fx = util::playfxontag(localclientnum, level._effect[#"hash_6a63e8eb86cc88e2"], self, "tag_origin");
    wait 3;
    if (isdefined(self) && isdefined(self.fx)) {
        stopfx(localclientnum, self.fx);
    }
}

// Namespace mansion_storage/zm_mansion_storage
// Params 7, eflags: 0x1 linked
// Checksum 0xe2e2489f, Offset: 0x8b0
// Size: 0x54
function start_billiards(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        billiards_setup();
    }
}

// Namespace mansion_storage/zm_mansion_storage
// Params 0, eflags: 0x1 linked
// Checksum 0x7306fee3, Offset: 0x910
// Size: 0x1d0
function billiards_setup() {
    var_5268e682 = array(getdynent("billiard_ball_01"), getdynent("billiard_ball_02"), getdynent("billiard_ball_03"), getdynent("billiard_ball_04"), getdynent("billiard_ball_05"), getdynent("billiard_ball_06"), getdynent("billiard_ball_07"), getdynent("billiard_ball_08"), getdynent("billiard_ball_09"));
    for (i = 0; i < var_5268e682.size; i++) {
        setdynentenabled(var_5268e682[i], 1);
        var_5268e682[i].script_int = i + 1;
    }
    foreach (e_ball in var_5268e682) {
        e_ball thread function_eb218e8d();
    }
}

// Namespace mansion_storage/zm_mansion_storage
// Params 0, eflags: 0x1 linked
// Checksum 0xf62e4954, Offset: 0xae8
// Size: 0x192
function function_eb218e8d() {
    level endon(#"billiards_done");
    self endon(#"death");
    n_elev = self.origin[2] - 4;
    b_correct = 0;
    /#
        self thread function_c7673785();
    #/
    while (true) {
        self.health = 99999;
        if (self.origin[2] <= n_elev) {
            setdynentenabled(self, 0);
            if (self.script_int == 8 && distance2dsquared(self.origin, struct::get("corner_target", "script_noteworthy").origin) <= 30 * 30) {
                getlocalplayers()[0] serverfield::set("billiard_ball_sunk_sf", 10);
            } else {
                getlocalplayers()[0] serverfield::set("billiard_ball_sunk_sf", self.script_int);
            }
            break;
        }
        waitframe(1);
    }
}

/#

    // Namespace mansion_storage/zm_mansion_storage
    // Params 0, eflags: 0x4
    // Checksum 0x758cc4d8, Offset: 0xc88
    // Size: 0x19e
    function private function_c7673785() {
        self endon(#"death");
        while (true) {
            if (getdvarint(#"hash_3dcf262f16faced0", 0)) {
                v_color = function_8a8a409b(self) ? (0, 1, 0) : (1, 0, 0);
                print3d(self.origin + (0, 0, self.script_int), "<dev string:x38>" + self.script_int, v_color, undefined, 0.5);
                line(self.origin, self.origin + anglestoforward(self.angles) * 15, (1, 0, 0));
                line(self.origin, self.origin + anglestoright(self.angles) * 15, (0, 1, 0));
                line(self.origin, self.origin + anglestoup(self.angles) * 15, (0, 0, 1));
            }
            waitframe(1);
        }
    }

#/

// Namespace mansion_storage/zm_mansion_storage
// Params 7, eflags: 0x1 linked
// Checksum 0x2a3b53b0, Offset: 0xe30
// Size: 0x1fc
function function_68e49445(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel("p8_zm_man_cabinet_billiard_ball_01");
        forcestreamxmodel("p8_zm_man_cabinet_billiard_ball_02");
        forcestreamxmodel("p8_zm_man_cabinet_billiard_ball_03");
        forcestreamxmodel("p8_zm_man_cabinet_billiard_ball_04");
        forcestreamxmodel("p8_zm_man_cabinet_billiard_ball_05");
        forcestreamxmodel("p8_zm_man_cabinet_billiard_ball_06");
        forcestreamxmodel("p8_zm_man_cabinet_billiard_ball_07");
        forcestreamxmodel("p8_zm_man_cabinet_billiard_ball_08");
        forcestreamxmodel("p8_zm_man_cabinet_billiard_ball_09");
        return;
    }
    stopforcestreamingxmodel("p8_zm_man_cabinet_billiard_ball_01");
    stopforcestreamingxmodel("p8_zm_man_cabinet_billiard_ball_02");
    stopforcestreamingxmodel("p8_zm_man_cabinet_billiard_ball_03");
    stopforcestreamingxmodel("p8_zm_man_cabinet_billiard_ball_04");
    stopforcestreamingxmodel("p8_zm_man_cabinet_billiard_ball_05");
    stopforcestreamingxmodel("p8_zm_man_cabinet_billiard_ball_06");
    stopforcestreamingxmodel("p8_zm_man_cabinet_billiard_ball_07");
    stopforcestreamingxmodel("p8_zm_man_cabinet_billiard_ball_08");
    stopforcestreamingxmodel("p8_zm_man_cabinet_billiard_ball_09");
}

// Namespace mansion_storage/zm_mansion_storage
// Params 7, eflags: 0x1 linked
// Checksum 0x8ae6bd61, Offset: 0x1038
// Size: 0x7c
function function_2dbadedf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel("p8_zm_silver_bullet_pile_01");
        return;
    }
    stopforcestreamingxmodel("p8_zm_silver_bullet_pile_01");
}

// Namespace mansion_storage/zm_mansion_storage
// Params 7, eflags: 0x1 linked
// Checksum 0xf2d8510, Offset: 0x10c0
// Size: 0xfc
function function_954a27a2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        var_52fa3cae = newval == 10 ? 8 : newval;
        var_4fe0b0ee = getdynent("billiard_ball_0" + var_52fa3cae);
        if (isdefined(var_4fe0b0ee)) {
            if (var_4fe0b0ee.origin[2] >= 27) {
                playfxondynent(level._effect[#"hash_345c6b60fb9b8682"], var_4fe0b0ee);
            }
            setdynentenabled(var_4fe0b0ee, 0);
        }
    }
}

