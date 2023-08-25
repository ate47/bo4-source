// Atian COD Tools GSC decompiler test
#include scripts/core/gametypes/frontend.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/scene_shared.csc;
#include scripts/core_common/lui_shared.csc;
#include scripts/core_common/exploder_shared.csc;
#include scripts/core_common/character_customization.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/array_shared.csc;

#namespace blackmarket;

// Namespace blackmarket/frontend_blackmarket
// Params 0, eflags: 0x2
// Checksum 0x4770829f, Offset: 0x150
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"blackmarket", &__init__, undefined, undefined);
}

// Namespace blackmarket/frontend_blackmarket
// Params 0, eflags: 0x1 linked
// Checksum 0x431a2b80, Offset: 0x198
// Size: 0x24
function __init__() {
    callback::on_localclient_connect(&setup);
}

// Namespace blackmarket/frontend_blackmarket
// Params 1, eflags: 0x1 linked
// Checksum 0x8c582e41, Offset: 0x1c8
// Size: 0xc
function setup(localclientnum) {
    
}

// Namespace blackmarket/frontend_blackmarket
// Params 2, eflags: 0x1 linked
// Checksum 0xd0180e44, Offset: 0x1e0
// Size: 0x14c
function function_78a5c895(localclientnum, menu_data) {
    forcestreambundle(#"hash_436b9483accb9a63", 8, -1);
    forcestreambundle(#"cin_black_market_greeting", 8, -1);
    forcestreambundle(#"cin_black_market_in_store", 8, -1);
    forcestreambundle(#"hash_4fba9743015d76e", 8, -1);
    forcestreambundle(#"cin_black_market_not_welcome", 8, -1);
    forcestreambundle(#"hash_2808d911694eca55", 8, -1);
    forcestreambundle(#"cin_black_market_welcome", 8, -1);
    level thread function_8aff1931(localclientnum, menu_data);
}

// Namespace blackmarket/frontend_blackmarket
// Params 2, eflags: 0x1 linked
// Checksum 0xde8088c, Offset: 0x338
// Size: 0x29e
function function_8aff1931(localclientnum, menu_data) {
    level notify(#"hash_1a6765b456dde230");
    level endon(#"hash_1a6765b456dde230", #"hash_2467a4ba67689fe1");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"hash_46e5b5e04de68671");
        if (isdefined(waitresult.open) && !waitresult.open) {
            function_99278be8(localclientnum, menu_data);
        } else {
            switch (waitresult.status) {
            case #"hash_6d2a0d82cde87c3c":
                if (waitresult.result) {
                    switch (hash(waitresult.var_7c4b58bd)) {
                    case #"1000":
                        level thread function_f559e439(localclientnum, menu_data, "loot_case");
                        break;
                    case #"1001":
                        level thread function_f559e439(localclientnum, menu_data, "loot_crate");
                        break;
                    }
                    goto LOC_00000174;
                }
            LOC_00000174:
                break;
            case #"playsound":
                level.var_ca61b442 = playsound(localclientnum, waitresult.soundalias);
                break;
            case #"hash_22573eece2ec97a2":
                stopsound(level.var_ca61b442);
                level.var_ca61b442 = playsound(localclientnum, waitresult.soundalias);
                break;
            case #"stopsound":
                stopsound(level.var_ca61b442);
                level.var_ca61b442 = undefined;
                break;
            default:
                level thread function_f559e439(localclientnum, menu_data, waitresult.status);
                break;
            }
        }
    }
}

// Namespace blackmarket/frontend_blackmarket
// Params 2, eflags: 0x1 linked
// Checksum 0xf79a2b7f, Offset: 0x5e0
// Size: 0x142
function function_631642bd(localclientnum, menu_data) {
    if (isdefined(level.var_cf24a85f)) {
        return;
    }
    forcestreambundle(#"scene_frontend_blackjack_reserves");
    forcestreambundle(#"scene_frontend_blackjack_case");
    forcestreambundle(#"scene_frontend_blackjack_crate");
    level scene::init(#"scene_frontend_blackjack_reserves");
    s_align = struct::get(#"hash_619124af5efb69de");
    playmaincamxcam(localclientnum, #"hash_782af0d18a8eb528", 0, "", "", s_align.origin, s_align.angles);
    level.var_cf24a85f = spawnstruct();
    level.var_cf24a85f.localclientnum = localclientnum;
}

// Namespace blackmarket/frontend_blackmarket
// Params 3, eflags: 0x1 linked
// Checksum 0x28fc08ee, Offset: 0x730
// Size: 0x118
function scene_stop(str_scene, clear, localclientnum) {
    level scene::stop(str_scene, clear);
    a_instances = scene::get_inactive_scenes(str_scene);
    foreach (_e_root in arraycopy(a_instances)) {
        if (isinarray(level.active_scenes, _e_root)) {
            arrayremovevalue(a_instances, _e_root);
        }
        scene::delete_scene_spawned_ents(localclientnum, str_scene);
    }
}

// Namespace blackmarket/frontend_blackmarket
// Params 3, eflags: 0x1 linked
// Checksum 0xfb2891cf, Offset: 0x850
// Size: 0x6b4
function function_f559e439(localclientnum, menu_data, state) {
    if (!isdefined(state)) {
        return;
    }
    if (!isdefined(level.var_cf24a85f)) {
        function_631642bd(localclientnum, menu_data);
    }
    if (level.var_cf24a85f.var_f56984dc === "crateidle" && state === level.var_cf24a85f.var_63efd7bf) {
        return;
    }
    var_6b569619 = #"scene_frontend_blackjack_reserves";
    var_f56984dc = undefined;
    var_ce1b87cf = undefined;
    var_61de15c5 = undefined;
    var_ac97b37c = undefined;
    level.var_cf24a85f.var_5a133766 = 0;
    switch (hash(state)) {
    case #"hash_1f8afff27df8492":
    case #"hash_19e85451b581aa65":
    case #"hash_5005f24cf98a0530":
    case #"hash_5c87d0d1cc24e8b0":
    case #"hash_5e0f6f6c23dde3e9":
        level.var_cf24a85f.var_5a133766 = 1;
        level.var_cf24a85f.var_46d8e7d1 = hash(state) != #"hash_19e85451b581aa65";
        var_f56984dc = "idle";
        break;
    case #"hash_2c6dd0b59031c5ad":
    case #"hash_31c4c4c8b87dc6a4":
        var_ce1b87cf = #"scene_frontend_blackjack_case";
        if (state == "loot_case_open") {
            var_f56984dc = "crateidle";
            var_61de15c5 = "open";
        } else {
            if (level.var_cf24a85f.var_f56984dc === "idle") {
                var_f56984dc = "crate";
            }
            level.var_cf24a85f.var_63efd7bf = "loot_case";
            var_ac97b37c = #"hash_31c4c4c8b87dc6a4";
        }
        break;
    case #"hash_1608d0b1f569d973":
    case #"hash_5782738d595b7e44":
        var_ce1b87cf = #"scene_frontend_blackjack_crate";
        if (state == "loot_crate_open") {
            var_f56984dc = "crateidle";
            var_61de15c5 = "open";
        } else {
            if (level.var_cf24a85f.var_f56984dc === "idle") {
                var_f56984dc = "crate";
            }
            level.var_cf24a85f.var_63efd7bf = "loot_crate";
            var_ac97b37c = #"hash_1608d0b1f569d973";
        }
        break;
    }
    if (level.var_cf24a85f.var_6b569619 !== var_6b569619 || level.var_cf24a85f.var_f56984dc !== var_f56984dc) {
        level scene_stop(level.var_cf24a85f.var_6b569619, 1, localclientnum);
    }
    if (isdefined(var_6b569619)) {
        if (isdefined(var_f56984dc) && level.var_cf24a85f.var_f56984dc !== var_f56984dc) {
            level.var_cf24a85f.var_f56984dc = var_f56984dc;
        }
        level.var_cf24a85f.var_6b569619 = var_6b569619;
        if (isdefined(var_ac97b37c)) {
            level thread function_6b5959d9(localclientnum, menu_data, var_ac97b37c);
        } else {
            level thread scene::play(level.var_cf24a85f.var_6b569619, level.var_cf24a85f.var_f56984dc);
        }
        if (isdefined(var_f56984dc) && var_f56984dc == "crate") {
            if (isdefined(level.var_cf24a85f.var_760cf00) && level.var_cf24a85f.var_760cf00) {
                playsound(localclientnum, #"hash_33e04aad46568336");
            }
            playsound(localclientnum, #"hash_548f0d33e630e71a");
        }
    } else {
        level.var_cf24a85f.var_6b569619 = undefined;
    }
    if (level.var_cf24a85f.var_ce1b87cf !== var_ce1b87cf || level.var_cf24a85f.var_61de15c5 !== var_61de15c5) {
        level scene_stop(level.var_cf24a85f.var_ce1b87cf, 1, localclientnum);
        if (!isdefined(var_ce1b87cf) && isdefined(level.var_cf24a85f.var_b70abd9d)) {
            foreach (var_e153c1aa in level.var_cf24a85f.var_b70abd9d) {
                exploder::kill_exploder(var_e153c1aa);
            }
            level.var_cf24a85f.var_b70abd9d = undefined;
        }
    }
    if (isdefined(var_ce1b87cf)) {
        if (!isdefined(var_61de15c5)) {
            level scene::init(var_ce1b87cf);
        } else {
            level thread scene::play(var_ce1b87cf, var_61de15c5);
        }
        level.var_cf24a85f.var_ce1b87cf = var_ce1b87cf;
        level.var_cf24a85f.var_61de15c5 = var_61de15c5;
    } else {
        level.var_cf24a85f.var_ce1b87cf = undefined;
        level.var_cf24a85f.var_63efd7bf = undefined;
    }
    level thread function_fa73161a(localclientnum, menu_data, state);
}

// Namespace blackmarket/frontend_blackmarket
// Params 3, eflags: 0x1 linked
// Checksum 0xf6bd7f45, Offset: 0xf10
// Size: 0x402
function function_fa73161a(localclientnum, menu_data, state) {
    if (!(isdefined(level.var_cf24a85f.var_5a133766) && level.var_cf24a85f.var_5a133766)) {
        return;
    }
    level notify(#"hash_6cbadb6c7bbdc5f");
    level endoncallback(&function_c3fc514, #"hash_6cbadb6c7bbdc5f", #"hash_7440f3772cbdc5b1");
    level scene_stop(level.var_cf24a85f.var_82406a05, 1, localclientnum);
    if (isdefined(level.var_cf24a85f.var_46d8e7d1) && level.var_cf24a85f.var_46d8e7d1) {
        if (!(isdefined(level.var_cf24a85f.var_760cf00) && level.var_cf24a85f.var_760cf00)) {
            switch (hash(state)) {
            default:
                level.var_cf24a85f.var_82406a05 = #"cin_black_market_greeting";
                break;
            case #"hash_5005f24cf98a0530":
                level.var_cf24a85f.var_82406a05 = #"hash_436b9483accb9a63";
                break;
            case #"hash_1f8afff27df8492":
                level.var_cf24a85f.var_82406a05 = #"hash_4fba9743015d76e";
                break;
            case #"hash_5c87d0d1cc24e8b0":
                level.var_cf24a85f.var_82406a05 = #"hash_2808d911694eca55";
                break;
            }
            var_9e40a851 = scene::function_67e52759(level.var_cf24a85f.var_82406a05, undefined, 0);
            level scene::play(level.var_cf24a85f.var_82406a05, var_9e40a851);
            level scene_stop(level.var_cf24a85f.var_82406a05, 1, localclientnum);
            level.var_cf24a85f.var_760cf00 = 1;
        }
        level.var_cf24a85f.var_82406a05 = #"cin_black_market_welcome";
    } else {
        level.var_cf24a85f.var_82406a05 = #"cin_black_market_not_welcome";
    }
    while (1) {
        do {
            if (level.var_cf24a85f.var_f56984dc === "idle") {
                var_9e40a851 = scene::function_67e52759(level.var_cf24a85f.var_82406a05, undefined, 0, 1);
                level scene::play(level.var_cf24a85f.var_82406a05, var_9e40a851);
            } else {
                break;
            }
        } while(randomint(2) == 1);
        do {
            level scene::play(level.var_cf24a85f.var_82406a05, "Idle");
        } while(randomint(2) == 1 || level.var_cf24a85f.var_f56984dc !== "idle");
    }
}

// Namespace blackmarket/frontend_blackmarket
// Params 2, eflags: 0x1 linked
// Checksum 0x5c3a590a, Offset: 0x1320
// Size: 0x15e
function function_feaafe07(localclientnum, state) {
    var_24282d8c = [];
    switch (hash(state)) {
    case #"hash_31c4c4c8b87dc6a4":
        if (!isdefined(var_24282d8c)) {
            var_24282d8c = [];
        } else if (!isarray(var_24282d8c)) {
            var_24282d8c = array(var_24282d8c);
        }
        if (!isinarray(var_24282d8c, "fxexp_blkjck_case_gen")) {
            var_24282d8c[var_24282d8c.size] = "fxexp_blkjck_case_gen";
        }
        break;
    case #"hash_1608d0b1f569d973":
        if (!isdefined(var_24282d8c)) {
            var_24282d8c = [];
        } else if (!isarray(var_24282d8c)) {
            var_24282d8c = array(var_24282d8c);
        }
        if (!isinarray(var_24282d8c, "fxexp_blkjck_crate_gen")) {
            var_24282d8c[var_24282d8c.size] = "fxexp_blkjck_crate_gen";
        }
        break;
    }
    return var_24282d8c;
}

// Namespace blackmarket/frontend_blackmarket
// Params 1, eflags: 0x1 linked
// Checksum 0xe53a6d44, Offset: 0x1488
// Size: 0x56
function function_c3fc514(notifyhash) {
    scene_stop(level.var_cf24a85f.var_82406a05, 1, level.var_cf24a85f.localclientnum);
    level.var_cf24a85f.var_82406a05 = undefined;
}

// Namespace blackmarket/frontend_blackmarket
// Params 3, eflags: 0x1 linked
// Checksum 0x7f2504c5, Offset: 0x14e8
// Size: 0x74
function function_6b5959d9(localclientnum, menu_data, newstate) {
    level scene::play(level.var_cf24a85f.var_6b569619, level.var_cf24a85f.var_f56984dc);
    level function_2f3c1d65(localclientnum, menu_data, newstate);
}

// Namespace blackmarket/frontend_blackmarket
// Params 3, eflags: 0x1 linked
// Checksum 0x7ec0aa54, Offset: 0x1568
// Size: 0x290
function function_2f3c1d65(localclientnum, menu_data, state) {
    if (!isdefined(level.var_cf24a85f)) {
        return;
    }
    level endon(#"hash_7440f3772cbdc5b1");
    if (level.var_cf24a85f.var_f56984dc === "crateidle") {
        waitframe(1);
    }
    switch (hash(state)) {
    case #"hash_31c4c4c8b87dc6a4":
        function_f559e439(localclientnum, menu_data, "loot_case_open");
        break;
    case #"hash_1608d0b1f569d973":
        function_f559e439(localclientnum, menu_data, "loot_crate_open");
        break;
    }
    if (!isdefined(level.var_cf24a85f.var_b70abd9d)) {
        level.var_cf24a85f.var_b70abd9d = [];
    }
    var_24282d8c = function_feaafe07(localclientnum, state);
    foreach (var_e153c1aa in var_24282d8c) {
        if (!isdefined(level.var_cf24a85f.var_b70abd9d)) {
            level.var_cf24a85f.var_b70abd9d = [];
        } else if (!isarray(level.var_cf24a85f.var_b70abd9d)) {
            level.var_cf24a85f.var_b70abd9d = array(level.var_cf24a85f.var_b70abd9d);
        }
        if (!isinarray(level.var_cf24a85f.var_b70abd9d, var_e153c1aa)) {
            level.var_cf24a85f.var_b70abd9d[level.var_cf24a85f.var_b70abd9d.size] = var_e153c1aa;
        }
        exploder::exploder(var_e153c1aa);
    }
}

// Namespace blackmarket/frontend_blackmarket
// Params 2, eflags: 0x1 linked
// Checksum 0xb27adb22, Offset: 0x1800
// Size: 0x224
function function_99278be8(localclientnum, menu_data) {
    if (!isdefined(level.var_cf24a85f)) {
        return;
    }
    level notify(#"hash_7440f3772cbdc5b1");
    level notify(#"hash_62410d634eeef407");
    level scene_stop(level.var_cf24a85f.var_82406a05, 1, localclientnum);
    level.var_cf24a85f.var_82406a05 = undefined;
    level scene_stop(level.var_cf24a85f.var_6b569619, 1, localclientnum);
    level.var_cf24a85f.var_6b569619 = undefined;
    level scene_stop(level.var_cf24a85f.var_ce1b87cf, 1, localclientnum);
    level.var_cf24a85f.var_ce1b87cf = undefined;
    if (isdefined(level.var_cf24a85f.var_b70abd9d)) {
        foreach (var_e153c1aa in level.var_cf24a85f.var_b70abd9d) {
            exploder::kill_exploder(var_e153c1aa);
        }
        level.var_cf24a85f.var_b70abd9d = undefined;
    }
    level.var_cf24a85f = undefined;
    function_66b6e720(#"scene_frontend_blackjack_reserves");
    function_66b6e720(#"scene_frontend_blackjack_case");
    function_66b6e720(#"scene_frontend_blackjack_crate");
}

// Namespace blackmarket/frontend_blackmarket
// Params 2, eflags: 0x1 linked
// Checksum 0x236609a9, Offset: 0x1a30
// Size: 0x10c
function function_c46c0287(localclientnum, menu_data) {
    function_99278be8(localclientnum, menu_data);
    function_66b6e720(#"hash_436b9483accb9a63");
    function_66b6e720(#"cin_black_market_greeting");
    function_66b6e720(#"cin_black_market_in_store");
    function_66b6e720(#"hash_4fba9743015d76e");
    function_66b6e720(#"cin_black_market_not_welcome");
    function_66b6e720(#"hash_2808d911694eca55");
    function_66b6e720(#"cin_black_market_welcome");
}

