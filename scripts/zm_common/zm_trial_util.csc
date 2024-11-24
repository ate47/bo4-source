#using script_13ba67412d79c7f;
#using script_39ee47b0c71ab0f1;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_utility;

#namespace zm_trial_util;

// Namespace zm_trial_util/zm_trial_util
// Params 0, eflags: 0x2
// Checksum 0xd2eca867, Offset: 0x4c8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_util", &__init__, undefined, undefined);
}

// Namespace zm_trial_util/zm_trial_util
// Params 0, eflags: 0x5 linked
// Checksum 0xa37654e9, Offset: 0x510
// Size: 0x396
function private __init__() {
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.roundNumber");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.roundSuccess");
    level.var_940b67bb = createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.roundTitle");
    level.var_63e5f17c = createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.roundDescription");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.strikes");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.disablePerks");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.disableGun");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.disableEquip");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.disableSpecial");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.disableAbilities");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.gameStartTime");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.globalCheckState");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.globalCounterMax");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.globalCounterValue");
    createuimodel(getglobaluimodel(), "ZMHudGlobal.trials.hudDeactivated");
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    callback::on_localclient_connect(&on_localplayer_connect);
    callback::on_finalize_initialization(&finalize_clientfields);
    level.var_a2859227 = 0;
    level.var_f995ece6 = zm_trial_timer::register("zm_trial_timer");
    level.var_e7295382 = zm_trial_weapon_locked::register_clientside(#"zm_trial_weapon_locked");
}

// Namespace zm_trial_util/zm_trial_util
// Params 1, eflags: 0x5 linked
// Checksum 0x10bc5827, Offset: 0x8b0
// Size: 0x44
function private on_localplayer_connect(localclientnum) {
    timer_model = function_c8b7588d(localclientnum);
    setuimodelvalue(timer_model, 0);
}

// Namespace zm_trial_util/zm_trial_util
// Params 1, eflags: 0x5 linked
// Checksum 0x4ad8d600, Offset: 0x900
// Size: 0x7be
function private finalize_clientfields(localclientnum) {
    clientfield::register("world", "ZMHudGlobal.trials.trialIndex", 1, getminbitcountfornum(15), "int", &function_741dae5b, 0, 0);
    clientfield::register("toplayer", "" + #"hash_6536ca4fb2858a9f", 16000, 1, "int", &function_ff287922, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.roundNumber", 1, getminbitcountfornum(30), "int", &function_88806df3, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.roundSuccess", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.strikes", 1, getminbitcountfornum(3), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.disableGun", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.disableEquip", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.disableSpecial", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.disablePerks", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.disableAbilities", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
    clientfield::register("toplayer", "zm_trials_timer", 1, getminbitcountfornum(540), "int", &function_bb753058, 0, 1);
    clientfield::register("toplayer", "zm_trials_weapon_locked", 1, 1, "counter", &function_4b6a4a84, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.playerCounterMax", 1, getminbitcountfornum(1000), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.gameState", 1, 2, "int", &function_686840b2, 0, 1);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.failurePlayer", 1, 4, "int", undefined, 0, 0);
    clientfield::register_bgcache("worlduimodel", "string", "ZMHudGlobal.trials.failureReason", 1, &function_b9a5a377, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.gameStartTime", 1, 31, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.showScoreboard", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.globalCheckState", 1, getminbitcountfornum(2), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.globalCounterValue", 1, getminbitcountfornum(1000), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.globalCounterMax", 1, getminbitcountfornum(1000), "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ZMHudGlobal.trials.hudDeactivated", 1, 1, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.currentWeaponLocked", 1, 1, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.currentEquipmentLocked", 16000, 1, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.currentSpecialLocked", 16000, 1, "int", undefined, 0, 0);
    for (i = 0; i < 4; i++) {
        clientfield::register("worlduimodel", "PlayerList.client" + i + "." + "trialsCheckState", 1, 2, "int", undefined, 0, 0);
        clientfield::register("worlduimodel", "PlayerList.client" + i + "." + "trialsCounterValue", 1, getminbitcountfornum(1000), "int", undefined, 0, 0);
    }
}

// Namespace zm_trial_util/zm_trial_util
// Params 7, eflags: 0x5 linked
// Checksum 0x708bb022, Offset: 0x10c8
// Size: 0x74
function private function_ff287922(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self function_3862d4bd(1);
        return;
    }
    self function_3862d4bd(0);
}

// Namespace zm_trial_util/zm_trial_util
// Params 7, eflags: 0x5 linked
// Checksum 0xe892c93, Offset: 0x1148
// Size: 0x5e
function private function_741dae5b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.var_6d87ac05 = zm_trial::function_ce2fdd3b(newval);
}

