#using scripts\core_common\compass;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\struct;
#using scripts\mp\mp_mountain2_scripted;
#using scripts\mp_common\load;

#namespace mp_mountain2;

// Namespace mp_mountain2/level_init
// Params 1, eflags: 0x40
// Checksum 0xc9f9b9f7, Offset: 0x148
// Size: 0x206
function event_handler[level_init] main(eventstruct) {
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((1860, -140, 127), (3004, -168, 326), (4008, -888, 327), (3270, -1960, 464), (3875, -1580, 327.75));
    spawncollision("collision_clip_wall_128x128x10", "collider", (2171, -475, 392), (0, 0, 0));
    spawncollision("collision_clip_ramp_64x24", "collider", (2163, -481, 320), (0, 270, 90));
    spawncollision("collision_clip_ramp_64x24", "collider", (2173, -434.5, 232), (0, 249, 94));
    level thread gondola_sway();
    level thread glass_exploder_init();
    glasses = struct::get_array("glass_shatter_on_spawn", "targetname");
    for (i = 0; i < glasses.size; i++) {
        radiusdamage(glasses[i].origin, 32, 101, 100);
        wait 0.05;
    }
}

// Namespace mp_mountain2/mp_mountain2
// Params 0, eflags: 0x0
// Checksum 0x76817d5d, Offset: 0x358
// Size: 0x1d6
function gondola_sway() {
    level endon(#"gondola_triggered");
    gondola_cab = getent("gondola_cab", "targetname");
    gondola_cab setmovingplatformenabled(1);
    while (true) {
        randomswingangle = randomfloatrange(2, 5);
        randomswingtime = randomfloatrange(2, 3);
        gondola_cab rotateto((randomswingangle * 0.5, randomswingangle * 0.6 + 90, randomswingangle * 0.8), randomswingtime, randomswingtime * 0.3, randomswingtime * 0.3);
        gondola_cab playsound("amb_gondola_swing");
        wait randomswingtime;
        gondola_cab rotateto((randomswingangle * 0.5 * -1, randomswingangle * -1 * 0.6 + 90, randomswingangle * 0.8 * -1), randomswingtime, randomswingtime * 0.3, randomswingtime * 0.3);
        gondola_cab playsound("amb_gondola_swing_back");
        wait randomswingtime;
    }
}

// Namespace mp_mountain2/mp_mountain2
// Params 0, eflags: 0x0
// Checksum 0x679beb05, Offset: 0x538
// Size: 0x1dc
function glass_exploder_init() {
    single_exploders = [];
    for (i = 0; i < level.createfxent.size; i++) {
        ent = level.createfxent[i];
        if (!isdefined(ent)) {
            continue;
        }
        if (ent.v[#"type"] != "exploder") {
            continue;
        }
        if (ent.v[#"exploder"] == 201 || ent.v[#"exploder"] == 202) {
            ent thread glass_group_exploder_think();
            continue;
        }
        if (ent.v[#"exploder"] >= 101 && ent.v[#"exploder"] <= 106) {
            single_exploders[single_exploders.size] = ent;
            continue;
        }
        if (ent.v[#"exploder"] == 301 || ent.v[#"exploder"] == 302) {
            single_exploders[single_exploders.size] = ent;
        }
    }
    level thread glass_exploder_think(single_exploders);
}

// Namespace mp_mountain2/mp_mountain2
// Params 0, eflags: 0x0
// Checksum 0xf741e4ff, Offset: 0x720
// Size: 0xba
function glass_group_exploder_think() {
    thresholdsq = 25600;
    count = 0;
    for (;;) {
        origin = self;
        level waittill(#"glass_smash", origin);
        if (distancesquared(self.v[#"origin"], origin) < thresholdsq) {
            count++;
        }
        if (count >= 3) {
            exploder::exploder(self.v[#"exploder"]);
            return;
        }
    }
}

// Namespace mp_mountain2/mp_mountain2
// Params 1, eflags: 0x0
// Checksum 0xa880e8d6, Offset: 0x7e8
// Size: 0x188
function glass_exploder_think(exploders) {
    thresholdsq = 25600;
    if (exploders.size <= 0) {
        return;
    }
    for (;;) {
        origin = self;
        closest = 998001;
        closest_exploder = undefined;
        level waittill(#"glass_smash", origin);
        for (i = 0; i < exploders.size; i++) {
            if (!isdefined(exploders[i])) {
                continue;
            }
            if (isdefined(exploders[i].glass_broken)) {
                continue;
            }
            distsq = distancesquared(exploders[i].v[#"origin"], origin);
            if (distsq > thresholdsq) {
                continue;
            }
            if (distsq < closest) {
                closest_exploder = exploders[i];
                closest = distsq;
            }
        }
        if (isdefined(closest_exploder)) {
            closest_exploder.glass_broken = 1;
            exploder::exploder(closest_exploder.v[#"exploder"]);
        }
    }
}

