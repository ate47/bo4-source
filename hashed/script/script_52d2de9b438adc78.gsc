#using scripts\core_common\util_shared;
#using scripts\killstreaks\killstreakrules_shared;
#using scripts\killstreaks\killstreaks_util;
#using scripts\killstreaks\killstreak_bundles;
#using scripts\killstreaks\helicopter_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\clientfield_shared;

#namespace ir_strobe;

// Namespace ir_strobe/namespace_f0840611
// Params 0, eflags: 0x1 linked
// Checksum 0x94d2bf0e, Offset: 0x148
// Size: 0x54
function init_shared() {
    if (!isdefined(level.var_860c22f0)) {
        level.var_860c22f0 = {};
        clientfield::register("toplayer", "marker_state", 1, 2, "int");
    }
}

// Namespace ir_strobe/namespace_f0840611
// Params 2, eflags: 0x1 linked
// Checksum 0x94caf0e3, Offset: 0x1a8
// Size: 0x82
function function_8806675d(ksweap, activatefunc) {
    if (!isdefined(level.var_d2c88dc5)) {
        level.var_d2c88dc5 = [];
    } else if (isdefined(level.var_d2c88dc5[ksweap])) {
        return;
    }
    level.var_d2c88dc5[ksweap] = activatefunc;
    level.var_d2c88dc5["inventory_" + ksweap] = activatefunc;
}

// Namespace ir_strobe/namespace_f0840611
// Params 3, eflags: 0x1 linked
// Checksum 0x58d741de, Offset: 0x238
// Size: 0x8e
function function_c5d20b5c(owner, context, position) {
    self clientfield::set_player_uimodel("hudItems.abilityHintIndex", 0);
    if (isdefined(context.killstreaktype) && isdefined(level.var_d2c88dc5[context.killstreaktype])) {
        [[ level.var_d2c88dc5[context.killstreaktype] ]](owner, context, position);
    }
}

