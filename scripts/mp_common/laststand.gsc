#using scripts\mp_common\player\player_damage.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\weapons\weapons.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_5394c653bafe1358;
#using script_243ea03c7a285692;

#namespace laststand_mp;

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x2
// Checksum 0x3acf7f49, Offset: 0x358
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"laststand_mp", &__init__, undefined, undefined);
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x51d65682, Offset: 0x3a0
// Size: 0x534
function __init__() {
    level.revive_hud = revive_hud::register("revive_hud");
    level.mp_revive_prompt = array(mp_revive_prompt::register("mp_revive_prompt_1"), mp_revive_prompt::register("mp_revive_prompt_2"), mp_revive_prompt::register("mp_revive_prompt_3"), mp_revive_prompt::register("mp_revive_prompt_4"));
    clientfield::register_clientuimodel("hudItems.laststand.progress", 13000, 5, "float");
    clientfield::register_clientuimodel("hudItems.laststand.beingRevived", 13000, 1, "int");
    clientfield::register("clientuimodel", "hudItems.laststand.revivingClientNum", 1, 7, "int");
    clientfield::register("clientuimodel", "hudItems.laststand.reviveProgress", 1, 5, "float");
    clientfield::register("clientuimodel", "EnemyTeamLastLivesData.numPlayersDowned", 1, 3, "int");
    clientfield::register("clientuimodel", "PlayerTeamLastLivesData.numPlayersDowned", 1, 3, "int");
    clientfield::register("allplayers", "laststand_bleed", 1, 1, "int");
    level.var_8e910e84 = 1;
    level.var_97c6ee7c = &playerlaststand;
    level.var_b1ad0b64 = &function_b1ad0b64;
    level.skiplaststand = getgametypesetting(#"skiplaststand");
    level.laststandlives = getgametypesetting(#"hash_83f11b8abac148f");
    level.var_5c13c13f = getgametypesetting(#"hash_4c7c8c4bd1b2a58b");
    level.var_57e7d5a = getgametypesetting(#"hash_67d54bbc52811921");
    level.var_b5087de4 = getgametypesetting(#"hash_3e13b420d6773b4c");
    level.laststandweapon = getweapon(#"downed");
    level.var_e273f858 = getweapon(#"notdowned");
    level.weaponrevivetool = getweapon("syrette");
    level.var_e86679bd = [];
    level.var_8971cf67 = 0;
    level.var_51e72062 = 0;
    level thread revive_hud_think();
    level.var_91c33dcb = getscriptbundle(#"finishers");
    if (!isdefined(getdvar(#"revive_trigger_radius"))) {
        setdvar(#"revive_trigger_radius", 100);
    }
    callback::on_spawned(&on_player_spawned);
    callback::on_player_damage(&on_player_damage);
    callback::on_player_killed_with_params(&on_player_killed);
    callback::on_disconnect(&on_player_disconnect);
    level.var_701f2ed4 = [];
    level.var_701f2ed4[#"axis"] = 0;
    level.var_701f2ed4[#"allies"] = 0;
    /#
        level thread force_last_stand();
    #/
    setdvar(#"g_revivetime", getgametypesetting(#"laststandrevivetime"));
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x7d857546, Offset: 0x8e0
// Size: 0x50
function function_feb3e91d() {
    return isdefined(getgametypesetting(#"laststandfinishing")) ? getgametypesetting(#"laststandfinishing") : 0;
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0xae1e4843, Offset: 0x938
// Size: 0x1a
function function_367cfa1b(callbackfunc) {
    level.var_dcc41ae = callbackfunc;
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0x709ac87f, Offset: 0x960
// Size: 0x1a
function function_eb8c0e47(callbackfunc) {
    level.var_f80fdd3f = callbackfunc;
}

// Namespace laststand_mp/laststand
// Params 2, eflags: 0x0
// Checksum 0x70af7f8, Offset: 0x988
// Size: 0x66
function function_414115a0(time, health) {
    tier = {#time:time, #health:health};
    level.var_e86679bd[level.var_e86679bd.size] = tier;
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x82a31dd9, Offset: 0x9f8
// Size: 0x1ac
function on_player_spawned() {
    self laststand::revive_hud_create();
    self thread function_9f66e37a();
    self thread function_4e612708();
    self.var_d887a4ad = undefined;
    foreach (prompt in level.mp_revive_prompt) {
        [[ prompt ]]->set_clientnum(self, int(min(getdvarint(#"com_maxclients", 0), pow(2, 7))) - 1);
    }
    self clientfield::set_player_uimodel("hudItems.laststand.revivingClientNum", int(min(getdvarint(#"com_maxclients", 0), pow(2, 7))) - 1);
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x62e0ef03, Offset: 0xbb0
// Size: 0x62
function function_9f66e37a() {
    self endon(#"death", #"disconnect");
    self.enteredvehicle = 0;
    while (true) {
        self waittill(#"enter_vehicle");
        self.enteredvehicle = 1;
    }
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0xe68bf550, Offset: 0xc20
// Size: 0x56
function function_4e612708() {
    self endon(#"death", #"disconnect");
    while (true) {
        self waittill(#"exit_vehicle");
        waitframe(1);
        self.enteredvehicle = 0;
    }
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0xe530f408, Offset: 0xc80
// Size: 0xba
function on_player_damage(params) {
    if (self is_reviving_any()) {
        if (isdefined(self.reviving_player) && isdefined(self.reviving_player.var_d75a6ff5)) {
            self.reviving_player.var_d75a6ff5.var_d733f8d7 += params.idamage;
            if (self.health <= params.idamage) {
                self.reviving_player.var_d75a6ff5.var_bb36e277 = 1;
            }
        }
    }
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0xbaffd474, Offset: 0xd48
// Size: 0x3c
function on_player_killed(params) {
    if (params.smeansofdeath === "MOD_SUICIDE") {
        self function_7ff2fc91();
    }
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0xe5f9c26, Offset: 0xd90
// Size: 0x1c
function on_player_disconnect() {
    self function_7ff2fc91();
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x7add43d4, Offset: 0xdb8
// Size: 0x190
function function_7ff2fc91() {
    friendlies = getplayers(self.team);
    var_90c1e72d = 0;
    foreach (player in friendlies) {
        if (player == self) {
            continue;
        }
        if (isalive(player) && !player laststand::player_is_in_laststand()) {
            var_90c1e72d = 1;
            break;
        }
    }
    if (!var_90c1e72d) {
        foreach (player in friendlies) {
            if (player != self && isalive(player) && player laststand::player_is_in_laststand()) {
                player thread bleed_out();
            }
        }
    }
}

// Namespace laststand_mp/laststand
// Params 2, eflags: 0x0
// Checksum 0xd9f6eeed, Offset: 0xf50
// Size: 0xf0
function function_263a2944(prompt, var_a1258c6b) {
    var_a1258c6b waittill(#"player_revived", #"disconnect", #"bled_out", #"death");
    if (isdefined(self)) {
        [[ prompt ]]->close(self);
        [[ prompt ]]->set_clientnum(self, int(min(getdvarint(#"com_maxclients", 0), pow(2, 7))) - 1);
    }
}

// Namespace laststand_mp/laststand
// Params 2, eflags: 0x0
// Checksum 0x699a1649, Offset: 0x1048
// Size: 0xba
function function_c025efba(prompt, var_a1258c6b) {
    var_a1258c6b endon(#"player_revived", #"disconnect", #"bled_out", #"death");
    self endon(#"disconnect");
    while (true) {
        [[ prompt ]]->set_health(self, var_a1258c6b.var_2d19ce3c);
        [[ prompt ]]->set_reviveprogress(self, var_a1258c6b.reviveprogress);
        waitframe(1);
    }
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0x82307aac, Offset: 0x1110
// Size: 0x12c
function function_5de626dc(var_a1258c6b) {
    foreach (prompt in level.mp_revive_prompt) {
        if (![[ prompt ]]->function_7bfd10e6(self)) {
            [[ prompt ]]->open(self);
            [[ prompt ]]->set_health(self, 1);
            [[ prompt ]]->set_reviveprogress(self, 0);
            [[ prompt ]]->set_clientnum(self, var_a1258c6b getentitynumber());
            self thread function_263a2944(prompt, var_a1258c6b);
            self thread function_c025efba(prompt, var_a1258c6b);
            break;
        }
    }
}

// Namespace laststand_mp/laststand
// Params 7, eflags: 0x0
// Checksum 0xad6033ca, Offset: 0x1248
// Size: 0x2da
function function_dc7906e8(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc) {
    self.laststandparams = spawnstruct();
    self.var_bfc8055f = spawnstruct();
    self.laststandparams.einflictor = einflictor;
    self.var_bfc8055f.var_b5346661 = isdefined(einflictor) ? einflictor getentitynumber() : -1;
    self.laststandparams.attacker = attacker;
    self.var_bfc8055f.attackernum = isdefined(attacker) ? attacker getentitynumber() : -1;
    self.laststandparams.attackerorigin = attacker.origin;
    if (isplayer(attacker)) {
        self.laststandparams.var_83634238 = attacker getplayerangles();
    } else {
        self.laststandparams.var_83634238 = attacker.angles;
    }
    self.laststandparams.idamage = idamage;
    self.laststandparams.smeansofdeath = smeansofdeath;
    self.laststandparams.sweapon = weapon;
    self.laststandparams.vdir = vdir;
    self.laststandparams.shitloc = shitloc;
    self.laststandparams.laststandstarttime = gettime();
    self.laststandparams.victimorigin = self.origin;
    self.laststandparams.var_5fceefd4 = self getplayerangles();
    self.laststandparams.victimweapon = self.currentweapon;
    self.laststandparams.matchtime = gettime();
    self.laststandparams.bledout = 0;
    self.laststandparams.var_59b19c1b = 1;
    if (isdefined(einflictor) && isdefined(einflictor.item) && einflictor.item.name === #"planemortar") {
        self.laststandparams.killcam_entity_info_cached = killcam::get_killcam_entity_info(attacker, einflictor, weapon);
    }
}

// Namespace laststand_mp/laststand
// Params 7, eflags: 0x0
// Checksum 0xc870ca41, Offset: 0x1530
// Size: 0x1d2
function function_67b38e11(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.laststandparams)) {
        self.laststandparams = [];
    }
    if (!isdefined(self.var_bfc8055f)) {
        self.var_bfc8055f = [];
    }
    self.laststandparams.einflictor = einflictor;
    self.var_bfc8055f.var_b5346661 = isdefined(einflictor) ? einflictor getentitynumber() : -1;
    self.laststandparams.attacker = attacker;
    self.var_bfc8055f.attackernum = isdefined(attacker) ? attacker getentitynumber() : -1;
    self.laststandparams.idamage = idamage;
    self.laststandparams.smeansofdeath = smeansofdeath;
    self.laststandparams.sweapon = weapon;
    self.laststandparams.vdir = vdir;
    self.laststandparams.shitloc = shitloc;
    if (isdefined(einflictor) && isdefined(einflictor.item) && einflictor.item.name === #"planemortar") {
        self.laststandparams.killcam_entity_info_cached = killcam::get_killcam_entity_info(attacker, einflictor, weapon);
    }
}

// Namespace laststand_mp/laststand
// Params 2, eflags: 0x0
// Checksum 0x89dc6d93, Offset: 0x1710
// Size: 0x2c
function function_d5db8d2e(attacker, weapon) {
    self function_2907ce7a();
}

/#

    // Namespace laststand_mp/laststand
    // Params 0, eflags: 0x0
    // Checksum 0xa1aa61c4, Offset: 0x1748
    // Size: 0xbc
    function function_463b3f65() {
        self endon(#"player_revived", #"death");
        while (true) {
            if (getdvarstring(#"scr_last_stand", "<dev string:x38>") == "<dev string:x3b>") {
                self notify(#"auto_revive");
                waittillframeend();
                setdvar(#"scr_last_stand", "<dev string:x38>");
                return;
            }
            wait(0.1);
        }
    }

    // Namespace laststand_mp/laststand
    // Params 0, eflags: 0x0
    // Checksum 0x829d07e4, Offset: 0x1810
    // Size: 0x1c0
    function force_last_stand() {
        level endon(#"game_ended");
        while (true) {
            if (getdvarstring(#"scr_last_stand", "<dev string:x38>") == "<dev string:x47>") {
                host = util::gethostplayer();
                angles = host getplayerangles();
                dir = anglestoforward(angles);
                eye = host geteye();
                dir *= 500;
                trace = bullettrace(eye, eye + dir, 1, host);
                target = trace[#"entity"];
                if (!isdefined(target) || !isplayer(target)) {
                    target = host;
                }
                target dodamage(target.health, target.origin);
                setdvar(#"scr_last_stand", "<dev string:x38>");
            }
            wait(0.1);
        }
    }

#/

// Namespace laststand_mp/laststand
// Params 9, eflags: 0x0
// Checksum 0x16f0a777, Offset: 0x19d8
// Size: 0xa4c
function playerlaststand(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, delayoverride) {
    if (self laststand::player_is_in_laststand()) {
        return;
    }
    self.var_60956d6 = self getcurrentweapon();
    self function_dc7906e8(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc);
    if (!isdefined(self.laststandcount)) {
        self.laststandcount = 0;
    }
    self.laststandcount++;
    self function_ecdd4b27();
    if (isdefined(level.var_f7b64ada)) {
        [[ level.var_f7b64ada ]]();
    }
    var_2066d96d = 1;
    friendlies = getplayers(self.team);
    var_90c1e72d = 0;
    foreach (player in friendlies) {
        if (player == self) {
            continue;
        }
        if (isalive(player) && !player laststand::player_is_in_laststand()) {
            var_2066d96d = 0;
            var_90c1e72d = 1;
            break;
        }
    }
    if (isdefined(level.skiplaststand) && level.skiplaststand) {
        var_2066d96d = 1;
    }
    if (self isplayerswimming() || isdefined(self.enteredvehicle) && self.enteredvehicle) {
        var_2066d96d = 1;
    }
    if (level.laststandlives && self.laststandcount > level.laststandlives) {
        var_2066d96d = 1;
    }
    if (isdefined(self.last_valid_position) && self.last_valid_position[2] - self.origin[2] > 200) {
        var_2066d96d = 1;
    }
    if (attacker === self) {
        var_2066d96d = 1;
    }
    if (isdefined(self.usingremote)) {
        var_2066d96d = 1;
    }
    if (level.var_8971cf67 && self.team == game.defenders) {
        var_2066d96d = 1;
    }
    if (level.var_51e72062 && self.team == game.attackers) {
        var_2066d96d = 1;
    }
    if (var_2066d96d) {
        self undolaststand();
        self.uselaststandparams = 1;
        self function_6da86ae();
        self suicide(smeansofdeath);
        if (isdefined(self.var_d75a6ff5)) {
            self.var_d75a6ff5.death = 1;
        }
        self function_1e8018b0();
        if (!var_90c1e72d) {
            foreach (player in friendlies) {
                if (player != self && isalive(player) && player laststand::player_is_in_laststand()) {
                    player thread bleed_out();
                }
            }
        }
        return;
    }
    obituary(self, attacker, level.weaponnone, "MOD_DOWNED");
    if (isdefined(attacker) && isplayer(attacker)) {
        if (util::function_fbce7263(attacker.team, self.team) && !function_7afe7d1e(attacker, self)) {
            scoreevents::processscoreevent(#"downed_enemy", attacker, self, weapon);
        }
        if (isdefined(level.var_dcc41ae)) {
            [[ level.var_dcc41ae ]](attacker, self, einflictor, weapon, smeansofdeath);
        }
    }
    self.reviveprogress = 0;
    self.var_2d19ce3c = 1;
    level.var_701f2ed4[self.team]++;
    foreach (player in friendlies) {
        if (!player laststand::player_is_in_laststand()) {
            player clientfield::set_player_uimodel("PlayerTeamLastLivesData.numPlayersDowned", level.var_701f2ed4[self.team]);
        }
        var_13b99768 = player != self && isalive(player);
        if ((var_13b99768 || sessionmodeismultiplayergame()) && !player laststand::player_is_in_laststand()) {
            player thread function_5de626dc(self);
        }
    }
    enemies = getplayers(util::getotherteam(self.team));
    foreach (player in enemies) {
        if (!player laststand::player_is_in_laststand()) {
            player clientfield::set_player_uimodel("EnemyTeamLastLivesData.numPlayersDowned", level.var_701f2ed4[self.team]);
        }
    }
    self notify(#"entering_last_stand");
    self allowjump(0);
    self disableoffhandweapons();
    /#
        self thread function_463b3f65();
    #/
    self.health = 5;
    self.laststand = 1;
    self.meleeattackers = undefined;
    callback::callback(#"on_player_laststand");
    self function_d5db8d2e(attacker, weapon);
    if (!(isdefined(self.no_revive_trigger) && self.no_revive_trigger)) {
        if (!self oob::isoutofbounds()) {
            self revive_trigger_spawn();
        }
    }
    self thread laststand_disable_player_weapons();
    bleedout_time = getdvarfloat(#"player_laststandbleedouttime", 0);
    var_969fabf4 = self.maxhealth;
    var_b145f8cd = self.laststandcount - 1;
    if (var_b145f8cd >= level.var_e86679bd.size) {
        var_b145f8cd = level.var_e86679bd.size - 1;
    }
    var_e86679bd = level.var_e86679bd[var_b145f8cd];
    if (isdefined(var_e86679bd)) {
        bleedout_time = var_e86679bd.time;
        var_969fabf4 = var_e86679bd.health;
    }
    self clientfield::set("laststand_bleed", 1);
    self thread laststand_bleedout(bleedout_time, var_969fabf4);
    self thread laststand_invulnerability();
    demo::bookmark(#"player_downed", gettime(), self);
    potm::bookmark(#"player_downed", gettime(), self);
    self thread laststand::function_d4c9e1b5();
    self thread auto_revive_on_notify();
    self thread function_5ccd602d();
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x3088de71, Offset: 0x2430
// Size: 0x64
function function_5ccd602d() {
    self endon(#"player_revived", #"disconnect");
    self waittill(#"death");
    self function_2907ce7a();
    self undolaststand();
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x5e73fa25, Offset: 0x24a0
// Size: 0xe4
function laststand_disable_player_weapons() {
    self endon(#"death", #"disconnect");
    self giveweapon(level.laststandweapon);
    self givemaxammo(level.laststandweapon);
    self switchtoweaponimmediate(level.laststandweapon, 1);
    self disableweaponcycling();
    self disableoffhandweapons();
    self waittilltimeout(1, #"weapon_change_complete");
    self weapons::detach_all_weapons();
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x5df1fac8, Offset: 0x2590
// Size: 0x64
function function_102748f8() {
    self takeweapon(level.laststandweapon);
    self giveweapon(level.var_e273f858);
    self switchtoweaponimmediate(level.var_e273f858, 1);
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x93a315da, Offset: 0x2600
// Size: 0x74
function laststand_enable_player_weapons() {
    self takeweapon(level.var_e273f858);
    self enableweaponcycling();
    self enableoffhandweapons();
    self weapons::function_d571ac59(self.var_60956d6);
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0x4794b502, Offset: 0x2680
// Size: 0x12c
function laststand_clean_up_on_interrupt(playerbeingrevived) {
    self endon(#"do_revive_ended_normally", #"disconnect");
    revivetrigger = playerbeingrevived.revivetrigger;
    playerbeingrevived waittill(#"disconnect", #"game_ended", #"death");
    if (isdefined(playerbeingrevived)) {
        playerbeingrevived clientfield::set_player_uimodel("hudItems.laststand.beingRevived", 0);
    }
    self stoploopsound(1);
    if (isdefined(revivetrigger)) {
        revivetrigger delete();
    }
    self function_2907ce7a();
    self revive_give_back_weapons();
    self clientfield::set_player_uimodel("hudItems.laststand.reviveProgress", 0);
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0xb5e1349, Offset: 0x27b8
// Size: 0x348
function laststand_bleedout_damage() {
    self endon(#"player_revived", #"disconnect", #"bled_out");
    while (true) {
        waitresult = self waittill(#"laststand_damage");
        if (self.var_d887a4ad === 1) {
            return;
        }
        if (waitresult.smeansofdeath == "MOD_MELEE") {
            self.var_969fabf4 = 0;
        } else {
            self.var_969fabf4 -= waitresult.idamage;
        }
        if (self.var_969fabf4 <= 0) {
            self.bleedout_time = 0;
            self.var_1cc38de0 = 1;
            vattacker = isdefined(waitresult.eattacker) ? waitresult.eattacker : self;
            self.var_a1d415ee = {#einflictor:waitresult.einflictor, #attacker:waitresult.eattacker, #attackerorigin:vattacker.origin, #var_83634238:isplayer(vattacker) ? vattacker getplayerangles() : vattacker.angles, #idamage:waitresult.idamage, #smeansofdeath:waitresult.smeansofdeath, #sweapon:waitresult.weapon, #vdir:waitresult.vdir, #shitloc:waitresult.shitloc, #matchtime:function_f8d53445()};
            self notify(#"update_bleedout");
        }
        if (isdefined(self.var_d75a6ff5)) {
            self.var_d75a6ff5.damage += int(waitresult.idamage);
        }
        self function_a6872ca5(waitresult.idamage, waitresult.eattacker, waitresult.idflags, waitresult.smeansofdeath, waitresult.weapon, waitresult.vpoint, waitresult.shitloc, waitresult.vdamageorigin, waitresult.boneindex, waitresult.vsurfacenormal, self.var_969fabf4 <= 0);
    }
}

// Namespace laststand_mp/laststand
// Params 2, eflags: 0x0
// Checksum 0x8ad31632, Offset: 0x2b08
// Size: 0x214
function laststand_bleedout(bleedouttime, var_969fabf4) {
    self endon(#"player_revived", #"player_bleedout", #"death");
    self.var_84c0402e = bleedouttime;
    self.bleedout_time = bleedouttime;
    self.var_969fabf4 = var_969fabf4;
    self.var_2d19ce3c = 0;
    if (self.bleedout_time > 0) {
        self thread laststand_bleedout_damage();
        var_9da219f5 = gettime();
        while (self.bleedout_time > 0) {
            time = gettime();
            if (time >= var_9da219f5) {
                self.var_2d19ce3c = self.bleedout_time / bleedouttime;
                self.bleedout_time -= 1;
                self clientfield::set_player_uimodel("hudItems.laststand.progress", self.var_2d19ce3c);
                var_9da219f5 = time + 1000;
            }
            self waittilltimeout(float(var_9da219f5 - time) / 1000, #"update_bleedout");
        }
        while (self.var_969fabf4 > 0 && isdefined(self.revivetrigger) && isdefined(self.revivetrigger.beingrevived) && self.revivetrigger.beingrevived == 1) {
            wait(0.1);
        }
    }
    if (self.var_d887a4ad === 1) {
        return;
    }
    self notify(#"bled_out");
    self thread bleed_out();
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x742e2006, Offset: 0x2d28
// Size: 0x5c
function laststand_invulnerability() {
    self endon(#"disconnect", #"death");
    self enableinvulnerability();
    wait(level.var_5c13c13f);
    self disableinvulnerability();
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x91201bfa, Offset: 0x2d90
// Size: 0x46
function function_6da86ae() {
    if (isdefined(self) && isdefined(self.laststandparams) && !isdefined(self.laststandparams.attacker)) {
        self.laststandparams.attacker = self;
    }
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0xee645088, Offset: 0x2de0
// Size: 0x3dc
function bleed_out() {
    self endon(#"player_revived", #"death");
    util::wait_network_frame();
    self function_2907ce7a();
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger delete();
        self.revivetrigger = undefined;
    }
    self clientfield::set("laststand_bleed", 0);
    demo::bookmark(#"player_bledout", gettime(), self, undefined, 1);
    potm::bookmark(#"player_bledout", gettime(), self, undefined, 1);
    level notify(#"bleed_out", {#character_index:self.characterindex});
    self notify(#"player_bleedout");
    callback::callback(#"on_player_bleedout");
    self undolaststand();
    self.uselaststandparams = 1;
    self function_6da86ae();
    if (isdefined(self.laststandparams) && !(isdefined(self.var_1cc38de0) && self.var_1cc38de0)) {
        self.laststandparams.bledout = 1;
    }
    if (isdefined(self.var_d75a6ff5)) {
        self.var_d75a6ff5.death = isdefined(self.var_1cc38de0) && self.var_1cc38de0;
        self.var_d75a6ff5.bleed_out = !self.var_d75a6ff5.death;
        self function_1e8018b0();
    }
    self function_2907ce7a();
    if (isdefined(self.laststandparams) && isdefined(self.laststandparams.smeansofdeath)) {
        self suicide(self.laststandparams.smeansofdeath);
    } else {
        self suicide();
    }
    if (getdvarint(#"hash_62b8db0428755a32", 1) && isplayer(self)) {
        var_d7e063c = getdvarfloat(#"hash_44de9418bb6289ac", 1.5);
        self playsoundtoplayer(#"hash_11d39dca0f911535", self);
        self lui::screen_fade(var_d7e063c, 1, 0, "black", 0);
        wait(var_d7e063c + 0.2);
        self lui::screen_fade(var_d7e063c, 0, 1, "black", 0);
    }
    if (isdefined(self) && self.no_respawn !== 1) {
        self thread respawn_player_after_time(15);
    }
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0x1c1973a8, Offset: 0x31c8
// Size: 0xbc
function respawn_player_after_time(n_time_seconds) {
    self endon(#"death", #"disconnect");
    players = getplayers();
    if (players.size == 1) {
        return;
    }
    self waittill(#"spawned_spectator");
    level endon(#"objective_changed");
    wait(n_time_seconds);
    if (self.sessionstate == #"spectator") {
        self thread globallogic_spawn::waitandspawnclient();
    }
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x1cc6e0dd, Offset: 0x3290
// Size: 0x44
function function_2907ce7a() {
    self clientfield::set_player_uimodel("hudItems.laststand.progress", 0);
    self clientfield::set_player_uimodel("hudItems.laststand.beingRevived", 0);
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0xaebca555, Offset: 0x32e0
// Size: 0x17c
function revive_trigger_spawn() {
    radius = getdvarint(#"revive_trigger_radius", 100);
    self.revivetrigger = spawn("trigger_radius", (0, 0, 0), 0, radius, radius);
    self.revivetrigger sethintstring("");
    self.revivetrigger setcursorhint("HINT_NOICON");
    self.revivetrigger setmovingplatformenabled(1);
    self.revivetrigger enablelinkto();
    self.revivetrigger.origin = self.origin;
    self.revivetrigger linkto(self);
    self.revivetrigger.beingrevived = 0;
    self.revivetrigger.createtime = gettime();
    self.revivetrigger.radius = radius;
    self.revivetrigger setteamfortrigger(self.team);
    self thread revive_trigger_think();
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x2768ebd3, Offset: 0x3468
// Size: 0x498
function revive_trigger_think() {
    self endon(#"death", #"stop_revive_trigger");
    level endon(#"game_ended");
    while (true) {
        wait(0.1);
        if (!isdefined(self.revivetrigger)) {
            self notify(#"stop_revive_trigger");
        }
        self.revivetrigger sethintstring("");
        /#
            if (getdvarint(#"lastand_selfrevive", 0) && self attackbuttonpressed() && self throwbuttonpressed() && self fragbuttonpressed()) {
                self thread revive_success(self);
                self function_2907ce7a();
                return;
            }
        #/
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            if (players[i].team != self.team) {
                continue;
            }
            if (players[i] can_revive(self)) {
                self.revivetrigger setrevivehintstring(#"hash_51a0f083a5566a3", self.team);
                break;
            }
        }
        for (i = 0; i < players.size; i++) {
            reviver = players[i];
            if (!isdefined(reviver)) {
                continue;
            }
            if (reviver.team != self.team) {
                continue;
            }
            if (self == reviver || !reviver is_reviving(self)) {
                continue;
            }
            gun = reviver getcurrentweapon();
            assert(isdefined(gun));
            if (gun == level.weaponrevivetool) {
                continue;
            }
            reviver giveweapon(level.weaponrevivetool);
            reviver switchtoweapon(level.weaponrevivetool, 1);
            reviver setweaponammostock(level.weaponrevivetool, 1);
            reviver disableweaponcycling();
            reviver disableusability();
            reviver disableoffhandweapons();
            revive_success = reviver revive_do_revive(self);
            if (isdefined(reviver)) {
                reviver revive_give_back_weapons();
            }
            if (revive_success) {
                self thread revive_success(reviver);
                self function_2907ce7a();
                return;
            }
        }
        if (function_feb3e91d()) {
            foreach (team in level.teams) {
                if (team === self.team) {
                    continue;
                }
                if (function_356caede(team)) {
                    return;
                }
            }
        }
    }
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0x842ce368, Offset: 0x3908
// Size: 0x652
function function_356caede(team) {
    if (!isdefined(self)) {
        return false;
    }
    if (!isdefined(level.alivecount) || !isdefined(level.alivecount[team])) {
        return false;
    }
    if (level.alivecount[team] == 0) {
        return false;
    }
    if (!isdefined(self.revivetrigger)) {
        return false;
    }
    players = getplayers(team, self.revivetrigger.origin, self.revivetrigger.radius);
    height = getdvarint(#"hash_48068f92d21e2a64", 15);
    foreach (player in players) {
        if (player can_revive(self, 1, height)) {
            self.revivetrigger setrevivehintstring(#"hash_a9213d7fcad1656", team);
            break;
        }
    }
    foreach (finisher in players) {
        if (self == finisher || !finisher is_reviving(self, 0, height) || finisher is_reviving_any() || isdefined(finisher.var_5c574004) && finisher.var_5c574004) {
            continue;
        }
        finisher increment_finishing();
        bundle_index = randomintrange(1, level.var_91c33dcb.finishers.size - 1);
        assert(level.var_91c33dcb.finishers.size >= bundle_index);
        var_abdbed5a = level.var_91c33dcb.finishers[bundle_index].("finisherbundle");
        var_d1d9820d = getscriptbundle(var_abdbed5a);
        if (isdefined(var_d1d9820d.("attacker_gesture"))) {
            finisher function_c6775cf9(var_d1d9820d.("attacker_gesture"));
        }
        if (isdefined(var_d1d9820d.("victim_gesture"))) {
            self function_c6775cf9(var_d1d9820d.("victim_gesture"));
        }
        self function_fab0e07e(finisher);
        if (!isdefined(finisher)) {
            return false;
        }
        if (!isdefined(self) || !isalive(self) || !isalive(finisher)) {
            finisher function_b16f016a();
            return false;
        }
        finisher disableweaponcycling();
        finisher disableusability();
        finisher disableoffhandweapons();
        self flagsys::clear(#"hash_40e3b09bdbcdac81");
        var_62728357 = finisher function_1c8cab15(self);
        if (isdefined(finisher)) {
            finisher function_b16f016a();
            finisher enableweaponcycling();
            finisher enableusability();
            finisher enableoffhandweapons();
            kill_angles = finisher gettagangles("tag_sync");
            kill_origin = finisher gettagorigin("tag_sync");
            if (isdefined(self)) {
                if (isdefined(var_62728357) && var_62728357) {
                    self function_516a3bef(0);
                    self setplayerangles(kill_angles);
                    self setorigin(kill_origin);
                    self dodamage(self.var_969fabf4, self.origin, finisher, undefined, "none", "MOD_MELEE_ASSASSINATE", 8192);
                    self function_2907ce7a();
                    return true;
                } else {
                    self function_516a3bef(1);
                    self function_7c685040();
                }
            }
            finisher function_7c685040();
        }
    }
    return false;
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x3f1a02a0, Offset: 0x3f68
// Size: 0x24
function increment_finishing() {
    if (!isdefined(self.var_5c574004)) {
        self.var_5c574004 = 0;
    }
    self.var_5c574004++;
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x5fdc4664, Offset: 0x3f98
// Size: 0x4e
function function_b16f016a() {
    self.var_5c574004--;
    if (self.var_5c574004 < 0) {
        self.var_5c574004 = 0;
        return;
    }
    if (self.var_5c574004 > 99999) {
        self.var_5c574004 = 99999;
    }
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0x913baf1d, Offset: 0x3ff0
// Size: 0xc4
function function_fab0e07e(finisher) {
    self endon(#"disconnect");
    finisher endon(#"disconnect");
    waitframe(1);
    if (isdefined(self) && isdefined(finisher) && isalive(self) && isalive(finisher)) {
        self.laststandparams.savedorigin = self.origin;
        self.laststandparams.savedangles = self.angles;
        self playerlinkto(finisher, "tag_sync");
    }
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0xa1755438, Offset: 0x40c0
// Size: 0x84
function function_516a3bef(replace) {
    if (isalive(self) && function_feb3e91d()) {
        self unlink();
        if (replace) {
            self setorigin(self.laststandparams.savedorigin);
        }
    }
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0xeb59ed73, Offset: 0x4150
// Size: 0xb6
function function_c82a14d1(finisher) {
    self endon(#"death", #"disconnect", #"finish_abort");
    finisher endon(#"death", #"disconnect");
    waitresult = self waittill(#"contact");
    self flagsys::set(#"hash_40e3b09bdbcdac81");
    self notify(#"player_finished");
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0x481c31cd, Offset: 0x4210
// Size: 0x188
function function_1c8cab15(var_b4bb7319) {
    var_b4bb7319 endon(#"disconnect");
    self endon(#"disconnect");
    if (isdefined(var_b4bb7319.revivetrigger)) {
        var_b4bb7319.revivetrigger.beingfinished = 1;
    }
    var_b4bb7319 thread function_c82a14d1(self);
    while (isdefined(var_b4bb7319) && isalive(var_b4bb7319) && isalive(self) && !self laststand::player_is_in_laststand() && var_b4bb7319 laststand::player_is_in_laststand() && !var_b4bb7319 flagsys::get(#"hash_40e3b09bdbcdac81") && !self is_reviving_any()) {
        waitframe(1);
    }
    if (isdefined(var_b4bb7319.revivetrigger)) {
        var_b4bb7319.revivetrigger.beingfinished = 0;
    }
    if (isdefined(var_b4bb7319) && var_b4bb7319 flagsys::get(#"hash_40e3b09bdbcdac81")) {
        return true;
    }
    return false;
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0xfbbf013f, Offset: 0x43a0
// Size: 0xac
function revive_give_back_weapons() {
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.laststand) && self.laststand) {
        return;
    }
    self takeweapon(level.weaponrevivetool);
    self enableweaponcycling();
    self enableusability();
    self enableoffhandweapons();
    self weapons::function_d571ac59();
}

// Namespace laststand_mp/laststand
// Params 3, eflags: 0x0
// Checksum 0x52c47298, Offset: 0x4458
// Size: 0x2d6
function can_revive(revivee, ignore_touch_checks = 0, height = undefined) {
    if (!isdefined(revivee.revivetrigger)) {
        return false;
    }
    if (!isalive(self)) {
        return false;
    }
    if (self laststand::player_is_in_laststand()) {
        return false;
    }
    if (isdefined(level.can_revive) && ![[ level.can_revive ]](revivee)) {
        return false;
    }
    if (isdefined(level.var_1461fd14) && ![[ level.var_1461fd14 ]](revivee)) {
        return false;
    }
    if (isdefined(level.revive_trigger_should_ignore_sight_checks)) {
        ignore_sight_checks = [[ level.revive_trigger_should_ignore_sight_checks ]](self);
        if (ignore_sight_checks && isdefined(revivee.revivetrigger.beingrevived) && revivee.revivetrigger.beingrevived == 1) {
            ignore_touch_checks = 1;
        }
    }
    if (!ignore_touch_checks) {
        if (!self istouching(revivee.revivetrigger)) {
            return false;
        }
    }
    if (isdefined(height)) {
        delta = revivee.origin[2] - self.origin[2];
        if (delta > height || delta < height * -1) {
            return false;
        }
    }
    if (!self laststand::is_facing(revivee, 0.8)) {
        return false;
    }
    if (distancesquared(revivee.origin, self.origin) > 140 * 140) {
        return false;
    }
    if (!sighttracepassed(self.origin + (0, 0, 50), revivee.origin + (0, 0, 30), 0, undefined)) {
        return false;
    }
    if (!bullettracepassed(self.origin + (0, 0, 50), revivee.origin + (0, 0, 30), 0, undefined)) {
        return false;
    }
    return true;
}

// Namespace laststand_mp/laststand
// Params 3, eflags: 0x0
// Checksum 0xa1cbe083, Offset: 0x4738
// Size: 0xb4
function is_reviving(revivee, ignore_touch_checks = 0, height = undefined) {
    if (!isdefined(self) || !isdefined(revivee)) {
        return false;
    }
    if (!isalive(revivee)) {
        return false;
    }
    if (!isdefined(revivee.revivetrigger)) {
        return false;
    }
    return self usebuttonpressed() && can_revive(revivee, ignore_touch_checks, height);
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x62ac27bb, Offset: 0x47f8
// Size: 0x18
function is_reviving_any() {
    return isdefined(self.is_reviving_any) && self.is_reviving_any;
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0xad1932b2, Offset: 0x4818
// Size: 0x5da
function revive_do_revive(playerbeingrevived) {
    self endon(#"disconnect");
    if (!isdefined(playerbeingrevived)) {
        return 0;
    }
    assert(self is_reviving(playerbeingrevived));
    revivetime = getdvarfloat(#"g_revivetime", 3) * self function_bd85bc2f();
    timer = 0;
    revived = 0;
    playerbeingrevived clientfield::set_player_uimodel("hudItems.laststand.beingRevived", 1);
    playerbeingrevived.revivetrigger.beingrevived = 1;
    playerbeingrevived.revivetrigger sethintstring("");
    if (isplayer(playerbeingrevived)) {
        playerbeingrevived startrevive(self);
    }
    self thread laststand_clean_up_on_interrupt(playerbeingrevived);
    if (!isdefined(self.is_reviving_any)) {
        self.is_reviving_any = 0;
    }
    self.is_reviving_any++;
    self playsound(#"hash_7f077925d3f525ad");
    self playloopsound(#"hash_67a426610a2d2a2d");
    if (isdefined(playerbeingrevived.var_d75a6ff5)) {
        playerbeingrevived.var_d75a6ff5.var_d10f3b9a++;
    }
    self.reviving_player = playerbeingrevived;
    self clientfield::set_player_uimodel("hudItems.laststand.revivingClientNum", playerbeingrevived getentitynumber());
    while (self is_reviving(playerbeingrevived)) {
        if (self laststand::player_is_in_laststand()) {
            playerbeingrevived.reviveprogress = 0;
            break;
        }
        if (isdefined(playerbeingrevived.revivetrigger.auto_revive) && playerbeingrevived.revivetrigger.auto_revive) {
            playerbeingrevived.reviveprogress = 0;
            break;
        }
        playerbeingrevived.reviveprogress = min(timer / revivetime, 1);
        if (timer >= revivetime) {
            revived = 1;
            break;
        }
        self clientfield::set_player_uimodel("hudItems.laststand.reviveProgress", playerbeingrevived.reviveprogress);
        timer += float(function_60d95f53()) / 1000;
        waitframe(1);
    }
    self clientfield::set_player_uimodel("hudItems.laststand.reviveProgress", 0);
    self clientfield::set_player_uimodel("hudItems.laststand.revivingClientNum", int(min(getdvarint(#"com_maxclients", 0), pow(2, 7))) - 1);
    self stoploopsound(1);
    if (isdefined(playerbeingrevived)) {
        playerbeingrevived clientfield::set_player_uimodel("hudItems.laststand.beingRevived", 0);
        playerbeingrevived.reviveprogress = 0;
        if (isdefined(revived) && revived) {
            playerbeingrevived playsound(#"hash_39e55bff84ce34c8");
        } else {
            self playsound(#"hash_c2688a5ec1ca2b5");
        }
        if (!(isdefined(playerbeingrevived.revivetrigger.auto_revive) && playerbeingrevived.revivetrigger.auto_revive) && !revived) {
            if (isplayer(playerbeingrevived)) {
                playerbeingrevived stoprevive(self);
            }
        }
        playerbeingrevived.revivetrigger sethintstring(#"hash_51a0f083a5566a3");
        playerbeingrevived.revivetrigger.beingrevived = 0;
        if (isdefined(revived) && revived && isdefined(level.var_f80fdd3f)) {
            [[ level.var_f80fdd3f ]](playerbeingrevived, self);
        }
    }
    self.reviving_player = undefined;
    self notify(#"do_revive_ended_normally");
    self.is_reviving_any--;
    if (self.is_reviving_any < 0) {
        self.is_reviving_any = 0;
    } else if (self.is_reviving_any > 99999) {
        self.is_reviving_any = 99999;
    }
    return revived;
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x4baaf792, Offset: 0x4e00
// Size: 0x74
function auto_revive_on_notify() {
    self endon(#"death", #"disconnect", #"player_revived");
    waitresult = self waittill(#"auto_revive");
    auto_revive(waitresult.reviver);
}

// Namespace laststand_mp/laststand
// Params 1, eflags: 0x0
// Checksum 0xff743e64, Offset: 0x4e80
// Size: 0x216
function auto_revive(reviver) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"disconnect");
    self.var_d887a4ad = 1;
    var_8c0cedb7 = gettime() + getdvarint(#"hash_77107267fe87b359", 350);
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger.auto_revive = 1;
        while (isdefined(self.revivetrigger.beingrevived) && self.revivetrigger.beingrevived) {
            util::wait_network_frame();
        }
        self.revivetrigger.auto_trigger = 0;
    }
    self function_102748f8();
    if (var_8c0cedb7 >= gettime()) {
        revive_wait_time = (var_8c0cedb7 - gettime()) / 1000;
        wait(revive_wait_time);
    }
    if (!isdefined(self)) {
        return;
    }
    self reviveplayer();
    self.var_d887a4ad = undefined;
    self notify(#"stop_revive_trigger");
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger delete();
        self.revivetrigger = undefined;
    }
    self function_2907ce7a();
    self laststand_enable_player_weapons();
    self allowjump(1);
    self.laststand = undefined;
    self lui::screen_close_menu();
    self notify(#"player_revived", {#reviver:reviver});
}

// Namespace laststand_mp/laststand
// Params 2, eflags: 0x0
// Checksum 0xe521ea86, Offset: 0x50a0
// Size: 0x39c
function revive_success(reviver, b_track_stats = 1) {
    if (!isplayer(self)) {
        self notify(#"player_revived", {#reviver:reviver});
        return;
    }
    self function_102748f8();
    self.var_d887a4ad = 1;
    revive_wait_time = getdvarint(#"hash_77107267fe87b359", 350) / 1000;
    wait(revive_wait_time);
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(b_track_stats) && b_track_stats) {
        demo::bookmark(#"player_revived", gettime(), reviver, self);
        potm::bookmark(#"player_revived", gettime(), reviver, self);
    }
    if (isplayer(self)) {
        self allowjump(1);
    }
    self.laststand = undefined;
    self notify(#"player_revived", {#reviver:reviver});
    self reviveplayer();
    self.var_d887a4ad = undefined;
    health = getdvarint(#"hash_7036719f41a78d54", 0);
    if (isdefined(reviver)) {
        var_e705e073 = reviver function_15098882();
        if (var_e705e073 > 0) {
            health = var_e705e073;
        }
        if (!function_7e980623(reviver, self)) {
            reviver scoreevents::processscoreevent(#"revived_teammate", reviver, self);
        }
    }
    self.health = health;
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger delete();
        self.revivetrigger = undefined;
    }
    self clientfield::set("laststand_bleed", 0);
    self function_2907ce7a();
    self laststand_enable_player_weapons();
    self lui::screen_close_menu();
    self function_1e8018b0();
    voiceevent("player_revived", self, {#reviver:reviver});
    callback::callback(#"on_player_revived");
    if (isdefined(level.var_1a0c2b72)) {
        reviver [[ level.var_1a0c2b72 ]](self);
    }
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0xa86ec7f7, Offset: 0x5448
// Size: 0x274
function revive_hud_think() {
    level endon(#"game_ended");
    while (true) {
        wait(0.1);
        if (!laststand::player_any_player_in_laststand()) {
            continue;
        }
        revived = 0;
        foreach (team, _ in level.teams) {
            playertorevive = undefined;
            foreach (player in level.aliveplayers[team]) {
                if (!isdefined(player.revivetrigger) || !isdefined(player.revivetrigger.createtime)) {
                    continue;
                }
                if (!isdefined(playertorevive) || playertorevive.revivetrigger.createtime > player.revivetrigger.createtime) {
                    playertorevive = player;
                }
            }
            if (isdefined(playertorevive)) {
                foreach (player in level.aliveplayers[team]) {
                    if (player laststand::player_is_in_laststand()) {
                        continue;
                    }
                    player thread faderevivemessageover(playertorevive, 3);
                }
                playertorevive.revivetrigger.createtime = undefined;
                revived = 1;
            }
        }
        if (revived) {
            wait(3.5);
        }
    }
}

// Namespace laststand_mp/laststand
// Params 2, eflags: 0x0
// Checksum 0x2fc0f328, Offset: 0x56c8
// Size: 0x3c
function faderevivemessageover(playertorevive, time) {
    self thread laststand::revive_hud_show_n_fade(#"hash_14cc93f11ba8334a", time, playertorevive);
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0xdfe17e6a, Offset: 0x5710
// Size: 0xf6
function function_ecdd4b27() {
    if (!isplayer(self) || isdefined(self.var_d75a6ff5)) {
        return;
    }
    self.var_d75a6ff5 = {#player_xuid:int(self getxuid(1)), #start_time:gettime(), #end_time:0, #damage:0, #death:0, #bleed_out:0, #var_d10f3b9a:0, #var_d733f8d7:0, #var_35b89428:0};
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0x743b03d6, Offset: 0x5810
// Size: 0x198
function function_1e8018b0() {
    if (!isplayer(self) || !isdefined(self.var_d75a6ff5)) {
        return;
    }
    self.var_d75a6ff5.end_time = gettime();
    function_92d1707f(#"hash_142816c2e7c5da66", self.var_d75a6ff5);
    self.var_d75a6ff5 = undefined;
    level.var_701f2ed4[self.team]--;
    players = getplayers();
    foreach (player in players) {
        if (!isdefined(level.var_701f2ed4[player.team])) {
            continue;
        }
        player clientfield::set_player_uimodel("PlayerTeamLastLivesData.numPlayersDowned", level.var_701f2ed4[player.team]);
        player clientfield::set_player_uimodel("EnemyTeamLastLivesData.numPlayersDowned", level.var_701f2ed4[util::getotherteam(player.team)]);
    }
}

// Namespace laststand_mp/laststand
// Params 2, eflags: 0x0
// Checksum 0x1d2fb17e, Offset: 0x59b0
// Size: 0x3c
function function_b1ad0b64(idamage, smeansofdeath) {
    if (!(isdefined(self.laststand) && self.laststand)) {
        return false;
    }
    return self.var_969fabf4 <= idamage;
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0xbf79497b, Offset: 0x59f8
// Size: 0x6a
function function_b394486e() {
    self.var_d292d803 = spawnstruct();
    self.var_d292d803.cheating = 0;
    self.var_d292d803.downs = array();
    self.var_d292d803.revives = array();
}

// Namespace laststand_mp/laststand
// Params 0, eflags: 0x0
// Checksum 0xca60d0e7, Offset: 0x5a70
// Size: 0x22
function is_cheating() {
    if (!isdefined(self.var_d292d803)) {
        return 0;
    }
    return self.var_d292d803.cheating;
}

// Namespace laststand_mp/laststand
// Params 2, eflags: 0x0
// Checksum 0x6eca1005, Offset: 0x5aa0
// Size: 0x46a
function function_7afe7d1e(attacker, victim) {
    if (!isdefined(level.var_57e7d5a) || level.var_57e7d5a == 0) {
        return 0;
    }
    if (!isdefined(attacker.var_d292d803)) {
        attacker function_b394486e();
    } else if (attacker is_cheating()) {
        return 1;
    }
    if (!isdefined(attacker.var_d292d803.downs[victim.entnum])) {
        attacker.var_d292d803.downs[victim.entnum] = array();
        if (!isdefined(attacker.var_d292d803.downs[victim.entnum])) {
            attacker.var_d292d803.downs[victim.entnum] = [];
        } else if (!isarray(attacker.var_d292d803.downs[victim.entnum])) {
            attacker.var_d292d803.downs[victim.entnum] = array(attacker.var_d292d803.downs[victim.entnum]);
        }
        attacker.var_d292d803.downs[victim.entnum][attacker.var_d292d803.downs[victim.entnum].size] = gettime();
        return 0;
    }
    if (!isdefined(attacker.var_d292d803.downs[victim.entnum])) {
        attacker.var_d292d803.downs[victim.entnum] = [];
    } else if (!isarray(attacker.var_d292d803.downs[victim.entnum])) {
        attacker.var_d292d803.downs[victim.entnum] = array(attacker.var_d292d803.downs[victim.entnum]);
    }
    attacker.var_d292d803.downs[victim.entnum][attacker.var_d292d803.downs[victim.entnum].size] = gettime();
    numdowns = attacker.var_d292d803.downs[victim.entnum].size;
    if (numdowns < level.var_57e7d5a) {
        return 0;
    }
    var_1053d9e9 = attacker.var_d292d803.downs[victim.entnum][numdowns - 1];
    var_6ab74732 = attacker.var_d292d803.downs[victim.entnum][numdowns - level.var_57e7d5a];
    if (var_1053d9e9 - var_6ab74732 <= int(60 * 1000)) {
        attacker.var_d292d803.cheating = 1;
        attacker.var_d292d803.downs = undefined;
        attacker.var_d292d803.revives = undefined;
    }
    return attacker is_cheating();
}

// Namespace laststand_mp/laststand
// Params 2, eflags: 0x0
// Checksum 0x25394226, Offset: 0x5f18
// Size: 0x46a
function function_7e980623(reviver, victim) {
    if (!isdefined(level.var_b5087de4) || level.var_b5087de4 == 0) {
        return 0;
    }
    if (!isdefined(reviver.var_d292d803)) {
        reviver function_b394486e();
    } else if (reviver is_cheating()) {
        return 1;
    }
    if (!isdefined(reviver.var_d292d803.revives[victim.entnum])) {
        reviver.var_d292d803.revives[victim.entnum] = array();
        if (!isdefined(reviver.var_d292d803.revives[victim.entnum])) {
            reviver.var_d292d803.revives[victim.entnum] = [];
        } else if (!isarray(reviver.var_d292d803.revives[victim.entnum])) {
            reviver.var_d292d803.revives[victim.entnum] = array(reviver.var_d292d803.revives[victim.entnum]);
        }
        reviver.var_d292d803.revives[victim.entnum][reviver.var_d292d803.revives[victim.entnum].size] = gettime();
        return 0;
    }
    if (!isdefined(reviver.var_d292d803.revives[victim.entnum])) {
        reviver.var_d292d803.revives[victim.entnum] = [];
    } else if (!isarray(reviver.var_d292d803.revives[victim.entnum])) {
        reviver.var_d292d803.revives[victim.entnum] = array(reviver.var_d292d803.revives[victim.entnum]);
    }
    reviver.var_d292d803.revives[victim.entnum][reviver.var_d292d803.revives[victim.entnum].size] = gettime();
    numrevives = reviver.var_d292d803.revives[victim.entnum].size;
    if (numrevives < level.var_b5087de4) {
        return 0;
    }
    var_1053d9e9 = reviver.var_d292d803.revives[victim.entnum][numrevives - 1];
    var_6ab74732 = reviver.var_d292d803.revives[victim.entnum][numrevives - level.var_b5087de4];
    if (var_1053d9e9 - var_6ab74732 <= int(60 * 1000)) {
        reviver.var_d292d803.cheating = 1;
        reviver.var_d292d803.downs = undefined;
        reviver.var_d292d803.revives = undefined;
    }
    return reviver is_cheating();
}

