// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace sensor_dart;

// Namespace sensor_dart/sensor_dart
// Params 0, eflags: 0x2
// Checksum 0x84e7d067, Offset: 0x1d0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"sensor_dart", &init_shared, undefined, undefined);
}

// Namespace sensor_dart/sensor_dart
// Params 1, eflags: 0x0
// Checksum 0xce3d8b2e, Offset: 0x218
// Size: 0xd4
function init_shared(localclientnum) {
    clientfield::register("missile", "sensor_dart_state", 1, 1, "int", &function_73021afc, 0, 1);
    clientfield::register("clientuimodel", "hudItems.sensorDartCount", 1, 3, "int", undefined, 0, 0);
    callback::on_localclient_connect(&player_init);
    callback::add_weapon_type("eq_sensor", &arrow_spawned);
}

// Namespace sensor_dart/sensor_dart
// Params 1, eflags: 0x0
// Checksum 0x8042f98f, Offset: 0x2f8
// Size: 0x1a
function arrow_spawned(localclientnum) {
    self.var_44dad7e8 = 1;
}

// Namespace sensor_dart/sensor_dart
// Params 1, eflags: 0x0
// Checksum 0xc4582f1a, Offset: 0x320
// Size: 0x24
function player_init(localclientnum) {
    self thread on_game_ended(localclientnum);
}

// Namespace sensor_dart/sensor_dart
// Params 7, eflags: 0x4
// Checksum 0xff544c97, Offset: 0x350
// Size: 0x162
function private function_73021afc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    starttime = gettime();
    while (isdefined(self) && !self hasdobj(localclientnum)) {
        if (gettime() - starttime > 1000) {
            return;
        }
        waitframe(1);
    }
    if (!isdefined(self)) {
        return;
    }
    self function_8e04481f();
    switch (newval) {
    case 0:
    default:
        self disablevisioncircle(localclientnum);
        return;
    case 1:
        self thread function_a252eaf0(localclientnum);
        self thread function_e3a084cd(localclientnum);
        self hideunseencompassicon();
        return;
    }
}

// Namespace sensor_dart/sensor_dart
// Params 1, eflags: 0x4
// Checksum 0x7475ba8d, Offset: 0x4c0
// Size: 0x84
function private function_a252eaf0(localclientnum) {
    var_9cf4b61c = self getentitynumber();
    self waittill(#"death");
    if (isdefined(self.var_b44c157f)) {
        self.var_b44c157f delete();
    }
    disablevisioncirclebyentnum(localclientnum, var_9cf4b61c);
}

// Namespace sensor_dart/sensor_dart
// Params 1, eflags: 0x4
// Checksum 0x8f6d6c96, Offset: 0x550
// Size: 0x584
function private function_e3a084cd(localclientnum) {
    self setcompassicon("minimap_sensor_dart_flying");
    self function_8e04481f();
    self function_a5edb367(#"neutral");
    self thread function_6527a2e9(localclientnum, "o_recon_sensor_gun_projectile_closed_idle");
    var_9cf4b61c = self getentitynumber();
    self endon(#"death");
    var_18452954 = getservertime(localclientnum);
    startorigin = self.origin;
    var_dc3f8ecd = startorigin;
    var_3d3d7bb1 = 0;
    localplayer = function_5c10bd79(localclientnum);
    self.var_b44c157f = spawn(localclientnum, self.origin, "script_model", localplayer getentitynumber(), self.team);
    self.var_b44c157f setmodel(#"tag_origin");
    self.var_b44c157f linkto(self);
    self.var_b44c157f setcompassicon("minimap_sensor_dart_pip");
    self.var_b44c157f function_8e04481f();
    self.var_b44c157f function_5e00861(0.25);
    self.var_b44c157f function_a5edb367(#"neutral");
    while (var_3d3d7bb1 < 250) {
        var_dc3f8ecd = self.origin;
        var_450cbe48 = getservertime(localclientnum);
        elapsedtime = var_450cbe48 - var_18452954;
        if (1) {
            var_e460f21 = math::clamp(elapsedtime / 500, 0, 1);
            radius = lerpfloat(200, 600, var_e460f21);
            distance = distance2d(self.origin, startorigin);
            if (distance > 200) {
                self.angles = vectortoangles(self.origin - startorigin);
                var_354c76a5 = atan(radius / distance);
                if (var_3d3d7bb1 > 0) {
                    var_354c76a5 = var_354c76a5 * (250 - var_3d3d7bb1) / 250;
                    self function_5e00861(0);
                } else {
                    self function_5e00861(radius / 200 * 0.6);
                }
                self enablevisioncircle(localclientnum, distance, 1, var_354c76a5 * 2);
            }
        }
        waitframe(1);
        parent = self getlinkedent();
        if (isdefined(parent) || var_dc3f8ecd == self.origin) {
            var_3d3d7bb1 = var_3d3d7bb1 + getservertime(localclientnum) - var_450cbe48;
            continue;
        }
        var_3d3d7bb1 = 0;
    }
    if (isdefined(self.var_b44c157f)) {
        self.var_b44c157f delete();
    }
    self setcompassicon("minimap_sensor_dart");
    self function_8e04481f();
    self function_5e00861(0.62);
    dart_radius = sessionmodeiswarzonegame() ? 2400 : 800;
    if (isdefined(level.sensor_dart_radius)) {
        dart_radius = level.sensor_dart_radius;
    }
    self enablevisioncircle(localclientnum, dart_radius, 1);
    self thread function_6527a2e9(localclientnum, "o_recon_sensor_gun_projectile_open", "o_recon_sensor_gun_projectile_closed_idle");
    self thread function_e140ca2b(localclientnum);
}

// Namespace sensor_dart/sensor_dart
// Params 1, eflags: 0x4
// Checksum 0x8d12b6, Offset: 0xae0
// Size: 0x3c
function private on_game_ended(localclientnum) {
    level waittill(#"game_ended");
    disableallvisioncircles(localclientnum);
}

// Namespace sensor_dart/sensor_dart
// Params 3, eflags: 0x0
// Checksum 0xcf8c795f, Offset: 0xb28
// Size: 0xcc
function function_6527a2e9(localclientnum, animname, prevanim) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    self useanimtree("generic");
    self setanimrestart(animname, 1, 0, 1);
    if (isdefined(prevanim)) {
        self setanimrestart(prevanim, 0, 0, 1);
    }
}

// Namespace sensor_dart/sensor_dart
// Params 1, eflags: 0x0
// Checksum 0x4b68b1de, Offset: 0xc00
// Size: 0x54
function function_e140ca2b(localclientnum) {
    self endon(#"death");
    self waittill(#"finished_opening");
    self thread function_6527a2e9(localclientnum, "o_recon_sensor_gun_projectile_open_idle");
}

