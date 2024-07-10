#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_office_ww_quest;

// Namespace zm_office_ww_quest/zm_office_ww_quest
// Params 0, eflags: 0x2
// Checksum 0xd67e34bb, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_office_ww_quest", &__init__, undefined, undefined);
}

// Namespace zm_office_ww_quest/zm_office_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x974da93c, Offset: 0xd8
// Size: 0x14
function __init__() {
    init_clientfields();
}

// Namespace zm_office_ww_quest/zm_office_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc4deb76f, Offset: 0xf8
// Size: 0x5c
function init_clientfields() {
    clientfield::register("toplayer", "" + #"hash_61ff06b1f8850806", 1, 1, "int", &drawer_rumble, 0, 0);
}

// Namespace zm_office_ww_quest/zm_office_ww_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xfba82297, Offset: 0x160
// Size: 0x6c
function drawer_rumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrumbleonentity(localclientnum, #"zm_office_drawer_rumble");
    }
}

