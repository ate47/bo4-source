// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_hms_util.gsc;
#using scripts\zm\zm_office_special_rounds.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_ba52581a;

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 0, eflags: 0x2
// Checksum 0xc632d810, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_14819f0ef5a24379", &__init__, undefined, undefined);
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 0, eflags: 0x1 linked
// Checksum 0xcb2e5c3f, Offset: 0x118
// Size: 0x34
function __init__() {
    init_flags();
    init_clientfields();
    init_quest();
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 0, eflags: 0x1 linked
// Checksum 0xef85e4b2, Offset: 0x158
// Size: 0xa4
function init_flags() {
    level flag::init(#"hash_67df8b68575ba704");
    level flag::init(#"hash_10d5bcbc42acc9b");
    level flag::init(#"hash_1fa9f2f17d2cb5f9");
    level flag::init(#"hash_36e8f27bbd8b02d5");
    level flag::init(#"hash_1c296f8c578e2659");
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 0, eflags: 0x1 linked
// Checksum 0x1e2cc521, Offset: 0x208
// Size: 0x44
function init_clientfields() {
    clientfield::register("toplayer", "" + #"hash_7eefa4acee4c1d55", 1, 1, "counter");
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 0, eflags: 0x1 linked
// Checksum 0x89075c23, Offset: 0x258
// Size: 0x274
function init_quest() {
    level.var_774c21fa = struct::get(#"hash_117cb1e7c329e0ad");
    level.var_9fcb5938 = spawn("script_model", level.var_774c21fa.origin);
    level.var_33d3e84a = 0;
    zm_sq::register(#"hash_5a9580406af2d773", #"step_1", #"hash_5cbd9c892dca9e05", &function_4b16859a, &function_53935f3d);
    zm_sq::register(#"hash_5a9580406af2d773", #"step_2", #"hash_5cbd99892dca98ec", &function_9235fc9a, &function_fe3de565);
    zm_sq::register(#"hash_5a9580406af2d773", #"step_3", #"hash_5cbd9a892dca9a9f", &function_2e57632b, &function_3409e90e);
    zm_sq::register(#"hash_5a9580406af2d773", #"step_4", #"hash_5cbd97892dca9586", &function_7991d694, &function_c2bd8b3d);
    zm_sq::register(#"hash_5a9580406af2d773", #"step_5", #"hash_5cbd98892dca9739", &function_8ca22055, &function_d8b688e7);
    zm_sq::start(#"hash_5a9580406af2d773");
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 1, eflags: 0x1 linked
// Checksum 0xea26fd27, Offset: 0x4d8
// Size: 0x64
function function_4b16859a(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level.var_774c21fa zm_unitrigger::create("", 64, &function_5ce4f28f);
        level flag::wait_till(#"hash_67df8b68575ba704");
    }
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 2, eflags: 0x1 linked
// Checksum 0x8086bfe3, Offset: 0x548
// Size: 0x154
function function_53935f3d(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        zm_unitrigger::unregister_unitrigger(level.var_774c21fa.s_unitrigger);
        level.var_33d3e84a = 1;
        level flag::set(#"hash_67df8b68575ba704");
    } else {
        zm_unitrigger::unregister_unitrigger(level.var_774c21fa.s_unitrigger);
        level.var_33d3e84a = 1;
        playsoundatposition(#"hash_61901dee5b81dba2", level.var_774c21fa.origin);
        level.var_38ea4233 clientfield::increment_to_player("" + #"hash_7eefa4acee4c1d55", 1);
        wait(3);
        zm_hms_util::function_e308175e(#"hash_40c5232d4f3e85b", level.var_9fcb5938.origin);
    }
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 1, eflags: 0x1 linked
// Checksum 0x89baa2d0, Offset: 0x6a8
// Size: 0x64
function function_9235fc9a(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level.var_774c21fa zm_unitrigger::create("", 64, &function_5ce4f28f);
        level flag::wait_till(#"hash_10d5bcbc42acc9b");
    }
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 2, eflags: 0x1 linked
// Checksum 0x39f5226a, Offset: 0x718
// Size: 0x154
function function_fe3de565(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        zm_unitrigger::unregister_unitrigger(level.var_774c21fa.s_unitrigger);
        level.var_33d3e84a = 2;
        level flag::set(#"hash_10d5bcbc42acc9b");
    } else {
        zm_unitrigger::unregister_unitrigger(level.var_774c21fa.s_unitrigger);
        level.var_33d3e84a = 2;
        playsoundatposition(#"hash_61901dee5b81dba2", level.var_774c21fa.origin);
        level.var_38ea4233 clientfield::increment_to_player("" + #"hash_7eefa4acee4c1d55", 1);
        wait(3);
        zm_hms_util::function_e308175e(#"hash_338550de989ad1a7", level.var_9fcb5938.origin);
    }
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 1, eflags: 0x1 linked
// Checksum 0xa16f4775, Offset: 0x878
// Size: 0x64
function function_2e57632b(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level.var_774c21fa zm_unitrigger::create("", 64, &function_5ce4f28f);
        level flag::wait_till(#"hash_1fa9f2f17d2cb5f9");
    }
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 2, eflags: 0x1 linked
// Checksum 0xecf9e58e, Offset: 0x8e8
// Size: 0x154
function function_3409e90e(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        zm_unitrigger::unregister_unitrigger(level.var_774c21fa.s_unitrigger);
        level.var_33d3e84a = 3;
        level flag::set(#"hash_1fa9f2f17d2cb5f9");
    } else {
        zm_unitrigger::unregister_unitrigger(level.var_774c21fa.s_unitrigger);
        level.var_33d3e84a = 3;
        playsoundatposition(#"hash_61901dee5b81dba2", level.var_774c21fa.origin);
        level.var_38ea4233 clientfield::increment_to_player("" + #"hash_7eefa4acee4c1d55", 1);
        wait(3);
        zm_hms_util::function_e308175e(#"hash_182892c4bb99b96a", level.var_9fcb5938.origin);
    }
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 1, eflags: 0x1 linked
// Checksum 0x5b37397c, Offset: 0xa48
// Size: 0x64
function function_7991d694(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level.var_774c21fa zm_unitrigger::create("", 64, &function_5ce4f28f);
        level flag::wait_till(#"hash_36e8f27bbd8b02d5");
    }
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 2, eflags: 0x1 linked
// Checksum 0xd0120cbe, Offset: 0xab8
// Size: 0x154
function function_c2bd8b3d(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        zm_unitrigger::unregister_unitrigger(level.var_774c21fa.s_unitrigger);
        level.var_33d3e84a = 4;
        level flag::set(#"hash_36e8f27bbd8b02d5");
    } else {
        zm_unitrigger::unregister_unitrigger(level.var_774c21fa.s_unitrigger);
        level.var_33d3e84a = 4;
        playsoundatposition(#"hash_61901dee5b81dba2", level.var_774c21fa.origin);
        level.var_38ea4233 clientfield::increment_to_player("" + #"hash_7eefa4acee4c1d55", 1);
        wait(3);
        zm_hms_util::function_e308175e(#"hash_1d3964f5cb0069af", level.var_9fcb5938.origin);
    }
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 1, eflags: 0x1 linked
// Checksum 0x8a7e2d74, Offset: 0xc18
// Size: 0x64
function function_8ca22055(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level.var_774c21fa zm_unitrigger::create("", 64, &function_5ce4f28f);
        level flag::wait_till(#"hash_1c296f8c578e2659");
    }
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 2, eflags: 0x1 linked
// Checksum 0xece09876, Offset: 0xc88
// Size: 0x16c
function function_d8b688e7(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        zm_unitrigger::unregister_unitrigger(level.var_774c21fa.s_unitrigger);
        level.var_33d3e84a = 5;
        level flag::set(#"hash_1c296f8c578e2659");
    } else {
        zm_unitrigger::unregister_unitrigger(level.var_774c21fa.s_unitrigger);
        level.var_33d3e84a = 5;
        playsoundatposition(#"hash_61901dee5b81dba2", level.var_774c21fa.origin);
        level.var_38ea4233 clientfield::increment_to_player("" + #"hash_7eefa4acee4c1d55", 1);
        wait(3);
        zm_hms_util::function_e308175e(#"hash_e51948d3d12b229", level.var_9fcb5938.origin);
    }
    level thread zm_office_special_rounds::function_6b3512d();
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 0, eflags: 0x1 linked
// Checksum 0x14b1a185, Offset: 0xe00
// Size: 0x22a
function function_5ce4f28f() {
    switch (level.var_33d3e84a) {
    case 0:
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        level.var_38ea4233 = waitresult.activator;
        level flag::set(#"hash_67df8b68575ba704");
    case 1:
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        level.var_38ea4233 = waitresult.activator;
        level flag::set(#"hash_10d5bcbc42acc9b");
    case 2:
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        level.var_38ea4233 = waitresult.activator;
        level flag::set(#"hash_1fa9f2f17d2cb5f9");
    case 3:
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        level.var_38ea4233 = waitresult.activator;
        level flag::set(#"hash_36e8f27bbd8b02d5");
    case 4:
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        level.var_38ea4233 = waitresult.activator;
        level flag::set(#"hash_1c296f8c578e2659");
        break;
    }
}

