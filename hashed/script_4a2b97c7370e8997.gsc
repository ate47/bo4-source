// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_office_teleporters.gsc;
#include scripts/zm/zm_office_elevators.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace namespace_aa2f0fe;

// Namespace namespace_aa2f0fe/namespace_559511d6
// Params 0, eflags: 0x2
// Checksum 0x51ce9365, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_2fe76bf0f69f1761", &__init__, undefined, undefined);
}

// Namespace namespace_aa2f0fe/namespace_559511d6
// Params 0, eflags: 0x1 linked
// Checksum 0xf32e3d41, Offset: 0xf8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"disable_teleporters_elevators", &on_begin, &on_end);
}

// Namespace namespace_aa2f0fe/namespace_559511d6
// Params 0, eflags: 0x5 linked
// Checksum 0x9f80c16c, Offset: 0x160
// Size: 0x34
function private on_begin() {
    self function_3b7e62cf();
    self function_28dce407();
}

// Namespace namespace_aa2f0fe/namespace_559511d6
// Params 1, eflags: 0x5 linked
// Checksum 0xb6e1960d, Offset: 0x1a0
// Size: 0x3c
function private on_end(round_reset) {
    self function_72c09628();
    self function_8209b7a5();
}

// Namespace namespace_aa2f0fe/namespace_559511d6
// Params 0, eflags: 0x5 linked
// Checksum 0x762fc8d4, Offset: 0x1e8
// Size: 0x84
function private function_3b7e62cf() {
    elevator1 = getent("elevator1", "targetname");
    elevator2 = getent("elevator2", "targetname");
    elevator1 thread function_98c1b6be();
    elevator2 thread function_98c1b6be();
}

// Namespace namespace_aa2f0fe/namespace_559511d6
// Params 0, eflags: 0x5 linked
// Checksum 0xf513335d, Offset: 0x278
// Size: 0x54
function private function_98c1b6be() {
    if (self.active === 1) {
        self waittill(#"hash_26d932820f7f5373");
    }
    self zm_office_elevators::disable_callboxes();
    self zm_office_elevators::disable_elevator_buys();
}

// Namespace namespace_aa2f0fe/namespace_559511d6
// Params 0, eflags: 0x5 linked
// Checksum 0x4e8cf223, Offset: 0x2d8
// Size: 0x14
function private function_28dce407() {
    zm_office_teleporters::function_a6bb56f6();
}

// Namespace namespace_aa2f0fe/namespace_559511d6
// Params 0, eflags: 0x5 linked
// Checksum 0x58aa33f6, Offset: 0x2f8
// Size: 0xb4
function private function_72c09628() {
    elevator1 = getent("elevator1", "targetname");
    elevator2 = getent("elevator2", "targetname");
    elevator1 zm_office_elevators::enable_callboxes();
    elevator1 zm_office_elevators::enable_elevator_buys();
    elevator2 zm_office_elevators::enable_callboxes();
    elevator2 zm_office_elevators::enable_elevator_buys();
}

// Namespace namespace_aa2f0fe/namespace_559511d6
// Params 0, eflags: 0x5 linked
// Checksum 0x4dddf11f, Offset: 0x3b8
// Size: 0x14
function private function_8209b7a5() {
    zm_office_teleporters::function_cc9b97b0();
}

