#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;

#namespace wz_perk_tracker;

// Namespace wz_perk_tracker/wz_perk_tracker
// Params 0, eflags: 0x2
// Checksum 0xb5066fc9, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_perk_tracker", &__init__, undefined, undefined);
}

// Namespace wz_perk_tracker/wz_perk_tracker
// Params 0, eflags: 0x0
// Checksum 0xa3aa220b, Offset: 0x110
// Size: 0x74
function __init__() {
    if (isdefined(getgametypesetting(#"hash_1d02e28ba907a343")) && getgametypesetting(#"hash_1d02e28ba907a343")) {
        return;
    }
    callback::on_localclient_connect(&on_player_connect);
}

// Namespace wz_perk_tracker/wz_perk_tracker
// Params 1, eflags: 0x0
// Checksum 0x4762ee26, Offset: 0x190
// Size: 0x24
function on_player_connect(localclientnum) {
    level thread tracker(localclientnum);
}

// Namespace wz_perk_tracker/wz_perk_tracker
// Params 1, eflags: 0x0
// Checksum 0x99e22e6a, Offset: 0x1c0
// Size: 0x1fa
function tracker(localclientnum) {
    while (true) {
        wait 0.2;
        if (!function_5778f82(localclientnum, #"specialty_tracker")) {
            continue;
        }
        origin = getlocalclientpos(localclientnum);
        players = getplayers(localclientnum);
        players = arraysortclosest(players, origin, undefined, 1, 6000);
        tracked = 0;
        foreach (player in players) {
            if (tracked >= 10 || !isalive(player) || player function_83973173() || isdefined(getplayervehicle(player))) {
                player.tracker_last_pos = undefined;
                continue;
            }
            tracked++;
            if (!isdefined(player.tracker_last_pos)) {
                player.tracker_last_pos = player.origin;
            }
            positionandrotationstruct = player gettrackerfxposition(localclientnum);
            if (isdefined(positionandrotationstruct)) {
                player tracker_playfx(localclientnum, positionandrotationstruct);
            }
        }
        players = undefined;
    }
}

// Namespace wz_perk_tracker/wz_perk_tracker
// Params 1, eflags: 0x0
// Checksum 0x4a38efec, Offset: 0x3c8
// Size: 0x26e
function gettrackerfxposition(localclientnum) {
    positionandrotation = undefined;
    offset = (0, 0, getdvarfloat(#"perk_tracker_fx_foot_height", 0));
    dist2 = 1024;
    if (isdefined(self.trailrightfoot) && self.trailrightfoot) {
        fx = "player/fx_plyr_footstep_tracker_r_wz";
    } else {
        fx = "player/fx_plyr_footstep_tracker_l_wz";
    }
    pos = self.origin + offset;
    fwd = anglestoforward(self.angles);
    right = anglestoright(self.angles);
    up = anglestoup(self.angles);
    vel = self getvelocity();
    if (lengthsquared(vel) > 1) {
        up = vectorcross(vel, right);
        if (lengthsquared(up) < 0.0001) {
            up = vectorcross(fwd, vel);
        }
        fwd = vel;
    }
    if (distancesquared(self.tracker_last_pos, pos) > dist2) {
        positionandrotation = spawnstruct();
        positionandrotation.fx = fx;
        positionandrotation.pos = pos;
        positionandrotation.fwd = fwd;
        positionandrotation.up = up;
        self.tracker_last_pos = self.origin;
        if (isdefined(self.trailrightfoot) && self.trailrightfoot) {
            self.trailrightfoot = 0;
        } else {
            self.trailrightfoot = 1;
        }
    }
    return positionandrotation;
}

// Namespace wz_perk_tracker/wz_perk_tracker
// Params 2, eflags: 0x0
// Checksum 0x2ef12d9, Offset: 0x640
// Size: 0x5e
function tracker_playfx(localclientnum, positionandrotationstruct) {
    handle = playfx(localclientnum, positionandrotationstruct.fx, positionandrotationstruct.pos, positionandrotationstruct.fwd, positionandrotationstruct.up);
}

