#using scripts\weapons\molotov;
#using scripts\weapons\proximity_grenade;
#using scripts\weapons\weaponobjects;

#namespace trapd;

// Namespace trapd/trapd
// Params 1, eflags: 0x0
// Checksum 0x103e0633, Offset: 0xa0
// Size: 0x19a
function function_ae7e49da(watcher) {
    watcher.watchforfire = 1;
    watcher.activatesound = #"wpn_claymore_alert";
    watcher.hackable = 0;
    watcher.hackertoolradius = level.equipmenthackertoolradius;
    watcher.hackertooltimems = level.equipmenthackertooltimems;
    watcher.activatefx = 1;
    watcher.ownergetsassist = 1;
    watcher.ignoredirection = undefined;
    watcher.immediatedetonation = 1;
    watcher.immunespecialty = "specialty_immunetriggerbetty";
    watcher.detectiondot = cos(70);
    watcher.detectionmindist = 20;
    watcher.detectiongraceperiod = 0.6;
    watcher.stuntime = 3;
    watcher.notequipment = 1;
    watcher.activationdelay = 0.5;
    watcher.ondetonatecallback = &proximity_grenade::proximitydetonate;
    watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
    watcher.onspawn = &proximity_grenade::onspawnproximitygrenadeweaponobject;
    watcher.stun = &weaponobjects::weaponstun;
    return watcher;
}

// Namespace trapd/trapd
// Params 1, eflags: 0x0
// Checksum 0x22cd3769, Offset: 0x248
// Size: 0x17a
function function_1daa29fc(watcher) {
    watcher.watchforfire = 1;
    watcher.activatesound = #"wpn_claymore_alert";
    watcher.hackable = 0;
    watcher.hackertoolradius = level.equipmenthackertoolradius;
    watcher.hackertooltimems = level.equipmenthackertooltimems;
    watcher.activatefx = 1;
    watcher.ownergetsassist = 1;
    watcher.ignoredirection = 1;
    watcher.immediatedetonation = 1;
    watcher.immunespecialty = "specialty_immunetriggerbetty";
    watcher.detectionmindist = 64;
    watcher.detectiongraceperiod = 0.6;
    watcher.stuntime = 3;
    watcher.notequipment = 1;
    watcher.activationdelay = 0.5;
    watcher.ondetonatecallback = &proximity_grenade::proximitydetonate;
    watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
    watcher.onspawn = &proximity_grenade::onspawnproximitygrenadeweaponobject;
    watcher.stun = &weaponobjects::weaponstun;
    return watcher;
}

// Namespace trapd/trapd
// Params 1, eflags: 0x0
// Checksum 0xa29ab1de, Offset: 0x3d0
// Size: 0x17a
function function_d8d3b49b(watcher) {
    watcher.watchforfire = 1;
    watcher.activatesound = #"wpn_claymore_alert";
    watcher.hackable = 0;
    watcher.hackertoolradius = level.equipmenthackertoolradius;
    watcher.hackertooltimems = level.equipmenthackertooltimems;
    watcher.activatefx = 1;
    watcher.ownergetsassist = 1;
    watcher.ignoredirection = 1;
    watcher.immediatedetonation = 1;
    watcher.immunespecialty = "specialty_immunetriggerbetty";
    watcher.detectionmindist = 64;
    watcher.detectiongraceperiod = 0.6;
    watcher.stuntime = 3;
    watcher.notequipment = 1;
    watcher.activationdelay = 0.5;
    watcher.ondetonatecallback = &proximity_grenade::proximitydetonate;
    watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
    watcher.onspawn = &proximity_grenade::onspawnproximitygrenadeweaponobject;
    watcher.stun = &weaponobjects::weaponstun;
    return watcher;
}

// Namespace trapd/trapd
// Params 1, eflags: 0x0
// Checksum 0xfb1bb619, Offset: 0x558
// Size: 0x17a
function function_518130e(watcher) {
    watcher.watchforfire = 1;
    watcher.activatesound = #"wpn_claymore_alert";
    watcher.hackable = 0;
    watcher.hackertoolradius = level.equipmenthackertoolradius;
    watcher.hackertooltimems = level.equipmenthackertooltimems;
    watcher.activatefx = 1;
    watcher.ownergetsassist = 1;
    watcher.ignoredirection = 1;
    watcher.immediatedetonation = 1;
    watcher.immunespecialty = "specialty_immunetriggerbetty";
    watcher.detectionmindist = 64;
    watcher.detectiongraceperiod = 0.6;
    watcher.stuntime = 3;
    watcher.notequipment = 1;
    watcher.activationdelay = 0.5;
    watcher.ondetonatecallback = &function_367f94ba;
    watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
    watcher.onspawn = &proximity_grenade::onspawnproximitygrenadeweaponobject;
    watcher.stun = &weaponobjects::weaponstun;
    return watcher;
}

// Namespace trapd/trapd
// Params 3, eflags: 0x0
// Checksum 0xe0ecc0e2, Offset: 0x6e0
// Size: 0xcc
function function_367f94ba(attacker, weapon, target) {
    self.killcament.starttime = gettime();
    self molotov::function_462c8632(self.owner, self.origin, (0, 0, 1), (0, 0, -400), self.killcament, weapon, self.team, getscriptbundle(self.weapon.customsettings));
    self hide();
    wait 10;
    self delete();
}

