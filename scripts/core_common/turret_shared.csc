#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;

#namespace turret;

// Namespace turret/turret_shared
// Params 0, eflags: 0x2
// Checksum 0x71ae8e1e, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"turret", &__init__, undefined, undefined);
}

// Namespace turret/turret_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x9d769735, Offset: 0x110
// Size: 0x4c
function __init__() {
    clientfield::register("vehicle", "toggle_lensflare", 1, 1, "int", &field_toggle_lensflare, 0, 0);
}

// Namespace turret/turret_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x71bdaae7, Offset: 0x168
// Size: 0x116
function field_toggle_lensflare(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.scriptbundlesettings)) {
        return;
    }
    settings = struct::get_script_bundle("vehiclecustomsettings", self.scriptbundlesettings);
    if (!isdefined(settings)) {
        return;
    }
    if (isdefined(self.turret_lensflare_id)) {
        deletefx(localclientnum, self.turret_lensflare_id);
        self.turret_lensflare_id = undefined;
    }
    if (newval) {
        if (isdefined(settings.lensflare_fx) && isdefined(settings.lensflare_tag)) {
            self.turret_lensflare_id = util::playfxontag(localclientnum, settings.lensflare_fx, self, settings.lensflare_tag);
        }
    }
}

