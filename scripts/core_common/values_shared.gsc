#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\string_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\animation_shared;

#namespace val;

// Namespace val/values_shared
// Params 0, eflags: 0x2
// Checksum 0x65e81d0e, Offset: 0x200
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"values", &__init__, undefined, undefined);
}

// Namespace val/values_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x4ddc18f9, Offset: 0x248
// Size: 0x684
function __init__() {
    register("takedamage", 1, "$self", &set_takedamage, "$value");
    default_func("takedamage", "$self", &default_takedamage);
    register("allowdeath", 1);
    default_func("allowdeath", "$self", &default_allowdeath);
    register("ignoreme", 1, "$self", &set_ignoreme, "$value");
    default_value("ignoreme", 0);
    register("ignoreall", 1);
    default_value("ignoreall", 0);
    register("take_weapons", 1, "$self", &set_takeweapons, "$value");
    default_value("take_weapons", 0);
    register("disable_weapons", 1, "$self", &set_disableweapons, "$value");
    default_value("disable_weapons", 0);
    register("disable_offhand_weapons", 1, "$self", &set_disableoffhandweapons, "$value");
    default_value("disable_offhand_weapons", 0);
    register("freezecontrols", 1, "$self", &freezecontrols, "$value");
    default_value("freezecontrols", 0);
    register("freezecontrols_allowlook", 1, "$self", &freezecontrolsallowlook, "$value");
    default_value("freezecontrols_allowlook", 0);
    register("disablegadgets", 1, "$self", &gadgetsdisabled, "$value");
    default_value("disablegadgets", 0);
    register("hide", 1, "$self", &set_hide, "$value");
    default_value("hide", 0);
    register("health_regen", 1, "$self", &set_health_regen, "$value");
    default_value("health_regen", 1);
    register("disable_health_regen_delay", 1, "$self", &set_disable_health_regen_delay, "$value");
    default_value("disable_health_regen_delay", 0);
    register("ignore_health_regen_delay", 1, "$self", &set_ignore_health_regen_delay, "$value");
    default_value("ignore_health_regen_delay", 0);
    register("show_hud", 1, "$self", &setclientuivisibilityflag, "hud_visible", "$value");
    default_value("show_hud", 1);
    register("show_weapon_hud", 1, "$self", &setclientuivisibilityflag, "weapon_hud_visible", "$value");
    default_value("show_weapon_hud", 1);
    register("disable_gestures", 1, "$self", &set_disablegestures, "$value");
    default_value("disable_gestures", 0);
    /#
        level thread debug_values();
        validate("<dev string:x38>", "<dev string:x45>", &validate_takedamage);
        validate("<dev string:x4d>", "<dev string:x45>", &arecontrolsfrozen);
        validate("<dev string:x5e>", "<dev string:x45>", &function_5972c3cf);
        validate("<dev string:x79>", "<dev string:x45>", &gadgetsdisabled);
        validate("<dev string:x8a>", "<dev string:x45>", &ishidden);
    #/
}

