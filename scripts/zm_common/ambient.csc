// Atian COD Tools GSC decompiler test
#using scripts\core_common\sound_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace ambient;

// Namespace ambient/ambient
// Params 0, eflags: 0x2
// Checksum 0x835d27d4, Offset: 0x288
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ambient", &__init__, undefined, undefined);
}

// Namespace ambient/ambient
// Params 0, eflags: 0x1 linked
// Checksum 0x3fcc32b2, Offset: 0x2d0
// Size: 0x24
function __init__() {
    callback::on_localclient_connect(&on_player_connect);
}

// Namespace ambient/ambient
// Params 1, eflags: 0x1 linked
// Checksum 0xc57f8330, Offset: 0x300
// Size: 0x54
function on_player_connect(localclientnum) {
    thread ceiling_fans_init(localclientnum);
    thread clocks_init(localclientnum);
    thread spin_anemometers(localclientnum);
}

// Namespace ambient/ambient
// Params 2, eflags: 0x0
// Checksum 0xcb5d9189, Offset: 0x360
// Size: 0x134
function setup_point_fx(point, fx_id) {
    if (isdefined(point.script_fxid)) {
        fx_id = point.script_fxid;
    }
    point.fx_id = fx_id;
    if (isdefined(point.angles)) {
        point.forward = anglestoforward(point.angles);
        point.up = anglestoup(point.angles);
    } else {
        point.angles = (0, 0, 0);
        point.forward = (0, 0, 0);
        point.up = (0, 0, 0);
    }
    if (point.targetname == "flak_fire_fx") {
        level thread ambient_flak_think(point);
    }
    if (point.targetname == "fake_fire_fx") {
        level thread ambient_fakefire_think(point);
    }
}

// Namespace ambient/ambient
// Params 1, eflags: 0x1 linked
// Checksum 0x68d786e5, Offset: 0x4a0
// Size: 0x1b0
function ambient_flak_think(point) {
    amount = undefined;
    speed = undefined;
    night = 0;
    min_delay = 0.4;
    max_delay = 4;
    min_burst_time = 1;
    max_burst_time = 3;
    point.is_firing = 0;
    level thread ambient_flak_rotate(point);
    level thread ambient_flak_flash(point, min_burst_time, max_burst_time);
    for (;;) {
        timer = randomfloatrange(min_burst_time, max_burst_time);
        while (timer > 0) {
            point.is_firing = 1;
            playfx(0, level._effect[point.fx_id], point.origin, point.forward, point.up);
            thread sound::play_in_space(0, "wpn_triple25_fire", point.origin);
            wait(0.2);
            timer = timer - 0.2;
        }
        point.is_firing = 0;
        wait(randomfloatrange(min_delay, max_delay));
    }
}

// Namespace ambient/ambient
// Params 1, eflags: 0x1 linked
// Checksum 0x88227f33, Offset: 0x658
// Size: 0x1ee
function ambient_flak_rotate(point) {
    min_pitch = 30;
    max_pitch = 80;
    if (isdefined(point.angles)) {
        pointangles = point.angles;
    } else {
        pointangles = (0, 0, 0);
    }
    for (;;) {
        time = randomfloatrange(0.5, 2);
        steps = time * 10;
        random_angle = (randomintrange(min_pitch, max_pitch) * -1, randomint(360), 0);
        forward = anglestoforward(random_angle);
        up = anglestoup(random_angle);
        diff_forward = (forward - point.forward) / steps;
        diff_up = (up - point.up) / steps;
        for (i = 0; i < steps; i++) {
            point.forward = point.forward + diff_forward;
            point.up = point.up + diff_up;
            wait(0.1);
        }
        point.forward = forward;
        point.up = up;
    }
}

