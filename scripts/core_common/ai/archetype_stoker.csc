// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\systems\fx_character.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace archetype_stoker;

// Namespace archetype_stoker/archetype_stoker
// Params 0, eflags: 0x2
// Checksum 0xf2810a78, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"stoker", &__init__, undefined, undefined);
}

// Namespace archetype_stoker/archetype_stoker
// Params 0, eflags: 0x1 linked
// Checksum 0xd158b9c9, Offset: 0xf0
// Size: 0x64
function __init__() {
    footsteps::registeraitypefootstepcb(#"stoker", &function_7188417c);
    ai::add_archetype_spawn_function(#"stoker", &function_580b77a2);
}

// Namespace archetype_stoker/archetype_stoker
// Params 5, eflags: 0x1 linked
// Checksum 0xe7e439e5, Offset: 0x160
// Size: 0x1bc
function function_7188417c(localclientnum, pos, surface, notetrack, bone) {
    e_player = function_5c10bd79(localclientnum);
    n_dist = distancesquared(pos, e_player.origin);
    var_166f3552 = 1000000;
    if (var_166f3552 > 0) {
        n_scale = (var_166f3552 - n_dist) / var_166f3552;
    } else {
        return;
    }
    if (n_scale > 1 || n_scale < 0) {
        return;
    }
    n_scale *= 0.25;
    if (n_scale <= 0.01) {
        return;
    }
    earthquake(localclientnum, n_scale, 0.1, pos, n_dist);
    if (n_scale <= 0.25 && n_scale > 0.2) {
        function_36e4ebd4(localclientnum, "anim_med");
        return;
    }
    if (n_scale <= 0.2 && n_scale > 0.1) {
        function_36e4ebd4(localclientnum, "damage_light");
        return;
    }
    function_36e4ebd4(localclientnum, "damage_light");
}

// Namespace archetype_stoker/archetype_stoker
// Params 1, eflags: 0x5 linked
// Checksum 0xcaa01b7b, Offset: 0x328
// Size: 0x2c
function private function_580b77a2(localclientnum) {
    fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
}

