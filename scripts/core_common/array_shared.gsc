// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/flagsys_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace array;

// Namespace array/array_shared
// Params 4, eflags: 0x21 linked
// Checksum 0xb31550f, Offset: 0xa0
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
// Params 2, eflags: 0x1 linked
// Checksum 0x1fa12f72, Offset: 0x240
// Size: 0x30
function remove_undefined(&array, b_keep_keys) {
    arrayremovevalue(array, undefined, b_keep_keys);
    return array;
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x205f7e32, Offset: 0x278
// Size: 0x30
function remove_dead(&array, b_keep_keys) {
    function_1eaaceab(array, b_keep_keys);
    return array;
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x239bfd92, Offset: 0x2b0
// Size: 0x42
function filter_classname(&array, b_keep_keys, str_classname) {
    return filter(array, b_keep_keys, &_filter_classname, str_classname);
}

// Namespace array/array_shared
// Params 3, eflags: 0x0
// Checksum 0x6251a2ab, Offset: 0x300
// Size: 0x42
function function_f23011ac(&array, b_keep_keys, str_classname) {
    return filter(array, b_keep_keys, &function_e01a747e, str_classname);
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x2b881bcd, Offset: 0x350
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
// Params 3, eflags: 0x1 linked
// Checksum 0x52b36cb3, Offset: 0x448
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
// Params 1, eflags: 0x1 linked
// Checksum 0x1064d1ac, Offset: 0x530
// Size: 0xf0
function delete_all(&array) {
    foreach (ent in array) {
        if (isdefined(ent)) {
            if (isstruct(ent)) {
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
// Params 2, eflags: 0x1 linked
// Checksum 0xf4d332a7, Offset: 0x628
// Size: 0x7c
function notify_all(&array, str_notify) {
    foreach (elem in array) {
        elem notify(str_notify);
    }
}

// Namespace array/array_shared
// Params 8, eflags: 0x1 linked
// Checksum 0xdfc5d02b, Offset: 0x6b0
// Size: 0x164
function thread_all(&entities, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    /#
        assert(isdefined(entities), "<unknown string>");
    #/
    /#
        assert(isdefined(func), "<unknown string>");
    #/
    if (isarray(entities)) {
        foreach (ent in entities) {
            util::single_thread(ent, func, arg1, arg2, arg3, arg4, arg5, arg6);
        }
    } else {
        util::single_thread(entities, func, arg1, arg2, arg3, arg4, arg5, arg6);
    }
}

// Namespace array/array_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x13adb818, Offset: 0x820
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
// Checksum 0x90d8e743, Offset: 0x980
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
// Checksum 0x939cac6, Offset: 0xaf0
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
// Checksum 0x4f95c0de, Offset: 0xbd0
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
// Checksum 0xd7082f47, Offset: 0xc48
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
// Checksum 0xeac8226f, Offset: 0xd88
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
// Checksum 0x330206a8, Offset: 0xee8
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
// Checksum 0x70053971, Offset: 0x1088
// Size: 0x54
function _waitlogic_match(s_tracker, str_notify, str_match) {
    self endon(#"death");
    self waittillmatch(str_match, str_notify);
    update_waitlogic_tracker(s_tracker);
}

// Namespace array/array_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1f3fa023, Offset: 0x10e8
// Size: 0x34
function _waitlogic_death(s_tracker) {
    self waittill(#"death");
    update_waitlogic_tracker(s_tracker);
}

// Namespace array/array_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xbe6dac65, Offset: 0x1128
// Size: 0x40
function update_waitlogic_tracker(s_tracker) {
    s_tracker._array_wait_count--;
    if (s_tracker._array_wait_count == 0) {
        s_tracker notify(#"array_wait");
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0xf57d41d, Offset: 0x1170
// Size: 0x9e
function flag_wait(&array, str_flag) {
    for (i = 0; i < array.size; i++) {
        ent = array[i];
        if (isdefined(ent) && !ent flag::get(str_flag)) {
            ent util::waittill_either("death", str_flag);
            i = -1;
        }
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0x14300385, Offset: 0x1218
// Size: 0x9e
function flagsys_wait(&array, str_flag) {
    for (i = 0; i < array.size; i++) {
        ent = array[i];
        if (isdefined(ent) && !ent flagsys::get(str_flag)) {
            ent util::waittill_either("death", str_flag);
            i = -1;
        }
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x20
// Checksum 0x6c6c7b5d, Offset: 0x12c0
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
// Checksum 0x3553499f, Offset: 0x13d0
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
// Checksum 0xb038c05b, Offset: 0x1488
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
// Params 3, eflags: 0x1 linked
// Checksum 0xfc080866, Offset: 0x1510
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
// Checksum 0x508b2ee9, Offset: 0x1610
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
// Checksum 0x4d81a85d, Offset: 0x1770
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
// Checksum 0x24f27d9a, Offset: 0x17f8
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
// Checksum 0x8382772b, Offset: 0x18c8
// Size: 0x58
function random(array) {
    if (array.size > 0) {
        keys = getarraykeys(array);
        return array[keys[randomint(keys.size)]];
    }
}

// Namespace array/array_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf367dc79, Offset: 0x1928
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
// Params 1, eflags: 0x1 linked
// Checksum 0xc741a087, Offset: 0x19c0
// Size: 0x64
function reverse(array) {
    a_array2 = [];
    for (i = array.size - 1; i >= 0; i--) {
        a_array2[a_array2.size] = array[i];
    }
    return a_array2;
}

// Namespace array/array_shared
// Params 4, eflags: 0x0
// Checksum 0xb0951f49, Offset: 0x1a30
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
// Checksum 0xb5bffe30, Offset: 0x1b08
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
// Checksum 0xddb14f09, Offset: 0x1ba8
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
// Checksum 0x8e423a42, Offset: 0x1c58
// Size: 0xa2
function pop(&array, index, b_keep_keys = 1) {
    if (array.size > 0) {
        if (!isdefined(index)) {
            index = getlastarraykey(array);
        }
        if (isdefined(array[index])) {
            ret = array[index];
            arrayremoveindex(array, index, b_keep_keys);
            return ret;
        }
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa1b5b90, Offset: 0x1d08
// Size: 0x62
function pop_front(&array, b_keep_keys = 1) {
    index = getfirstarraykey(array);
    return pop(array, index, b_keep_keys);
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x4da63223, Offset: 0x1d78
// Size: 0x54
function push(&array, val, index = array.size + 1) {
    arrayinsert(array, val, index);
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf9995e8, Offset: 0x1dd8
// Size: 0x34
function push_front(&array, val) {
    push(array, val, 0);
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x30964933, Offset: 0x1e18
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
// Checksum 0xab2a24e, Offset: 0x1ec0
// Size: 0x1e
function private function_80fe1cb6(a, b) {
    return a === b;
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xa1e67d4c, Offset: 0x1ee8
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
// Checksum 0xf4b5e969, Offset: 0x1f70
// Size: 0x1e
function closerfunc(dist1, dist2) {
    return dist1 >= dist2;
}

// Namespace array/array_shared
// Params 2, eflags: 0x0
// Checksum 0xbeef50fb, Offset: 0x1f98
// Size: 0x1e
function fartherfunc(dist1, dist2) {
    return dist1 <= dist2;
}

// Namespace array/array_shared
// Params 5, eflags: 0x0
// Checksum 0x83aae4f1, Offset: 0x1fc0
// Size: 0xba
function get_all_farthest(org, &array, a_exclude, n_max = array.size, n_maxdist) {
    a_ret = exclude(array, a_exclude);
    if (isdefined(n_maxdist)) {
        a_ret = arraysort(a_ret, org, 0, n_max, n_maxdist);
    } else {
        a_ret = arraysort(a_ret, org, 0, n_max);
    }
    return a_ret;
}

// Namespace array/array_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xf9ff38dd, Offset: 0x2088
// Size: 0xba
function get_all_closest(org, &array, a_exclude, n_max = array.size, n_maxdist) {
    a_ret = exclude(array, a_exclude);
    if (isdefined(n_maxdist)) {
        a_ret = arraysort(a_ret, org, 1, n_max, n_maxdist);
    } else {
        a_ret = arraysort(a_ret, org, 1, n_max);
    }
    return a_ret;
}

// Namespace array/array_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf0fa353c, Offset: 0x2150
// Size: 0x22
function alphabetize(&array) {
    return sort_by_value(array, 1);
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xad92b592, Offset: 0x2180
// Size: 0x42
function sort_by_value(&array, b_lowest_first = 0) {
    return merge_sort(array, &_compare_value, b_lowest_first);
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc4811824, Offset: 0x21d0
// Size: 0x42
function sort_by_script_int(&a_ents, b_lowest_first = 0) {
    return merge_sort(a_ents, &_compare_script_int, b_lowest_first);
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x19a0e515, Offset: 0x2220
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
// Checksum 0xe1e9013e, Offset: 0x23e8
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
// Params 2, eflags: 0x1 linked
// Checksum 0x7d374cd4, Offset: 0x2570
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
// Checksum 0xdddab2ea, Offset: 0x2710
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
// Checksum 0xcff374a5, Offset: 0x28b8
// Size: 0x38
function wait_till_touching(&a_ents, e_volume) {
    while (!is_touching(a_ents, e_volume)) {
        waitframe(1);
    }
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc011e840, Offset: 0x28f8
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
// Checksum 0xd0b9c1ad, Offset: 0x2998
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
// Params 2, eflags: 0x1 linked
// Checksum 0xc51ab170, Offset: 0x2a50
// Size: 0xde
function function_460f3c24(array1, array2) {
    if (!isarray(array1) || !isarray(array2)) {
        return 0;
    }
    if (array1.size != array2.size) {
        return 0;
    }
    foreach (key, v in array1) {
        if (v !== array2[key]) {
            return 0;
        }
    }
    return 1;
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x84d34495, Offset: 0x2b38
// Size: 0x60
function quick_sort(&array, compare_func) {
    sorted_array = arraycopy(array);
    quick_sort_mid(sorted_array, 0, sorted_array.size - 1, compare_func);
    return sorted_array;
}

// Namespace array/array_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x226db47b, Offset: 0x2ba0
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
// Checksum 0x9467495d, Offset: 0x2cf8
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
// Checksum 0xd512e6cc, Offset: 0x2d50
// Size: 0x1e
function function_5b554cb6(val1, val2) {
    return val1 > val2;
}

// Namespace array/array_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x23f891f4, Offset: 0x2d78
// Size: 0x6e
function _compare_script_int(e1, e2, b_lowest_first = 1) {
    if (b_lowest_first) {
        return (e1.script_int <= e2.script_int);
    } else {
        return (e1.script_int > e2.script_int);
    }
}

// Namespace array/array_shared
// Params 1, eflags: 0x0
// Checksum 0xf1d12bc6, Offset: 0x2df0
// Size: 0x10
function _filter_undefined(val) {
    return isdefined(val);
}

// Namespace array/array_shared
// Params 1, eflags: 0x0
// Checksum 0x791659bf, Offset: 0x2e08
// Size: 0x22
function _filter_dead(val) {
    return isalive(val);
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xd9969207, Offset: 0x2e38
// Size: 0x44
function _filter_classname(val, arg) {
    return isdefined(val.classname) && issubstr(val.classname, arg);
}

// Namespace array/array_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x4847eba3, Offset: 0x2e88
// Size: 0x46
function function_e01a747e(val, arg) {
    return !(isdefined(val.classname) && issubstr(val.classname, arg));
}

// Namespace array/array_shared
// Params 0, eflags: 0x0
// Checksum 0xe7f59342, Offset: 0x2ed8
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
// Checksum 0xde16c409, Offset: 0x2fa8
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
// Checksum 0xfd655ecf, Offset: 0x3240
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
// Checksum 0x11323d9e, Offset: 0x3318
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

