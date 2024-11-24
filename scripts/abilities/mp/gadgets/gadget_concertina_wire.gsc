#using scripts\abilities\gadgets\gadget_concertina_wire;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\mp_common\gametypes\battlechatter;
#using scripts\mp_common\util;

#namespace concertina_wire;

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x2
// Checksum 0xa92e7d7c, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"concertina_wire", &__init__, undefined, undefined);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x1 linked
// Checksum 0x3750dca7, Offset: 0x140
// Size: 0xce
function __init__() {
    if (getgametypesetting(#"competitivesettings") === 1) {
        init_shared("concertina_wire_custom_settings_comp");
    } else {
        init_shared("concertina_wire_settings");
    }
    function_c5f0b9e7(&onconcertinawireplaced);
    function_d700c081(&function_806b0f85);
    level.var_cbec7a45 = 0;
    level.var_d1ae43e3 = &function_6190ae9e;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0x6c3961e6, Offset: 0x218
// Size: 0x3c
function onconcertinawireplaced(concertinawire) {
    self battlechatter::function_bd715920(concertinawire.weapon, undefined, concertinawire.origin, concertinawire);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 2, eflags: 0x1 linked
// Checksum 0x6b0f064d, Offset: 0x260
// Size: 0xb4
function function_806b0f85(attacker, weapon) {
    concertinawire = self;
    if (isdefined(level.figure_out_attacker)) {
        attacker = self [[ level.figure_out_attacker ]](attacker);
    }
    if (isdefined(attacker) && isplayer(attacker) && concertinawire.owner !== attacker && isdefined(weapon)) {
        attacker stats::function_e24eec31(weapon, #"hash_1c9da51ed1906285", 1);
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 3, eflags: 0x1 linked
// Checksum 0xcbcbb5ff, Offset: 0x320
// Size: 0x15e
function function_6190ae9e(origin, angles, player) {
    if (isdefined(level.var_87226c31.bundle.var_bc78f60e)) {
        length2 = (level.var_87226c31.bundle.var_bc78f60e + level.var_87226c31.bundle.maxwidth) * (level.var_87226c31.bundle.var_bc78f60e + level.var_87226c31.bundle.maxwidth);
        foreach (protectedzone in level.var_87226c31.var_d6a27a84) {
            if (isdefined(protectedzone)) {
                dist2 = distance2dsquared(origin, protectedzone.origin);
                if (dist2 < length2) {
                    return false;
                }
            }
        }
    }
    return true;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x0
// Checksum 0xad58b3f7, Offset: 0x488
// Size: 0x34
function function_18f38647(zone) {
    array::add(level.var_87226c31.var_d6a27a84, zone);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x0
// Checksum 0x1ca21011, Offset: 0x4c8
// Size: 0x34
function function_60a53911(zone) {
    arrayremovevalue(level.var_87226c31.var_d6a27a84, zone);
}

