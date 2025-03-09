#using script_324d329b31b9b4ec;
#using scripts\core_common\ai_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\renderoverridebundle;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\killstreaks\killstreak_bundles;

#namespace swat_team;

// Namespace swat_team/overwatch_helicopter
// Params 0, eflags: 0x2
// Checksum 0xc554c7bd, Offset: 0xe8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"overwatch_helicopter", &__init__, undefined, #"killstreaks");
}

// Namespace swat_team/overwatch_helicopter
// Params 0, eflags: 0x0
// Checksum 0x4ba91646, Offset: 0x138
// Size: 0x5c
function __init__() {
    bundle = struct::get_script_bundle("killstreak", "killstreak_overwatch_helicopter");
    ai::add_archetype_spawn_function("human", &spawned, bundle);
}

// Namespace swat_team/overwatch_helicopter
// Params 7, eflags: 0x0
// Checksum 0x7bf81f1d, Offset: 0x1a0
// Size: 0x5c
function function_555b0649(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self disablevisioncircle(localclientnum);
    }
}

// Namespace swat_team/overwatch_helicopter
// Params 2, eflags: 0x0
// Checksum 0xea53117e, Offset: 0x208
// Size: 0x4c
function spawned(local_client_num, bundle) {
    if (self.subarchetype === #"human_sniper") {
        self killstreak_bundles::spawned(local_client_num, bundle);
    }
}

