// Atian COD Tools GSC decompiler test
#namespace loot;

// Namespace loot/loot_tracking
// Params 2, eflags: 0x0
// Checksum 0x8dd87028, Offset: 0x68
// Size: 0x10c
function function_13afbf2d(lootid, name) {
    if (!isplayer(self)) {
        return;
    }
    player = self;
    eventparams = {#loot_id:lootid, #loot_data:name, #gametime:function_f8d53445(), #pos_x:player.origin[0], #pos_y:player.origin[1], #pos_z:player.origin[2]};
    function_92d1707f(#"hash_6e269493db33fcf7", eventparams);
}

