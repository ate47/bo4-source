#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\compass;
#using scripts\core_common\doors_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\mp\mp_urban_fx;
#using scripts\mp\mp_urban_sound;
#using scripts\mp_common\load;

#namespace mp_urban;

// Namespace mp_urban/level_init
// Params 1, eflags: 0x40
// Checksum 0x6c026afd, Offset: 0x1f0
// Size: 0x1a2
function event_handler[level_init] main(eventstruct) {
    precache();
    level.var_7fd6bd44 = 1200;
    callback::on_game_playing(&on_game_playing);
    callback::on_end_game(&on_end_game);
    mp_urban_fx::main();
    mp_urban_sound::main();
    /#
        init_devgui();
    #/
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((1152, 0, 200), (-1238, 68, 136), (-256, 2014, 72), (-922, -2198, 8), (1152, 1368, 72));
    level spawnkilltrigger();
    spawncollision("collision_clip_wall_128x128x10", "collider", (-1536, 1539, 98), (0, 270, 0));
    function_2cdcf5c3();
    level.var_a348230f = 1;
}

// Namespace mp_urban/mp_urban
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x3a0
// Size: 0x4
function precache() {
    
}

// Namespace mp_urban/mp_urban
// Params 0, eflags: 0x0
// Checksum 0xf26a307, Offset: 0x3b0
// Size: 0x54
function spawnkilltrigger() {
    trigger = spawn("trigger_radius", (-1224, 1104, 48), 0, 280, 32);
    trigger thread watchkilltrigger();
}

// Namespace mp_urban/mp_urban
// Params 0, eflags: 0x0
// Checksum 0x2d5bf2ad, Offset: 0x410
// Size: 0xa8
function watchkilltrigger() {
    level endon(#"game_ended");
    trigger = self;
    while (true) {
        waitresult = trigger waittill(#"trigger");
        waitresult.activator dodamage(1000, trigger.origin + (0, 0, 0), trigger, trigger, "none", "MOD_SUICIDE", 0);
    }
}

// Namespace mp_urban/mp_urban
// Params 0, eflags: 0x0
// Checksum 0x84821b37, Offset: 0x4c0
// Size: 0x1bc
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    if (getdvarint(#"hash_1ee1f013d124a26a", 0)) {
        function_50059d86();
    }
    wait getdvarfloat(#"hash_205d729c5c415715", 0.3);
    if (getdvarint(#"hash_1ee1f013d124a26a", 1)) {
        level thread scene::skipto_end(#"p8_fxanim_mp_urban_building_open_bundle");
        var_968ca543 = struct::get("p8_fxanim_mp_urban_remote_tank_armor_test_bundle", "scriptbundlename");
        if (isdefined(var_968ca543)) {
            var_968ca543 thread function_50dfa3c0();
        }
        var_4fea60a3 = struct::get("p8_fxanim_mp_urban_vehicle_testing_bundle", "scriptbundlename");
        if (isdefined(var_4fea60a3)) {
            var_4fea60a3 thread function_c7fff230();
        }
        if (util::isfirstround()) {
            level thread scene::play(#"p8_fxanim_mp_urban_flyover_bundle");
            level thread scene::play(#"p8_fxanim_mp_urban_flyover_antenna_bundle");
        }
    }
}

// Namespace mp_urban/mp_urban
// Params 0, eflags: 0x0
// Checksum 0x361219f5, Offset: 0x688
// Size: 0x112
function on_end_game() {
    if (!isdefined(level.var_f3754f02)) {
        level.var_f3754f02 = [];
    }
    foreach (scene in level.var_f3754f02) {
        scene.barrage = 0;
    }
    var_968ca543 = struct::get("p8_fxanim_mp_urban_remote_tank_armor_test_bundle", "scriptbundlename");
    if (isdefined(var_968ca543)) {
        var_968ca543.var_f04c9969 = 0;
    }
    var_4fea60a3 = struct::get("p8_fxanim_mp_urban_vehicle_testing_bundle", "scriptbundlename");
    if (isdefined(var_4fea60a3)) {
        var_4fea60a3.var_f04c9969 = 0;
    }
}

// Namespace mp_urban/mp_urban
// Params 0, eflags: 0x0
// Checksum 0xb8bc790a, Offset: 0x7a8
// Size: 0x14c
function function_2cdcf5c3() {
    if (getdvarint(#"hash_1ee1f013d124a26a", 1)) {
        level util::delay(0.3, undefined, &scene::play, #"p8_fxanim_mp_urban_vehicle_testing_bundle", "Shot 1");
        if (util::isfirstround()) {
            level thread scene::play(#"p8_fxanim_mp_urban_building_open_bundle");
            level thread scene::play(#"p8_fxanim_mp_urban_remote_tank_armor_test_bundle", "start_drop");
            level thread scene::play(#"p8_fxanim_mp_urban_remote_tank_walk_test_bundle");
            return;
        }
        level thread scene::skipto_end(#"p8_fxanim_mp_urban_flyover_bundle");
        level thread scene::skipto_end(#"p8_fxanim_mp_urban_flyover_antenna_bundle");
        level thread scene::play(#"p8_fxanim_mp_urban_remote_tank_walk_test_bundle", "Shot 2");
    }
}

// Namespace mp_urban/mp_urban
// Params 0, eflags: 0x0
// Checksum 0xc25dc022, Offset: 0x900
// Size: 0x54
function function_50059d86() {
    level.var_f3754f02 = struct::get_array("p8_fxanim_mp_urban_artillery_fire_bundle", "scriptbundlename");
    array::thread_all(level.var_f3754f02, &function_d611b306);
}

// Namespace mp_urban/mp_urban
// Params 0, eflags: 0x0
// Checksum 0x3205441, Offset: 0x960
// Size: 0xb0
function function_d611b306() {
    self.script_play_multiple = 1;
    self.barrage = 1;
    wait randomfloatrange(8, 35);
    i = 0;
    while (self.barrage) {
        self scene::play();
        i++;
        if (i == 2) {
            self.barrage = 0;
            break;
        }
        wait randomfloatrange(45, 200);
    }
}

// Namespace mp_urban/mp_urban
// Params 0, eflags: 0x0
// Checksum 0xaf027eb, Offset: 0xa18
// Size: 0x156
function function_50dfa3c0() {
    self.var_f04c9969 = 1;
    for (n_shot = array::random(array(2, 4, 6, 8)); self.var_f04c9969; n_shot++) {
        n_attacks = randomintrange(1, 3);
        for (i = 0; i < n_attacks; i++) {
            self scene::play(self.scriptbundlename, "Shot " + n_shot);
        }
        n_shot++;
        self scene::play(self.scriptbundlename, "Shot " + n_shot);
        if (n_shot == 9) {
            n_shot = 1;
            self scene::play(self.scriptbundlename, "Shot " + n_shot);
        }
    }
}

// Namespace mp_urban/mp_urban
// Params 0, eflags: 0x0
// Checksum 0x7bd13073, Offset: 0xb78
// Size: 0xae
function function_c7fff230() {
    self.var_f04c9969 = 1;
    for (i = 0; i < 3; i++) {
        if (!self.var_f04c9969) {
            return;
        }
        wait 180;
        self scene::play(self.scriptbundlename, "Shot 2");
        self scene::play(self.scriptbundlename, "Shot 1");
    }
}

/#

    // Namespace mp_urban/mp_urban
    // Params 0, eflags: 0x0
    // Checksum 0x5fbf3ae4, Offset: 0xc30
    // Size: 0x9c
    function init_devgui() {
        mapname = util::get_map_name();
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x48>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x83>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:xc4>");
    }

#/
