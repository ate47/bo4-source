#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\util;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\util_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\aat_shared;
#using scripts\core_common\struct;

#namespace zm_loadout;

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x2
// Checksum 0x311bb2d, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_loadout", &__init__, undefined, undefined);
}

// Namespace zm_loadout/zm_loadout
// Params 0, eflags: 0x1 linked
// Checksum 0xca82cdee, Offset: 0x160
// Size: 0x3c
function __init__() {
    /#
        if (!isdemoplaying()) {
            callback::on_localplayer_spawned(&on_localplayer_spawned);
        }
    #/
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x0
// Checksum 0x2df0b8d6, Offset: 0x1a8
// Size: 0x1fe
function on_localplayer_spawned(localclientnum) {
    self.class_num = 0;
    if (isplayer(self)) {
        self.class_num = function_cc90c352(localclientnum);
    }
    self.loadout = [];
    var_cd6fae8c = self get_loadout_item(localclientnum, "primarygrenade");
    self.loadout[#"lethal"] = getunlockableiteminfofromindex(var_cd6fae8c, 1);
    var_9aeb4447 = self get_loadout_item(localclientnum, "primary");
    self.loadout[#"primary"] = getunlockableiteminfofromindex(var_9aeb4447, 1);
    self.loadout[#"perks"] = [];
    for (i = 1; i <= 4; i++) {
        var_96861ec8 = self get_loadout_item(localclientnum, "specialty" + i);
        self.loadout[#"perks"][i] = getunlockableiteminfofromindex(var_96861ec8, 3);
    }
    self.loadout[#"hero"] = self function_439b009a(localclientnum, "herogadget");
}

// Namespace zm_loadout/zm_loadout
// Params 1, eflags: 0x1 linked
// Checksum 0x1003d3e0, Offset: 0x3b0
// Size: 0x48
function function_622d8349(localclientnum) {
    level endon(#"demo_jump");
    while (!self registerrabbitshouldreset(localclientnum)) {
        waitframe(1);
    }
}

// Namespace zm_loadout/zm_loadout
// Params 2, eflags: 0x1 linked
// Checksum 0xccc93d89, Offset: 0x400
// Size: 0x92
function get_loadout_item(localclientnum, slot) {
    if (!isplayer(self)) {
        return undefined;
    }
    if (!isdefined(self.class_num)) {
        self.class_num = function_cc90c352(localclientnum);
    }
    if (!isdefined(self.class_num)) {
        self.class_num = 0;
    }
    return self getloadoutitem(localclientnum, self.class_num, slot);
}

// Namespace zm_loadout/zm_loadout
// Params 2, eflags: 0x1 linked
// Checksum 0x801f5ce5, Offset: 0x4a0
// Size: 0x92
function function_439b009a(localclientnum, slot) {
    if (!isplayer(self)) {
        return undefined;
    }
    if (!isdefined(self.class_num)) {
        self.class_num = function_cc90c352(localclientnum);
    }
    if (!isdefined(self.class_num)) {
        self.class_num = 0;
    }
    return self getloadoutweapon(localclientnum, self.class_num, slot);
}

