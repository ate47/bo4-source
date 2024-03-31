// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_inventory.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_ui_inventory;

// Namespace zm_ui_inventory/zm_ui_inventory
// Params 0, eflags: 0x2
// Checksum 0x14f7b00d, Offset: 0xe0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ui_inventory", &__init__, undefined, undefined);
}

// Namespace zm_ui_inventory/zm_ui_inventory
// Params 0, eflags: 0x5 linked
// Checksum 0xbb6d8b9a, Offset: 0x128
// Size: 0x150
function private __init__() {
    clientfield::register_bgcache("clientuimodel", "string", "hudItems.zmFeatureDescription", 1, undefined, 0, 0);
    zm_inventory::function_c7c05a13();
    registeredfields = [];
    foreach (mapping in level.var_a16c38d9) {
        if (!isdefined(registeredfields[mapping.var_cd35dfb2])) {
            registeredfields[mapping.var_cd35dfb2] = 1;
            var_9cf9ba9 = "worlduimodel";
            if (isdefined(mapping.ispersonal)) {
                var_9cf9ba9 = "clientuimodel";
            }
            clientfield::register(var_9cf9ba9, mapping.var_cd35dfb2, 1, mapping.numbits, "int", undefined, 0, 0);
        }
    }
}

