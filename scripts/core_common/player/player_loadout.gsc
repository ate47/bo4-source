#using scripts\core_common\util_shared;

#namespace loadout;

// Namespace loadout/player_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0x91265c61, Offset: 0xc0
// Size: 0x30
function function_87bcb1b() {
    if (isdefined(level.var_87bcb1b) && level.var_87bcb1b == 0) {
        return false;
    }
    return true;
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0xc7f26fe4, Offset: 0xf8
// Size: 0x10c
function function_c67222df() {
    if (!isdefined(self.pers[#"loadout"])) {
        self.pers[#"loadout"] = spawnstruct();
    }
    self init_loadout_slot("primary");
    self init_loadout_slot("secondary");
    self init_loadout_slot("herogadget");
    self init_loadout_slot("ultimate");
    self init_loadout_slot("primarygrenade");
    self init_loadout_slot("specialgrenade");
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x5bd37f3b, Offset: 0x210
// Size: 0x92
function init_loadout_slot(slot_index) {
    self.pers[#"loadout"].slots[slot_index] = {#slot:slot_index, #weapon:level.weaponnone, #var_4cfdfa9b:level.weaponnone, #count:0, #killed:0};
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0xa6e3de2b, Offset: 0x2b0
// Size: 0x50
function get_loadout_slot(slot_index) {
    if (isdefined(self.pers[#"loadout"])) {
        return self.pers[#"loadout"].slots[slot_index];
    }
    return undefined;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x0
// Checksum 0xbc318dce, Offset: 0x308
// Size: 0xa0
function function_8435f729(weapon) {
    foreach (slot, slot_index in self.pers[#"loadout"].slots) {
        if (slot.weapon == weapon) {
            return slot_index;
        }
    }
    return undefined;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x89e54df2, Offset: 0x3b0
// Size: 0xc0
function find_loadout_slot(weapon) {
    if (isdefined(self.pers[#"loadout"])) {
        foreach (slot in self.pers[#"loadout"].slots) {
            if (slot.weapon == weapon) {
                return slot;
            }
        }
    }
    return undefined;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x8cc3078a, Offset: 0x478
// Size: 0xb6
function function_18a77b37(slot_index) {
    if (function_87bcb1b() && isdefined(self) && isdefined(self.pers) && isdefined(self.pers[#"loadout"])) {
        assert(isdefined(self.pers[#"loadout"].slots[slot_index]));
        return self.pers[#"loadout"].slots[slot_index].weapon;
    }
    return undefined;
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x1 linked
// Checksum 0x88afce81, Offset: 0x538
// Size: 0xbe
function function_442539(slot_index, weapon) {
    assert(isdefined(self.pers[#"loadout"].slots[slot_index]));
    assert(isplayer(self));
    assert(isdefined(weapon));
    self.pers[#"loadout"].slots[slot_index].weapon = weapon;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x0
// Checksum 0x920f1391, Offset: 0x600
// Size: 0x8a
function gadget_is_in_use(slot_index) {
    player = self;
    weapon = function_18a77b37(slot_index);
    if (!isdefined(weapon)) {
        return 0;
    }
    slot = player gadgetgetslot(weapon);
    active = player util::gadget_is_in_use(slot);
    return active;
}

