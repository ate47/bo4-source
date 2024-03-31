// Atian COD Tools GSC decompiler test
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace ability_util;

// Namespace ability_util/ability_util
// Params 2, eflags: 0x1 linked
// Checksum 0x644e615e, Offset: 0x90
// Size: 0x58
function gadget_is_type(slot, type) {
    if (!isdefined(self._gadgets_player) || !isdefined(self._gadgets_player[slot])) {
        return false;
    }
    return self._gadgets_player[slot].gadget_type == type;
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x1 linked
// Checksum 0x49e5a1d2, Offset: 0xf0
// Size: 0x6e
function gadget_slot_for_type(type) {
    invalid = 3;
    for (i = 0; i < 3; i++) {
        if (!self gadget_is_type(i, type)) {
            continue;
        }
        return i;
    }
    return invalid;
}

// Namespace ability_util/ability_util
// Params 0, eflags: 0x1 linked
// Checksum 0x3f9bbd70, Offset: 0x168
// Size: 0x1a
function gadget_combat_efficiency_enabled() {
    if (isdefined(self._gadget_combat_efficiency)) {
        return self._gadget_combat_efficiency;
    }
    return 0;
}

// Namespace ability_util/ability_util
// Params 0, eflags: 0x1 linked
// Checksum 0x1b8df94a, Offset: 0x190
// Size: 0xb2
function function_43cda488() {
    if (isdefined(self.team)) {
        teammates = getplayers(self.team);
        foreach (player in teammates) {
            if (player gadget_combat_efficiency_enabled()) {
                return true;
            }
        }
    }
    return false;
}

// Namespace ability_util/ability_util
// Params 2, eflags: 0x0
// Checksum 0xf58a4f87, Offset: 0x250
// Size: 0xfe
function function_f71ec759(&suppliers, var_5ce08260) {
    if (isdefined(self.team)) {
        teammates = getplayers(self.team);
        foreach (teammate in teammates) {
            if (!isdefined(teammate)) {
                continue;
            }
            if (teammate == self && var_5ce08260) {
                continue;
            }
            if (teammate gadget_combat_efficiency_enabled()) {
                suppliers[teammate getentitynumber()] = teammate;
            }
        }
    }
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x1 linked
// Checksum 0xcab9dbae, Offset: 0x358
// Size: 0x8c
function gadget_combat_efficiency_power_drain(score) {
    powerchange = -1 * score * getdvarfloat(#"scr_combat_efficiency_power_loss_scalar", 0);
    slot = gadget_slot_for_type(12);
    if (slot != 3) {
        self gadgetpowerchange(slot, powerchange);
    }
}

// Namespace ability_util/ability_util
// Params 0, eflags: 0x0
// Checksum 0x8179e40f, Offset: 0x3f0
// Size: 0xb0
function function_e35551d6() {
    a_weaponlist = self getweaponslist();
    foreach (weapon in a_weaponlist) {
        if (isdefined(weapon) && weapon.isgadget) {
            self takeweapon(weapon);
        }
    }
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x0
// Checksum 0x790e51dd, Offset: 0x4a8
// Size: 0x44
function ability_give(weapon_name) {
    weapon = getweapon(weapon_name);
    self giveweapon(weapon);
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x0
// Checksum 0xabe94409, Offset: 0x4f8
// Size: 0x1a
function is_weapon_gadget(weapon) {
    return weapon.gadget_type != 0;
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x0
// Checksum 0x3d30b7df, Offset: 0x520
// Size: 0xe6
function gadget_power_reset(gadgetweapon) {
    if (isdefined(gadgetweapon)) {
        slot = self gadgetgetslot(gadgetweapon);
        if (slot >= 0 && slot < 3) {
            self gadgetpowerreset(slot);
            self gadgetcharging(slot, 1);
        }
        return;
    }
    for (slot = 0; slot < 3; slot++) {
        self gadgetpowerreset(slot);
        self gadgetcharging(slot, 1);
    }
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x1 linked
// Checksum 0x835630b1, Offset: 0x610
// Size: 0xd6
function function_36a15b60(gadgetweapon) {
    if (isdefined(gadgetweapon)) {
        slot = self gadgetgetslot(gadgetweapon);
        if (slot >= 0 && slot < 3) {
            self gadgetpowerset(slot, 100);
            self gadgetcharging(slot, 0);
        }
        return;
    }
    for (slot = 0; slot < 3; slot++) {
        self gadgetpowerset(slot, 100);
        self gadgetcharging(slot, 0);
    }
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x1 linked
// Checksum 0x1fe95b, Offset: 0x6f0
// Size: 0xae
function function_1a38f0b0(gadgetweapon) {
    if (isdefined(gadgetweapon)) {
        slot = self gadgetgetslot(gadgetweapon);
        if (isdefined(slot) && slot >= 0 && slot < 3) {
            self function_820a63e9(slot, 0);
        }
        return;
    }
    for (slot = 0; slot < 3; slot++) {
        self function_820a63e9(slot, 0);
    }
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x1 linked
// Checksum 0xc7ab4dfe, Offset: 0x7a8
// Size: 0xe6
function function_e8aa75b8(gadgetweapon) {
    if (isdefined(gadgetweapon)) {
        slot = self gadgetgetslot(gadgetweapon);
        if (slot >= 0 && slot < 3) {
            self gadgetpowerreset(slot);
            self function_820a63e9(slot, 1);
        }
        return;
    }
    for (slot = 0; slot < 3; slot++) {
        self gadgetpowerreset(slot);
        self function_820a63e9(slot, 1);
    }
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x0
// Checksum 0x5be3648b, Offset: 0x898
// Size: 0x9c
function function_46b37314(fill_power) {
    if (isdefined(self.playerrole) && isdefined(self.playerrole.primaryequipment)) {
        gadget_weapon = getweapon(self.playerrole.primaryequipment);
        if (isdefined(gadget_weapon)) {
            self function_1a38f0b0(gadget_weapon);
            if (isdefined(fill_power) && fill_power) {
                self function_36a15b60(gadget_weapon);
            }
        }
    }
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x0
// Checksum 0x5e6cc440, Offset: 0x940
// Size: 0x9c
function function_ffd29673(fill_power) {
    if (isdefined(self.playerrole) && isdefined(self.playerrole.var_c21d61e9)) {
        gadget_weapon = getweapon(self.playerrole.var_c21d61e9);
        if (isdefined(gadget_weapon)) {
            self function_1a38f0b0(gadget_weapon);
            if (isdefined(fill_power) && fill_power) {
                self function_36a15b60(gadget_weapon);
            }
        }
    }
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x0
// Checksum 0x2f2b4315, Offset: 0x9e8
// Size: 0x9c
function function_b6d7e7e0(fill_power) {
    if (isdefined(self.playerrole) && isdefined(self.playerrole.ultimateweapon)) {
        gadget_weapon = getweapon(self.playerrole.ultimateweapon);
        if (isdefined(gadget_weapon)) {
            self function_1a38f0b0(gadget_weapon);
            if (isdefined(fill_power) && fill_power) {
                self function_36a15b60(gadget_weapon);
            }
        }
    }
}

// Namespace ability_util/ability_util
// Params 0, eflags: 0x0
// Checksum 0x129963aa, Offset: 0xa90
// Size: 0x6c
function function_e5c7425d() {
    if (isdefined(self.playerrole) && isdefined(self.playerrole.primaryequipment)) {
        gadget_weapon = getweapon(self.playerrole.primaryequipment);
        if (isdefined(gadget_weapon)) {
            self function_e8aa75b8(gadget_weapon);
        }
    }
}

// Namespace ability_util/ability_util
// Params 0, eflags: 0x0
// Checksum 0xbf009b59, Offset: 0xb08
// Size: 0x6c
function function_2bf97041() {
    if (isdefined(self.playerrole) && isdefined(self.playerrole.var_c21d61e9)) {
        gadget_weapon = getweapon(self.playerrole.var_c21d61e9);
        if (isdefined(gadget_weapon)) {
            self function_e8aa75b8(gadget_weapon);
        }
    }
}

// Namespace ability_util/ability_util
// Params 0, eflags: 0x0
// Checksum 0xad759997, Offset: 0xb80
// Size: 0x6c
function function_791aef0d() {
    if (isdefined(self.playerrole) && isdefined(self.playerrole.ultimateweapon)) {
        gadget_weapon = getweapon(self.playerrole.ultimateweapon);
        if (isdefined(gadget_weapon)) {
            self function_e8aa75b8(gadget_weapon);
        }
    }
}

// Namespace ability_util/ability_util
// Params 5, eflags: 0x1 linked
// Checksum 0x5852e3c6, Offset: 0xbf8
// Size: 0x6d4
function gadget_reset(gadgetweapon, changedclass, roundbased, firstround, changedspecialist) {
    slot = self gadgetgetslot(gadgetweapon);
    if (slot >= 0 && slot < 3) {
        if (isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self.pers[#"held_gadgets_power"][gadgetweapon])) {
            self gadgetpowerset(slot, self.pers[#"held_gadgets_power"][gadgetweapon]);
        } else if (isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self.pers[#"thiefweapon"]) && isdefined(self.pers[#"held_gadgets_power"][self.pers[#"thiefweapon"]])) {
            self gadgetpowerset(slot, self.pers[#"held_gadgets_power"][self.pers[#"thiefweapon"]]);
        } else if (isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self.pers[#"rouletteweapon"]) && isdefined(self.pers[#"held_gadgets_power"][self.pers[#"rouletteweapon"]])) {
            self gadgetpowerset(slot, self.pers[#"held_gadgets_power"][self.pers[#"rouletteweapon"]]);
        }
        if (isdefined(self.pers[#"hash_7a954c017d693f69"]) && isdefined(self.pers[#"hash_7a954c017d693f69"][gadgetweapon])) {
            self function_19ed70ca(slot, self.pers[#"hash_7a954c017d693f69"][gadgetweapon]);
        }
        isfirstspawn = isdefined(self.firstspawn) ? self.firstspawn : 1;
        resetonclasschange = changedclass && gadgetweapon.gadget_power_reset_on_class_change;
        resetonfirstround = isfirstspawn && (!roundbased || firstround);
        resetonroundswitch = roundbased && !firstround && gadgetweapon.gadget_power_reset_on_round_switch;
        resetonteamchanged = !isfirstspawn && isdefined(self.switchedteamsresetgadgets) && self.switchedteamsresetgadgets && gadgetweapon.gadget_power_reset_on_team_change;
        var_1a2cf487 = changedspecialist && getdvarint(#"hash_256144ebda864b87", 0) && !(isdefined(level.ingraceperiod) && level.ingraceperiod && !(isdefined(self.hasdonecombat) && self.hasdonecombat));
        var_9468eb59 = isdefined(self.switchedteamsresetgadgets) && self.switchedteamsresetgadgets && getdvarint(#"hash_8351525729015ab", 0);
        deployed = 0;
        if (isdefined(self.pers[#"hash_68cdf8807cfaabff"]) && isdefined(self.pers[#"hash_68cdf8807cfaabff"][gadgetweapon]) && self.pers[#"hash_68cdf8807cfaabff"][gadgetweapon]) {
            if ((gadgetweapon.var_7b5016a7 || !changedclass) && !isfirstspawn) {
                deployed = 1;
                self function_ac25fc1f(slot, gadgetweapon);
            }
        }
        var_2069cdca = changedclass && level.competitivesettingsenabled && roundbased && !firstround && !slot;
        if (var_2069cdca) {
            if (isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self.pers[#"held_gadgets_power"][gadgetweapon])) {
                var_2069cdca = 0;
            }
        }
        if (var_1a2cf487 || var_9468eb59 || var_2069cdca) {
            self gadgetpowerset(slot, 0);
            self.pers[#"herogadgetnotified"][slot] = 0;
            if (!deployed) {
                self gadgetcharging(slot, 1);
            }
            return;
        }
        if (resetonclasschange || resetonfirstround || resetonroundswitch || resetonteamchanged) {
            self gadgetpowerreset(slot, isfirstspawn);
            self.pers[#"herogadgetnotified"][slot] = 0;
            if (!deployed) {
                self gadgetcharging(slot, 1);
            }
        }
    }
}

// Namespace ability_util/ability_util
// Params 0, eflags: 0x1 linked
// Checksum 0x97236c59, Offset: 0x12d8
// Size: 0x1a
function gadget_power_armor_on() {
    return gadget_is_active(3);
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x1 linked
// Checksum 0x883dff4e, Offset: 0x1300
// Size: 0x6e
function gadget_is_active(gadgettype) {
    slot = self gadget_slot_for_type(gadgettype);
    if (slot >= 0 && slot < 3) {
        if (self util::gadget_is_in_use(slot)) {
            return true;
        }
    }
    return false;
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x0
// Checksum 0x6d3f4abe, Offset: 0x1378
// Size: 0x52
function gadget_has_type(gadgettype) {
    slot = self gadget_slot_for_type(gadgettype);
    if (slot >= 0 && slot < 3) {
        return true;
    }
    return false;
}

// Namespace ability_util/ability_util
// Params 2, eflags: 0x0
// Checksum 0xe0dadc3a, Offset: 0x13d8
// Size: 0x3a4
function aoe_friendlies(weapon, aoe) {
    self endon(#"disconnect", aoe.aoe_think_singleton_event);
    start_time = gettime();
    end_time = start_time + aoe.duration;
    if (!isdefined(self) || !isdefined(self.team)) {
        return;
    }
    profile_script = getdvarint(#"scr_profile_aoe", 0);
    if (profile_script) {
        profile_start_time = util::get_start_time();
        profile_elapsed_times = [];
        extra_profile_time = 1000;
        end_time = end_time + extra_profile_time;
    }
    has_reapply_check = isdefined(aoe.check_reapply_time_func);
    aoe_team = self.team;
    aoe_applied = 0;
    frac = 0;
    while (frac < 1 || aoe_applied > 0) {
        settings = getscriptbundle(weapon.customsettings);
        frac = (gettime() - start_time) / aoe.duration;
        if (frac > 1) {
            frac = 1;
        }
        radius = settings.cleanseradius;
        aoe_applied = 0;
        if (isdefined(self) && isdefined(self.origin)) {
            aoe_origin = self.origin;
        }
        friendlies_in_radius = getplayers(aoe_team, aoe_origin, radius);
        foreach (player in friendlies_in_radius) {
            if (has_reapply_check && player [[ aoe.check_reapply_time_func ]](aoe)) {
                continue;
            }
            if (!isalive(player)) {
                continue;
            }
            if (!isdefined(aoe.can_apply_aoe_func) || [[ aoe.can_apply_aoe_func ]](player, aoe.origin)) {
                [[ aoe.apply_aoe_func ]](player, weapon, aoe);
                aoe_applied++;
                if (aoe_applied >= aoe.max_applies_per_frame) {
                    break;
                }
            }
        }
        if (profile_script) {
            util::record_elapsed_time(profile_start_time, profile_elapsed_times);
            waitframe(1);
            profile_start_time = util::get_start_time();
            continue;
        }
        waitframe(1);
    }
    if (profile_script) {
        util::note_elapsed_times(profile_elapsed_times, "util aoe friendlies");
    }
}

// Namespace ability_util/ability_util
// Params 3, eflags: 0x0
// Checksum 0x4e9c2bd3, Offset: 0x1788
// Size: 0x90
function aoe_trace_entity(entity, origin, trace_z_offset) {
    entitypoint = entity.origin + (0, 0, trace_z_offset);
    if (!bullettracepassed(origin, entitypoint, 1, self, undefined, 0, 1)) {
        return false;
    }
    /#
        thread util::draw_debug_line(origin, entitypoint, 1);
    #/
    return true;
}

// Namespace ability_util/ability_util
// Params 1, eflags: 0x1 linked
// Checksum 0x24620649, Offset: 0x1820
// Size: 0x4a
function is_hero_weapon(gadgetweapon) {
    if ((gadgetweapon.isheavyweapon || gadgetweapon.issignatureweapon) && gadgetweapon.gadget_type == 11) {
        return true;
    }
    return false;
}

