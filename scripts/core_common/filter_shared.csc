#using scripts\core_common\util_shared;
#using scripts\core_common\postfx_shared;

#namespace filter;

// Namespace filter/filter_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x3ad97e57, Offset: 0x218
// Size: 0x14
function init_filter_indices() {
    util::function_89a98f85();
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf3f7c5c1, Offset: 0x238
// Size: 0x3e
function map_material_helper_by_localclientnum(localclientnum, materialname) {
    level.filter_matid[materialname] = mapmaterialindex(localclientnum, materialname);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3c8a506a, Offset: 0x280
// Size: 0x4c
function map_material_if_undefined(localclientnum, materialname) {
    if (isdefined(mapped_material_id(materialname))) {
        return;
    }
    map_material_helper_by_localclientnum(localclientnum, materialname);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe8e03bfc, Offset: 0x2d8
// Size: 0x3c
function map_material_helper(player, materialname) {
    if (!isdefined(player)) {
        return;
    }
    map_material_helper_by_localclientnum(player.localclientnum, materialname);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd9cd106f, Offset: 0x320
// Size: 0x38
function mapped_material_id(materialname) {
    if (!isdefined(level.filter_matid)) {
        level.filter_matid = [];
    }
    return level.filter_matid[materialname];
}

// Namespace filter/filter_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x6b60ccf2, Offset: 0x360
// Size: 0xb4
function function_74649ba9(player, filterid, pass, enable) {
    if (!isdefined(player)) {
        return;
    }
    util::function_89a98f85();
    if (isdefined(player) && isplayer(player) && isalive(player)) {
        num = player.localclientnum;
        setfilterpassenabled(num, filterid, pass, enable);
    }
}

// Namespace filter/filter_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x44baa5d4, Offset: 0x420
// Size: 0x54
function function_83a54227(locaclientnum, filterid, pass, enable) {
    util::function_89a98f85();
    setfilterpassenabled(locaclientnum, filterid, pass, enable);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa0759dcd, Offset: 0x480
// Size: 0x54
function init_filter_vehicle_damage(player, materialname) {
    init_filter_indices();
    if (!isdefined(level.filter_matid[materialname])) {
        map_material_helper(player, materialname);
    }
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x61836cc1, Offset: 0x4e0
// Size: 0x44
function set_filter_vehicle_damage_amount(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 0, amount);
}

// Namespace filter/filter_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x7b81425c, Offset: 0x530
// Size: 0x74
function set_filter_vehicle_sun_position(player, filterid, x, y) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 4, x);
    setfilterpassconstant(player.localclientnum, filterid, 0, 5, y);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x9c1d0adf, Offset: 0x5b0
// Size: 0x84
function enable_filter_vehicle_damage(player, filterid, materialname) {
    if (isdefined(level.filter_matid[materialname])) {
        setfilterpassmaterial(player.localclientnum, filterid, 0, level.filter_matid[materialname]);
        function_74649ba9(player, filterid, 0, 1);
    }
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa4ce1fff, Offset: 0x640
// Size: 0x44
function disable_filter_vehicle_damage(player, filterid) {
    util::function_89a98f85();
    function_74649ba9(player, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x90848aa8, Offset: 0x690
// Size: 0x3c
function init_filter_oob(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_out_of_bounds");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xcd83980d, Offset: 0x6d8
// Size: 0x64
function enable_filter_oob(localclientnum, filterid) {
    setfilterpassmaterial(localclientnum, filterid, 0, mapped_material_id("generic_filter_out_of_bounds"));
    function_83a54227(localclientnum, filterid, 0, 1);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xab923349, Offset: 0x748
// Size: 0x34
function disable_filter_oob(localclientnum, filterid) {
    function_83a54227(localclientnum, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x25336b4, Offset: 0x788
// Size: 0x3c
function init_filter_tactical(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_tactical_damage");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2c4f2776, Offset: 0x7d0
// Size: 0x6c
function enable_filter_tactical(player, filterid) {
    setfilterpassmaterial(player.localclientnum, filterid, 0, mapped_material_id("generic_filter_tactical_damage"));
    function_74649ba9(player, filterid, 0, 1);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x397879d4, Offset: 0x848
// Size: 0x44
function set_filter_tactical_amount(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 0, amount);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x886c2f37, Offset: 0x898
// Size: 0x34
function disable_filter_tactical(player, filterid) {
    function_74649ba9(player, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x424cc1e2, Offset: 0x8d8
// Size: 0x3c
function init_filter_water_sheeting(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_water_sheeting");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1c30af9c, Offset: 0x920
// Size: 0x7c
function enable_filter_water_sheeting(player, filterid) {
    setfilterpassmaterial(player.localclientnum, filterid, 0, mapped_material_id("generic_filter_water_sheeting"));
    setfilterpassenabled(player.localclientnum, filterid, 0, 1, 0, 1);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x54edc419, Offset: 0x9a8
// Size: 0x44
function set_filter_water_sheet_reveal(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 0, amount);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x326866f2, Offset: 0x9f8
// Size: 0x44
function set_filter_water_sheet_speed(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 1, amount);
}

// Namespace filter/filter_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xdc1f0355, Offset: 0xa48
// Size: 0xa4
function set_filter_water_sheet_rivulet_reveal(player, filterid, riv1, riv2, riv3) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 2, riv1);
    setfilterpassconstant(player.localclientnum, filterid, 0, 3, riv2);
    setfilterpassconstant(player.localclientnum, filterid, 0, 4, riv3);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x55dec83b, Offset: 0xaf8
// Size: 0x34
function disable_filter_water_sheeting(player, filterid) {
    function_74649ba9(player, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe1e42774, Offset: 0xb38
// Size: 0x3c
function init_filter_water_dive(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_water_dive");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x7382b237, Offset: 0xb80
// Size: 0x7c
function enable_filter_water_dive(player, filterid) {
    setfilterpassmaterial(player.localclientnum, filterid, 0, mapped_material_id("generic_filter_water_dive"));
    setfilterpassenabled(player.localclientnum, filterid, 0, 1, 0, 1);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x81cc8375, Offset: 0xc08
// Size: 0x34
function disable_filter_water_dive(player, filterid) {
    function_74649ba9(player, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x2441a477, Offset: 0xc48
// Size: 0x44
function set_filter_water_dive_bubbles(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 0, amount);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xfad7c1ee, Offset: 0xc98
// Size: 0x44
function set_filter_water_scuba_bubbles(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 1, amount);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xc0c2077e, Offset: 0xce8
// Size: 0x44
function set_filter_water_scuba_dive_speed(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 2, amount);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x2b43b5c8, Offset: 0xd38
// Size: 0x44
function set_filter_water_scuba_bubble_attitude(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 3, amount);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xcb4f96cb, Offset: 0xd88
// Size: 0x44
function set_filter_water_wash_reveal_dir(player, filterid, dir) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 4, dir);
}

// Namespace filter/filter_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xb4ff092d, Offset: 0xdd8
// Size: 0xa4
function set_filter_water_wash_color(player, filterid, red, green, blue) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 5, red);
    setfilterpassconstant(player.localclientnum, filterid, 0, 6, green);
    setfilterpassconstant(player.localclientnum, filterid, 0, 7, blue);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xeb7843e2, Offset: 0xe88
// Size: 0x2c
function settransported(player) {
    player thread postfx::playpostfxbundle(#"zm_teleporter");
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x0
// Checksum 0x71f60ca, Offset: 0xec0
// Size: 0x3c
function init_filter_ev_interference(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_ev_interference");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0x4ca9e6da, Offset: 0xf08
// Size: 0x94
function enable_filter_ev_interference(player, filterid) {
    map_material_if_undefined(player.localclientnum, "generic_filter_ev_interference");
    setfilterpassmaterial(player.localclientnum, filterid, 0, mapped_material_id("generic_filter_ev_interference"));
    function_74649ba9(player, filterid, 0, 1);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x0
// Checksum 0x14f965df, Offset: 0xfa8
// Size: 0x44
function set_filter_ev_interference_amount(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 0, amount);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0x4499378a, Offset: 0xff8
// Size: 0x34
function disable_filter_ev_interference(player, filterid) {
    function_74649ba9(player, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x0
// Checksum 0x7431af38, Offset: 0x1038
// Size: 0x3c
function init_filter_vehicle_hijack_oor(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_vehicle_out_of_range");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0xc362ee96, Offset: 0x1080
// Size: 0x12c
function enable_filter_vehicle_hijack_oor(player, filterid) {
    setfilterpassmaterial(player.localclientnum, filterid, 0, mapped_material_id("generic_filter_vehicle_out_of_range"));
    function_74649ba9(player, filterid, 0, 1);
    setfilterpassconstant(player.localclientnum, filterid, 0, 1, 0);
    setfilterpassconstant(player.localclientnum, filterid, 0, 2, 1);
    setfilterpassconstant(player.localclientnum, filterid, 0, 3, 0);
    setfilterpassconstant(player.localclientnum, filterid, 0, 4, -1);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0x6ff92d23, Offset: 0x11b8
// Size: 0x44
function set_filter_vehicle_hijack_oor_noblack(player, filterid) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 3, 1);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x0
// Checksum 0xb7b8d65c, Offset: 0x1208
// Size: 0x6c
function set_filter_vehicle_hijack_oor_amount(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 0, amount);
    setfilterpassconstant(player.localclientnum, filterid, 0, 1, amount);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0xe979b132, Offset: 0x1280
// Size: 0x34
function disable_filter_vehicle_hijack_oor(player, filterid) {
    function_74649ba9(player, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x0
// Checksum 0x43946f12, Offset: 0x12c0
// Size: 0x3c
function init_filter_speed_burst(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_speed_burst");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0x525ff692, Offset: 0x1308
// Size: 0x6c
function enable_filter_speed_burst(player, filterid) {
    setfilterpassmaterial(player.localclientnum, filterid, 0, mapped_material_id("generic_filter_speed_burst"));
    function_74649ba9(player, filterid, 0, 1);
}

// Namespace filter/filter_shared
// Params 4, eflags: 0x0
// Checksum 0xfa95d82f, Offset: 0x1380
// Size: 0x4c
function set_filter_speed_burst(player, filterid, constantindex, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 0, constantindex, amount);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0xaa732581, Offset: 0x13d8
// Size: 0x34
function disable_filter_speed_burst(player, filterid) {
    function_74649ba9(player, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x8d638f62, Offset: 0x1418
// Size: 0x3c
function init_filter_sprite_transition(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_transition_sprite");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2d0a4f76, Offset: 0x1460
// Size: 0x94
function enable_filter_sprite_transition(player, filterid) {
    setfilterpassmaterial(player.localclientnum, filterid, 1, mapped_material_id("generic_filter_transition_sprite"));
    function_74649ba9(player, filterid, 1, 1);
    setfilterpassquads(player.localclientnum, filterid, 1, 2048);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xbf16ac78, Offset: 0x1500
// Size: 0x44
function set_filter_sprite_transition_octogons(player, filterid, octos) {
    setfilterpassconstant(player.localclientnum, filterid, 1, 0, octos);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x56c080ec, Offset: 0x1550
// Size: 0x44
function set_filter_sprite_transition_blur(player, filterid, blur) {
    setfilterpassconstant(player.localclientnum, filterid, 1, 1, blur);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x9a55cd6b, Offset: 0x15a0
// Size: 0x44
function set_filter_sprite_transition_boost(player, filterid, boost) {
    setfilterpassconstant(player.localclientnum, filterid, 1, 2, boost);
}

// Namespace filter/filter_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x49da11b2, Offset: 0x15f0
// Size: 0x74
function set_filter_sprite_transition_move_radii(player, filterid, inner, outter) {
    setfilterpassconstant(player.localclientnum, filterid, 1, 24, inner);
    setfilterpassconstant(player.localclientnum, filterid, 1, 25, outter);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xad0ac43e, Offset: 0x1670
// Size: 0x44
function set_filter_sprite_transition_elapsed(player, filterid, time) {
    setfilterpassconstant(player.localclientnum, filterid, 1, 28, time);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf8b6166, Offset: 0x16c0
// Size: 0x34
function disable_filter_sprite_transition(player, filterid) {
    function_74649ba9(player, filterid, 1, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x65108caa, Offset: 0x1700
// Size: 0x3c
function init_filter_frame_transition(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_transition_frame");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xbe32d802, Offset: 0x1748
// Size: 0x6c
function enable_filter_frame_transition(player, filterid) {
    setfilterpassmaterial(player.localclientnum, filterid, 2, mapped_material_id("generic_filter_transition_frame"));
    function_74649ba9(player, filterid, 2, 1);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xa0372373, Offset: 0x17c0
// Size: 0x44
function set_filter_frame_transition_heavy_hexagons(player, filterid, hexes) {
    setfilterpassconstant(player.localclientnum, filterid, 2, 0, hexes);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x3b731b63, Offset: 0x1810
// Size: 0x44
function set_filter_frame_transition_light_hexagons(player, filterid, hexes) {
    setfilterpassconstant(player.localclientnum, filterid, 2, 1, hexes);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xf6994f4e, Offset: 0x1860
// Size: 0x44
function set_filter_frame_transition_flare(player, filterid, opacity) {
    setfilterpassconstant(player.localclientnum, filterid, 2, 2, opacity);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x4b2638af, Offset: 0x18b0
// Size: 0x44
function set_filter_frame_transition_blur(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 2, 3, amount);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xa8ba8562, Offset: 0x1900
// Size: 0x44
function set_filter_frame_transition_iris(player, filterid, opacity) {
    setfilterpassconstant(player.localclientnum, filterid, 2, 4, opacity);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xe77d4304, Offset: 0x1950
// Size: 0x44
function set_filter_frame_transition_saved_frame_reveal(player, filterid, reveal) {
    setfilterpassconstant(player.localclientnum, filterid, 2, 5, reveal);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x7a24e83a, Offset: 0x19a0
// Size: 0x44
function set_filter_frame_transition_warp(player, filterid, amount) {
    setfilterpassconstant(player.localclientnum, filterid, 2, 6, amount);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x84bf6021, Offset: 0x19f0
// Size: 0x34
function disable_filter_frame_transition(player, filterid) {
    function_74649ba9(player, filterid, 2, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x698fc320, Offset: 0x1a30
// Size: 0x3c
function init_filter_base_frame_transition(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_transition_frame_base");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xaa5a74ea, Offset: 0x1a78
// Size: 0x6c
function enable_filter_base_frame_transition(player, filterid) {
    setfilterpassmaterial(player.localclientnum, filterid, 0, mapped_material_id("generic_filter_transition_frame_base"));
    function_74649ba9(player, filterid, 0, 1);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xe4e9a851, Offset: 0x1af0
// Size: 0x44
function set_filter_base_frame_transition_warp(player, filterid, warp) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 0, warp);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xd7a25cd7, Offset: 0x1b40
// Size: 0x44
function set_filter_base_frame_transition_boost(player, filterid, boost) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 1, boost);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xe41a6ac1, Offset: 0x1b90
// Size: 0x44
function set_filter_base_frame_transition_durden(player, filterid, opacity) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 2, opacity);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xe9e452e9, Offset: 0x1be0
// Size: 0x44
function set_filter_base_frame_transition_durden_blur(player, filterid, blur) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 3, blur);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x928b3b80, Offset: 0x1c30
// Size: 0x34
function disable_filter_base_frame_transition(player, filterid) {
    function_74649ba9(player, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 4, eflags: 0x0
// Checksum 0xc33f5b57, Offset: 0x1c70
// Size: 0x44
function function_9ff66ea3(localclientnum, filterid, passid, opacity) {
    setfilterpassconstant(localclientnum, filterid, passid, 0, opacity);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x0
// Checksum 0xfb01913d, Offset: 0x1cc0
// Size: 0x3c
function init_filter_sprite_rain(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_sprite_rain");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0xee3ff934, Offset: 0x1d08
// Size: 0x94
function enable_filter_sprite_rain(player, filterid) {
    setfilterpassmaterial(player.localclientnum, filterid, 0, mapped_material_id("generic_filter_sprite_rain"));
    function_74649ba9(player, filterid, 0, 1);
    setfilterpassquads(player.localclientnum, filterid, 0, 2048);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x0
// Checksum 0x6c54ae6f, Offset: 0x1da8
// Size: 0x44
function set_filter_sprite_rain_opacity(player, filterid, opacity) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 0, opacity);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x0
// Checksum 0xb2765d22, Offset: 0x1df8
// Size: 0x44
function set_filter_sprite_rain_seed_offset(player, filterid, offset) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 26, offset);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x0
// Checksum 0xc217f508, Offset: 0x1e48
// Size: 0x44
function set_filter_sprite_rain_elapsed(player, filterid, time) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 28, time);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0x505cb89d, Offset: 0x1e98
// Size: 0x34
function disable_filter_sprite_rain(player, filterid) {
    function_74649ba9(player, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x0
// Checksum 0xdedaf4fb, Offset: 0x1ed8
// Size: 0x3c
function init_filter_sprite_dirt(player) {
    init_filter_indices();
    map_material_helper(player, "generic_filter_sprite_dirt");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0x8cd46fed, Offset: 0x1f20
// Size: 0x94
function enable_filter_sprite_dirt(player, filterid) {
    setfilterpassmaterial(player.localclientnum, filterid, 0, mapped_material_id("generic_filter_sprite_dirt"));
    function_74649ba9(player, filterid, 0, 1);
    setfilterpassquads(player.localclientnum, filterid, 0, 400);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x0
// Checksum 0xa5d241f5, Offset: 0x1fc0
// Size: 0x44
function set_filter_sprite_dirt_opacity(player, filterid, opacity) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 0, opacity);
}

// Namespace filter/filter_shared
// Params 5, eflags: 0x0
// Checksum 0xe6a9b98d, Offset: 0x2010
// Size: 0xa4
function set_filter_sprite_dirt_source_position(player, filterid, right, up, distance) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 1, right);
    setfilterpassconstant(player.localclientnum, filterid, 0, 2, up);
    setfilterpassconstant(player.localclientnum, filterid, 0, 3, distance);
}

// Namespace filter/filter_shared
// Params 4, eflags: 0x0
// Checksum 0x32b647cd, Offset: 0x20c0
// Size: 0x74
function set_filter_sprite_dirt_sun_position(player, filterid, pitch, yaw) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 4, pitch);
    setfilterpassconstant(player.localclientnum, filterid, 0, 5, yaw);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x0
// Checksum 0xa591e17, Offset: 0x2140
// Size: 0x44
function set_filter_sprite_dirt_seed_offset(player, filterid, offset) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 26, offset);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x0
// Checksum 0xc173b107, Offset: 0x2190
// Size: 0x44
function set_filter_sprite_dirt_elapsed(player, filterid, time) {
    setfilterpassconstant(player.localclientnum, filterid, 0, 28, time);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x0
// Checksum 0x1d9e8aa2, Offset: 0x21e0
// Size: 0x34
function disable_filter_sprite_dirt(player, filterid) {
    function_74649ba9(player, filterid, 0, 0);
}

// Namespace filter/filter_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc69fe601, Offset: 0x2220
// Size: 0x3c
function init_filter_drowning_damage(localclientnum) {
    init_filter_indices();
    map_material_helper_by_localclientnum(localclientnum, "generic_filter_drowning");
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x29258474, Offset: 0x2268
// Size: 0x6c
function enable_filter_drowning_damage(localclientnum, passid) {
    setfilterpassmaterial(localclientnum, 5, passid, mapped_material_id("generic_filter_drowning"));
    setfilterpassenabled(localclientnum, 5, passid, 1, 0, 1);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xd5bb9fea, Offset: 0x22e0
// Size: 0x3c
function set_filter_drowning_damage_opacity(localclientnum, passid, opacity) {
    setfilterpassconstant(localclientnum, 5, passid, 0, opacity);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x40527077, Offset: 0x2328
// Size: 0x44
function set_filter_drowning_damage_inner_radius(localclientnum, passid, inner) {
    setfilterpassconstant(localclientnum, 5, passid, 1, inner);
}

// Namespace filter/filter_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x2ac8a517, Offset: 0x2378
// Size: 0x44
function set_filter_drowning_damage_outer_radius(localclientnum, passid, outer) {
    setfilterpassconstant(localclientnum, 5, passid, 2, outer);
}

// Namespace filter/filter_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x8420b36b, Offset: 0x23c8
// Size: 0x34
function disable_filter_drowning_damage(localclientnum, passid) {
    setfilterpassenabled(localclientnum, 5, passid, 0);
}

