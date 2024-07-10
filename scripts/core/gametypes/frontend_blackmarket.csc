// Atian COD Tools GSC decompiler test
#using scripts\core\gametypes\frontend.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\character_customization.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

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
    forcestreambundle(#"cin_black_market_case_avail", 8, -1);
    forcestreambundle(#"cin_black_market_greeting", 8, -1);
    forcestreambundle(#"cin_black_market_in_store", 8, -1);
    forcestreambundle(#"cin_black_market_mult_case", 8, -1);
    forcestreambundle(#"cin_black_market_not_welcome", 8, -1);
    forcestreambundle(#"cin_black_market_spec_offer", 8, -1);
    forcestreambundle(#"cin_black_market_welcome", 8, -1);
    level thread function_8aff1931(localclientnum, menu_data);
}

// Namespace blackmarket/frontend_blackmarket
// Params 2, eflags: 0x1 linked
// Checksum 0xde8088c, Offset: 0x338
// Size: 0x29e
function function_8aff1931(localclientnum, menu_data) {
    level notify(#"hash_1a6765b456dde230");
    level endon(#"hash_1a6765b456dde230", #"blackmarket_closed");
    while (true) {
        waitresult = level waittill(#"blackjackreserve");
        if (isdefined(waitresult.open) && !waitresult.open) {
            function_99278be8(localclientnum, menu_data);
            continue;
        }
        switch (waitresult.status) {
        case #"opencrate":
            if (waitresult.result) {
                switch (hash(waitresult.crateid)) {
                case #"1000":
                    level thread function_f559e439(localclientnum, menu_data, "loot_case");
                    break;
                case #"1001":
                    level thread function_f559e439(localclientnum, menu_data, "loot_crate");
                    break;
                }
            }
            break;
        case #"playsound":
            level.var_ca61b442 = playsound(localclientnum, waitresult.soundalias);
            break;
        case #"stopplaysound":
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

// Namespace blackmarket/frontend_blackmarket
// Params 2, eflags: 0x1 linked
// Checksum 0xf79a2b7f, Offset: 0x5e0
// Size: 0x142
function function_631642bd(localclientnum, menu_data) {
    if (isdefined(level.s_blackmarket)) {
        return;
    }
    forcestreambundle(#"scene_frontend_blackjack_reserves");
    forcestreambundle(#"scene_frontend_blackjack_case");
    forcestreambundle(#"scene_frontend_blackjack_crate");
    level scene::init(#"scene_frontend_blackjack_reserves");
    s_align = struct::get(#"tag_align_blackjack_reserves");
    playmaincamxcam(localclientnum, #"ui_cam_blackjack_character", 0, "", "", s_align.origin, s_align.angles);
    level.s_blackmarket = spawnstruct();
    level.s_blackmarket.localclientnum = localclientnum;
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
    if (!isdefined(level.s_blackmarket)) {
        function_631642bd(localclientnum, menu_data);
    }
    if (level.s_blackmarket.var_f56984dc === "crateidle" && state === level.s_blackmarket.var_63efd7bf) {
        return;
    }
    var_6b569619 = #"scene_frontend_blackjack_reserves";
    var_f56984dc = undefined;
    var_ce1b87cf = undefined;
    var_61de15c5 = undefined;
    var_ac97b37c = undefined;
    level.s_blackmarket.var_5a133766 = 0;
    switch (hash(state)) {
    case #"welcome_case_multi":
    case #"welcome_empty":
    case #"welcome_case_avail":
    case #"welcome_case_special":
    case #"welcome_case_notavail":
        level.s_blackmarket.var_5a133766 = 1;
        level.s_blackmarket.var_46d8e7d1 = hash(state) != #"welcome_empty";
        var_f56984dc = "idle";
        break;
    case #"loot_case_open":
    case #"loot_case":
        var_ce1b87cf = #"scene_frontend_blackjack_case";
        if (state == "loot_case_open") {
            var_f56984dc = "crateidle";
            var_61de15c5 = "open";
        } else {
            if (level.s_blackmarket.var_f56984dc === "idle") {
                var_f56984dc = "crate";
            }
            level.s_blackmarket.var_63efd7bf = "loot_case";
            var_ac97b37c = #"loot_case";
        }
        break;
    case #"loot_crate":
    case #"loot_crate_open":
        var_ce1b87cf = #"scene_frontend_blackjack_crate";
        if (state == "loot_crate_open") {
            var_f56984dc = "crateidle";
            var_61de15c5 = "open";
        } else {
            if (level.s_blackmarket.var_f56984dc === "idle") {
                var_f56984dc = "crate";
            }
            level.s_blackmarket.var_63efd7bf = "loot_crate";
            var_ac97b37c = #"loot_crate";
        }
        break;
    }
    if (level.s_blackmarket.var_6b569619 !== var_6b569619 || level.s_blackmarket.var_f56984dc !== var_f56984dc) {
        level scene_stop(level.s_blackmarket.var_6b569619, 1, localclientnum);
    }
    if (isdefined(var_6b569619)) {
        if (isdefined(var_f56984dc) && level.s_blackmarket.var_f56984dc !== var_f56984dc) {
            level.s_blackmarket.var_f56984dc = var_f56984dc;
        }
        level.s_blackmarket.var_6b569619 = var_6b569619;
        if (isdefined(var_ac97b37c)) {
            level thread function_6b5959d9(localclientnum, menu_data, var_ac97b37c);
        } else {
            level thread scene::play(level.s_blackmarket.var_6b569619, level.s_blackmarket.var_f56984dc);
        }
        if (isdefined(var_f56984dc) && var_f56984dc == "crate") {
            if (isdefined(level.s_blackmarket.var_760cf00) && level.s_blackmarket.var_760cf00) {
                playsound(localclientnum, #"hash_33e04aad46568336");
            }
            playsound(localclientnum, #"hash_548f0d33e630e71a");
        }
    } else {
        level.s_blackmarket.var_6b569619 = undefined;
    }
    if (level.s_blackmarket.var_ce1b87cf !== var_ce1b87cf || level.s_blackmarket.var_61de15c5 !== var_61de15c5) {
        level scene_stop(level.s_blackmarket.var_ce1b87cf, 1, localclientnum);
        if (!isdefined(var_ce1b87cf) && isdefined(level.s_blackmarket.a_exploders)) {
            foreach (var_e153c1aa in level.s_blackmarket.a_exploders) {
                exploder::kill_exploder(var_e153c1aa);
            }
            level.s_blackmarket.a_exploders = undefined;
        }
    }
    if (isdefined(var_ce1b87cf)) {
        if (!isdefined(var_61de15c5)) {
            level scene::init(var_ce1b87cf);
        } else {
            level thread scene::play(var_ce1b87cf, var_61de15c5);
        }
        level.s_blackmarket.var_ce1b87cf = var_ce1b87cf;
        level.s_blackmarket.var_61de15c5 = var_61de15c5;
    } else {
        level.s_blackmarket.var_ce1b87cf = undefined;
        level.s_blackmarket.var_63efd7bf = undefined;
    }
    level thread function_fa73161a(localclientnum, menu_data, state);
}

// Namespace blackmarket/frontend_blackmarket
// Params 3, eflags: 0x1 linked
// Checksum 0xf6bd7f45, Offset: 0xf10
// Size: 0x402
function function_fa73161a(localclientnum, menu_data, state) {
    if (!(isdefined(level.s_blackmarket.var_5a133766) && level.s_blackmarket.var_5a133766)) {
        return;
    }
    level notify(#"hash_6cbadb6c7bbdc5f");
    level endoncallback(&function_c3fc514, #"hash_6cbadb6c7bbdc5f", #"hash_7440f3772cbdc5b1");
    level scene_stop(level.s_blackmarket.var_82406a05, 1, localclientnum);
    if (isdefined(level.s_blackmarket.var_46d8e7d1) && level.s_blackmarket.var_46d8e7d1) {
        if (!(isdefined(level.s_blackmarket.var_760cf00) && level.s_blackmarket.var_760cf00)) {
            switch (hash(state)) {
            default:
                level.s_blackmarket.var_82406a05 = #"cin_black_market_greeting";
                break;
            case #"welcome_case_avail":
                level.s_blackmarket.var_82406a05 = #"cin_black_market_case_avail";
                break;
            case #"welcome_case_multi":
                level.s_blackmarket.var_82406a05 = #"cin_black_market_mult_case";
                break;
            case #"welcome_case_special":
                level.s_blackmarket.var_82406a05 = #"cin_black_market_spec_offer";
                break;
            }
            var_9e40a851 = scene::function_67e52759(level.s_blackmarket.var_82406a05, undefined, 0);
            level scene::play(level.s_blackmarket.var_82406a05, var_9e40a851);
            level scene_stop(level.s_blackmarket.var_82406a05, 1, localclientnum);
            level.s_blackmarket.var_760cf00 = 1;
        }
        level.s_blackmarket.var_82406a05 = #"cin_black_market_welcome";
    } else {
        level.s_blackmarket.var_82406a05 = #"cin_black_market_not_welcome";
    }
    while (true) {
        do {
            if (level.s_blackmarket.var_f56984dc === "idle") {
                var_9e40a851 = scene::function_67e52759(level.s_blackmarket.var_82406a05, undefined, 0, 1);
                level scene::play(level.s_blackmarket.var_82406a05, var_9e40a851);
                continue;
            }
            break;
        } while (randomint(2) == 1);
        do {
            level scene::play(level.s_blackmarket.var_82406a05, "Idle");
        } while (randomint(2) == 1 || level.s_blackmarket.var_f56984dc !== "idle");
    }
}

// Namespace blackmarket/frontend_blackmarket
// Params 2, eflags: 0x1 linked
// Checksum 0x5c3a590a, Offset: 0x1320
// Size: 0x15e
function function_feaafe07(localclientnum, state) {
    var_24282d8c = [];
    switch (hash(state)) {
    case #"loot_case":
        if (!isdefined(var_24282d8c)) {
            var_24282d8c = [];
        } else if (!isarray(var_24282d8c)) {
            var_24282d8c = array(var_24282d8c);
        }
        if (!isinarray(var_24282d8c, "fxexp_blkjck_case_gen")) {
            var_24282d8c[var_24282d8c.size] = "fxexp_blkjck_case_gen";
        }
        break;
    case #"loot_crate":
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
    scene_stop(level.s_blackmarket.var_82406a05, 1, level.s_blackmarket.localclientnum);
    level.s_blackmarket.var_82406a05 = undefined;
}

// Namespace blackmarket/frontend_blackmarket
// Params 3, eflags: 0x1 linked
// Checksum 0x7f2504c5, Offset: 0x14e8
// Size: 0x74
function function_6b5959d9(localclientnum, menu_data, newstate) {
    level scene::play(level.s_blackmarket.var_6b569619, level.s_blackmarket.var_f56984dc);
    level function_2f3c1d65(localclientnum, menu_data, newstate);
}

// Namespace blackmarket/frontend_blackmarket
// Params 3, eflags: 0x1 linked
// Checksum 0x7ec0aa54, Offset: 0x1568
// Size: 0x290
function function_2f3c1d65(localclientnum, menu_data, state) {
    if (!isdefined(level.s_blackmarket)) {
        return;
    }
    level endon(#"hash_7440f3772cbdc5b1");
    if (level.s_blackmarket.var_f56984dc === "crateidle") {
        waitframe(1);
    }
    switch (hash(state)) {
    case #"loot_case":
        function_f559e439(localclientnum, menu_data, "loot_case_open");
        break;
    case #"loot_crate":
        function_f559e439(localclientnum, menu_data, "loot_crate_open");
        break;
    }
    if (!isdefined(level.s_blackmarket.a_exploders)) {
        level.s_blackmarket.a_exploders = [];
    }
    var_24282d8c = function_feaafe07(localclientnum, state);
    foreach (var_e153c1aa in var_24282d8c) {
        if (!isdefined(level.s_blackmarket.a_exploders)) {
            level.s_blackmarket.a_exploders = [];
        } else if (!isarray(level.s_blackmarket.a_exploders)) {
            level.s_blackmarket.a_exploders = array(level.s_blackmarket.a_exploders);
        }
        if (!isinarray(level.s_blackmarket.a_exploders, var_e153c1aa)) {
            level.s_blackmarket.a_exploders[level.s_blackmarket.a_exploders.size] = var_e153c1aa;
        }
        exploder::exploder(var_e153c1aa);
    }
}

// Namespace blackmarket/frontend_blackmarket
// Params 2, eflags: 0x1 linked
// Checksum 0xb27adb22, Offset: 0x1800
// Size: 0x224
function function_99278be8(localclientnum, menu_data) {
    if (!isdefined(level.s_blackmarket)) {
        return;
    }
    level notify(#"hash_7440f3772cbdc5b1");
    level notify(#"hash_62410d634eeef407");
    level scene_stop(level.s_blackmarket.var_82406a05, 1, localclientnum);
    level.s_blackmarket.var_82406a05 = undefined;
    level scene_stop(level.s_blackmarket.var_6b569619, 1, localclientnum);
    level.s_blackmarket.var_6b569619 = undefined;
    level scene_stop(level.s_blackmarket.var_ce1b87cf, 1, localclientnum);
    level.s_blackmarket.var_ce1b87cf = undefined;
    if (isdefined(level.s_blackmarket.a_exploders)) {
        foreach (var_e153c1aa in level.s_blackmarket.a_exploders) {
            exploder::kill_exploder(var_e153c1aa);
        }
        level.s_blackmarket.a_exploders = undefined;
    }
    level.s_blackmarket = undefined;
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
    function_66b6e720(#"cin_black_market_case_avail");
    function_66b6e720(#"cin_black_market_greeting");
    function_66b6e720(#"cin_black_market_in_store");
    function_66b6e720(#"cin_black_market_mult_case");
    function_66b6e720(#"cin_black_market_not_welcome");
    function_66b6e720(#"cin_black_market_spec_offer");
    function_66b6e720(#"cin_black_market_welcome");
}

