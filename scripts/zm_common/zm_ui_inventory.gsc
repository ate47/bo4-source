// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_inventory.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_ui_inventory;

// Namespace zm_ui_inventory/zm_ui_inventory
// Params 0, eflags: 0x2
// Checksum 0xb64764d9, Offset: 0xf0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ui_inventory", &__init__, undefined, undefined);
}

// Namespace zm_ui_inventory/zm_ui_inventory
// Params 0, eflags: 0x1 linked
// Checksum 0x1ea63bf7, Offset: 0x138
// Size: 0x168
function __init__() {
    callback::on_connecting(&onconnect);
    clientfield::register_bgcache("clientuimodel", "string", "hudItems.zmFeatureDescription", 1, 1);
    zm_inventory::function_c7c05a13();
    registeredfields = [];
    foreach (mapping in level.var_a16c38d9) {
        if (!isdefined(registeredfields[mapping.var_cd35dfb2])) {
            registeredfields[mapping.var_cd35dfb2] = 1;
            var_9cf9ba9 = "worlduimodel";
            if (isdefined(mapping.var_7f12f171)) {
                var_9cf9ba9 = "clientuimodel";
            }
            clientfield::register(var_9cf9ba9, mapping.var_cd35dfb2, 1, mapping.numbits, "int");
        }
    }
}

// Namespace zm_ui_inventory/zm_ui_inventory
// Params 0, eflags: 0x5 linked
// Checksum 0x117c19a9, Offset: 0x2a8
// Size: 0x1c
function private onconnect() {
    self thread function_13ad9a60();
}

// Namespace zm_ui_inventory/zm_ui_inventory
// Params 0, eflags: 0x5 linked
// Checksum 0x121d6f49, Offset: 0x2d0
// Size: 0x82
function private function_13ad9a60() {
    self endon(#"disconnect");
    while (true) {
        waitresult = undefined;
        waitresult = self waittill(#"menuresponse");
        response = waitresult.response;
        if (response == "zm_inventory_opened") {
            self notify(#"zm_inventory_menu_opened");
        }
    }
}

// Namespace zm_ui_inventory/zm_ui_inventory
// Params 3, eflags: 0x1 linked
// Checksum 0x22b9a766, Offset: 0x360
// Size: 0xe4
function function_7df6bb60(fieldname, value, player) {
    var_d5423fb8 = level.var_a16c38d9[fieldname];
    if (!(isdefined(var_d5423fb8) && isdefined(var_d5423fb8.var_7f12f171) && var_d5423fb8.var_7f12f171)) {
        self clientfield::set_world_uimodel(var_d5423fb8.var_cd35dfb2, value);
        return;
    }
    /#
        assert(isplayer(player));
    #/
    if (!isdefined(player)) {
        return;
    }
    player clientfield::set_player_uimodel(var_d5423fb8.var_cd35dfb2, value);
}

// Namespace zm_ui_inventory/zm_ui_inventory
// Params 1, eflags: 0x0
// Checksum 0xc0a32493, Offset: 0x450
// Size: 0x2c
function function_d8f1d200(var_ee9637ec) {
    self clientfield::set_player_uimodel("hudItems.zmFeatureDescription", var_ee9637ec);
}

