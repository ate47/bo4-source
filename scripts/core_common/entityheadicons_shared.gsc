#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace entityheadicons;

// Namespace entityheadicons/entityheadicons_shared
// Params 0, eflags: 0x0
// Checksum 0xf4ea57e0, Offset: 0x90
// Size: 0x24
function init_shared() {
    callback::on_start_gametype(&start_gametype);
}

// Namespace entityheadicons/entityheadicons_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xbbf840f2, Offset: 0xc0
// Size: 0x3e
function start_gametype() {
    if (!level.teambased) {
        return;
    }
    if (!isdefined(level.setentityheadicon)) {
        level.setentityheadicon = &setentityheadicon;
    }
}

// Namespace entityheadicons/entityheadicons_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x1e430ef8, Offset: 0x108
// Size: 0x204
function setentityheadicon(team, owner, objective) {
    if (!level.teambased && !isdefined(owner)) {
        return;
    }
    if (!isdefined(self.entityheadiconteam)) {
        self.entityheadiconteam = #"none";
        self.entityheadobjectives = [];
    }
    if (level.teambased && !isdefined(owner)) {
        if (team == self.entityheadiconteam) {
            return;
        }
        self.entityheadiconteam = team;
    }
    destroyentityheadicons();
    self.entityheadobjectives = [];
    self notify(#"kill_entity_headicon_thread");
    if (isdefined(objective)) {
        if (isdefined(owner) && !level.teambased) {
            if (!isplayer(owner)) {
                assert(isdefined(owner.owner), "<dev string:x38>");
                owner = owner.owner;
            }
            if (isdefined(objective)) {
                if (team !== #"none") {
                    owner updateentityheadteamobjective(self, team, objective);
                } else {
                    owner updateentityheadclientobjective(self, objective);
                }
            }
        } else if (isdefined(owner) && team != #"none") {
            if (isdefined(objective)) {
                owner updateentityheadteamobjective(self, team, objective);
            }
        }
    }
    self thread destroyheadiconsondeath();
}

// Namespace entityheadicons/entityheadicons_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x4ab53817, Offset: 0x318
// Size: 0xb2
function updateentityheadteamobjective(entity, team, objective) {
    headiconobjectiveid = gameobjects::get_next_obj_id();
    objective_add(headiconobjectiveid, "active", entity, objective);
    objective_setteam(headiconobjectiveid, team);
    function_3ae6fa3(headiconobjectiveid, team, 1);
    entity.entityheadobjectives[entity.entityheadobjectives.size] = headiconobjectiveid;
}

// Namespace entityheadicons/entityheadicons_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf894fd9b, Offset: 0x3d8
// Size: 0xa2
function updateentityheadclientobjective(entity, objective) {
    headiconobjectiveid = gameobjects::get_next_obj_id();
    objective_add(headiconobjectiveid, "active", entity, objective);
    objective_setinvisibletoall(headiconobjectiveid);
    objective_setvisibletoplayer(headiconobjectiveid, self);
    entity.entityheadobjectives[entity.entityheadobjectives.size] = headiconobjectiveid;
}

// Namespace entityheadicons/entityheadicons_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb74da665, Offset: 0x488
// Size: 0x5c
function destroyheadiconsondeath() {
    self notify(#"destroyheadiconsondeath_singleton");
    self endon(#"destroyheadiconsondeath_singleton");
    self waittill(#"death", #"hacked");
    destroyentityheadicons();
}

// Namespace entityheadicons/entityheadicons_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xec6faa5d, Offset: 0x4f0
// Size: 0xa2
function destroyentityheadicons() {
    if (isdefined(self.entityheadobjectives)) {
        for (i = 0; i < self.entityheadobjectives.size; i++) {
            if (isdefined(self.entityheadobjectives[i])) {
                gameobjects::release_obj_id(self.entityheadobjectives[i]);
                objective_delete(self.entityheadobjectives[i]);
            }
        }
    }
    if (isdefined(self)) {
        self.entityheadobjectives = [];
    }
}

