// Atian COD Tools GSC decompiler test
#include script_3aa0f32b70d4f7cb;
#include script_178024232e91b0a1;

#namespace aiutility;

// Namespace aiutility/namespace_7d3e8f59
// Params 0, eflags: 0x2
// Checksum 0x3da2e92c, Offset: 0x358
// Size: 0x4e4
function autoexec registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&explosivekilled));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"explosivekilled", &explosivekilled);
    /#
        assert(isscriptfunctionptr(&electrifiedkilled));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"electrifiedkilled", &electrifiedkilled);
    /#
        assert(isscriptfunctionptr(&burnedkilled));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"burnedkilled", &burnedkilled);
    /#
        assert(isscriptfunctionptr(&rapskilled));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"rapskilled", &rapskilled);
    /#
        assert(isscriptfunctionptr(&tookflashbangdamage));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"tookflashbangdamage", &tookflashbangdamage);
    /#
        assert(isscriptfunctionptr(&function_95482e2b));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5b6a2e66dc5bf7a7", &function_95482e2b);
    /#
        assert(isscriptfunctionptr(&function_f9a1ea10));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7e18cc452c8ecce8", &function_f9a1ea10);
    /#
        assert(isscriptfunctionptr(&function_ebf05a38));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2bb2abb5b247ba91", &function_ebf05a38);
    /#
        assert(isscriptfunctionptr(&function_d63ff497));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_49371f9efa84972e", &function_d63ff497);
    /#
        assert(isscriptfunctionptr(&function_26b6e27e));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7c8fbf66eeb51ccb", &function_26b6e27e);
    /#
        assert(isscriptfunctionptr(&function_603389de));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1b92b6b5f1705db3", &function_603389de);
    /#
        assert(isscriptfunctionptr(&function_13b0963e));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_62a8709f08c68d60", &function_13b0963e);
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0x55ef5cfa, Offset: 0x848
// Size: 0x66
function function_95482e2b(entity) {
    shitloc = entity.damagelocation;
    if (isdefined(shitloc)) {
        return isinarray(array("helmet", "head", "neck"), shitloc);
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0x14fb7164, Offset: 0x8b8
// Size: 0x98
function function_f9a1ea10(entity) {
    shitloc = entity.damagelocation;
    if (isdefined(shitloc)) {
        return (isinarray(array("torso_upper", "torso_mid"), shitloc) || isinarray(array("torso_lower", "groin"), shitloc));
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0x3e28c973, Offset: 0x958
// Size: 0x6e
function function_ebf05a38(entity) {
    shitloc = entity.damagelocation;
    if (isdefined(shitloc)) {
        return isinarray(array("right_arm_upper", "right_arm_lower", "right_hand", "gun"), shitloc);
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0x51c025e8, Offset: 0x9d0
// Size: 0x66
function function_d63ff497(entity) {
    shitloc = entity.damagelocation;
    if (isdefined(shitloc)) {
        return isinarray(array("left_arm_upper", "left_arm_lower", "left_hand"), shitloc);
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0x4410687, Offset: 0xa40
// Size: 0x5e
function function_26b6e27e(entity) {
    shitloc = entity.damagelocation;
    if (isdefined(shitloc)) {
        return isinarray(array("torso_lower", "groin"), shitloc);
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0x83ac418a, Offset: 0xaa8
// Size: 0x66
function function_603389de(entity) {
    shitloc = entity.damagelocation;
    if (isdefined(shitloc)) {
        return isinarray(array("right_leg_upper", "right_leg_lower", "right_foot"), shitloc);
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0x90ead30c, Offset: 0xb18
// Size: 0x66
function function_13b0963e(entity) {
    shitloc = entity.damagelocation;
    if (isdefined(shitloc)) {
        return isinarray(array("left_leg_upper", "left_leg_lower", "left_foot"), shitloc);
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0x745a3caf, Offset: 0xb88
// Size: 0x40
function explosivekilled(entity) {
    if (entity getblackboardattribute("_damage_weapon_class") == "explosive") {
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0x6f3278f9, Offset: 0xbd0
// Size: 0x68
function electrifiedkilled(entity) {
    if (entity.damageweapon.rootweapon.name == "shotgun_pump_taser") {
        return 1;
    }
    if (entity getblackboardattribute("_damage_mod") == "mod_electrocuted") {
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0xf96b527c, Offset: 0xc40
// Size: 0x40
function burnedkilled(entity) {
    if (entity getblackboardattribute("_damage_mod") == "mod_burned") {
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x1 linked
// Checksum 0x86e047c8, Offset: 0xc88
// Size: 0x5a
function rapskilled(entity) {
    if (isdefined(self.attacker) && isdefined(self.attacker.archetype) && self.attacker.archetype == #"raps") {
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 2, eflags: 0x1 linked
// Checksum 0xafea95d3, Offset: 0xcf0
// Size: 0xce
function function_e2010f4c(entity, var_515373f2) {
    if (isdefined(entity) && isdefined(var_515373f2.var_3156b021) && var_515373f2.var_3156b021.size > 0) {
        foreach (var_4e73c1e in var_515373f2.var_3156b021) {
            if (var_4e73c1e.archetype === entity.archetype) {
                return var_4e73c1e;
            }
        }
    }
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x5 linked
// Checksum 0xf531bb0d, Offset: 0xdc8
// Size: 0x110
function private tookflashbangdamage(entity) {
    if (isdefined(entity.damageweapon) && isdefined(entity.damagemod)) {
        weapon = entity.damageweapon;
        return (entity.damagemod == "MOD_GRENADE_SPLASH" && isdefined(weapon.rootweapon) && (weapon.rootweapon.name == #"flash_grenade" || weapon.rootweapon.name == #"concussion_grenade" || weapon.rootweapon.name == #"proximity_grenade") || isdefined(self.var_40543c03) && self.var_40543c03 == "foam");
    }
    return 0;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 0, eflags: 0x1 linked
// Checksum 0x84d3a8c3, Offset: 0xee0
// Size: 0xee
function bb_getdamagedirection() {
    /#
        if (isdefined(level.var_e638a387)) {
            return level.var_e638a387;
        }
    #/
    if (self.damageyaw > 135 || self.damageyaw <= -135) {
        self.var_ba257100 = "front";
        return "front";
    }
    if (self.damageyaw > 45 && self.damageyaw <= 135) {
        self.var_ba257100 = "right";
        return "right";
    }
    if (self.damageyaw > -45 && self.damageyaw <= 45) {
        self.var_ba257100 = "back";
        return "back";
    }
    self.var_ba257100 = "left";
    return "left";
}

// Namespace aiutility/namespace_7d3e8f59
// Params 0, eflags: 0x1 linked
// Checksum 0x56019b35, Offset: 0xfd8
// Size: 0x1e
function function_7e269d82() {
    if (isdefined(self.var_40543c03)) {
        return self.var_40543c03;
    }
    return "normal";
}

// Namespace aiutility/namespace_7d3e8f59
// Params 0, eflags: 0x1 linked
// Checksum 0x6629d55b, Offset: 0x1000
// Size: 0x368
function bb_actorgetdamagelocation() {
    /#
        if (isdefined(level.var_a3367a70)) {
            return level.var_a3367a70;
        }
    #/
    shitloc = self.damagelocation;
    var_dca3f69c = array();
    if (isdefined(shitloc) && shitloc != "none") {
        if (isinarray(array("helmet", "head", "neck"), shitloc)) {
            var_dca3f69c[var_dca3f69c.size] = "head";
        } else if (isinarray(array("torso_upper", "torso_mid"), shitloc)) {
            var_dca3f69c[var_dca3f69c.size] = "chest";
        } else if (isinarray(array("torso_lower", "groin"), shitloc)) {
            var_dca3f69c[var_dca3f69c.size] = "groin";
        } else if (isinarray(array("torso_lower", "groin"), shitloc)) {
            var_dca3f69c[var_dca3f69c.size] = "legs";
        } else if (isinarray(array("left_arm_upper", "left_arm_lower", "left_hand"), shitloc)) {
            var_dca3f69c[var_dca3f69c.size] = "left_arm";
        } else if (isinarray(array("right_arm_upper", "right_arm_lower", "right_hand", "gun"), shitloc)) {
            var_dca3f69c[var_dca3f69c.size] = "right_arm";
        } else if (isinarray(array("right_leg_upper", "left_leg_upper", "right_leg_lower", "left_leg_lower", "right_foot", "left_foot"), shitloc)) {
            var_dca3f69c[var_dca3f69c.size] = "legs";
        }
    }
    if (var_dca3f69c.size == 0) {
        var_dca3f69c[var_dca3f69c.size] = "chest";
        var_dca3f69c[var_dca3f69c.size] = "groin";
    }
    /#
        assert(var_dca3f69c.size > 0, var_dca3f69c.size);
    #/
    damagelocation = var_dca3f69c[randomint(var_dca3f69c.size)];
    return damagelocation;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 0, eflags: 0x1 linked
// Checksum 0xfc5d408f, Offset: 0x1370
// Size: 0x186
function bb_getdamageweaponclass() {
    if (isdefined(self.damagemod)) {
        if (isinarray(array("mod_rifle_bullet"), tolower(self.damagemod))) {
            return "rifle";
        }
        if (isinarray(array("mod_pistol_bullet"), tolower(self.damagemod))) {
            return "pistol";
        }
        if (isinarray(array("mod_melee", "mod_melee_assassinate", "mod_melee_weapon_butt"), tolower(self.damagemod))) {
            return "melee";
        }
        if (isinarray(array("mod_grenade", "mod_grenade_splash", "mod_projectile", "mod_projectile_splash", "mod_explosive"), tolower(self.damagemod))) {
            return "explosive";
        }
    }
    return "rifle";
}

// Namespace aiutility/namespace_7d3e8f59
// Params 0, eflags: 0x1 linked
// Checksum 0x6b0bec77, Offset: 0x1500
// Size: 0x72
function bb_getdamageweapon() {
    if (isdefined(self.var_9f447e7e) && isdefined(self.var_9f447e7e.name)) {
        return self.var_9f447e7e.name;
    }
    if (isdefined(self.damageweapon) && isdefined(self.damageweapon.name)) {
        return self.damageweapon.name;
    }
    return "unknown";
}

// Namespace aiutility/namespace_7d3e8f59
// Params 0, eflags: 0x1 linked
// Checksum 0xb2c09694, Offset: 0x1580
// Size: 0x32
function bb_getdamagemod() {
    if (isdefined(self.damagemod)) {
        return tolower(self.damagemod);
    }
    return "unknown";
}

// Namespace aiutility/namespace_7d3e8f59
// Params 0, eflags: 0x1 linked
// Checksum 0xb44f92af, Offset: 0x15c0
// Size: 0xea
function bb_getdamagetaken() {
    /#
        if (isdefined(level.var_9518bd54)) {
            return level.var_9518bd54;
        }
    #/
    damagetaken = self.damagetaken;
    maxhealth = self.maxhealth;
    var_20c83a94 = "light";
    if (isalive(self)) {
        ratio = damagetaken / self.maxhealth;
        if (ratio > 0.7) {
            var_20c83a94 = "heavy";
        }
        self.lastdamagetime = gettime();
    } else {
        ratio = damagetaken / self.maxhealth;
        if (ratio > 0.7) {
            var_20c83a94 = "heavy";
        }
    }
    return var_20c83a94;
}

// Namespace aiutility/namespace_7d3e8f59
// Params 0, eflags: 0x1 linked
// Checksum 0x48dc7275, Offset: 0x16b8
// Size: 0x2a
function bb_idgungetdamagedirection() {
    if (isdefined(self.var_ba257100)) {
        return self.var_ba257100;
    }
    return self bb_getdamagedirection();
}

// Namespace aiutility/namespace_7d3e8f59
// Params 0, eflags: 0x1 linked
// Checksum 0xc0f241d0, Offset: 0x16f0
// Size: 0x248
function bb_actorgetfataldamagelocation() {
    /#
        if (isdefined(level.var_b2790b1d)) {
            return level.var_b2790b1d;
        }
    #/
    shitloc = self.damagelocation;
    if (isdefined(shitloc)) {
        if (isinarray(array("helmet", "head", "neck"), shitloc)) {
            return "head";
        }
        if (isinarray(array("torso_upper", "torso_mid"), shitloc)) {
            return "chest";
        }
        if (isinarray(array("torso_lower", "groin"), shitloc)) {
            return "hips";
        }
        if (isinarray(array("right_arm_upper", "right_arm_lower", "right_hand", "gun"), shitloc)) {
            return "right_arm";
        }
        if (isinarray(array("left_arm_upper", "left_arm_lower", "left_hand"), shitloc)) {
            return "left_arm";
        }
        if (isinarray(array("right_leg_upper", "left_leg_upper", "right_leg_lower", "left_leg_lower", "right_foot", "left_foot"), shitloc)) {
            return "legs";
        }
    }
    var_17eff272 = array("chest", "hips");
    return var_17eff272[randomint(var_17eff272.size)];
}

// Namespace aiutility/namespace_7d3e8f59
// Params 3, eflags: 0x1 linked
// Checksum 0xae6a2909, Offset: 0x1940
// Size: 0x25e
function addaioverridedamagecallback(entity, callback, var_46c8afbb) {
    /#
        assert(isentity(entity));
    #/
    /#
        assert(isfunctionptr(callback));
    #/
    /#
        assert(!isdefined(entity.aioverridedamage) || isarray(entity.aioverridedamage));
    #/
    if (!isdefined(entity.aioverridedamage)) {
        entity.aioverridedamage = [];
    } else if (!isarray(entity.aioverridedamage)) {
        entity.aioverridedamage = array(entity.aioverridedamage);
    }
    if (isdefined(var_46c8afbb) && var_46c8afbb) {
        var_e610c184 = [];
        var_e610c184[var_e610c184.size] = callback;
        foreach (override in entity.aioverridedamage) {
            var_e610c184[var_e610c184.size] = override;
        }
        entity.aioverridedamage = var_e610c184;
    } else {
        if (!isdefined(entity.aioverridedamage)) {
            entity.aioverridedamage = [];
        } else if (!isarray(entity.aioverridedamage)) {
            entity.aioverridedamage = array(entity.aioverridedamage);
        }
        entity.aioverridedamage[entity.aioverridedamage.size] = callback;
    }
}

// Namespace aiutility/namespace_7d3e8f59
// Params 2, eflags: 0x1 linked
// Checksum 0xd81da7cf, Offset: 0x1ba8
// Size: 0x142
function removeaioverridedamagecallback(entity, callback) {
    /#
        assert(isentity(entity));
    #/
    /#
        assert(isfunctionptr(callback));
    #/
    /#
        assert(isarray(entity.aioverridedamage));
    #/
    var_91b39ccf = entity.aioverridedamage;
    entity.aioverridedamage = [];
    foreach (value in var_91b39ccf) {
        if (value != callback) {
            entity.aioverridedamage[entity.aioverridedamage.size] = value;
        }
    }
}

// Namespace aiutility/namespace_7d3e8f59
// Params 1, eflags: 0x0
// Checksum 0x63bb2ed7, Offset: 0x1cf8
// Size: 0x1a
function clearaioverridedamagecallbacks(entity) {
    entity.aioverridedamage = [];
}

// Namespace aiutility/namespace_7d3e8f59
// Params 2, eflags: 0x1 linked
// Checksum 0x320f4f62, Offset: 0x1d20
// Size: 0x12e
function addaioverridekilledcallback(entity, callback) {
    /#
        assert(isentity(entity));
    #/
    /#
        assert(isfunctionptr(callback));
    #/
    /#
        assert(!isdefined(entity.var_da7889fd) || isarray(entity.var_da7889fd));
    #/
    if (!isdefined(entity.var_da7889fd)) {
        entity.var_da7889fd = [];
    } else if (!isarray(entity.var_da7889fd)) {
        entity.var_da7889fd = array(entity.var_da7889fd);
    }
    entity.var_da7889fd[entity.var_da7889fd.size] = callback;
}