// Namespace ir_strobe/namespace_f0840611
// Params 2, eflags: 0x1 linked
// Checksum 0xc36a7702, Offset: 0x2d0
// Size: 0x244
function function_f625256f(killstreak_id, context) {
    player = self;
    self endon(#"disconnect", #"spawned_player");
    var_9eb4725b = level.weaponnone;
    currentweapon = self getcurrentweapon();
    prevweapon = currentweapon;
    if (currentweapon.issupplydropweapon) {
        var_9eb4725b = currentweapon;
    }
    if (var_9eb4725b.isgrenadeweapon) {
        trigger_event = "grenade_fire";
    } else {
        trigger_event = "weapon_fired";
    }
    self clientfield::set_player_uimodel("hudItems.abilityHintIndex", 3);
    self thread function_ef6c4a46(killstreak_id, trigger_event, var_9eb4725b, context);
    while (true) {
        player allowmelee(0);
        notifystring = self waittill(#"weapon_change", trigger_event, #"disconnect", #"spawned_player");
        player allowmelee(1);
        if (trigger_event != "none") {
            if (notifystring._notify != trigger_event) {
                cleanup(context, player);
                return false;
            }
        }
        if (isdefined(player.markerposition)) {
            break;
        }
    }
    self notify(#"trigger_weapon_shutdown");
    if (var_9eb4725b == level.weaponnone) {
        cleanup(context, player);
        return false;
    }
    return true;
}

// Namespace ir_strobe/namespace_f0840611
// Params 2, eflags: 0x1 linked
// Checksum 0xf505817a, Offset: 0x520
// Size: 0x122
function cleanup(context, player) {
    if (isdefined(context) && isdefined(context.marker)) {
        context.marker delete();
        context.marker = undefined;
        if (isdefined(context.markerfxhandle)) {
            context.markerfxhandle delete();
            context.markerfxhandle = undefined;
        }
        if (isdefined(player)) {
            player clientfield::set_to_player("marker_state", 0);
            player clientfield::set_player_uimodel("hudItems.abilityHintIndex", 0);
        }
    }
    if (isdefined(context) && isdefined(context.var_597ac911) && isdefined(context.var_43dc1011)) {
        [[ context.var_597ac911 ]](context);
        context.var_597ac911 = undefined;
    }
}

// Namespace ir_strobe/namespace_f0840611
// Params 1, eflags: 0x1 linked
// Checksum 0xe357c924, Offset: 0x650
// Size: 0xc4
function markercleanupthread(context) {
    player = self;
    player waittill(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"cleanup_marker", #"changed_specialist");
    if (player flagsys::get(#"marking_done")) {
        return;
    }
    cleanup(context, player);
}

// Namespace ir_strobe/namespace_f0840611
// Params 1, eflags: 0x1 linked
// Checksum 0x5d7d5024, Offset: 0x720
// Size: 0x6b6
function markerupdatethread(context) {
    player = self;
    player endon(#"hash_27be2db04a0908d5", #"spawned_player", #"disconnect", #"weapon_change", #"death");
    markermodel = spawn("script_model", (0, 0, 0));
    context.marker = markermodel;
    if (isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](markermodel, 0);
    }
    player thread markercleanupthread(context);
    while (true) {
        if (player flagsys::get(#"marking_done")) {
            break;
        }
        ksbundle = killstreak_bundles::get_bundle(context);
        minrange = 20;
        maxrange = 500;
        if (isdefined(ksbundle) && isdefined(ksbundle.var_3307f79d)) {
            minrange = ksbundle.var_3307f79d;
            maxrange = ksbundle.var_ffbb43eb;
        }
        forwardvector = vectorscale(anglestoforward(player getplayerangles()), maxrange);
        mask = 1;
        if (isdefined(context.tracemask)) {
            mask = context.tracemask;
        }
        angles = player getplayerangles();
        if (isdefined(level.var_4970b0af) && level.var_4970b0af) {
            mask = 1;
            radius = 10;
            eyepos = player geteye();
            forwardvector = vectorscale(anglestoforward(angles), 300);
            results = bullettrace(eyepos, eyepos + forwardvector, 0, player, 1);
            if (results[#"fraction"] >= 1) {
                results = bullettrace(results[#"position"], results[#"position"] + (0, 0, -1000), 0, player, 1);
            }
        } else {
            weapon = getweapon("ir_strobe");
            eye = player getweaponmuzzlepoint();
            results = function_e6ba3ec9(weapon, eye, angles, player);
        }
        markermodel.origin = results[#"position"] + (0, 0, 6);
        node = helicopter::getvalidrandomstartnode(markermodel.origin);
        var_6aa266d6 = undefined;
        if (isdefined(node)) {
            var_6aa266d6 = node.origin;
        }
        tooclose = distancesquared(markermodel.origin, player.origin) < minrange * minrange;
        waterheight = getwaterheight(markermodel.origin);
        inwater = markermodel.origin[2] < waterheight;
        if (isdefined(var_6aa266d6) && !tooclose && !inwater && isdefined(context.islocationgood) && [[ context.islocationgood ]](markermodel.origin, context)) {
            player.markerposition = markermodel.origin;
            player clientfield::set_to_player("marker_state", 1);
            player function_bf191832(1, markermodel.origin, markermodel.angles);
        } else {
            player clientfield::set_to_player("marker_state", 2);
            iskillstreakallowed = 1;
            if (isdefined(context) && isdefined(context.killstreakref)) {
                if (!self killstreakrules::iskillstreakallowed(context.killstreakref, self.team, 1)) {
                    iskillstreakallowed = 0;
                }
            }
            if (getdvarint(#"hash_7ccc40e85206e0a5", 1)) {
                player.markerposition = markermodel.origin;
                if (iskillstreakallowed) {
                    player function_bf191832(1, markermodel.origin, markermodel.angles);
                } else {
                    player.markerposition = undefined;
                    player function_bf191832(0, (0, 0, 0), (0, 0, 0));
                }
            } else {
                player.markerposition = undefined;
                player function_bf191832(0, (0, 0, 0), (0, 0, 0));
            }
        }
        waitframe(1);
    }
}

// Namespace ir_strobe/namespace_f0840611
// Params 4, eflags: 0x1 linked
// Checksum 0x84cbe00e, Offset: 0xde0
// Size: 0x594
function function_ef6c4a46(killstreak_id, trigger_event, supplydropweapon, context) {
    player = self;
    self notify(#"hash_27be2db04a0908d5");
    self endon(#"hash_27be2db04a0908d5", #"spawned_player", #"disconnect", #"weapon_change");
    team = self.team;
    if (isdefined(killstreak_id) && killstreak_id == -1) {
        return;
    }
    context.killstreak_id = killstreak_id;
    player flagsys::clear(#"marking_done");
    self thread checkforemp();
    if (trigger_event != "none") {
        self thread markerupdatethread(context);
    }
    self thread cleanupwatcherondeath(killstreak_id, supplydropweapon);
    while (true) {
        waitframe(1);
        if (trigger_event == "none") {
            weapon = supplydropweapon;
            weapon_instance = weapon;
        } else {
            waitresult = self waittill(trigger_event);
            weapon = waitresult.weapon;
            weapon_instance = waitresult.projectile;
        }
        if (isdefined(weapon_instance)) {
            if (isdefined(level.var_14151f16)) {
                [[ level.var_14151f16 ]](weapon_instance, 0);
            }
        }
        if (isdefined(weapon_instance)) {
            if (isdefined(level.var_48c30195)) {
                [[ level.var_48c30195 ]](weapon_instance, 0);
            }
        }
        issupplydropweapon = 1;
        if (trigger_event == "grenade_fire") {
            issupplydropweapon = weapon.issupplydropweapon;
        }
        if (isdefined(self) && issupplydropweapon) {
            if (isdefined(context)) {
                var_9fdd755d = !isdefined(player.markerposition) || !(isdefined(context.islocationgood) && [[ context.islocationgood ]](player.markerposition, context));
                if (!getdvarint(#"hash_7ccc40e85206e0a5", 1)) {
                    if (var_9fdd755d) {
                        if (isdefined(level.killstreakcorebundle.ksinvalidlocationsound)) {
                            player playsoundtoplayer(level.killstreakcorebundle.ksinvalidlocationsound, player);
                        }
                        if (isdefined(level.killstreakcorebundle.ksinvalidlocationstring)) {
                            player iprintlnbold(level.killstreakcorebundle.ksinvalidlocationstring);
                        }
                        continue;
                    }
                    if (isdefined(context.validlocationsound)) {
                        player playsoundtoplayer(context.validlocationsound, player);
                    }
                } else if (var_9fdd755d) {
                    if (isdefined(level.killstreakcorebundle.ksinvalidlocationsound)) {
                        player playsoundtoplayer(level.killstreakcorebundle.ksinvalidlocationsound, player);
                    }
                } else if (isdefined(context.validlocationsound)) {
                    player playsoundtoplayer(context.validlocationsound, player);
                }
                ksbundle = killstreak_bundles::get_bundle(context);
                if (isdefined(ksbundle)) {
                    context.time = ksbundle.kstime;
                    context.fx_name = ksbundle.var_3af79d7e;
                }
                var_ca7e0817 = player.markerposition;
                player flagsys::set(#"marking_done");
                player clientfield::set_to_player("marker_state", 0);
                self thread function_c5d20b5c(self, context, var_ca7e0817);
            }
            self killstreaks::switch_to_last_non_killstreak_weapon();
        }
        break;
    }
    player flagsys::set(#"marking_done");
    if (isdefined(supplydropweapon) && isdefined(context.killstreakref)) {
        self killstreakrules::iskillstreakallowed(context.killstreakref, self.team);
    }
    player clientfield::set_to_player("marker_state", 0);
}

// Namespace ir_strobe/namespace_f0840611
// Params 2, eflags: 0x1 linked
// Checksum 0xd4b32bb8, Offset: 0x1380
// Size: 0xce
function cleanupwatcherondeath(killstreak_id, var_b57ab85c) {
    player = self;
    self endon(#"disconnect", #"supplydropwatcher", #"trigger_weapon_shutdown", #"spawned_player", #"weapon_change");
    self waittill(#"death", #"joined_team", #"joined_spectators", #"changed_specialist");
    self notify(#"cleanup_marker");
}

// Namespace ir_strobe/namespace_f0840611
// Params 0, eflags: 0x1 linked
// Checksum 0x7c67c309, Offset: 0x1458
// Size: 0x8c
function checkforemp() {
    self endon(#"supplydropwatcher", #"spawned_player", #"disconnect", #"weapon_change", #"death", #"trigger_weapon_shutdown");
    self waittill(#"emp_jammed");
    self killstreaks::switch_to_last_non_killstreak_weapon();
}

// Namespace ir_strobe/grenade_fire
// Params 1, eflags: 0x40
// Checksum 0xb165fa00, Offset: 0x14f0
// Size: 0xfc
function event_handler[grenade_fire] function_cb63f633(eventstruct) {
    if (!isdefined(level.var_d2c88dc5)) {
        return;
    }
    if (!isplayer(self)) {
        return;
    }
    grenade = eventstruct.projectile;
    if (grenade util::ishacked()) {
        return;
    }
    weapon = eventstruct.weapon;
    if (!isdefined(level.var_d2c88dc5[weapon.rootweapon.name])) {
        return;
    }
    if (isdefined(self.markerposition)) {
        grenade thread function_d5ca3f62(self);
        return;
    }
    grenade notify(#"death");
    waittillframeend();
    grenade delete();
}

// Namespace ir_strobe/namespace_f0840611
// Params 1, eflags: 0x1 linked
// Checksum 0xb8cc6848, Offset: 0x15f8
// Size: 0x10c
function function_d5ca3f62(player) {
    self endon(#"death");
    self.team = player.team;
    self waittill(#"rolling");
    if (!isdefined(player)) {
        return;
    }
    player notify(#"strobe_marked");
    if (!isdefined(self)) {
        return;
    }
    self function_2cbae477();
    player waittilltimeout(90, #"strobe_marked", #"payload_delivered", #"payload_fail", #"disconnect");
    if (!isdefined(self)) {
        return;
    }
    self.sndent delete();
    self delete();
}

// Namespace ir_strobe/namespace_f0840611
// Params 2, eflags: 0x5 linked
// Checksum 0x1503748f, Offset: 0x1710
// Size: 0xe4
function private function_2cbae477(var_babebdbc = #"weapon/fx8_equip_swat_smk_signal", var_76361c1a = "tag_flash") {
    playfxontag(var_babebdbc, self, var_76361c1a);
    self playsound(#"hash_6c91edfde8408dad");
    self.sndent = spawn("script_origin", self.origin);
    self.sndent linkto(self);
    self.sndent playloopsound(#"hash_63e34e1932c25073");
}

// Namespace ir_strobe/namespace_f0840611
// Params 5, eflags: 0x0
// Checksum 0xbe27692a, Offset: 0x1800
// Size: 0xd0
function function_284b1d4c(origin, model, timeout = undefined, var_babebdbc = undefined, var_76361c1a = undefined) {
    strobe = spawn("script_model", origin);
    strobe setmodel(model);
    strobe function_2cbae477(var_babebdbc, var_76361c1a);
    strobe thread function_f61c0c1(timeout);
    return strobe;
}

// Namespace ir_strobe/namespace_f0840611
// Params 1, eflags: 0x5 linked
// Checksum 0xd9c2874, Offset: 0x18d8
// Size: 0xa4
function private function_f61c0c1(timeout) {
    if (isdefined(timeout)) {
        self waittilltimeout(timeout, #"death", #"strobe_stop");
    } else {
        self waittill(#"death", #"strobe_stop");
    }
    if (!isdefined(self)) {
        return;
    }
    self.sndent delete();
    self delete();
}

