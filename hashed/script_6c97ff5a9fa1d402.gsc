// Atian COD Tools GSC decompiler test
#include scripts/core_common/array_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/map.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace elevators;

// Namespace elevators/namespace_af00ce90
// Params 0, eflags: 0x2
// Checksum 0xfc47534d, Offset: 0x138
// Size: 0x4c
function autoexec init() {
    clientfield::register("toplayer", "elevator_floor_selection", 1, 1, "int", &function_58c9169d, 0, 0);
}

// Namespace elevators/namespace_af00ce90
// Params 7, eflags: 0x0
// Checksum 0xad9682fb, Offset: 0x190
// Size: 0x5fc
function function_58c9169d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        var_aeb02423 = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.elevator");
        setuimodelvalue(createuimodel(var_aeb02423, "open"), 0);
        return;
    }
    var_812eb71d = struct::get_array("scriptbundle_elevators", "classname");
    var_2b9a81f7 = struct::get_array("elevator_button_call", "targetname");
    var_23e28773 = arraygetclosest(self.origin, var_812eb71d);
    var_366b2fbf = [];
    foreach (i, button in var_2b9a81f7) {
        if (button.target === var_23e28773.targetname) {
            var_366b2fbf[i] = button;
        }
    }
    var_366b2fbf = array::sort_by_script_int(var_366b2fbf, 1);
    var_aeb02423 = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.elevator");
    count = var_2b9a81f7.size;
    var_65792f8b = map::get_script_bundle();
    foreach (i, button in var_366b2fbf) {
        var_e1919f4e = button.script_int;
        switch (var_e1919f4e) {
        case 1:
            var_8cb245a4 = i;
            break;
        case 2:
            var_8cb245a4 = i;
            break;
        case 3:
            var_8cb245a4 = i;
            break;
        case 4:
            var_8cb245a4 = i;
            break;
        case 5:
            var_8cb245a4 = i;
            break;
        case 6:
            var_8cb245a4 = i;
            break;
        case 7:
            var_8cb245a4 = i;
            break;
        case 45:
            var_8cb245a4 = 23;
            break;
        case 46:
            var_8cb245a4 = 24;
            break;
        case 57:
            var_8cb245a4 = 30;
            break;
        case 58:
            var_8cb245a4 = 31;
            break;
        case 59:
            var_8cb245a4 = 32;
            break;
        case 97:
            var_8cb245a4 = 53;
            break;
        case 21:
            var_8cb245a4 = i + 6;
            break;
        case 22:
            var_8cb245a4 = i + 6;
            break;
        case 35:
            var_8cb245a4 = i + 10;
            break;
        case 36:
            var_8cb245a4 = i + 10;
            break;
        case 37:
            var_8cb245a4 = i + 10;
            break;
        case 38:
            var_8cb245a4 = i + 10;
            break;
        }
        itemuimodel = createuimodel(var_aeb02423, "item" + i);
        setuimodelvalue(createuimodel(itemuimodel, "name"), var_65792f8b.var_88d22b06[1].var_aa061872[var_8cb245a4].displayname);
        setuimodelvalue(createuimodel(itemuimodel, "id"), var_e1919f4e);
    }
    setuimodelvalue(createuimodel(var_aeb02423, "count"), count);
    setuimodelvalue(createuimodel(var_aeb02423, "open"), 1);
}

