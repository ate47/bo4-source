// Atian COD Tools GSC decompiler test
#using scripts\core_common\player\player_stats.gsc;
#using scripts\mp_common\item_world.gsc;
#using scripts\mp_common\item_inventory.gsc;
#using scripts\mp_common\item_drop.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\dynent_world.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace wz_cash_safe;

// Namespace wz_cash_safe/wz_cash_safe
// Params 0, eflags: 0x2
// Checksum 0xb6738d81, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_cash_safe", &__init__, undefined, undefined);
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 0, eflags: 0x0
// Checksum 0x6c69a485, Offset: 0x140
// Size: 0xec
function __init__() {
    level.var_a6a3e12a = [];
    clientfield::register_clientuimodel("hudItems.depositing", 13000, 1, "int", 0);
    if (getdvarint(#"hash_7074ed0f04816b75", 0)) {
        clientfield::register("allplayers", "wz_cash_carrying", 13000, 1, "int");
    }
    level thread setup_safes();
    callback::on_player_killed(&on_player_killed);
    /#
        callback::on_game_playing(&function_a6eac3b7);
    #/
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 0, eflags: 0x4
// Checksum 0x94c24666, Offset: 0x238
// Size: 0x24
function private on_player_killed() {
    self clientfield::set_player_uimodel("hudItems.depositing", 0);
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 2, eflags: 0x0
// Checksum 0x8e398162, Offset: 0x268
// Size: 0x42
function function_ed66923(targetname, count) {
    if (isdefined(level.var_a6a3e12a[targetname])) {
        return;
    }
    level.var_a6a3e12a[targetname] = count;
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 0, eflags: 0x4
// Checksum 0x1bb4b824, Offset: 0x2b8
// Size: 0x1d8
function private setup_safes() {
    item_world::function_1b11e73c();
    foreach (targetname, count in level.var_a6a3e12a) {
        function_189f45d2(targetname);
    }
    item_world::function_4de3ca98();
    if (getdvarint(#"hash_7074ed0f04816b75", 0)) {
        item_drop::function_f3f9788a(#"cash_item_500", 1);
        level.var_590e0497 = [];
        foreach (targetname, count in level.var_a6a3e12a) {
            activate_safes(targetname, count);
        }
        level thread function_fb346efb();
        return;
    }
    foreach (targetname, count in level.var_a6a3e12a) {
        function_189f45d2(targetname);
    }
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 1, eflags: 0x4
// Checksum 0x9e121652, Offset: 0x498
// Size: 0xa8
function private function_189f45d2(targetname) {
    safes = getdynentarray(targetname);
    foreach (safe in safes) {
        function_e2a06860(safe, 1);
    }
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 2, eflags: 0x4
// Checksum 0x6673f2e, Offset: 0x548
// Size: 0x110
function private activate_safes(targetname, count) {
    safes = getdynentarray(targetname);
    while (safes.size > count) {
        i = randomint(safes.size);
        safes[i] hide_safe();
        arrayremoveindex(safes, i);
    }
    foreach (safe in safes) {
        safe activate_safe();
    }
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 0, eflags: 0x4
// Checksum 0xe48ebfec, Offset: 0x660
// Size: 0x118
function private function_fb346efb() {
    level flagsys::wait_till(#"hash_405e46788e83af41");
    var_c88d9756 = level.deathcircles.size - 1;
    while (level.deathcircleindex < var_c88d9756) {
        wait(1);
    }
    var_8e3c3c5b = level.deathcircles[level.deathcircleindex];
    level.var_590e0497 = [];
    foreach (targetname, count in level.var_a6a3e12a) {
        function_3387f756(targetname, var_8e3c3c5b.origin, var_8e3c3c5b.radius);
    }
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 3, eflags: 0x4
// Checksum 0x7974cdd2, Offset: 0x780
// Size: 0x108
function private function_3387f756(targetname, origin, radius) {
    safes = getdynentarray(targetname);
    radiussq = radius * radius;
    foreach (safe in safes) {
        if (distance2dsquared(origin, safe.origin) <= radiussq) {
            safe activate_safe();
            continue;
        }
        safe hide_safe();
    }
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 0, eflags: 0x4
// Checksum 0x6775eef4, Offset: 0x890
// Size: 0xbe
function private activate_safe() {
    function_e2a06860(self, 0);
    self.var_e7823894 = 1;
    self.canuse = &function_c92a5584;
    self.onbeginuse = &function_97eb71f0;
    self.var_263c4ded = &function_3d49217f;
    self.onuse = &function_7c5a1e82;
    self.onusecancel = &function_368adf4f;
    level.var_590e0497[level.var_590e0497.size] = self;
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 0, eflags: 0x4
// Checksum 0xc2acd134, Offset: 0x958
// Size: 0x1c
function private hide_safe() {
    function_e2a06860(self, 2);
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 1, eflags: 0x4
// Checksum 0xaf1a90b9, Offset: 0x980
// Size: 0x132
function private function_c92a5584(activator) {
    if (!isdefined(activator) || !isstruct(activator.inventory) || !isarray(activator.inventory.items)) {
        return false;
    }
    foreach (item in activator.inventory.items) {
        if (!isdefined(item) || !isstruct(item.itementry) || item.itementry.itemtype !== #"cash") {
            continue;
        }
        return true;
    }
    return false;
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 1, eflags: 0x4
// Checksum 0xa8092469, Offset: 0xac0
// Size: 0x64
function private function_97eb71f0(activator) {
    if (isdefined(activator.var_8a022726)) {
        activator.var_8a022726 sethintstring(#"");
    }
    activator clientfield::set_player_uimodel("hudItems.depositing", 1);
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 1, eflags: 0x4
// Checksum 0xf4f30f60, Offset: 0xb30
// Size: 0x4e
function private function_3d49217f(activator) {
    var_22aec194 = activator function_2cef7d98();
    if (isdefined(var_22aec194)) {
        return var_22aec194.itementry.casttime;
    }
    return undefined;
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 3, eflags: 0x4
// Checksum 0x20643c8, Offset: 0xb88
// Size: 0x1ec
function private function_7c5a1e82(activator, stateindex, var_9bdcfcd8) {
    self clear_prompts(activator);
    if (!isdefined(activator) || !isstruct(activator.inventory) || !isarray(activator.inventory.items)) {
        return false;
    }
    var_22aec194 = activator function_2cef7d98();
    if (isdefined(var_22aec194)) {
        scoreamount = var_22aec194.itementry.amount;
        initialcount = var_22aec194.count;
        activator item_inventory::use_inventory_item(var_22aec194.networkid, 1);
        if (var_22aec194.count < initialcount) {
            [[ level._setteamscore ]](activator.team, [[ level._getteamscore ]](activator.team) + scoreamount);
            playsoundatposition(#"hash_2b58f77dbea4ade1", self.origin);
            globallogic_score::function_889ed975(activator, scoreamount, 0, 0);
            activator stats::function_bb7eedf0(#"score", scoreamount);
            activator stats::function_b7f80d87(#"score", scoreamount);
            return true;
        }
    }
    return false;
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 0, eflags: 0x4
// Checksum 0x18f0cbed, Offset: 0xd80
// Size: 0x116
function private function_2cef7d98() {
    var_22aec194 = undefined;
    foreach (item in self.inventory.items) {
        if (!isdefined(item) || !isstruct(item.itementry) || item.itementry.itemtype !== #"cash") {
            continue;
        }
        if (!isdefined(var_22aec194) || var_22aec194.itementry.amount < item.itementry.amount) {
            var_22aec194 = item;
        }
    }
    return var_22aec194;
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 1, eflags: 0x4
// Checksum 0x7301096b, Offset: 0xea0
// Size: 0x24
function private function_368adf4f(activator) {
    self clear_prompts(activator);
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 1, eflags: 0x4
// Checksum 0xe3bf264, Offset: 0xed0
// Size: 0x94
function private clear_prompts(activator) {
    bundle = function_489009c1(self);
    state = function_ffdbe8c2(self);
    activator.var_8a022726 dynent_world::function_836af3b3(bundle, state);
    activator clientfield::set_player_uimodel("hudItems.depositing", 0);
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 0, eflags: 0x4
// Checksum 0xb4efdf0b, Offset: 0xf70
// Size: 0x168
function private function_a6eac3b7() {
    /#
        while (true) {
            wait(0.25);
            dvarstr = getdvarstring(#"scr_give_player_score", "<unknown string>");
            if (dvarstr == "<unknown string>") {
                continue;
            }
            setdvar(#"devgui_deathcircle", "<unknown string>");
            args = strtok(dvarstr, "<unknown string>");
            if (args.size == 2) {
                player = getentbynum(int(args[0]));
                if (isplayer(player)) {
                    [[ level._setteamscore ]](player.team, [[ level._getteamscore ]](player.team) + int(args[1]));
                }
            }
        }
    #/
}

