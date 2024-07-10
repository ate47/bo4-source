#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;

#namespace zm_item_pickup;

// Namespace zm_item_pickup/zm_item_pickup
// Params 5, eflags: 0x1 linked
// Checksum 0x4c379d4c, Offset: 0x80
// Size: 0x10a
function create_item_pickup(var_3d455c82, var_4b1985dd, var_b4bbefe4, n_radius = 64, var_c12c30aa = 0) {
    if (zm_utility::is_ee_enabled() || !var_c12c30aa) {
        if (!isdefined(var_4b1985dd)) {
            var_4b1985dd = zm_utility::function_d6046228(#"hash_388256f1e5a62d7c", #"hash_7693de01f82d93f0");
        }
        s_unitrigger = self zm_unitrigger::create(var_4b1985dd, n_radius, undefined, 1, var_c12c30aa);
        self.var_b4a870af = var_3d455c82;
        self.var_4bac8510 = var_b4bbefe4;
        self thread item_think();
        return s_unitrigger;
    }
}

// Namespace zm_item_pickup/zm_item_pickup
// Params 0, eflags: 0x5 linked
// Checksum 0x12db7b32, Offset: 0x198
// Size: 0xa8
function private item_think() {
    self endon(#"death");
    while (true) {
        s_notify = self waittill(#"trigger_activated");
        if (!isdefined(self.var_4bac8510) || [[ self.var_4bac8510 ]](s_notify.e_who)) {
            level thread [[ self.var_b4a870af ]](self, s_notify.e_who);
            self function_d6812b9d();
        }
    }
}

// Namespace zm_item_pickup/zm_item_pickup
// Params 0, eflags: 0x1 linked
// Checksum 0xd7334151, Offset: 0x248
// Size: 0x3c
function function_d6812b9d() {
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    self.s_unitrigger = undefined;
    self delete();
}

// Namespace zm_item_pickup/zm_item_pickup
// Params 2, eflags: 0x0
// Checksum 0xfa332f41, Offset: 0x290
// Size: 0xaa
function item_pickup_init(func_callback, var_c12c30aa = 0) {
    if (var_c12c30aa && !zm_utility::is_ee_enabled()) {
        return;
    }
    s_unitrigger = self zm_unitrigger::create("", 64, &function_8769717c, 1, var_c12c30aa);
    s_unitrigger.pickup_callbacks = array(func_callback);
    return s_unitrigger;
}

// Namespace zm_item_pickup/zm_item_pickup
// Params 0, eflags: 0x5 linked
// Checksum 0xbede8f39, Offset: 0x348
// Size: 0x13c
function private function_8769717c() {
    self endon(#"death");
    waitresult = self waittill(#"trigger");
    s_stub = self.stub;
    if (isdefined(waitresult.activator) && s_stub.b_picked_up !== 1) {
        s_stub.b_picked_up = 1;
        foreach (func_callback in s_stub.pickup_callbacks) {
            waitresult.activator thread [[ func_callback ]](s_stub.related_parent);
        }
        s_stub.related_parent hide();
        zm_unitrigger::unregister_unitrigger(s_stub);
    }
}

