#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_35baff41;

// Namespace namespace_35baff41/namespace_35baff41
// Params 0, eflags: 0x2
// Checksum 0x4789b872, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_62ed3e0f56513ba7", &__init__, undefined, undefined);
}

// Namespace namespace_35baff41/namespace_35baff41
// Params 0, eflags: 0x0
// Checksum 0xdeaae0ea, Offset: 0xf8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_2c07cbb8e8fd2060", &on_begin, &on_end);
}

// Namespace namespace_35baff41/namespace_35baff41
// Params 1, eflags: 0x4
// Checksum 0xf4975e6e, Offset: 0x160
// Size: 0x9c
function private on_begin(var_6ad4e7c6) {
    fasttravel_triggers = struct::get_array("fasttravel_trigger", "targetname");
    assert(isdefined(fasttravel_triggers));
    zm_trial_util::function_2976fa44(fasttravel_triggers.size);
    zm_trial_util::function_dace284(0);
    level thread function_25f146be();
}

// Namespace namespace_35baff41/namespace_35baff41
// Params 1, eflags: 0x4
// Checksum 0x799e856f, Offset: 0x208
// Size: 0xa4
function private on_end(round_reset) {
    zm_trial_util::function_f3dbeda7();
    if (!round_reset) {
        fasttravel_triggers = struct::get_array("fasttravel_trigger", "targetname");
        assert(isdefined(fasttravel_triggers));
        if (function_c83a4a77() < fasttravel_triggers.size) {
            zm_trial::fail(#"hash_6d65e724625758f1");
        }
    }
}

// Namespace namespace_35baff41/namespace_35baff41
// Params 0, eflags: 0x4
// Checksum 0xbd0bf9b2, Offset: 0x2b8
// Size: 0xf2
function private function_c83a4a77() {
    fasttravel_triggers = struct::get_array("fasttravel_trigger", "targetname");
    assert(isdefined(fasttravel_triggers));
    count = 0;
    foreach (trigger in fasttravel_triggers) {
        if (isdefined(trigger.unitrigger_stub.used) && trigger.unitrigger_stub.used) {
            count++;
        }
    }
    return count;
}

// Namespace namespace_35baff41/namespace_35baff41
// Params 0, eflags: 0x4
// Checksum 0x49f08613, Offset: 0x3b8
// Size: 0x5e
function private function_25f146be() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    while (true) {
        zm_trial_util::function_dace284(function_c83a4a77());
        waitframe(1);
    }
}

