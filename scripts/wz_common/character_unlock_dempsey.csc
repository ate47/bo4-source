// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\mp_common\item_world_fixup.csc;
#using scripts\core_common\system_shared.csc;

#namespace character_unlock_dempsey;

// Namespace character_unlock_dempsey/character_unlock_dempsey
// Params 0, eflags: 0x2
// Checksum 0xa5dd9f32, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_dempsey", &__init__, undefined, #"character_unlock_dempsey_fixup");
}

// Namespace character_unlock_dempsey/character_unlock_dempsey
// Params 0, eflags: 0x1 linked
// Checksum 0xfd43fb38, Offset: 0xd0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"dempsey_unlock", &function_2613aeec);
}

// Namespace character_unlock_dempsey/character_unlock_dempsey
// Params 1, eflags: 0x1 linked
// Checksum 0x11eab050, Offset: 0x110
// Size: 0x254
function function_2613aeec(enabled) {
    if (enabled) {
        item_world_fixup::function_2749fcc3(#"hash_6a0d13acf3e5687d", #"hash_5f9831cef8ab9e8d", #"hash_24c9956ffb7a3ec0", 2);
        item_world_fixup::function_2749fcc3(#"hash_33f7121f70c3065f", #"hash_5f9831cef8ab9e8d", #"hash_24c9956ffb7a3ec0", 2);
        item_world_fixup::function_2749fcc3(#"hash_2b546c0315159617", #"hash_5f9831cef8ab9e8d", #"hash_24c9956ffb7a3ec0", 2);
        item_world_fixup::function_2749fcc3(#"hash_183c9fe8af52fac7", #"hash_5f9831cef8ab9e8d", #"hash_24c9956ffb7a3ec0", 2);
        item_world_fixup::function_2749fcc3(#"hash_49e8a607ea22e650", #"hash_5f9831cef8ab9e8d", #"hash_24c9956ffb7a3ec0", 2);
        item_world_fixup::function_2749fcc3(#"zombie_stash_graveyard_quest", #"hash_5f9831cef8ab9e8d", #"hash_24c9956ffb7a3ec0", 2);
        item_world_fixup::function_2749fcc3(#"hash_ca8b234ad1fea38", #"hash_5f9831cef8ab9e8d", #"hash_24c9956ffb7a3ec0", 2);
        item_world_fixup::function_2749fcc3(#"hash_4ee6deffa30cc6e2", #"hash_5f9831cef8ab9e8d", #"hash_24c9956ffb7a3ec0", 2);
    }
}

