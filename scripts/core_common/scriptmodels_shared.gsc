// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace scriptmodels;

// Namespace scriptmodels/scriptmodels_shared
// Params 0, eflags: 0x2
// Checksum 0x151079a9, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"scriptmodels", &__init__, undefined, undefined);
}

// Namespace scriptmodels/scriptmodels_shared
// Params 0, eflags: 0x0
// Checksum 0x330cf53, Offset: 0xf0
// Size: 0x98
function __init__() {
    a_script_models = getentarraybytype(6);
    foreach (model in a_script_models) {
        function_9abee270(model);
    }
}

// Namespace scriptmodels/scriptmodels_shared
// Params 1, eflags: 0x4
// Checksum 0x4fdc61ca, Offset: 0x190
// Size: 0x13c
function private function_9abee270(model) {
    /#
        assert(isdefined(model));
    #/
    if (model.classname != "script_model" && model.classname != "script_brushmodel") {
        return;
    }
    if (isdefined(model.script_health)) {
        model.health = model.script_health;
        model.maxhealth = model.script_health;
        model.takedamage = 1;
    }
    if (isdefined(model.var_3ee8e0e2) && model.var_3ee8e0e2) {
        model util::make_sentient();
    }
    if (isdefined(model.script_team) && model.script_team != "none") {
        model.team = model.script_team;
        model setteam(model.script_team);
    }
}

