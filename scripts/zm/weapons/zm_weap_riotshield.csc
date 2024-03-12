// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_weapons.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_equip_shield;

// Namespace zm_equip_shield/zm_weap_riotshield
// Params 0, eflags: 0x2
// Checksum 0xd57813f7, Offset: 0x148
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_equip_shield", &__init__, undefined, undefined);
}

// Namespace zm_equip_shield/zm_weap_riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x551f4b43, Offset: 0x190
// Size: 0xec
function __init__() {
    callback::on_spawned(&player_on_spawned);
    clientfield::register("toplayer", "zm_shield_damage_rumble", 1, 1, "counter", &zm_shield_damage_rumble, 0, 0);
    clientfield::register("toplayer", "zm_shield_break_rumble", 1, 1, "counter", &zm_shield_break_rumble, 0, 0);
    clientfield::register("clientuimodel", "ZMInventoryPersonal.shield_health", 1, 4, "float", undefined, 0, 0);
}

// Namespace zm_equip_shield/zm_weap_riotshield
// Params 1, eflags: 0x1 linked
// Checksum 0x9297f7e0, Offset: 0x288
// Size: 0x24
function player_on_spawned(localclientnum) {
    self thread watch_weapon_changes(localclientnum);
}

// Namespace zm_equip_shield/zm_weap_riotshield
// Params 1, eflags: 0x1 linked
// Checksum 0xb4ca75a5, Offset: 0x2b8
// Size: 0x132
function watch_weapon_changes(localclientnum) {
    self endon(#"death");
    while (isdefined(self)) {
        waitresult = undefined;
        waitresult = self waittill(#"weapon_change");
        w_current = waitresult.weapon;
        w_previous = waitresult.last_weapon;
        if (w_current.isriotshield) {
            for (i = 0; i < w_current.var_21329beb.size; i++) {
                util::lock_model(w_current.var_21329beb[i]);
            }
            continue;
        }
        if (w_previous.isriotshield) {
            for (i = 0; i < w_previous.var_21329beb.size; i++) {
                util::unlock_model(w_previous.var_21329beb[i]);
            }
        }
    }
}

// Namespace zm_equip_shield/zm_weap_riotshield
// Params 7, eflags: 0x1 linked
// Checksum 0xd3c10536, Offset: 0x3f8
// Size: 0x64
function zm_shield_damage_rumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrumbleonentity(localclientnum, "zm_shield_damage");
    }
}

// Namespace zm_equip_shield/zm_weap_riotshield
// Params 7, eflags: 0x1 linked
// Checksum 0x5c91b346, Offset: 0x468
// Size: 0x64
function zm_shield_break_rumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrumbleonentity(localclientnum, "zm_shield_break");
    }
}

