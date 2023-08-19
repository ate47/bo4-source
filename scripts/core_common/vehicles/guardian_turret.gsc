// Atian COD Tools GSC decompiler test
#include scripts/core_common/vehicles/auto_turret.gsc;
#include scripts/core_common/vehicle_shared.gsc;
#include scripts/core_common/vehicle_ai_shared.gsc;
#include scripts/core_common/turret_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/microwave_turret_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace guardian_turret;

// Namespace guardian_turret/guardian_turret
// Params 0, eflags: 0x2
// Checksum 0x88f72a6d, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"guardian_turret", &__init__, undefined, undefined);
}

// Namespace guardian_turret/guardian_turret
// Params 0, eflags: 0x0
// Checksum 0xb243dc67, Offset: 0x130
// Size: 0x2c
function __init__() {
    vehicle::add_main_callback("microwave_turret", &function_5dfbc20a);
}

// Namespace guardian_turret/guardian_turret
// Params 0, eflags: 0x0
// Checksum 0xee4abb74, Offset: 0x168
// Size: 0x34
function function_5dfbc20a() {
    auto_turret::function_f17009ff();
    guardian_init();
    function_4dc5ff34();
}

// Namespace guardian_turret/guardian_turret
// Params 0, eflags: 0x0
// Checksum 0xfe79d3dc, Offset: 0x1a8
// Size: 0xbc
function function_4dc5ff34() {
    guardian = self;
    guardian vehicle_ai::get_state_callbacks("combat").update_func = &function_21304ee6;
    guardian vehicle_ai::get_state_callbacks("combat").exit_func = &function_4ea89e5a;
    guardian vehicle_ai::get_state_callbacks("unaware").enter_func = &function_ab51fb9e;
    guardian vehicle_ai::set_state("unaware");
}

// Namespace guardian_turret/guardian_turret
// Params 1, eflags: 0x0
// Checksum 0xd30b8b4f, Offset: 0x270
// Size: 0x3c
function function_ab51fb9e(params) {
    guardian = self;
    guardian clientfield::set("turret_microwave_open", 0);
}

// Namespace guardian_turret/guardian_turret
// Params 1, eflags: 0x0
// Checksum 0xa3e4f829, Offset: 0x2b8
// Size: 0x130
function function_21304ee6(params) {
    guardian = self;
    guardian endon(#"death", #"change_state");
    if (isdefined(guardian.enemy)) {
        auto_turret::sentry_turret_alert_sound();
        wait(0.5);
    }
    guardian startmicrowave();
    while (1) {
        guardian.turretrotscale = 1;
        if (isdefined(guardian.enemy) && isalive(guardian.enemy) && guardian cansee(guardian.enemy)) {
            guardian turretsettarget(0, guardian.enemy);
        }
        guardian vehicle_ai::evaluate_connections();
        wait(0.5);
    }
}

// Namespace guardian_turret/guardian_turret
// Params 1, eflags: 0x0
// Checksum 0xb4483ab0, Offset: 0x3f0
// Size: 0x2c
function function_4ea89e5a(params) {
    guardian = self;
    guardian stopmicrowave();
}

// Namespace guardian_turret/guardian_turret
// Params 0, eflags: 0x0
// Checksum 0xddde4de8, Offset: 0x428
// Size: 0x4c
function startmicrowave() {
    guardian = self;
    guardian clientfield::set("turret_microwave_open", 1);
    guardian microwave_turret::startmicrowave();
}

// Namespace guardian_turret/guardian_turret
// Params 0, eflags: 0x0
// Checksum 0xfda38fc9, Offset: 0x480
// Size: 0x3c
function stopmicrowave() {
    guardian = self;
    if (isdefined(guardian)) {
        guardian clientfield::set("turret_microwave_open", 0);
    }
}

// Namespace guardian_turret/guardian_turret
// Params 2, eflags: 0x0
// Checksum 0xe34c5e49, Offset: 0x4c8
// Size: 0xd0
function function_e341abb9(totalfiretime, enemy) {
    guardian = self;
    guardian endon(#"death", #"change_state");
    auto_turret::sentry_turret_alert_sound();
    wait(0.1);
    weapon = guardian seatgetweapon(0);
    firetime = weapon.firetime;
    time = 0;
    while (time < totalfiretime) {
        wait(firetime);
        time = time + firetime;
    }
}

// Namespace guardian_turret/guardian_turret
// Params 0, eflags: 0x0
// Checksum 0x9c460b2, Offset: 0x5a0
// Size: 0x5e
function guardian_init() {
    guardian = self;
    guardian.maxsightdistsqrd = 450 * 450;
    guardian turret::set_on_target_angle(15, 0);
    guardian.soundmod = "hpm";
}

