#using scripts\core_common\clientfield_shared;

#namespace zm_orange_challenges;

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0x38977010, Offset: 0xc8
// Size: 0x64
function init() {
    clientfield::register("allplayers", "zm_orange_force_challenge_model", 24000, 1, "int", &function_a1d393ad, 0, 0);
    forcestreamxmodel("p8_zm_ora_kitchenware_soup_pot");
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x138
// Size: 0x4
function main() {
    
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 7, eflags: 0x1 linked
// Checksum 0xe260ee12, Offset: 0x148
// Size: 0x8c
function function_a1d393ad(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel(#"p8_zm_gla_heart_zombie");
        return;
    }
    stopforcestreamingxmodel(#"p8_zm_gla_heart_zombie");
}

