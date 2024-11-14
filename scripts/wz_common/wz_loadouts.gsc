#using scripts\mp_common\item_world;
#using script_6b993fdc7adc35ec;
#using scripts\mp_common\item_inventory;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;

#namespace wz_loadouts;

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x2
// Checksum 0xc4a1c5e1, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"wz_loadouts", &__init__, undefined, #"item_inventory");
}

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x4
// Checksum 0x9d6f2fa4, Offset: 0xe0
// Size: 0x206
function private __init__() {
    gametype = util::get_game_type();
    if (gametype !== #"warzone_hot_pursuit" && gametype !== #"warzone_heavy_metal" && gametype !== #"warzone_bigteam_dbno_quad" && gametype !== #"warzone_heavy_metal_heroes") {
        return;
    }
    if (isdefined(getgametypesetting(#"hash_7d8c969e384dd1c9")) ? getgametypesetting(#"hash_7d8c969e384dd1c9") : 0) {
        level.var_5c14d2e6 = &function_3fed57dd;
    }
    if (isdefined(getgametypesetting(#"hash_4149d5d65eb07138")) ? getgametypesetting(#"hash_4149d5d65eb07138") : 0) {
        level.var_317fb13c = &function_3fed57dd;
        if (gametype === #"warzone_bigteam_dbno_quad") {
            level.var_317fb13c = &function_a9b8fa06;
        }
    }
    if (isdefined(getgametypesetting(#"wzheavymetalheroes")) ? getgametypesetting(#"wzheavymetalheroes") : 0) {
        level.var_5c14d2e6 = &function_9de0644f;
        level.var_317fb13c = &function_9de0644f;
    }
}

// Namespace wz_loadouts/wz_loadouts
// Params 1, eflags: 0x0
// Checksum 0x25e817c0, Offset: 0x2f0
// Size: 0x6a
function _get_item(itemname) {
    if (isdefined(level.var_4afb8f5a[itemname]) && level.var_4afb8f5a[itemname] != #"") {
        itemname = level.var_4afb8f5a[itemname];
    }
    return function_4ba8fde(itemname);
}

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x0
// Checksum 0xc7d6ef93, Offset: 0x368
// Size: 0xbc
function function_a9b8fa06() {
    assert(isplayer(self));
    if (!isplayer(self) || !isalive(self)) {
        return;
    }
    if (item_world::function_1b11e73c()) {
        while (isdefined(self) && !isdefined(self.inventory)) {
            waitframe(1);
        }
        if (!isdefined(self)) {
            return;
        }
        self function_7376c60d();
    }
}

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x0
// Checksum 0x8a1af9e1, Offset: 0x430
// Size: 0x1da
function function_3fed57dd() {
    assert(isplayer(self));
    if (!isplayer(self) || !isalive(self)) {
        return;
    }
    if (item_world::function_1b11e73c()) {
        while (isdefined(self) && !isdefined(self.inventory)) {
            waitframe(1);
        }
        if (!isdefined(self)) {
            return;
        }
        if (!isdefined(level.deathcircleindex)) {
            self function_58190f52();
            return;
        }
        switch (level.deathcircleindex) {
        case 0:
            self function_58190f52();
            break;
        case 1:
            self function_6667abef();
            break;
        case 2:
            self function_7376c60d();
            break;
        case 3:
            self function_1f091d2f();
            break;
        case 4:
            self function_2d31b980();
            break;
        default:
            self function_58190f52();
            break;
        }
    }
}

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x0
// Checksum 0x7e5a4ad1, Offset: 0x618
// Size: 0x16fa
function function_9de0644f() {
    assert(isplayer(self));
    if (!isplayer(self) || !isalive(self)) {
        return;
    }
    if (!isdefined(self.var_6b7861bb)) {
        self.var_6b7861bb = 0;
    }
    self.var_6b7861bb++;
    if (item_world::function_1b11e73c()) {
        while (isdefined(self) && !isdefined(self.inventory)) {
            waitframe(1);
        }
        if (!isdefined(self)) {
            return;
        }
        switch (self.var_6b7861bb) {
        case 1:
            smg = _get_item(#"smg_fastburst_t8_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(smg);
            smg.attachments = [];
            attachment = _get_item(#"fastmag_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(smg, attachment);
            attachment = _get_item(#"tritium_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(smg, attachment);
            attachment = _get_item(#"laser_sight_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(smg, attachment);
            smg.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(smg));
            self item_world::function_de2018e3(smg, self, var_fa3df96);
            ammo = _get_item(#"ammo_type_45_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
            self item_world::function_de2018e3(ammo, self, var_fa3df96);
            armor = _get_item(#"armor_item_medium");
            var_fa3df96 = self item_inventory::function_e66dcff5(armor);
            self item_world::function_de2018e3(armor, self, var_fa3df96);
            health = _get_item(#"health_item_small");
            health.count = 10;
            var_fa3df96 = self item_inventory::function_e66dcff5(health);
            self item_world::function_de2018e3(health, self, var_fa3df96);
            backpack = _get_item(#"backpack_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(backpack);
            self item_world::function_de2018e3(backpack, self, var_fa3df96);
            armorshard = _get_item(#"armor_shard_item");
            armorshard.count = 5;
            var_fa3df96 = self item_inventory::function_e66dcff5(armorshard);
            self item_world::function_de2018e3(armorshard, self, var_fa3df96);
            grapple = _get_item(#"unlimited_grapple_wz_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(grapple);
            self item_world::function_de2018e3(grapple, self, var_fa3df96);
            break;
        case 2:
            smg = _get_item(#"smg_capacity_t8_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(smg);
            smg.attachments = [];
            attachment = _get_item(#"fastmag_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(smg, attachment);
            attachment = _get_item(#"tritium_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(smg, attachment);
            smg.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(smg));
            self item_world::function_de2018e3(smg, self, var_fa3df96);
            self item_inventory::equip_weapon(smg, 1, 1, 0, 1);
            ammo = _get_item(#"ammo_type_9mm_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
            self item_world::function_de2018e3(ammo, self, var_fa3df96);
            armor = _get_item(#"armor_item_small");
            var_fa3df96 = self item_inventory::function_e66dcff5(armor);
            self item_world::function_de2018e3(armor, self, var_fa3df96);
            health = _get_item(#"health_item_small");
            health.count = 10;
            var_fa3df96 = self item_inventory::function_e66dcff5(health);
            self item_world::function_de2018e3(health, self, var_fa3df96);
            backpack = _get_item(#"backpack_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(backpack);
            self item_world::function_de2018e3(backpack, self, var_fa3df96);
            armorshard = _get_item(#"armor_shard_item");
            armorshard.count = 5;
            var_fa3df96 = self item_inventory::function_e66dcff5(armorshard);
            self item_world::function_de2018e3(armorshard, self, var_fa3df96);
            grapple = _get_item(#"unlimited_grapple_wz_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(grapple);
            self item_world::function_de2018e3(grapple, self, var_fa3df96);
            break;
        case 3:
            smg = _get_item(#"smg_standard_t8_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(smg);
            smg.attachments = [];
            attachment = _get_item(#"tritium_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(smg, attachment);
            smg.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(smg));
            self item_world::function_de2018e3(smg, self, var_fa3df96);
            self item_inventory::equip_weapon(smg, 1, 1, 0, 1);
            ammo = _get_item(#"ammo_type_9mm_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
            self item_world::function_de2018e3(ammo, self, var_fa3df96);
            health = _get_item(#"health_item_small");
            health.count = 5;
            var_fa3df96 = self item_inventory::function_e66dcff5(health);
            self item_world::function_de2018e3(health, self, var_fa3df96);
            backpack = _get_item(#"backpack_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(backpack);
            self item_world::function_de2018e3(backpack, self, var_fa3df96);
            grapple = _get_item(#"unlimited_grapple_wz_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(grapple);
            self item_world::function_de2018e3(grapple, self, var_fa3df96);
            break;
        case 4:
            pistol = _get_item(#"pistol_burst_t8_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(pistol);
            pistol.attachments = [];
            attachment = _get_item(#"fastmag_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(pistol, attachment);
            attachment = _get_item(#"tritium_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(pistol, attachment);
            pistol.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(pistol));
            self item_world::function_de2018e3(pistol, self, var_fa3df96);
            self item_inventory::equip_weapon(pistol, 1, 1, 0, 1);
            ammo = _get_item(#"ammo_type_9mm_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
            self item_world::function_de2018e3(ammo, self, var_fa3df96);
            health = _get_item(#"health_item_small");
            health.count = 5;
            var_fa3df96 = self item_inventory::function_e66dcff5(health);
            self item_world::function_de2018e3(health, self, var_fa3df96);
            backpack = _get_item(#"backpack_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(backpack);
            self item_world::function_de2018e3(backpack, self, var_fa3df96);
            grapple = _get_item(#"unlimited_grapple_wz_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(grapple);
            self item_world::function_de2018e3(grapple, self, var_fa3df96);
            break;
        case 5:
            pistol = _get_item(#"pistol_burst_t8_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(pistol);
            pistol.attachments = [];
            attachment = _get_item(#"tritium_wz_item");
            attachment = _get_item(#"fastmag_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(pistol, attachment);
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(pistol, attachment);
            pistol.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(pistol));
            self item_world::function_de2018e3(pistol, self, var_fa3df96);
            self item_inventory::equip_weapon(pistol, 1, 1, 0, 1);
            ammo = _get_item(#"ammo_type_9mm_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
            self item_world::function_de2018e3(ammo, self, var_fa3df96);
            health = _get_item(#"health_item_small");
            health.count = 5;
            var_fa3df96 = self item_inventory::function_e66dcff5(health);
            self item_world::function_de2018e3(health, self, var_fa3df96);
            grapple = _get_item(#"unlimited_grapple_wz_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(grapple);
            self item_world::function_de2018e3(grapple, self, var_fa3df96);
            break;
        default:
            pistol = _get_item(#"pistol_burst_t8_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(pistol);
            pistol.attachments = [];
            attachment = _get_item(#"fastmag_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(pistol, attachment);
            attachment = _get_item(#"tritium_wz_item");
            var_e38a0464 = item_inventory::function_520b16d6();
            var_e38a0464.count = 1;
            var_e38a0464.id = attachment.id;
            var_e38a0464.networkid = var_e38a0464.id;
            var_e38a0464.itementry = attachment.itementry;
            namespace_a0d533d1::function_9e9c82a6(pistol, attachment);
            pistol.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(pistol));
            self item_world::function_de2018e3(pistol, self, var_fa3df96);
            self item_inventory::equip_weapon(pistol, 1, 1, 0, 1);
            ammo = _get_item(#"ammo_type_9mm_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
            self item_world::function_de2018e3(ammo, self, var_fa3df96);
            grapple = _get_item(#"unlimited_grapple_wz_item");
            var_fa3df96 = self item_inventory::function_e66dcff5(grapple);
            self item_world::function_de2018e3(grapple, self, var_fa3df96);
            break;
        }
    }
}

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x4
// Checksum 0x9d68a5c1, Offset: 0x1d20
// Size: 0x224
function private function_58190f52() {
    gametype = util::get_game_type();
    if (gametype == #"warzone_hot_pursuit" || gametype == #"warzone_bigteam_dbno_quad") {
        pistol = _get_item(#"pistol_standard_t8_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(pistol);
        self item_world::function_de2018e3(pistol, self, var_fa3df96);
        ammo = _get_item(#"ammo_type_45_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
        self item_world::function_de2018e3(ammo, self, var_fa3df96);
        return;
    }
    if (gametype == #"warzone_heavy_metal") {
        weapon = _get_item(#"lmg_spray_t8_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(weapon);
        self item_world::function_de2018e3(weapon, self, var_fa3df96);
        ammo = _get_item(#"ammo_type_556_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
        self item_world::function_de2018e3(ammo, self, var_fa3df96);
        return;
    }
    if (gametype == #"hash_135cf8c5c6396f04") {
        function_f56a5599();
    }
}

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x4
// Checksum 0xa5529d52, Offset: 0x1f50
// Size: 0x61c
function private function_6667abef() {
    gametype = util::get_game_type();
    if (gametype == #"warzone_hot_pursuit" || gametype == #"warzone_bigteam_dbno_quad") {
        pistol = _get_item(#"pistol_standard_t8_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(pistol);
        pistol.attachments = [];
        attachment = _get_item(#"fastmag_wz_item");
        var_e38a0464 = item_inventory::function_520b16d6();
        var_e38a0464.count = 1;
        var_e38a0464.id = attachment.id;
        var_e38a0464.networkid = var_e38a0464.id;
        var_e38a0464.itementry = attachment.itementry;
        namespace_a0d533d1::function_9e9c82a6(pistol, attachment);
        attachment = _get_item(#"tritium_wz_item");
        var_e38a0464 = item_inventory::function_520b16d6();
        var_e38a0464.count = 1;
        var_e38a0464.id = attachment.id;
        var_e38a0464.networkid = var_e38a0464.id;
        var_e38a0464.itementry = attachment.itementry;
        namespace_a0d533d1::function_9e9c82a6(pistol, attachment);
        pistol.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(pistol));
        self item_world::function_de2018e3(pistol, self, var_fa3df96);
        ammo = _get_item(#"ammo_type_45_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
        self item_world::function_de2018e3(ammo, self, var_fa3df96);
        health = _get_item(#"health_item_small");
        health.count = 5;
        var_fa3df96 = self item_inventory::function_e66dcff5(health);
        self item_world::function_de2018e3(health, self, var_fa3df96);
        return;
    }
    if (gametype == #"warzone_heavy_metal") {
        weapon = _get_item(#"lmg_spray_t8_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(weapon);
        weapon.attachments = [];
        attachment = _get_item(#"fastmag_wz_item");
        var_e38a0464 = item_inventory::function_520b16d6();
        var_e38a0464.count = 1;
        var_e38a0464.id = attachment.id;
        var_e38a0464.networkid = var_e38a0464.id;
        var_e38a0464.itementry = attachment.itementry;
        namespace_a0d533d1::function_9e9c82a6(weapon, attachment);
        attachment = _get_item(#"acog_wz_item");
        var_e38a0464 = item_inventory::function_520b16d6();
        var_e38a0464.count = 1;
        var_e38a0464.id = attachment.id;
        var_e38a0464.networkid = var_e38a0464.id;
        var_e38a0464.itementry = attachment.itementry;
        namespace_a0d533d1::function_9e9c82a6(weapon, attachment);
        weapon.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(weapon));
        self item_world::function_de2018e3(weapon, self, var_fa3df96);
        ammo = _get_item(#"ammo_type_556_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
        self item_world::function_de2018e3(ammo, self, var_fa3df96);
        health = _get_item(#"health_item_large");
        var_fa3df96 = self item_inventory::function_e66dcff5(health);
        self item_world::function_de2018e3(health, self, var_fa3df96);
        return;
    }
    if (gametype == #"hash_135cf8c5c6396f04") {
        function_f56a5599();
    }
}

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x4
// Checksum 0x4348f358, Offset: 0x2578
// Size: 0x2fc
function private function_7376c60d() {
    gametype = util::get_game_type();
    if (gametype == #"warzone_hot_pursuit" || gametype == #"warzone_bigteam_dbno_quad") {
        smg = _get_item(#"smg_standard_t8_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(smg);
        self item_world::function_de2018e3(smg, self, var_fa3df96);
        ammo = _get_item(#"ammo_type_9mm_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
        self item_world::function_de2018e3(ammo, self, var_fa3df96);
        health = _get_item(#"health_item_small");
        health.count = 5;
        var_fa3df96 = self item_inventory::function_e66dcff5(health);
        self item_world::function_de2018e3(health, self, var_fa3df96);
        return;
    }
    if (gametype == #"warzone_heavy_metal") {
        weapon = _get_item(#"lmg_standard_t8_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(weapon);
        self item_world::function_de2018e3(weapon, self, var_fa3df96);
        ammo = _get_item(#"ammo_type_762_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
        self item_world::function_de2018e3(ammo, self, var_fa3df96);
        health = _get_item(#"health_item_large");
        health.count = 2;
        var_fa3df96 = self item_inventory::function_e66dcff5(health);
        self item_world::function_de2018e3(health, self, var_fa3df96);
        return;
    }
    if (gametype == #"hash_135cf8c5c6396f04") {
        function_f56a5599();
    }
}

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x4
// Checksum 0xfd0f2ae1, Offset: 0x2880
// Size: 0x61c
function private function_1f091d2f() {
    gametype = util::get_game_type();
    if (gametype == #"warzone_hot_pursuit" || gametype == #"warzone_bigteam_dbno_quad") {
        smg = _get_item(#"smg_standard_t8_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(smg);
        self item_world::function_de2018e3(smg, self, var_fa3df96);
        ammo = _get_item(#"ammo_type_9mm_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
        self item_world::function_de2018e3(ammo, self, var_fa3df96);
        attachment = _get_item(#"laser_sight_wz_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(attachment);
        self item_world::function_de2018e3(attachment, self, var_fa3df96);
        health = _get_item(#"health_item_small");
        health.count = 5;
        var_fa3df96 = self item_inventory::function_e66dcff5(health);
        self item_world::function_de2018e3(health, self, var_fa3df96);
        armor = _get_item(#"armor_item_small");
        var_fa3df96 = self item_inventory::function_e66dcff5(armor);
        self item_world::function_de2018e3(armor, self, var_fa3df96);
        armorshard = _get_item(#"armor_shard_item");
        armorshard.count = 5;
        var_fa3df96 = self item_inventory::function_e66dcff5(armorshard);
        self item_world::function_de2018e3(armorshard, self, var_fa3df96);
        return;
    }
    if (gametype == #"warzone_heavy_metal") {
        weapon = _get_item(#"lmg_standard_t8_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(weapon);
        weapon.attachments = [];
        attachment = _get_item(#"fastmag_wz_item");
        var_e38a0464 = item_inventory::function_520b16d6();
        var_e38a0464.count = 1;
        var_e38a0464.id = attachment.id;
        var_e38a0464.networkid = var_e38a0464.id;
        var_e38a0464.itementry = attachment.itementry;
        namespace_a0d533d1::function_9e9c82a6(weapon, attachment);
        attachment = _get_item(#"acog_wz_item");
        var_e38a0464 = item_inventory::function_520b16d6();
        var_e38a0464.count = 1;
        var_e38a0464.id = attachment.id;
        var_e38a0464.networkid = var_e38a0464.id;
        var_e38a0464.itementry = attachment.itementry;
        namespace_a0d533d1::function_9e9c82a6(weapon, attachment);
        weapon.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(weapon));
        self item_world::function_de2018e3(weapon, self, var_fa3df96);
        ammo = _get_item(#"ammo_type_762_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
        self item_world::function_de2018e3(ammo, self, var_fa3df96);
        health = _get_item(#"health_item_large");
        health.count = 3;
        var_fa3df96 = self item_inventory::function_e66dcff5(health);
        self item_world::function_de2018e3(health, self, var_fa3df96);
        armor = _get_item(#"armor_item_large");
        var_fa3df96 = self item_inventory::function_e66dcff5(armor);
        self item_world::function_de2018e3(armor, self, var_fa3df96);
        return;
    }
    if (gametype == #"hash_135cf8c5c6396f04") {
        function_f56a5599();
    }
}

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x4
// Checksum 0x932664e1, Offset: 0x2ea8
// Size: 0x7dc
function private function_2d31b980() {
    gametype = util::get_game_type();
    if (gametype == #"warzone_hot_pursuit" || gametype == #"warzone_bigteam_dbno_quad") {
        smg = _get_item(#"smg_standard_t8_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(smg);
        self item_world::function_de2018e3(smg, self, var_fa3df96);
        ammo = _get_item(#"ammo_type_9mm_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
        self item_world::function_de2018e3(ammo, self, var_fa3df96);
        attachment = _get_item(#"laser_sight_wz_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(attachment);
        self item_world::function_de2018e3(attachment, self, var_fa3df96);
        attachment = _get_item(#"holo_wz_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(attachment);
        self item_world::function_de2018e3(attachment, self, var_fa3df96);
        attachment = _get_item(#"extbarrel_wz_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(attachment);
        self item_world::function_de2018e3(attachment, self, var_fa3df96);
        health = _get_item(#"health_item_small");
        health.count = 5;
        var_fa3df96 = self item_inventory::function_e66dcff5(health);
        self item_world::function_de2018e3(health, self, var_fa3df96);
        armor = _get_item(#"armor_item_medium");
        var_fa3df96 = self item_inventory::function_e66dcff5(armor);
        self item_world::function_de2018e3(armor, self, var_fa3df96);
        armorshard = _get_item(#"armor_shard_item");
        armorshard.count = 5;
        var_fa3df96 = self item_inventory::function_e66dcff5(armorshard);
        self item_world::function_de2018e3(armorshard, self, var_fa3df96);
        return;
    }
    if (gametype == #"warzone_heavy_metal") {
        weapon = _get_item(#"lmg_standard_t8_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(weapon);
        weapon.attachments = [];
        attachment = _get_item(#"extmag_wz_item");
        var_e38a0464 = item_inventory::function_520b16d6();
        var_e38a0464.count = 1;
        var_e38a0464.id = attachment.id;
        var_e38a0464.networkid = var_e38a0464.id;
        var_e38a0464.itementry = attachment.itementry;
        namespace_a0d533d1::function_9e9c82a6(weapon, attachment);
        attachment = _get_item(#"reddot_wz_item");
        var_e38a0464 = item_inventory::function_520b16d6();
        var_e38a0464.count = 1;
        var_e38a0464.id = attachment.id;
        var_e38a0464.networkid = var_e38a0464.id;
        var_e38a0464.itementry = attachment.itementry;
        namespace_a0d533d1::function_9e9c82a6(weapon, attachment);
        attachment = _get_item(#"extbarrel_wz_item");
        var_e38a0464 = item_inventory::function_520b16d6();
        var_e38a0464.count = 1;
        var_e38a0464.id = attachment.id;
        var_e38a0464.networkid = var_e38a0464.id;
        var_e38a0464.itementry = attachment.itementry;
        namespace_a0d533d1::function_9e9c82a6(weapon, attachment);
        weapon.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(weapon));
        self item_world::function_de2018e3(weapon, self, var_fa3df96);
        ammo = _get_item(#"ammo_type_762_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
        self item_world::function_de2018e3(ammo, self, var_fa3df96);
        health = _get_item(#"health_item_large");
        health.count = 3;
        var_fa3df96 = self item_inventory::function_e66dcff5(health);
        self item_world::function_de2018e3(health, self, var_fa3df96);
        armor = _get_item(#"armor_item_large");
        var_fa3df96 = self item_inventory::function_e66dcff5(armor);
        self item_world::function_de2018e3(armor, self, var_fa3df96);
        armorshard = _get_item(#"armor_shard_item");
        armorshard.count = 5;
        var_fa3df96 = self item_inventory::function_e66dcff5(armorshard);
        self item_world::function_de2018e3(armorshard, self, var_fa3df96);
        return;
    }
    if (gametype == #"hash_135cf8c5c6396f04") {
        function_f56a5599();
    }
}

// Namespace wz_loadouts/wz_loadouts
// Params 0, eflags: 0x4
// Checksum 0x1e19c61, Offset: 0x3690
// Size: 0x32c
function private function_f56a5599() {
    weapon = _get_item(#"lmg_stealth_t8_item");
    var_fa3df96 = self item_inventory::function_e66dcff5(weapon);
    self item_world::function_de2018e3(weapon, self, var_fa3df96);
    ammo = _get_item(#"ammo_type_556_item");
    var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
    self item_world::function_de2018e3(ammo, self, var_fa3df96);
    weapon = _get_item(#"ar_peacekeeper_t8_item");
    var_fa3df96 = self item_inventory::function_e66dcff5(weapon);
    self item_world::function_de2018e3(weapon, self, var_fa3df96);
    ammo = _get_item(#"ammo_type_556_item");
    var_fa3df96 = self item_inventory::function_e66dcff5(ammo);
    self item_world::function_de2018e3(ammo, self, var_fa3df96);
    health = _get_item(#"health_item_squad");
    health.count = 5;
    var_fa3df96 = self item_inventory::function_e66dcff5(health);
    self item_world::function_de2018e3(health, self, var_fa3df96);
    armor = _get_item(#"armor_item_medium");
    var_fa3df96 = self item_inventory::function_e66dcff5(armor);
    self item_world::function_de2018e3(armor, self, var_fa3df96);
    var_57fd914e = _get_item(#"dart_wz_item");
    var_57fd914e.count = 5;
    var_fa3df96 = self item_inventory::function_e66dcff5(var_57fd914e);
    self item_world::function_de2018e3(health, self, var_fa3df96);
    var_82e4671b = _get_item(#"ultimate_turret_wz_item");
    var_82e4671b.count = 5;
    var_fa3df96 = self item_inventory::function_e66dcff5(var_82e4671b);
    self item_world::function_de2018e3(health, self, var_fa3df96);
}

