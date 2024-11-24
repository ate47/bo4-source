#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;

#namespace multi_extracam;

// Namespace multi_extracam/multi_extracam
// Params 0, eflags: 0x2
// Checksum 0x5a6a1f93, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"multi_extracam", &__init__, undefined, undefined);
}

// Namespace multi_extracam/multi_extracam
// Params 0, eflags: 0x0
// Checksum 0x83a5c634, Offset: 0x108
// Size: 0x24
function __init__() {
    callback::on_localclient_connect(&multi_extracam_init);
}

// Namespace multi_extracam/multi_extracam
// Params 1, eflags: 0x0
// Checksum 0x51e5382b, Offset: 0x138
// Size: 0x16e
function multi_extracam_init(localclientnum) {
    triggers = getentarray(localclientnum, "multicam_enable", "targetname");
    for (i = 1; i <= 4; i++) {
        camerastruct = struct::get("extracam" + i, "targetname");
        if (isdefined(camerastruct)) {
            camera_ent = spawn(localclientnum, camerastruct.origin, "script_origin");
            camera_ent.angles = camerastruct.angles;
            width = isdefined(camerastruct.extracam_width) ? camerastruct.extracam_width : -1;
            height = isdefined(camerastruct.extracam_height) ? camerastruct.extracam_height : -1;
            camera_ent setextracam(i - 1, width, height);
        }
    }
}

