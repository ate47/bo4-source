#using scripts\core_common\match_record.gsc;

#namespace compass;

// Namespace compass/compass
// Params 2, eflags: 0x1 linked
// Checksum 0x9d583677, Offset: 0xd8
// Size: 0x38c
function setupminimap(material = "", zone = 0) {
    requiredmapaspectratio = getdvarfloat(#"scr_requiredmapaspectratio", 0);
    corners = getentarray("minimap_corner", "targetname");
    if (corners.size != 2) {
        println("<dev string:x38>");
        return;
    }
    corner0 = (corners[0].origin[0], corners[0].origin[1], 0);
    corner1 = (corners[1].origin[0], corners[1].origin[1], 0);
    match_record::function_7a93acec("compass_map_upper_left", corner0);
    match_record::function_7a93acec("compass_map_lower_right", corner1);
    cornerdiff = corner1 - corner0;
    north = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
    west = (0 - north[1], north[0], 0);
    if (vectordot(cornerdiff, west) > 0) {
        if (vectordot(cornerdiff, north) > 0) {
            northwest = corner1;
            southeast = corner0;
        } else {
            side = vecscale(north, vectordot(cornerdiff, north));
            northwest = corner1 - side;
            southeast = corner0 + side;
        }
    } else if (vectordot(cornerdiff, north) > 0) {
        side = vecscale(north, vectordot(cornerdiff, north));
        northwest = corner0 + side;
        southeast = corner1 - side;
    } else {
        northwest = corner0;
        southeast = corner1;
    }
    setminimap(material, northwest[0], northwest[1], southeast[0], southeast[1]);
    setminimapzone(northwest[0], northwest[1], southeast[0], southeast[1]);
}

// Namespace compass/compass
// Params 1, eflags: 0x0
// Checksum 0x7c5fbed, Offset: 0x470
// Size: 0x2d4
function setupminimapzone(zone) {
    corners = getentarray("zone_0" + zone + "_corner", "targetname");
    if (corners.size != 2) {
        println("<dev string:x38>");
        return;
    }
    corner0 = (corners[0].origin[0], corners[0].origin[1], 0);
    corner1 = (corners[1].origin[0], corners[1].origin[1], 0);
    cornerdiff = corner1 - corner0;
    north = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
    west = (0 - north[1], north[0], 0);
    if (vectordot(cornerdiff, west) > 0) {
        if (vectordot(cornerdiff, north) > 0) {
            northwest = corner1;
            southeast = corner0;
        } else {
            side = vecscale(north, vectordot(cornerdiff, north));
            northwest = corner1 - side;
            southeast = corner0 + side;
        }
    } else if (vectordot(cornerdiff, north) > 0) {
        side = vecscale(north, vectordot(cornerdiff, north));
        northwest = corner0 + side;
        southeast = corner1 - side;
    } else {
        northwest = corner0;
        southeast = corner1;
    }
    setminimapzone(northwest[0], northwest[1], southeast[0], southeast[1]);
}

// Namespace compass/compass
// Params 2, eflags: 0x1 linked
// Checksum 0xc57aa378, Offset: 0x750
// Size: 0x44
function vecscale(vec, scalar) {
    return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
}

