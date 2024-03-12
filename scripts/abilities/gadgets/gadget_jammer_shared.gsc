// Atian COD Tools GSC decompiler test
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace jammer;

// Namespace jammer/gadget_jammer_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5911330, Offset: 0x1f8
// Size: 0x10c
function init_shared() {
    if (!isdefined(level.var_578f7c6d)) {
        level.var_578f7c6d = spawnstruct();
    }
    if (!isdefined(level.var_578f7c6d.var_1728e736)) {
        level.var_578f7c6d.var_1728e736 = [];
    }
    level.var_578f7c6d.weapon = getweapon(#"eq_emp_grenade");
    level.var_578f7c6d.customsettings = getscriptbundle(level.var_578f7c6d.weapon.customsettings);
    weaponobjects::function_e6400478(#"eq_emp_grenade", &function_1a50ce7b, 1);
    registerclientfields();
    setupcallbacks();
}

// Namespace jammer/gadget_jammer_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xbab9f447, Offset: 0x310
// Size: 0x10c
function setupcallbacks() {
    level.var_a5dacbea = &function_4e7e56a8;
    level.var_5d492b75 = &function_1c430dad;
    level.var_7b151daa = &function_7b151daa;
    level.var_86e3d17a = &function_86e3d17a;
    level.var_fc1bbaef = &function_fc1bbaef;
    level.var_1794f85f = &function_2572e9cc;
    level.var_48c30195 = &function_48c30195;
    callback::on_spawned(&onplayerspawned);
    callback::on_player_killed_with_params(&on_player_killed);
    callback::on_finalize_initialization(&function_1c601b99);
}

// Namespace jammer/gadget_jammer_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x7177d857, Offset: 0x428
// Size: 0x124
function private registerclientfields() {
    clientfield::register("scriptmover", "isJammed", 9000, 1, "int");
    clientfield::register("missile", "isJammed", 9000, 1, "int");
    clientfield::register("vehicle", "isJammed", 9000, 1, "int");
    clientfield::register("toplayer", "isJammed", 9000, 1, "int");
    clientfield::register("missile", "jammer_active", 9000, 1, "int");
    clientfield::register("toplayer", "jammedvehpostfx", 9000, 1, "int");
}

// Namespace jammer/gadget_jammer_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x25380959, Offset: 0x558
// Size: 0xa6
function private function_1a50ce7b(watcher) {
    watcher.ownergetsassist = 1;
    watcher.ignoredirection = 1;
    watcher.deleteonplayerspawn = 0;
    watcher.enemydestroy = 1;
    watcher.onspawn = &function_7d81a4ff;
    watcher.ondestroyed = &function_b2e496fa;
    watcher.ontimeout = &function_b2e496fa;
    watcher.ondetonatecallback = &function_51a743f8;
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa44d64d, Offset: 0x608
// Size: 0x2a
function function_48c30195(entity, shouldignore) {
    if (isdefined(entity)) {
        entity.ignoreemp = shouldignore;
    }
}

// Namespace jammer/gadget_jammer_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x865c8e41, Offset: 0x640
// Size: 0x1e
function function_86e3d17a() {
    return level.var_578f7c6d.customsettings.var_3bd9b483;
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x0
// Checksum 0x4064060d, Offset: 0x668
// Size: 0x22
function register(entity, var_448f97f2) {
    entity.var_123aec6c = var_448f97f2;
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xdeae09b2, Offset: 0x698
// Size: 0x36
function function_4e7e56a8(weapon, callbackfunction) {
    level.var_578f7c6d.var_1728e736[weapon.name] = callbackfunction;
}

// Namespace jammer/gadget_jammer_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5b881550, Offset: 0x6d8
// Size: 0x40
function function_1c601b99() {
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](level.var_578f7c6d.weapon, &function_bff5c062);
    }
}

// Namespace jammer/gadget_jammer_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x250e657a, Offset: 0x720
// Size: 0x24
function function_fc1bbaef(entity) {
    thread function_d88f3e48(entity);
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x6b607538, Offset: 0x750
// Size: 0x6c
function function_bff5c062(jammer, attackingplayer) {
    jammer.team = attackingplayer.team;
    jammer setteam(attackingplayer.team);
    jammer.owner = attackingplayer;
    jammer thread function_6a973411();
}

// Namespace jammer/gadget_jammer_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x98ae8ce7, Offset: 0x7c8
// Size: 0x16c
function on_player_killed(params) {
    if (!isdefined(params.eattacker)) {
        return;
    }
    if (!(isdefined(self.isjammed) ? self.isjammed : 0)) {
        return;
    }
    if (!isdefined(self.var_fe1ebada)) {
        return;
    }
    if (self.var_fe1ebada == params.eattacker) {
        scoreevents::processscoreevent(#"disruptor_kill", self.var_fe1ebada, undefined, level.var_578f7c6d.weapon);
        params.eattacker function_be7a08a8(level.var_578f7c6d.weapon, 1);
        return;
    }
    if (isdefined(self.var_fe1ebada.team) && isdefined(params.eattacker.team) && self.var_fe1ebada.team == params.eattacker.team) {
        scoreevents::processscoreevent(#"disruptor_assist", self.var_fe1ebada, undefined, level.var_578f7c6d.weapon);
    }
}

// Namespace jammer/gadget_jammer_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xefbebad7, Offset: 0x940
// Size: 0xe
function onplayerspawned() {
    self.isjammed = 0;
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x2cef1e7b, Offset: 0x958
// Size: 0x184
function private function_7d81a4ff(watcher, player) {
    if (!isdefined(self.var_88d76fba)) {
        self.var_88d76fba = [];
    }
    self.owner = player;
    self.weapon = level.var_578f7c6d.weapon;
    self setweapon(level.var_578f7c6d.weapon);
    self setteam(player getteam());
    self.team = player getteam();
    self clientfield::set("enemyequip", 1);
    thread function_3a3a2ea9(self);
    waitresult = self function_5f86757d();
    if (!isdefined(player) || !isdefined(waitresult)) {
        return;
    }
    if (waitresult._notify == #"explode" && isdefined(waitresult.position)) {
        self thread function_87c540c0(self, waitresult.position, player);
    }
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x83c063a0, Offset: 0xae8
// Size: 0x44
function private function_2572e9cc(attackingplayer, var_fb5e3b16) {
    scoreevents::processscoreevent(var_fb5e3b16, attackingplayer, undefined, level.var_578f7c6d.weapon);
}

// Namespace jammer/gadget_jammer_shared
// Params 3, eflags: 0x5 linked
// Checksum 0xb637e4e0, Offset: 0xb38
// Size: 0x254
function private function_87c540c0(jammer, origin, attackingplayer) {
    entities = getentitiesinradius(origin, level.var_578f7c6d.weapon.explosionradius);
    var_545dd758 = 0;
    var_480b4b92 = 0;
    foreach (entity in entities) {
        if (!function_b16c8865(entity, attackingplayer)) {
            if (!var_480b4b92 && isplayer(entity) && entity function_6c32d092(#"talent_resistance") && util::function_fbce7263(entity.team, attackingplayer.team)) {
                attackingplayer damagefeedback::update(undefined, undefined, "resistance", level.var_578f7c6d.weapon);
                var_480b4b92 = 1;
            }
            continue;
        }
        if (isplayer(entity)) {
            thread function_b8c5ab9c(jammer, entity, attackingplayer);
            continue;
        }
        var_decc08e9 = thread function_e27c41b4(jammer, entity, attackingplayer);
        if (var_decc08e9 === 1) {
            var_545dd758++;
        }
    }
    if (var_545dd758 >= 2) {
        scoreevents::processscoreevent(#"hash_208b61a32a38340e", attackingplayer, undefined, level.var_578f7c6d.weapon);
    }
}

// Namespace jammer/gadget_jammer_shared
// Params 3, eflags: 0x5 linked
// Checksum 0xa6319e17, Offset: 0xd98
// Size: 0x2b0
function private function_e27c41b4(jammer, entity, attackingplayer) {
    entity endon(#"death");
    if (!isdefined(entity)) {
        return 0;
    }
    if (isalive(entity) && isvehicle(entity) && isdefined(level.is_staircase_up)) {
        function_1c430dad(entity, 1);
        function_58f8bf08(jammer, attackingplayer, undefined);
        entity thread [[ level.is_staircase_up ]](attackingplayer, jammer);
        return 1;
    }
    if (isalive(entity) && isactor(entity)) {
        function_1c430dad(entity, 1);
        function_58f8bf08(jammer, attackingplayer, undefined);
        entity callback::callback(#"hash_7140c3848cbefaa1", {#jammer:jammer, #attackingplayer:attackingplayer});
        return 1;
    }
    weapon = isdefined(entity.identifier_weapon) ? entity.identifier_weapon : entity.weapon;
    if (!isdefined(weapon)) {
        return 0;
    }
    if (isdefined(level.var_578f7c6d.var_1728e736[weapon.name])) {
        function_1c430dad(entity, 1);
        function_58f8bf08(jammer, attackingplayer, undefined);
        function_2e6238c0(weapon, entity.owner);
        thread [[ level.var_578f7c6d.var_1728e736[weapon.name] ]](entity, attackingplayer);
        return 1;
    }
    thread function_ca8a005e(jammer, entity, attackingplayer);
    return 1;
}

// Namespace jammer/gadget_jammer_shared
// Params 3, eflags: 0x5 linked
// Checksum 0x3ebafad2, Offset: 0x1050
// Size: 0x13c
function private function_b8c5ab9c(jammer, player, attackingplayer) {
    player notify(#"hash_4f2e183cc0ec68bd");
    player endon(#"death", #"hash_4f2e183cc0ec68bd");
    player clientfield::set_to_player("isJammed", 1);
    player.isjammed = 1;
    player.var_fe1ebada = attackingplayer;
    player setempjammed(1);
    scoreevents::processscoreevent(#"disrupted_enemy", attackingplayer, undefined, level.var_578f7c6d.weapon);
    function_58f8bf08(jammer, attackingplayer, player);
    wait(level.var_578f7c6d.customsettings.var_f29418f1);
    if (!isdefined(player)) {
        return;
    }
    function_d88f3e48(player);
}

// Namespace jammer/gadget_jammer_shared
// Params 3, eflags: 0x5 linked
// Checksum 0xdc884a8f, Offset: 0x1198
// Size: 0x184
function private function_ca8a005e(jammer, gadget, attackingplayer) {
    gadget endon(#"death");
    if (!isdefined(gadget.weapon)) {
        return;
    }
    if (!gadget.weapon.var_8032088a) {
        return;
    }
    function_1c430dad(gadget, 1);
    function_2e6238c0(gadget.weapon, gadget.owner);
    if (isdefined(gadget.weapon.var_775d2aad) && gadget.weapon.var_775d2aad) {
        thread function_4a82368f(gadget, gadget.owner);
    }
    wait(gadget.weapon.var_416021d8);
    if (!isdefined(attackingplayer)) {
        return;
    }
    if (!isdefined(gadget)) {
        return;
    }
    gadget dodamage(1000, gadget.origin, attackingplayer, jammer, undefined, "MOD_GRENADE_SPLASH", 0, level.var_578f7c6d.weapon);
    function_58f8bf08(jammer, attackingplayer, undefined);
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x24be9608, Offset: 0x1328
// Size: 0xdc
function function_4a82368f(entity, owner) {
    /#
        assert(isdefined(owner));
    #/
    if (isplayer(owner)) {
        owner clientfield::set_to_player("jammedvehpostfx", 1);
    }
    entity waittill(#"death", #"remote_weapon_end", #"hash_2476803a0d5fa572");
    if (!isdefined(owner)) {
        return;
    }
    if (isplayer(owner)) {
        owner clientfield::set_to_player("jammedvehpostfx", 0);
    }
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x903448e1, Offset: 0x1410
// Size: 0x8a
function function_1c430dad(entity, isjammed) {
    if (!isplayer(entity) && !isactor(entity)) {
        entity clientfield::set("isJammed", isjammed);
    }
    entity.isjammed = isjammed;
    entity.emped = isjammed;
}

// Namespace jammer/gadget_jammer_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xe45529fc, Offset: 0x14a8
// Size: 0xe4
function private function_d88f3e48(entity) {
    if (!isdefined(entity)) {
        return;
    }
    if (isplayer(entity)) {
        entity clientfield::set_to_player("isJammed", 0);
        entity setempjammed(0);
    }
    function_1c430dad(entity, 0);
    if (isdefined(entity.weapon) && !isplayer(entity) && isdefined(entity.owner)) {
        function_2eb0a933(entity.weapon, entity.owner);
    }
}

// Namespace jammer/gadget_jammer_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x99e93aca, Offset: 0x1598
// Size: 0x64
function function_6a973411() {
    util::wait_network_frame();
    self clientfield::set("jammer_active", 0);
    util::wait_network_frame();
    self clientfield::set("jammer_active", 1);
}

// Namespace jammer/gadget_jammer_shared
// Params 1, eflags: 0x0
// Checksum 0x87b1ea01, Offset: 0x1608
// Size: 0x2a
function function_cc908239(entity) {
    if (isdefined(entity.owner)) {
        return entity.owner;
    }
    return undefined;
}

// Namespace jammer/gadget_jammer_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x49544a56, Offset: 0x1640
// Size: 0x34
function function_51a743f8(attacker, weapon, target) {
    self delete();
}

// Namespace jammer/gadget_jammer_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xab9cda86, Offset: 0x1680
// Size: 0x24
function function_b2e496fa(watcher) {
    self delete();
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x94b0d292, Offset: 0x16b0
// Size: 0x160
function private function_b16c8865(entity, attackingplayer) {
    if (self == entity) {
        return 0;
    }
    if (!isplayer(entity) && (!isdefined(entity.model) || entity.model == #"")) {
        return 0;
    }
    if (isactor(entity) && !(isdefined(entity.var_8f61d7f4) && entity.var_8f61d7f4)) {
        return 0;
    }
    if (isdefined(entity.team) && !util::function_fbce7263(entity.team, attackingplayer.team)) {
        return 0;
    }
    if (isplayer(entity) && entity function_6c32d092(#"talent_resistance")) {
        return 0;
    }
    if (isdefined(entity.ignoreemp) ? entity.ignoreemp : 0) {
        return 0;
    }
    return 1;
}

// Namespace jammer/gadget_jammer_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x3efc0dca, Offset: 0x1818
// Size: 0x28
function private function_7b151daa(player) {
    return isdefined(player.isjammed) && player.isjammed;
}

// Namespace jammer/gadget_jammer_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6b5c83b1, Offset: 0x1848
// Size: 0x80
function function_5f86757d() {
    level endon(#"game_ended");
    waitresult = undefined;
    waitresult = self waittill(#"explode", #"death");
    if (!isdefined(self)) {
        return waitresult;
    }
    self clientfield::set("enemyequip", 0);
    return waitresult;
}

// Namespace jammer/gadget_jammer_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x5e62b47a, Offset: 0x18d0
// Size: 0xa4
function private function_3a3a2ea9(jammer) {
    jammer endon(#"death");
    waitresult = undefined;
    waitresult = jammer waittilltimeout(2, #"hash_754a0aedf9f00e8d");
    if (!isdefined(jammer)) {
        return;
    }
    jammer playsound(#"hash_7ed67b248bc52c02");
    playfxontag(#"hash_5a695126234cbb41", jammer, "tag_origin");
}

// Namespace jammer/gadget_jammer_shared
// Params 3, eflags: 0x5 linked
// Checksum 0xdabc532b, Offset: 0x1980
// Size: 0x8c
function private function_58f8bf08(jammer, attackingplayer, victim) {
    if (damagefeedback::dodamagefeedback(level.var_578f7c6d.weapon, attackingplayer)) {
        attackingplayer thread damagefeedback::update("MOD_UNKNOWN", jammer, undefined, level.var_578f7c6d.weapon, victim, 0, undefined, 0, 0, 1);
    }
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x488757ef, Offset: 0x1a18
// Size: 0x194
function function_2e6238c0(weapon, owner) {
    if (!isdefined(weapon) || !isdefined(owner)) {
        return;
    }
    taacomdialog = undefined;
    leaderdialog = undefined;
    switch (weapon.name) {
    case #"tank_robot":
    case #"inventory_tank_robot":
    case #"ai_tank_marker":
        taacomdialog = "aiTankJammedStart";
        leaderdialog = "aiTankJammedStart";
        break;
    case #"ultimate_turret":
    case #"inventory_ultimate_turret":
        taacomdialog = "ultTurretJammedStart";
        leaderdialog = "ultTurretJammedStart";
        break;
    case #"ability_smart_cover":
    case #"gadget_smart_cover":
        taacomdialog = "smartCoverJammedStart";
        break;
    }
    if (isdefined(leaderdialog) && isdefined(owner)) {
        if (isdefined(level.var_57e2bc08)) {
            if (level.teambased) {
                thread [[ level.var_57e2bc08 ]](leaderdialog, owner.team, owner);
            }
        }
    }
    if (isdefined(taacomdialog) && isdefined(owner)) {
        owner thread killstreaks::play_taacom_dialog(taacomdialog);
    }
}

// Namespace jammer/gadget_jammer_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x9ab68e82, Offset: 0x1bb8
// Size: 0x194
function function_2eb0a933(weapon, owner) {
    if (!isdefined(weapon) || !isdefined(owner)) {
        return;
    }
    taacomdialog = undefined;
    leaderdialog = undefined;
    switch (weapon.name) {
    case #"tank_robot":
    case #"inventory_tank_robot":
    case #"ai_tank_marker":
        taacomdialog = "aiTankJammedEnd";
        leaderdialog = "aiTankJammedEnd";
        break;
    case #"ultimate_turret":
    case #"inventory_ultimate_turret":
        taacomdialog = "ultTurretJammedEnd";
        leaderdialog = "ultTurretJammedEnd";
        break;
    case #"ability_smart_cover":
    case #"gadget_smart_cover":
        taacomdialog = "smartCoverJammedEnd";
        break;
    }
    if (isdefined(leaderdialog) && isdefined(owner)) {
        if (isdefined(level.var_57e2bc08)) {
            if (level.teambased) {
                thread [[ level.var_57e2bc08 ]](leaderdialog, owner.team, owner);
            }
        }
    }
    if (isdefined(taacomdialog) && isdefined(owner)) {
        owner thread killstreaks::play_taacom_dialog(taacomdialog);
    }
}

