// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\abilities\ability_player.gsc;

#namespace battleshield;

// Namespace battleshield/battleshield
// Params 0, eflags: 0x2
// Checksum 0x45041d36, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"battleshield", &__init__, undefined, undefined);
}

// Namespace battleshield/battleshield
// Params 0, eflags: 0x1 linked
// Checksum 0x5ef3e880, Offset: 0xf0
// Size: 0xdc
function __init__() {
    level.weaponsigbuckler = getweapon(#"sig_buckler");
    level.weaponsigbucklerlh = getweapon(#"sig_buckler_lh");
    level.weaponsigshieldturret = getweapon(#"sig_shield_turret");
    level.var_69aaf8f = getdvarfloat(#"hash_27445ccf68d30520", 5);
    ability_player::register_gadget_activation_callbacks(11, &function_e31bc59d, &linkcable_off_tele);
}

// Namespace battleshield/battleshield
// Params 2, eflags: 0x1 linked
// Checksum 0x971c913f, Offset: 0x1d8
// Size: 0xf4
function function_e31bc59d(abilityslot, weapon) {
    if (weapon != getweapon(#"sig_buckler_dw")) {
        return;
    }
    self.var_4233f7e5 = 1;
    self.var_70465a20 = gettime();
    if (!(isdefined(level.var_c4002ed1) && level.var_c4002ed1)) {
        if (isdefined(self)) {
            self clientfield::set_player_uimodel("hudItems.abilityHintIndex", 1);
        }
    }
    self waittill(#"death", #"weapon_change");
    if (isdefined(self)) {
        self clientfield::set_player_uimodel("hudItems.abilityHintIndex", 0);
    }
}

// Namespace battleshield/battleshield
// Params 2, eflags: 0x1 linked
// Checksum 0xefc7823b, Offset: 0x2d8
// Size: 0x1e
function linkcable_off_tele(abilityslot, weapon) {
    self.var_4233f7e5 = 0;
}

