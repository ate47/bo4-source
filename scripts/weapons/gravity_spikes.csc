// Atian COD Tools GSC decompiler test
#include scripts/core_common/explode.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/audio_shared.csc;

#namespace gravity_spikes;

// Namespace gravity_spikes/gravity_spikes
// Params 0, eflags: 0x2
// Checksum 0x5d558bde, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gravity_spikes", &__init__, undefined, undefined);
}

// Namespace gravity_spikes/gravity_spikes
// Params 0, eflags: 0x0
// Checksum 0x9c44cb80, Offset: 0x110
// Size: 0xa4
function __init__() {
    level._effect[#"gravity_spike_dust"] = #"weapon/fx_hero_grvity_spk_grnd_hit_dust";
    level.gravity_spike_table = "surface_explosion_gravityspikes";
    level thread watchforgravityspikeexplosion();
    level.dirt_enable_gravity_spikes = getdvarint(#"scr_dirt_enable_gravity_spikes", 0);
    /#
        level thread updatedvars();
    #/
}

// Namespace gravity_spikes/gravity_spikes
// Params 0, eflags: 0x0
// Checksum 0xe0cbf024, Offset: 0x1c0
// Size: 0x54
function updatedvars() {
    /#
        while (1) {
            level.dirt_enable_gravity_spikes = getdvarint(#"scr_dirt_enable_gravity_spikes", level.dirt_enable_gravity_spikes);
            wait(1);
        }
    #/
}

// Namespace gravity_spikes/gravity_spikes
// Params 0, eflags: 0x0
// Checksum 0x1eab306f, Offset: 0x220
// Size: 0x200
function watchforgravityspikeexplosion() {
    if (getactivelocalclients() > 1) {
        return;
    }
    weapon_proximity = getweapon(#"hero_gravityspikes");
    var_55ee3ee6 = getweapon(#"eq_gravityslam");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"explode");
        weapon = waitresult.weapon;
        owner_cent = waitresult.owner_cent;
        position = waitresult.position;
        localclientnum = waitresult.localclientnum;
        if (weapon.rootweapon == getweapon(#"none") || weapon.rootweapon != weapon_proximity && weapon.rootweapon != var_55ee3ee6) {
            continue;
        }
        if (isdefined(owner_cent) && owner_cent function_21c0fa55() && level.dirt_enable_gravity_spikes) {
            owner_cent thread explode::dothedirty(localclientnum, 0, 1, 0, 1000, 500);
        }
        thread do_gravity_spike_fx(localclientnum, owner_cent, weapon, position);
        thread audio::dorattle(position, 200, 700);
    }
}

// Namespace gravity_spikes/gravity_spikes
// Params 4, eflags: 0x0
// Checksum 0x3aa387ff, Offset: 0x428
// Size: 0x12e
function do_gravity_spike_fx(localclientnum, owner, weapon, position) {
    radius_of_effect = 40;
    number_of_circles = 3;
    base_number_of_effects = 3;
    additional_number_of_effects_per_circle = 7;
    explosion_radius = isdefined(weapon) ? weapon.explosionradius : 250;
    radius_per_circle = (explosion_radius - radius_of_effect) / number_of_circles;
    for (circle = 0; circle < number_of_circles; circle++) {
        wait(0.1);
        radius_for_this_circle = radius_per_circle * (circle + 1);
        number_for_this_circle = base_number_of_effects + additional_number_of_effects_per_circle * circle;
        thread do_gravity_spike_fx_circle(localclientnum, owner, position, radius_for_this_circle, number_for_this_circle);
    }
}

// Namespace gravity_spikes/gravity_spikes
// Params 5, eflags: 0x0
// Checksum 0x8a110991, Offset: 0x560
// Size: 0xb4
function getideallocationforfx(startpos, fxindex, fxcount, defaultdistance, rotation) {
    currentangle = 360 / fxcount * fxindex;
    coscurrent = cos(currentangle + rotation);
    sincurrent = sin(currentangle + rotation);
    return startpos + (defaultdistance * coscurrent, defaultdistance * sincurrent, 0);
}

// Namespace gravity_spikes/gravity_spikes
// Params 3, eflags: 0x0
// Checksum 0x8829b418, Offset: 0x620
// Size: 0xc8
function randomizelocation(startpos, max_x_offset, max_y_offset) {
    half_x = int(max_x_offset / 2);
    half_y = int(max_y_offset / 2);
    rand_x = randomintrange(half_x * -1, half_x);
    rand_y = randomintrange(half_y * -1, half_y);
    return startpos + (rand_x, rand_y, 0);
}

// Namespace gravity_spikes/gravity_spikes
// Params 2, eflags: 0x0
// Checksum 0xb7903018, Offset: 0x6f0
// Size: 0x6a
function ground_trace(startpos, owner) {
    trace_height = 50;
    trace_depth = 100;
    return bullettrace(startpos + (0, 0, trace_height), startpos - (0, 0, trace_depth), 0, owner);
}

// Namespace gravity_spikes/gravity_spikes
// Params 5, eflags: 0x0
// Checksum 0x5c8d4df4, Offset: 0x768
// Size: 0x2e4
function do_gravity_spike_fx_circle(localclientnum, owner, center, radius, count) {
    segment = 360 / count;
    up = (0, 0, 1);
    randomization = 40;
    sphere_size = 5;
    for (i = 0; i < count; i++) {
        fx_position = getideallocationforfx(center, i, count, radius, 0);
        /#
        #/
        fx_position = randomizelocation(fx_position, randomization, randomization);
        trace = ground_trace(fx_position, owner);
        if (trace[#"fraction"] < 1) {
            /#
            #/
            fx = getfxfromsurfacetable(level.gravity_spike_table, trace[#"surfacetype"]);
            if (isdefined(fx)) {
                random_yaw = randomintrange(0, 359);
                angles = (0, random_yaw, 0);
                forward = anglestoforward(angles);
                normal = trace[#"normal"];
                if (lengthsquared(normal) == 0) {
                    normal = (1, 0, 0);
                }
                if (abs(vectordot(normal, forward)) > 0.9999) {
                    angles = (0, absangleclamp360(random_yaw + 90), 0);
                    forward = anglestoforward(angles);
                }
                playfx(localclientnum, fx, trace[#"position"], normal, forward);
                playsound(0, "wpn_gravity_spikes_earth_crack", trace[#"position"]);
            }
        } else {
            /#
            #/
        }
        waitframe(1);
    }
}

