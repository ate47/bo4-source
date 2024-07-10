#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_weap_tesla_gun_t8;

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 0, eflags: 0x2
// Checksum 0xc5144699, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"tesla_gun", &__init__, undefined, undefined);
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 0, eflags: 0x1 linked
// Checksum 0xacb759a6, Offset: 0xf8
// Size: 0x1fc
function __init__() {
    level.w_tesla_gun_t8_upgraded = getweapon(#"ww_tesla_gun_t8_upgraded");
    level._effect[#"tesla_viewmodel_rail"] = #"zombie/fx_tesla_rail_view_zmb";
    level._effect[#"tesla_viewmodel_tube"] = #"zombie/fx_tesla_tube_view_zmb";
    level._effect[#"tesla_viewmodel_tube2"] = #"zombie/fx_tesla_tube_view2_zmb";
    level._effect[#"tesla_viewmodel_tube3"] = #"zombie/fx_tesla_tube_view3_zmb";
    level._effect[#"tesla_viewmodel_rail_upgraded"] = #"zombie/fx_tesla_rail_view_ug_zmb";
    level._effect[#"tesla_viewmodel_tube_upgraded"] = #"zombie/fx_tesla_tube_view_ug_zmb";
    level._effect[#"tesla_viewmodel_tube2_upgraded"] = #"zombie/fx_tesla_tube_view2_ug_zmb";
    level._effect[#"tesla_viewmodel_tube3_upgraded"] = #"zombie/fx_tesla_tube_view3_ug_zmb";
    clientfield::register("toplayer", "" + #"hash_611f27e5d51d036f", 28000, 1, "int", &function_4dfaa84c, 0, 0);
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 7, eflags: 0x1 linked
// Checksum 0xb0ac28f9, Offset: 0x300
// Size: 0xa4
function function_4dfaa84c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self thread tesla_fx_rail(localclientnum);
        self thread tesla_fx_tube(localclientnum);
        return;
    }
    self notify(#"hash_319d2bba47dac2c4");
    self clear_tesla_tube_effect(localclientnum);
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 1, eflags: 0x1 linked
// Checksum 0xfaaab8f7, Offset: 0x3b0
// Size: 0x160
function tesla_fx_rail(localclientnum) {
    self endon(#"death", #"hash_319d2bba47dac2c4");
    w_current = getcurrentweapon(localclientnum);
    wait(randomfloatrange(0, 12));
    while (true) {
        wait(randomfloatrange(8, 12));
        if (getweaponammoclip(localclientnum, w_current) > 0 && !ismeleeing(localclientnum)) {
            str_fx = level._effect[#"tesla_viewmodel_rail"];
            if (w_current == level.w_tesla_gun_t8_upgraded) {
                str_fx = level._effect[#"tesla_viewmodel_rail_upgraded"];
            }
            playviewmodelfx(localclientnum, str_fx, "tag_flash");
            playsound(localclientnum, #"wpn_tesla_effects", (0, 0, 0));
        }
    }
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 1, eflags: 0x1 linked
// Checksum 0xf814e4bb, Offset: 0x518
// Size: 0x320
function tesla_fx_tube(localclientnum) {
    self endon(#"death", #"hash_319d2bba47dac2c4");
    w_current = getcurrentweapon(localclientnum);
    while (true) {
        wait(0.1);
        n_ammo = getweaponammoclip(localclientnum, w_current);
        if (n_ammo <= 0) {
            self clear_tesla_tube_effect(localclientnum);
            continue;
        }
        str_fx = level._effect[#"tesla_viewmodel_tube"];
        if (w_current == level.w_tesla_gun_t8_upgraded) {
            switch (n_ammo) {
            case 1:
            case 2:
                str_fx = level._effect[#"tesla_viewmodel_tube3_upgraded"];
                n_tint = 2;
                break;
            case 3:
            case 4:
                str_fx = level._effect[#"tesla_viewmodel_tube2_upgraded"];
                n_tint = 1;
                break;
            default:
                str_fx = level._effect[#"tesla_viewmodel_tube_upgraded"];
                n_tint = 0;
                break;
            }
        } else {
            switch (n_ammo) {
            case 1:
                str_fx = level._effect[#"tesla_viewmodel_tube3"];
                n_tint = 2;
                break;
            case 2:
                str_fx = level._effect[#"tesla_viewmodel_tube2"];
                n_tint = 1;
                break;
            default:
                str_fx = level._effect[#"tesla_viewmodel_tube"];
                n_tint = 0;
                break;
            }
        }
        if (self.str_tesla_current_tube_effect !== str_fx && !ismeleeing(localclientnum)) {
            if (isdefined(self.n_tesla_tube_fx_id)) {
                deletefx(localclientnum, self.n_tesla_tube_fx_id, 1);
            }
            self.str_tesla_current_tube_effect = str_fx;
            self mapshaderconstant(localclientnum, 0, "scriptVector2", 0, 1, n_tint, 0);
        }
    }
}

// Namespace zm_weap_tesla_gun_t8/zm_weap_tesla_gun_t8
// Params 1, eflags: 0x1 linked
// Checksum 0x2b7cf2d2, Offset: 0x840
// Size: 0x7c
function clear_tesla_tube_effect(localclientnum) {
    if (isdefined(self.n_tesla_tube_fx_id)) {
        deletefx(localclientnum, self.n_tesla_tube_fx_id, 1);
        self.n_tesla_tube_fx_id = undefined;
    }
    self.str_tesla_current_tube_effect = undefined;
    self mapshaderconstant(localclientnum, 0, "scriptVector2", 0, 1, 3, 0);
}

