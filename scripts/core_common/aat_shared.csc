#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace aat;

// Namespace aat/aat_shared
// Params 0, eflags: 0x2
// Checksum 0x28894d6, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"aat", &__init__, undefined, undefined);
}

// Namespace aat/aat_shared
// Params 0, eflags: 0x4
// Checksum 0xce9adcf2, Offset: 0x110
// Size: 0x94
function private __init__() {
    level.aat_initializing = 1;
    level.aat_default_info_name = "none";
    level.aat_default_info_icon = "blacktransparent";
    level.aat = [];
    register("none", level.aat_default_info_name, level.aat_default_info_icon);
    callback::on_finalize_initialization(&finalize_clientfields);
}

// Namespace aat/aat_shared
// Params 3, eflags: 0x0
// Checksum 0x276a6428, Offset: 0x1b0
// Size: 0x16a
function register(name, localized_string, icon) {
    assert(isdefined(level.aat_initializing) && level.aat_initializing, "<dev string:x38>");
    assert(isdefined(name), "<dev string:xa5>");
    assert(!isdefined(level.aat[name]), "<dev string:xcd>" + name + "<dev string:xe6>");
    assert(isdefined(localized_string), "<dev string:x106>");
    assert(isdefined(icon), "<dev string:x13a>");
    level.aat[name] = spawnstruct();
    level.aat[name].name = name;
    level.aat[name].localized_string = localized_string;
    level.aat[name].icon = icon;
}

// Namespace aat/aat_shared
// Params 7, eflags: 0x0
// Checksum 0x658fb951, Offset: 0x328
// Size: 0x78
function aat_hud_manager(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(level.update_aat_hud)) {
        [[ level.update_aat_hud ]](localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
    }
}

// Namespace aat/aat_shared
// Params 0, eflags: 0x0
// Checksum 0xd5c5129f, Offset: 0x3a8
// Size: 0x18a
function finalize_clientfields() {
    println("<dev string:x162>");
    if (level.aat.size > 1) {
        array::alphabetize(level.aat);
        i = 0;
        foreach (aat in level.aat) {
            aat.n_index = i;
            i++;
            println("<dev string:x17e>" + aat.name);
        }
        n_bits = getminbitcountfornum(level.aat.size - 1);
        clientfield::register("toplayer", "aat_current", 1, n_bits, "int", &aat_hud_manager, 0, 1);
    }
    level.aat_initializing = 0;
}

// Namespace aat/aat_shared
// Params 1, eflags: 0x0
// Checksum 0xf1d75254, Offset: 0x540
// Size: 0x9a
function get_string(n_aat_index) {
    foreach (aat in level.aat) {
        if (aat.n_index == n_aat_index) {
            return aat.localized_string;
        }
    }
    return level.aat_default_info_name;
}

// Namespace aat/aat_shared
// Params 1, eflags: 0x0
// Checksum 0xbf9360a3, Offset: 0x5e8
// Size: 0x9a
function get_icon(n_aat_index) {
    foreach (aat in level.aat) {
        if (aat.n_index == n_aat_index) {
            return aat.icon;
        }
    }
    return level.aat_default_info_icon;
}

