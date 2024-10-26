#using scripts\zm\weapons\zm_weap_sticky_grenade.csc;
#using scripts\weapons\acid_bomb.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\filter_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\struct.csc;

#namespace callback;

// Namespace callback/callbacks
// Params 0, eflags: 0x2
// Checksum 0x30280d7f, Offset: 0x108
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"callback", &__init__, undefined, undefined);
}

// Namespace callback/callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0x15dfe25d, Offset: 0x150
// Size: 0x1c
function __init__() {
    level thread set_default_callbacks();
}

// Namespace callback/callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0x611de0d2, Offset: 0x178
// Size: 0xc6
function set_default_callbacks() {
    level.callbackplayerspawned = &playerspawned;
    level.callbacklocalclientconnect = &localclientconnect;
    level.callbackplayerlaststand = &playerlaststand;
    level.callbackentityspawned = &entityspawned;
    level.callbackhostmigration = &host_migration;
    level.callbackplayaifootstep = &footsteps::playaifootstep;
    level._custom_weapon_cb_func = &spawned_weapon_type;
    level.var_6b11d5f6 = &function_cbfd8fd6;
}

// Namespace callback/callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0x2679ffaf, Offset: 0x248
// Size: 0x78
function localclientconnect(localclientnum) {
    println("<dev string:x38>" + localclientnum);
    callback(#"on_localclient_connect", localclientnum);
    if (isdefined(level.charactercustomizationsetup)) {
        [[ level.charactercustomizationsetup ]](localclientnum);
    }
}

// Namespace callback/callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0x79780da, Offset: 0x2c8
// Size: 0x44
function playerlaststand(localclientnum) {
    self endon(#"death");
    callback(#"on_player_laststand", localclientnum);
}

// Namespace callback/callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0x7a93a374, Offset: 0x318
// Size: 0xee
function playerspawned(localclientnum) {
    self endon(#"death");
    util::function_89a98f85();
    if (isdefined(level._playerspawned_override)) {
        self thread [[ level._playerspawned_override ]](localclientnum);
        return;
    }
    println("<dev string:x67>");
    if (self function_21c0fa55()) {
        callback(#"on_localplayer_spawned", localclientnum);
    }
    callback(#"on_player_spawned", localclientnum);
    level.localplayers = getlocalplayers();
}

// Namespace callback/callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0xf3ae490b, Offset: 0x410
// Size: 0x380
function entityspawned(localclientnum) {
    self endon(#"death");
    util::function_89a98f85();
    if (isplayer(self)) {
        if (isdefined(level._clientfaceanimonplayerspawned)) {
            self thread [[ level._clientfaceanimonplayerspawned ]](localclientnum);
        }
    }
    if (isdefined(level._entityspawned_override)) {
        self thread [[ level._entityspawned_override ]](localclientnum);
        return;
    }
    if (!isdefined(self.type)) {
        println("<dev string:x78>");
        return;
    }
    if (self.type == "missile") {
        if (isdefined(level._custom_weapon_cb_func)) {
            self thread [[ level._custom_weapon_cb_func ]](localclientnum);
        }
        switch (self.weapon.name) {
        case #"eq_acid_bomb":
            self thread acid_bomb::spawned(localclientnum);
            break;
        case #"sticky_grenade":
            self thread sticky_grenade::spawned(localclientnum);
            break;
        }
        return;
    }
    if (self.type == "vehicle" || self.type == "helicopter" || self.type == "plane") {
        if (isdefined(level._customvehiclecbfunc)) {
            self thread [[ level._customvehiclecbfunc ]](localclientnum);
        }
        self thread vehicle::field_toggle_exhaustfx_handler(localclientnum, undefined, 0, 1);
        self thread vehicle::field_toggle_lights_handler(localclientnum, undefined, 0, 1);
        if (self.type == "plane" || self.type == "helicopter") {
            self thread vehicle::aircraft_dustkick();
        }
        if (self.type == "helicopter") {
        }
        if (self.archetype === #"bat") {
            if (isdefined(level._customactorcbfunc)) {
                self thread [[ level._customactorcbfunc ]](localclientnum);
            }
        }
        return;
    }
    if (self.type == "actor") {
        if (isdefined(level._customactorcbfunc)) {
            self thread [[ level._customactorcbfunc ]](localclientnum);
        }
        return;
    }
    if (self.type == "scriptmover") {
        if (isdefined(self.weapon)) {
            if (isdefined(level.var_6b11d5f6)) {
                self thread [[ level.var_6b11d5f6 ]](localclientnum);
            }
        }
        return;
    }
    if (self.type == "NA") {
        if (isdefined(self.weapon)) {
            if (isdefined(level.var_6b11d5f6)) {
                self thread [[ level.var_6b11d5f6 ]](localclientnum);
            }
        }
    }
}

// Namespace callback/callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0xce6bf76e, Offset: 0x798
// Size: 0x24
function host_migration(localclientnum) {
    level thread prevent_round_switch_animation();
}

// Namespace callback/callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0x2e296605, Offset: 0x7c8
// Size: 0xa
function prevent_round_switch_animation() {
    wait 3;
}

