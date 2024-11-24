#using scripts\zm_common\zm_sq_modules;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\struct;

#namespace zm_orange_ee_yellow_snow;

// Namespace zm_orange_ee_yellow_snow/zm_orange_ee_yellow_snow
// Params 0, eflags: 0x1 linked
// Checksum 0x4e753469, Offset: 0x1c0
// Size: 0x11c
function preload() {
    level._effect[#"campfire_soul"] = #"hash_59977c4c851916e0";
    level._effect[#"hash_6d2d7bab75c2c0"] = #"hash_1a06427eff8dfe13";
    level._effect[#"campfire_flames"] = #"hash_487863cb3f012833";
    level._effect[#"snowpile_swap"] = #"hash_6d8c75ffdf65fe0";
    init_clientfields();
    forcestreamxmodel("p8_zm_ora_specimen_container_lrg_cracked");
    forcestreamxmodel("p8_zm_ora_specimen_container_lrg_dmg");
    forcestreamxmodel("p8_zm_ora_yellow_snowball_pile");
}

// Namespace zm_orange_ee_yellow_snow/zm_orange_ee_yellow_snow
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x2e8
// Size: 0x4
function main() {
    
}

// Namespace zm_orange_ee_yellow_snow/zm_orange_ee_yellow_snow
// Params 0, eflags: 0x1 linked
// Checksum 0x515bbbee, Offset: 0x2f8
// Size: 0x214
function init_clientfields() {
    zm_sq_modules::function_d8383812(#"snowball_campfire_1", 24000, "snowball_campfire_1", 400, level._effect[#"campfire_soul"], level._effect[#"hash_6d2d7bab75c2c0"], undefined, undefined, 1);
    zm_sq_modules::function_d8383812(#"snowball_campfire_2", 24000, "snowball_campfire_2", 400, level._effect[#"campfire_soul"], level._effect[#"hash_6d2d7bab75c2c0"], undefined, undefined, 1);
    zm_sq_modules::function_d8383812(#"snowball_campfire_3", 24000, "snowball_campfire_3", 400, level._effect[#"campfire_soul"], level._effect[#"hash_6d2d7bab75c2c0"], undefined, undefined, 1);
    clientfield::register("scriptmover", "fx8_reward_brazier_fire_blue", 24000, 1, "int", &campfire_flames, 0, 0);
    clientfield::register("scriptmover", "fx8_snowpile_swap", 24000, 1, "int", &snowpile_swap, 0, 0);
    clientfield::register("toplayer", "spleen_carry_sound", 20000, 1, "int", &spleen_carry_sound, 0, 0);
}

// Namespace zm_orange_ee_yellow_snow/zm_orange_ee_yellow_snow
// Params 7, eflags: 0x1 linked
// Checksum 0xfb900e4b, Offset: 0x518
// Size: 0x82
function campfire_flames(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.fx_sparks = util::playfxontag(localclientnum, level._effect[#"campfire_flames"], self, "tag_origin");
    }
}

// Namespace zm_orange_ee_yellow_snow/zm_orange_ee_yellow_snow
// Params 7, eflags: 0x1 linked
// Checksum 0x122bc02a, Offset: 0x5a8
// Size: 0x82
function snowpile_swap(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.fx_sparks = util::playfxontag(localclientnum, level._effect[#"snowpile_swap"], self, "tag_origin");
    }
}

// Namespace zm_orange_ee_yellow_snow/zm_orange_ee_yellow_snow
// Params 7, eflags: 0x1 linked
// Checksum 0x6145674e, Offset: 0x638
// Size: 0xbe
function spleen_carry_sound(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.var_b93060b3 = self playloopsound(#"hash_59783b8d2accba79");
        return;
    }
    self playsound(localclientnum, #"hash_37f5db96bc2147cd");
    self stoploopsound(self.var_b93060b3);
    self.var_b93060b3 = undefined;
}

