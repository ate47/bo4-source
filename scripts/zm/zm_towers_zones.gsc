// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_hud.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_towers_zones;

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x50818607, Offset: 0x718
// Size: 0x2e6
function init() {
    callback::on_spawned(&on_player_spawned);
    if (!zm_utility::is_standard()) {
        spawner::add_archetype_spawn_function(#"zombie", &function_d63cd762);
        level thread function_3a81c97b();
    }
    var_d4061661 = array("zone_starting_area_tunnel", "zone_starting_area_center", "zone_starting_area_danu", "zone_starting_area_ra", "zone_starting_area_odin", "zone_starting_area_zeus");
    var_ce49ee8e = array("zone_danu_hallway", "zone_ra_hallway", "zone_odin_hallway", "zone_zeus_hallway");
    var_f9f351ca = array("zone_danu_ground_floor", "zone_danu_top_floor");
    var_7a12549d = array("zone_ra_ground_floor", "zone_ra_top_floor");
    var_8b82c67f = array("zone_odin_ground_floor", "zone_odin_top_floor");
    var_8019009b = array("zone_zeus_ground_floor", "zone_zeus_top_floor");
    var_e585feb3 = array("zone_danu_ra_bridge", "zone_odin_zeus_bridge");
    var_cb45e05 = array("zone_pap_room", "zone_pap_room_balcony_flooded_crypt");
    var_3d702dc9 = arraycombine(var_d4061661, var_ce49ee8e, 0, 0);
    var_3d702dc9 = arraycombine(var_3d702dc9, var_f9f351ca, 0, 0);
    var_3d702dc9 = arraycombine(var_3d702dc9, var_7a12549d, 0, 0);
    var_3d702dc9 = arraycombine(var_3d702dc9, var_8b82c67f, 0, 0);
    var_3d702dc9 = arraycombine(var_3d702dc9, var_8019009b, 0, 0);
    var_3d702dc9 = arraycombine(var_3d702dc9, var_e585feb3, 0, 0);
    level.var_3d702dc9 = var_3d702dc9;
    level.var_d4061661 = var_d4061661;
    level.var_cb45e05 = var_cb45e05;
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xaca5377e, Offset: 0xa08
// Size: 0xc34
function zone_init() {
    level flag::init("always_on");
    level flag::set("always_on");
    zm_zonemgr::zone_init("zone_starting_area_tunnel");
    zm_zonemgr::enable_zone("zone_starting_area_tunnel");
    zm_zonemgr::zone_init("zone_starting_area_ra");
    zm_zonemgr::enable_zone("zone_starting_area_ra");
    zm_zonemgr::zone_init("zone_boss_battle");
    zm_zonemgr::enable_zone("zone_boss_battle");
    zm_zonemgr::zone_init("zone_danu_basement_decayed");
    zm_zonemgr::zone_init("zone_danu_ground_floor_decayed");
    zm_zonemgr::zone_init("zone_danu_top_floor_decayed");
    level.disable_kill_thread = 1;
    zm_zonemgr::add_adjacent_zone("zone_starting_area_tunnel", "zone_starting_area_ra", "always_on");
    zm_zonemgr::add_adjacent_zone("zone_starting_area_tunnel", "zone_starting_area_odin", "always_on");
    zm_zonemgr::add_adjacent_zone("zone_starting_area_center", "zone_starting_area_danu", "always_on", 0);
    zm_zonemgr::add_adjacent_zone("zone_starting_area_center", "zone_starting_area_ra", "always_on", 0);
    zm_zonemgr::add_adjacent_zone("zone_starting_area_center", "zone_starting_area_odin", "always_on", 0);
    zm_zonemgr::add_adjacent_zone("zone_starting_area_center", "zone_starting_area_zeus", "always_on", 0);
    zm_zonemgr::add_adjacent_zone("zone_starting_area_danu", "zone_danu_hallway", "connect_starting_area_to_danu_hallway", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_hallway", "zone_danu_ground_floor", "connect_starting_area_to_danu_hallway", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_ground_floor", "zone_starting_area_danu", "connect_starting_area_to_danu_hallway");
    zm_zonemgr::add_adjacent_zone("zone_danu_top_floor", "zone_danu_ground_floor", "connect_danu_tower", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_basement", "zone_danu_ground_floor", "connect_danu_tower", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_basement", "zone_danu_ra_tunnel", "connect_danu_basement_to_danu_ra_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_basement_decayed", "zone_danu_ground_floor_decayed", #"hash_55461b9e82131f3", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_top_floor_decayed", "zone_danu_ground_floor_decayed", #"hash_1596bce02bfee2fe", 0);
    zm_zonemgr::add_adjacent_zone("zone_starting_area_ra", "zone_ra_hallway", "connect_starting_area_to_ra_hallway", 0);
    zm_zonemgr::add_adjacent_zone("zone_ra_hallway", "zone_ra_ground_floor", "connect_starting_area_to_ra_hallway", 0);
    zm_zonemgr::add_adjacent_zone("zone_ra_ground_floor", "zone_starting_area_ra", "connect_starting_area_to_ra_hallway");
    zm_zonemgr::add_adjacent_zone("zone_ra_top_floor", "zone_ra_ground_floor", "connect_ra_tower", 0);
    zm_zonemgr::add_adjacent_zone("zone_ra_basement", "zone_ra_ground_floor", "connect_ra_tower", 0);
    zm_zonemgr::add_adjacent_zone("zone_ra_basement", "zone_danu_ra_tunnel", "connect_ra_basement_to_danu_ra_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_starting_area_odin", "zone_odin_hallway", "connect_starting_area_to_odin_hallway", 0);
    zm_zonemgr::add_adjacent_zone("zone_odin_hallway", "zone_odin_ground_floor", "connect_starting_area_to_odin_hallway", 0);
    zm_zonemgr::add_adjacent_zone("zone_odin_ground_floor", "zone_starting_area_odin", "connect_starting_area_to_odin_hallway");
    zm_zonemgr::add_adjacent_zone("zone_odin_top_floor", "zone_odin_ground_floor", "connect_odin_tower", 0);
    zm_zonemgr::add_adjacent_zone("zone_odin_basement", "zone_odin_ground_floor", "connect_odin_tower", 0);
    zm_zonemgr::add_adjacent_zone("zone_odin_basement", "zone_odin_zeus_tunnel", "connect_odin_basement_to_odin_zeus_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_starting_area_zeus", "zone_zeus_hallway", "connect_starting_area_to_zeus_hallway", 0);
    zm_zonemgr::add_adjacent_zone("zone_zeus_hallway", "zone_zeus_ground_floor", "connect_starting_area_to_zeus_hallway", 0);
    zm_zonemgr::add_adjacent_zone("zone_zeus_ground_floor", "zone_starting_area_zeus", "connect_starting_area_to_zeus_hallway");
    zm_zonemgr::add_adjacent_zone("zone_zeus_top_floor", "zone_zeus_ground_floor", "connect_zeus_tower", 0);
    zm_zonemgr::add_adjacent_zone("zone_zeus_basement", "zone_zeus_ground_floor", "connect_zeus_tower", 0);
    zm_zonemgr::add_adjacent_zone("zone_zeus_basement", "zone_odin_zeus_tunnel", "connect_zeus_basement_to_odin_zeus_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_top_floor", "zone_ra_top_floor", "connect_danu_ra_bridge", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_top_floor", "zone_danu_ra_bridge", "connect_danu_ra_bridge", 0);
    zm_zonemgr::add_adjacent_zone("zone_ra_top_floor", "zone_danu_ra_bridge", "connect_danu_ra_bridge", 0);
    zm_zonemgr::add_adjacent_zone("zone_odin_top_floor", "zone_zeus_top_floor", "connect_odin_zeus_bridge", 0);
    zm_zonemgr::add_adjacent_zone("zone_odin_top_floor", "zone_odin_zeus_bridge", "connect_odin_zeus_bridge", 0);
    zm_zonemgr::add_adjacent_zone("zone_zeus_top_floor", "zone_odin_zeus_bridge", "connect_odin_zeus_bridge", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_tunnel", "zone_danu_ra_tunnel", "connect_danu_ra_tunnels", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_ra_tunnel", "zone_ra_tunnel", "connect_danu_ra_tunnels", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_ra_tunnel", "zone_fallen_hero", "connect_danu_ra_tunnels", 0);
    zm_zonemgr::add_adjacent_zone("zone_ra_tunnel", "zone_fallen_hero", "connect_danu_ra_tunnels", 0);
    zm_zonemgr::add_adjacent_zone("zone_danu_ra_tunnel", "zone_flooded_crypt", "connect_zeus_tunnel_to_flooded_crypt", 0);
    zm_zonemgr::add_adjacent_zone("zone_odin_tunnel", "zone_odin_zeus_tunnel", "connect_odin_zeus_tunnels", 0);
    zm_zonemgr::add_adjacent_zone("zone_odin_tunnel", "zone_odin_basement", "connect_odin_basement_to_odin_zeus_tunnel");
    zm_zonemgr::add_adjacent_zone("zone_odin_tunnel", "zone_zeus_tunnel", "connect_odin_zeus_tunnels");
    zm_zonemgr::add_adjacent_zone("zone_odin_tunnel", "zone_cursed_room", "connect_odin_zeus_tunnels");
    zm_zonemgr::add_adjacent_zone("zone_zeus_tunnel", "zone_cursed_room", "connect_odin_zeus_tunnels");
    zm_zonemgr::add_adjacent_zone("zone_odin_zeus_tunnel", "zone_zeus_tunnel", "connect_odin_zeus_tunnels", 0);
    zm_zonemgr::add_adjacent_zone("zone_odin_zeus_tunnel", "zone_cursed_room", "connect_odin_zeus_tunnels", 0);
    zm_zonemgr::add_adjacent_zone("zone_odin_zeus_tunnel", "zone_body_pit", "connect_ra_tunnel_to_body_pit", 0);
    zm_zonemgr::add_adjacent_zone("zone_body_pit", "zone_ra_tunnel", "connect_ra_tunnel_to_body_pit", 0);
    zm_zonemgr::add_adjacent_zone("zone_body_pit", "zone_fallen_hero", "connect_ra_tunnel_to_body_pit", 0);
    zm_zonemgr::add_adjacent_zone("zone_body_pit", "zone_odin_tunnel", "connect_ra_tunnel_to_body_pit", 0);
    zm_zonemgr::add_adjacent_zone("zone_flooded_crypt", "zone_danu_tunnel", "connect_zeus_tunnel_to_flooded_crypt", 0);
    zm_zonemgr::add_adjacent_zone("zone_flooded_crypt", "zone_cursed_room", "connect_zeus_tunnel_to_flooded_crypt", 0);
    zm_zonemgr::add_adjacent_zone("zone_flooded_crypt", "zone_zeus_tunnel", "connect_zeus_tunnel_to_flooded_crypt", 0);
    zm_zonemgr::add_adjacent_zone("zone_pap_room", "zone_danu_ra_tunnel", "connect_pap_room_to_danu_ra_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_pap_room", "zone_odin_zeus_tunnel", "connect_pap_room_to_odin_zeus_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_pap_room", "zone_ra_tunnel", "connect_pap_room_to_danu_ra_tunnel");
    zm_zonemgr::add_adjacent_zone("zone_pap_room", "zone_fallen_hero", "connect_pap_room_to_danu_ra_tunnel");
    zm_zonemgr::add_adjacent_zone("zone_pap_room", "zone_zeus_tunnel", "connect_pap_room_to_odin_zeus_tunnel");
    zm_zonemgr::add_adjacent_zone("zone_pap_room_balcony_flooded_crypt", "zone_flooded_crypt", "connect_pap_room_balconies", 0);
    zm_zonemgr::add_adjacent_zone("zone_pap_room_balcony_flooded_crypt", "zone_pap_room", "connect_pap_room_balconies", 0);
    zm_zonemgr::add_adjacent_zone("zone_pap_room", "zone_body_pit", "connect_pap_room_balconies", 0);
    zm_zonemgr::add_adjacent_zone("zone_pap_room", "zone_flooded_crypt", "connect_pap_room_balconies");
    level thread connect_danu_tower();
    level thread connect_ra_tower();
    level thread connect_odin_tower();
    level thread connect_zeus_tower();
    level thread connect_odin_zeus_tunnels();
    level thread connect_danu_ra_tunnels();
    level thread function_7d0a038c();
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x2e4ae6f9, Offset: 0x1648
// Size: 0x74
function connect_danu_tower() {
    level endon(#"end_game");
    level flag::wait_till_any(array("connect_starting_area_to_danu_hallway", "connect_danu_ra_bridge", "connect_danu_basement_to_danu_ra_tunnel"));
    level flag::set("connect_danu_tower");
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x5fa2646f, Offset: 0x16c8
// Size: 0x74
function connect_ra_tower() {
    level endon(#"end_game");
    level flag::wait_till_any(array("connect_starting_area_to_ra_hallway", "connect_danu_ra_bridge", "connect_ra_basement_to_danu_ra_tunnel"));
    level flag::set("connect_ra_tower");
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x1bf9ab2c, Offset: 0x1748
// Size: 0x74
function connect_odin_tower() {
    level endon(#"end_game");
    level flag::wait_till_any(array("connect_starting_area_to_odin_hallway", "connect_odin_zeus_bridge", "connect_odin_basement_to_odin_zeus_tunnel"));
    level flag::set("connect_odin_tower");
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x5f4614b6, Offset: 0x17c8
// Size: 0x74
function connect_zeus_tower() {
    level endon(#"end_game");
    level flag::wait_till_any(array("connect_starting_area_to_zeus_hallway", "connect_odin_zeus_bridge", "connect_zeus_basement_to_odin_zeus_tunnel"));
    level flag::set("connect_zeus_tower");
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x71ea99e6, Offset: 0x1848
// Size: 0x6c
function connect_odin_zeus_tunnels() {
    level endon(#"end_game");
    level flag::wait_till_any(array("connect_odin_basement_to_odin_zeus_tunnel", "connect_zeus_basement_to_odin_zeus_tunnel"));
    level flag::set("connect_odin_zeus_tunnels");
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xd09a893f, Offset: 0x18c0
// Size: 0x6c
function connect_danu_ra_tunnels() {
    level endon(#"end_game");
    level flag::wait_till_any(array("connect_danu_basement_to_danu_ra_tunnel", "connect_ra_basement_to_danu_ra_tunnel"));
    level flag::set("connect_danu_ra_tunnels");
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x82c40515, Offset: 0x1938
// Size: 0xac
function function_7d0a038c() {
    level endon(#"end_game");
    level flag::wait_till_any(array("connect_zeus_tunnel_to_flooded_crypt", "connect_ra_tunnel_to_body_pit"));
    level flag::set("connect_danu_ra_tunnels");
    level flag::set("connect_odin_zeus_tunnels");
    level flag::set("connect_pap_room_balconies");
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x572bc75d, Offset: 0x19f0
// Size: 0xb4
function function_d63cd762() {
    self endon(#"death");
    waitframe(1);
    if (!isdefined(level.var_4b5a684c)) {
        level.var_4b5a684c = zm_round_logic::get_zombie_count_for_round(level.round_number, level.players.size);
    }
    if (level.var_13473346 < level.var_4b5a684c / 2) {
        self zombie_utility::set_zombie_run_cycle("run");
        level.var_13473346++;
        self thread function_4e4594ab();
    }
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xc61ea45e, Offset: 0x1ab0
// Size: 0x84
function function_3a81c97b() {
    level endon(#"end_game");
    level flag::wait_till("begin_spawning");
    while (level.round_number < 15) {
        wait(1);
    }
    spawner::remove_global_spawn_function(#"zombie", &function_d63cd762);
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xb8d97360, Offset: 0x1b40
// Size: 0x74
function function_4e4594ab() {
    s_notify = undefined;
    s_notify = self waittill(#"death");
    e_attacker = s_notify.attacker;
    if (isplayer(e_attacker)) {
        return;
    }
    if (level.var_13473346 > 0) {
        level.var_13473346--;
    }
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xd2079971, Offset: 0x1bc0
// Size: 0x17c
function on_player_spawned() {
    self endon(#"death");
    self thread function_8e0b371();
    self thread zm_audio::function_713192b1(#"hash_7a784e915fb4da82", #"body_pit");
    self thread zm_audio::function_713192b1(#"hash_2a27c4b2d37ac547", #"odin_floor");
    self thread zm_audio::function_713192b1(#"hash_f06f1d12b9e06bb", #"ra_base");
    self thread zm_audio::function_713192b1(#"hash_54ab01103f8534bd", #"temple");
    self thread zm_audio::function_713192b1(#"hash_3bf0a3cc4bf210d3", #"zeus_base");
    self thread zm_audio::function_713192b1(#"hash_397ee221838b64ee", #"danu");
    self thread zm_audio::function_713192b1(#"hash_5c1dcbfe0b5001dd", #"danu");
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xcc13e4f5, Offset: 0x1d48
// Size: 0xb8
function function_8e0b371() {
    self endon(#"disconnect");
    while (1) {
        if (isalive(self)) {
            str_location = function_ab7f70b9(self);
            self zm_hud::function_29780fb5(isdefined(str_location) ? str_location : #"");
        } else {
            self zm_hud::function_29780fb5(#"");
        }
        wait(0.5);
    }
}

// Namespace zm_towers_zones/zm_towers_zones
// Params 1, eflags: 0x1 linked
// Checksum 0x2d0109a2, Offset: 0x1e08
// Size: 0x57e
function function_ab7f70b9(e_player) {
    str_zone = e_player zm_zonemgr::get_player_zone();
    if (!isdefined(str_zone)) {
        return undefined;
    }
    switch (str_zone) {
    case #"zone_starting_area_center":
        str_display = #"hash_4a67009994e6a476";
        break;
    case #"zone_starting_area_tunnel":
    case #"zone_starting_area_odin":
    case #"zone_starting_area_ra":
    case #"zone_starting_area_danu":
    case #"zone_starting_area_zeus":
        str_display = #"hash_1567549ec3ba97d4";
        break;
    case #"zone_danu_top_floor":
        str_display = #"hash_5c1dcbfe0b5001dd";
        break;
    case #"zone_danu_ground_floor":
    case #"zone_danu_hallway":
        str_display = #"hash_7a9264bacc159479";
        break;
    case #"zone_danu_basement":
        str_display = #"hash_397ee221838b64ee";
        break;
    case #"zone_ra_top_floor":
        str_display = #"hash_6803828af6a2f994";
        break;
    case #"zone_ra_hallway":
    case #"zone_ra_ground_floor":
        str_display = #"hash_42941b7294416898";
        break;
    case #"zone_ra_basement":
        str_display = #"hash_f06f1d12b9e06bb";
        break;
    case #"zone_odin_top_floor":
        str_display = #"hash_2a27c4b2d37ac547";
        break;
    case #"zone_odin_ground_floor":
    case #"zone_odin_hallway":
        str_display = #"hash_6edbbd092bc3117f";
        break;
    case #"zone_odin_basement":
        str_display = #"hash_6182c3f17fbe7e38";
        break;
    case #"zone_zeus_top_floor":
        str_display = #"hash_9a1707dc944a3bc";
        break;
    case #"zone_zeus_hallway":
    case #"zone_zeus_ground_floor":
        str_display = #"hash_2795247ad0a93910";
        break;
    case #"zone_zeus_basement":
        if (level flag::get(#"hash_26c0c05d0a3e382f")) {
            str_display = #"hash_1d78b48769eec427";
        } else {
            str_display = #"hash_3bf0a3cc4bf210d3";
        }
        break;
    case #"zone_danu_ra_bridge":
        str_display = #"hash_340eafe8d0baeac2";
        break;
    case #"zone_odin_zeus_bridge":
        str_display = #"hash_3eb632726bcfd3b8";
        break;
    case #"zone_danu_ra_tunnel":
        str_display = #"hash_75825b791d3a7f4d";
        break;
    case #"zone_danu_tunnel":
        str_display = #"hash_384dc630decdd5e5";
        break;
    case #"zone_ra_tunnel":
        str_display = #"hash_1ad73836208cbff4";
        break;
    case #"zone_fallen_hero":
        str_display = #"hash_26bd00647976ee13";
        break;
    case #"zone_odin_tunnel":
        str_display = #"hash_2e1e7d63d11c4a1b";
        break;
    case #"zone_odin_zeus_tunnel":
        str_display = #"hash_553f97cb9500b3bf";
        break;
    case #"zone_zeus_tunnel":
        str_display = #"hash_622a5e1614b58b7c";
        break;
    case #"zone_cursed_room":
        str_display = #"hash_68fd9aced4fcdecc";
        break;
    case #"zone_flooded_crypt":
        str_display = #"hash_140d9887b328fc9a";
        break;
    case #"zone_body_pit":
        str_display = #"hash_7a784e915fb4da82";
        break;
    case #"zone_pap_room":
    case #"hash_3c2efff9d599c329":
    case #"zone_pap_room_balcony_flooded_crypt":
        str_display = #"hash_54ab01103f8534bd";
        break;
    default:
        str_display = undefined;
        break;
    }
    return str_display;
}

