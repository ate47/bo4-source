#using script_5ed83e40423c3935;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\clientfield_shared;

#namespace laststand_warzone;

// Namespace laststand_warzone/laststand_warzone
// Params 0, eflags: 0x2
// Checksum 0xd9bf85cc, Offset: 0x238
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"laststand", &__init__, undefined, undefined);
}

// Namespace laststand_warzone/laststand_warzone
// Params 0, eflags: 0x0
// Checksum 0x7b7a17a5, Offset: 0x280
// Size: 0x1fc
function __init__() {
    if (!sessionmodeiswarzonegame()) {
        return;
    }
    setdvar(#"hash_211a0d7f1fd46cfa", 0);
    wz_revive_prompt::register("wz_revive_prompt_1");
    wz_revive_prompt::register("wz_revive_prompt_2");
    wz_revive_prompt::register("wz_revive_prompt_3");
    clientfield::register("clientuimodel", "hudItems.laststand.progress", 1, 5, "float", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.laststand.beingRevived", 1, 1, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.laststand.revivingClientNum", 1, 7, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.laststand.reviveProgress", 1, 5, "float", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.beingFinished", 1, 1, "int", undefined, 0, 0);
    clientfield::register("allplayers", "laststand_bleed", 1, 1, "int", &laststand_bleed, 0, 0);
    level thread wait_and_set_revive_shader_constant();
}

// Namespace laststand_warzone/laststand_warzone
// Params 0, eflags: 0x0
// Checksum 0x93751cbe, Offset: 0x488
// Size: 0xd0
function wait_and_set_revive_shader_constant() {
    while (true) {
        waitresult = level waittill(#"notetrack");
        localclientnum = waitresult.localclientnum;
        if (waitresult.notetrack == "revive_shader_constant") {
            player = function_5c10bd79(localclientnum);
            player mapshaderconstant(localclientnum, 0, "scriptVector2", 0, 1, 0, getservertime(localclientnum) / 1000);
        }
    }
}

// Namespace laststand_warzone/laststand_warzone
// Params 7, eflags: 0x0
// Checksum 0x32e2a262, Offset: 0x560
// Size: 0x19c
function laststand_bleed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval != oldval && newval && isplayer(self)) {
        self util::waittill_dobj(localclientnum);
        if (isdefined(self)) {
            character_index = self getcharacterbodytype();
            fields = getcharacterfields(character_index, currentsessionmode());
            if (isdefined(fields) && (isdefined(fields.digitalblood) ? fields.digitalblood : 0)) {
                self.var_63796ff0 = function_239993de(localclientnum, "player/fx8_plyr_blood_drip_last_stand_oil", self, "j_spine4");
            } else {
                self.var_63796ff0 = function_239993de(localclientnum, "player/fx8_plyr_blood_drip_last_stand", self, "j_spine4");
            }
        }
        return;
    }
    if (isdefined(self.var_63796ff0)) {
        stopfx(localclientnum, self.var_63796ff0);
    }
}

