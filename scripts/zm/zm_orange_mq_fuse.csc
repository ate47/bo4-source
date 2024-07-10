#using script_624a704d0f6bf28d;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_orange_mq_fuse;

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x9659cff5, Offset: 0xf8
// Size: 0xa4
function preload() {
    level._effect[#"generator_soul"] = #"hash_59977c4c851916e0";
    level._effect[#"hash_25d427b0d162135a"] = #"hash_1a06427eff8dfe13";
    level._effect[#"elemental_shard_glow"] = #"hash_4310e1cb3f897c7c";
    init_clientfields();
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x1a8
// Size: 0x4
function main() {
    
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 0, eflags: 0x1 linked
// Checksum 0x43474752, Offset: 0x1b8
// Size: 0x184
function init_clientfields() {
    namespace_617a54f4::function_d8383812(#"little_bird_1", 24000, "little_bird_1", 400, level._effect[#"generator_soul"], level._effect[#"hash_25d427b0d162135a"], undefined, undefined, 1);
    namespace_617a54f4::function_d8383812(#"little_bird_2", 24000, "little_bird_2", 400, level._effect[#"generator_soul"], level._effect[#"hash_25d427b0d162135a"], undefined, undefined, 1);
    namespace_617a54f4::function_d8383812(#"little_bird_3", 24000, "little_bird_3", 400, level._effect[#"generator_soul"], level._effect[#"hash_25d427b0d162135a"], undefined, undefined, 1);
    clientfield::register("scriptmover", "elemental_shard_glow", 24000, 1, "int", &elemental_shard_glow, 0, 0);
}

// Namespace zm_orange_mq_fuse/zm_orange_mq_fuse
// Params 7, eflags: 0x1 linked
// Checksum 0x542ee9b0, Offset: 0x348
// Size: 0xac
function elemental_shard_glow(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.fx_glow = util::playfxontag(localclientnum, level._effect[#"elemental_shard_glow"], self, "tag_origin");
        return;
    }
    stopfx(localclientnum, self.fx_glow);
}

