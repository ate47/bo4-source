// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\mp_common\item_world_fixup.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_dempsey;

// Namespace character_unlock_dempsey/character_unlock_dempsey
// Params 0, eflags: 0x2
// Checksum 0x391264fe, Offset: 0xc0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_dempsey", &__init__, undefined, #"character_unlock_dempsey_fixup");
}

// Namespace character_unlock_dempsey/character_unlock_dempsey
// Params 0, eflags: 0x0
// Checksum 0x7bf7cd36, Offset: 0x110
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"dempsey_unlock", &function_2613aeec);
}

// Namespace character_unlock_dempsey/character_unlock_dempsey
// Params 1, eflags: 0x0
// Checksum 0xcc8a7d04, Offset: 0x150
// Size: 0x2a4
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_player_killed(&on_player_killed);
        callback::add_callback(#"hash_3b891b6daa75c782", &function_1c4b5097);
        item_world_fixup::function_2749fcc3(#"hash_6a0d13acf3e5687d", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu15", 2);
        item_world_fixup::function_2749fcc3(#"hash_33f7121f70c3065f", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu15", 2);
        item_world_fixup::function_2749fcc3(#"hash_2b546c0315159617", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu15", 2);
        item_world_fixup::function_2749fcc3(#"hash_183c9fe8af52fac7", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu15", 2);
        item_world_fixup::function_2749fcc3(#"hash_49e8a607ea22e650", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu15", 2);
        item_world_fixup::function_2749fcc3(#"zombie_stash_graveyard_quest", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu15", 2);
        item_world_fixup::function_2749fcc3(#"hash_ca8b234ad1fea38", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu15", 2);
        item_world_fixup::function_2749fcc3(#"hash_4ee6deffa30cc6e2", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu15", 2);
    }
}

// Namespace character_unlock_dempsey/character_unlock_dempsey
// Params 1, eflags: 0x0
// Checksum 0xe370b5be, Offset: 0x400
// Size: 0x54
function function_1c4b5097(item) {
    itementry = item.itementry;
    if (itementry.name === #"cu15_item") {
        self thread function_895b40e4();
    }
}

// Namespace character_unlock_dempsey/character_unlock_dempsey
// Params 0, eflags: 0x0
// Checksum 0x2903079, Offset: 0x460
// Size: 0x104
function on_player_killed() {
    if (!isdefined(self.laststandparams)) {
        return;
    }
    attacker = self.laststandparams.attacker;
    mod = self.laststandparams.smeansofdeath;
    if (!isplayer(attacker)) {
        return;
    }
    if (mod != "MOD_GRENADE" && mod != "MOD_GRENADE_SPLASH") {
        return;
    }
    if (!attacker util::isenemyteam(self.team)) {
        return;
    }
    if (!attacker character_unlock::function_f0406288(#"dempsey_unlock")) {
        return;
    }
    attacker character_unlock::function_c8beca5e(#"dempsey_unlock", #"hash_557b228047615fb0", 1);
}

// Namespace character_unlock_dempsey/character_unlock_dempsey
// Params 0, eflags: 0x4
// Checksum 0xb3f17ba1, Offset: 0x570
// Size: 0x24
function private function_895b40e4() {
    self playsoundtoplayer(#"hash_40bb133320e319b6", self);
}

