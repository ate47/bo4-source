#using scripts\core_common\water_surface.csc;
#using scripts\core_common\trigger_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\filter_shared.csc;

#namespace waterfall;

// Namespace waterfall/waterfall
// Params 1, eflags: 0x0
// Checksum 0xdc89d722, Offset: 0x100
// Size: 0xb8
function waterfalloverlay(localclientnum) {
    triggers = getentarray(localclientnum, "waterfall", "targetname");
    foreach (trigger in triggers) {
        trigger thread setupwaterfall(localclientnum);
    }
}

// Namespace waterfall/waterfall
// Params 1, eflags: 0x0
// Checksum 0x8d0ec925, Offset: 0x1c0
// Size: 0xb8
function waterfallmistoverlay(localclientnum) {
    triggers = getentarray(localclientnum, "waterfall_mist", "targetname");
    foreach (trigger in triggers) {
        trigger thread setupwaterfallmist(localclientnum);
    }
}

// Namespace waterfall/waterfall
// Params 1, eflags: 0x0
// Checksum 0x617d485d, Offset: 0x280
// Size: 0x42
function waterfallmistoverlayreset(localclientnum) {
    localplayer = function_5c10bd79(localclientnum);
    localplayer.rainopacity = 0;
}

// Namespace waterfall/waterfall
// Params 1, eflags: 0x0
// Checksum 0x92efc4c8, Offset: 0x2d0
// Size: 0x138
function setupwaterfallmist(localclientnum) {
    level notify("setupWaterfallmist_waterfall_csc" + localclientnum);
    level endon("setupWaterfallmist_waterfall_csc" + localclientnum);
    trigger = self;
    for (;;) {
        waitresult = trigger waittill(#"trigger");
        trigplayer = waitresult.activator;
        if (!trigplayer function_21c0fa55()) {
            continue;
        }
        localclientnum = trigplayer getlocalclientnumber();
        if (isdefined(localclientnum)) {
            localplayer = function_5c10bd79(localclientnum);
        } else {
            localplayer = trigplayer;
        }
        filter::init_filter_sprite_rain(localplayer);
        trigger thread trigger::function_thread(localplayer, &trig_enter_waterfall_mist, &trig_leave_waterfall_mist);
    }
}

// Namespace waterfall/waterfall
// Params 2, eflags: 0x0
// Checksum 0xe9a7c8aa, Offset: 0x410
// Size: 0x150
function setupwaterfall(localclientnum, localowner) {
    level notify(#"setupwaterfall_waterfall_csc" + string(localclientnum));
    level endon(#"setupwaterfall_waterfall_csc" + string(localclientnum));
    trigger = self;
    for (;;) {
        waitresult = trigger waittill(#"trigger");
        trigplayer = waitresult.activator;
        if (!trigplayer function_21c0fa55()) {
            continue;
        }
        localclientnum = trigplayer getlocalclientnumber();
        if (isdefined(localclientnum)) {
            localplayer = function_5c10bd79(localclientnum);
        } else {
            localplayer = trigplayer;
        }
        trigger thread trigger::function_thread(localplayer, &trig_enter_waterfall, &trig_leave_waterfall);
    }
}

// Namespace waterfall/waterfall
// Params 1, eflags: 0x0
// Checksum 0xeff31b0a, Offset: 0x568
// Size: 0xc0
function trig_enter_waterfall(localplayer) {
    trigger = self;
    localclientnum = localplayer.localclientnum;
    localplayer thread postfx::playpostfxbundle(#"pstfx_waterfall");
    playsound(0, #"amb_waterfall_hit", (0, 0, 0));
    while (trigger istouching(localplayer)) {
        localplayer playrumbleonentity(localclientnum, "waterfall_rumble");
        wait 0.1;
    }
}

// Namespace waterfall/waterfall
// Params 1, eflags: 0x0
// Checksum 0xb8947329, Offset: 0x630
// Size: 0x7c
function trig_leave_waterfall(localplayer) {
    trigger = self;
    localclientnum = localplayer.localclientnum;
    localplayer postfx::stoppostfxbundle("pstfx_waterfall");
    if (isunderwater(localclientnum) == 0) {
        localplayer thread water_surface::startwatersheeting();
    }
}

// Namespace waterfall/waterfall
// Params 1, eflags: 0x0
// Checksum 0x3f33ccf8, Offset: 0x6b8
// Size: 0x1ce
function trig_enter_waterfall_mist(localplayer) {
    localplayer endon(#"death");
    trigger = self;
    if (!isdefined(localplayer.rainopacity)) {
        localplayer.rainopacity = 0;
    }
    if (localplayer.rainopacity == 0) {
        filter::set_filter_sprite_rain_seed_offset(localplayer, 0, randomfloat(1));
    }
    filter::enable_filter_sprite_rain(localplayer, 0);
    while (trigger istouching(localplayer)) {
        localclientnum = trigger.localclientnum;
        if (!isdefined(localclientnum)) {
            localclientnum = localplayer getlocalclientnumber();
        }
        if (isunderwater(localclientnum)) {
            filter::disable_filter_sprite_rain(localplayer, 0);
            break;
        }
        localplayer.rainopacity += 0.003;
        if (localplayer.rainopacity > 1) {
            localplayer.rainopacity = 1;
        }
        filter::set_filter_sprite_rain_opacity(localplayer, 0, localplayer.rainopacity);
        filter::set_filter_sprite_rain_elapsed(localplayer, 0, localplayer getclienttime());
        waitframe(1);
    }
}

// Namespace waterfall/waterfall
// Params 1, eflags: 0x0
// Checksum 0x981b8da2, Offset: 0x890
// Size: 0x164
function trig_leave_waterfall_mist(localplayer) {
    localplayer endon(#"death");
    trigger = self;
    if (isdefined(localplayer.rainopacity)) {
        while (!trigger istouching(localplayer) && localplayer.rainopacity > 0) {
            localclientnum = trigger.localclientnum;
            if (isunderwater(localclientnum)) {
                filter::disable_filter_sprite_rain(localplayer, 0);
                break;
            }
            localplayer.rainopacity -= 0.005;
            filter::set_filter_sprite_rain_opacity(localplayer, 0, localplayer.rainopacity);
            filter::set_filter_sprite_rain_elapsed(localplayer, 0, localplayer getclienttime());
            waitframe(1);
        }
    }
    localplayer.rainopacity = 0;
    filter::disable_filter_sprite_rain(localplayer, 0);
}

