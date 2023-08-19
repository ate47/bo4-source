// Atian COD Tools GSC decompiler test
#namespace math;

// Namespace math/math_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xf6960d70, Offset: 0x68
// Size: 0x4c
function clamp(val, val_min, val_max) {
    if (val < val_min) {
        val = val_min;
    } else if (val > val_max) {
        val = val_max;
    }
    return val;
}

// Namespace math/math_shared
// Params 5, eflags: 0x0
// Checksum 0x91a6dcf8, Offset: 0xc0
// Size: 0x6a
function linear_map(num, min_a, max_a, min_b, max_b) {
    return clamp((num - min_a) / (max_a - min_a) * (max_b - min_b) + min_b, min_b, max_b);
}

// Namespace math/math_shared
// Params 4, eflags: 0x0
// Checksum 0xe8c56373, Offset: 0x138
// Size: 0x9e
function lag(desired, curr, k, dt) {
    r = 0;
    if (k * dt >= 1 || k <= 0) {
        r = desired;
    } else {
        err = desired - curr;
        r = curr + k * err * dt;
    }
    return r;
}

// Namespace math/math_shared
// Params 1, eflags: 0x0
// Checksum 0xd4f5bd49, Offset: 0x1e0
// Size: 0xa8
function array_average(array) {
    /#
        assert(isarray(array));
    #/
    /#
        assert(array.size > 0);
    #/
    total = 0;
    for (i = 0; i < array.size; i++) {
        total = total + array[i];
    }
    return total / array.size;
}

// Namespace math/math_shared
// Params 2, eflags: 0x0
// Checksum 0x581256e6, Offset: 0x290
// Size: 0x11a
function array_std_deviation(array, mean) {
    /#
        assert(isarray(array));
    #/
    /#
        assert(array.size > 0);
    #/
    tmp = [];
    for (i = 0; i < array.size; i++) {
        tmp[i] = (array[i] - mean) * (array[i] - mean);
    }
    total = 0;
    for (i = 0; i < tmp.size; i++) {
        total = total + tmp[i];
    }
    return sqrt(total / array.size);
}

// Namespace math/math_shared
// Params 2, eflags: 0x0
// Checksum 0x93354b86, Offset: 0x3b8
// Size: 0xb6
function vector_compare(vec1, vec2) {
    return abs(vec1[0] - vec2[0]) < 0.001 && abs(vec1[1] - vec2[1]) < 0.001 && abs(vec1[2] - vec2[2]) < 0.001;
}

// Namespace math/math_shared
// Params 1, eflags: 0x0
// Checksum 0x244b3811, Offset: 0x478
// Size: 0x6c
function random_vector(max_length) {
    return (randomfloatrange(-1 * max_length, max_length), randomfloatrange(-1 * max_length, max_length), randomfloatrange(-1 * max_length, max_length));
}

// Namespace math/math_shared
// Params 2, eflags: 0x0
// Checksum 0x5a463285, Offset: 0x4f0
// Size: 0x6c
function angle_dif(oldangle, newangle) {
    outvalue = (oldangle - newangle) % 360;
    if (outvalue < 0) {
        outvalue = outvalue + 360;
    }
    if (outvalue > 180) {
        outvalue = (outvalue - 360) * -1;
    }
    return outvalue;
}

// Namespace math/math_shared
// Params 1, eflags: 0x0
// Checksum 0x133cb12c, Offset: 0x568
// Size: 0x22
function sign(x) {
    if (x >= 0) {
        return 1;
    }
    return -1;
}

// Namespace math/math_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x4209ab5e, Offset: 0x598
// Size: 0x38
function cointoss(n_chance = 50) {
    return function_21a3a673(1, 100) <= n_chance;
}

