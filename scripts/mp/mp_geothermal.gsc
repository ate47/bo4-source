// Atian COD Tools GSC decompiler test
#include scripts/abilities/ability_util.gsc;
#include scripts/mp/mp_geothermal_sound.gsc;
#include scripts/mp/mp_geothermal_fx.gsc;
#include scripts/mp_common/load.gsc;
#include scripts/mp_common/draft.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/gestures.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/exploder_shared.gsc;
#include scripts/core_common/compass.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace mp_geothermal;

// Namespace mp_geothermal/level_init
// Params 1, eflags: 0x40
// Checksum 0x2ddc7fc6, Offset: 0x270
// Size: 0x164
function event_handler[level_init] main(eventstruct) {
    clientfield::register("toplayer", "toggle_player_steam", 1, 1, "int");
    mp_geothermal_fx::main();
    mp_geothermal_sound::main();
    load::main();
    level function_89088577();
    level thread function_d93dd65a();
    level thread function_2301b50d();
    level.cleandepositpoints = array((-419, 1130, 309.5), (-1211, -1304, 469), (-2451, 2588, 285), (993, -96, 361), (-111, 2924, 269));
    level.var_f3e25805 = &function_c3c859e1;
    level thread function_34fc666e();
    compass::setupminimap("");
}

// Namespace mp_geothermal/mp_geothermal
// Params 0, eflags: 0x1 linked
// Checksum 0xf255d182, Offset: 0x3e0
// Size: 0x8bc
function function_89088577() {
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1220.5, 631, 449.5), vectorscale((0, 1, 0), 46.3611));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1323.5, 697, 449.5), vectorscale((0, 1, 0), 68.4599));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1442.5, 740, 449.5), vectorscale((0, 1, 0), 65.8572));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1516, 803, 449.5), vectorscale((0, 1, 0), 41.752));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1590.5, 900.5, 443.5), vectorscale((0, 1, 0), 34.1533));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1664, 1002, 443.5), vectorscale((0, 1, 0), 37.2526));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1131.5, 719, 448.5), vectorscale((0, 1, 0), 46.3611));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1230.5, 794.5, 448.5), vectorscale((0, 1, 0), 58.86));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1319.5, 838.5, 448.5), vectorscale((0, 1, 0), 69.7592));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1426.5, 900.5, 448.5), vectorscale((0, 1, 0), 49.2579));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1506.5, 993, 448.5), vectorscale((0, 1, 0), 32.7576));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1556.5, 1070, 448.5), vectorscale((0, 1, 0), 29.8218));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1062.5, 737.5, 346.5), vectorscale((0, 1, 0), 344.159));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-1062.5, 737.5, 448.5), vectorscale((0, 1, 0), 344.159));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-640.5, 2362.5, 408.5), vectorscale((0, 1, 0), 344.159));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-611.5, 2440.5, 391.5), vectorscale((0, 1, 0), 334.157));
    spawncollision("collision_physics_wall_128x128x10", "collider", (-520.5, 2505.5, 391.5), vectorscale((0, 1, 0), 278.156));
    spawncollision("collision_physics_wall_256x256x10", "collider", (1055.5, 11, 416.5), vectorscale((0, 1, 0), 22.3607));
    spawncollision("collision_physics_wall_256x256x10", "collider", (937.5, 231, 415.5), vectorscale((0, 1, 0), 33.9588));
    spawncollision("collision_physics_wall_256x256x10", "collider", (809.5, 444, 376.5), vectorscale((0, 1, 0), 27.3577));
    spawncollision("collision_physics_wall_128x128x10", "collider", (752.5, 613, 331.5), vectorscale((0, 1, 0), 354.557));
    spawncollision("collision_physics_wall_256x256x10", "collider", (856, 751.5, 376.5), vectorscale((0, 1, 0), 305.557));
    spawncollision("collision_physics_wall_128x128x10", "collider", (1013.5, 798, 439.5), vectorscale((0, 1, 0), 244.957));
    spawncollision("collision_physics_wall_256x256x10", "collider", (1132, 662.5, 439.5), vectorscale((0, 1, 0), 209.757));
    spawncollision("collision_physics_wall_256x256x10", "collider", (1238, 431.5, 439.5), vectorscale((0, 1, 0), 199.757));
    spawncollision("collision_physics_wall_256x256x10", "collider", (1284, 185.5, 467.5), vectorscale((0, 1, 0), 181.557));
    spawncollision("collision_physics_wall_128x128x10", "collider", (1287, -3.5, 495.5), vectorscale((0, 1, 0), 170.956));
    spawncollision("collision_physics_wall_128x128x10", "collider", (1241, -113.5, 463.5), vectorscale((0, 1, 0), 143.555));
    spawncollision("collision_physics_wall_128x128x10", "collider", (1151.5, -139, 415.5), vectorscale((0, 1, 0), 61.5545));
    spawncollision("collision_physics_wall_256x256x10", "collider", (1141.5, 3128, 538.5), (27.9996, 22.3606, -1.60327));
    spawncollision("collision_physics_wall_256x256x10", "collider", (1041.5, 3348, 511.5), (26.8161, 18.9867, -11.8325));
    spawncollision("collision_physics_wall_256x256x10", "collider", (931.5, 3572.5, 444.5), (25.6488, 16.5897, -14.3093));
    spawncollision("collision_physics_wall_256x256x10", "collider", (1252, 2456.5, 403), vectorscale((0, 1, 0), 353.239));
}

