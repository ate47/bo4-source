// Atian COD Tools GSC decompiler test
#include scripts/killstreaks/killstreak_bundles.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/shoutcaster.csc;
#include scripts/core_common/renderoverridebundle.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/array_shared.csc;

#namespace killstreak_detect;

// Namespace killstreak_detect/killstreak_detect
// Params 0, eflags: 0x0
// Checksum 0xd19fc647, Offset: 0x170
// Size: 0x29c
function init_shared() {
    if (!isdefined(level.var_c662dc2d)) {
        level.var_c662dc2d = {};
        callback::on_localplayer_spawned(&watch_killstreak_detect_perks_changed);
        clientfield::register("scriptmover", "enemyvehicle", 1, 2, "int", &enemyscriptmovervehicle_changed, 0, 0);
        clientfield::register("vehicle", "enemyvehicle", 1, 2, "int", &enemyvehicle_changed, 0, 1);
        clientfield::register("missile", "enemyvehicle", 1, 2, "int", &enemymissilevehicle_changed, 0, 1);
        clientfield::register("actor", "enemyvehicle", 1, 2, "int", &function_430c370a, 0, 1);
        clientfield::register("vehicle", "vehicletransition", 1, 1, "int", &vehicle_transition, 0, 1);
        if (!isdefined(level.enemyvehicles)) {
            level.enemyvehicles = [];
        }
        if (!isdefined(level.enemymissiles)) {
            level.enemymissiles = [];
        }
        if (!isdefined(level.var_51afeae4)) {
            level.var_51afeae4 = [];
        }
        function_8ac48939(level.killstreakcorebundle);
        level.emp_killstreaks = [];
        renderoverridebundle::function_f72f089c(#"hash_7d4b6b0d84ddafa3", #"friendly", sessionmodeiscampaigngame() ? #"rob_sonar_set_friendlyequip_cp" : #"rob_sonar_set_friendlyequip_mp", &function_95f96f3e);
    }
}

// Namespace killstreak_detect/killstreak_detect
// Params 3, eflags: 0x1 linked
// Checksum 0xf087e375, Offset: 0x418
// Size: 0x132
function function_95f96f3e(local_client_num, bundle, param) {
    if (!self function_4e0ca360()) {
        return 0;
    }
    if (!(isdefined(level.friendlycontentoutlines) && level.friendlycontentoutlines)) {
        return 0;
    }
    if (shoutcaster::is_shoutcaster(local_client_num)) {
        return 0;
    }
    if (self.type === "vehicle" && self function_4add50a7()) {
        return 0;
    }
    if (isdefined(level.vision_pulse[local_client_num]) && level.vision_pulse[local_client_num]) {
        return 0;
    }
    player = function_5c10bd79(local_client_num);
    if (self == player) {
        return 0;
    }
    if (player.var_33b61b6f === 1) {
        bundle.force_kill = 1;
        return 0;
    }
    return 1;
}

// Namespace killstreak_detect/killstreak_detect
// Params 1, eflags: 0x1 linked
// Checksum 0xf8155198, Offset: 0x558
// Size: 0x11c
function function_7181329a(entity) {
    if (isplayer(entity)) {
        return 0;
    }
    if (entity.type != "missile" && entity.type != "vehicle" && entity.type != "scriptmover" && entity.type != "actor") {
        return 0;
    }
    if (self clientfield::get("enemyvehicle") != 0) {
        return 1;
    }
    if (entity.type != "actor" && self.type !== "vehicle" && self clientfield::get("enemyequip") != 0) {
        return 1;
    }
    return 0;
}

// Namespace killstreak_detect/killstreak_detect
// Params 2, eflags: 0x1 linked
// Checksum 0xaa79f8da, Offset: 0x680
// Size: 0x14e
function function_903bbed3(local_client_num, bundle) {
    if (self function_4e0ca360()) {
        return 0;
    }
    if (shoutcaster::is_shoutcaster(local_client_num)) {
        return 0;
    }
    if (self.type === "vehicle" && self function_4add50a7()) {
        return 0;
    }
    if (isdefined(self.isbreachingfirewall) && self.isbreachingfirewall == 1) {
        return 0;
    }
    if (function_5778f82(local_client_num, #"specialty_showenemyvehicles") && !isplayer(self) && function_7181329a(self)) {
        return 1;
    }
    player = function_5c10bd79(local_client_num);
    if (isdefined(player) && player.var_33b61b6f === 1) {
        bundle.force_kill = 1;
        return 1;
    }
    return 0;
}

// Namespace killstreak_detect/killstreak_detect
// Params 2, eflags: 0x1 linked
// Checksum 0xffa2f298, Offset: 0x7d8
// Size: 0x164
function function_d859c344(local_client_num, newval) {
    bundle = self killstreak_bundles::function_48e9536e();
    if (!isdefined(bundle)) {
        bundle = level.killstreakcorebundle;
    }
    if (isdefined(bundle)) {
        show_friendly = bundle.("ksROBShowFriendly");
        if (isdefined(show_friendly) && show_friendly) {
            self renderoverridebundle::function_c8d97b8e(local_client_num, #"friendly", bundle.var_d3413870 + "friendly");
        }
        show_enemy = bundle.("ksROBShowEnemy");
        if (isdefined(show_enemy) && show_enemy) {
            self renderoverridebundle::function_c8d97b8e(local_client_num, #"enemy", bundle.var_d3413870 + "enemy");
        }
    } else {
        self renderoverridebundle::function_c8d97b8e(local_client_num, #"friendly", #"hash_7d4b6b0d84ddafa3");
    }
}

// Namespace killstreak_detect/killstreak_detect
// Params 7, eflags: 0x1 linked
// Checksum 0x2e91bc77, Offset: 0x948
// Size: 0x90
function vehicle_transition(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_d859c344(local_client_num, newval);
    if (isdefined(level.var_7cc76271)) {
        [[ level.var_7cc76271 ]](local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
    }
}

// Namespace killstreak_detect/killstreak_detect
// Params 1, eflags: 0x1 linked
// Checksum 0xb2883af, Offset: 0x9e0
// Size: 0x44
function should_set_compass_icon(local_client_num) {
    return self function_83973173() || function_5778f82(local_client_num, #"specialty_showenemyvehicles");
}

// Namespace killstreak_detect/killstreak_detect
// Params 7, eflags: 0x1 linked
// Checksum 0x844f510d, Offset: 0xa30
// Size: 0xe4
function enemyscriptmovervehicle_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(level.scriptmovercompassicons) && isdefined(self.model)) {
        if (isdefined(level.scriptmovercompassicons[self.model])) {
            if (self should_set_compass_icon(local_client_num)) {
                self setcompassicon(level.scriptmovercompassicons[self.model]);
            }
        }
    }
    enemyvehicle_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

// Namespace killstreak_detect/killstreak_detect
// Params 7, eflags: 0x1 linked
// Checksum 0x9ea699aa, Offset: 0xb20
// Size: 0xe4
function enemymissilevehicle_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(level.missilecompassicons) && isdefined(self.weapon)) {
        if (isdefined(level.missilecompassicons[self.weapon])) {
            if (self should_set_compass_icon(local_client_num)) {
                self setcompassicon(level.missilecompassicons[self.weapon]);
            }
        }
    }
    enemymissile_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

// Namespace killstreak_detect/killstreak_detect
// Params 7, eflags: 0x1 linked
// Checksum 0xdd3982d9, Offset: 0xc10
// Size: 0x74
function enemymissile_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self updateteammissiles(local_client_num, newval);
    self util::add_remove_list(level.enemymissiles, newval);
}

// Namespace killstreak_detect/killstreak_detect
// Params 7, eflags: 0x1 linked
// Checksum 0xe7b6fb21, Offset: 0xc90
// Size: 0x1b2
function enemyvehicle_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(level.draftstage) && (level.draftstage > 0 || isdefined(level.var_8c099032) && level.var_8c099032)) {
        self function_d05902d9(local_client_num, newval);
        return;
    }
    self updateteamvehicles(local_client_num, newval);
    self util::add_remove_list(level.enemyvehicles, newval);
    self updateenemyvehicles(local_client_num, newval);
    if (isdefined(self.model) && self.model == "wpn_t7_turret_emp_core" && self.type === "vehicle") {
        if (!isdefined(level.emp_killstreaks)) {
            level.emp_killstreaks = [];
        } else if (!isarray(level.emp_killstreaks)) {
            level.emp_killstreaks = array(level.emp_killstreaks);
        }
        level.emp_killstreaks[level.emp_killstreaks.size] = self;
    }
}

// Namespace killstreak_detect/killstreak_detect
// Params 7, eflags: 0x1 linked
// Checksum 0xddc546fb, Offset: 0xe50
// Size: 0xd4
function function_430c370a(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(level.draftstage) && (level.draftstage > 0 || isdefined(level.var_8c099032) && level.var_8c099032)) {
        self function_f27ffe49(local_client_num, newval);
        return;
    }
    self util::add_remove_list(level.var_51afeae4, newval);
    self function_f884010a(local_client_num, newval);
}

// Namespace killstreak_detect/killstreak_detect
// Params 2, eflags: 0x1 linked
// Checksum 0x31fc96ea, Offset: 0xf30
// Size: 0x2c
function updateteamvehicles(local_client_num, newval) {
    self checkteamvehicles(local_client_num);
}

// Namespace killstreak_detect/killstreak_detect
// Params 2, eflags: 0x1 linked
// Checksum 0x47fc2b74, Offset: 0xf68
// Size: 0x2c
function updateteammissiles(local_client_num, newval) {
    self checkteammissiles(local_client_num);
}

// Namespace killstreak_detect/killstreak_detect
// Params 2, eflags: 0x1 linked
// Checksum 0xc70145cf, Offset: 0xfa0
// Size: 0x34
function function_f884010a(local_client_num, newval) {
    if (!isdefined(self)) {
        return;
    }
    function_d859c344(local_client_num, newval);
}

// Namespace killstreak_detect/killstreak_detect
// Params 2, eflags: 0x1 linked
// Checksum 0x1c93cf2, Offset: 0xfe0
// Size: 0x34
function updateenemyvehicles(local_client_num, newval) {
    if (!isdefined(self)) {
        return;
    }
    function_d859c344(local_client_num, newval);
}

// Namespace killstreak_detect/killstreak_detect
// Params 2, eflags: 0x1 linked
// Checksum 0xf64b8976, Offset: 0x1020
// Size: 0x34
function updateenemymissiles(local_client_num, newval) {
    if (!isdefined(self)) {
        return;
    }
    function_d859c344(local_client_num, newval);
}

// Namespace killstreak_detect/killstreak_detect
// Params 1, eflags: 0x1 linked
// Checksum 0xddcec4c7, Offset: 0x1060
// Size: 0x176
function watch_killstreak_detect_perks_changed(local_client_num) {
    if (!self function_21c0fa55()) {
        return;
    }
    self notify(#"watch_killstreak_detect_perks_changed");
    self endon(#"watch_killstreak_detect_perks_changed");
    self endon(#"death");
    self endon(#"disconnect");
    while (isdefined(self)) {
        waitframe(1);
        util::clean_deleted(level.var_51afeae4);
        util::clean_deleted(level.enemyvehicles);
        util::clean_deleted(level.enemymissiles);
        array::thread_all(level.var_51afeae4, &function_f884010a, local_client_num, 1);
        array::thread_all(level.enemyvehicles, &updateenemyvehicles, local_client_num, 1);
        array::thread_all(level.enemymissiles, &updateenemymissiles, local_client_num, 1);
        self waittill(#"perks_changed");
    }
}

// Namespace killstreak_detect/killstreak_detect
// Params 1, eflags: 0x1 linked
// Checksum 0x4ca2e53b, Offset: 0x11e0
// Size: 0x13e
function checkteamvehicles(localclientnum) {
    if (!isdefined(self.owner) || !isdefined(self.owner.team)) {
        return;
    }
    if (!isdefined(self.vehicleoldteam)) {
        self.vehicleoldteam = self.team;
    }
    if (!isdefined(self.vehicleoldownerteam)) {
        self.vehicleoldownerteam = self.owner.team;
    }
    var_fd9de919 = function_9b3f0ed1(localclientnum);
    if (!isdefined(self.vehicleoldwatcherteam)) {
        self.vehicleoldwatcherteam = var_fd9de919;
    }
    if (self.vehicleoldteam != self.team || self.vehicleoldownerteam != self.owner.team || self.vehicleoldwatcherteam != var_fd9de919) {
        self.vehicleoldteam = self.team;
        self.vehicleoldownerteam = self.owner.team;
        self.vehicleoldwatcherteam = var_fd9de919;
        self notify(#"team_changed");
    }
}

// Namespace killstreak_detect/killstreak_detect
// Params 1, eflags: 0x1 linked
// Checksum 0x56e9cba0, Offset: 0x1328
// Size: 0x13e
function checkteammissiles(localclientnum) {
    if (!isdefined(self.owner) || !isdefined(self.owner.team)) {
        return;
    }
    if (!isdefined(self.missileoldteam)) {
        self.missileoldteam = self.team;
    }
    if (!isdefined(self.missileoldownerteam)) {
        self.missileoldownerteam = self.owner.team;
    }
    var_fd9de919 = function_9b3f0ed1(localclientnum);
    if (!isdefined(self.missileoldwatcherteam)) {
        self.missileoldwatcherteam = var_fd9de919;
    }
    if (self.missileoldteam != self.team || self.missileoldownerteam != self.owner.team || self.missileoldwatcherteam != var_fd9de919) {
        self.missileoldteam = self.team;
        self.missileoldownerteam = self.owner.team;
        self.missileoldwatcherteam = var_fd9de919;
        self notify(#"team_changed");
    }
}

// Namespace killstreak_detect/killstreak_detect
// Params 1, eflags: 0x1 linked
// Checksum 0x4771e74f, Offset: 0x1470
// Size: 0xfc
function function_8ac48939(bundle) {
    show_friendly = bundle.("ksROBShowFriendly");
    if (isdefined(show_friendly) && show_friendly) {
        renderoverridebundle::function_f72f089c(bundle.var_d3413870 + "friendly", bundle.("ksROBFriendly"), &function_95f96f3e);
    }
    show_enemy = bundle.("ksROBShowEnemy");
    if (isdefined(show_enemy) && show_enemy) {
        renderoverridebundle::function_f72f089c(bundle.var_d3413870 + "enemy", bundle.("ksROBEnemy"), &function_903bbed3);
    }
}

// Namespace killstreak_detect/killstreak_detect
// Params 2, eflags: 0x5 linked
// Checksum 0x21571031, Offset: 0x1578
// Size: 0x138
function private function_d05902d9(local_client_num, newval) {
    if (!isdefined(level.var_b1dca2fb)) {
        level.var_b1dca2fb = [];
    }
    if (!isdefined(level.var_b1dca2fb[local_client_num])) {
        level.var_b1dca2fb[local_client_num] = [];
    }
    var_55251088 = spawnstruct();
    var_55251088.vehicle = self;
    var_55251088.newval = newval;
    if (!isdefined(level.var_b1dca2fb[local_client_num])) {
        level.var_b1dca2fb[local_client_num] = [];
    } else if (!isarray(level.var_b1dca2fb[local_client_num])) {
        level.var_b1dca2fb[local_client_num] = array(level.var_b1dca2fb[local_client_num]);
    }
    level.var_b1dca2fb[local_client_num][level.var_b1dca2fb[local_client_num].size] = var_55251088;
}

// Namespace killstreak_detect/killstreak_detect
// Params 1, eflags: 0x1 linked
// Checksum 0xc20d0e5e, Offset: 0x16b8
// Size: 0x152
function function_32c8b999(local_client_num) {
    if (!isdefined(level.var_b1dca2fb) || !isdefined(level.var_b1dca2fb[local_client_num])) {
        return;
    }
    for (i = level.var_b1dca2fb[local_client_num].size - 1; i >= 0; i--) {
        vehicle = level.var_b1dca2fb[local_client_num][i].vehicle;
        newval = level.var_b1dca2fb[local_client_num][i].newval;
        if (isdefined(vehicle) && isalive(vehicle)) {
            vehicle enemyvehicle_changed(local_client_num, undefined, newval);
        }
        i = [];
    }
    arrayremoveindex(level.var_b1dca2fb, local_client_num);
    if (level.var_b1dca2fb.size == 0) {
        level.var_b1dca2fb = undefined;
    }
}

// Namespace killstreak_detect/killstreak_detect
// Params 2, eflags: 0x5 linked
// Checksum 0x698957d5, Offset: 0x1818
// Size: 0x138
function private function_f27ffe49(local_client_num, newval) {
    if (!isdefined(level.inserted_pop_)) {
        level.inserted_pop_ = [];
    }
    if (!isdefined(level.inserted_pop_[local_client_num])) {
        level.inserted_pop_[local_client_num] = [];
    }
    var_a87a8991 = spawnstruct();
    var_a87a8991.actor = self;
    var_a87a8991.newval = newval;
    if (!isdefined(level.inserted_pop_[local_client_num])) {
        level.inserted_pop_[local_client_num] = [];
    } else if (!isarray(level.inserted_pop_[local_client_num])) {
        level.inserted_pop_[local_client_num] = array(level.inserted_pop_[local_client_num]);
    }
    level.inserted_pop_[local_client_num][level.inserted_pop_[local_client_num].size] = var_a87a8991;
}

// Namespace killstreak_detect/killstreak_detect
// Params 1, eflags: 0x1 linked
// Checksum 0xf5db7401, Offset: 0x1958
// Size: 0x152
function function_3eff7815(local_client_num) {
    if (!isdefined(level.inserted_pop_) || !isdefined(level.inserted_pop_[local_client_num])) {
        return;
    }
    for (i = level.inserted_pop_[local_client_num].size - 1; i >= 0; i--) {
        actor = level.inserted_pop_[local_client_num][i].actor;
        newval = level.inserted_pop_[local_client_num][i].newval;
        if (isdefined(actor) && isalive(actor)) {
            actor function_430c370a(local_client_num, undefined, newval);
        }
        i = [];
    }
    arrayremoveindex(level.inserted_pop_, local_client_num);
    if (level.inserted_pop_.size == 0) {
        level.inserted_pop_ = undefined;
    }
}

