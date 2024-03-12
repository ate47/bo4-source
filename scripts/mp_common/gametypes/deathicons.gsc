// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace deathicons;

// Namespace deathicons/deathicons
// Params 0, eflags: 0x2
// Checksum 0x725de01f, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"deathicons", &__init__, undefined, undefined);
}

// Namespace deathicons/deathicons
// Params 0, eflags: 0x0
// Checksum 0xd4559993, Offset: 0xf0
// Size: 0x44
function __init__() {
    callback::on_start_gametype(&init);
    callback::on_connect(&on_player_connect);
}

// Namespace deathicons/deathicons
// Params 0, eflags: 0x0
// Checksum 0xd3a2c9f2, Offset: 0x140
// Size: 0x3c
function init() {
    if (!isdefined(level.ragdoll_override)) {
        level.ragdoll_override = &ragdoll_override;
    }
    if (!level.teambased) {
        return;
    }
}

// Namespace deathicons/deathicons
// Params 0, eflags: 0x0
// Checksum 0x234cb8c1, Offset: 0x188
// Size: 0xe
function on_player_connect() {
    self.selfdeathicons = [];
}

// Namespace deathicons/deathicons
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x1a0
// Size: 0x4
function update_enabled() {
    
}

// Namespace deathicons/deathicons
// Params 3, eflags: 0x0
// Checksum 0x591d8044, Offset: 0x1b0
// Size: 0x234
function add(entity, dyingplayer, team) {
    if (!level.teambased) {
        return;
    }
    timeout = getdvarfloat(#"scr_deathicon_time", 5);
    iconorg = entity.origin;
    dyingplayer endon(#"spawned_player", #"disconnect");
    waitframe(1);
    util::waittillslowprocessallowed();
    /#
        assert(isdefined(level.teams[team]));
    #/
    /#
        assert(isdefined(level.teamindex[team]));
    #/
    if (getdvarint(#"ui_hud_showdeathicons", 1) == 0) {
        return;
    }
    if (level.hardcoremode) {
        return;
    }
    if (sessionmodeiswarzonegame()) {
        return;
    }
    objectivename = sessionmodeiswarzonegame() ? #"headicon_dead_wz" : #"headicon_dead";
    deathiconobjid = gameobjects::get_next_obj_id();
    objective_add(deathiconobjid, "active", iconorg, objectivename, dyingplayer);
    objective_setteam(deathiconobjid, team);
    function_3ae6fa3(deathiconobjid, team, 1);
    level thread destroy_slowly(timeout, deathiconobjid);
}

// Namespace deathicons/deathicons
// Params 2, eflags: 0x0
// Checksum 0xaaa7298b, Offset: 0x3f0
// Size: 0x6c
function destroy_slowly(timeout, deathiconobjid) {
    wait(timeout);
    objective_setstate(deathiconobjid, "done");
    wait(1);
    objective_delete(deathiconobjid);
    gameobjects::release_obj_id(deathiconobjid);
}

// Namespace deathicons/deathicons
// Params 10, eflags: 0x0
// Checksum 0x2533a974, Offset: 0x468
// Size: 0xd4
function ragdoll_override(idamage, smeansofdeath, sweapon, shitloc, vdir, vattackerorigin, deathanimduration, einflictor, ragdoll_jib, body) {
    if (smeansofdeath == "MOD_FALLING" && self isonground() == 1) {
        body startragdoll();
        if (!isdefined(self.switching_teams)) {
            thread add(body, self, self.team);
        }
        return 1;
    }
    return 0;
}

