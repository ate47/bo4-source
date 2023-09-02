// Atian COD Tools GSC decompiler test
#using scripts\abilities\gadgets\gadget_health_regen.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace pickup_health;

// Namespace pickup_health/pickup_health
// Params 0, eflags: 0x2
// Checksum 0x181fb090, Offset: 0x110
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"pickup_health", &__init__, undefined, #"weapons");
}

// Namespace pickup_health/pickup_health
// Params 0, eflags: 0x4
// Checksum 0xbdd433cb, Offset: 0x160
// Size: 0x12e
function private __init__() {
    callback::on_connect(&onconnect);
    callback::on_spawned(&onspawned);
    ability_player::register_gadget_activation_callbacks(23, &onhealthregen, &offhealthregen);
    level.healingdisabled = &offhealthregen;
    level.var_99a34951 = getgametypesetting(#"hash_712f4c2a96bca56e");
    level.var_33a3ef40 = getgametypesetting(#"hash_647310a2fe3554f7");
    level.var_aff59367 = getgametypesetting(#"hash_44533f4f290c5e77");
    level.pickup_respawn_time = getgametypesetting(#"hash_6a2434c947c86b9b");
}

// Namespace pickup_health/pickup_health
// Params 0, eflags: 0x0
// Checksum 0x5885f90d, Offset: 0x298
// Size: 0x24a
function function_e963e37d() {
    var_7a23c03b = getentarray("pickup_health", "targetname");
    foreach (pickup in var_7a23c03b) {
        pickup.trigger = spawn("trigger_radius_use", pickup.origin + vectorscale((0, 0, 1), 15), 0, 120, 100);
        pickup.trigger setcursorhint("HINT_INTERACTIVE_PROMPT");
        pickup.trigger triggerignoreteam();
        pickup.gameobject = gameobjects::create_use_object(#"neutral", pickup.trigger, [], vectorscale((0, 0, 1), 60), "pickup_health");
        pickup.gameobject gameobjects::set_objective_entity(pickup.gameobject);
        pickup.gameobject gameobjects::set_visible_team(#"any");
        pickup.gameobject gameobjects::allow_use(#"any");
        pickup.gameobject gameobjects::set_use_time(0);
        pickup.gameobject.usecount = 0;
        pickup.gameobject.var_5ecd70 = pickup;
        pickup.gameobject.onuse = &function_5bb13b48;
    }
}

// Namespace pickup_health/pickup_health
// Params 1, eflags: 0x0
// Checksum 0x79e0d125, Offset: 0x4f0
// Size: 0x8c
function function_dd4bf8ac(num) {
    if (self.pers[#"pickup_health"] < level.var_99a34951) {
        self.pers[#"pickup_health"] = self.pers[#"pickup_health"] + num;
        self function_2bcfabea();
        return 1;
    }
    return 0;
}

// Namespace pickup_health/pickup_health
// Params 0, eflags: 0x4
// Checksum 0xfe3f5e30, Offset: 0x588
// Size: 0x3e
function private onconnect() {
    if (!isdefined(self.pers[#"pickup_health"])) {
        self.pers[#"pickup_health"] = 0;
    }
}

// Namespace pickup_health/pickup_health
// Params 0, eflags: 0x4
// Checksum 0x9f506e64, Offset: 0x5d0
// Size: 0x1c
function private onspawned() {
    self function_3fbb0e22();
}

// Namespace pickup_health/pickup_health
// Params 0, eflags: 0x0
// Checksum 0xd1c80417, Offset: 0x5f8
// Size: 0x1c
function function_3fbb0e22() {
    waitframe(1);
    self function_2bcfabea();
}

// Namespace pickup_health/pickup_health
// Params 2, eflags: 0x4
// Checksum 0x51456269, Offset: 0x620
// Size: 0x2e
function private onhealthregen(slot, weapon) {
    self.pers[#"pickup_health"]--;
}

// Namespace pickup_health/pickup_health
// Params 2, eflags: 0x4
// Checksum 0x823707f1, Offset: 0x658
// Size: 0x4c
function private offhealthregen(slot, weapon) {
    self gadgetdeactivate(self.gadget_health_regen_slot, self.gadget_health_regen_weapon);
    thread healingdone();
}

// Namespace pickup_health/pickup_health
// Params 0, eflags: 0x4
// Checksum 0x62b0b445, Offset: 0x6b0
// Size: 0x24
function private healingdone() {
    wait(0.5);
    self function_2bcfabea();
}

// Namespace pickup_health/pickup_health
// Params 1, eflags: 0x4
// Checksum 0xb332f833, Offset: 0x6e0
// Size: 0x1dc
function private function_5bb13b48(player) {
    if (isdefined(player) && isplayer(player)) {
        if (player function_dd4bf8ac(1)) {
            if (isdefined(self.objectiveid)) {
                objective_setinvisibletoplayer(self.objectiveid, player);
            }
            self.var_5ecd70 setinvisibletoplayer(player);
            self.trigger setinvisibletoplayer(player);
            player playsoundtoplayer(#"hash_8a4d3f134fa94d7", player);
            self.usecount++;
            player gestures::function_56e00fbf(#"gestable_grab", undefined, 0);
            if (isdefined(level.var_aff59367) && level.var_aff59367) {
                self thread function_7a80944d(player);
            }
        } else {
            player iprintlnbold(#"hash_5a11b7ef0cd7e33b");
            player playsoundtoplayer(#"uin_unavailable_charging", player);
        }
    }
    if (!(isdefined(level.var_aff59367) && level.var_aff59367) && self.usecount >= level.var_ad9d03e7) {
        self.var_5ecd70 delete();
        self gameobjects::disable_object(1);
    }
}

// Namespace pickup_health/pickup_health
// Params 1, eflags: 0x4
// Checksum 0x50e3e32f, Offset: 0x8c8
// Size: 0xc4
function private function_7a80944d(player) {
    level endon(#"game_ended");
    self endon(#"death");
    player endon(#"disconnect");
    wait(isdefined(level.pickup_respawn_time) ? level.pickup_respawn_time : 0);
    if (isdefined(self.objectiveid)) {
        objective_setvisibletoplayer(self.objectiveid, player);
    }
    self.var_5ecd70 setvisibletoplayer(player);
    self.trigger setvisibletoplayer(player);
}

// Namespace pickup_health/pickup_health
// Params 0, eflags: 0x4
// Checksum 0xdd7ccd7c, Offset: 0x998
// Size: 0x15c
function private function_2bcfabea() {
    if (!isdefined(self) || !isdefined(self.pers[#"pickup_health"])) {
        return;
    }
    if (self.pers[#"pickup_health"] <= 0) {
        self gadget_health_regen::power_off();
        if (isdefined(self.gadget_health_regen_slot)) {
            self function_19ed70ca(self.gadget_health_regen_slot, 1);
        }
        if (self.pers[#"pickup_health"] < 0) {
            self.pers[#"pickup_health"] = 0;
        }
    } else {
        self gadget_health_regen::power_on();
        if (self.pers[#"pickup_health"] > level.var_99a34951) {
            self.pers[#"pickup_health"] = level.var_99a34951;
        }
    }
    self clientfield::set_player_uimodel("hudItems.numHealthPickups", self.pers[#"pickup_health"]);
}