// Namespace val/values_shared
// Params 5, eflags: 0x21 linked variadic
// Checksum 0x5b2cf81, Offset: 0x8d8
// Size: 0x15e
function register(str_name, var_3509ed3e, call_on = "$self", func, ...) {
    if (!isdefined(level.values)) {
        level.values = [];
    }
    a_registered = getarraykeys(level.values);
    if (isinarray(a_registered, hash(str_name))) {
        assertmsg("<dev string:x91>" + str_name + "<dev string:x9b>");
        return;
    }
    s_value = spawnstruct();
    s_value.str_name = str_name;
    s_value.call_on = call_on;
    s_value.func = func;
    s_value.var_3509ed3e = var_3509ed3e;
    s_value.a_args = vararg;
    level.values[str_name] = s_value;
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xe7dbddd8, Offset: 0xa40
// Size: 0x94
function private assert_registered(str_name) {
    /#
        a_registered = getarraykeys(level.values);
        if (!isinarray(a_registered, hash(str_name))) {
            assertmsg("<dev string:x91>" + str_name + "<dev string:xb3>");
            return false;
        }
    #/
    return true;
}

// Namespace val/values_shared
// Params 4, eflags: 0x21 linked variadic
// Checksum 0x9ce9cb4a, Offset: 0xae0
// Size: 0x86
function default_func(str_name, call_on, value, ...) {
    if (assert_registered(str_name)) {
        s_value = level.values[str_name];
        s_value.default_call_on = call_on;
        s_value.default_value = value;
        s_value.default_args = vararg;
    }
}

// Namespace val/values_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1500819e, Offset: 0xb70
// Size: 0x56
function default_value(str_name, value) {
    if (assert_registered(str_name)) {
        s_value = level.values[str_name];
        s_value.default_value = value;
    }
}

// Namespace val/values_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xa0596f05, Offset: 0xbd0
// Size: 0x8c
function set(str_id, str_name, value) {
    if (assert_registered(str_name)) {
        if (!isdefined(value)) {
            value = level.values[str_name].var_3509ed3e;
        }
        _push_value(str_id, str_name, value);
        _set_value(str_name, value);
    }
}

// Namespace val/values_shared
// Params 4, eflags: 0x0
// Checksum 0xfee735f2, Offset: 0xc68
// Size: 0x74
function set_for_time(n_time, str_id, str_name, value) {
    self endon(#"death");
    set(str_id, str_name, value);
    wait n_time;
    reset(str_id, str_name);
}

// Namespace val/values_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc649c637, Offset: 0xce8
// Size: 0xbc
function reset(str_id, str_name) {
    n_index = _remove_value(str_id, str_name);
    if (!n_index) {
        if (isdefined(self.values) && isdefined(self.values[str_name]) && self.values[str_name].size > 0) {
            _set_value(str_name, self.values[str_name][0].value);
            return;
        }
        _set_default(str_name);
    }
}

// Namespace val/values_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf7a497c, Offset: 0xdb0
// Size: 0x34
function nuke(str_name) {
    self.values[str_name] = [];
    _set_default(str_name);
}

// Namespace val/values_shared
// Params 3, eflags: 0x5 linked
// Checksum 0x1419fbff, Offset: 0xdf0
// Size: 0xbc
function private _push_value(str_id, str_name, value) {
    _remove_value(str_id, str_name);
    if (!isdefined(self.values)) {
        self.values = [];
    }
    if (!isdefined(self.values[str_name])) {
        self.values[str_name] = [];
    }
    arrayinsert(self.values[str_name], {#str_id:str_id, #value:value}, 0);
}

// Namespace val/values_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x2c1f3140, Offset: 0xeb8
// Size: 0x10e
function private _remove_value(str_id, str_name) {
    if (!isdefined(self)) {
        return -1;
    }
    if (isdefined(self.values) && isdefined(self.values[str_name])) {
        for (n_index = self.values[str_name].size - 1; n_index >= 0; n_index--) {
            if (self.values[str_name][n_index].str_id == str_id) {
                arrayremoveindex(self.values[str_name], n_index);
                break;
            }
        }
        if (!self.values[str_name].size) {
            self.values[str_name] = undefined;
            if (!self.values.size) {
                self.values = undefined;
            }
        }
    }
    return isdefined(n_index) ? n_index : -1;
}

// Namespace val/values_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xd30301de, Offset: 0xfd0
// Size: 0xd8
function private _set_value(str_name, value) {
    s_value = level.values[str_name];
    if (isdefined(s_value) && isdefined(s_value.func)) {
        call_on = s_value.call_on === "$self" ? self : s_value.call_on;
        util::single_func_argarray(call_on, s_value.func, _replace_values(s_value.a_args, value));
        return;
    }
    self.(str_name) = value;
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x7f63899b, Offset: 0x10b0
// Size: 0x104
function private _set_default(str_name) {
    s_value = level.values[str_name];
    if (isdefined(s_value.default_value)) {
        if (isfunctionptr(s_value.default_value)) {
            call_on = s_value.default_call_on === "$self" ? self : s_value.default_call_on;
            default_value = util::single_func_argarray(call_on, s_value.default_value, _replace_values(s_value.default_args));
        } else {
            default_value = s_value.default_value;
        }
        _set_value(str_name, default_value);
    }
}

// Namespace val/values_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xcd3262cb, Offset: 0x11c0
// Size: 0x5a
function private _replace_values(a_args, value) {
    a_args = array::replace(a_args, "$self", self);
    a_args = array::replace(a_args, "$value", value);
    return a_args;
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x9f56e7ed, Offset: 0x1228
// Size: 0x7e
function private set_takedamage(b_value = 1) {
    if (isplayer(self)) {
        if (b_value) {
            self disableinvulnerability();
        } else {
            self enableinvulnerability();
        }
        return;
    }
    self.takedamage = b_value;
}

// Namespace val/values_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x827fa1ed, Offset: 0x12b0
// Size: 0x34
function default_takedamage() {
    return issentient(self) || isvehicle(self);
}

// Namespace val/values_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5149c9c3, Offset: 0x12f0
// Size: 0x34
function default_allowdeath() {
    return issentient(self) || isvehicle(self);
}

// Namespace val/values_shared
// Params 0, eflags: 0x4
// Checksum 0x45eae5f, Offset: 0x1330
// Size: 0x44
function private validate_takedamage() {
    if (isplayer(self)) {
        return !self getinvulnerability();
    }
    return self.takedamage;
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x2e1e25a9, Offset: 0x1380
// Size: 0xcc
function private set_takeweapons(b_value = 1) {
    if (b_value) {
        if (!(isdefined(self.gun_removed) && self.gun_removed)) {
            if (isplayer(self)) {
                self player::take_weapons();
            } else {
                self animation::detach_weapon();
            }
        }
        return;
    }
    if (isplayer(self)) {
        self player::give_back_weapons();
        return;
    }
    self animation::attach_weapon();
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xd28166af, Offset: 0x1458
// Size: 0x54
function private set_disableweapons(b_value = 1) {
    if (b_value) {
        self disableweapons();
        return;
    }
    self enableweapons();
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xa195cc5c, Offset: 0x14b8
// Size: 0x54
function private set_disableoffhandweapons(b_value = 1) {
    if (b_value) {
        self disableoffhandweapons();
        return;
    }
    self enableoffhandweapons();
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x7fce6214, Offset: 0x1518
// Size: 0x92
function private set_ignoreme(b_value = 1) {
    if (b_value) {
        if (function_ffa5b184(self)) {
            self.var_becd4d91 = 1;
        } else {
            self.ignoreme = 1;
        }
        return;
    }
    if (function_ffa5b184(self)) {
        self.var_becd4d91 = 0;
        return;
    }
    self.ignoreme = 0;
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xd4a8e1d3, Offset: 0x15b8
// Size: 0x42
function private set_disablegestures(b_value = 1) {
    if (isplayer(self)) {
        self.disablegestures = b_value;
    }
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x6f86a78, Offset: 0x1608
// Size: 0x74
function private set_hide(b_value = 1) {
    if (b_value) {
        if (b_value == 1) {
            self hide();
        } else {
            self ghost();
        }
        return;
    }
    self show();
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x11eb3634, Offset: 0x1688
// Size: 0x4a
function private set_health_regen(b_value = 1) {
    if (b_value) {
        self.heal.enabled = 1;
        return;
    }
    self.heal.enabled = 0;
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x8160cb18, Offset: 0x16e0
// Size: 0x42
function private set_disable_health_regen_delay(b_value = 1) {
    if (b_value) {
        self.disable_health_regen_delay = 1;
        return;
    }
    self.disable_health_regen_delay = 0;
}

// Namespace val/values_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x6f81c590, Offset: 0x1730
// Size: 0x42
function private set_ignore_health_regen_delay(b_value = 1) {
    if (b_value) {
        self.ignore_health_regen_delay = 1;
        return;
    }
    self.ignore_health_regen_delay = 0;
}

/#

    // Namespace val/values_shared
    // Params 4, eflags: 0x24 variadic
    // Checksum 0xed43bebf, Offset: 0x1780
    // Size: 0xfe
    function private validate(str_name, call_on, func, ...) {
        a_registered = getarraykeys(level.values);
        if (!isinarray(a_registered, hash(str_name))) {
            assertmsg("<dev string:x91>" + str_name + "<dev string:xb3>");
            return;
        }
        s_value = level.values[str_name];
        s_value.b_validate = 1;
        s_value.func_validate = func;
        s_value.validate_call_on = call_on;
        s_value.validate_args = vararg;
    }

    // Namespace val/values_shared
    // Params 3, eflags: 0x4
    // Checksum 0x5560ff6c, Offset: 0x1888
    // Size: 0x16a
    function private _validate_value(str_name, value, b_assert) {
        if (!isdefined(b_assert)) {
            b_assert = 0;
        }
        s_value = level.values[str_name];
        if (isdefined(s_value.func_validate)) {
            call_on = s_value.validate_call_on === "<dev string:x45>" ? self : s_value.validate_call_on;
            current_value = util::single_func_argarray(call_on, s_value.func_validate, _replace_values(s_value.validate_args));
        } else {
            current_value = self.(str_name);
        }
        b_match = current_value === value;
        if (b_assert) {
            assert(b_match, "<dev string:xc7>" + function_9e72a96(str_name) + "<dev string:xdc>" + current_value + "<dev string:xe5>" + value + "<dev string:xf9>");
        }
        return b_match;
    }

    // Namespace val/values_shared
    // Params 0, eflags: 0x4
    // Checksum 0x490c882d, Offset: 0x1a00
    // Size: 0x484
    function private debug_values() {
        level flagsys::init_dvar("<dev string:xfe>");
        level flagsys::wait_till("<dev string:x111>");
        while (true) {
            level flagsys::wait_till("<dev string:xfe>");
            str_debug_values_entity = getdvarstring(#"scr_debug_values_entity", "<dev string:x127>");
            if (str_debug_values_entity == "<dev string:x127>" || str_debug_values_entity == "<dev string:x12a>" || str_debug_values_entity == "<dev string:x12f>") {
                hud_ent = level.host;
                str_label = "<dev string:x136>";
            } else if (strisnumber(str_debug_values_entity)) {
                hud_ent = getentbynum(int(str_debug_values_entity));
                str_label = "<dev string:x144>" + str_debug_values_entity;
            } else {
                str_value = str_debug_values_entity;
                str_key = "<dev string:x14e>";
                if (issubstr(str_value, "<dev string:x15b>")) {
                    a_toks = strtok(str_value, "<dev string:x15b>");
                    str_value = a_toks[0];
                    str_key = a_toks[1];
                }
                hud_ent = getent(str_value, str_key, 1);
                str_label = str_value + "<dev string:x15b>" + str_key;
            }
            debug2dtext((200, 100, 0), str_label, (1, 1, 1), 1, (0, 0, 0), 0.5, 0.8, 1);
            if (!isdefined(hud_ent) || !isdefined(hud_ent.values)) {
                waitframe(1);
                continue;
            }
            a_all_ents = getentarray();
            foreach (ent in a_all_ents) {
                if (isdefined(ent.values)) {
                    i = 1;
                    foreach (str_name, a_value in ent.values) {
                        top_value = a_value[0];
                        if (isdefined(top_value)) {
                            b_valid = 1;
                            if (isdefined(level.values[str_name].b_validate) && level.values[str_name].b_validate) {
                                b_assert = getdvarint(#"scr_debug_values", 0) > 1;
                                b_valid = ent _validate_value(str_name, top_value.value, b_assert);
                            }
                            ent display_value(i, str_name, top_value.str_id, top_value.value, b_valid, ent == hud_ent);
                            i++;
                        }
                    }
                }
            }
            waitframe(1);
        }
    }

    // Namespace val/values_shared
    // Params 6, eflags: 0x0
    // Checksum 0x2c9da168, Offset: 0x1e90
    // Size: 0x224
    function display_value(index, str_name, str_id, value, b_valid, on_hud) {
        if (!isdefined(on_hud)) {
            on_hud = 0;
        }
        if (ishash(str_name)) {
            str_name = function_9e72a96(str_name);
        }
        if (ishash(str_id)) {
            str_id = function_9e72a96(str_id);
        }
        str_value = "<dev string:x127>";
        if ((isdefined(str_name) ? "<dev string:x127>" + str_name : "<dev string:x127>") != "<dev string:x127>") {
            str_value = string::rjust(str_name, 20);
            if (isdefined(value)) {
                str_value += "<dev string:x15f>" + value;
            }
            str_value += "<dev string:x165>" + string::ljust(isdefined(str_id) ? "<dev string:x127>" + str_id : "<dev string:x127>", 30);
        }
        color = b_valid ? (1, 1, 1) : (1, 0, 0);
        if (on_hud) {
            debug2dtext((200, 100 + index * 20, 0), str_value, color, 1, (0, 0, 0), 0.5, 0.8, 1);
        }
        print3d(self.origin - (0, 0, index * 8), str_value, color, 1, 0.3, 1);
    }

#/
