#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\shoutcaster.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace ac130;

// Namespace ac130/ac130
// Params 0, eflags: 0x2
// Checksum 0xf729a712, Offset: 0x1b0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"ac130", &__init__, undefined, #"killstreaks");
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0x610248af, Offset: 0x200
// Size: 0x144
function __init__() {
    callback::on_localclient_connect(&on_localclient_connect);
    callback::function_17381fe(&function_17381fe);
    clientfield::register("clientuimodel", "vehicle.selectedWeapon", 1, 2, "int", &function_db40057d, 0, 0);
    clientfield::register("clientuimodel", "vehicle.flareCount", 1, 2, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "vehicle.inAC130", 1, 1, "int", undefined, 0, 0);
    clientfield::register("toplayer", "inAC130", 1, 1, "int", &function_555656fe, 0, 1);
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x67988b5, Offset: 0x350
// Size: 0xcc
function on_localclient_connect(localclientnum) {
    setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "vehicle.ac130.maincannonClipSize"), 2);
    setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "vehicle.ac130.autocannonClipSize"), 4);
    setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "vehicle.ac130.chaingunClipSize"), 20);
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x7d08796e, Offset: 0x428
// Size: 0x94
function function_17381fe(localclientnum) {
    if (shoutcaster::is_shoutcaster(localclientnum)) {
        player = function_5c10bd79(localclientnum);
        if (player clientfield::get_to_player("inAC130")) {
            function_555656fe(localclientnum, undefined, !shoutcaster::function_2e6e4ee0(localclientnum));
        }
    }
}

// Namespace ac130/ac130
// Params 7, eflags: 0x1 linked
// Checksum 0x2d64b504, Offset: 0x4c8
// Size: 0x144
function function_555656fe(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    bundle = struct::get_script_bundle("killstreak", "killstreak_ac130");
    postfxbundle = bundle.("ksVehiclePostEffectBun");
    if (!isdefined(postfxbundle)) {
        return;
    }
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (newval && shoutcaster::function_2e6e4ee0(localclientnum)) {
        newval = 0;
    }
    if (newval) {
        if (self postfx::function_556665f2(postfxbundle) == 0) {
            self codeplaypostfxbundle(postfxbundle);
        }
        return;
    }
    if (self postfx::function_556665f2(postfxbundle)) {
        self codestoppostfxbundle(postfxbundle);
    }
}

// Namespace ac130/ac130
// Params 7, eflags: 0x1 linked
// Checksum 0x8b1a15b1, Offset: 0x618
// Size: 0x10a
function function_db40057d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (oldval == 0) {
        return;
    }
    switch (newval) {
    case 1:
        playsound(0, #"hash_731251c4b03b5b09", (0, 0, 0));
        break;
    case 2:
        playsound(0, #"hash_731251c4b03b5b09", (0, 0, 0));
        break;
    case 3:
        playsound(0, #"hash_731251c4b03b5b09", (0, 0, 0));
        break;
    }
}