// Namespace ambient/ambient
// Params 3, eflags: 0x1 linked
// Checksum 0x3feb6c66, Offset: 0x850
// Size: 0x1b0
function ambient_flak_flash(point, min_burst_time, max_burst_time) {
    min_dist = 5000;
    max_dist = 6500;
    if (isdefined(point.script_mindist)) {
        min_dist = point.script_mindist;
    }
    if (isdefined(point.script_maxdist)) {
        max_dist = point.script_maxdist;
    }
    min_burst_time = 0.25;
    max_burst_time = 1;
    fxpos = undefined;
    while (1) {
        if (!point.is_firing) {
            wait(0.25);
            continue;
        }
        fxpos = point.origin + vectorscale(point.forward, randomintrange(min_dist, max_dist));
        playfx(0, level._effect[#"flak_burst_single"], fxpos);
        if (isdefined(level.timeofday) && (level.timeofday == "evening" || level.timeofday == "night")) {
            playfx(0, level._effect[#"flak_cloudflash_night"], fxpos);
        }
        wait(randomfloatrange(min_burst_time, max_burst_time));
    }
}

// Namespace ambient/ambient
// Params 1, eflags: 0x1 linked
// Checksum 0xa0e7fd47, Offset: 0xa08
// Size: 0x7b0
function ambient_fakefire_think(point) {
    firesound = undefined;
    weaptype = undefined;
    burstmin = undefined;
    burstmax = undefined;
    betweenshotsmin = undefined;
    betweenshotsmax = undefined;
    reloadtimemin = undefined;
    reloadtimemax = undefined;
    soundchance = undefined;
    if (!isdefined(point.weaponinfo)) {
        point.weaponinfo = "axis_turret";
    }
    switch (point.weaponinfo) {
    case #"allies_assault":
        if (isdefined(level.allies_team) && level.allies_team == "marines") {
            firesound = "weap_bar_fire";
        } else {
            firesound = "weap_dp28_fire_plr";
        }
        burstmin = 16;
        burstmax = 24;
        betweenshotsmin = 0.05;
        betweenshotsmax = 0.08;
        reloadtimemin = 4;
        reloadtimemax = 7;
        soundchance = 75;
        weaptype = "assault";
        break;
    case #"axis_assault":
        if (isdefined(level.axis_team) && level.axis_team == "german") {
            firesound = "weap_mp44_fire";
        } else {
            firesound = "weap_type99_fire";
        }
        burstmin = 16;
        burstmax = 24;
        betweenshotsmin = 0.05;
        betweenshotsmax = 0.08;
        reloadtimemin = 4;
        reloadtimemax = 7;
        soundchance = 75;
        weaptype = "assault";
        break;
    case #"allies_rifle":
        if (isdefined(level.allies_team) && level.allies_team == "marines") {
            firesound = "weap_m1garand_fire";
        } else {
            firesound = "weap_mosinnagant_fire";
        }
        burstmin = 1;
        burstmax = 3;
        betweenshotsmin = 0.8;
        betweenshotsmax = 1.3;
        reloadtimemin = 3;
        reloadtimemax = 6;
        soundchance = 95;
        weaptype = "rifle";
        break;
    case #"axis_rifle":
        if (isdefined(level.axis_team) && level.axis_team == "german") {
            firesound = "weap_kar98k_fire";
        } else {
            firesound = "weap_arisaka_fire";
        }
        burstmin = 1;
        burstmax = 3;
        betweenshotsmin = 0.8;
        betweenshotsmax = 1.3;
        reloadtimemin = 3;
        reloadtimemax = 6;
        soundchance = 95;
        weaptype = "rifle";
        break;
    case #"allies_smg":
        if (isdefined(level.allies_team) && level.allies_team == "marines") {
            firesound = "weap_thompson_fire";
        } else {
            firesound = "weap_ppsh_fire";
        }
        burstmin = 14;
        burstmax = 28;
        betweenshotsmin = 0.08;
        betweenshotsmax = 0.12;
        reloadtimemin = 2;
        reloadtimemax = 5;
        soundchance = 75;
        weaptype = "smg";
        break;
    case #"axis_smg":
        if (isdefined(level.axis_team) && level.axis_team == "german") {
            firesound = "weap_mp40_fire";
        } else {
            firesound = "weap_type100_fire";
        }
        burstmin = 14;
        burstmax = 28;
        betweenshotsmin = 0.08;
        betweenshotsmax = 0.12;
        reloadtimemin = 2;
        reloadtimemax = 5;
        soundchance = 75;
        weaptype = "smg";
        break;
    case #"allies_turret":
        if (isdefined(level.allies_team) && level.allies_team == "marines") {
            firesound = "weap_30cal_fire";
        } else {
            firesound = "weap_dp28_fire_plr";
        }
        burstmin = 60;
        burstmax = 90;
        betweenshotsmin = 0.05;
        betweenshotsmax = 0.08;
        reloadtimemin = 3;
        reloadtimemax = 6;
        soundchance = 95;
        weaptype = "turret";
        break;
    case #"axis_turret":
        if (isdefined(level.axis_team) && level.axis_team == "german") {
            firesound = "weap_bar_fire";
        } else {
            firesound = "weap_type92_fire";
        }
        burstmin = 60;
        burstmax = 90;
        betweenshotsmin = 0.05;
        betweenshotsmax = 0.08;
        reloadtimemin = 3;
        reloadtimemax = 6;
        soundchance = 95;
        weaptype = "turret";
        break;
    default:
        /#
            assertmsg("<unknown string>" + point.weaponinfo + "<unknown string>");
        #/
        break;
    }
    while (1) {
        burst = randomintrange(burstmin, burstmax);
        for (i = 0; i < burst; i++) {
            tracedist = 10000;
            target = point.origin + vectorscale(anglestoforward(point.angles + (-3 + randomint(6), -5 + randomint(10), 0)), tracedist);
            if (randomint(100) <= 20) {
                bullettracer(point.origin, target);
            }
            playfx(0, level._effect[point.fx_id], point.origin, point.forward);
            wait(randomfloatrange(betweenshotsmin, betweenshotsmax));
        }
        wait(randomfloatrange(reloadtimemin, reloadtimemax));
    }
}

// Namespace ambient/ambient
// Params 1, eflags: 0x1 linked
// Checksum 0xd11a7ec9, Offset: 0x11c0
// Size: 0x64
function ceiling_fans_init(clientnum) {
    fan_array = getentarray(clientnum, "ceiling_fan", "targetname");
    if (isdefined(fan_array)) {
        array::thread_all(fan_array, &spin_fan);
    }
}

// Namespace ambient/ambient
// Params 0, eflags: 0x1 linked
// Checksum 0xabf8c252, Offset: 0x1230
// Size: 0x1c6
function spin_fan() {
    self endon(#"death");
    if (!isdefined(self.speed)) {
        self.speed = randomintrange(1, 100);
        self.speed = self.speed % 10 + 1;
    }
    if (self.speed < 1) {
        self.speed = randomintrange(1, 100);
        self.speed = self.speed % 10 + 1;
    }
    do_wobble = 0;
    wobble = self.script_noteworthy;
    if (isdefined(wobble)) {
        if (wobble == "wobble") {
            do_wobble = 1;
            self.wobble_speed = self.speed * 0.5;
        }
    }
    while (1) {
        if (!do_wobble) {
            self rotateyaw(180, self.speed);
            self waittill(#"rotatedone");
        } else {
            self rotateyaw(340, self.speed);
            self waittill(#"rotatedone");
            self rotateyaw(20, self.wobble_speed);
            self waittill(#"rotatedone");
        }
    }
}

// Namespace ambient/ambient
// Params 1, eflags: 0x1 linked
// Checksum 0xedf61764, Offset: 0x1400
// Size: 0x3b4
function clocks_init(clientnum) {
    curr_time = getsystemtime();
    hours = curr_time[0];
    if (hours > 12) {
        hours = hours - 12;
    }
    if (hours == 0) {
        hours = 12;
    }
    minutes = curr_time[1];
    seconds = curr_time[2];
    hour_hand = getentarray(clientnum, "hour_hand", "targetname");
    hour_values = [];
    hour_values[#"hand_time"] = hours;
    hour_values[#"rotate"] = 30;
    hour_values[#"rotate_bit"] = 0.00833333;
    hour_values[#"first_rotate"] = (minutes * 60 + seconds) * hour_values[#"rotate_bit"];
    minute_hand = getentarray(clientnum, "minute_hand", "targetname");
    minute_values = [];
    minute_values[#"hand_time"] = minutes;
    minute_values[#"rotate"] = 6;
    minute_values[#"rotate_bit"] = 0.1;
    minute_values[#"first_rotate"] = seconds * minute_values[#"rotate_bit"];
    second_hand = getentarray(clientnum, "second_hand", "targetname");
    second_values = [];
    second_values[#"hand_time"] = seconds;
    second_values[#"rotate"] = 6;
    second_values[#"rotate_bit"] = 6;
    hour_hand_array = getentarray(clientnum, "hour_hand", "targetname");
    if (isdefined(hour_hand_array)) {
        array::thread_all(hour_hand_array, &clock_run, hour_values);
    }
    minute_hand_array = getentarray(clientnum, "minute_hand", "targetname");
    if (isdefined(minute_hand_array)) {
        array::thread_all(minute_hand_array, &clock_run, minute_values);
    }
    second_hand_array = getentarray(clientnum, "second_hand", "targetname");
    if (isdefined(second_hand_array)) {
        array::thread_all(second_hand_array, &clock_run, second_values);
    }
}

// Namespace ambient/ambient
// Params 1, eflags: 0x1 linked
// Checksum 0xc47b3297, Offset: 0x17c0
// Size: 0x438
function clock_run(time_values) {
    self endon(#"death");
    if (isdefined(self.script_noteworthy)) {
        hour = time_values[#"hand_time"];
        curr_time = getsystemtime(1);
        switch (tolower(self.script_noteworthy)) {
        case #"honolulu":
            hour = curr_time[0] - 10;
            break;
        case #"alaska":
            hour = curr_time[0] - 9;
            break;
        case #"hash_2facbe04e87432ac":
            hour = curr_time[0] - 8;
            break;
        case #"denver":
            hour = curr_time[0] - 7;
            break;
        case #"chicago":
            hour = curr_time[0] - 6;
            break;
        case #"hash_2361ce1f22a20d88":
            hour = curr_time[0] - 5;
            break;
        case #"halifax":
            hour = curr_time[0] - 4;
            break;
        case #"greenland":
            hour = curr_time[0] - 3;
            break;
        case #"london":
            hour = curr_time[0];
            break;
        case #"paris":
            hour = curr_time[0] + 1;
            break;
        case #"helsinki":
            hour = curr_time[0] + 2;
            break;
        case #"moscow":
            hour = curr_time[0] + 3;
            break;
        case #"vietnam":
            hour = curr_time[0] + 7;
            break;
        case #"china":
            hour = curr_time[0] + 8;
            break;
        }
        if (hour < 1) {
            hour = hour + 12;
        }
        if (hour > 12) {
            hour = hour - 12;
        }
        time_values[#"hand_time"] = hour;
    }
    self rotatepitch(time_values[#"hand_time"] * time_values[#"rotate"], 0.05);
    self waittill(#"rotatedone");
    if (isdefined(time_values[#"first_rotate"])) {
        self rotatepitch(time_values[#"first_rotate"], 0.05);
        self waittill(#"rotatedone");
    }
    prev_time = getsystemtime();
    while (1) {
        curr_time = getsystemtime();
        if (prev_time != curr_time) {
            self rotatepitch(time_values[#"rotate_bit"], 0.05);
            prev_time = curr_time;
        }
        wait(1);
    }
}

// Namespace ambient/ambient
// Params 1, eflags: 0x1 linked
// Checksum 0xcb58d50d, Offset: 0x1c00
// Size: 0xbc
function spin_anemometers(clientnum) {
    spoon_spinners = getentarray(clientnum, "spinner1", "targetname");
    flat_spinners = getentarray(clientnum, "spinner2", "targetname");
    if (isdefined(spoon_spinners)) {
        array::thread_all(spoon_spinners, &spoon_spin_func);
    }
    if (isdefined(flat_spinners)) {
        array::thread_all(flat_spinners, &arrow_spin_func);
    }
}

// Namespace ambient/ambient
// Params 0, eflags: 0x1 linked
// Checksum 0xd923ea7a, Offset: 0x1cc8
// Size: 0xae
function spoon_spin_func() {
    self endon(#"death");
    if (isdefined(self.script_float)) {
        model_speed = self.script_float;
    } else {
        model_speed = 2;
    }
    while (1) {
        speed = randomfloatrange(model_speed * 0.6, model_speed);
        self rotateyaw(1200, speed);
        self waittill(#"rotatedone");
    }
}

// Namespace ambient/ambient
// Params 0, eflags: 0x1 linked
// Checksum 0x978a7fb4, Offset: 0x1d80
// Size: 0x146
function arrow_spin_func() {
    self endon(#"death");
    if (isdefined(self.script_int)) {
        model_direction_change = self.script_int;
    } else {
        model_direction_change = 25;
    }
    if (isdefined(self.script_float)) {
        model_speed = self.script_float;
    } else {
        model_speed = 0.8;
    }
    while (1) {
        direction_change = model_direction_change + randomintrange(-11, 11);
        speed_change = randomfloatrange(model_speed * 0.3, model_speed);
        self rotateyaw(direction_change, speed_change);
        self waittill(#"rotatedone");
        self rotateyaw(direction_change * -1, speed_change);
        self waittill(#"rotatedone");
    }
}

