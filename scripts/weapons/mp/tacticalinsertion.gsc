#using scripts\core_common\system_shared;
#using scripts\weapons\hacker_tool;
#using scripts\weapons\tacticalinsertion;

#namespace tacticalinsertion;

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x2
// Checksum 0xf5e45f65, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"tacticalinsertion", &__init__, undefined, undefined);
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x1 linked
// Checksum 0xd60023d2, Offset: 0xc8
// Size: 0x2e
function __init__() {
    init_shared();
    level.var_96ee56b5 = &function_e34f7002;
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x1 linked
// Checksum 0x2aedce3a, Offset: 0x100
// Size: 0x2c
function function_e34f7002() {
    self hacker_tool::registerwithhackertool(level.equipmenthackertoolradius, level.equipmenthackertooltimems);
}