// Namespace zm_trial_util/zm_trial_util
// Params 7, eflags: 0x5 linked
// Checksum 0xbebb4877, Offset: 0x11b0
// Size: 0x104
function private function_88806df3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    round_index = newval - 1;
    if (isdefined(level.var_6d87ac05) && isdefined(level.var_6d87ac05.rounds[round_index])) {
        on_challenge_end(localclientnum);
        level.var_1420e3f6 = level.var_6d87ac05.rounds[round_index];
        function_c3febfe1(localclientnum);
    } else {
        on_challenge_end(localclientnum);
        level.var_1420e3f6 = undefined;
    }
    function_d59810a5();
}

// Namespace zm_trial_util/zm_trial_util
// Params 7, eflags: 0x5 linked
// Checksum 0x8d05d259, Offset: 0x12c0
// Size: 0x88
function private function_686840b2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.var_a2859227 = newval;
    function_d59810a5();
    if (level.var_a2859227 != 0) {
        waittillframeend();
        level notify(#"hash_7646638df88a3656");
    }
}

// Namespace zm_trial_util/zm_trial_util
// Params 7, eflags: 0x5 linked
// Checksum 0xa412a540, Offset: 0x1350
// Size: 0x5c
function private function_b9a5a377(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.var_411ba6f4 = newval;
    function_d59810a5();
}

// Namespace zm_trial_util/zm_trial_util
// Params 7, eflags: 0x5 linked
// Checksum 0xbb4b3087, Offset: 0x13b8
// Size: 0xc4
function private function_bb753058(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!function_65b9eb0f(localclientnum)) {
        timer_model = function_c8b7588d(localclientnum);
        duration_msec = newval * 1000;
        setuimodelvalue(timer_model, getservertime(localclientnum, 1) + duration_msec);
    }
}

// Namespace zm_trial_util/zm_trial_util
// Params 7, eflags: 0x5 linked
// Checksum 0x293203, Offset: 0x1488
// Size: 0x54
function private function_4b6a4a84(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_97444b02(localclientnum);
}

// Namespace zm_trial_util/zm_trial_util
// Params 1, eflags: 0x5 linked
// Checksum 0xca99c1a3, Offset: 0x14e8
// Size: 0xe2
function private function_c3febfe1(local_client_num) {
    if (isdefined(level.var_1420e3f6)) {
        for (i = 0; i < level.var_1420e3f6.challenges.size; i++) {
            challenge = level.var_1420e3f6.challenges[i];
            if (isdefined(level.var_75e93a54[challenge.name]) && isdefined(level.var_75e93a54[challenge.name].var_c5dd8620)) {
                [[ level.var_75e93a54[challenge.name].var_c5dd8620 ]](local_client_num, challenge.params);
            }
        }
    }
}

// Namespace zm_trial_util/zm_trial_util
// Params 1, eflags: 0x5 linked
// Checksum 0x51b9b14e, Offset: 0x15d8
// Size: 0xea
function private on_challenge_end(local_client_num) {
    if (isdefined(level.var_1420e3f6)) {
        level notify(#"hash_7646638df88a3656");
        for (i = 0; i < level.var_1420e3f6.challenges.size; i++) {
            challenge = level.var_1420e3f6.challenges[i];
            if (isdefined(level.var_75e93a54[challenge.name]) && isdefined(level.var_75e93a54[challenge.name].var_bbcdbff5)) {
                [[ level.var_75e93a54[challenge.name].var_bbcdbff5 ]](local_client_num);
            }
        }
    }
}

// Namespace zm_trial_util/zm_trial_util
// Params 0, eflags: 0x5 linked
// Checksum 0x25c8db2c, Offset: 0x16d0
// Size: 0x102
function private function_d59810a5() {
    assert(isdefined(level.var_a2859227));
    setuimodelvalue(level.var_940b67bb, #"");
    setuimodelvalue(level.var_63e5f17c, #"");
    switch (level.var_a2859227) {
    default:
        if (isdefined(level.var_1420e3f6)) {
            setuimodelvalue(level.var_940b67bb, level.var_1420e3f6.name_str);
            setuimodelvalue(level.var_63e5f17c, level.var_1420e3f6.desc_str);
        }
        break;
    }
}

// Namespace zm_trial_util/zm_trial_util
// Params 1, eflags: 0x5 linked
// Checksum 0xb123ed9c, Offset: 0x17e0
// Size: 0x4a
function private function_c8b7588d(localclientnum) {
    controller_model = getuimodelforcontroller(localclientnum);
    return createuimodel(controller_model, "ZMHud.trialsTimer");
}

// Namespace zm_trial_util/zm_trial_util
// Params 1, eflags: 0x1 linked
// Checksum 0x71f1a0ca, Offset: 0x1838
// Size: 0x94
function function_97444b02(localclientnum) {
    if (!level.var_e7295382 zm_trial_weapon_locked::is_open(localclientnum)) {
        level.var_e7295382 zm_trial_weapon_locked::open(localclientnum);
    }
    level.var_e7295382 zm_trial_weapon_locked::function_1e74977(localclientnum);
    self playsound(localclientnum, #"hash_17c7895c4b5180ce");
}

