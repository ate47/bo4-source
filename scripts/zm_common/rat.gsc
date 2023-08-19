// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_trial.gsc;
#include scripts/zm_common/zm_unitrigger.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_stats.gsc;
#include scripts/zm_common/zm_player.gsc;
#include scripts/zm_common/zm_devgui.gsc;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/rat_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace rat;

// Namespace rat/rat
// Params 0, eflags: 0x2
// Checksum 0x91fe9a1b, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    /#
        system::register(#"rat", &__init__, undefined, undefined);
    #/
}

// Namespace rat/rat
// Params 0, eflags: 0x0
// Checksum 0x5d5d97c0, Offset: 0x108
// Size: 0x51c
function __init__() {
    /#
        init();
        level.rat.common.gethostplayer = &util::gethostplayer;
        addratscriptcmd("<unknown string>", &derriesezombiespawnnavmeshtest);
        addratscriptcmd("<unknown string>", &function_b8181e0d);
        addratscriptcmd("<unknown string>", &function_38d6a592);
        addratscriptcmd("<unknown string>", &function_ff8061ca);
        addratscriptcmd("<unknown string>", &function_1428d95e);
        addratscriptcmd("<unknown string>", &function_63a39134);
        addratscriptcmd("<unknown string>", &function_26a15f4d);
        addratscriptcmd("<unknown string>", &function_3d37c034);
        addratscriptcmd("<unknown string>", &function_7a11ca68);
        addratscriptcmd("<unknown string>", &function_782c6850);
        addratscriptcmd("<unknown string>", &function_125e2d8d);
        addratscriptcmd("<unknown string>", &function_e7dffcf9);
        addratscriptcmd("<unknown string>", &function_c3aa7d01);
        addratscriptcmd("<unknown string>", &function_684f2efb);
        addratscriptcmd("<unknown string>", &function_123195b9);
        addratscriptcmd("<unknown string>", &function_c79c0501);
        addratscriptcmd("<unknown string>", &function_3bbff2c5);
        addratscriptcmd("<unknown string>", &function_ea4b3f00);
        addratscriptcmd("<unknown string>", &function_8f340c78);
        addratscriptcmd("<unknown string>", &function_1bd3da0f);
        addratscriptcmd("<unknown string>", &function_6ea9a113);
        addratscriptcmd("<unknown string>", &function_e2143adf);
        addratscriptcmd("<unknown string>", &function_ff8f5737);
        addratscriptcmd("<unknown string>", &function_5b9ddfdb);
        addratscriptcmd("<unknown string>", &function_d49caa1a);
        addratscriptcmd("<unknown string>", &function_d52c7fc3);
        addratscriptcmd("<unknown string>", &function_d87f9fe1);
        addratscriptcmd("<unknown string>", &function_94ac25d9);
        addratscriptcmd("<unknown string>", &function_a6f7ea4a);
        addratscriptcmd("<unknown string>", &function_303319e9);
        addratscriptcmd("<unknown string>", &function_e1bdc812);
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x341141de, Offset: 0x630
// Size: 0x24
function function_e1bdc812(params) {
    /#
        return zm_trial::function_ba9853db();
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x329da4b, Offset: 0x660
// Size: 0x1a8
function function_303319e9(params) {
    /#
        zombies = getaiarchetypearray("<unknown string>", level.zombie_team);
        player = getplayer(params);
        forward = anglestoforward(player.angles);
        distance = 25;
        if (isdefined(params.distance)) {
            distance = float(params.distance);
        }
        spawn = player.origin + forward * distance;
        foreach (zombie in zombies) {
            zombie forceteleport(spawn, player.angles);
            if (isdefined(params.is_dummy) && params.is_dummy == 1) {
                zombie pathmode("<unknown string>");
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x50f23a56, Offset: 0x810
// Size: 0x3c
function function_a6f7ea4a(params) {
    /#
        zombie_utility::set_zombie_var(#"rebuild_barrier_cap_per_round", 2147483647);
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x4fbc4639, Offset: 0x858
// Size: 0xf8
function function_94ac25d9(params) {
    /#
        windows = level.exterior_goals;
        if (isdefined(windows)) {
            foreach (window in windows) {
                origin = window.origin;
                function_55e20e75(params._id, origin);
                angles = window.angles;
                function_55e20e75(params._id, angles);
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x221b219b, Offset: 0x958
// Size: 0x13c
function function_8f340c78(params) {
    /#
        chests = level.chests;
        if (isdefined(chests)) {
            foreach (chest in chests) {
                if (chest.hidden == 0) {
                    origin = chest.origin;
                    function_55e20e75(params._id, origin);
                    angles = (chest.angles[0], chest.angles[1] - 90, chest.angles[2]);
                    function_55e20e75(params._id, angles);
                    break;
                }
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x5ed51890, Offset: 0xaa0
// Size: 0x166
function function_d52c7fc3(params) {
    /#
        for (i = 0; i < level._unitriggers.trigger_stubs.size; i++) {
            triggerstub = level._unitriggers.trigger_stubs[i];
            if (isdefined(triggerstub.script_noteworthy)) {
                if (triggerstub.script_noteworthy == "<unknown string>" || triggerstub.script_noteworthy == "<unknown string>") {
                    origin = (triggerstub.origin[0], triggerstub.origin[1], triggerstub.origin[2]);
                    function_55e20e75(params._id, origin);
                    angles = (triggerstub.angles[0], triggerstub.angles[1], triggerstub.angles[2]);
                    function_55e20e75(params._id, angles);
                }
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x152e412d, Offset: 0xc10
// Size: 0x3e
function function_d87f9fe1(params) {
    /#
        host = util::gethostplayer();
        return isdefined(host.var_4e90ce0c);
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x90d2d614, Offset: 0xc58
// Size: 0x1d4
function function_6ea9a113(params) {
    /#
        foreach (items in level.item_spawns) {
            foreach (item in items) {
                if (isdefined(item)) {
                    offset = (item.origin[0], item.origin[1], item.origin[2]);
                    function_55e20e75(params._id, offset);
                    forward = item.origin - offset;
                    angle = vectornormalize(forward);
                    angles = (item.angles[0], item.angles[1], item.angles[2]);
                    function_55e20e75(params._id, angles);
                }
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x6653fab8, Offset: 0xe38
// Size: 0x14e
function function_ff8f5737(params) {
    /#
        for (i = 0; i < level._unitriggers.trigger_stubs.size; i++) {
            triggerstub = level._unitriggers.trigger_stubs[i];
            if (isdefined(triggerstub.target)) {
                if (triggerstub.target == "<unknown string>") {
                    origin = (triggerstub.origin[0], triggerstub.origin[1], triggerstub.origin[2]);
                    function_55e20e75(params._id, origin);
                    angles = (triggerstub.angles[0], triggerstub.angles[1] + 180, triggerstub.angles[2]);
                    function_55e20e75(params._id, angles);
                }
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x5d0ab328, Offset: 0xf90
// Size: 0x14e
function function_5b9ddfdb(params) {
    /#
        for (i = 0; i < level._unitriggers.trigger_stubs.size; i++) {
            triggerstub = level._unitriggers.trigger_stubs[i];
            if (isdefined(triggerstub.target)) {
                if (triggerstub.target == "<unknown string>") {
                    origin = (triggerstub.origin[0], triggerstub.origin[1], triggerstub.origin[2]);
                    function_55e20e75(params._id, origin);
                    angles = (triggerstub.angles[0], triggerstub.angles[1] + 180, triggerstub.angles[2]);
                    function_55e20e75(params._id, angles);
                }
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xf2304c00, Offset: 0x10e8
// Size: 0x32
function function_e2143adf(params) {
    /#
        if (isdefined(level.item_inventory)) {
            return level.item_inventory.size;
        }
        return 0;
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xfebd5af5, Offset: 0x1128
// Size: 0x160
function function_1bd3da0f(params) {
    /#
        chunks = level.s_pap_quest.a_s_locations;
        if (isdefined(chunks)) {
            foreach (chunk in chunks) {
                origin = (chunk.origin[0], chunk.origin[1] - 40, chunk.origin[2] - 40);
                function_55e20e75(params._id, origin);
                angles = (chunk.angles[0], chunk.angles[1] + 180, chunk.angles[2]);
                function_55e20e75(params._id, angles);
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x9e1db85, Offset: 0x1290
// Size: 0x24
function function_d49caa1a(params) {
    /#
        return level.s_pap_quest.var_be6e6f65;
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x7baef338, Offset: 0x12c0
// Size: 0x11a
function function_ea4b3f00(params) {
    /#
        host = util::gethostplayer();
        skip = 0;
        if (isdefined(params.var_f870f386)) {
            if (params.var_f870f386 == "<unknown string>") {
                skip = 1;
            }
        }
        players = getplayers();
        foreach (player in players) {
            if (skip) {
                if (player != host) {
                    player enableinvulnerability();
                }
            } else {
                skip = 0;
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xbd85421f, Offset: 0x13e8
// Size: 0x74
function function_c79c0501(params) {
    /#
        if (isdefined(params.round)) {
            setdvar(#"scr_zombie_round", int(params.round));
            adddebugcommand("<unknown string>");
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xea457136, Offset: 0x1468
// Size: 0x7c
function function_3bbff2c5(params) {
    /#
        num = 3;
        if (isdefined(params.num)) {
            num = int(params.num);
        }
        if (num > 0) {
            adddebugcommand("<unknown string>" + num);
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x245a3537, Offset: 0x14f0
// Size: 0x10
function function_123195b9(params) {
    /#
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x23f8f310, Offset: 0x1508
// Size: 0x1f0
function function_684f2efb(params) {
    /#
        trigs = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in trigs) {
            ent_parts = getentarray(ent.target, "<unknown string>");
            foreach (e in ent_parts) {
                if (isdefined(e.script_noteworthy) && e.script_noteworthy == "<unknown string>") {
                    master_switch = e;
                    function_55e20e75(params._id, master_switch.origin);
                    angles = (master_switch.angles[0], master_switch.angles[1], master_switch.angles[2]);
                    function_55e20e75(params._id, angles);
                    break;
                }
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x478ee154, Offset: 0x1700
// Size: 0x54
function function_c3aa7d01(params) {
    /#
        player = util::gethostplayer();
        if (isdefined(player)) {
            if (isdefined(player.perk_purchased)) {
                return player.perk_purchased;
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xaf52306c, Offset: 0x1760
// Size: 0x9e
function function_125e2d8d(params) {
    /#
        zombie_doors = getentarray("<unknown string>", "<unknown string>");
        count = 0;
        if (isdefined(zombie_doors)) {
            for (i = 0; i < zombie_doors.size; i++) {
                if (isdefined(zombie_doors[i].purchaser)) {
                    count++;
                }
            }
        }
        return count;
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x2580ff09, Offset: 0x1808
// Size: 0x146
function function_e7dffcf9(params) {
    /#
        zombie_doors = getentarray("<unknown string>", "<unknown string>");
        if (isdefined(zombie_doors)) {
            for (i = 0; i < zombie_doors.size; i++) {
                door = zombie_doors[i];
                if (isdefined(door.script_noteworthy)) {
                    if (door.script_noteworthy == "<unknown string>" && door._door_open == 0) {
                        function_55e20e75(params._id, door.origin);
                        angles = (door.angles[0], door.angles[1] + 90, door.angles[2]);
                        function_55e20e75(params._id, angles);
                    }
                }
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xb836a67, Offset: 0x1958
// Size: 0x146
function function_7a11ca68(params) {
    /#
        for (i = 0; i < level._unitriggers.trigger_stubs.size; i++) {
            triggerstub = level._unitriggers.trigger_stubs[i];
            if (triggerstub.cursor_hint == "<unknown string>") {
                origin = triggerstub zm_unitrigger::unitrigger_origin();
                origin = (origin[0], origin[1], origin[2] - 40);
                function_55e20e75(params._id, origin);
                angles = triggerstub.angles;
                angles = (angles[0], angles[1] - 90, angles[2]);
                function_55e20e75(params._id, angles);
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0x82f9d470, Offset: 0x1aa8
// Size: 0x12e
function function_782c6850(params) {
    /#
        for (i = 0; i < level._unitriggers.trigger_stubs.size; i++) {
            triggerstub = level._unitriggers.trigger_stubs[i];
            if (isdefined(triggerstub.hint_string) && triggerstub.hint_string == "<unknown string>") {
                origin = triggerstub zm_unitrigger::unitrigger_origin();
                function_55e20e75(params._id, origin);
                angles = triggerstub.angles;
                angles = (angles[0], angles[1] + 180, angles[2]);
                function_55e20e75(params._id, angles);
            }
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xa5951d66, Offset: 0x1be0
// Size: 0xe0
function function_3d37c034(params) {
    /#
        a_e_players = getplayers();
        foreach (e_player in a_e_players) {
            if (isdefined(e_player.intermission) || e_player.sessionstate == "<unknown string>" || e_player.sessionstate == "<unknown string>") {
                continue;
            }
            return 1;
        }
        return 0;
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xf1152a0b, Offset: 0x1cc8
// Size: 0x34
function function_38d6a592(params) {
    /#
        setdvar(#"zombie_cheat", 2);
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xd54c5d9d, Offset: 0x1d08
// Size: 0x34
function function_26a15f4d(params) {
    /#
        setdvar(#"zombie_cheat", 0);
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xa29b836a, Offset: 0x1d48
// Size: 0xfc
function function_1428d95e(params) {
    /#
        player = util::gethostplayer();
        forward = anglestoforward(player.angles);
        spawn = player.origin + forward * 10;
        zombie = zm_devgui::devgui_zombie_spawn();
        if (isdefined(zombie)) {
            zombie forceteleport(spawn, player.angles + vectorscale((0, 1, 0), 180));
            zombie pathmode("<unknown string>");
        }
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xe86ca00a, Offset: 0x1e50
// Size: 0x24
function function_63a39134(params) {
    /#
        return zombie_utility::get_current_zombie_count();
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xe3ab0d7d, Offset: 0x1e80
// Size: 0x3c
function function_b8181e0d(params) {
    /#
        player = util::gethostplayer();
        return player.score;
    #/
}

// Namespace rat/rat
// Params 1, eflags: 0x0
// Checksum 0xf82b7ebf, Offset: 0x1ec8
// Size: 0x2e
function function_ff8061ca(params) {
    /#
        if (isdefined(level.power_local_doors_globally)) {
            return 1;
        } else {
            return 0;
        }
    #/
}

// Namespace rat/rat
// Params 2, eflags: 0x0
// Checksum 0x1ccc8328, Offset: 0x1f00
// Size: 0x4bc
function derriesezombiespawnnavmeshtest(params, inrat) {
    /#
        if (!isdefined(inrat)) {
            inrat = 1;
        }
        if (inrat) {
            wait(10);
        }
        enemy = zm_devgui::devgui_zombie_spawn();
        enemy.is_rat_test = 1;
        failed_spawn_origin = [];
        failed_node_origin = [];
        failed_attack_spot_spawn_origin = [];
        failed_attack_spot = [];
        size = 0;
        failed_attack_spot_size = 0;
        wait(0.2);
        foreach (zone in level.zones) {
            foreach (loc in zone.a_loc_types[#"zombie_location"]) {
                angles = (0, 0, 0);
                enemy forceteleport(loc.origin, angles);
                wait(0.2);
                node = undefined;
                for (j = 0; j < level.exterior_goals.size; j++) {
                    if (isdefined(level.exterior_goals[j].script_string) && level.exterior_goals[j].script_string == loc.script_string) {
                        node = level.exterior_goals[j];
                    }
                }
                if (isdefined(node)) {
                    ispath = enemy setgoal(node.origin);
                    if (!ispath) {
                        failed_spawn_origin[size] = loc.origin;
                        failed_node_origin[size] = node.origin;
                        size++;
                    }
                    wait(0.2);
                    for (j = 0; j < node.attack_spots.size; j++) {
                        isattackpath = enemy setgoal(node.attack_spots[j]);
                        if (!isattackpath) {
                            failed_attack_spot_spawn_origin[failed_attack_spot_size] = loc.origin;
                            failed_attack_spot[failed_attack_spot_size] = node.attack_spots[j];
                            failed_attack_spot_size++;
                        }
                        wait(0.2);
                    }
                }
            }
        }
        if (inrat) {
            errmsg = "<unknown string>";
            for (i = 0; i < size; i++) {
                errmsg = errmsg + "<unknown string>" + failed_spawn_origin[i] + "<unknown string>" + failed_node_origin[i] + "<unknown string>";
            }
            for (i = 0; i < failed_attack_spot_size; i++) {
                errmsg = errmsg + "<unknown string>" + failed_attack_spot_spawn_origin[i] + "<unknown string>" + failed_attack_spot[i] + "<unknown string>";
            }
            if (size > 0 || failed_attack_spot_size > 0) {
                ratreportcommandresult(params._id, 0, errmsg);
            } else {
                ratreportcommandresult(params._id, 1);
            }
        }
    #/
}

