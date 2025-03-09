#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace zm_orange_ee_tundragun;

// Namespace zm_orange_ee_tundragun/zm_orange_ee_tundragun
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x90
// Size: 0x4
function init() {
    
}

// Namespace zm_orange_ee_tundragun/zm_orange_ee_tundragun
// Params 7, eflags: 0x0
// Checksum 0xe326e6c4, Offset: 0xa0
// Size: 0x74
function play_dynamite_explosion_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"dynamite_explosion"], self, "tag_origin");
}

// Namespace zm_orange_ee_tundragun/zm_orange_ee_tundragun
// Params 7, eflags: 0x0
// Checksum 0x9b0a4335, Offset: 0x120
// Size: 0x74
function function_ee32b1b8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_281c546a716f0d89"], self, "j_spine4");
}

