#using scripts\abilities\ability_player;
#using scripts\abilities\gadgets\gadget_smart_cover;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\damagefeedback_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\gestures;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\influencers_shared;
#using scripts\core_common\player\player_loadout;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\util_shared;
#using scripts\killstreaks\killstreak_bundles;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\weapons\deployable;
#using scripts\weapons\weapon_utils;
#using scripts\weapons\weaponobjects;

#namespace concertina_wire;

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0xd20067d9, Offset: 0x2c8
// Size: 0x334
function init_shared(var_4b51853b) {
    level.var_87226c31 = spawnstruct();
    level.var_87226c31.bundle = getscriptbundle(var_4b51853b);
    level.var_87226c31.concertinawireweapon = getweapon(#"eq_concertina_wire");
    level.var_87226c31.var_546a220c = "concertina_wire_objective_default";
    level.var_87226c31.var_925bbb2 = [];
    level.var_87226c31.var_d6a27a84 = [];
    level.var_94029383 = &function_4ee7d46a;
    setdvar(#"hash_430cc236fe8b2561", 8);
    ability_player::register_gadget_should_notify(37, 1);
    weaponobjects::function_e6400478(#"eq_concertina_wire", &function_57955e51, 1);
    callback::on_spawned(&on_player_spawned);
    callback::on_player_killed_with_params(&onplayerkilled);
    callback::on_start_gametype(&startgametype);
    deployable::register_deployable(level.var_87226c31.concertinawireweapon, &function_e5fdca70, &function_6fe5a945, undefined, undefined, 1);
    level.var_87226c31.var_357db326 = 10000;
    clientfield::register("scriptmover", "concertinaWire_placed", 1, 5, "float");
    clientfield::register("scriptmover", "concertinaWireDestroyed", 1, 1, "int");
    clientfield::register("scriptmover", "concertinaWireDroopyBits", 1, 3, "int");
    level.var_87226c31.var_ff1a491d = level.var_87226c31.bundle.var_76d79155 * level.var_87226c31.bundle.var_76d79155;
    level.var_87226c31.bucklerweapon = getweapon(#"sig_buckler_turret");
    setdvar(#"hash_753335900deb89ea", 25);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x1 linked
// Checksum 0x34c0587b, Offset: 0x608
// Size: 0x14
function startgametype() {
    thread function_b842eab8();
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 5, eflags: 0x1 linked
// Checksum 0xe6814a83, Offset: 0x628
// Size: 0xcc
function function_ef1137ae(attacker, victim, weapon, attackerweapon, meansofdeath) {
    if (!isdefined(victim) || !isdefined(victim.var_c6a21b50) || (isdefined(victim.var_cd7665dd) ? victim.var_cd7665dd : 0) + 500 < gettime()) {
        return false;
    }
    if (isdefined(attacker) && (!isdefined(victim.var_c6a21b50.owner) || attacker != victim.var_c6a21b50.owner)) {
        return false;
    }
    return true;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0x5a0aa6f5, Offset: 0x700
// Size: 0x3fc
function onplayerkilled(s_params) {
    if (!isdefined(s_params.weapon)) {
        return;
    }
    if (!function_ef1137ae(s_params.eattacker, self)) {
        return;
    }
    if (s_params.weapon != level.var_87226c31.concertinawireweapon) {
        killstreaks::processscoreevent(#"concertina_wire_snared_kill", s_params.eattacker, self, level.var_87226c31.concertinawireweapon);
    }
    if (s_params.weapon != level.var_87226c31.concertinawireweapon) {
        return;
    }
    weapon = s_params.weapon;
    var_4fd6205f = isdefined(self.var_c6a21b50.owner) ? self.var_c6a21b50.owner == s_params.eattacker : 0;
    if (!isdefined(s_params.eattacker) || !isplayer(s_params.eattacker)) {
        return;
    }
    var_8e797a67 = s_params.eattacker loadout::function_18a77b37("primarygrenade");
    var_a66b455e = s_params.eattacker loadout::function_18a77b37("specialgrenade");
    ultimateweapon = s_params.eattacker loadout::function_18a77b37("ultimate");
    var_bc9c6fcb = 0;
    if (isdefined(var_8e797a67) && var_8e797a67.statname == weapon.statname || isdefined(var_a66b455e) && var_a66b455e.statname == weapon.statname || isdefined(ultimateweapon) && ultimateweapon.statname == weapon.statname) {
        var_bc9c6fcb = 1;
    }
    if (var_bc9c6fcb) {
        killstreaks::processscoreevent(#"hash_152856ae19af395b", self.var_c6a21b50.owner, self, level.var_87226c31.concertinawireweapon);
    }
    if (isdefined(level.playgadgetsuccess) && var_4fd6205f) {
        relativepos = vectornormalize(self.origin - s_params.eattacker.origin);
        dir = anglestoforward(s_params.eattacker getplayerangles());
        dotproduct = vectordot(dir, relativepos);
        if (dotproduct > 0 && sighttracepassed(s_params.eattacker geteye(), self geteye(), 1, s_params.eattacker, self)) {
            s_params.eattacker [[ level.playgadgetsuccess ]](level.var_87226c31.concertinawireweapon, undefined, self, undefined);
        }
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0xa257d0b, Offset: 0xb08
// Size: 0x1a
function function_c5f0b9e7(func) {
    level.onconcertinawireplaced = func;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0xa5649c0d, Offset: 0xb30
// Size: 0x1a
function function_d700c081(func) {
    level.var_c560f03 = func;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x1 linked
// Checksum 0xeb6a951a, Offset: 0xb58
// Size: 0xa0
function function_42b34d5a() {
    if (!isdefined(self.concertinawire)) {
        return;
    }
    foreach (concertinawire in self.concertinawire.var_a3aac76c) {
        if (isdefined(concertinawire)) {
            concertinawire function_4ee7d46a(1);
        }
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x1 linked
// Checksum 0x6fb65cd2, Offset: 0xc00
// Size: 0x9c
function function_e4f3f17() {
    self endon(#"death");
    if ((isdefined(level.var_87226c31.bundle.timeout) ? level.var_87226c31.bundle.timeout : 0) == 0) {
        return;
    }
    wait level.var_87226c31.bundle.timeout;
    if (isdefined(self)) {
        self function_4ee7d46a(1);
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x1 linked
// Checksum 0x81d3fae1, Offset: 0xca8
// Size: 0xa4
function on_player_spawned() {
    if (!isdefined(self.concertinawire)) {
        self.concertinawire = spawnstruct();
        self.concertinawire.var_a3aac76c = [];
        self.concertinawire.activelist = [];
    }
    if (!self hasweapon(level.var_87226c31.concertinawireweapon) && self.concertinawire.var_a3aac76c.size > 0) {
        self function_42b34d5a();
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 3, eflags: 0x1 linked
// Checksum 0x9e7d10f1, Offset: 0xd58
// Size: 0x4c
function function_e5fdca70(origin, angles, player) {
    if (isdefined(level.var_d1ae43e3)) {
        return [[ level.var_d1ae43e3 ]](origin, angles, player);
    }
    return 1;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0xd37c03e1, Offset: 0xdb0
// Size: 0x428
function function_6fe5a945(player) {
    assert(isdefined(level.var_87226c31.bundle.var_63aab046));
    if (!isdefined(player) || !isdefined(player.concertinawire)) {
        return 0;
    }
    var_b43e8dc2 = player function_287dcf4b(level.var_87226c31.bundle.var_63aab046, level.var_87226c31.bundle.maxwidth, 0, 0, level.var_87226c31.concertinawireweapon);
    if (!var_b43e8dc2.isvalid) {
        player.concertinawire.lastvalid = undefined;
        player function_bf191832(0, (0, 0, 0), (0, 0, 0));
        return var_b43e8dc2;
    }
    player.concertinawire.lastvalid = var_b43e8dc2;
    var_2b68b641 = function_54267517(var_b43e8dc2.origin);
    var_1167a9ce = function_6541080b(var_b43e8dc2.origin, level.var_87226c31.var_ff1a491d);
    playerright = anglestoright(player.angles);
    origins = [];
    if (!isdefined(origins)) {
        origins = [];
    } else if (!isarray(origins)) {
        origins = array(origins);
    }
    origins[origins.size] = var_b43e8dc2.origin;
    var_e5da702e = var_b43e8dc2.origin + playerright * getdvarfloat(#"hash_753335900deb89ea", 1);
    if (!isdefined(origins)) {
        origins = [];
    } else if (!isarray(origins)) {
        origins = array(origins);
    }
    origins[origins.size] = var_e5da702e;
    var_62e3ee6f = var_b43e8dc2.origin - playerright * getdvarfloat(#"hash_753335900deb89ea", 1);
    if (!isdefined(origins)) {
        origins = [];
    } else if (!isarray(origins)) {
        origins = array(origins);
    }
    origins[origins.size] = var_62e3ee6f;
    if (smart_cover::function_e3a901c(origins, getdvarfloat(#"hash_753335900deb89ea", 1))) {
        var_b43e8dc2.isvalid = 0;
        return var_b43e8dc2;
    }
    candeploy = !var_1167a9ce && !var_2b68b641;
    if (!candeploy) {
        var_b43e8dc2.isvalid = 0;
        player function_bf191832(candeploy, (0, 0, 0), (0, 0, 0));
        return var_b43e8dc2;
    }
    player function_bf191832(candeploy, var_b43e8dc2.origin, var_b43e8dc2.angles);
    return var_b43e8dc2;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 2, eflags: 0x1 linked
// Checksum 0x9163869a, Offset: 0x11e0
// Size: 0xc6
function function_5ea6e77d(point, upangles) {
    var_2fa728ff = point + upangles * -10;
    var_71fcd06b = point + upangles * 10;
    mins = (-10, -10, -10);
    maxs = (10, 10, 10);
    var_e07c7e8 = physicstrace(var_71fcd06b, var_2fa728ff, mins, maxs, self, 1);
    return var_e07c7e8[#"fraction"] < 1;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 3, eflags: 0x5 linked
// Checksum 0x60edda46, Offset: 0x12b0
// Size: 0x2ea
function private function_2562ba62(var_637dcf3d, startlocation, var_a4e8554b) {
    var_b43e8dc2 = spawnstruct();
    var_b43e8dc2.var_e74f7cdd = 1;
    var_b43e8dc2.var_8e37de72 = 1;
    var_b43e8dc2.var_b78da7c7 = var_a4e8554b;
    dirright = anglestoright(var_637dcf3d.angles);
    var_16482870 = 0;
    lasttime = gettime();
    var_97dd8ca1 = 1 / level.var_87226c31.bundle.deploytime;
    var_28cd159a = 0;
    var_ea8ed4c6 = 0;
    while (var_16482870 <= var_a4e8554b) {
        var_637dcf3d clientfield::set("concertinaWire_placed", 1 - var_16482870);
        var_300fb0d2 = level.var_87226c31.bundle.maxwidth * var_16482870 * 0.5;
        rightpoint = startlocation + dirright * var_300fb0d2;
        upangles = anglestoup(var_637dcf3d.angles);
        if (!var_637dcf3d function_5ea6e77d(rightpoint, upangles)) {
            var_b43e8dc2.var_e74f7cdd = 0;
        }
        leftpoint = startlocation - dirright * var_300fb0d2;
        if (!var_637dcf3d function_5ea6e77d(leftpoint, upangles)) {
            var_b43e8dc2.var_8e37de72 = 0;
        }
        var_28cd159a = var_16482870;
        if (var_ea8ed4c6 || !var_b43e8dc2.var_8e37de72 || !var_b43e8dc2.var_e74f7cdd) {
            break;
        }
        waitframe(1);
        var_32c844bb = gettime() - lasttime;
        var_16482870 += var_32c844bb * var_97dd8ca1;
        if (var_16482870 >= var_a4e8554b) {
            var_ea8ed4c6 = 1;
            var_16482870 = min(var_16482870, var_a4e8554b);
        }
        var_637dcf3d.var_80cf41a4 = var_16482870;
        lasttime = gettime();
    }
    var_b43e8dc2.var_b78da7c7 = max(var_a4e8554b - var_28cd159a, 0);
    return var_b43e8dc2;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 7, eflags: 0x5 linked
// Checksum 0x43c13949, Offset: 0x15a8
// Size: 0x244
function private function_4e7c57c1(var_637dcf3d, startorigin, direction, var_16482870, var_a4e8554b, movedirection, var_3140daee) {
    var_b26653b3 = var_16482870 * level.var_87226c31.bundle.maxwidth;
    lasttime = gettime();
    var_97dd8ca1 = 1 / level.var_87226c31.bundle.deploytime;
    while (var_16482870 <= var_a4e8554b) {
        var_637dcf3d clientfield::set("concertinaWire_placed", 1 - var_16482870);
        if (var_16482870 == var_a4e8554b) {
            break;
        }
        var_300fb0d2 = level.var_87226c31.bundle.maxwidth * var_16482870;
        var_dbd651f9 = var_300fb0d2 - var_b26653b3;
        var_637dcf3d.origin = startorigin + vectorscale(direction, var_dbd651f9 * 0.5);
        var_f49249d7 = startorigin + direction * var_300fb0d2;
        upangles = anglestoup(var_637dcf3d.angles);
        if (!var_637dcf3d function_5ea6e77d(var_f49249d7, upangles)) {
            if (movedirection == 0) {
                var_3140daee.var_e74f7cdd = 0;
            } else {
                var_3140daee.var_8e37de72 = 1;
            }
            break;
        }
        waitframe(1);
        var_32c844bb = gettime() - lasttime;
        var_16482870 += var_32c844bb * var_97dd8ca1;
        var_16482870 = min(var_16482870, 1);
        var_637dcf3d.var_80cf41a4 = var_16482870;
        lasttime = gettime();
    }
    return var_3140daee;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 2, eflags: 0x1 linked
// Checksum 0x55ab70e2, Offset: 0x17f8
// Size: 0x6ec
function function_8d89605(var_637dcf3d, traceresults) {
    var_637dcf3d endon(#"death");
    var_637dcf3d useanimtree("generic");
    var_637dcf3d setanim(level.var_87226c31.bundle.deployanim, 1, 0, 0);
    var_637dcf3d clientfield::set("concertinaWire_placed", 1);
    waitframe(1);
    var_a4e8554b = traceresults.width / level.var_87226c31.bundle.maxwidth;
    var_97dd8ca1 = 1 / level.var_87226c31.bundle.deploytime;
    var_2ba378bd = var_a4e8554b * level.var_87226c31.bundle.deploytime;
    lasttime = gettime();
    moveamount = 0;
    var_16482870 = 0;
    var_b80b6889 = distance2d(traceresults.origin, traceresults.var_c0e006dc);
    var_65ea35de = distance2d(traceresults.origin, traceresults.var_44cf251d);
    dirright = vectornormalize(traceresults.var_c0e006dc - traceresults.origin);
    dirleft = vectornormalize(traceresults.var_44cf251d - traceresults.origin);
    if (var_b80b6889 < var_65ea35de) {
        var_a66e2af8 = var_b80b6889;
        movementdirection = vectornormalize(traceresults.var_44cf251d - traceresults.origin);
        movedirection = 1;
    } else {
        var_a66e2af8 = var_65ea35de;
        movementdirection = vectornormalize(traceresults.var_c0e006dc - traceresults.origin);
        movedirection = 0;
    }
    var_de26b48c = min(var_a66e2af8 * 2 / level.var_87226c31.bundle.maxwidth, 1);
    var_3140daee = function_2562ba62(var_637dcf3d, traceresults.origin, var_de26b48c);
    var_300fb0d2 = (var_de26b48c - var_3140daee.var_b78da7c7) * level.var_87226c31.bundle.maxwidth;
    var_16482870 = var_de26b48c - var_3140daee.var_b78da7c7;
    var_891f9499 = 0;
    distanceremaining = traceresults.width - var_300fb0d2;
    if (!var_3140daee.var_e74f7cdd && !var_3140daee.var_8e37de72) {
        var_891f9499 = 0;
    } else if (!var_3140daee.var_e74f7cdd || !var_3140daee.var_8e37de72) {
        var_891f9499 = 1;
        if (!var_3140daee.var_e74f7cdd) {
            movementdirection = dirleft;
            distanceremaining = min(var_65ea35de - var_300fb0d2, distanceremaining);
            movedirection = 1;
        } else {
            movementdirection = dirright;
            distanceremaining = min(var_b80b6889 - var_300fb0d2, distanceremaining);
            movedirection = 0;
        }
        var_a4e8554b = (distanceremaining + var_300fb0d2) / level.var_87226c31.bundle.maxwidth;
    }
    if (var_a4e8554b - var_16482870 > 0.05) {
        var_3140daee = function_4e7c57c1(var_637dcf3d, traceresults.origin, movementdirection, var_16482870, var_a4e8554b, movedirection, var_3140daee);
    }
    if (!var_3140daee.var_e74f7cdd && !var_3140daee.var_8e37de72) {
        var_637dcf3d clientfield::set("concertinaWireDroopyBits", 3);
    } else if (!var_3140daee.var_e74f7cdd) {
        var_637dcf3d clientfield::set("concertinaWireDroopyBits", 1);
    } else if (!var_3140daee.var_8e37de72) {
        var_637dcf3d clientfield::set("concertinaWireDroopyBits", 2);
    }
    if (isdefined(var_637dcf3d.var_80cf41a4)) {
        var_3dd315d6 = var_637dcf3d.var_80cf41a4;
        if (var_3dd315d6 < 0.85) {
            var_3dd315d6 *= 0.9;
        }
        var_637dcf3d setanimtime(level.var_87226c31.bundle.deployanim, var_3dd315d6);
    }
    var_637dcf3d.trigger = spawn("trigger_box_new", var_637dcf3d.origin + (0, 0, 30), getvehicletriggerflags() | getaitriggerflags(), 20, int(var_16482870 * traceresults.width * 0.8), 60);
    var_637dcf3d.trigger.angles = var_637dcf3d.angles;
    thread function_f067d867(var_637dcf3d);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 2, eflags: 0x1 linked
// Checksum 0xbf6cbede, Offset: 0x1ef0
// Size: 0x334
function function_fc4df41e(watcher, owner) {
    self endon(#"death");
    player = owner;
    self.canthack = 1;
    self hide();
    if (!isdefined(player.concertinawire.lastvalid) || !player.concertinawire.lastvalid.isvalid) {
        player deployable::function_416f03e6(level.var_87226c31.concertinawireweapon);
        return;
    }
    var_637dcf3d = player function_34d706ae(watcher, self, player.concertinawire.lastvalid.origin, player.concertinawire.lastvalid.angles, 1, player.concertinawire.lastvalid.width);
    array::add(player.concertinawire.activelist, var_637dcf3d);
    var_26c9fcc2 = function_57f553e9(player.concertinawire.activelist, level.var_87226c31.bundle.var_a0b69d8b);
    if (isdefined(var_26c9fcc2)) {
        var_26c9fcc2 function_4ee7d46a(1);
    }
    if (isdefined(level.onconcertinawireplaced)) {
        owner [[ level.onconcertinawireplaced ]](self);
    }
    self thread function_d82c03d4(player);
    var_637dcf3d clientfield::set("concertinaWire_placed", 1);
    assert(isdefined(level.var_87226c31), "<dev string:x38>");
    assert(isdefined(level.var_87226c31.bundle), "<dev string:x66>");
    var_637dcf3d influencers::create_entity_enemy_influencer("grenade", owner.team);
    var_637dcf3d util::make_sentient();
    if (isdefined(level.var_87226c31.bundle.deployanim)) {
        thread function_8d89605(var_637dcf3d, player.concertinawire.lastvalid);
    }
    var_637dcf3d function_e4f3f17();
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0x244cdd0a, Offset: 0x2230
// Size: 0x42
function function_57955e51(watcher) {
    watcher.watchforfire = 1;
    watcher.onspawn = &function_fc4df41e;
    watcher.deleteonplayerspawn = 0;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0xe8036151, Offset: 0x2280
// Size: 0x5c
function function_d82c03d4(player) {
    self endon(#"death");
    player waittill(#"joined_team", #"disconnect");
    player function_42b34d5a();
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x1 linked
// Checksum 0xbbf2d85, Offset: 0x22e8
// Size: 0xac
function function_dd007be2() {
    level endon(#"game_ended");
    self.owner endon(#"disconnect", #"joined_team", #"changed_specialist");
    self endon(#"hash_c72d58e3d4735b");
    waitresult = self waittill(#"death");
    if (!isdefined(self)) {
        return;
    }
    self thread onkilled(waitresult);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x1 linked
// Checksum 0x458bf852, Offset: 0x23a0
// Size: 0x130
function ondamage() {
    self endon(#"death");
    level endon(#"game_ended");
    while (true) {
        waitresult = self waittill(#"damage");
        if (isdefined(waitresult.attacker) && isplayer(waitresult.attacker) && getdvarint(#"survival_prototype", 0) == 0) {
            if (waitresult.amount > 0 && damagefeedback::dodamagefeedback(waitresult.weapon, waitresult.attacker)) {
                waitresult.attacker damagefeedback::update(waitresult.mod, waitresult.inflictor, undefined, waitresult.weapon, self);
            }
        }
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x0
// Checksum 0x7c88ef2b, Offset: 0x24d8
// Size: 0x1c
function function_cbc97710() {
    wait 10;
    self delete();
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x0
// Checksum 0xb97eb54d, Offset: 0x2500
// Size: 0x24
function function_a1253947() {
    self clientfield::set("concertinaWireDestroyed", 1);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0xc9c23367, Offset: 0x2530
// Size: 0x54c
function function_4ee7d46a(isselfdestruct) {
    concertinawire = self;
    concertinawire notify(#"hash_c72d58e3d4735b");
    concertinawire clientfield::set("enemyequip", 0);
    concertinawire clientfield::set("friendlyequip", 0);
    if (isdefined(concertinawire.objectiveid)) {
        objective_delete(concertinawire.objectiveid);
        gameobjects::release_obj_id(concertinawire.objectiveid);
    }
    if (isdefined(level.var_87226c31.bundle.var_35fbc280)) {
        if (isdefined(isselfdestruct) && isselfdestruct) {
            var_415135a0 = level.var_87226c31.bundle.var_28811698;
            var_72db9941 = level.var_87226c31.bundle.var_5493f8b0;
        } else {
            var_415135a0 = level.var_87226c31.bundle.var_35fbc280;
            var_72db9941 = level.var_87226c31.bundle.var_b3756378;
        }
        playfx(var_415135a0, concertinawire.origin, anglestoforward(concertinawire.angles), anglestoup(concertinawire.angles));
        if (isdefined(var_72db9941)) {
            concertinawire playsound(var_72db9941);
        }
    }
    if (isdefined(level.var_87226c31.bundle.var_bb6c29b4) && isdefined(self.var_d02ddb8e) && self.var_d02ddb8e == getweapon(#"shock_rifle")) {
        playfx(level.var_87226c31.bundle.var_bb6c29b4, concertinawire.origin);
    }
    removeindex = -1;
    for (index = 0; index < level.var_87226c31.var_925bbb2.size; index++) {
        if (level.var_87226c31.var_925bbb2[index] == concertinawire) {
            array::remove_index(level.var_87226c31.var_925bbb2, index, 0);
            break;
        }
    }
    if (isdefined(concertinawire.owner)) {
        for (index = 0; index < concertinawire.owner.concertinawire.activelist.size; index++) {
            if (concertinawire.owner.concertinawire.activelist[index] == concertinawire) {
                arrayremovevalue(concertinawire.owner.concertinawire.activelist, concertinawire);
                concertinawire.owner.concertinawire.activelist = array::remove_undefined(concertinawire.owner.concertinawire.activelist, 0);
                break;
            }
        }
    }
    if (isdefined(concertinawire.var_2ee191cc)) {
        foreach (zoneid in concertinawire.var_2ee191cc) {
            deployable::function_b20df196(zoneid);
        }
    }
    deployable::function_81598103(concertinawire);
    if (isdefined(concertinawire.var_3b0688ef)) {
        badplace_delete(concertinawire.var_3b0688ef);
    }
    if (isdefined(concertinawire.killcament)) {
        concertinawire.killcament thread util::deleteaftertime(5);
    }
    if (isdefined(concertinawire.grenade)) {
        concertinawire.grenade thread util::deleteaftertime(1);
    }
    if (isdefined(concertinawire.trigger)) {
        concertinawire.trigger delete();
    }
    concertinawire delete();
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0xfd6ecd91, Offset: 0x2a88
// Size: 0x12c
function onkilled(var_c946c04c) {
    concertinawire = self;
    if (var_c946c04c.attacker != concertinawire.owner) {
        concertinawire.owner globallogic_score::function_5829abe3(var_c946c04c.attacker, var_c946c04c.weapon, concertinawire.weapon);
        if (isdefined(level.var_d2600afc)) {
            concertinawire [[ level.var_d2600afc ]](var_c946c04c.attacker, concertinawire.owner, concertinawire.weapon, var_c946c04c.weapon);
        }
    }
    concertinawire.var_d02ddb8e = var_c946c04c.weapon;
    if (isdefined(level.var_c560f03)) {
        concertinawire [[ level.var_c560f03 ]](var_c946c04c.attacker, concertinawire.var_d02ddb8e);
    }
    concertinawire thread function_4ee7d46a(0);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x0
// Checksum 0xb34fc8b6, Offset: 0x2bc0
// Size: 0x5e
function getmodel(var_796be15d) {
    return self.team == #"allies" ? level.var_87226c31.bundle.var_397ed90c : level.var_87226c31.bundle.var_b256e3da;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 2, eflags: 0x1 linked
// Checksum 0x7dab8834, Offset: 0x2c28
// Size: 0x534
function function_dac69ad1(player, concertinawire) {
    speed = length(player getvelocity());
    var_1c365dd = !(isdefined(level.var_cbec7a45) && level.var_cbec7a45) && level.var_87226c31.bundle.var_baf7c45 && player status_effect::function_3c54ae98(2) >= level.var_87226c31.bundle.var_baf7c45;
    if (speed <= (isdefined(level.var_87226c31.bundle.speedthreshold) ? level.var_87226c31.bundle.speedthreshold : 0)) {
        if (isdefined(player.var_fc55d553) ? player.var_fc55d553 : 0) {
            return;
        }
        if (var_1c365dd) {
            damageamount = isdefined(level.var_87226c31.bundle.var_81601340) ? level.var_87226c31.bundle.var_81601340 : 0;
        } else {
            damageamount = isdefined(level.var_87226c31.bundle.var_acadc685) ? level.var_87226c31.bundle.var_acadc685 : 0;
        }
        if (player getstance() == "prone") {
            if (var_1c365dd) {
                damageamount *= isdefined(level.var_87226c31.bundle.var_39717932) ? level.var_87226c31.bundle.var_39717932 : 0;
            } else {
                damageamount *= isdefined(level.var_87226c31.bundle.var_9095a88f) ? level.var_87226c31.bundle.var_9095a88f : 0;
            }
        }
        player dodamage(damageamount, player.origin, concertinawire.owner, concertinawire, undefined, "MOD_IMPACT", 0, level.var_87226c31.concertinawireweapon);
        player.var_fc55d553 = 1;
    } else {
        if (isdefined(player.var_fee1c0df) && player.var_fee1c0df > gettime()) {
            return;
        }
        params = getstatuseffect(level.var_87226c31.bundle.var_1a6488fe);
        assert(isdefined(params), "<dev string:x9b>");
        duration = params.var_77449e9;
        player.var_fee1c0df = gettime() + duration;
        if (var_1c365dd) {
            damageamount = isdefined(level.var_87226c31.bundle.var_24458de7) ? level.var_87226c31.bundle.var_24458de7 : 0;
        } else {
            damageamount = isdefined(level.var_87226c31.bundle.var_a9502662) ? level.var_87226c31.bundle.var_a9502662 : 0;
        }
        if (level.hardcoremode) {
            damageamount *= isdefined(level.var_87226c31.bundle.var_78c1e37b) ? level.var_87226c31.bundle.var_78c1e37b : 0.25;
        }
        player dodamage(damageamount, player.origin, concertinawire.owner, concertinawire, undefined, "MOD_IMPACT", 0, level.var_87226c31.concertinawireweapon);
        player status_effect::status_effect_apply(params, level.var_87226c31.concertinawireweapon, concertinawire.owner, 0, undefined, undefined, player.origin);
    }
    concertinawire function_a9160578(damageamount, player);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x1 linked
// Checksum 0x39c36c8, Offset: 0x3168
// Size: 0x172
function function_b842eab8() {
    level endon(#"game_ended");
    params = getstatuseffect(level.var_87226c31.bundle.var_f6fdbda7);
    while (true) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (!isdefined(player.var_cd7665dd) || !(isdefined(player.var_85c3882d) ? player.var_85c3882d : 0)) {
                continue;
            }
            timesincelast = gettime() - player.var_cd7665dd;
            if (timesincelast > 250) {
                player.var_85c3882d = 0;
                player status_effect::function_408158ef(params.setype, params.var_18d16a6b);
            }
        }
        waitframe(1);
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x1 linked
// Checksum 0x65a79650, Offset: 0x32e8
// Size: 0x81e
function function_f067d867(concertinawire) {
    level endon(#"game_ended");
    concertinawire endon(#"death");
    while (true) {
        waitresult = concertinawire.trigger waittill(#"trigger");
        player = waitresult.activator;
        if (!isplayer(player)) {
            isenemy = isdefined(concertinawire.owner) && isdefined(player.owner) && (!level.teambased || util::function_fbce7263(player.team, concertinawire.owner.team)) && player.owner != concertinawire.owner;
            if (isdefined(player.killstreaktype) && (player.killstreaktype == "recon_car" || player.killstreaktype == "inventory_recon_car") && isenemy) {
                player dodamage(1, player.origin, concertinawire.owner, concertinawire, undefined, "MOD_IMPACT", 0, level.var_87226c31.concertinawireweapon);
            }
            if (isdefined(player.archetype) && player.archetype == #"robot" && util::function_fbce7263(player.team, concertinawire.owner.team)) {
                player.var_85c3882d = 1;
                continue;
            }
            if (isdefined(player.archetype) && player.archetype == #"wasp" && util::function_fbce7263(player.team, concertinawire.owner.team)) {
                continue;
            }
            if (isdefined(concertinawire.owner) && util::function_fbce7263(player.team, concertinawire.owner.team)) {
                if (!(isdefined(player.var_65e57a10) && player.var_65e57a10)) {
                    if (getdvarint(#"survival_prototype", 0)) {
                        damageamount = 10;
                    } else {
                        damageamount = isdefined(level.var_87226c31.bundle.var_acadc685) ? level.var_87226c31.bundle.var_acadc685 : 0;
                    }
                    concertinawire dodamage(damageamount, player.origin, concertinawire.owner, concertinawire, undefined, "MOD_IMPACT", 0, level.var_87226c31.concertinawireweapon);
                }
                player callback::callback(#"hash_3bb51ce51020d0eb", {#wire:concertinawire});
            }
            continue;
        }
        player.var_cd7665dd = gettime();
        player.var_c6a21b50 = concertinawire;
        player.var_85c3882d = 1;
        var_50487836 = isdefined(concertinawire.owner) && (!level.teambased || util::function_fbce7263(player.team, concertinawire.owner.team)) && player != concertinawire.owner;
        var_da47eedd = 0;
        if (level.var_87226c31.bucklerweapon === player.currentweapon) {
            var_da47eedd = 1;
        }
        var_434fa90d = var_da47eedd || player isslamming() || player isjuking();
        if (var_50487836 && !var_434fa90d) {
            concertinawire function_2dd4aa9d(player);
        }
        var_e8c58890 = 0;
        if (isdefined(player.prevposition)) {
            distancemoved = distance2d(player.prevposition, player.origin);
            if (distancemoved < 0.0001) {
            } else if (!isdefined(player.var_45650309) || gettime() > player.var_45650309 + 350 && distancemoved > 0.5) {
                var_e8c58890 = 1;
            }
        } else {
            var_e8c58890 = 1;
        }
        if (var_e8c58890) {
            player playsound(#"hash_4b5965717e4efc71");
            player.var_45650309 = gettime();
            if ((isdefined(var_50487836) ? var_50487836 : 0) && !var_434fa90d) {
                player gestures::function_56e00fbf(#"hash_3e06c757e4b20f4f", undefined, 0);
            }
        }
        player.prevposition = player.origin;
        if (var_50487836 && !var_434fa90d) {
            function_dac69ad1(player, concertinawire);
        }
        if (var_da47eedd && isdefined(level.var_87226c31.bundle.var_2aa7241e)) {
            if (!isdefined(concertinawire.var_2dd485d4[player.clientid]) || concertinawire.var_2dd485d4[player.clientid] + 500 < gettime()) {
                if (!isdefined(concertinawire.var_2dd485d4[player.clientid])) {
                    concertinawire.var_2dd485d4[player.clientid] = gettime();
                }
                var_33ecfd86 = level.var_87226c31.bundle.var_2aa7241e * 0.5;
                concertinawire dodamage(var_33ecfd86, player.origin, player, undefined, undefined, "MOD_IMPACT", 0, player.currentweapon);
                concertinawire.var_2dd485d4[player.clientid] = gettime();
            }
        }
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 2, eflags: 0x5 linked
// Checksum 0xa5d89fb3, Offset: 0x3b10
// Size: 0x82
function private function_41225d9b(player, var_16505949) {
    player endon(#"death");
    player allowjump(0);
    player.var_10fb4c3d = 0;
    wait var_16505949;
    player allowjump(1);
    player.var_10fb4c3d = 1;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x5 linked
// Checksum 0x60459cd9, Offset: 0x3ba0
// Size: 0x4a2
function private function_2dd4aa9d(player) {
    concertinawire = self;
    var_1c365dd = !(isdefined(level.var_cbec7a45) && level.var_cbec7a45) && level.var_87226c31.bundle.var_baf7c45 && player status_effect::function_3c54ae98(2) >= level.var_87226c31.bundle.var_baf7c45;
    if (player jumpbuttonpressed() && (isdefined(player.var_10fb4c3d) ? player.var_10fb4c3d : 1)) {
        if (!isdefined(player.var_357edf99) || !player.var_357edf99) {
            if (var_1c365dd) {
                damageamount = isdefined(level.var_87226c31.bundle.var_24458de7) ? level.var_87226c31.bundle.var_24458de7 : 0;
                var_30df0193 = isdefined(level.var_87226c31.bundle.var_2ec8f744) ? level.var_87226c31.bundle.var_2ec8f744 : 0;
            } else {
                damageamount = isdefined(level.var_87226c31.bundle.var_a9502662) ? level.var_87226c31.bundle.var_a9502662 : 0;
                var_30df0193 = isdefined(level.var_87226c31.bundle.var_41225d9b) ? level.var_87226c31.bundle.var_41225d9b : 0;
            }
            player dodamage(damageamount, player.origin, concertinawire.owner, concertinawire, undefined, "MOD_IMPACT", 0, level.var_87226c31.concertinawireweapon);
            player.var_357edf99 = 1;
            thread function_41225d9b(player, var_30df0193);
            concertinawire function_a9160578(damageamount, player);
        }
    } else {
        player.var_357edf99 = 0;
    }
    if (player isdoublejumping()) {
        player setdoublejumpenergy(0);
    }
    if (!isdefined(player.var_673f6995) || player.var_673f6995 < gettime()) {
        params = getstatuseffect(level.var_87226c31.bundle.var_f6fdbda7);
        assert(isdefined(params), "<dev string:x9b>");
        duration = params.var_77449e9;
        player.var_673f6995 = gettime() + duration;
        player.var_fc55d553 = 0;
    }
    if (!isdefined(player.var_13d8a85d) || player.var_13d8a85d < gettime()) {
        params = getstatuseffect(level.var_87226c31.bundle.var_f6fdbda7);
        assert(isdefined(params), "<dev string:x9b>");
        player status_effect::status_effect_apply(params, level.var_87226c31.concertinawireweapon, concertinawire.owner, 1, undefined, undefined, player.origin);
        endtime = player status_effect::function_2ba2756c(params.var_18d16a6b);
        player.var_13d8a85d = endtime - 75;
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 2, eflags: 0x1 linked
// Checksum 0xb01bcbfa, Offset: 0x4050
// Size: 0x166
function function_a9160578(damagedealt, player) {
    if (!isdefined(player) || !isdefined(damagedealt) || !isdefined(self)) {
        return;
    }
    damagedealt = int(damagedealt);
    self.damagedealt = (isdefined(self.damagedealt) ? self.damagedealt : 0) + damagedealt;
    if (!isdefined(self.playersdamaged)) {
        self.playersdamaged = [];
    }
    entnumb = player getentitynumber();
    self.playersdamaged[entnumb] = 1;
    if (isdefined(level.var_87226c31.bundle.var_89ee8a9) && self.damagedealt >= level.var_87226c31.bundle.var_89ee8a9) {
        scoreevents::processscoreevent(#"hash_6024b59ca1d3b641", self.owner, undefined, self.weapon, self.playersdamaged.size);
        self.damagedealt -= level.var_87226c31.bundle.var_89ee8a9;
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 12, eflags: 0x1 linked
// Checksum 0x8b191bcb, Offset: 0x41c0
// Size: 0x3c2
function function_82c4beb0(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex) {
    if (isdefined(self.owner)) {
        myteam = self.owner.team;
    }
    if (!isdefined(myteam)) {
        return 0;
    }
    if (isdefined(eattacker)) {
        otherteam = eattacker.team;
    }
    var_1133e6dc = util::function_fbce7263(myteam, otherteam);
    if (weapon_utils::ismeleemod(smeansofdeath) && isdefined(level.var_87226c31.bundle.var_7f93f9c) && isdefined(var_1133e6dc) && var_1133e6dc) {
        var_1c365dd = !(isdefined(level.var_cbec7a45) && level.var_cbec7a45) && level.var_87226c31.bundle.var_baf7c45 && eattacker status_effect::function_3c54ae98(2) >= level.var_87226c31.bundle.var_baf7c45;
        if (var_1c365dd) {
            damageamount = isdefined(level.var_87226c31.bundle.var_d5eccf80) ? level.var_87226c31.bundle.var_d5eccf80 : 0;
        } else {
            damageamount = isdefined(level.var_87226c31.bundle.var_7f93f9c) ? level.var_87226c31.bundle.var_7f93f9c : 0;
        }
        if (weapon == getweapon("sig_blade")) {
            damageamount = 0;
        }
        if (damageamount > 0) {
            eattacker dodamage(damageamount, self.origin, self.owner, self, undefined, "MOD_IMPACT", 0, level.var_87226c31.concertinawireweapon);
            self function_a9160578(damageamount, eattacker);
        }
    }
    if (weapon_utils::isexplosivedamage(smeansofdeath)) {
        idamage = int(idamage * (isdefined(level.var_87226c31.bundle.var_7a4fd57b) ? level.var_87226c31.bundle.var_7a4fd57b : 0));
    }
    shotstokill = killstreak_bundles::get_shots_to_kill(weapon, smeansofdeath, level.var_87226c31.bundle);
    if (shotstokill == 0) {
    } else if (shotstokill > 0) {
        idamage = self.startinghealth / shotstokill + 1;
    } else {
        idamage = 0;
    }
    return int(idamage);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x1 linked
// Checksum 0x567ab760, Offset: 0x4590
// Size: 0x4c
function function_639cb9da() {
    self endon(#"death");
    level waittill(#"game_ended");
    if (!isdefined(self)) {
        return;
    }
    self function_4ee7d46a(1);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 6, eflags: 0x1 linked
// Checksum 0xa05ef193, Offset: 0x45e8
// Size: 0x6e6
function function_34d706ae(watcher, var_db52b808, origin, angles, var_796be15d, width) {
    player = self;
    var_bf8e4260 = spawn("script_model", origin);
    var_bf8e4260.targetname = "concertina_wire";
    var_db52b808.concertinawire = var_bf8e4260;
    var_bf8e4260.grenade = var_db52b808;
    var_bf8e4260 setmodel(level.var_87226c31.concertinawireweapon.var_22082a57);
    watcher.objectarray[watcher.objectarray.size] = var_bf8e4260;
    var_bf8e4260.var_2ee191cc = [];
    var_bf8e4260.var_2dd485d4 = [];
    rightangles = anglestoright(angles);
    var_8a455f75 = origin - width * 0.5 * rightangles;
    var_2d71f8ca = int(width / 32);
    for (index = 0; index < var_2d71f8ca; index++) {
        zoneid = deployable::function_d60e5a06(var_8a455f75, 32);
        array::add(var_bf8e4260.var_2ee191cc, zoneid);
        var_8a455f75 += rightangles * 64;
    }
    var_bf8e4260.var_86a21346 = &function_82c4beb0;
    var_bf8e4260.angles = angles;
    var_bf8e4260.owner = player;
    var_bf8e4260.takedamage = 1;
    var_bf8e4260.startinghealth = isdefined(level.var_87226c31.bundle.var_d9317c6b) ? level.var_87226c31.bundle.var_d9317c6b : 0;
    var_bf8e4260.health = var_bf8e4260.startinghealth;
    var_bf8e4260.var_3b0688ef = "concertina_wire_badplace" + var_bf8e4260 getentitynumber();
    badplace_box(var_bf8e4260.var_3b0688ef, 0, var_bf8e4260.origin, width / 2, "all");
    var_bf8e4260 setteam(player getteam());
    var_bf8e4260 setweapon(level.var_87226c31.concertinawireweapon);
    var_bf8e4260.weapon = level.var_87226c31.concertinawireweapon;
    array::add(player.concertinawire.var_a3aac76c, var_bf8e4260);
    if (isdefined(level.var_87226c31.var_546a220c)) {
        var_bf8e4260.objectiveid = gameobjects::get_next_obj_id();
        objective_add(var_bf8e4260.objectiveid, "active", var_bf8e4260, level.var_87226c31.var_546a220c);
        function_da7940a3(var_bf8e4260.objectiveid, 1);
        objective_setteam(var_bf8e4260.objectiveid, player.team);
    }
    var_35c2e583 = player gadgetgetslot(level.var_87226c31.concertinawireweapon);
    if (!sessionmodeiswarzonegame()) {
        self gadgetpowerset(var_35c2e583, 0);
    }
    var_bf8e4260 setteam(player.team);
    array::add(level.var_87226c31.var_925bbb2, var_bf8e4260);
    var_bf8e4260 clientfield::set("friendlyequip", 1);
    var_bf8e4260 clientfield::set("enemyequip", 1);
    var_bf8e4260 thread ondamage();
    var_bf8e4260 thread function_dd007be2();
    var_bf8e4260 thread function_639cb9da();
    var_bf8e4260.victimsoundmod = "vehicle";
    killcament = spawn("script_model", var_bf8e4260.origin + (isdefined(level.var_87226c31.bundle.var_eb9150a5) ? level.var_87226c31.bundle.var_eb9150a5 : 0, isdefined(level.var_87226c31.bundle.var_26a346c8) ? level.var_87226c31.bundle.var_26a346c8 : 0, isdefined(level.var_87226c31.bundle.var_d0fb9b7a) ? level.var_87226c31.bundle.var_d0fb9b7a : 0));
    killcament.targetname = "concertina_wire_killcament";
    var_bf8e4260.killcament = killcament;
    player deployable::function_6ec9ee30(var_bf8e4260, level.var_87226c31.concertinawireweapon);
    watcher.objectarray[watcher.objectarray.size] = killcament;
    return var_bf8e4260;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 1, eflags: 0x0
// Checksum 0xd3cf9439, Offset: 0x4cd8
// Size: 0xa0
function function_18dd6b22(concertinawire) {
    level endon(#"game_ended");
    concertinawire endon(#"death");
    while (true) {
        waitresult = concertinawire waittill(#"broken");
        if (waitresult.type == "base_piece_broken") {
            concertinawire function_4ee7d46a(0);
        }
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 2, eflags: 0x1 linked
// Checksum 0x1e6a50d4, Offset: 0x4d80
// Size: 0xb6
function function_6541080b(origin, maxdistancesq) {
    foreach (concertinawire in level.var_87226c31.var_925bbb2) {
        if (!isdefined(concertinawire)) {
            continue;
        }
        if (distancesquared(concertinawire.origin, origin) < maxdistancesq) {
            return true;
        }
    }
    return false;
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x0
// Checksum 0xfa4ef1eb, Offset: 0x4e40
// Size: 0x88
function watchweaponchange() {
    player = self;
    self notify(#"watchweaponchange_singleton");
    self endon(#"watchweaponchange_singleton");
    while (true) {
        if (self weaponswitchbuttonpressed()) {
            if (isdefined(player.concertinawire)) {
                player.concertinawire.var_5af6633b = 1;
            }
        }
        waitframe(1);
    }
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 2, eflags: 0x1 linked
// Checksum 0x12439e79, Offset: 0x4ed0
// Size: 0x6a
function function_57f553e9(&var_85947e0d, maxallowed) {
    if (var_85947e0d.size <= maxallowed) {
        return undefined;
    }
    outstayed_spawner = array::pop_front(var_85947e0d, 0);
    var_85947e0d = array::remove_undefined(var_85947e0d, 0);
    return outstayed_spawner;
}

