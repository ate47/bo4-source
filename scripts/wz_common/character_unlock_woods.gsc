// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_woods_fixup.gsc;
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\mp_common\item_world.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_woods;

// Namespace character_unlock_woods/character_unlock_woods
// Params 0, eflags: 0x2
// Checksum 0xb3670d4a, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_woods", &__init__, undefined, #"character_unlock_woods_fixup");
}

// Namespace character_unlock_woods/character_unlock_woods
// Params 0, eflags: 0x0
// Checksum 0xa06efe1b, Offset: 0x108
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"woods_unlock", &function_2613aeec);
}

// Namespace character_unlock_woods/character_unlock_woods
// Params 1, eflags: 0x0
// Checksum 0x669b767, Offset: 0x148
// Size: 0x9c
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_last_alive", &function_4ac25840);
        level.var_e1b226fb = 1;
        level thread function_6cba9a1a();
    }
}

// Namespace character_unlock_woods/character_unlock_woods
// Params 0, eflags: 0x0
// Checksum 0x7d44386d, Offset: 0x1f0
// Size: 0x1a8
function function_6cba9a1a() {
    item_world::function_4de3ca98();
    var_e32947b9 = function_91b29d2a(#"cu22_spawn");
    if (!isdefined(var_e32947b9[0])) {
        return;
    }
    var_f93e4ee2 = 0;
    vehicles = getvehiclearray();
    foreach (vehicle in vehicles) {
        if (isairborne(vehicle)) {
            if (distance2d(vehicle.origin, var_e32947b9[0].origin) < 800) {
                var_f93e4ee2 = 1;
                break;
            }
        }
    }
    if (!var_f93e4ee2) {
        foreach (item in var_e32947b9) {
            item_world::consume_item(item);
        }
    }
}

// Namespace character_unlock_woods/enter_vehicle
// Params 1, eflags: 0x40
// Checksum 0x30be582c, Offset: 0x3a0
// Size: 0xd4
function event_handler[enter_vehicle] codecallback_vehicleenter(eventstruct) {
    if (!(isdefined(level.var_e1b226fb) && level.var_e1b226fb)) {
        return;
    }
    if (!isplayer(self)) {
        return;
    }
    vehicle = eventstruct.vehicle;
    seatindex = eventstruct.seat_index;
    if (isairborne(vehicle) && seatindex === 0 && character_unlock::function_f0406288(#"woods_unlock")) {
        self thread function_6a61388f(vehicle);
    }
}

// Namespace character_unlock_woods/change_seat
// Params 1, eflags: 0x40
// Checksum 0x231fea23, Offset: 0x480
// Size: 0xd4
function event_handler[change_seat] function_2aa4e6cf(eventstruct) {
    if (!(isdefined(level.var_e1b226fb) && level.var_e1b226fb)) {
        return;
    }
    if (!isplayer(self)) {
        return;
    }
    vehicle = eventstruct.vehicle;
    seatindex = eventstruct.seat_index;
    if (isairborne(vehicle) && seatindex === 0 && character_unlock::function_f0406288(#"woods_unlock")) {
        self thread function_6a61388f(vehicle);
    }
}

// Namespace character_unlock_woods/character_unlock_woods
// Params 1, eflags: 0x0
// Checksum 0xaf17390e, Offset: 0x560
// Size: 0x140
function function_6a61388f(vehicle) {
    self notify("3609f878877561c6");
    self endon("3609f878877561c6");
    self endon(#"death", #"disconnect", #"exit_vehicle", #"change_seat");
    vehicle endon(#"death");
    if (!isdefined(self.var_1e8d9480)) {
        self.var_1e8d9480 = 0;
    }
    while (true) {
        if (self.var_1e8d9480 >= 60 && self character_unlock::function_f0406288(#"woods_unlock")) {
            self character_unlock::function_c8beca5e(#"woods_unlock", #"hash_17a4baf5ec553be7", 1);
            return;
        }
        self.var_1e8d9480 += 0.5;
        wait(0.5);
    }
}

// Namespace character_unlock_woods/character_unlock_woods
// Params 1, eflags: 0x0
// Checksum 0x9adc1d09, Offset: 0x6a8
// Size: 0xbc
function function_1c4b5097(item) {
    itementry = item.itementry;
    if (itementry.name === #"cu22_item") {
        if (self character_unlock::function_f0406288(#"woods_unlock") && (self.deaths !== 0 || self.suicides !== 0)) {
            self character_unlock::function_c8beca5e(#"woods_unlock", #"hash_17a4bbf5ec553d9a", 2);
        }
    }
}

// Namespace character_unlock_woods/character_unlock_woods
// Params 1, eflags: 0x0
// Checksum 0xb2f22d94, Offset: 0x770
// Size: 0x184
function function_4ac25840(params) {
    foreach (team in params.teams_alive) {
        players = getplayers(team);
        foreach (player in players) {
            if (isalive(player) && player character_unlock::function_f0406288(#"woods_unlock") && player.deaths === 0 && player.suicides === 0) {
                player character_unlock::function_c8beca5e(#"woods_unlock", #"hash_17a4bbf5ec553d9a", 1);
            }
        }
    }
}

