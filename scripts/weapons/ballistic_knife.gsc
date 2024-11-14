#using scripts\weapons\weaponobjects;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\challenges_shared;

#namespace ballistic_knife;

// Namespace ballistic_knife/ballistic_knife
// Params 0, eflags: 0x1 linked
// Checksum 0x412e7e73, Offset: 0xc8
// Size: 0x294
function init_shared() {
    level.var_f676fe5a = #"hash_4b7ed37163f1ec57";
    weaponobjects::function_e6400478(#"special_ballisticknife_t8_dw", &createballisticknifewatcher, 0);
    weaponobjects::function_e6400478(#"special_ballisticknife_t8_dw_dw", &createballisticknifewatcher, 0);
    weaponobjects::function_e6400478(#"hash_4646a4e86c781e84", &createballisticknifewatcher, 0);
    weaponobjects::function_e6400478(#"special_crossbow_t8", &createballisticknifewatcher, 0);
    weaponobjects::function_dcc8b5d5(#"special_crossbow_t8", "pistolscope", #"hash_6c40a7a156b05224");
    weaponobjects::function_e6400478(#"hash_6c40a7a156b05224", &createballisticknifewatcher, 0);
    if (isdefined(level.var_b68902c4) && level.var_b68902c4) {
        weaponobjects::function_e6400478(#"special_ballisticknife_t8_dw_upgraded", &createballisticknifewatcher, 0);
        weaponobjects::function_e6400478(#"special_ballisticknife_t8_dw_upgraded_dw", &createballisticknifewatcher, 0);
        weaponobjects::function_e6400478(#"hash_176b8e0e47a43cb9", &createballisticknifewatcher, 0);
        weaponobjects::function_e6400478(#"special_crossbow_t8_upgraded", &createballisticknifewatcher, 0);
        weaponobjects::function_dcc8b5d5(#"special_crossbow_t8_upgraded", "pistolscope", #"hash_73258bb36ebe26d");
        weaponobjects::function_e6400478(#"hash_73258bb36ebe26d", &createballisticknifewatcher, 0);
    }
}

// Namespace ballistic_knife/ballistic_knife
// Params 2, eflags: 0x1 linked
// Checksum 0xf5e67597, Offset: 0x368
// Size: 0x3f8
function onspawn(watcher, player) {
    player endon(#"death", #"disconnect");
    level endon(#"game_ended");
    waitresult = self waittill(#"stationary", #"death");
    if (!isdefined(self)) {
        return;
    }
    endpos = waitresult.position;
    normal = waitresult.normal;
    angles = waitresult.direction;
    attacker = waitresult.attacker;
    prey = waitresult.target;
    bone = waitresult.bone_name;
    isfriendly = 0;
    if (isdefined(endpos)) {
        retrievable_model = spawn("script_model", endpos);
        retrievable_model setmodel(watcher.weapon.projectilemodel);
        retrievable_model setteam(player.team);
        retrievable_model setowner(player);
        retrievable_model.owner = player;
        retrievable_model.angles = angles;
        retrievable_model.name = watcher.weapon;
        retrievable_model.weapon = watcher.weapon;
        retrievable_model.targetname = "sticky_weapon";
        if (isdefined(prey)) {
            retrievable_model.prey = prey;
            if (level.teambased && player.team == prey.team) {
                isfriendly = 1;
            }
            if (!isfriendly) {
                if (isalive(prey) || !isdefined(prey gettagorigin(bone))) {
                    retrievable_model droptoground(retrievable_model.origin, 80);
                } else {
                    retrievable_model linkto(prey, bone);
                }
            } else if (isfriendly) {
                retrievable_model physicslaunch(normal, (randomint(10), randomint(10), randomint(10)));
                normal = (0, 0, 1);
            }
        }
        retrievable_model.normal = normal;
        watcher.objectarray[watcher.objectarray.size] = retrievable_model;
        if (isfriendly) {
            retrievable_model waittill(#"stationary");
        }
        if (!isdefined(retrievable_model)) {
            return;
        }
        retrievable_model thread dropknivestoground();
        player notify(#"ballistic_knife_stationary", {#retrievable_model:retrievable_model});
    }
}

// Namespace ballistic_knife/ballistic_knife
// Params 2, eflags: 0x1 linked
// Checksum 0x579f566b, Offset: 0x768
// Size: 0x23c
function onspawnretrievetrigger(watcher, player) {
    player endon(#"death");
    player endon(#"disconnect");
    level endon(#"game_ended");
    waitresult = player waittill(#"ballistic_knife_stationary");
    retrievable_model = waitresult.retrievable_model;
    if (!isdefined(retrievable_model)) {
        return;
    }
    normal = retrievable_model.normal;
    prey = retrievable_model.prey;
    vec_scale = 10;
    trigger_pos = (0, 0, 0);
    if (isdefined(prey) && (isplayer(prey) || isai(prey))) {
        trigger_pos = prey.origin + (0, 0, vec_scale);
    } else {
        trigger_pos = retrievable_model.origin + vec_scale * normal;
    }
    retrievable_model clientfield::set("retrievable", 1);
    retrievable_model clientfield::set("enemyequip", 1);
    retrievable_model weaponobjects::function_57152a5(watcher, player, trigger_pos);
    retrievable_model.pickuptrigger enablelinkto();
    if (isdefined(prey)) {
        retrievable_model.pickuptrigger linkto(prey);
    } else {
        retrievable_model.pickuptrigger linkto(retrievable_model);
    }
    retrievable_model thread weaponobjects::watchshutdown(player);
}

// Namespace ballistic_knife/ballistic_knife
// Params 2, eflags: 0x1 linked
// Checksum 0x903154e0, Offset: 0x9b0
// Size: 0x44
function onpickup(player, heldweapon) {
    self weaponobjects::function_db70257(player, heldweapon);
    self delete();
}

// Namespace ballistic_knife/ballistic_knife
// Params 0, eflags: 0x0
// Checksum 0x7cc095d3, Offset: 0xa00
// Size: 0x54
function destroy_ent() {
    if (isdefined(self)) {
        pickuptrigger = self.pickuptrigger;
        if (isdefined(pickuptrigger)) {
            pickuptrigger delete();
        }
        self delete();
    }
}

// Namespace ballistic_knife/ballistic_knife
// Params 0, eflags: 0x1 linked
// Checksum 0x2da8affd, Offset: 0xa60
// Size: 0x70
function dropknivestoground() {
    self endon(#"death");
    for (;;) {
        waitresult = level waittill(#"drop_objects_to_ground");
        self droptoground(waitresult.position, waitresult.radius);
    }
}

// Namespace ballistic_knife/ballistic_knife
// Params 2, eflags: 0x1 linked
// Checksum 0x829762ec, Offset: 0xad8
// Size: 0x7c
function droptoground(origin, radius) {
    if (distancesquared(origin, self.origin) < radius * radius) {
        self physicslaunch((0, 0, 1), (5, 5, 5));
        self thread updateretrievetrigger();
    }
}

// Namespace ballistic_knife/ballistic_knife
// Params 0, eflags: 0x1 linked
// Checksum 0x2ee8b365, Offset: 0xb60
// Size: 0x9c
function updateretrievetrigger() {
    self endon(#"death");
    self waittill(#"stationary");
    trigger = self.pickuptrigger;
    if (isdefined(trigger)) {
        trigger.origin = (self.origin[0], self.origin[1], self.origin[2] + 10);
        trigger linkto(self);
    }
}

// Namespace ballistic_knife/ballistic_knife
// Params 0, eflags: 0x1 linked
// Checksum 0x7ea1606b, Offset: 0xc08
// Size: 0x54
function onfizzleout() {
    self endon(#"death");
    playfx(level.var_f676fe5a, self.origin);
    self delete();
}

// Namespace ballistic_knife/ballistic_knife
// Params 1, eflags: 0x1 linked
// Checksum 0xcf06188f, Offset: 0xc68
// Size: 0x96
function createballisticknifewatcher(watcher) {
    watcher.onspawn = &onspawn;
    watcher.pickup = &onpickup;
    watcher.onfizzleout = &onfizzleout;
    watcher.ondetonatecallback = &weaponobjects::deleteent;
    watcher.onspawnretrievetriggers = &onspawnretrievetrigger;
    watcher.storedifferentobject = 1;
}

