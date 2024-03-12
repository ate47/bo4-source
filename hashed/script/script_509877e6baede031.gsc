// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace namespace_3417f8d2;

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x2
// Checksum 0x87cc0f87, Offset: 0x128
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_684e9a488b07947", &init, undefined, undefined);
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0xb2f8bc3d, Offset: 0x170
// Size: 0x1b4
function init() {
    init_clientfields();
    level flag::init(#"hash_7d5f27392b7264ae");
    level flag::init(#"hash_7d5f26392b7262fb");
    level flag::init(#"hash_51ae2a56153f7f83");
    zm_sq::register(#"hash_22d9cdbaac99885", #"step_1", #"hash_7b16b0c7f4445917", &function_a8fa5ac7, &function_8686db4c);
    zm_sq::register(#"hash_22d9cdbaac99885", #"step_2", #"hash_7b16b1c7f4445aca", &function_ebc2f134, &function_dc7d5745);
    zm_sq::register(#"hash_22d9cdbaac99885", #"step_3", #"hash_7b16b2c7f4445c7d", &function_d0d114be, &function_2beb73f6);
    zm_sq::start(#"hash_22d9cdbaac99885");
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0xc94d56a3, Offset: 0x330
// Size: 0x44
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"hash_671ee63741834a25", 1, 1, "int");
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 1, eflags: 0x1 linked
// Checksum 0x1f35adc0, Offset: 0x380
// Size: 0x4c
function function_a8fa5ac7(var_5ea5c94d) {
    level thread setup_phone_audio();
    if (!var_5ea5c94d) {
        level flag::wait_till(#"hash_7d5f27392b7264ae");
    }
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 2, eflags: 0x1 linked
// Checksum 0x873526a3, Offset: 0x3d8
// Size: 0x5c
function function_8686db4c(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        level.var_c2e6ed5a++;
        return;
    }
    level.var_2363fbdb = 0;
    function_72d3152();
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 1, eflags: 0x1 linked
// Checksum 0x9067addc, Offset: 0x440
// Size: 0x34
function function_ebc2f134(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level flag::wait_till(#"hash_7d5f26392b7262fb");
    }
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 2, eflags: 0x1 linked
// Checksum 0x6d33ef3, Offset: 0x480
// Size: 0x5c
function function_dc7d5745(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        level.var_c2e6ed5a++;
        return;
    }
    level.var_2363fbdb = 0;
    function_72d3152();
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 1, eflags: 0x1 linked
// Checksum 0x7d3a483d, Offset: 0x4e8
// Size: 0x34
function function_d0d114be(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level flag::wait_till(#"hash_51ae2a56153f7f83");
    }
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 2, eflags: 0x1 linked
// Checksum 0xd54a6845, Offset: 0x528
// Size: 0x54
function function_2beb73f6(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        level function_ccd6d7bc();
        return;
    }
    level function_ccd6d7bc();
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0x4da8c7f3, Offset: 0x588
// Size: 0x74
function setup_phone_audio() {
    wait(1);
    level.var_2363fbdb = 0;
    level.var_c2e6ed5a = 0;
    level.var_1c33dba2 = getentarray("secret_phone_trig", "targetname");
    array::thread_all(level.var_1c33dba2, &phone_init);
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0xe48c2454, Offset: 0x608
// Size: 0xb4
function phone_init() {
    if (!isdefined(self)) {
        return;
    }
    self.e_phone = struct::get(self.target, "targetname");
    if (isdefined(self.e_phone)) {
        self.e_phone scene::play("blinking");
    }
    self usetriggerrequirelookat();
    self setcursorhint("HINT_NOICON");
    self thread function_a546fd97();
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0xa3655e15, Offset: 0x6c8
// Size: 0x17e
function function_a546fd97() {
    self endon(#"death");
    while (1) {
        s_notify = undefined;
        s_notify = self waittill(#"damage");
        add_outtime = s_notify.attacker aat::getaatonweapon(s_notify.weapon);
        if (isdefined(add_outtime) && add_outtime.name === "zm_aat_kill_o_watt") {
            /#
                getplayers()[0] iprintln("<unknown string>");
            #/
            level.var_2363fbdb = level.var_2363fbdb + 1;
            self.e_phone scene::play("ring");
            if (level.var_2363fbdb == 3) {
                wait(1);
                self thread function_7dbe8985();
                wait(1);
            }
            self waittill(#"dialog_played");
            self.e_phone scene::play("blinking");
            wait(1);
        }
    }
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0xc7d24c6c, Offset: 0x850
// Size: 0x126
function function_7dbe8985() {
    if (level.var_c2e6ed5a == 0) {
        zm_hms_util::function_e308175e(#"hash_10486eedc1e9fad", self.origin);
        level flag::set(#"hash_7d5f27392b7264ae");
    } else if (level.var_c2e6ed5a == 1) {
        zm_hms_util::function_e308175e(#"hash_6742a63120f41d3b", self.origin);
        level flag::set(#"hash_7d5f26392b7262fb");
    } else {
        zm_hms_util::function_e308175e(#"hash_1678ea887d624d95", self.origin);
        level flag::set(#"hash_51ae2a56153f7f83");
    }
    level.var_c2e6ed5a = level.var_c2e6ed5a + 1;
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0xe575e453, Offset: 0x980
// Size: 0x7c
function function_72d3152() {
    foreach (trigger in level.var_1c33dba2) {
        trigger notify(#"dialog_played");
    }
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0x2efa22, Offset: 0xa08
// Size: 0xa8
function function_ccd6d7bc() {
    foreach (trigger in level.var_1c33dba2) {
        trigger.e_phone scene::play("init");
        trigger delete();
    }
}

