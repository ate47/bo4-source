#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\character_unlock;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_stanton;

// Namespace character_unlock_stanton/character_unlock_stanton
// Params 0, eflags: 0x2
// Checksum 0xd5445b69, Offset: 0x98
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_stanton", &__init__, undefined, #"character_unlock_stanton_fixup");
}

// Namespace character_unlock_stanton/character_unlock_stanton
// Params 0, eflags: 0x0
// Checksum 0xbd366667, Offset: 0xe8
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"stanton_unlock", &function_2613aeec);
}

// Namespace character_unlock_stanton/character_unlock_stanton
// Params 1, eflags: 0x0
// Checksum 0x7e26665, Offset: 0x128
// Size: 0x2a4
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_player_killed(&on_player_killed);
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        item_world_fixup::function_2749fcc3(#"hash_6a0d13acf3e5687d", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu14", 2);
        item_world_fixup::function_2749fcc3(#"hash_33f7121f70c3065f", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu14", 2);
        item_world_fixup::function_2749fcc3(#"hash_2b546c0315159617", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu14", 2);
        item_world_fixup::function_2749fcc3(#"hash_183c9fe8af52fac7", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu14", 2);
        item_world_fixup::function_2749fcc3(#"hash_49e8a607ea22e650", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu14", 2);
        item_world_fixup::function_2749fcc3(#"zombie_stash_graveyard_quest", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu14", 2);
        item_world_fixup::function_2749fcc3(#"hash_ca8b234ad1fea38", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu14", 2);
        item_world_fixup::function_2749fcc3(#"hash_4ee6deffa30cc6e2", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu14", 2);
    }
}

// Namespace character_unlock_stanton/character_unlock_stanton
// Params 1, eflags: 0x0
// Checksum 0x28af1e35, Offset: 0x3d8
// Size: 0x54
function function_1c4b5097(item) {
    itementry = item.itementry;
    if (itementry.name === #"cu14_item") {
        self function_895b40e4();
    }
}

// Namespace character_unlock_stanton/character_unlock_stanton
// Params 0, eflags: 0x0
// Checksum 0x4fa67b06, Offset: 0x438
// Size: 0x194
function on_player_killed() {
    if (!isdefined(self.laststandparams)) {
        return;
    }
    attacker = self.laststandparams.attacker;
    weapon = self.laststandparams.sweapon;
    if (!isplayer(attacker) || !isdefined(weapon)) {
        return;
    }
    if (weapon.name != #"eq_acid_bomb" && weapon.name != #"wraith_fire_fire" && weapon.name != #"eq_wraith_fire") {
        return;
    }
    if (!attacker util::isenemyteam(self.team)) {
        return;
    }
    if (!attacker character_unlock::function_f0406288(#"stanton_unlock")) {
        return;
    }
    if (!isdefined(attacker.var_bd8f4916)) {
        attacker.var_bd8f4916 = 0;
    }
    attacker.var_bd8f4916++;
    if (attacker.var_bd8f4916 == 2) {
        attacker character_unlock::function_c8beca5e(#"stanton_unlock", #"hash_5495584ec5e9f348", 1);
    }
}

// Namespace character_unlock_stanton/character_unlock_stanton
// Params 0, eflags: 0x4
// Checksum 0x7b905065, Offset: 0x5d8
// Size: 0x24
function private function_895b40e4() {
    self playsoundtoplayer(#"hash_70c9b45d9474b631", self);
}

