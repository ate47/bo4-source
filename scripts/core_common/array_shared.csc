// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flagsys_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;

#namespace array;

// Namespace array/array_shared
// Params 4, eflags: 0x21 linked
// Checksum 0x41ce9769, Offset: 0xa0
// Size: 0x196
function filter(&array, b_keep_keys, func_filter, ...) {
    a_new = [];
    foreach (key, val in array) {
        a_args = arraycombine(array(val), vararg, 1, 0);
        if (util::single_func_argarray(undefined, func_filter, a_args)) {
            if (isstring(key) || isweapon(key)) {
                if (isdefined(b_keep_keys) && !b_keep_keys) {
                    a_new[a_new.size] = val;
                } else {
                    a_new[key] = val;
                }
            } else if (isdefined(b_keep_keys) && b_keep_keys) {
                a_new[key] = val;
            } else {
                a_new[a_new.size] = val;
            }
        }
    }
    return a_new;
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x484af635, Offset: 0x240
// Size: 0x3a
function remove_undefined(&array, b_keep_keys) {
    return filter(array, b_keep_keys, &_filter_undefined);
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x8a6c46a7, Offset: 0x288
// Size: 0x3a
function remove_dead(&array, b_keep_keys) {
    return filter(array, b_keep_keys, &_filter_dead);
}

// Namespace array/array_shared
// Params 3, eflags: 0x0
// Checksum 0x3b6665e7, Offset: 0x2d0
// Size: 0x42
function filter_classname(&array, b_keep_keys, str_classname) {
    return filter(array, b_keep_keys, &_filter_classname, str_classname);
}

// Namespace array/array_shared
// Params 3, eflags: 0x0
// Checksum 0x88dbd526, Offset: 0x320
// Size: 0x42
function function_f23011ac(&array, b_keep_keys, str_classname) {
    return filter(array, b_keep_keys, &function_e01a747e, str_classname);
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0xad5f7547, Offset: 0x370
// Size: 0xf0
function get_touching(a_ents, e_volume) {
    a_touching = undefined;
    foreach (e_ent in a_ents) {
        if (e_ent istouching(e_volume)) {
            if (!isdefined(a_touching)) {
                a_touching = [];
            } else if (!isarray(a_touching)) {
                a_touching = array(a_touching);
            }
            a_touching[a_touching.size] = e_ent;
        }
    }
    return a_touching;
}

// Namespace array/array_shared
// Params 3, eflags: 0x0
// Checksum 0xd013e880, Offset: 0x468
// Size: 0xda
function remove_index(array, index, b_keep_keys) {
    a_new = [];
    foreach (key, val in array) {
        if (key == index) {
            continue;
        } else if (isdefined(b_keep_keys) && b_keep_keys) {
            a_new[key] = val;
        } else {
            a_new[a_new.size] = val;
        }
    }
    return a_new;
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0xf0a3e719, Offset: 0x550
// Size: 0xf0
function delete_all(&array, is_struct) {
    foreach (ent in array) {
        if (isdefined(ent)) {
            if (isdefined(is_struct) && is_struct) {
                ent struct::delete();
            } else if (isdefined(ent.__vtable)) {
                ent._deleted = 1;
                ent notify(#"death");
                ent = undefined;
            } else {
                ent delete();
            }
        }
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0xea168041, Offset: 0x648
// Size: 0x7c
function notify_all(&array, str_notify) {
    foreach (elem in array) {
        elem notify(str_notify);
    }
}

// Namespace array/array_shared
// Params 8, eflags: 0x1 linked
// Checksum 0x1e007946, Offset: 0x6d0
// Size: 0x16c
function thread_all(&entities, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    /#
        assert(isdefined(entities), "<unknown string>");
    #/
    /#
        assert(isdefined(func), "<unknown string>");
    #/
    if (isarray(entities)) {
        foreach (ent in entities) {
            if (!isdefined(ent)) {
                continue;
            }
            util::single_thread(ent, func, arg1, arg2, arg3, arg4, arg5, arg6);
        }
    } else {
        util::single_thread(entities, func, arg1, arg2, arg3, arg4, arg5, arg6);
    }
}

// Namespace array/array_shared
// Params 7, eflags: 0x0
// Checksum 0x47376013, Offset: 0x848
// Size: 0x154
function thread_all_ents(&entities, func, arg1, arg2, arg3, arg4, arg5) {
    /#
        assert(isdefined(entities), "<unknown string>");
    #/
    /#
        assert(isdefined(func), "<unknown string>");
    #/
    if (isarray(entities)) {
        foreach (v in entities) {
            util::single_thread(self, func, v, arg1, arg2, arg3, arg4, arg5);
        }
    } else {
        util::single_thread(self, func, entities, arg1, arg2, arg3, arg4, arg5);
    }
}

// Namespace array/array_shared
// Params 8, eflags: 0x1 linked
// Checksum 0xa4f19ad9, Offset: 0x9a8
// Size: 0x164
function run_all(&entities, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    /#
        assert(isdefined(entities), "<unknown string>");
    #/
    /#
        assert(isdefined(func), "<unknown string>");
    #/
    if (isarray(entities)) {
        foreach (ent in entities) {
            util::single_func(ent, func, arg1, arg2, arg3, arg4, arg5, arg6);
        }
    } else {
        util::single_func(entities, func, arg1, arg2, arg3, arg4, arg5, arg6);
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf7bdd174, Offset: 0xb18
// Size: 0xd8
function exclude(array, array_exclude) {
    newarray = array;
    if (isarray(array_exclude)) {
        foreach (exclude_item in array_exclude) {
            arrayremovevalue(newarray, exclude_item);
        }
    } else {
        arrayremovevalue(newarray, array_exclude);
    }
    return newarray;
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xb73ba5e6, Offset: 0xbf8
// Size: 0x6c
function add(&array, item, allow_dupes = 1) {
    if (isdefined(item)) {
        if (allow_dupes || !isinarray(array, item)) {
            array[array.size] = item;
        }
    }
}

// Namespace array/array_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xfef586d1, Offset: 0xc70
// Size: 0x132
function add_sorted(&array, item, allow_dupes = 1, func_compare, var_e19f0739 = 0) {
    if (isdefined(item)) {
        if (allow_dupes || !isinarray(array, item)) {
            for (i = 0; i <= array.size; i++) {
                if (i == array.size || isdefined(func_compare) && ([[ func_compare ]](item, array[i]) || var_e19f0739) || !isdefined(func_compare) && (item <= array[i] || var_e19f0739)) {
                    arrayinsert(array, item, i);
                    break;
                }
            }
        }
    }
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x5e0fa642, Offset: 0xdb0
// Size: 0x154
function wait_till(&array, notifies, n_timeout) {
    if (isdefined(n_timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(n_timeout, "timeout");
    }
    s_tracker = spawnstruct();
    s_tracker._wait_count = 0;
    foreach (ent in array) {
        if (isdefined(ent)) {
            ent thread util::timeout(n_timeout, &util::_waitlogic, s_tracker, notifies);
        }
    }
    if (s_tracker._wait_count > 0) {
        s_tracker waittill(#"waitlogic_finished");
    }
}

// Namespace array/array_shared
// Params 4, eflags: 0x0
// Checksum 0x5693e626, Offset: 0xf10
// Size: 0x194
function wait_till_match(&array, str_notify, str_match, n_timeout) {
    if (isdefined(n_timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(n_timeout, "timeout");
    }
    s_tracker = spawnstruct();
    s_tracker._array_wait_count = 0;
    foreach (ent in array) {
        if (isdefined(ent)) {
            s_tracker._array_wait_count++;
            ent thread util::timeout(n_timeout, &_waitlogic_match, s_tracker, str_notify, str_match);
            ent thread util::timeout(n_timeout, &_waitlogic_death, s_tracker);
        }
    }
    if (s_tracker._array_wait_count > 0) {
        s_tracker waittill(#"array_wait");
    }
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xddff4eae, Offset: 0x10b0
// Size: 0x54
function _waitlogic_match(s_tracker, str_notify, str_match) {
    self endon(#"death");
    self waittillmatch(str_match, str_notify);
    update_waitlogic_tracker(s_tracker);
}

// Namespace array/array_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x685f90a7, Offset: 0x1110
// Size: 0x34
function _waitlogic_death(s_tracker) {
    self waittill(#"death");
    update_waitlogic_tracker(s_tracker);
}

// Namespace array/array_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x70eaa262, Offset: 0x1150
// Size: 0x40
function update_waitlogic_tracker(s_tracker) {
    s_tracker._array_wait_count--;
    if (s_tracker._array_wait_count == 0) {
        s_tracker notify(#"array_wait");
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x9584a3f1, Offset: 0x1198
// Size: 0x7e
function flag_wait(&array, str_flag) {
    for (i = 0; i < array.size; i++) {
        ent = array[i];
        if (!ent flag::get(str_flag)) {
            ent waittill(str_flag);
            i = -1;
        }
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x46ed9870, Offset: 0x1220
// Size: 0x7e
function flagsys_wait(&array, str_flag) {
    for (i = 0; i < array.size; i++) {
        ent = array[i];
        if (!ent flagsys::get(str_flag)) {
            ent waittill(str_flag);
            i = -1;
        }
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x21 linked
// Checksum 0x61dba8a2, Offset: 0x12a8
// Size: 0x106
function flagsys_wait_any_flag(&array, ...) {
    for (i = 0; i < array.size; i++) {
        ent = array[i];
        if (isdefined(ent)) {
            b_flag_set = 0;
            foreach (str_flag in vararg) {
                if (ent flagsys::get(str_flag)) {
                    b_flag_set = 1;
                    break;
                }
            }
            if (!b_flag_set) {
                ent waittill(vararg);
                i = -1;
            }
        }
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x5f9c4e62, Offset: 0x13b8
// Size: 0xac
function flagsys_wait_any(&array, str_flag) {
    foreach (ent in array) {
        if (ent flagsys::get(str_flag)) {
            return ent;
        }
    }
    wait_any(array, str_flag);
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x953ec17d, Offset: 0x1470
// Size: 0x7e
function flag_wait_clear(&array, str_flag) {
    for (i = 0; i < array.size; i++) {
        ent = array[i];
        if (ent flag::get(str_flag)) {
            ent waittill(str_flag);
            i = -1;
        }
    }
}

// Namespace array/array_shared
// Params 3, eflags: 0x0
// Checksum 0x88541fd2, Offset: 0x14f8
// Size: 0xf6
function flagsys_wait_clear(&array, str_flag, n_timeout) {
    if (isdefined(n_timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(n_timeout, "timeout");
    }
    for (i = 0; i < array.size; i++) {
        ent = array[i];
        if (isdefined(ent) && ent flagsys::get(str_flag)) {
            ent util::waittill_either("death", str_flag);
            i = -1;
        }
    }
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x5250b84a, Offset: 0x15f8
// Size: 0x154
function wait_any(array, msg, n_timeout) {
    if (isdefined(n_timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(n_timeout, "timeout");
    }
    s_tracker = spawnstruct();
    foreach (ent in array) {
        if (isdefined(ent)) {
            level thread util::timeout(n_timeout, &_waitlogic2, s_tracker, ent, msg);
        }
    }
    s_tracker endon(#"array_wait");
    wait_till(array, "death");
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xbb2af8d2, Offset: 0x1758
// Size: 0x80
function _waitlogic2(s_tracker, ent, msg) {
    s_tracker endon(#"array_wait");
    if (msg != "death") {
        ent endon(#"death");
    }
    ent waittill(msg);
    s_tracker notify(#"array_wait");
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x2eb45c4a, Offset: 0x17e0
// Size: 0xc4
function flag_wait_any(array, str_flag) {
    self endon(#"death");
    foreach (ent in array) {
        if (ent flag::get(str_flag)) {
            return ent;
        }
    }
    wait_any(array, str_flag);
}

// Namespace array/array_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe05a21de, Offset: 0x18b0
// Size: 0x4e
function random(array) {
    keys = getarraykeys(array);
    return array[keys[randomint(keys.size)]];
}

// Namespace array/array_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x20ca5dbb, Offset: 0x1908
// Size: 0x90
function randomize(array) {
    for (i = 0; i < array.size; i++) {
        j = randomint(array.size);
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
    return array;
}

// Namespace array/array_shared
// Params 1, eflags: 0x0
// Checksum 0x63ca64e2, Offset: 0x19a0
// Size: 0x64
function reverse(array) {
    a_array2 = [];
    for (i = array.size - 1; i >= 0; i--) {
        a_array2[a_array2.size] = array[i];
    }
    return a_array2;
}

// Namespace array/array_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x2245fb99, Offset: 0x1a10
// Size: 0xd0
function slice(&array, var_12692bcf = 0, var_d88b3814 = 2147483647, n_increment = 1) {
    var_d88b3814 = min(var_d88b3814, array.size - 1);
    a_ret = [];
    i = var_12692bcf;
    while (i <= var_d88b3814) {
        a_ret[a_ret.size] = array[i];
        i = i + n_increment;
    }
    return a_ret;
}

// Namespace array/array_shared
// Params 1, eflags: 0x0
// Checksum 0xa556b1cf, Offset: 0x1ae8
// Size: 0x96
function remove_keys(array) {
    a_new = [];
    foreach (val in array) {
        if (isdefined(val)) {
            a_new[a_new.size] = val;
        }
    }
    return a_new;
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x2152b044, Offset: 0x1b88
// Size: 0xa8
function swap(&array, index1, index2) {
    /#
        assert(index1 < array.size, "<unknown string>");
    #/
    /#
        assert(index2 < array.size, "<unknown string>");
    #/
    temp = array[index1];
    array[index1] = array[index2];
    array[index2] = temp;
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x400e5a50, Offset: 0x1c38
// Size: 0xa2
function pop(&array, index, b_keep_keys = 1) {
    if (array.size > 0) {
        if (!isdefined(index)) {
            index = getfirstarraykey(array);
        }
        if (isdefined(array[index])) {
            ret = array[index];
            arrayremoveindex(array, index, b_keep_keys);
            return ret;
        }
    }
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x6770cd71, Offset: 0x1ce8
// Size: 0x64
function push(&array, val, index = getlastarraykey(array) + 1) {
    arrayinsert(array, val, index);
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3e81c04c, Offset: 0x1d58
// Size: 0x34
function push_front(&array, val) {
    push(array, val, 0);
}

// Namespace array/array_shared
// Params 3, eflags: 0x0
// Checksum 0xe9e33a63, Offset: 0x1d98
// Size: 0x9c
function replace(array, value, replacement) {
    foreach (i, val in array) {
        if (val === value) {
            array[i] = replacement;
        }
    }
    return array;
}

// Namespace array/array_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x63beef08, Offset: 0x1e40
// Size: 0x1e
function private function_80fe1cb6(a, b) {
    return a === b;
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x3d70a32a, Offset: 0x1e68
// Size: 0x7c
function find(&array, ent, func_compare = &function_80fe1cb6) {
    for (i = 0; i < array.size; i++) {
        if ([[ func_compare ]](array[i], ent)) {
            return i;
        }
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0xb07ee430, Offset: 0x1ef0
// Size: 0x1e
function closerfunc(dist1, dist2) {
    return dist1 >= dist2;
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x984802c, Offset: 0x1f18
// Size: 0x1e
function fartherfunc(dist1, dist2) {
    return dist1 <= dist2;
}

// Namespace array/array_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x1b2acd02, Offset: 0x1f40
// Size: 0x2f8
function get_all_closest(org, &array, excluders = [], max = array.size, maxdist) {
    maxdists2rd = undefined;
    if (isdefined(maxdist)) {
        maxdists2rd = maxdist * maxdist;
    }
    dist = [];
    index = [];
    for (i = 0; i < array.size; i++) {
        if (!isdefined(array[i])) {
            continue;
        }
        excluded = 0;
        for (p = 0; p < excluders.size; p++) {
            if (array[i] != excluders[p]) {
                continue;
            }
            excluded = 1;
            break;
        }
        if (excluded) {
            continue;
        }
        length = distancesquared(org, array[i].origin);
        if (isdefined(maxdists2rd) && maxdists2rd < length) {
            continue;
        }
        dist[dist.size] = length;
        index[index.size] = i;
    }
    for (;;) {
        change = 0;
        for (i = 0; i < dist.size - 1; i++) {
            if (dist[i] <= dist[i + 1]) {
                continue;
            }
            change = 1;
            temp = dist[i];
            dist[i] = dist[i + 1];
            dist[i + 1] = temp;
            temp = index[i];
            index[i] = index[i + 1];
            index[i + 1] = temp;
        }
        if (!change) {
            break;
        }
    }
    newarray = [];
    if (max > dist.size) {
        max = dist.size;
    }
    for (i = 0; i < max; i++) {
        newarray[i] = array[index[i]];
    }
    return newarray;
}

// Namespace array/array_shared
// Params 1, eflags: 0x0
// Checksum 0x4504701a, Offset: 0x2240
// Size: 0x22
function alphabetize(&array) {
    return sort_by_value(array, 1);
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x67c6bb11, Offset: 0x2270
// Size: 0x42
function sort_by_value(&array, b_lowest_first = 0) {
    return merge_sort(array, &_compare_value, b_lowest_first);
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0xc88eab87, Offset: 0x22c0
// Size: 0x42
function sort_by_script_int(&a_ents, b_lowest_first = 0) {
    return merge_sort(a_ents, &_compare_script_int, b_lowest_first);
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xf2b33062, Offset: 0x2310
// Size: 0x1ba
function merge_sort(&current_list, func_sort, param) {
    if (current_list.size <= 1) {
        return current_list;
    }
    left = [];
    right = [];
    middle = current_list.size / 2;
    for (x = 0; x < middle; x++) {
        if (!isdefined(left)) {
            left = [];
        } else if (!isarray(left)) {
            left = array(left);
        }
        left[left.size] = current_list[x];
    }
    while (x < current_list.size) {
        if (!isdefined(right)) {
            right = [];
        } else if (!isarray(right)) {
            right = array(right);
        }
        right[right.size] = current_list[x];
        x++;
    }
    left = merge_sort(left, func_sort, param);
    right = merge_sort(right, func_sort, param);
    result = merge(left, right, func_sort, param);
    return result;
}

// Namespace array/array_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x9dbd2bbe, Offset: 0x24d8
// Size: 0x17e
function merge(left, right, func_sort, param) {
    result = [];
    li = 0;
    ri = 0;
    while (li < left.size && ri < right.size) {
        b_result = undefined;
        if (isdefined(param)) {
            b_result = [[ func_sort ]](left[li], right[ri], param);
        } else {
            b_result = [[ func_sort ]](left[li], right[ri]);
        }
        if (b_result) {
            result[result.size] = left[li];
            li++;
        } else {
            result[result.size] = right[ri];
            ri++;
        }
    }
    while (li < left.size) {
        result[result.size] = left[li];
        li++;
    }
    while (ri < right.size) {
        result[result.size] = right[ri];
        ri++;
    }
    return result;
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0xc2f9394, Offset: 0x2660
// Size: 0x196
function function_b63fcb3(&array, sort_func) {
    start = 0;
    end = array.size;
    var_f9038db1 = 1;
    while (var_f9038db1 && start < end) {
        var_f9038db1 = 0;
        i = start;
        for (j = start + 1; j < end; j++) {
            if ([[ sort_func ]](array[j], array[i])) {
                swap(array, j, i);
                var_f9038db1 = 1;
            }
            i++;
        }
        end--;
        if (var_f9038db1 && start < end) {
            var_f9038db1 = 0;
            i = end - 2;
            for (j = i + 1; i >= start; j--) {
                if ([[ sort_func ]](array[j], array[i])) {
                    swap(array, j, i);
                    var_f9038db1 = 1;
                }
                i--;
            }
            start++;
        }
    }
}

// Namespace array/array_shared
// Params 7, eflags: 0x0
// Checksum 0xced66052, Offset: 0x2800
// Size: 0x19c
function spread_all(&entities, func, arg1, arg2, arg3, arg4, arg5) {
    /#
        assert(isdefined(entities), "<unknown string>");
    #/
    /#
        assert(isdefined(func), "<unknown string>");
    #/
    if (isarray(entities)) {
        foreach (ent in entities) {
            if (isdefined(ent)) {
                util::single_thread(ent, func, arg1, arg2, arg3, arg4, arg5);
            }
            wait(randomfloatrange(0.0666667, 0.133333));
        }
    } else {
        util::single_thread(entities, func, arg1, arg2, arg3, arg4, arg5);
        wait(randomfloatrange(0.0666667, 0.133333));
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x1d10423c, Offset: 0x29a8
// Size: 0x38
function wait_till_touching(&a_ents, e_volume) {
    while (!is_touching(a_ents, e_volume)) {
        waitframe(1);
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc2a4c9c, Offset: 0x29e8
// Size: 0x92
function is_touching(&a_ents, e_volume) {
    foreach (e_ent in a_ents) {
        if (!e_ent istouching(e_volume)) {
            return 0;
        }
    }
    return 1;
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x6c536386, Offset: 0x2a88
// Size: 0xae
function contains(array_or_val, value) {
    if (isarray(array_or_val)) {
        foreach (element in array_or_val) {
            if (element === value) {
                return 1;
            }
        }
        return 0;
    }
    return array_or_val === value;
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x3c549428, Offset: 0x2b40
// Size: 0x60
function quick_sort(&array, compare_func) {
    sorted_array = arraycopy(array);
    quick_sort_mid(sorted_array, 0, sorted_array.size - 1, compare_func);
    return sorted_array;
}

// Namespace array/array_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x8666d7fd, Offset: 0x2ba8
// Size: 0x14c
function quick_sort_mid(&array, start, end, compare_func) {
    if (end - start >= 1) {
        if (!isdefined(compare_func)) {
            compare_func = &_compare_value;
        }
        pivot = array[end];
        i = start;
        for (k = start; k < end; k++) {
            if ([[ compare_func ]](array[k], pivot)) {
                swap(array, i, k);
                i++;
            }
        }
        if (i != end) {
            swap(array, i, end);
        }
        quick_sort_mid(array, start, i - 1, compare_func);
        quick_sort_mid(array, i + 1, end, compare_func);
    }
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x5d51864a, Offset: 0x2d00
// Size: 0x50
function _compare_value(val1, val2, b_lowest_first = 1) {
    if (b_lowest_first) {
        return (val1 <= val2);
    } else {
        return (val1 > val2);
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x1385b412, Offset: 0x2d58
// Size: 0x1e
function function_5b554cb6(val1, val2) {
    return val1 > val2;
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x91cf62b3, Offset: 0x2d80
// Size: 0x6e
function _compare_script_int(e1, e2, b_lowest_first = 1) {
    if (b_lowest_first) {
        return (e1.script_int <= e2.script_int);
    } else {
        return (e1.script_int > e2.script_int);
    }
}

// Namespace array/array_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x369dcb29, Offset: 0x2df8
// Size: 0x10
function _filter_undefined(val) {
    return isdefined(val);
}

// Namespace array/array_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x5282933c, Offset: 0x2e10
// Size: 0x22
function _filter_dead(val) {
    return isalive(val);
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3ec60448, Offset: 0x2e40
// Size: 0x44
function _filter_classname(val, arg) {
    return isdefined(val.classname) && issubstr(val.classname, arg);
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xbb900848, Offset: 0x2e90
// Size: 0x46
function function_e01a747e(val, arg) {
    return !(isdefined(val.classname) && issubstr(val.classname, arg));
}

// Namespace array/array_shared
// Params 0, eflags: 0x0
// Checksum 0x819c3247, Offset: 0x2ee0
// Size: 0xc6
function function_f2d037b1() {
    /#
        wait(5);
        for (maxval = 0; maxval < 100; maxval++) {
            for (i = 0; i < 100; i++) {
                minval = function_21a3a673(0, maxval);
                function_d1f43a84(undefined, minval, maxval);
                function_d1f43a84(undefined, minval, maxval, &function_5b554cb6, 0);
                waitframe(1);
            }
        }
    #/
}

// Namespace array/array_shared
// Params 5, eflags: 0x0
// Checksum 0x515d991, Offset: 0x2fb0
// Size: 0x28c
function function_d1f43a84(max_entries, minval, maxval, compare_func, var_c8e96eee) {
    /#
        if (!isdefined(max_entries)) {
            max_entries = 20;
        }
        if (!isdefined(minval)) {
            minval = 0;
        }
        if (!isdefined(maxval)) {
            maxval = 100;
        }
        if (!isdefined(compare_func)) {
            compare_func = undefined;
        }
        if (!isdefined(var_c8e96eee)) {
            var_c8e96eee = 1;
        }
        var_365f3054 = randomintrange(0, max_entries);
        println("<unknown string>" + var_365f3054 + "<unknown string>" + minval + "<unknown string>" + maxval + "<unknown string>");
        source_array = [];
        for (i = 0; i < var_365f3054; i++) {
            if (!isdefined(source_array)) {
                source_array = [];
            } else if (!isarray(source_array)) {
                source_array = array(source_array);
            }
            source_array[source_array.size] = function_21a3a673(minval, maxval);
        }
        test_array = arraycopy(source_array);
        sorted_array = quick_sort(test_array, compare_func);
        if (var_c8e96eee) {
            for (i = 0; i < var_365f3054 - 1; i++) {
                /#
                    assert(sorted_array[i] <= sorted_array[i + 1], "<unknown string>");
                #/
            }
        } else {
            for (i = 0; i < var_365f3054 - 1; i++) {
                /#
                    assert(sorted_array[i] >= sorted_array[i + 1], "<unknown string>");
                #/
            }
        }
        println("<unknown string>");
    #/
}

// Namespace array/array_shared
// Params 0, eflags: 0x0
// Checksum 0x2b028563, Offset: 0x3248
// Size: 0xce
function function_81d0d595() {
    /#
        wait(5);
        for (maxval = 0; maxval < 100; maxval++) {
            for (i = 0; i < 100; i++) {
                minval = function_21a3a673(0, maxval);
                function_70daaa9d(undefined, minval, maxval, &_compare_value);
                function_70daaa9d(undefined, minval, maxval, &function_5b554cb6, 0);
                waitframe(1);
            }
        }
    #/
}

// Namespace array/array_shared
// Params 5, eflags: 0x0
// Checksum 0x32f64edd, Offset: 0x3320
// Size: 0x284
function function_70daaa9d(max_entries, minval, maxval, compare_func, var_c8e96eee) {
    /#
        if (!isdefined(max_entries)) {
            max_entries = 50;
        }
        if (!isdefined(minval)) {
            minval = 0;
        }
        if (!isdefined(maxval)) {
            maxval = 100;
        }
        if (!isdefined(compare_func)) {
            compare_func = undefined;
        }
        if (!isdefined(var_c8e96eee)) {
            var_c8e96eee = 1;
        }
        var_365f3054 = randomintrange(0, max_entries);
        println("<unknown string>" + var_365f3054 + "<unknown string>" + minval + "<unknown string>" + maxval + "<unknown string>");
        source_array = [];
        for (i = 0; i < var_365f3054; i++) {
            if (!isdefined(source_array)) {
                source_array = [];
            } else if (!isarray(source_array)) {
                source_array = array(source_array);
            }
            source_array[source_array.size] = function_21a3a673(minval, maxval);
        }
        sorted_array = arraycopy(source_array);
        function_b63fcb3(sorted_array, compare_func);
        if (var_c8e96eee) {
            for (i = 0; i < var_365f3054 - 1; i++) {
                /#
                    assert(sorted_array[i] <= sorted_array[i + 1], "<unknown string>");
                #/
            }
        } else {
            for (i = 0; i < var_365f3054 - 1; i++) {
                /#
                    assert(sorted_array[i] >= sorted_array[i + 1], "<unknown string>");
                #/
            }
        }
        println("<unknown string>");
    #/
}

