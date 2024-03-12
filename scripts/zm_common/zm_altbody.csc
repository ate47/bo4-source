// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_perks.csc;
#using scripts\zm_common\zm_equipment.csc;
#using scripts\zm_common\util.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_altbody;

// Namespace zm_altbody/zm_altbody
// Params 0, eflags: 0x2
// Checksum 0x82a296d7, Offset: 0x148
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_altbody", &__init__, undefined, undefined);
}

// Namespace zm_altbody/zm_altbody
// Params 0, eflags: 0x0
// Checksum 0x582c78b9, Offset: 0x190
// Size: 0x13c
function __init__() {
    clientfield::register("clientuimodel", "player_lives", 1, 2, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "player_mana", 1, 8, "float", &set_player_mana, 0, 1);
    clientfield::register("toplayer", "player_in_afterlife", 1, 1, "int", &toggle_player_altbody, 0, 1);
    clientfield::register("allplayers", "player_altbody", 1, 1, "int", &toggle_player_altbody_3p, 0, 1);
    setupclientfieldcodecallbacks("toplayer", 1, "player_in_afterlife");
}

// Namespace zm_altbody/zm_altbody
// Params 9, eflags: 0x0
// Checksum 0x45b44ce6, Offset: 0x2d8
// Size: 0x18a
function init(name, trigger_name, trigger_hint, visionset_name, visionset_priority, enter_callback, exit_callback, enter_3p_callback, exit_3p_callback) {
    if (!isdefined(level.altbody_enter_callbacks)) {
        level.altbody_enter_callbacks = [];
    }
    if (!isdefined(level.altbody_exit_callbacks)) {
        level.altbody_exit_callbacks = [];
    }
    if (!isdefined(level.altbody_enter_3p_callbacks)) {
        level.altbody_enter_3p_callbacks = [];
    }
    if (!isdefined(level.altbody_exit_3p_callbacks)) {
        level.altbody_exit_3p_callbacks = [];
    }
    if (!isdefined(level.altbody_visionsets)) {
        level.altbody_visionsets = [];
    }
    level.altbody_name = name;
    if (isdefined(visionset_name)) {
        level.altbody_visionsets[name] = visionset_name;
        visionset_mgr::register_visionset_info(visionset_name, 1, 1, visionset_name, visionset_name);
    }
    level.altbody_enter_callbacks[name] = enter_callback;
    level.altbody_exit_callbacks[name] = exit_callback;
    level.altbody_enter_3p_callbacks[name] = enter_3p_callback;
    level.altbody_exit_3p_callbacks[name] = exit_3p_callback;
}

// Namespace zm_altbody/zm_altbody
// Params 7, eflags: 0x0
// Checksum 0xd44b5123, Offset: 0x470
// Size: 0x4a
function set_player_mana(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.mana = newval;
}

// Namespace zm_altbody/zm_altbody
// Params 7, eflags: 0x0
// Checksum 0x4e5ad5a5, Offset: 0x4c8
// Size: 0x144
function toggle_player_altbody(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.altbody)) {
        self.altbody = 0;
    }
    self usealternatehud(newval);
    if (self.altbody !== newval) {
        self.altbody = newval;
        if (bwastimejump) {
            self thread clear_transition(localclientnum, newval);
        } else {
            self thread cover_transition(localclientnum, newval);
        }
        if (newval == 1) {
            callback = level.altbody_enter_callbacks[level.altbody_name];
            if (isdefined(callback)) {
                self [[ callback ]](localclientnum);
            }
            return;
        }
        callback = level.altbody_exit_callbacks[level.altbody_name];
        if (isdefined(callback)) {
            self [[ callback ]](localclientnum);
        }
    }
}

// Namespace zm_altbody/zm_altbody
// Params 7, eflags: 0x0
// Checksum 0xddfda3c7, Offset: 0x618
// Size: 0xe0
function toggle_player_altbody_3p(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (self function_21c0fa55()) {
        return;
    }
    self.altbody_3p = newval;
    if (newval == 1) {
        callback = level.altbody_enter_3p_callbacks[level.altbody_name];
        if (isdefined(callback)) {
            self [[ callback ]](localclientnum);
        }
        return;
    }
    callback = level.altbody_exit_3p_callbacks[level.altbody_name];
    if (isdefined(callback)) {
        self [[ callback ]](localclientnum);
    }
}

// Namespace zm_altbody/zm_altbody
// Params 2, eflags: 0x0
// Checksum 0xcebe4ea2, Offset: 0x700
// Size: 0xc4
function cover_transition(localclientnum, onoff) {
    if (!self util::function_50ed1561(localclientnum)) {
        return;
    }
    if (isdemoplaying() && demoisanyfreemovecamera()) {
        return;
    }
    self lui::screen_fade_out(0.05);
    level waittilltimeout(0.15, #"demo_jump");
    if (isdefined(self)) {
        self lui::screen_fade_in(0.1);
    }
}

// Namespace zm_altbody/zm_altbody
// Params 2, eflags: 0x0
// Checksum 0xe53c822a, Offset: 0x7d0
// Size: 0x34
function clear_transition(localclientnum, onoff) {
    self lui::screen_fade_in(0);
}

