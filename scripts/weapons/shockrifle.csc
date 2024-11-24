#using scripts\core_common\blood;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\util_shared;
#using scripts\weapons\weaponobjects;

#namespace shockrifle;

// Namespace shockrifle/shockrifle
// Params 0, eflags: 0x1 linked
// Checksum 0x73642fb, Offset: 0x130
// Size: 0xdc
function init_shared() {
    clientfield::register("toplayer", "shock_rifle_shocked", 1, 1, "int", &shock_rifle_shocked, 0, 0);
    clientfield::register("toplayer", "shock_rifle_damage", 1, 1, "int", &shock_rifle_damage, 0, 0);
    clientfield::register("allplayers", "shock_rifle_sound", 1, 1, "int", &shock_rifle_sound, 0, 0);
}

// Namespace shockrifle/shockrifle
// Params 7, eflags: 0x1 linked
// Checksum 0x6bd0c252, Offset: 0x218
// Size: 0xcc
function shock_rifle_shocked(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.playerIsShocked"), 1);
        return;
    }
    setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.playerIsShocked"), 0);
}

// Namespace shockrifle/shockrifle
// Params 7, eflags: 0x1 linked
// Checksum 0x48fada4e, Offset: 0x2f0
// Size: 0x76
function shock_rifle_damage(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        splatter = blood::getsplatter(localclientnum);
        splatter.shockrifle = 1;
    }
}

// Namespace shockrifle/shockrifle
// Params 7, eflags: 0x1 linked
// Checksum 0xc2b0b69e, Offset: 0x370
// Size: 0x7c
function shock_rifle_sound(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playloopsound("wpn_shockrifle_electrocution");
        return;
    }
    self stopallloopsounds();
}

