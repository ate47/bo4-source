// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace mp_icebreaker_water;

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 0, eflags: 0x2
// Checksum 0xb7a6eda1, Offset: 0xf0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mp_icebreaker_water", &__init__, &__main__, undefined);
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 0, eflags: 0x1 linked
// Checksum 0x7c791d3f, Offset: 0x140
// Size: 0x54
function __init__() {
    clientfield::register("toplayer", "toggle_player_freezing_water", 1, 1, "counter");
    callback::on_spawned(&on_player_spawned);
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 0, eflags: 0x1 linked
// Checksum 0x3991944f, Offset: 0x1a0
// Size: 0x54
function __main__() {
    if (getdvarint(#"hash_517c09bbb9e82a90", 1)) {
        /#
            init_devgui();
        #/
        function_3b37c448();
    }
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 0, eflags: 0x1 linked
// Checksum 0x4818a6c4, Offset: 0x200
// Size: 0xe
function on_player_spawned() {
    self.var_653ea26 = 0;
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 0, eflags: 0x1 linked
// Checksum 0x3cdcb049, Offset: 0x218
// Size: 0x64
function function_3b37c448() {
    level.var_a6f19c15 = getentarray("freezing_water_damage_trig", "targetname");
    array::thread_all(level.var_a6f19c15, &callback::on_trigger, &on_trigger);
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 1, eflags: 0x1 linked
// Checksum 0x17d2979a, Offset: 0x288
// Size: 0x224
function on_trigger(s_info) {
    e_player = s_info.activator;
    /#
        function_2d706436(e_player);
    #/
    if (getdvarint(#"hash_517c09bbb9e82a90", 1) && isalive(e_player) && !(isdefined(e_player.var_6754f1c5) && e_player.var_6754f1c5) && getwaterheight(e_player.origin) - e_player.origin[2] >= getdvarint(#"hash_65893d2be0da2532", 30)) {
        /#
            if (getdvarint(#"hash_a23c3aad7eb7dd", 0)) {
                iprintlnbold("<unknown string>");
            }
        #/
        e_player.var_6754f1c5 = 1;
        e_player clientfield::increment_to_player("toggle_player_freezing_water");
        level thread function_394e1244(e_player);
        while (level function_aa962363(e_player)) {
            waitframe(1);
        }
        if (isdefined(e_player)) {
            /#
                if (getdvarint(#"hash_a23c3aad7eb7dd", 0)) {
                    iprintlnbold("<unknown string>");
                }
            #/
            e_player.var_6754f1c5 = 0;
            e_player clientfield::increment_to_player("toggle_player_freezing_water");
            level thread function_553ca6ce(e_player);
        }
    }
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 1, eflags: 0x1 linked
// Checksum 0x816fa59b, Offset: 0x4b8
// Size: 0x116
function function_aa962363(e_player) {
    foreach (var_22697f26 in level.var_a6f19c15) {
        if (isalive(e_player) && isdefined(var_22697f26) && e_player istouching(var_22697f26) && getwaterheight(e_player.origin) - e_player.origin[2] >= getdvarint(#"hash_65893d2be0da2532", 30)) {
            return true;
        }
    }
    return false;
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 1, eflags: 0x1 linked
// Checksum 0xf7c90ed4, Offset: 0x5d8
// Size: 0x20e
function function_394e1244(e_player) {
    while (isalive(e_player) && e_player.var_6754f1c5 && e_player.var_653ea26 < 1) {
        e_player.var_653ea26 += 0.1;
        if (e_player.var_653ea26 > 1) {
            e_player.var_653ea26 = 1;
        }
        /#
            if (getdvarint(#"hash_a23c3aad7eb7dd", 0)) {
                iprintln("<unknown string>" + e_player.var_653ea26);
            }
        #/
        wait(10 * 0.1);
    }
    /#
        if (getdvarint(#"hash_a23c3aad7eb7dd", 0) && isalive(e_player) && e_player.var_6754f1c5) {
            iprintlnbold("<unknown string>");
        }
    #/
    while (0 && isalive(e_player) && e_player.var_6754f1c5) {
        /#
            if (getdvarint(#"hash_a23c3aad7eb7dd", 0)) {
                iprintlnbold("<unknown string>");
            }
        #/
        e_player dodamage(2, e_player.origin);
        e_player cleardamageindicator();
        wait(1);
    }
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 1, eflags: 0x1 linked
// Checksum 0x5f97d695, Offset: 0x7f0
// Size: 0x15c
function function_553ca6ce(e_player) {
    wait(1);
    while (isalive(e_player) && !e_player.var_6754f1c5 && e_player.var_653ea26 > 0) {
        e_player.var_653ea26 -= 0.2;
        if (e_player.var_653ea26 < 0) {
            e_player.var_653ea26 = 0;
        }
        /#
            if (getdvarint(#"hash_a23c3aad7eb7dd", 0)) {
                iprintln("<unknown string>" + e_player.var_653ea26);
            }
        #/
        wait(5 * 0.2);
    }
    /#
        if (getdvarint(#"hash_a23c3aad7eb7dd", 0) && isalive(e_player) && !e_player.var_6754f1c5) {
            iprintlnbold("<unknown string>");
        }
    #/
}

/#

    // Namespace mp_icebreaker_water/mp_icebreaker_water
    // Params 0, eflags: 0x0
    // Checksum 0x852401e5, Offset: 0x958
    // Size: 0xc4
    function init_devgui() {
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
    }

    // Namespace mp_icebreaker_water/mp_icebreaker_water
    // Params 1, eflags: 0x0
    // Checksum 0x71dc8596, Offset: 0xa28
    // Size: 0xd4
    function function_2d706436(e_player) {
        if (!getdvarint(#"hash_a23c3aad7eb7dd", 0)) {
            return;
        }
        n_height = getwaterheight(e_player.origin) - e_player.origin[2];
        if (n_height > 0) {
            debug2dtext((800, 768, 0), "<unknown string>" + n_height, (1, 1, 1), 1, (0, 0, 0), 1, 1.2);
        }
    }

#/
