// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\wz_common\wz_ai_utils.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using script_cb32d07c95e5628;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_87f097c4;

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 0, eflags: 0x2
// Checksum 0x370c539a, Offset: 0x130
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_7551e984c9a42af9", &__init__, undefined, undefined);
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 0, eflags: 0x1 linked
// Checksum 0x3a9e191f, Offset: 0x178
// Size: 0x1dc
function __init__() {
    level.var_6e0c26c7 = (isdefined(getgametypesetting(#"hash_30b11d064f146fcc")) ? getgametypesetting(#"hash_30b11d064f146fcc") : 0) || (isdefined(getgametypesetting(#"hash_697d65a68cc6c6f1")) ? getgametypesetting(#"hash_697d65a68cc6c6f1") : 0);
    if (level.var_6e0c26c7) {
        clientfield::register("world", "zombie_arm_blood_splash", 20000, 1, "counter");
        clientfield::register("world", "bathtub_fake_soul_sfx", 20000, 1, "counter");
        level.var_e91bcfae = 0;
        zombie_arm = getent("zombie_arm", "targetname");
        if (isdefined(zombie_arm)) {
            zombie_arm ghost();
        }
        level.var_afdd2ed7 = 0;
        callback::on_ai_killed(&on_ai_killed);
        callback::on_item_pickup(&on_player_item_pickup);
    }
    /#
        function_4ed420e3();
    #/
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 1, eflags: 0x1 linked
// Checksum 0xa79e1ef8, Offset: 0x360
// Size: 0x176
function on_ai_killed(params) {
    if (isdefined(level.var_e91bcfae) && level.var_e91bcfae) {
        return;
    }
    if (isplayer(params.eattacker)) {
        attacker = params.eattacker;
        bathtub = struct::get(#"zombie_bathub", "targetname");
        if (isdefined(bathtub)) {
            distance = distance(bathtub.origin, attacker.origin);
            if (distance < 256) {
                level.var_afdd2ed7++;
                level clientfield::increment("bathtub_fake_soul_sfx", 1);
            }
            if (level.var_afdd2ed7 >= 3) {
                level thread function_613448ed(attacker, bathtub);
                callback::remove_callback(#"on_ai_killed", &on_ai_killed);
                level.var_afdd2ed7 = undefined;
            }
        }
    }
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 1, eflags: 0x1 linked
// Checksum 0x7ef809f4, Offset: 0x4e0
// Size: 0x184
function on_player_item_pickup(params) {
    if (!isdefined(params.item)) {
        return;
    }
    item = params.item;
    if (isplayer(self)) {
        if (isdefined(item.var_cd8fb96) && item.var_cd8fb96) {
            zombie_arm = getent("zombie_arm", "targetname");
            if (isdefined(zombie_arm)) {
                var_4805bfaa = (zombie_arm.origin[0], zombie_arm.origin[1], zombie_arm.origin[2] + -24);
                zombie_arm playsound(#"hash_134bc3c2ce6ed759");
                level thread function_ca44f5a5(zombie_arm, var_4805bfaa, 1);
                level clientfield::increment("zombie_arm_blood_splash", 1);
                callback::remove_callback(#"on_item_pickup", &on_player_item_pickup);
            }
        }
    }
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 2, eflags: 0x1 linked
// Checksum 0xd4d98263, Offset: 0x670
// Size: 0x264
function function_613448ed(player, bathtub) {
    self notify("1db1954ce3ca6f10");
    self endon("1db1954ce3ca6f10");
    if (isdefined(level.var_e91bcfae) && level.var_e91bcfae) {
        return;
    }
    golden_spork = function_1deb2b38(bathtub);
    zombie_arm = getent("zombie_arm", "targetname");
    if (isdefined(zombie_arm) && isdefined(golden_spork)) {
        golden_spork.var_cd8fb96 = 1;
        var_4805bfaa = (zombie_arm.origin[0], zombie_arm.origin[1], zombie_arm.origin[2] + 24);
        golden_spork.origin = (zombie_arm.origin[0] + 2, zombie_arm.origin[1] + 1.5, zombie_arm.origin[2] + 15);
        golden_spork.angles = (0, -50, -90);
        var_45f173ec = (golden_spork.origin[0], golden_spork.origin[1], golden_spork.origin[2] + 24);
        zombie_arm show();
        zombie_arm playsound(#"hash_2b9e3e8f3a11bcdb");
        level clientfield::increment("zombie_arm_blood_splash", 1);
        level thread function_ca44f5a5(zombie_arm, var_4805bfaa);
        level thread function_b413daad(golden_spork, var_45f173ec);
    }
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 3, eflags: 0x1 linked
// Checksum 0x9a810ad7, Offset: 0x8e0
// Size: 0xb4
function function_ca44f5a5(zombie_arm, target_pos, var_e77e9de = 0) {
    if (!isdefined(zombie_arm) || !isdefined(target_pos)) {
        return;
    }
    zombie_arm endon(#"death");
    zombie_arm moveto(target_pos, 2);
    if (var_e77e9de) {
        zombie_arm waittill(#"movedone");
        zombie_arm ghost();
    }
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 2, eflags: 0x1 linked
// Checksum 0xf62ad7bc, Offset: 0x9a0
// Size: 0x34
function function_b413daad(golden_spork, target_pos) {
    golden_spork moveto(target_pos, 2);
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 1, eflags: 0x1 linked
// Checksum 0x4c65bba8, Offset: 0x9e0
// Size: 0xea
function function_1deb2b38(var_b721e8a9) {
    if (!isdefined(var_b721e8a9) || isdefined(level.var_e91bcfae) && level.var_e91bcfae) {
        return;
    }
    level.var_e91bcfae = 1;
    if (isdefined(var_b721e8a9)) {
        a_items = var_b721e8a9 namespace_65181344::function_fd87c780(#"zombie_bathtub_ee_list", 1);
        foreach (item in a_items) {
            if (isdefined(item)) {
                return item;
            }
        }
    }
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 0, eflags: 0x0
// Checksum 0x8628f450, Offset: 0xad8
// Size: 0x84
function function_4ed420e3() {
    /#
        while (!canadddebugcommand()) {
            waitframe(1);
        }
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        level thread function_7eabf705();
    #/
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 0, eflags: 0x0
// Checksum 0x4304960a, Offset: 0xb68
// Size: 0x10e
function function_7eabf705() {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        level endon(#"game_ended");
        level endon(#"hash_671b150516dd9870");
        while (1) {
            if (getdvarint(#"hash_7e7b9e2edcf6d1ee", 0)) {
                players = getplayers();
                bathtub = struct::get(#"zombie_bathub", "<unknown string>");
                function_613448ed(players[0], bathtub);
                level notify(#"hash_671b150516dd9870");
                break;
            }
            waitframe(1);
        }
    #/
}