// Namespace mp_geothermal/mp_geothermal
// Params 0, eflags: 0x1 linked
// Checksum 0x39cab4e0, Offset: 0xca8
// Size: 0x10c
function function_34fc666e() {
    if (util::isfirstround() && draft::is_draft_this_round() && getgametypesetting(#"allowMapScripting")) {
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        level thread scene::play(#"hash_4ef02c46a17d4830", "Shot 1");
        return;
    }
    level flag::wait_till("first_player_spawned");
    array::delete_all(getentarray("sun_block", "targetname"));
    exploder::exploder("fxexp_pipe_aftermath");
}

// Namespace mp_geothermal/mp_geothermal
// Params 0, eflags: 0x1 linked
// Checksum 0x11984569, Offset: 0xdc0
// Size: 0xdc
function function_c3c859e1() {
    array::delete_all(getentarray("sun_block", "targetname"));
    if (util::isfirstround() && getgametypesetting(#"allowMapScripting")) {
        exploder::exploder("fxexp_pipe_explosion");
        util::delay(1, undefined, &exploder::exploder, "fxexp_pipe_explosion_fires");
        level thread scene::play(#"hash_4ef02c46a17d4830", "Shot 2");
    }
}

// Namespace mp_geothermal/mp_geothermal
// Params 0, eflags: 0x1 linked
// Checksum 0xfc45ef9a, Offset: 0xea8
// Size: 0x5c
function function_d93dd65a() {
    var_b50eaae4 = getentarray("player_slide_trig", "targetname");
    array::thread_all(var_b50eaae4, &callback::on_trigger, &function_a8fc3bf1);
}

// Namespace mp_geothermal/mp_geothermal
// Params 1, eflags: 0x1 linked
// Checksum 0x623e8d69, Offset: 0xf10
// Size: 0x45c
function function_a8fc3bf1(s_info) {
    e_player = s_info.activator;
    if (getdvarint(#"hash_2d85d6f5c0fe59f5", 1) && isalive(e_player) && !(isdefined(e_player.var_e0348559) && e_player.var_e0348559)) {
        e_player endon(#"disconnect");
        var_e098d474 = util::spawn_model(#"tag_origin", e_player gettagorigin("tag_origin"), e_player gettagangles("tag_origin"));
        if (isdefined(var_e098d474)) {
            var_e098d474 linkto(e_player, "tag_origin");
            var_e098d474 playloopsound("evt_ice_slide");
        }
        e_player allowstand(0);
        e_player allowjump(0);
        e_player allowprone(0);
        stance = e_player getstance();
        e_player.var_e0348559 = 1;
        if (isdefined(e_player.playerrole) && isdefined(e_player.playerrole.var_a7e7cb46)) {
            gadget_weapon = getweapon(e_player.playerrole.var_a7e7cb46);
            if (isdefined(gadget_weapon)) {
                slot = e_player gadgetgetslot(gadget_weapon);
                e_player function_820a63e9(slot, 1);
            }
        }
        if (isdefined(e_player.playerrole) && isdefined(e_player.playerrole.var_c21d61e9)) {
            gadget_weapon = getweapon(e_player.playerrole.var_c21d61e9);
            if (isdefined(gadget_weapon)) {
                slot = e_player gadgetgetslot(gadget_weapon);
                e_player function_820a63e9(slot, 1);
            }
        }
        e_player thread gestures::function_b6cc48ed("ges_force_slide_loop", undefined, 1);
        while (isalive(e_player) && e_player istouching(self)) {
            waitframe(1);
        }
        if (isdefined(e_player)) {
            e_player.var_e0348559 = 0;
            e_player allowstand(1);
            e_player allowjump(1);
            e_player allowprone(1);
            e_player ability_util::function_ffd29673();
            e_player ability_util::function_46b37314();
            if (isalive(e_player)) {
                e_player stopgestureviewmodel("ges_force_slide_loop", 0.1, 0);
                if (isdefined(stance)) {
                    e_player setstance(stance);
                }
            }
        }
        if (isdefined(var_e098d474)) {
            var_e098d474 delete();
        }
    }
}

// Namespace mp_geothermal/mp_geothermal
// Params 0, eflags: 0x1 linked
// Checksum 0xa40d8102, Offset: 0x1378
// Size: 0xc4
function function_2301b50d() {
    if (!getdvarint(#"hash_235decda8742ffc6", 1)) {
        return;
    }
    var_c4d0bdd1 = struct::get_array("geyser_scenes");
    array::thread_all(var_c4d0bdd1, &scene::init);
    array::thread_all(var_c4d0bdd1, &util::delay, randomfloatrange(5, 15), "geyser_stop", &function_7854a074);
}

// Namespace mp_geothermal/mp_geothermal
// Params 0, eflags: 0x1 linked
// Checksum 0x18d06eeb, Offset: 0x1448
// Size: 0x1e8
function function_7854a074() {
    self.scene_ents[#"prop 1"] endon(#"death");
    self.var_a4b64a04 = getent(self.target, "targetname");
    self.var_a4b64a04.s_scene = self;
    self.var_a4b64a04 callback::on_trigger(&function_da3ef83b);
    while (getdvarint(#"hash_235decda8742ffc6", 1)) {
        /#
            level thread function_a5242577(self, (0, 1, 0));
        #/
        self thread scene::play(self.scriptbundlename, "Shot 1");
        self.var_b0902cc0 = "Shot 1";
        wait(randomfloatrange(20, 30));
        /#
            level thread function_a5242577(self, (1, 1, 0));
        #/
        self.var_b0902cc0 = "Shot 2";
        self scene::play(self.scriptbundlename, "Shot 2");
        /#
            level thread function_a5242577(self, (1, 0, 0));
        #/
        self.var_b0902cc0 = "Shot 3";
        self thread function_dda9d732();
        self scene::play(self.scriptbundlename, "Shot 3");
    }
}

// Namespace mp_geothermal/mp_geothermal
// Params 0, eflags: 0x1 linked
// Checksum 0x25d19e1e, Offset: 0x1638
// Size: 0x72
function function_dda9d732() {
    self.scene_ents[#"prop 1"] waittill(#"stop", #"death");
    /#
        level thread function_a5242577(self, (1, 1, 0));
    #/
    self.var_b0902cc0 = "Shot 1";
}

// Namespace mp_geothermal/mp_geothermal
// Params 1, eflags: 0x1 linked
// Checksum 0x3e94fc4a, Offset: 0x16b8
// Size: 0x32a
function function_da3ef83b(s_info) {
    e_player = s_info.activator;
    if (getdvarint(#"hash_235decda8742ffc6", 1) && isalive(e_player) && self.s_scene.var_b0902cc0 !== "Shot 1") {
        if (isvehicle(e_player)) {
            if (self.s_scene.var_b0902cc0 == "Shot 3") {
                e_player launchvehicle((0, 0, randomintrange(140, 160)));
                e_player dodamage(100000, e_player.origin, undefined, undefined, "none", "MOD_EXPLOSIVE");
            }
            return;
        }
        e_player clientfield::set_to_player("toggle_player_steam", 1);
        if (getdvarint(#"hash_777b2937561d4bda", 1) && self.s_scene.var_b0902cc0 == "Shot 3") {
            e_player dodamage(e_player.maxhealth, e_player.origin, undefined, undefined, "none", "MOD_EXPLOSIVE");
            e_player cleardamageindicator();
            if (isdefined(e_player.body)) {
                e_player.body startragdoll();
                e_player.body launchragdoll((0, 0, randomintrange(145, 165)));
            }
        }
        if (isdefined(e_player) && !(isdefined(e_player.var_85ceee55) && e_player.var_85ceee55)) {
            e_player.var_85ceee55 = 1;
            while (isalive(e_player) && isdefined(self) && e_player istouching(self) && self.s_scene.var_b0902cc0 !== "Shot 1") {
                waitframe(1);
            }
            if (isdefined(e_player)) {
                e_player clientfield::set_to_player("toggle_player_steam", 0);
                e_player.var_85ceee55 = 0;
            }
        }
    }
}

// Namespace mp_geothermal/mp_geothermal
// Params 2, eflags: 0x0
// Checksum 0x3c655944, Offset: 0x19f0
// Size: 0xa6
function function_a5242577(struct, color) {
    /#
        struct notify(#"start");
        struct endon(#"start");
        while (getdvarint(#"hash_372bf3b258a4653e", 0)) {
            sphere(struct.origin, 16, color, 1, 0, 8, 30);
            waitframe(1);
        }
    #/
}

