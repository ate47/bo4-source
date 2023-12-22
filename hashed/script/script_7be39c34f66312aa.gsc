// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_6a81d072;

// Namespace namespace_6a81d072/namespace_6a81d072
// Params 0, eflags: 0x1 linked
// Checksum 0x2a61b067, Offset: 0xf8
// Size: 0x5c
function init() {
    level.var_ce7f71ea = "n";
    level.var_f6d11e0b = "f";
    level flag::wait_till("magicbox_initialized");
    level thread magic_box_update();
}

// Namespace namespace_6a81d072/namespace_6a81d072
// Params 1, eflags: 0x1 linked
// Checksum 0xcd296cb7, Offset: 0x160
// Size: 0xe4
function get_location_from_chest_index(chest_index) {
    if (isdefined(chest_index) && isdefined(level.chests) && isdefined(level.chests[chest_index]) && isdefined(level.open_chest_location)) {
        chest_loc = level.chests[chest_index].script_noteworthy;
        for (i = 0; i < level.open_chest_location.size; i++) {
            if (level.open_chest_location[i] == chest_loc) {
                return i;
            }
        }
    }
    /#
        /#
            assertmsg("<unknown string>" + chest_index);
        #/
    #/
}

// Namespace namespace_6a81d072/namespace_6a81d072
// Params 0, eflags: 0x1 linked
// Checksum 0xd06bc572, Offset: 0x250
// Size: 0x338
function magic_box_update() {
    self endon(#"end_game");
    util::registerclientsys("box_indicator");
    util::setclientsysstate("box_indicator", level.var_ce7f71ea);
    if (zm_custom::function_901b751c(#"zmmysteryboxstate") == 0) {
        return;
    }
    box_mode = "no_power";
    while (1) {
        if ((!level flag::get("power_on") || level flag::get("moving_chest_now")) && level.zombie_vars[#"zombie_powerup_fire_sale_on"] === 0) {
            box_mode = "no_power";
        } else if (level.zombie_vars[#"zombie_powerup_fire_sale_on"] === 1) {
            box_mode = "fire_sale";
        } else {
            box_mode = "box_available";
        }
        switch (box_mode) {
        case #"no_power":
            util::setclientsysstate("box_indicator", level.var_ce7f71ea);
            while (!level flag::get("power_on") && level.zombie_vars[#"zombie_powerup_fire_sale_on"] == 0) {
                wait(0.1);
            }
            break;
        case #"fire_sale":
            util::setclientsysstate("box_indicator", level.var_f6d11e0b);
            while (level.zombie_vars[#"zombie_powerup_fire_sale_on"] == 1) {
                wait(0.1);
            }
            break;
        case #"box_available":
            var_7aa396b9 = get_location_from_chest_index(level.chest_index);
            if (isdefined(var_7aa396b9)) {
                util::setclientsysstate("box_indicator", var_7aa396b9);
            }
            while (!flag::get("moving_chest_now") && level.zombie_vars[#"zombie_powerup_fire_sale_on"] == 0) {
                wait(0.1);
            }
            break;
        default:
            util::setclientsysstate("box_indicator", level.var_ce7f71ea);
            break;
        }
        wait(1);
    }
}

