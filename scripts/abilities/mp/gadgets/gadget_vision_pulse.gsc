#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\abilities\gadgets\gadget_vision_pulse.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace gadget_vision_pulse;

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 0, eflags: 0x2
// Checksum 0x52dbf555, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_vision_pulse", &__init__, undefined, undefined);
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 0, eflags: 0x1 linked
// Checksum 0xd7492663, Offset: 0x100
// Size: 0x4e
function __init__() {
    init_shared();
    function_f5632baf(&function_fc3478b7);
    level.var_392ddea = &awardscore;
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 1, eflags: 0x1 linked
// Checksum 0xa2b5406c, Offset: 0x158
// Size: 0x9e
function function_aad9199e(pulsedenemy) {
    pulsedenemy notify(#"hash_7dc65ec6fe251daf");
    pulsedenemy endon(#"hash_7dc65ec6fe251daf", #"death", #"disconnect");
    wait float(level.weaponvisionpulse.var_9d776ba6) / 1000;
    if (isdefined(pulsedenemy)) {
        pulsedenemy.ispulsed = 0;
        pulsedenemy.var_5379bee8 = undefined;
    }
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 1, eflags: 0x1 linked
// Checksum 0x6a5cd249, Offset: 0x200
// Size: 0x84
function function_fc3478b7(pulsedenemy) {
    self battlechatter::function_bd715920(getweapon(#"gadget_vision_pulse"), pulsedenemy, pulsedenemy.origin, self, 2);
    pulsedenemy.ispulsed = 1;
    pulsedenemy.var_5379bee8 = self;
    thread function_aad9199e(pulsedenemy);
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x1 linked
// Checksum 0xc13629ed, Offset: 0x290
// Size: 0xac
function function_c0520f6f(victim, waittime) {
    self endon(#"disconnect", #"death", #"emp_vp_jammed");
    wait float(waittime) / 1000;
    if (isalive(victim)) {
        scoreevents::processscoreevent(#"hash_5fa940b319171088", self, victim, level.weaponvisionpulse);
    }
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 0, eflags: 0x1 linked
// Checksum 0xd89c9687, Offset: 0x348
// Size: 0x210
function awardscore() {
    self endon(#"disconnect", #"death", #"emp_vp_jammed");
    waittime = level.weaponvisionpulse.gadget_pulse_duration / 3;
    radius = level.weaponvisionpulse.gadget_pulse_max_range;
    for (i = 0; i < 3; i++) {
        enemyteam = getplayers("all", self.origin, radius);
        if (isarray(enemyteam)) {
            foreach (enemy in enemyteam) {
                if (!util::isenemyplayer(enemy)) {
                    continue;
                }
                if (isalive(enemy)) {
                    var_bf11ed35 = distance2d(self.origin, enemy.origin);
                    if (var_bf11ed35 > level.weaponvisionpulse.gadget_pulse_max_range) {
                        continue;
                    }
                    timetotarget = var_bf11ed35 / level.weaponvisionpulse.var_f9eec1ec;
                    self thread function_c0520f6f(enemy, timetotarget);
                }
            }
        }
        wait float(waittime) / 1000;
    }
}

