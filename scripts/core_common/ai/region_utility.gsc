#namespace region_utility;

// Namespace region_utility/region_utility
// Params 0, eflags: 0x0
// Checksum 0x12b2f9ef, Offset: 0x90
// Size: 0x10e
function function_755c26d1() {
    level.lanedata = spawnstruct();
    i = 0;
    level.lanedata.var_23e0aef1 = [];
    for (var_23e0aef1 = getentarray("vol_tregion_lane_" + i, "targetname"); isdefined(var_23e0aef1) && isarray(var_23e0aef1) && var_23e0aef1.size > 0; var_23e0aef1 = getentarray("vol_tregion_lane_" + i, "targetname")) {
        level.lanedata.var_23e0aef1[i] = var_23e0aef1;
        waitframe(1);
        i++;
    }
    level.lanedata.numlanes = i;
}

// Namespace region_utility/region_utility
// Params 0, eflags: 0x0
// Checksum 0x65867a6a, Offset: 0x1a8
// Size: 0x46
function function_9fe18733() {
    if (!isdefined(level.lanedata) || !isdefined(level.lanedata.numlanes)) {
        return 0;
    }
    return level.lanedata.numlanes;
}

// Namespace region_utility/region_utility
// Params 3, eflags: 0x0
// Checksum 0x78cd96c8, Offset: 0x1f8
// Size: 0x82
function function_a129ecda(startpos, endpos, lanenum) {
    function_871ecf05();
    volumes = function_8373f930(lanenum);
    function_c5b9e623(volumes, 0.2);
    return function_e86822f4(startpos, endpos);
}

// Namespace region_utility/region_utility
// Params 3, eflags: 0x0
// Checksum 0xa21148aa, Offset: 0x288
// Size: 0x82
function function_b0f112ca(var_55e8adf1, var_d3547bb1, lanenum) {
    function_871ecf05();
    volumes = function_8373f930(lanenum);
    function_c5b9e623(volumes, 0.2);
    return function_afd64b51(var_55e8adf1, var_d3547bb1);
}

// Namespace region_utility/region_utility
// Params 0, eflags: 0x4
// Checksum 0x6a3e2f3e, Offset: 0x318
// Size: 0x6e
function private function_871ecf05() {
    for (i = 1; i < 128; i++) {
        info = function_b507a336(i);
        if (!isdefined(info)) {
            break;
        }
        function_e563d6b7(i, 1);
    }
}

// Namespace region_utility/region_utility
// Params 1, eflags: 0x4
// Checksum 0xf81adc8b, Offset: 0x390
// Size: 0x24
function private function_8373f930(lanenum) {
    return level.lanedata.var_23e0aef1[lanenum];
}

// Namespace region_utility/region_utility
// Params 2, eflags: 0x4
// Checksum 0xa5bba723, Offset: 0x3c0
// Size: 0x13e
function private function_c5b9e623(volumes, score) {
    if (!isarray(volumes)) {
        return;
    }
    for (i = 1; i < 128; i++) {
        info = function_b507a336(i);
        if (!isdefined(info)) {
            break;
        }
        desired = 0;
        foreach (volume in volumes) {
            if (volume istouching(info.origin)) {
                desired = 1;
                break;
            }
        }
        if (desired) {
            function_e563d6b7(i, score);
        }
    }
}

