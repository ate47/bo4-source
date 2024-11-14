#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;

#namespace dynamic_loadout;

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x2
// Checksum 0xe2d83eb4, Offset: 0x3b8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"dynamic_loadout", &__init__, undefined, #"weapons");
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0x8855c958, Offset: 0x408
// Size: 0x14
function private __init__() {
    registerclientfields();
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0xea6b1513, Offset: 0x428
// Size: 0x4d4
function private registerclientfields() {
    packagelist = getscriptbundlelist("bounty_hunter_package_list");
    if (isdefined(packagelist)) {
        var_2b5b08bd = int(ceil(log2(packagelist.size + 1)));
        var_ff35ecd8 = getgametypesetting(#"bountybagomoneymoney");
        level.var_16fd9420 = getgametypesetting(#"hash_63f8d60d122e755b");
        if (level.var_16fd9420 > 0) {
            var_bfbe32b4 = int(ceil(log2(var_ff35ecd8 / level.var_16fd9420)));
            clientfield::register("toplayer", "bountyBagMoney", 1, var_bfbe32b4, "int", &function_c25afb06, 0, 0);
        } else {
            clientfield::register("toplayer", "bountyBagMoney", 1, 1, "int", &function_c25afb06, 0, 0);
        }
        clientfield::register("toplayer", "bountyMoney", 1, 14, "int", &function_a6d394a9, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.primary", 1, var_2b5b08bd, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.secondary", 1, var_2b5b08bd, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.primaryAttachmentTrack.tierPurchased", 1, 2, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.secondaryAttachmentTrack.tierPurchased", 1, 2, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.armor", 1, var_2b5b08bd, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.mobilityTrack.tierPurchased", 1, 2, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.reconTrack.tierPurchased", 1, 2, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.assaultTrack.tierPurchased", 1, 2, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.supportTrack.tierPurchased", 1, 2, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.scorestreak", 1, var_2b5b08bd, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "luielement.BountyHunterLoadout.equipment", 1, var_2b5b08bd, "int", undefined, 0, 0);
        clientfield::register("worlduimodel", "BountyHunterLoadout.timeRemaining", 1, 5, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "hudItems.BountyCarryingBag", 1, 1, "int", undefined, 0, 0);
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 7, eflags: 0x4
// Checksum 0x5245dc08, Offset: 0x908
// Size: 0xc4
function private function_a6d394a9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    parent = getuimodelforcontroller(localclientnum);
    var_b58165cc = getuimodel(parent, "luielement.BountyHunterLoadout.money");
    if (!isdefined(var_b58165cc)) {
        var_b58165cc = createuimodel(parent, "luielement.BountyHunterLoadout.money");
    }
    setuimodelvalue(var_b58165cc, newval);
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 7, eflags: 0x4
// Checksum 0x6f76ae40, Offset: 0x9d8
// Size: 0x114
function private function_c25afb06(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    parent = getuimodelforcontroller(localclientnum);
    var_d4d4591d = getuimodel(parent, "hudItems.bountyBagMoney");
    if (!isdefined(var_d4d4591d)) {
        var_d4d4591d = createuimodel(parent, "hudItems.bountyBagMoney");
    }
    if (level.var_16fd9420) {
        var_c9939aa4 = newval * level.var_16fd9420;
    } else {
        var_c9939aa4 = getgametypesetting(#"bountybagomoneymoney");
    }
    setuimodelvalue(var_d4d4591d, var_c9939aa4);
}

