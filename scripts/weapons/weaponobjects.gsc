// Atian COD Tools GSC decompiler test
#using script_6b221588ece2c4aa;
#using scripts\weapons\trophy_system.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\placeables.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\entityheadicons_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace weaponobjects;

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x9f308fc4, Offset: 0x300
// Size: 0x224
function init_shared() {
    callback::on_start_gametype(&start_gametype);
    clientfield::register("toplayer", "proximity_alarm", 1, 3, "int");
    clientfield::register("clientuimodel", "hudItems.proximityAlarm", 1, 3, "int");
    clientfield::register("missile", "retrievable", 1, 1, "int");
    clientfield::register("scriptmover", "retrievable", 1, 1, "int");
    clientfield::register("missile", "enemyequip", 1, 2, "int");
    clientfield::register("scriptmover", "enemyequip", 1, 2, "int");
    clientfield::register("missile", "teamequip", 1, 1, "int");
    clientfield::register("missile", "friendlyequip", 1, 1, "int");
    clientfield::register("scriptmover", "friendlyequip", 1, 1, "int");
    level.weaponobjectdebug = getdvarint(#"scr_weaponobject_debug", 0);
    level.supplementalwatcherobjects = [];
    /#
        level thread updatedvars();
    #/
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x0
// Checksum 0x451fcf6c, Offset: 0x530
// Size: 0x44
function updatedvars() {
    while (1) {
        level.weaponobjectdebug = getdvarint(#"scr_weaponobject_debug", 0);
        wait(1);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x6043ae9e, Offset: 0x580
// Size: 0x2bc
function start_gametype() {
    callback::on_connect(&on_player_connect);
    callback::on_spawned(&on_player_spawned);
    callback::on_disconnect(&function_ac7c2bf9);
    callback::on_joined_team(&function_ac7c2bf9);
    callback::on_joined_spectate(&function_ac7c2bf9);
    if (!isdefined(level.retrievableweapons)) {
        level.retrievableweapons = [];
    }
    retrievables = getretrievableweapons();
    foreach (weapon in retrievables) {
        weaponstruct = spawnstruct();
        level.retrievableweapons[weapon.name] = weaponstruct;
    }
    level.weaponobjectexplodethisframe = 0;
    if (getdvarstring(#"scr_deleteexplosivesonspawn") == "") {
        setdvar(#"scr_deleteexplosivesonspawn", 1);
    }
    level.deleteexplosivesonspawn = getdvarint(#"scr_deleteexplosivesonspawn", 0);
    level._equipment_spark_fx = #"explosions/fx8_exp_equipment_lg";
    level._equipment_fizzleout_fx = #"explosions/fx8_exp_equipment_lg";
    level._equipment_emp_destroy_fx = #"killstreaks/fx_emp_explosion_equip";
    level._equipment_explode_fx = #"_t6/explosions/fx_exp_equipment";
    level._equipment_explode_fx_lg = #"explosions/fx8_exp_equipment_lg";
    level.weaponobjects_hacker_trigger_width = 32;
    level.weaponobjects_hacker_trigger_height = 32;
    function_db765b94();
    function_b455d5d8();
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x49c7e1aa, Offset: 0x848
// Size: 0x4e
function on_player_connect() {
    if (isdefined(level._weaponobjects_on_player_connect_override)) {
        level thread [[ level._weaponobjects_on_player_connect_override ]]();
        return;
    }
    self.usedweapons = 0;
    self.hits = 0;
    self.var_2641e022 = 0;
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x4cf7c0ca, Offset: 0x8a0
// Size: 0xcc
function on_player_spawned() {
    self endon(#"disconnect");
    pixbeginevent(#"onplayerspawned");
    if (!isdefined(self.weaponobjectwatcherarray)) {
        self.weaponobjectwatcherarray = [];
    }
    self thread watchweaponobjectspawn();
    self callback::on_detonate(&on_detonate);
    self callback::on_double_tap_detonate(&on_double_tap_detonate);
    self trophy_system::ammo_reset();
    pixendevent();
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0xd32c3531, Offset: 0x978
// Size: 0x106
function function_e6400478(name, func, var_8411d55d) {
    if (!isdefined(level.watcherregisters)) {
        level.watcherregisters = [];
    }
    if (isdefined(name)) {
        struct = level.watcherregisters[name];
        if (isdefined(struct)) {
            if (isdefined(var_8411d55d) && var_8411d55d != 2) {
                struct.func = func;
                struct.var_8411d55d = var_8411d55d;
                level.watcherregisters[name] = struct;
            }
        } else {
            struct = spawnstruct();
            struct.func = func;
            struct.type = var_8411d55d;
            level.watcherregisters[name] = struct;
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0xf304c4d5, Offset: 0xa88
// Size: 0x62
function function_dcc8b5d5(name, var_80e51919, var_7bd83b52) {
    struct = level.watcherregisters[name];
    if (!isdefined(struct)) {
        return;
    }
    struct.var_80e51919 = var_80e51919;
    struct.var_7bd83b52 = var_7bd83b52;
}

// Namespace weaponobjects/player_loadoutchanged
// Params 1, eflags: 0x40
// Checksum 0xa90a1e47, Offset: 0xaf8
// Size: 0x7a
function event_handler[player_loadoutchanged] loadout_changed(eventstruct) {
    switch (eventstruct.event) {
    case #"give_weapon":
    case #"give_weapon_dual":
        weapon = eventstruct.weapon;
        self snipinterfaceattributes(weapon);
        break;
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x5 linked
// Checksum 0xb3fb4024, Offset: 0xb80
// Size: 0x164
function private snipinterfaceattributes(weapon) {
    if (isdefined(level.watcherregisters)) {
        struct = level.watcherregisters[weapon.name];
        if (isdefined(struct)) {
            self createwatcher(weapon.name, struct.func, struct.type);
            if (isdefined(struct.var_80e51919) && isdefined(struct.var_7bd83b52)) {
                if (weaponhasattachment(weapon, struct.var_80e51919)) {
                    other_weapon = getweapon(struct.var_7bd83b52);
                    if (isdefined(other_weapon) && other_weapon != level.weaponnone) {
                        self snipinterfaceattributes(other_weapon);
                    }
                }
            }
        }
        if (weapon.ischargeshot && weapon.nextchargelevelweapon != level.weaponnone) {
            self snipinterfaceattributes(weapon.nextchargelevelweapon);
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0xf01958f, Offset: 0xcf0
// Size: 0x148
function createwatcher(weaponname, createfunc, var_7b2908f = 2) {
    watcher = undefined;
    switch (var_7b2908f) {
    case 0:
        watcher = self createproximityweaponobjectwatcher(weaponname, self.team);
        break;
    case 1:
        watcher = self createuseweaponobjectwatcher(weaponname, self.team);
        break;
    default:
        watcher = self createweaponobjectwatcher(weaponname, self.team);
        break;
    }
    if (isdefined(createfunc)) {
        self [[ createfunc ]](watcher);
    }
    retrievable = level.retrievableweapons[weaponname];
    if (isdefined(retrievable)) {
        setupretrievablewatcher(watcher);
    }
    return watcher;
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x5 linked
// Checksum 0x7e26769d, Offset: 0xe40
// Size: 0x110
function private function_db765b94() {
    watcherweapons = getwatcherweapons();
    foreach (weapon in watcherweapons) {
        function_e6400478(weapon.name);
    }
    foreach (name, struct in level.retrievableweapons) {
        function_e6400478(name);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x5 linked
// Checksum 0x98ec09a0, Offset: 0xf58
// Size: 0x86
function private setupretrievablewatcher(watcher) {
    if (!isdefined(watcher.onspawnretrievetriggers)) {
        watcher.onspawnretrievetriggers = &function_23b0aea9;
    }
    if (!isdefined(watcher.ondestroyed)) {
        watcher.ondestroyed = &ondestroyed;
    }
    if (!isdefined(watcher.pickup)) {
        watcher.pickup = &function_db70257;
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x54814074, Offset: 0xfe8
// Size: 0x64
function function_db70257(player, heldweapon) {
    if (heldweapon.var_7d4c12af == "Automatic") {
        return function_d9219ce2(player, heldweapon);
    } else {
        return function_a6616b9c(player, heldweapon);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x0
// Checksum 0x3f6d553d, Offset: 0x1058
// Size: 0x14
function voidonspawn(unused0, unused1) {
    
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xed86c437, Offset: 0x1078
// Size: 0xc
function voidondamage(unused0) {
    
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xd645dd8a, Offset: 0x1090
// Size: 0x14
function voidonspawnretrievetriggers(unused0, unused1) {
    
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x29c415c, Offset: 0x10b0
// Size: 0x14
function voidpickup(unused0, unused1) {
    
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0xda9b8dfe, Offset: 0x10d0
// Size: 0x34
function deleteent(attacker, emp, target) {
    self delete();
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x0
// Checksum 0x86031cc1, Offset: 0x1110
// Size: 0x5c
function clearfxondeath(fx) {
    fx endon(#"death");
    self waittill(#"death", #"hacked");
    fx delete();
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x638ba177, Offset: 0x1178
// Size: 0x84
function deleteweaponobjectinstance() {
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.minemover)) {
        if (isdefined(self.minemover.killcament)) {
            self.minemover.killcament delete();
        }
        self.minemover delete();
    }
    self delete();
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0xb47504a5, Offset: 0x1208
// Size: 0x92
function deleteweaponobjectarray() {
    if (isdefined(self.objectarray)) {
        foreach (weaponobject in self.objectarray) {
            weaponobject deleteweaponobjectinstance();
        }
    }
    self.objectarray = [];
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x8086895a, Offset: 0x12a8
// Size: 0x16c
function weapondetonate(attacker, weapon) {
    if (isdefined(weapon) && weapon.isemp) {
        self delete();
        return;
    }
    if (isdefined(attacker)) {
        if (isdefined(self.owner) && attacker != self.owner) {
            self.playdialog = 1;
        }
        if (isplayer(attacker)) {
            self detonate(attacker);
        } else {
            self detonate();
        }
    } else if (isdefined(self.owner) && isplayer(self.owner)) {
        self.playdialog = 0;
        self detonate(self.owner);
    } else {
        self detonate();
    }
    if (isdefined(self.owner) && isplayer(self.owner)) {
        self setstate(4);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 4, eflags: 0x1 linked
// Checksum 0xff84b229, Offset: 0x1420
// Size: 0xc4
function detonatewhenstationary(object, delay, attacker, weapon) {
    level endon(#"game_ended");
    object endon(#"death", #"hacked", #"detonating");
    if (object isonground() == 0) {
        object waittill(#"stationary");
    }
    self thread waitanddetonate(object, delay, attacker, weapon);
}

// Namespace weaponobjects/weaponobjects
// Params 4, eflags: 0x1 linked
// Checksum 0xcba7ab81, Offset: 0x14f0
// Size: 0x434
function waitanddetonate(object, delay, attacker, weapon) {
    object endon(#"death", #"hacked");
    if (!isdefined(attacker) && !isdefined(weapon) && object.weapon.proximityalarmactivationdelay > 0) {
        if (isdefined(object.armed_detonation_wait) && object.armed_detonation_wait) {
            return;
        }
        object.armed_detonation_wait = 1;
        while (!(isdefined(object.proximity_deployed) && object.proximity_deployed)) {
            waitframe(1);
        }
    }
    if (isdefined(object.detonated) && object.detonated) {
        return;
    }
    object.detonated = 1;
    object notify(#"detonating");
    isempdetonated = isdefined(weapon) && weapon.isemp;
    if (isempdetonated && object.weapon.doempdestroyfx) {
        object.stun_fx = 1;
        randangle = randomfloat(360);
        playfx(level._equipment_emp_destroy_fx, object.origin + vectorscale((0, 0, 1), 5), (cos(randangle), sin(randangle), 0), anglestoup(object.angles));
        empfxdelay = 1.1;
    }
    if (isdefined(object.var_cea6a2fb)) {
        object.var_cea6a2fb placeables::forceshutdown();
    }
    if (!isdefined(self.ondetonatecallback)) {
        return;
    }
    if (!isempdetonated && !isdefined(weapon)) {
        if (isdefined(self.detonationdelay) && self.detonationdelay > 0) {
            if (isdefined(self.detonationsound)) {
                object playsound(self.detonationsound);
            }
            delay = self.detonationdelay;
        }
    } else if (isdefined(empfxdelay)) {
        delay = empfxdelay;
    }
    if (delay > 0) {
        wait(delay);
    }
    if (isdefined(attacker) && isplayer(attacker) && isdefined(attacker.pers[#"team"]) && isdefined(object.owner) && isdefined(object.owner.pers) && isdefined(object.owner.pers[#"team"])) {
        if (level.teambased) {
            if (util::function_fbce7263(attacker.pers[#"team"], object.owner.pers[#"team"])) {
                attacker notify(#"destroyed_explosive");
            }
        } else if (attacker != object.owner) {
            attacker notify(#"destroyed_explosive");
        }
    }
    object [[ self.ondetonatecallback ]](attacker, weapon, undefined);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xa30f1a95, Offset: 0x1930
// Size: 0xf8
function waitandfizzleout(object, delay) {
    object endon(#"death", #"hacked");
    if (isdefined(object.detonated) && object.detonated == 1) {
        return;
    }
    object.detonated = 1;
    object notify(#"fizzleout");
    if (delay > 0) {
        wait(delay);
    }
    if (isdefined(object.var_cea6a2fb)) {
        object.var_cea6a2fb placeables::forceshutdown();
    }
    if (!isdefined(self.onfizzleout)) {
        object deleteent();
        return;
    }
    object [[ self.onfizzleout ]]();
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x4addc6a, Offset: 0x1a30
// Size: 0x232
function detonateweaponobjectarray(forcedetonation, weapon) {
    undetonated = [];
    if (isdefined(self.objectarray)) {
        for (i = 0; i < self.objectarray.size; i++) {
            if (isdefined(self.objectarray[i])) {
                if (self.objectarray[i] isstunned() && forcedetonation == 0) {
                    undetonated[undetonated.size] = self.objectarray[i];
                } else if (isdefined(weapon)) {
                    if (weapon util::ishacked() && weapon.name != self.objectarray[i].weapon.name) {
                        undetonated[undetonated.size] = self.objectarray[i];
                        continue;
                    }
                    jumpiffalse(self.objectarray[i] util::ishacked() && weapon.name != self.objectarray[i].weapon.name) LOC_00000194;
                    undetonated[undetonated.size] = self.objectarray[i];
                } else if (isdefined(self.detonatestationary) && self.detonatestationary && forcedetonation == 0) {
                    self thread detonatewhenstationary(self.objectarray[i], 0, undefined, weapon);
                } else {
                    self thread waitanddetonate(self.objectarray[i], 0, undefined, weapon);
                }
            }
        }
    }
    self.objectarray = undetonated;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x0
// Checksum 0xf00a66bc, Offset: 0x1c70
// Size: 0x7c
function addweaponobjecttowatcher(watchername, weapon_instance) {
    watcher = getweaponobjectwatcher(watchername);
    /#
        assert(isdefined(watcher), "<unknown string>" + watchername + "<unknown string>");
    #/
    self addweaponobject(watcher, weapon_instance);
}

// Namespace weaponobjects/weaponobjects
// Params 4, eflags: 0x1 linked
// Checksum 0x53cd7943, Offset: 0x1cf8
// Size: 0x32c
function addweaponobject(watcher, weapon_instance, weapon, endonnotify) {
    if (!isdefined(weapon_instance)) {
        return;
    }
    if (!isdefined(watcher.storedifferentobject)) {
        watcher.objectarray[watcher.objectarray.size] = weapon_instance;
    }
    if (!isdefined(weapon)) {
        weapon = watcher.weapon;
    }
    weapon_instance.owner = self;
    weapon_instance.detonated = 0;
    weapon_instance.weapon = weapon;
    if (isdefined(watcher.ondamage)) {
        weapon_instance thread [[ watcher.ondamage ]](watcher);
    } else {
        weapon_instance thread weaponobjectdamage(watcher);
    }
    weapon_instance.ownergetsassist = watcher.ownergetsassist;
    weapon_instance.destroyedbyemp = watcher.destroyedbyemp;
    if (isdefined(watcher.onspawn)) {
        weapon_instance thread [[ watcher.onspawn ]](watcher, self);
    }
    if (isdefined(watcher.onspawnfx)) {
        weapon_instance thread [[ watcher.onspawnfx ]]();
    }
    weapon_instance thread setupreconeffect();
    if (isdefined(watcher.onspawnretrievetriggers)) {
        weapon_instance thread [[ watcher.onspawnretrievetriggers ]](watcher, self);
    }
    if (watcher.hackable) {
        weapon_instance thread hackerinit(watcher);
    }
    if (watcher.playdestroyeddialog) {
        weapon_instance thread playdialogondeath(self);
        weapon_instance thread watchobjectdamage(self);
    }
    if (watcher.deleteonkillbrush) {
        if (isdefined(level.deleteonkillbrushoverride)) {
            weapon_instance thread [[ level.deleteonkillbrushoverride ]](self, watcher);
        } else {
            weapon_instance thread deleteonkillbrush(self);
        }
    }
    if (weapon_instance useteamequipmentclientfield(watcher)) {
        weapon_instance clientfield::set("teamequip", 1);
    }
    if (watcher.timeout) {
        weapon_instance thread weapon_object_timeout(watcher, undefined);
    }
    if (isdefined(watcher.var_994b472b)) {
        weapon_instance thread function_6d8aa6a0(self, watcher);
    }
    weapon_instance thread delete_on_notify(self, endonnotify);
    weapon_instance thread cleanupwatcherondeath(watcher);
    weapon_instance thread function_b9ade2b();
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xda8c13e4, Offset: 0x2030
// Size: 0xa4
function function_6d8aa6a0(player, watcher) {
    self endon(#"death", #"hacked");
    player waittill(#"joined_team", #"joined_spectators", #"disconnect", #"changed_specialist", #"changed_specialist_death");
    self [[ watcher.var_994b472b ]](player);
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x19030a7c, Offset: 0x20e0
// Size: 0x64
function function_b9ade2b() {
    weapon_instance = self;
    weapon_instance endon(#"death");
    weapon_instance waittill(#"picked_up");
    weapon_instance.playdialog = 0;
    weapon_instance destroyent();
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x87586c0, Offset: 0x2150
// Size: 0x94
function cleanupwatcherondeath(watcher) {
    weapon_instance = self;
    weapon_instance waittill(#"death");
    if (isdefined(watcher) && isdefined(watcher.objectarray)) {
        removeweaponobject(watcher, weapon_instance);
    }
    if (isdefined(weapon_instance) && weapon_instance.delete_on_death === 1) {
        weapon_instance deleteweaponobjectinstance();
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xcaa20a78, Offset: 0x21f0
// Size: 0xc4
function weapon_object_timeout(watcher, var_84e5ee08) {
    weapon_instance = self;
    weapon_instance endon(#"death", #"cancel_timeout");
    var_754e514 = isdefined(var_84e5ee08) ? var_84e5ee08 : watcher.timeout;
    wait(var_754e514);
    if (isdefined(watcher) && isdefined(watcher.ontimeout)) {
        weapon_instance thread [[ watcher.ontimeout ]]();
    } else {
        weapon_instance deleteent();
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xbfc69ecd, Offset: 0x22c0
// Size: 0xcc
function delete_on_notify(e_player, endonnotify = undefined) {
    weapon_instance = self;
    if (isdefined(endonnotify)) {
        e_player endon(endonnotify);
    }
    e_player endon(#"disconnect");
    if (isai(e_player)) {
        e_player endon(#"death");
    }
    weapon_instance endon(#"death");
    e_player waittill(#"delete_weapon_objects");
    weapon_instance delete();
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x69f76717, Offset: 0x2398
// Size: 0x54
function removeweaponobject(watcher, weapon_instance) {
    watcher.objectarray = array::remove_undefined(watcher.objectarray);
    arrayremovevalue(watcher.objectarray, weapon_instance);
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xca0a7cf1, Offset: 0x23f8
// Size: 0x2e
function cleanweaponobjectarray(watcher) {
    watcher.objectarray = array::remove_undefined(watcher.objectarray);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xa26a82fe, Offset: 0x2430
// Size: 0x74
function weapon_object_do_damagefeedback(weapon, attacker) {
    if (isdefined(weapon) && isdefined(attacker)) {
        if (damage::friendlyfirecheck(self.owner, attacker)) {
            if (damagefeedback::dodamagefeedback(weapon, attacker)) {
                attacker damagefeedback::update();
            }
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x4dafacb2, Offset: 0x24b0
// Size: 0x49c
function weaponobjectdamage(watcher) {
    self endon(#"death", #"hacked", #"detonating");
    self setcandamage(1);
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    self.damagetaken = 0;
    attacker = undefined;
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"damage");
        attacker = waitresult.attacker;
        weapon = waitresult.weapon;
        damage = waitresult.amount;
        type = waitresult.mod;
        idflags = waitresult.flags;
        damage = weapons::function_74bbb3fa(damage, weapon, self.weapon);
        self.damagetaken = self.damagetaken + damage;
        if (!isplayer(attacker) && isdefined(attacker.owner)) {
            attacker = attacker.owner;
        }
        if (isdefined(weapon)) {
            self weapon_object_do_damagefeedback(weapon, attacker);
            if (watcher.stuntime > 0 && weapon.dostun) {
                self thread stunstart(watcher, watcher.stuntime);
                continue;
            }
        }
        if (!level.weaponobjectdebug && level.teambased && isplayer(attacker) && isdefined(self.owner)) {
            if (!level.hardcoremode && !util::function_fbce7263(self.owner.team, attacker.pers[#"team"]) && self.owner != attacker) {
                continue;
            }
        }
        if (isdefined(watcher.var_34400f36) && !self [[ watcher.var_34400f36 ]](watcher, attacker, weapon, damage)) {
            continue;
        }
        if (!isvehicle(self) && !damage::friendlyfirecheck(self.owner, attacker)) {
            continue;
        }
        break;
    }
    if (level.weaponobjectexplodethisframe) {
        wait(0.1 + randomfloat(0.4));
    } else {
        waitframe(1);
    }
    if (!isdefined(self)) {
        return;
    }
    level.weaponobjectexplodethisframe = 1;
    thread resetweaponobjectexplodethisframe();
    self entityheadicons::setentityheadicon("none");
    if (isdefined(type) && (issubstr(type, "MOD_GRENADE_SPLASH") || issubstr(type, "MOD_GRENADE") || issubstr(type, "MOD_EXPLOSIVE"))) {
        self.waschained = 1;
    }
    if (isdefined(idflags) && idflags & 8) {
        self.wasdamagedfrombulletpenetration = 1;
    }
    self.wasdamaged = 1;
    watcher thread waitanddetonate(self, 0, attacker, weapon);
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x3c3977be, Offset: 0x2958
// Size: 0x90
function playdialogondeath(owner) {
    owner endon(#"death");
    self endon(#"hacked");
    self waittill(#"death");
    if (isdefined(self.playdialog) && self.playdialog) {
        if (isdefined(owner) && isdefined(level.playequipmentdestroyedonplayer)) {
            owner [[ level.playequipmentdestroyedonplayer ]]();
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x138136ed, Offset: 0x29f0
// Size: 0xd6
function watchobjectdamage(owner) {
    owner endon(#"death");
    self endon(#"hacked", #"death");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"damage");
        if (isdefined(waitresult.attacker) && isplayer(waitresult.attacker) && waitresult.attacker != owner) {
            self.playdialog = 1;
        } else {
            self.playdialog = 0;
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xa55271e8, Offset: 0x2ad0
// Size: 0x134
function stunstart(watcher, time) {
    self endon(#"death");
    if (self isstunned()) {
        return;
    }
    if (isdefined(self.camerahead)) {
    }
    if (isdefined(watcher.onstun)) {
        self thread [[ watcher.onstun ]]();
    }
    if (watcher.name == "rcbomb") {
        self.owner val::set(#"weaponobjects", "freezecontrols", 1);
    }
    if (isdefined(time)) {
        wait(time);
    } else {
        return;
    }
    if (watcher.name == "rcbomb") {
        self.owner val::reset(#"weaponobjects", "freezecontrols");
    }
    self stunstop();
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x7b38edac, Offset: 0x2c10
// Size: 0x24
function stunstop() {
    self notify(#"not_stunned");
    if (isdefined(self.camerahead)) {
    }
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x25d8e5b3, Offset: 0x2c40
// Size: 0x10c
function weaponstun() {
    self endon(#"death", #"not_stunned");
    origin = self gettagorigin("tag_fx");
    if (!isdefined(origin)) {
        origin = self.origin + vectorscale((0, 0, 1), 10);
    }
    self.stun_fx = spawn("script_model", origin);
    self.stun_fx setmodel(#"tag_origin");
    self thread stunfxthink(self.stun_fx);
    wait(0.1);
    playfxontag(level._equipment_spark_fx, self.stun_fx, "tag_origin");
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x1b83ad40, Offset: 0x2d58
// Size: 0x5c
function stunfxthink(fx) {
    fx endon(#"death");
    self waittill(#"death", #"not_stunned");
    fx delete();
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0xd545d586, Offset: 0x2dc0
// Size: 0xc
function isstunned() {
    return isdefined(self.stun_fx);
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x738866ba, Offset: 0x2dd8
// Size: 0x4c
function weaponobjectfizzleout() {
    self endon(#"death");
    playfx(level._equipment_fizzleout_fx, self.origin);
    deleteent();
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x9ef4d572, Offset: 0x2e30
// Size: 0xc4
function function_f245df1e() {
    self endon(#"death");
    randangle = randomfloat(360);
    playfx(level._equipment_emp_destroy_fx, self.origin + vectorscale((0, 0, 1), 5), (cos(randangle), sin(randangle), 0), anglestoup(self.angles));
    wait(1.1);
    deleteent();
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xf693d337, Offset: 0x2f00
// Size: 0x94
function function_127fb8f3(var_983dc34, attackingplayer) {
    if (isdefined(var_983dc34) && isdefined(var_983dc34.var_2d045452)) {
        var_983dc34.var_2d045452 thread waitanddetonate(var_983dc34, 0.05, attackingplayer, getweapon(#"eq_emp_grenade"));
    } else {
        var_983dc34 function_f245df1e();
    }
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x638760c8, Offset: 0x2fa0
// Size: 0x16
function resetweaponobjectexplodethisframe() {
    waitframe(1);
    level.weaponobjectexplodethisframe = 0;
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xcd352827, Offset: 0x2fc0
// Size: 0xb6
function getweaponobjectwatcher(name) {
    if (!isdefined(self.weaponobjectwatcherarray) || !isdefined(name)) {
        return undefined;
    }
    for (watcher = 0; watcher < self.weaponobjectwatcherarray.size; watcher++) {
        if (self.weaponobjectwatcherarray[watcher].name == name || isdefined(self.weaponobjectwatcherarray[watcher].altname) && self.weaponobjectwatcherarray[watcher].altname == name) {
            return self.weaponobjectwatcherarray[watcher];
        }
    }
    return undefined;
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xdcdefcd6, Offset: 0x3080
// Size: 0xfa
function getweaponobjectwatcherbyweapon(weapon) {
    if (!isdefined(self.weaponobjectwatcherarray)) {
        return undefined;
    }
    for (watcher = 0; watcher < self.weaponobjectwatcherarray.size; watcher++) {
        if (isdefined(self.weaponobjectwatcherarray[watcher].weapon)) {
            if (self.weaponobjectwatcherarray[watcher].weapon == weapon || self.weaponobjectwatcherarray[watcher].weapon == weapon.rootweapon) {
                return self.weaponobjectwatcherarray[watcher];
            }
            if (isdefined(self.weaponobjectwatcherarray[watcher].altweapon) && self.weaponobjectwatcherarray[watcher].altweapon == weapon) {
                return self.weaponobjectwatcherarray[watcher];
            }
        }
    }
    return undefined;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x3abf4f29, Offset: 0x3188
// Size: 0x8a
function resetweaponobjectwatcher(watcher, ownerteam) {
    if (watcher.deleteonplayerspawn == 1 || isdefined(watcher.ownerteam) && watcher.ownerteam != ownerteam) {
        self notify(#"weapon_object_destroyed");
        watcher deleteweaponobjectarray();
    }
    watcher.ownerteam = ownerteam;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x5 linked
// Checksum 0xaac91241, Offset: 0x3220
// Size: 0x358
function private createweaponobjectwatcher(weaponname, ownerteam) {
    if (!isdefined(self.weaponobjectwatcherarray)) {
        self.weaponobjectwatcherarray = [];
    }
    weaponobjectwatcher = getweaponobjectwatcher(weaponname);
    if (!isdefined(weaponobjectwatcher)) {
        weaponobjectwatcher = spawnstruct();
        self.weaponobjectwatcherarray[self.weaponobjectwatcherarray.size] = weaponobjectwatcher;
        weaponobjectwatcher.name = weaponname;
        weaponobjectwatcher.type = "use";
        weaponobjectwatcher.weapon = getweapon(weaponname);
        weaponobjectwatcher.watchforfire = 0;
        weaponobjectwatcher.hackable = 0;
        weaponobjectwatcher.altdetonate = 0;
        weaponobjectwatcher.detectable = 1;
        weaponobjectwatcher.stuntime = 0;
        weaponobjectwatcher.timeout = getweapon(weaponname).lifetime;
        weaponobjectwatcher.destroyedbyemp = 1;
        weaponobjectwatcher.activatesound = undefined;
        weaponobjectwatcher.ignoredirection = undefined;
        weaponobjectwatcher.immediatedetonation = undefined;
        weaponobjectwatcher.deploysound = weaponobjectwatcher.weapon.firesound;
        weaponobjectwatcher.deploysoundplayer = weaponobjectwatcher.weapon.firesoundplayer;
        weaponobjectwatcher.pickupsound = weaponobjectwatcher.weapon.pickupsound;
        weaponobjectwatcher.pickupsoundplayer = weaponobjectwatcher.weapon.pickupsoundplayer;
        weaponobjectwatcher.altweapon = weaponobjectwatcher.weapon.altweapon;
        weaponobjectwatcher.ownergetsassist = 0;
        weaponobjectwatcher.playdestroyeddialog = 1;
        weaponobjectwatcher.deleteonkillbrush = 1;
        weaponobjectwatcher.deleteondifferentobjectspawn = 1;
        weaponobjectwatcher.enemydestroy = 0;
        weaponobjectwatcher.deleteonplayerspawn = level.deleteexplosivesonspawn;
        weaponobjectwatcher.ignorevehicles = 0;
        weaponobjectwatcher.ignoreai = 0;
        weaponobjectwatcher.activationdelay = 0;
        weaponobjectwatcher.onspawn = undefined;
        weaponobjectwatcher.onspawnfx = undefined;
        weaponobjectwatcher.onspawnretrievetriggers = undefined;
        weaponobjectwatcher.ondetonatecallback = undefined;
        weaponobjectwatcher.onstun = undefined;
        weaponobjectwatcher.onstunfinished = undefined;
        weaponobjectwatcher.ondestroyed = undefined;
        weaponobjectwatcher.onfizzleout = &weaponobjectfizzleout;
        weaponobjectwatcher.var_34400f36 = undefined;
        weaponobjectwatcher.onsupplementaldetonatecallback = undefined;
        weaponobjectwatcher.ontimeout = undefined;
        weaponobjectwatcher.var_994b472b = undefined;
        if (!isdefined(weaponobjectwatcher.objectarray)) {
            weaponobjectwatcher.objectarray = [];
        }
    }
    resetweaponobjectwatcher(weaponobjectwatcher, ownerteam);
    return weaponobjectwatcher;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x5 linked
// Checksum 0x2469367f, Offset: 0x3580
// Size: 0x6a
function private createuseweaponobjectwatcher(weaponname, ownerteam) {
    weaponobjectwatcher = createweaponobjectwatcher(weaponname, ownerteam);
    weaponobjectwatcher.type = "use";
    weaponobjectwatcher.onspawn = &onspawnuseweaponobject;
    return weaponobjectwatcher;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x5 linked
// Checksum 0xebafc7bc, Offset: 0x35f8
// Size: 0x14a
function private createproximityweaponobjectwatcher(weaponname, ownerteam) {
    weaponobjectwatcher = createweaponobjectwatcher(weaponname, ownerteam);
    weaponobjectwatcher.type = "proximity";
    weaponobjectwatcher.onspawn = &onspawnproximityweaponobject;
    detectionconeangle = getdvarint(#"scr_weaponobject_coneangle", 70);
    weaponobjectwatcher.detectiondot = cos(detectionconeangle);
    weaponobjectwatcher.detectionmindist = getdvarint(#"scr_weaponobject_mindist", 20);
    weaponobjectwatcher.detectiongraceperiod = getdvarfloat(#"scr_weaponobject_graceperiod", 0.6);
    weaponobjectwatcher.detonateradius = getdvarint(#"scr_weaponobject_radius", 180);
    return weaponobjectwatcher;
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x9c65708e, Offset: 0x3750
// Size: 0x2c
function wasproximityalarmactivatedbyself() {
    return isdefined(self.owner.var_4cd6885) && self.owner.var_4cd6885 == self;
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0x18d6f45d, Offset: 0x3788
// Size: 0x1e4
function proximityalarmactivate(active, watcher, var_af12fba0 = undefined) {
    if (!isplayer(self.owner)) {
        return;
    }
    var_9292c6b5 = watcher.var_82aa8ec4 === 1;
    if (active && !isdefined(self.owner.var_4cd6885)) {
        self.owner.var_4cd6885 = self;
        state = var_9292c6b5 ? 3 : 2;
        self setstate(state);
    } else if (!isdefined(self) || self wasproximityalarmactivatedbyself() || !var_9292c6b5 && self.owner clientfield::get_to_player("proximity_alarm") == 1) {
        self.owner.var_4cd6885 = undefined;
        state = 0;
        if (var_9292c6b5) {
            curstate = self.owner clientfield::get_to_player("proximity_alarm");
            switch (curstate) {
            case 4:
            case 5:
                state = curstate;
                break;
            default:
                state = 2;
                break;
            }
        }
        self setstate(state);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x23b31111, Offset: 0x3978
// Size: 0x118
function setstate(newstate) {
    player = self.owner;
    if (!isplayer(player)) {
        return;
    }
    curstate = player clientfield::get_to_player("proximity_alarm");
    if (curstate != newstate) {
        player clientfield::set_to_player("proximity_alarm", newstate);
        player clientfield::set_player_uimodel("hudItems.proximityAlarm", newstate);
        watcher = player getweaponobjectwatcherbyweapon(self.weapon);
        if (isdefined(watcher) && isdefined(watcher.var_cfc18899)) {
            self [[ watcher.var_cfc18899 ]](curstate, newstate, player.var_4cd6885);
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xd4ca78d5, Offset: 0x3a98
// Size: 0x6f6
function proximityalarmloop(watcher, owner) {
    level endon(#"game_ended");
    self endon(#"death", #"hacked", #"detonating");
    if (self.weapon.proximityalarminnerradius <= 0) {
        return;
    }
    self util::waittillnotmoving();
    var_9292c6b5 = watcher.var_82aa8ec4 === 1;
    if (var_9292c6b5 && !(isdefined(self.owner._disable_proximity_alarms) && self.owner._disable_proximity_alarms)) {
        curstate = self.owner clientfield::get_to_player("proximity_alarm");
        if (curstate != 5) {
            self setstate(1);
        }
    }
    delaytimesec = float(self.weapon.proximityalarmactivationdelay) / 1000;
    if (delaytimesec > 0) {
        wait(delaytimesec);
        if (!isdefined(self)) {
            return;
        }
    }
    if (!(isdefined(self.owner._disable_proximity_alarms) && self.owner._disable_proximity_alarms)) {
        state = var_9292c6b5 ? 2 : 1;
        self setstate(state);
    }
    self.proximity_deployed = 1;
    alarmstatusold = "notify";
    alarmstatus = "off";
    var_af12fba0 = undefined;
    while (1) {
        wait(0.05);
        if (!isdefined(self.owner) || !isplayer(self.owner)) {
            return;
        }
        if (isalive(self.owner) == 0 && self.owner util::isusingremote() == 0) {
            self proximityalarmactivate(0, watcher);
            return;
        }
        if (isdefined(self.owner._disable_proximity_alarms) && self.owner._disable_proximity_alarms) {
            self proximityalarmactivate(0, watcher);
        } else if (alarmstatus != alarmstatusold || alarmstatus == "on" && !isdefined(self.owner.var_4cd6885)) {
            if (alarmstatus == "on") {
                self proximityalarmactivate(1, watcher, var_af12fba0);
            } else {
                self proximityalarmactivate(0, watcher);
            }
            alarmstatusold = alarmstatus;
        }
        alarmstatus = "off";
        var_af12fba0 = undefined;
        actors = getactorarray();
        players = getplayers();
        detectentities = arraycombine(players, actors, 0, 0);
        foreach (entity in detectentities) {
            wait(0.05);
            if (!isdefined(entity)) {
                continue;
            }
            owner = entity;
            if (isactor(entity) && (!isdefined(entity.isaiclone) || !entity.isaiclone)) {
                continue;
            } else if (isactor(entity)) {
                owner = entity.owner;
            }
            if (entity.team == #"spectator") {
                continue;
            }
            if (level.weaponobjectdebug != 1) {
                if (owner hasperk(#"specialty_detectexplosive")) {
                    continue;
                }
                if (isdefined(self.owner) && owner == self.owner) {
                    continue;
                }
                jumpiftrue(damage::friendlyfirecheck(self.owner, owner, 0)) LOC_000005a0;
            } else {
            LOC_000005a0:
                if (self isstunned()) {
                    continue;
                }
                if (!isalive(entity)) {
                    continue;
                }
                if (isdefined(watcher.immunespecialty) && owner hasperk(watcher.immunespecialty)) {
                    continue;
                }
                radius = self.weapon.proximityalarmouterradius;
                distancesqr = distancesquared(self.origin, entity.origin);
                if (radius * radius < distancesqr) {
                    continue;
                }
                if (entity damageconetrace(self.origin, self) == 0) {
                    continue;
                }
                if (alarmstatusold == "on") {
                    alarmstatus = "on";
                    break;
                }
                radius = self.weapon.proximityalarminnerradius;
                if (radius * radius < distancesqr) {
                    continue;
                }
                alarmstatus = "on";
                var_af12fba0 = entity;
                break;
            }
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x41de249d, Offset: 0x4198
// Size: 0x18c
function commononspawnuseweaponobjectproximityalarm(watcher, owner) {
    /#
        if (level.weaponobjectdebug == 1) {
            self thread proximityalarmweaponobjectdebug(watcher);
        }
    #/
    if (isdefined(watcher.var_82aa8ec4) && watcher.var_82aa8ec4) {
        curstate = self.owner clientfield::get_to_player("proximity_alarm");
        if (curstate != 5) {
            self setstate(0);
        }
    }
    self proximityalarmloop(watcher, owner);
    self proximityalarmactivate(0, watcher);
    if (isdefined(watcher.var_82aa8ec4) && watcher.var_82aa8ec4) {
        owner = self.owner;
        curstate = owner clientfield::get_to_player("proximity_alarm");
        if (curstate != 4 && curstate != 5) {
            owner clientfield::set_to_player("proximity_alarm", 0);
            owner clientfield::set_player_uimodel("hudItems.proximityAlarm", 0);
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xa7b100f7, Offset: 0x4330
// Size: 0x2c
function onspawnuseweaponobject(watcher, owner) {
    self thread commononspawnuseweaponobjectproximityalarm(watcher, owner);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x1b79d136, Offset: 0x4368
// Size: 0xac
function onspawnproximityweaponobject(watcher, owner) {
    self.protected_entities = [];
    if (isdefined(level._proximityweaponobjectdetonation_override)) {
        self thread [[ level._proximityweaponobjectdetonation_override ]](watcher);
    } else if (isdefined(self._proximityweaponobjectdetonation_override)) {
        self thread [[ self._proximityweaponobjectdetonation_override ]](watcher);
    } else {
        self thread proximityweaponobjectdetonation(watcher);
    }
    /#
        if (level.weaponobjectdebug == 1) {
            self thread proximityweaponobjectdebug(watcher);
        }
    #/
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x4420
// Size: 0x4
function watchweaponobjectusage() {
    
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xb23dc869, Offset: 0x4430
// Size: 0x310
function watchweaponobjectspawn(notify_type, endonnotify = undefined) {
    if (isdefined(endonnotify)) {
        self endon(endonnotify);
    }
    self endon(#"death");
    self notify(#"watchweaponobjectspawn");
    self endon(#"watchweaponobjectspawn", #"disconnect");
    while (1) {
        if (isdefined(notify_type)) {
            waitresult = undefined;
            waitresult = self waittill(notify_type);
        } else {
            waitresult = undefined;
            waitresult = self waittill(#"grenade_fire", #"grenade_launcher_fire", #"missile_fire", #"placeables_plant");
        }
        weapon_instance = waitresult.projectile;
        weapon = waitresult.weapon;
        if (isdefined(level.projectiles_should_ignore_world_pause) && level.projectiles_should_ignore_world_pause && isdefined(weapon_instance)) {
            weapon_instance setignorepauseworld(1);
        }
        if (isplayer(self) && weapon.setusedstat && !self util::ishacked()) {
            self stats::function_e24eec31(weapon, #"used", 1);
        }
        watcher = getweaponobjectwatcherbyweapon(weapon);
        if (isdefined(watcher)) {
            cleanweaponobjectarray(watcher);
            if (weapon.maxinstancesallowed) {
                if (watcher.objectarray.size > weapon.maxinstancesallowed - 1) {
                    watcher thread waitandfizzleout(watcher.objectarray[0], 0.1);
                    if (isdefined(watcher.var_82aa8ec4) && watcher.var_82aa8ec4) {
                        watcher.objectarray[0] setstate(5);
                    }
                    watcher.objectarray[0] = undefined;
                    cleanweaponobjectarray(watcher);
                }
            }
            self addweaponobject(watcher, weapon_instance, weapon, endonnotify);
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x35d4fa92, Offset: 0x4748
// Size: 0xa8
function anyobjectsinworld(weapon) {
    objectsinworld = 0;
    for (i = 0; i < self.weaponobjectwatcherarray.size; i++) {
        if (self.weaponobjectwatcherarray[i].weapon != weapon) {
            continue;
        }
        if (isdefined(self.weaponobjectwatcherarray[i].ondetonatecallback) && self.weaponobjectwatcherarray[i].objectarray.size > 0) {
            objectsinworld = 1;
            break;
        }
    }
    return objectsinworld;
}

// Namespace weaponobjects/weaponobjects
// Params 5, eflags: 0x0
// Checksum 0xab653a42, Offset: 0x47f8
// Size: 0xb6
function proximitysphere(origin, innerradius, incolor, outerradius, outcolor) {
    /#
        self endon(#"death");
        while (1) {
            if (isdefined(innerradius)) {
                dev::debug_sphere(origin, innerradius, incolor, 0.25, 1);
            }
            if (isdefined(outerradius)) {
                dev::debug_sphere(origin, outerradius, outcolor, 0.25, 1);
            }
            waitframe(1);
        }
    #/
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x0
// Checksum 0xda4033e4, Offset: 0x48b8
// Size: 0x94
function proximityalarmweaponobjectdebug(watcher) {
    /#
        self endon(#"death");
        self util::waittillnotmoving();
        if (!isdefined(self)) {
            return;
        }
        self thread proximitysphere(self.origin, self.weapon.proximityalarminnerradius, vectorscale((0, 1, 0), 0.75), self.weapon.proximityalarmouterradius, vectorscale((0, 1, 0), 0.75));
    #/
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x0
// Checksum 0xd32412aa, Offset: 0x4958
// Size: 0x104
function proximityweaponobjectdebug(watcher) {
    /#
        self endon(#"death");
        self util::waittillnotmoving();
        if (!isdefined(self)) {
            return;
        }
        if (isdefined(watcher.ignoredirection)) {
            self thread proximitysphere(self.origin, watcher.detonateradius, (1, 0.85, 0), self.weapon.explosionradius, (1, 0, 0));
        } else {
            self thread showcone(acos(watcher.detectiondot), watcher.detonateradius, (1, 0.85, 0));
            self thread showcone(60, 256, (1, 0, 0));
        }
    #/
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x0
// Checksum 0x10a6afae, Offset: 0x4a68
// Size: 0x208
function showcone(angle, range, color) {
    /#
        self endon(#"death");
        start = self.origin;
        forward = anglestoforward(self.angles);
        right = vectorcross(forward, (0, 0, 1));
        up = vectorcross(forward, right);
        fullforward = forward * range * cos(angle);
        sideamnt = range * sin(angle);
        while (1) {
            prevpoint = (0, 0, 0);
            for (i = 0; i <= 20; i++) {
                coneangle = i / 20 * 360;
                point = start + fullforward + sideamnt * (right * cos(coneangle) + up * sin(coneangle));
                if (i > 0) {
                    line(start, point, color);
                    line(prevpoint, point, color);
                }
                prevpoint = point;
            }
            waitframe(1);
        }
    #/
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x0
// Checksum 0x65a30ba2, Offset: 0x4c78
// Size: 0x8e
function weaponobjectdetectionmovable(ownerteam) {
    self endon(#"end_detection", #"death", #"hacked");
    level endon(#"game_ended");
    if (!level.teambased) {
        return;
    }
    self.detectid = "rcBomb" + gettime() + randomint(1000000);
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x0
// Checksum 0x1e7217c2, Offset: 0x4d10
// Size: 0x76
function seticonpos(item, icon, heightincrease) {
    icon.x = item.origin[0];
    icon.y = item.origin[1];
    icon.z = item.origin[2] + heightincrease;
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x0
// Checksum 0xc638e2a7, Offset: 0x4d90
// Size: 0x6c
function weaponobjectdetectiontrigger_wait(ownerteam) {
    self endon(#"death", #"hacked", #"detonating");
    util::waittillnotmoving();
    self thread weaponobjectdetectiontrigger(ownerteam);
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x81e45b89, Offset: 0x4e08
// Size: 0x12c
function weaponobjectdetectiontrigger(ownerteam) {
    trigger = spawn("trigger_radius", self.origin - vectorscale((0, 0, 1), 128), 0, 512, 256);
    trigger.detectid = "trigger" + gettime() + randomint(1000000);
    trigger sethintlowpriority(1);
    self waittill(#"death", #"hacked", #"detonating");
    trigger notify(#"end_detection");
    /#
        if (isdefined(trigger.bombsquadicon)) {
            trigger.bombsquadicon destroy();
        }
    #/
    trigger delete();
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xffb904e8, Offset: 0x4f40
// Size: 0x138
function hackertriggersetvisibility(owner) {
    self endon(#"death");
    /#
        assert(isplayer(owner));
    #/
    ownerteam = owner.pers[#"team"];
    for (;;) {
        for (;;) {
            if (level.teambased) {
                self setvisibletoallexceptteam(ownerteam);
                self setexcludeteamfortrigger(ownerteam);
            } else {
                self setvisibletoall();
                self setteamfortrigger(#"none");
            }
            if (isdefined(owner)) {
                self setinvisibletoplayer(owner);
            }
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0xcf2cef30, Offset: 0x5080
// Size: 0x3e
function hackernotmoving() {
    self endon(#"death");
    self util::waittillnotmoving();
    self notify(#"landed");
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x5 linked
// Checksum 0xfe999275, Offset: 0x50c8
// Size: 0x5c
function private set_hint_string(hint_string, var_c1846261) {
    if (isdefined(hint_string) && hint_string != "") {
        self sethintstring(hint_string);
    } else {
        self sethintstring(var_c1846261);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xbe3c8de4, Offset: 0x5130
// Size: 0x1d4
function hackerinit(watcher) {
    self thread hackernotmoving();
    event = undefined;
    event = self waittill(#"death", #"landed");
    if (event._notify == "death") {
        return;
    }
    if (!isdefined(self)) {
        return;
    }
    triggerorigin = self.origin;
    if (isdefined(self.weapon.hackertriggerorigintag) && "" != self.weapon.hackertriggerorigintag) {
        triggerorigin = self gettagorigin(self.weapon.hackertriggerorigintag);
    }
    self.hackertrigger = function_c7cdf243(triggerorigin, level.weaponobjects_hacker_trigger_width, level.weaponobjects_hacker_trigger_height);
    self.hackertrigger set_hint_string(self.weapon.var_2f3ca476, #"hash_249ca5756f6ccd3e");
    self.hackertrigger setignoreentfortrigger(self);
    self.hackertrigger setperkfortrigger(#"specialty_disarmexplosive");
    self.hackertrigger thread hackertriggersetvisibility(self.owner);
    /#
    #/
    self thread hackerthink(self.hackertrigger, watcher);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xc542045d, Offset: 0x5310
// Size: 0xd2
function hackerthink(trigger, watcher) {
    self endon(#"death");
    trigger endon(#"death");
    for (;;) {
        waitresult = undefined;
        waitresult = trigger waittill(#"trigger");
        if (!isdefined(waitresult.is_instant) && !trigger hackerresult(waitresult.activator, self.owner)) {
            continue;
        }
        self itemhacked(watcher, waitresult.activator);
        return;
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xa314d24, Offset: 0x53f0
// Size: 0x40c
function itemhacked(watcher, player) {
    self proximityalarmactivate(0, watcher);
    self.owner hackerremoveweapon(self);
    if (isdefined(level.playequipmenthackedonplayer)) {
        self.owner [[ level.playequipmenthackedonplayer ]]();
    }
    if (self.weapon.ammocountequipment > 0 && isdefined(self.ammo)) {
        ammoleftequipment = self.ammo;
        if (self.weapon.rootweapon == getweapon(#"trophy_system")) {
            player trophy_system::ammo_weapon_hacked(ammoleftequipment);
        }
    }
    self.hacked = 1;
    self setmissileowner(player);
    self setteam(player.pers[#"team"]);
    self.owner = player;
    self clientfield::set("retrievable", 0);
    if (self.weapon.dohackedstats) {
        scoreevents::processscoreevent(#"hacked", player, undefined, undefined);
        player stats::function_e24eec31(getweapon(#"pda_hack"), #"combatrecordstat", 1);
        player challenges::hackedordestroyedequipment();
    }
    /#
        if (self.weapon.rootweapon == level.weaponsatchelcharge && isdefined(player.lowermessage)) {
            player.lowermessage settext(#"hash_5723526a77b686b2");
            player.lowermessage.alpha = 1;
            player.lowermessage fadeovertime(2);
            player.lowermessage.alpha = 0;
        }
    #/
    self notify(#"hacked", {#player:player});
    level notify(#"hacked", {#player:player, #target:self});
    if (isdefined(self.camerahead)) {
        self.camerahead notify(#"hacked", {#player:player});
    }
    /#
    #/
    waitframe(1);
    if (isdefined(player) && player.sessionstate == "playing") {
        player notify(#"grenade_fire", {#respawn_from_hack:1, #weapon:self.weapon, #projectile:self});
    } else {
        watcher thread waitanddetonate(self, 0, undefined, self.weapon);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x2495f802, Offset: 0x5808
// Size: 0x8c
function hackerunfreezeplayer(player) {
    self endon(#"hack_done");
    self waittill(#"death");
    if (isdefined(player)) {
        player val::reset(#"gameobjects", "freezecontrols");
        player val::reset(#"gameobjects", "disable_weapons");
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x8bd6735, Offset: 0x58a0
// Size: 0x32a
function hackerresult(player, owner) {
    success = 1;
    time = gettime();
    hacktime = getdvarfloat(#"perk_disarmexplosivetime", 0);
    if (!canhack(player, owner, 1)) {
        return 0;
    }
    self thread hackerunfreezeplayer(player);
    while (time + int(hacktime * 1000) > gettime()) {
        if (!canhack(player, owner, 0)) {
            success = 0;
            break;
        }
        if (!player usebuttonpressed()) {
            success = 0;
            break;
        }
        if (!isdefined(self)) {
            success = 0;
            break;
        }
        player val::set(#"gameobjects", "freezecontrols");
        player val::set(#"gameobjects", "disable_weapons");
        /#
            if (!isdefined(self.progressbar)) {
                self.progressbar = player hud::function_5037fb7f();
                self.progressbar.lastuserate = -1;
                self.progressbar hud::showelem();
                self.progressbar hud::updatebar(0.01, 1 / hacktime);
                self.progresstext = player hud::function_48badcf4();
                self.progresstext settext(#"mp/hacking");
                self.progresstext hud::showelem();
                player playlocalsound(#"evt_hacker_hacking");
            }
        #/
        waitframe(1);
    }
    if (isdefined(player)) {
        player val::reset(#"gameobjects", "freezecontrols");
        player val::reset(#"gameobjects", "disable_weapons");
    }
    /#
        if (isdefined(self.progressbar)) {
            self.progressbar hud::destroyelem();
            self.progresstext hud::destroyelem();
        }
    #/
    if (isdefined(self)) {
        self notify(#"hack_done");
    }
    return success;
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0x29af150d, Offset: 0x5bd8
// Size: 0x2da
function canhack(player, owner, weapon_check) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isplayer(player)) {
        return 0;
    }
    if (!isalive(player)) {
        return 0;
    }
    if (!isdefined(owner)) {
        return 0;
    }
    if (owner == player) {
        return 0;
    }
    if (level.teambased && !util::function_fbce7263(player.team, owner.team)) {
        return 0;
    }
    if (isdefined(player.isdefusing) && player.isdefusing) {
        return 0;
    }
    if (isdefined(player.isplanting) && player.isplanting) {
        return 0;
    }
    if (isdefined(player.proxbar) && !player.proxbar.hidden) {
        return 0;
    }
    if (isdefined(player.revivingteammate) && player.revivingteammate == 1) {
        return 0;
    }
    if (!player isonground()) {
        return 0;
    }
    if (player isinvehicle()) {
        return 0;
    }
    if (player isweaponviewonlylinked()) {
        return 0;
    }
    if (!player hasperk(#"specialty_disarmexplosive")) {
        return 0;
    }
    if (player isempjammed()) {
        return 0;
    }
    if (isdefined(player.laststand) && player.laststand) {
        return 0;
    }
    if (weapon_check) {
        if (player isthrowinggrenade()) {
            return 0;
        }
        if (player isswitchingweapons()) {
            return 0;
        }
        if (player ismeleeing()) {
            return 0;
        }
        weapon = player getcurrentweapon();
        if (!isdefined(weapon)) {
            return 0;
        }
        if (weapon == level.weaponnone) {
            return 0;
        }
        if (weapon.isequipment && player isfiring()) {
            return 0;
        }
        if (weapon.isspecificuse) {
            return 0;
        }
    }
    return 1;
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x9f4afeb5, Offset: 0x5ec0
// Size: 0xa0
function hackerremoveweapon(weapon_instance) {
    if (isdefined(self) && isdefined(self.weaponobjectwatcherarray)) {
        for (i = 0; i < self.weaponobjectwatcherarray.size; i++) {
            if (self.weaponobjectwatcherarray[i].weapon != weapon_instance.weapon.rootweapon) {
                continue;
            }
            removeweaponobject(self.weaponobjectwatcherarray[i], weapon_instance);
            return;
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xe676c724, Offset: 0x5f68
// Size: 0xd0
function proximityweaponobject_createdamagearea(watcher) {
    damagearea = spawn("trigger_radius", self.origin + (0, 0, 0 - watcher.detonateradius), 4096 | 16384 | level.aitriggerspawnflags | level.vehicletriggerspawnflags, watcher.detonateradius, watcher.detonateradius * 2);
    damagearea enablelinkto();
    damagearea linkto(self);
    self thread deleteondeath(damagearea);
    return damagearea;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x6a5e990a, Offset: 0x6040
// Size: 0x1e8
function proximityweaponobject_validtriggerentity(watcher, ent) {
    if (level.weaponobjectdebug != 1) {
        if (isdefined(self.owner) && ent == self.owner) {
            return 0;
        }
        if (isvehicle(ent)) {
            if (watcher.ignorevehicles) {
                return 0;
            }
            if (self.owner === ent.owner) {
                return 0;
            }
        }
        if (!damage::friendlyfirecheck(self.owner, ent, 0)) {
            return 0;
        }
        if (watcher.ignorevehicles && isai(ent) && !(isdefined(ent.isaiclone) && ent.isaiclone)) {
            return 0;
        }
    }
    if (lengthsquared(ent getvelocity()) < 10 && !isdefined(watcher.immediatedetonation)) {
        return 0;
    }
    if (!ent shouldaffectweaponobject(self, watcher)) {
        return 0;
    }
    if (self isstunned()) {
        return 0;
    }
    if (isplayer(ent)) {
        if (!isalive(ent)) {
            return 0;
        }
        if (isdefined(watcher.immunespecialty) && ent hasperk(watcher.immunespecialty)) {
            return 0;
        }
    }
    return 1;
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x3c78f21c, Offset: 0x6230
// Size: 0x5c
function proximityweaponobject_removespawnprotectondeath(ent) {
    self endon(#"death");
    ent waittill(#"death", #"disconnect");
    arrayremovevalue(self.protected_entities, ent);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xcab0d7a9, Offset: 0x6298
// Size: 0xec
function proximityweaponobject_spawnprotect(watcher, ent) {
    self endon(#"death");
    ent endon(#"death");
    self.protected_entities[self.protected_entities.size] = ent;
    self thread proximityweaponobject_removespawnprotectondeath(ent);
    radius_sqr = watcher.detonateradius * watcher.detonateradius;
    while (1) {
        if (distancesquared(ent.origin, self.origin) > radius_sqr) {
            arrayremovevalue(self.protected_entities, ent);
            return;
        }
        wait(0.5);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xcfa274da, Offset: 0x6390
// Size: 0x114
function proximityweaponobject_isspawnprotected(watcher, ent) {
    if (!isplayer(ent)) {
        return 0;
    }
    foreach (protected_ent in self.protected_entities) {
        if (protected_ent == ent) {
            return 1;
        }
    }
    linked_to = self getlinkedent();
    if (linked_to === ent) {
        return 0;
    }
    if (ent player::is_spawn_protected()) {
        self thread proximityweaponobject_spawnprotect(watcher, ent);
        return 1;
    }
    return 0;
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0xcaaac0b, Offset: 0x64b0
// Size: 0x1b0
function proximityweaponobject_dodetonation(watcher, ent, traceorigin) {
    self endon(#"death", #"hacked");
    self notify(#"kill_target_detection");
    if (isdefined(watcher.activatesound)) {
        self playsound(watcher.activatesound);
    }
    wait(watcher.detectiongraceperiod);
    if (isplayer(ent) && ent hasperk(#"specialty_delayexplosive")) {
        wait(getdvarfloat(#"perk_delayexplosivetime", 0));
    }
    self entityheadicons::setentityheadicon("none");
    self.origin = traceorigin;
    if (isdefined(self.var_cea6a2fb)) {
        self.var_cea6a2fb placeables::forceshutdown();
    }
    if (isdefined(self.owner) && isplayer(self.owner)) {
        self [[ watcher.ondetonatecallback ]](self.owner, undefined, ent);
    } else {
        self [[ watcher.ondetonatecallback ]](undefined, undefined, ent);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xf0966ac9, Offset: 0x6668
// Size: 0x40
function proximityweaponobject_activationdelay(watcher) {
    self util::waittillnotmoving();
    if (watcher.activationdelay) {
        wait(watcher.activationdelay);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0xa965ab0, Offset: 0x66b0
// Size: 0xdc
function proximityweaponobject_waittillframeendanddodetonation(watcher, ent, traceorigin) {
    self endon(#"death");
    dist = distance(ent.origin, self.origin);
    if (isdefined(self.activated_entity_distance)) {
        if (dist < self.activated_entity_distance) {
            self notify(#"better_target");
        } else {
            return;
        }
    }
    self endon(#"better_target");
    self.activated_entity_distance = dist;
    waitframe(1);
    proximityweaponobject_dodetonation(watcher, ent, traceorigin);
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xed8304f2, Offset: 0x6798
// Size: 0x178
function proximityweaponobjectdetonation(s_watcher) {
    self endon(#"death", #"hacked", #"kill_target_detection");
    proximityweaponobject_activationdelay(s_watcher);
    var_6e4025f7 = proximityweaponobject_createdamagearea(s_watcher);
    while (1) {
        waitresult = undefined;
        waitresult = var_6e4025f7 waittill(#"trigger");
        ent = waitresult.activator;
        if (!proximityweaponobject_validtriggerentity(s_watcher, ent)) {
            continue;
        }
        if (proximityweaponobject_isspawnprotected(s_watcher, ent)) {
            continue;
        }
        v_up = anglestoup(self.angles);
        var_f1e2d68b = self.origin + v_up;
        if (ent damageconetrace(var_f1e2d68b, self) > 0) {
            thread proximityweaponobject_waittillframeendanddodetonation(s_watcher, ent, var_f1e2d68b);
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x7516251f, Offset: 0x6918
// Size: 0x180
function shouldaffectweaponobject(object, watcher) {
    radius = object.weapon.explosionradius;
    distancesqr = distancesquared(self.origin, object.origin);
    if (radius != 0 && radius * radius < distancesqr) {
        return 0;
    }
    pos = self.origin + vectorscale((0, 0, 1), 32);
    if (isdefined(watcher.ignoredirection)) {
        return 1;
    }
    dirtopos = pos - object.origin;
    objectforward = anglestoforward(object.angles);
    dist = vectordot(dirtopos, objectforward);
    if (dist < watcher.detectionmindist) {
        return 0;
    }
    dirtopos = vectornormalize(dirtopos);
    dot = vectordot(dirtopos, objectforward);
    return dot > watcher.detectiondot;
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x6a0ced5a, Offset: 0x6aa0
// Size: 0x54
function deleteondeath(ent) {
    self waittill(#"death", #"hacked");
    waitframe(1);
    if (isdefined(ent)) {
        ent delete();
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x3a2b772, Offset: 0x6b00
// Size: 0x1b2
function testkillbrushonstationary(a_killbrushes, player) {
    player endon(#"disconnect");
    self endon(#"death");
    self waittill(#"stationary");
    foreach (trig in a_killbrushes) {
        if (isdefined(trig) && self istouching(trig)) {
            if (!trig istriggerenabled()) {
                continue;
            }
            if (!(isdefined(self.spawnflags) && (self.spawnflags & 8) == 8) && !(isdefined(self.spawnflags) && (self.spawnflags & 512) == 512) && !(isdefined(self.spawnflags) && (self.spawnflags & 32768) == 32768)) {
                continue;
            }
            if (self.origin[2] > player.origin[2]) {
                break;
            }
            if (isdefined(self)) {
                self delete();
            }
            return;
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xcf5fa6e6, Offset: 0x6cc0
// Size: 0x1f4
function deleteonkillbrush(player) {
    player endon(#"disconnect");
    self endon(#"death", #"stationary");
    a_killbrushes = getentarray("trigger_hurt_new", "classname");
    self thread testkillbrushonstationary(a_killbrushes, player);
    while (1) {
        a_killbrushes = getentarray("trigger_hurt_new", "classname");
        for (i = 0; i < a_killbrushes.size; i++) {
            if (self istouching(a_killbrushes[i])) {
                if (!a_killbrushes[i] istriggerenabled()) {
                    continue;
                }
                if (!(isdefined(self.spawnflags) && (self.spawnflags & 8) == 8) && !(isdefined(self.spawnflags) && (self.spawnflags & 512) == 512) && !(isdefined(self.spawnflags) && (self.spawnflags & 32768) == 32768)) {
                    continue;
                }
                if (self.origin[2] > player.origin[2]) {
                    break;
                }
                if (isdefined(self)) {
                    self delete();
                }
                return;
            }
        }
        wait(0.1);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x40af2527, Offset: 0x6ec0
// Size: 0xa6
function on_double_tap_detonate() {
    buttontime = 0;
    if (!isalive(self) && !self util::isusingremote()) {
        return;
    }
    for (watcher = 0; watcher < self.weaponobjectwatcherarray.size; watcher++) {
        if (self.weaponobjectwatcherarray[watcher].altdetonate) {
            self.weaponobjectwatcherarray[watcher] detonateweaponobjectarray(0);
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x7c681e0c, Offset: 0x6f70
// Size: 0xc4
function on_detonate() {
    if (self isusingoffhand()) {
        weap = self getcurrentoffhand();
    } else {
        weap = self getcurrentweapon();
    }
    watcher = getweaponobjectwatcherbyweapon(weap);
    if (isdefined(watcher)) {
        if (isdefined(watcher.ondetonationhandle)) {
            self thread [[ watcher.ondetonationhandle ]](watcher);
        }
        watcher detonateweaponobjectarray(0);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x85a5dfb6, Offset: 0x7040
// Size: 0x116
function function_ac7c2bf9(params = undefined) {
    if (!isdefined(self.weaponobjectwatcherarray)) {
        return;
    }
    watchers = [];
    for (watcher = 0; watcher < self.weaponobjectwatcherarray.size; watcher++) {
        weaponobjectwatcher = spawnstruct();
        watchers[watchers.size] = weaponobjectwatcher;
        weaponobjectwatcher.objectarray = [];
        if (isdefined(self.weaponobjectwatcherarray[watcher].objectarray)) {
            weaponobjectwatcher.objectarray = self.weaponobjectwatcherarray[watcher].objectarray;
        }
    }
    waitframe(1);
    for (watcher = 0; watcher < watchers.size; watcher++) {
        watchers[watcher] deleteweaponobjectarray();
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x0
// Checksum 0xc19fcdd1, Offset: 0x7160
// Size: 0x64
function saydamaged(orig, amount) {
    /#
        for (i = 0; i < 60; i++) {
            print3d(orig, "<unknown string>" + amount);
            waitframe(1);
        }
    #/
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x5 linked
// Checksum 0x65c46f94, Offset: 0x71d0
// Size: 0x17c
function private function_c9fc5521(player, weapon) {
    maxammo = 0;
    loadout = player loadout::find_loadout_slot(weapon);
    if (isdefined(loadout)) {
        if (loadout.count > 0) {
            maxammo = loadout.count;
        } else {
            maxammo = weapon.maxammo + weapon.clipsize;
        }
    } else if (isdefined(player.grenadetypeprimary) && weapon == player.grenadetypeprimary && isdefined(player.grenadetypeprimarycount) && player.grenadetypeprimarycount > 0) {
        maxammo = player.grenadetypeprimarycount;
    } else if (isdefined(player.grenadetypesecondary) && weapon == player.grenadetypesecondary && isdefined(player.grenadetypesecondarycount) && player.grenadetypesecondarycount > 0) {
        maxammo = player.grenadetypesecondarycount;
    } else {
        maxammo = weapon.maxammo + weapon.clipsize;
    }
    return maxammo;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x5 linked
// Checksum 0xf8113d71, Offset: 0x7358
// Size: 0x6c
function private get_ammo(player, weapon) {
    ammo = player getweaponammoclip(weapon);
    if (!weapon.iscliponly) {
        ammo = ammo + player getweaponammostock(weapon);
    }
    return ammo;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x5 linked
// Checksum 0xcefbf18e, Offset: 0x73d0
// Size: 0x7c
function private function_e0093db1(player, weapon) {
    maxammo = function_c9fc5521(player, weapon);
    if (maxammo == 0) {
        return 0;
    }
    ammo = get_ammo(player, weapon);
    if (ammo >= maxammo) {
        return 0;
    }
    return 1;
}

// Namespace weaponobjects/weaponobjects
// Params 4, eflags: 0x1 linked
// Checksum 0x786e4e82, Offset: 0x7458
// Size: 0x1d6
function function_d831baf0(trigger, callback, playersoundonuse, npcsoundonuse) {
    self endon(#"death", #"explode", #"hacked");
    trigger endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = trigger waittill(#"trigger");
        player = waitresult.activator;
        if (!isalive(player)) {
            continue;
        }
        if (!player isonground() && !player isplayerswimming()) {
            continue;
        }
        if (isdefined(trigger.claimedby) && player != trigger.claimedby) {
            continue;
        }
        heldweapon = player function_672ba881(self.weapon);
        if (!isdefined(heldweapon)) {
            continue;
        }
        if (!function_e0093db1(player, heldweapon)) {
            continue;
        }
        if (isdefined(playersoundonuse)) {
            player playlocalsound(playersoundonuse);
        }
        if (isdefined(npcsoundonuse)) {
            player playsound(npcsoundonuse);
        }
        self [[ callback ]](player, heldweapon);
        return;
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x6d285fb, Offset: 0x7638
// Size: 0x88
function function_e3030545(pweapons, weapon) {
    foreach (pweapon in pweapons) {
        if (pweapon == weapon) {
            return pweapon;
        }
    }
    return undefined;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x43f71082, Offset: 0x76c8
// Size: 0x98
function function_7f47d8b8(pweapons, weapon) {
    foreach (pweapon in pweapons) {
        if (pweapon.rootweapon == weapon.rootweapon) {
            return pweapon;
        }
    }
    return undefined;
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x0
// Checksum 0x25577d06, Offset: 0x7768
// Size: 0x72
function get_held_weapon_match_or_root_match(weapon) {
    pweapons = self getweaponslist(1);
    match = function_e3030545(pweapons, weapon);
    if (isdefined(match)) {
        return match;
    }
    return function_7f47d8b8(pweapons, weapon);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xbd2c1e3a, Offset: 0x77e8
// Size: 0x98
function function_42e13419(pweapons, weapon) {
    foreach (pweapon in pweapons) {
        if (pweapon.ammoindex == weapon.ammoindex) {
            return pweapon;
        }
    }
    return undefined;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x5a9ff26a, Offset: 0x7888
// Size: 0x98
function function_3eca329f(pweapons, weapon) {
    foreach (pweapon in pweapons) {
        if (pweapon.var_fc3be15e == weapon.var_fc3be15e) {
            return pweapon;
        }
    }
    return undefined;
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xd8434da6, Offset: 0x7928
// Size: 0x72
function function_672ba881(weapon) {
    pweapons = self getweaponslist(1);
    match = function_3eca329f(pweapons, weapon);
    if (isdefined(match)) {
        return match;
    }
    return function_42e13419(pweapons, weapon);
}

// Namespace weaponobjects/weaponobjects
// Params 5, eflags: 0x5 linked
// Checksum 0x6e2a70f0, Offset: 0x79a8
// Size: 0x108
function private spawn_interact_trigger(type, origin, width, height, var_c16194e2) {
    if (isdefined(width) && isdefined(height)) {
        trigger = spawn(type, origin, 0, width, height);
    } else {
        trigger = spawn(type, origin);
    }
    if (var_c16194e2 !== 1) {
        trigger sethintlowpriority(1);
        trigger setcursorhint("HINT_NOICON", self);
    }
    trigger enablelinkto();
    trigger linkto(self);
    return trigger;
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x5 linked
// Checksum 0x257397de, Offset: 0x7ab8
// Size: 0x3a
function private function_c7cdf243(origin, width, height) {
    return spawn_interact_trigger("trigger_radius_use", origin, width, height);
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x5 linked
// Checksum 0xbdfd37a, Offset: 0x7b00
// Size: 0x42
function private function_d5e8c3d0(origin, width, height) {
    return spawn_interact_trigger("trigger_radius", origin, width, height, 1);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xd37a0743, Offset: 0x7b50
// Size: 0x3dc
function function_23b0aea9(watcher, player) {
    self endon(#"death");
    self setowner(player);
    self setteam(player.pers[#"team"]);
    self.owner = player;
    self.oldangles = self.angles;
    self util::waittillnotmoving();
    waittillframeend();
    if (!isdefined(player) || !isdefined(player.pers)) {
        return;
    }
    if (player.pers[#"team"] == #"spectator") {
        return;
    }
    triggerorigin = self.origin;
    triggerparentent = undefined;
    if (isdefined(self.stucktoplayer)) {
        if (isalive(self.stucktoplayer) || !isdefined(self.stucktoplayer.body)) {
            if (isalive(self.stucktoplayer)) {
                triggerparentent = self;
                self unlink();
                self.angles = self.oldangles;
                self launch(vectorscale((1, 1, 1), 5));
                self util::waittillnotmoving();
                waittillframeend();
            } else {
                triggerparentent = self.stucktoplayer;
            }
        } else {
            triggerparentent = self.stucktoplayer.body;
        }
    }
    if (!isdefined(self) || !isdefined(player)) {
        return;
    }
    if (isdefined(triggerparentent)) {
        triggerorigin = triggerparentent.origin + vectorscale((0, 0, 1), 10);
    } else {
        up = anglestoup(self.angles);
        triggerorigin = self.origin + up;
    }
    weapon = watcher.weapon;
    if (!self util::ishacked() && "None" != weapon.var_7d4c12af) {
        if (self.weapon.shownretrievable) {
            self clientfield::set("retrievable", 1);
        }
        if (weapon.var_7d4c12af == "Automatic") {
            function_57152a5(watcher, player, triggerorigin);
        } else {
            function_ac27aef5(watcher, player, triggerorigin);
        }
        if (isdefined(triggerparentent)) {
            self.pickuptrigger linkto(triggerparentent);
        }
    }
    if ("None" != weapon.var_38eb7f9e) {
        function_9dbd349e(watcher, player, triggerorigin);
    }
    /#
        thread switch_team(self, watcher, player);
    #/
    self thread watchshutdown(player);
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0x64cf563a, Offset: 0x7f38
// Size: 0x148
function function_ac27aef5(watcher, player, origin) {
    self.pickuptrigger = function_c7cdf243(origin);
    self.pickuptrigger setinvisibletoall();
    self.pickuptrigger setvisibletoplayer(player);
    self.pickuptrigger setteamfortrigger(player.pers[#"team"]);
    self.pickuptrigger set_hint_string(self.weapon.var_8a03df2b, #"hash_5a7d32b6f408ad1f");
    self thread watchusetrigger(self.pickuptrigger, watcher.pickup, watcher.pickupsoundplayer, watcher.pickupsound, watcher.weapon);
    if (isdefined(watcher.pickup_trigger_listener)) {
        self thread [[ watcher.pickup_trigger_listener ]](self.pickuptrigger, player);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0xaf113215, Offset: 0x8088
// Size: 0x11c
function function_57152a5(watcher, player, origin) {
    height = 50;
    if (isdefined(watcher.weapon) && isdefined(watcher.weapon.var_ac36c1db) && watcher.weapon.var_ac36c1db > 0) {
        height = watcher.weapon.var_ac36c1db;
        origin = origin - (0, 0, height * 0.5);
    }
    self.pickuptrigger = function_d5e8c3d0(origin, 50, 50);
    self.pickuptrigger.claimedby = player;
    self thread function_d831baf0(self.pickuptrigger, watcher.pickup, watcher.pickupsoundplayer, watcher.pickupsound);
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xe548e95a, Offset: 0x81b0
// Size: 0x7a
function function_386fa470(player) {
    if (!isdefined(self.enemytrigger)) {
        return;
    }
    self.enemytrigger setinvisibletoplayer(player);
    if (level.teambased) {
        self.enemytrigger setexcludeteamfortrigger(player.team);
        self.enemytrigger.triggerteamignore = self.team;
    }
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0x2add4465, Offset: 0x8238
// Size: 0xfc
function function_9dbd349e(watcher, player, origin) {
    self.enemytrigger = function_c7cdf243(origin);
    self.enemytrigger setinvisibletoplayer(player);
    if (level.teambased) {
        self.enemytrigger setexcludeteamfortrigger(player.team);
        self.enemytrigger.triggerteamignore = self.team;
    }
    self.enemytrigger set_hint_string(self.weapon.var_5c29f743, #"mp_generic_destroy");
    self thread watchusetrigger(self.enemytrigger, watcher.ondestroyed);
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0xb92b035f, Offset: 0x8340
// Size: 0x1c
function destroyent() {
    self delete();
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x5 linked
// Checksum 0x58102d1c, Offset: 0x8368
// Size: 0xfc
function private add_ammo(player, weapon) {
    if (weapon.iscliponly || weapon.var_d98594b2 == "Clip Then Ammo") {
        ammo = player getweaponammoclip(weapon);
        ammo++;
        clip_size = weapon.clipsize;
        if (ammo <= clip_size) {
            player setweaponammoclip(weapon, ammo);
            return;
        }
    }
    if (!weapon.iscliponly) {
        stock_ammo = player getweaponammostock(weapon);
        stock_ammo++;
        player setweaponammostock(weapon, stock_ammo);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x8e12110b, Offset: 0x8470
// Size: 0x1c4
function function_a6616b9c(player, heldweapon) {
    if (!self.weapon.anyplayercanretrieve && isdefined(self.owner) && self.owner != player) {
        return;
    }
    pickedweapon = self.weapon;
    if (self.weapon.ammocountequipment > 0 && isdefined(self.ammo)) {
        ammoleftequipment = self.ammo;
    }
    self notify(#"picked_up");
    heldweapon = player function_672ba881(self.weapon);
    if (!isdefined(heldweapon)) {
        return;
    }
    if (isdefined(ammoleftequipment)) {
        if (pickedweapon.rootweapon == getweapon(#"trophy_system")) {
            player trophy_system::ammo_weapon_pickup(ammoleftequipment);
        }
    }
    if ("ammo" != heldweapon.gadget_powerusetype) {
        slot = player gadgetgetslot(heldweapon);
        player gadgetpowerchange(slot, heldweapon.gadget_powergainonretrieve);
        return;
    }
    if (!function_e0093db1(player, heldweapon)) {
        return;
    }
    add_ammo(player, heldweapon);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x82b054a9, Offset: 0x8640
// Size: 0x10c
function function_d9219ce2(player, weapon) {
    self notify(#"picked_up");
    if (weapon.gadget_powergainonretrieve > 0) {
        slot = player gadgetgetslot(weapon);
        if (slot >= 0) {
            clipsize = player function_b7f1fd2c(weapon);
            if (clipsize && weapon.var_ce34bb7e) {
                powergain = weapon.gadget_powergainonretrieve / clipsize;
            } else {
                powergain = weapon.gadget_powergainonretrieve;
            }
            player gadgetpowerchange(slot, powergain);
            return;
        }
    }
    add_ammo(player, weapon);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x344b5406, Offset: 0x8758
// Size: 0xac
function ondestroyed(attacker, data) {
    playfx(level._effect[#"tacticalinsertionfizzle"], self.origin);
    self playsound(#"dst_tac_insert_break");
    if (isdefined(self.owner) && isdefined(level.playequipmentdestroyedonplayer)) {
        self.owner [[ level.playequipmentdestroyedonplayer ]]();
    }
    self delete();
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xe682842, Offset: 0x8810
// Size: 0x124
function watchshutdown(player) {
    self waittill(#"death", #"hacked", #"detonating");
    pickuptrigger = self.pickuptrigger;
    hackertrigger = self.hackertrigger;
    enemytrigger = self.enemytrigger;
    if (isdefined(pickuptrigger)) {
        pickuptrigger delete();
    }
    if (isdefined(hackertrigger)) {
        /#
            if (isdefined(hackertrigger.progressbar)) {
                hackertrigger.progressbar hud::destroyelem();
                hackertrigger.progresstext hud::destroyelem();
            }
        #/
        hackertrigger delete();
    }
    if (isdefined(enemytrigger)) {
        enemytrigger delete();
    }
}

// Namespace weaponobjects/weaponobjects
// Params 5, eflags: 0x1 linked
// Checksum 0xd7bd128b, Offset: 0x8940
// Size: 0x29c
function watchusetrigger(trigger, callback, playersoundonuse, npcsoundonuse, callback_data) {
    self endon(#"death", #"delete");
    trigger endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = trigger waittill(#"trigger");
        player = waitresult.activator;
        if (isdefined(self.detonated) && self.detonated == 1) {
            if (isdefined(trigger)) {
                trigger delete();
            }
            return;
        }
        if (!isalive(player)) {
            continue;
        }
        if (isdefined(trigger.triggerteam) && player.pers[#"team"] != trigger.triggerteam) {
            continue;
        }
        if (isdefined(trigger.triggerteamignore) && player.team == trigger.triggerteamignore) {
            continue;
        }
        if (isdefined(trigger.claimedby) && player != trigger.claimedby) {
            continue;
        }
        grenade = player.throwinggrenade;
        weapon = player getcurrentweapon();
        if (weapon.isequipment) {
            grenade = 0;
        }
        if (player usebuttonpressed() && !(isdefined(grenade) && grenade) && !player meleebuttonpressed()) {
            if (isdefined(playersoundonuse)) {
                player playlocalsound(playersoundonuse);
            }
            if (isdefined(npcsoundonuse)) {
                player playsound(npcsoundonuse);
            }
            self thread [[ callback ]](player, callback_data);
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x621bbc, Offset: 0x8be8
// Size: 0x9c
function setupreconeffect() {
    if (!isdefined(self)) {
        return;
    }
    if (self.weapon.shownenemyexplo || self.weapon.shownenemyequip) {
        if (isdefined(self.hacked) && self.hacked) {
            self clientfield::set("enemyequip", 2);
        } else {
            self clientfield::set("enemyequip", 1);
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x46455c21, Offset: 0x8c90
// Size: 0x34
function useteamequipmentclientfield(watcher) {
    if (isdefined(watcher)) {
        if (!isdefined(watcher.notequipment)) {
            if (isdefined(self)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x62f1a3b0, Offset: 0x8cd0
// Size: 0x8a
function getwatcherforweapon(weapon) {
    if (!isdefined(self)) {
        return undefined;
    }
    if (!isplayer(self)) {
        return undefined;
    }
    for (i = 0; i < self.weaponobjectwatcherarray.size; i++) {
        if (self.weaponobjectwatcherarray[i].weapon != weapon) {
            continue;
        }
        return self.weaponobjectwatcherarray[i];
    }
    return undefined;
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x1 linked
// Checksum 0xfa48c540, Offset: 0x8d68
// Size: 0xf4
function destroy_other_teams_supplemental_watcher_objects(attacker, weapon, radius) {
    if (level.teambased) {
        foreach (team, _ in level.teams) {
            if (!attacker util::isenemyteam(team)) {
                continue;
            }
            destroy_supplemental_watcher_objects(attacker, team, weapon, radius);
        }
    }
    destroy_supplemental_watcher_objects(attacker, "free", weapon, radius);
}

// Namespace weaponobjects/weaponobjects
// Params 4, eflags: 0x1 linked
// Checksum 0xa4acb439, Offset: 0x8e68
// Size: 0x1b0
function destroy_supplemental_watcher_objects(attacker, team, weapon, radius) {
    radiussq = radius * radius;
    foreach (item in level.supplementalwatcherobjects) {
        if (!isdefined(item.weapon)) {
            continue;
        }
        if (distancesquared(item.origin, attacker.origin) > radiussq) {
            continue;
        }
        if (!isdefined(item.owner)) {
            continue;
        }
        if (isdefined(team) && util::function_fbce7263(item.owner.team, team)) {
            continue;
        } else if (item.owner == attacker) {
            continue;
        }
        watcher = item.owner getwatcherforweapon(item.weapon);
        if (!isdefined(watcher) || !isdefined(watcher.onsupplementaldetonatecallback)) {
            continue;
        }
        item thread [[ watcher.onsupplementaldetonatecallback ]]();
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x0
// Checksum 0x9dd412e, Offset: 0x9020
// Size: 0x3c
function add_supplemental_object(object) {
    level.supplementalwatcherobjects[level.supplementalwatcherobjects.size] = object;
    object thread watch_supplemental_object_death();
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x2033aefb, Offset: 0x9068
// Size: 0x34
function watch_supplemental_object_death() {
    self waittill(#"death");
    arrayremovevalue(level.supplementalwatcherobjects, self);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x40a703a8, Offset: 0x90a8
// Size: 0x8c
function function_d9c08e94(var_2f190eaf, var_46f3f2d3) {
    self endon(#"cancel_timeout");
    if (!isdefined(var_2f190eaf) || var_2f190eaf <= 0) {
        return;
    }
    self endon(#"death");
    wait(float(var_2f190eaf) / 1000);
    if (isdefined(var_46f3f2d3)) {
        self [[ var_46f3f2d3 ]]();
    }
}

// Namespace weaponobjects/weaponobjects
// Params 3, eflags: 0x0
// Checksum 0x1f7de4f7, Offset: 0x9140
// Size: 0x1c0
function switch_team(entity, watcher, owner) {
    /#
        self notify(#"stop_disarmthink");
        self endon(#"stop_disarmthink", #"death");
        setdvar(#"scr_switch_team", "<unknown string>");
        while (1) {
            wait(0.5);
            devgui_int = getdvarint(#"scr_switch_team", 0);
            if (devgui_int != 0) {
                team = "<unknown string>";
                if (isdefined(level.getenemyteam) && isdefined(owner) && isdefined(owner.team)) {
                    team = [[ level.getenemyteam ]](owner.team);
                }
                if (isdefined(level.devongetormakebot)) {
                    player = [[ level.devongetormakebot ]](team);
                }
                if (!isdefined(player)) {
                    println("<unknown string>");
                    wait(1);
                    continue;
                }
                entity itemhacked(watcher, player);
                setdvar(#"scr_switch_team", 0);
            }
        }
    #/
}

