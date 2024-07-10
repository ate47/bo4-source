#using script_50a49d535160be60;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_equipment;

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x2
// Checksum 0xe4216230, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_equipment", &__init__, undefined, undefined);
}

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x1 linked
// Checksum 0x8d440130, Offset: 0x118
// Size: 0x9c
function __init__() {
    level._equip_activated_callbacks = [];
    level.buildable_piece_count = 24;
    if (!(isdefined(level._no_equipment_activated_clientfield) && level._no_equipment_activated_clientfield)) {
        clientfield::register("scriptmover", "equipment_activated", 1, 4, "int", &equipment_activated_clientfield_cb, 1, 0);
    }
    zm_hint_text::register("zm_hint_text");
}

// Namespace zm_equipment/zm_equipment
// Params 2, eflags: 0x0
// Checksum 0xdef7e63a, Offset: 0x1c0
// Size: 0x2a
function add_equip_activated_callback_override(model, func) {
    level._equip_activated_callbacks[model] = func;
}

// Namespace zm_equipment/zm_equipment
// Params 7, eflags: 0x1 linked
// Checksum 0x89a5b2a0, Offset: 0x1f8
// Size: 0x132
function equipment_activated_clientfield_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.model) && isdefined(level._equip_activated_callbacks[self.model])) {
        [[ level._equip_activated_callbacks[self.model] ]](localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
    }
    if (!newval) {
        if (isdefined(self._equipment_activated_fx)) {
            for (i = 0; i < self._equipment_activated_fx.size; i++) {
                for (j = 0; j < self._equipment_activated_fx[i].size; j++) {
                    deletefx(i, self._equipment_activated_fx[i][j]);
                }
            }
            self._equipment_activated_fx = undefined;
        }
    }
}

// Namespace zm_equipment/zm_equipment
// Params 4, eflags: 0x0
// Checksum 0x6e173493, Offset: 0x338
// Size: 0x27e
function play_fx_for_all_clients(fx, tag, storehandles = 0, forward = undefined) {
    numlocalplayers = getlocalplayers().size;
    if (!isdefined(self._equipment_activated_fx)) {
        self._equipment_activated_fx = [];
        for (i = 0; i < numlocalplayers; i++) {
            self._equipment_activated_fx[i] = [];
        }
    }
    if (isdefined(tag)) {
        for (i = 0; i < numlocalplayers; i++) {
            if (storehandles) {
                self._equipment_activated_fx[i][self._equipment_activated_fx[i].size] = util::playfxontag(i, fx, self, tag);
                continue;
            }
            self_for_client = getentbynum(i, self getentitynumber());
            if (isdefined(self_for_client)) {
                util::playfxontag(i, fx, self_for_client, tag);
            }
        }
        return;
    }
    for (i = 0; i < numlocalplayers; i++) {
        if (storehandles) {
            if (isdefined(forward)) {
                self._equipment_activated_fx[i][self._equipment_activated_fx[i].size] = playfx(i, fx, self.origin, forward);
            } else {
                self._equipment_activated_fx[i][self._equipment_activated_fx[i].size] = playfx(i, fx, self.origin);
            }
            continue;
        }
        if (isdefined(forward)) {
            playfx(i, fx, self.origin, forward);
            continue;
        }
        playfx(i, fx, self.origin);
    }
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x0
// Checksum 0x52ab8976, Offset: 0x5c0
// Size: 0x36
function is_included(equipment) {
    if (!isdefined(level._included_equipment)) {
        return false;
    }
    return isdefined(level._included_equipment[equipment.rootweapon]);
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x0
// Checksum 0xa269b15a, Offset: 0x600
// Size: 0x5e
function include(equipment_name) {
    if (!isdefined(level._included_equipment)) {
        level._included_equipment = [];
    }
    equipment = getweapon(equipment_name);
    level._included_equipment[equipment] = equipment;
}

