// Atian COD Tools GSC decompiler test
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace vehicle;

// Namespace vehicle/vehicle
// Params 0, eflags: 0x2
// Checksum 0x250a5570, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"vehicle", &__init__, undefined, undefined);
}

// Namespace vehicle/vehicle
// Params 0, eflags: 0x0
// Checksum 0x2a666064, Offset: 0xc0
// Size: 0x32
function __init__() {
    if (!isdefined(level._effect)) {
        level._effect = [];
    }
    level.vehicles_inited = 1;
}

// Namespace vehicle/vehicle
// Params 1, eflags: 0x0
// Checksum 0xabaf1b7, Offset: 0x100
// Size: 0x378
function vehicle_rumble(localclientnum) {
    self endon(#"death");
    if (!isdefined(level.vehicle_rumble)) {
        return;
    }
    type = self.vehicletype;
    if (!isdefined(level.vehicle_rumble[type])) {
        return;
    }
    rumblestruct = level.vehicle_rumble[type];
    height = rumblestruct.radius * 2;
    zoffset = -1 * rumblestruct.radius;
    if (!isdefined(self.rumbleon)) {
        self.rumbleon = 1;
    }
    if (isdefined(rumblestruct.scale)) {
        self.rumble_scale = rumblestruct.scale;
    } else {
        self.rumble_scale = 0.15;
    }
    if (isdefined(rumblestruct.duration)) {
        self.rumble_duration = rumblestruct.duration;
    } else {
        self.rumble_duration = 4.5;
    }
    if (isdefined(rumblestruct.radius)) {
        self.rumble_radius = rumblestruct.radius;
    } else {
        self.rumble_radius = 600;
    }
    if (isdefined(rumblestruct.basetime)) {
        self.rumble_basetime = rumblestruct.basetime;
    } else {
        self.rumble_basetime = 1;
    }
    if (isdefined(rumblestruct.randomaditionaltime)) {
        self.rumble_randomaditionaltime = rumblestruct.randomaditionaltime;
    } else {
        self.rumble_randomaditionaltime = 1;
    }
    self.player_touching = 0;
    radius_squared = rumblestruct.radius * rumblestruct.radius;
    while (true) {
        if (distancesquared(self.origin, level.localplayers[localclientnum].origin) > radius_squared || self getspeed() < 35) {
            wait(0.2);
            continue;
        }
        if (isdefined(self.rumbleon) && !self.rumbleon) {
            wait(0.2);
            continue;
        }
        self playrumblelooponentity(localclientnum, level.vehicle_rumble[type].rumble);
        while (distancesquared(self.origin, level.localplayers[localclientnum].origin) < radius_squared && self getspeed() > 5) {
            wait(self.rumble_basetime + randomfloat(self.rumble_randomaditionaltime));
        }
        self stoprumble(localclientnum, level.vehicle_rumble[type].rumble);
    }
}

// Namespace vehicle/vehicle
// Params 1, eflags: 0x0
// Checksum 0x4c7bfbc0, Offset: 0x480
// Size: 0xc
function vehicle_variants(localclientnum) {
    
}

