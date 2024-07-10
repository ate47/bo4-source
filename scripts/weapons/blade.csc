#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace blade;

// Namespace blade/blade
// Params 0, eflags: 0x2
// Checksum 0x61bb8363, Offset: 0x140
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"blade", &__init__, undefined, undefined);
}

// Namespace blade/blade
// Params 0, eflags: 0x1 linked
// Checksum 0xcabbb4b1, Offset: 0x188
// Size: 0x64
function __init__() {
    callback::on_localplayer_spawned(&function_e79ccfd8);
    callback::on_weapon_change(&on_weapon_change);
    callback::on_melee(&melee_event);
}

// Namespace blade/blade
// Params 1, eflags: 0x1 linked
// Checksum 0x4f7d1910, Offset: 0x1f8
// Size: 0x124
function on_weapon_change(params) {
    if (self == level || !isplayer(self)) {
        return;
    }
    localclientnum = params.localclientnum;
    weapon = self function_d2c2b168();
    if (weapon.name == #"sig_blade") {
        localplayer = function_5c10bd79(localclientnum);
        if (self == localplayer) {
            function_c0c566d4(localclientnum);
            return;
        }
        if (localplayer util::isenemyplayer(self)) {
            handle = self playloopsound("gdt_spectre_blade_loop");
            self thread function_c980da51(handle);
        }
    }
}

// Namespace blade/blade
// Params 1, eflags: 0x1 linked
// Checksum 0x6140fc33, Offset: 0x328
// Size: 0x64
function function_c980da51(handle) {
    self notify("79130178ae681449");
    self endon("79130178ae681449");
    self endon(#"death");
    self waittill(#"weapon_change");
    self stoploopsound(handle);
}

// Namespace blade/blade
// Params 1, eflags: 0x1 linked
// Checksum 0x9292f946, Offset: 0x398
// Size: 0xf8
function function_c0c566d4(localclientnum) {
    self notify("1904df9d4730174b");
    self endon("1904df9d4730174b");
    self endon(#"death");
    self.lunge_rumble = 0;
    while (true) {
        if (function_c5afdb1b(localclientnum) && !self.lunge_rumble) {
            self playrumblelooponentity(localclientnum, "blade_lunge_loop");
            self.lunge_rumble = 1;
        } else if (!function_c5afdb1b(localclientnum) && self.lunge_rumble) {
            self stoprumble(localclientnum, "blade_lunge_loop");
            self.lunge_rumble = 0;
        }
        waitframe(1);
    }
}

// Namespace blade/blade
// Params 1, eflags: 0x1 linked
// Checksum 0x1a915e33, Offset: 0x498
// Size: 0xbc
function melee_event(eventstruct) {
    if (!self function_21c0fa55()) {
        return;
    }
    if (eventstruct.weapon.name != #"sig_blade") {
        return;
    }
    if (!isdefined(eventstruct.victim)) {
        return;
    }
    if (!isplayer(eventstruct.victim)) {
        return;
    }
    if (eventstruct.victim == self) {
        return;
    }
    self play_blood(eventstruct.localclientnum);
}

// Namespace blade/blade
// Params 1, eflags: 0x5 linked
// Checksum 0x11ee6d84, Offset: 0x560
// Size: 0x24
function private function_e79ccfd8(localclientnum) {
    stop_postfx(localclientnum);
}

// Namespace blade/blade
// Params 1, eflags: 0x1 linked
// Checksum 0xc3f9fcd9, Offset: 0x590
// Size: 0x4c
function stop_postfx(localclientnum) {
    if (function_148ccc79(localclientnum, #"hash_4bc228d5f3bcffe5")) {
        codestoppostfxbundlelocal(localclientnum, #"hash_4bc228d5f3bcffe5");
    }
}

// Namespace blade/blade
// Params 1, eflags: 0x1 linked
// Checksum 0x8e552ad9, Offset: 0x5e8
// Size: 0x1e4
function play_blood(localclientnum) {
    if (!isdefined(self.var_2ba49f48)) {
        self.var_2ba49f48 = spawnstruct();
        self.var_2ba49f48.var_dcb0fc42 = 0;
        function_a837926b(localclientnum, #"hash_4bc228d5f3bcffe5");
        function_4238734d(localclientnum, #"hash_4bc228d5f3bcffe5", "Screen Radius Inner", 256);
        function_4238734d(localclientnum, #"hash_4bc228d5f3bcffe5", "Screen Radius Outer", 512);
        function_4238734d(localclientnum, #"hash_4bc228d5f3bcffe5", "Seed Offset", 0);
        function_4238734d(localclientnum, #"hash_4bc228d5f3bcffe5", "Opacity", 1);
    } else if (isdefined(self.var_2ba49f48.blendout) && self.var_2ba49f48.blendout) {
        return;
    }
    if (self.var_2ba49f48.var_dcb0fc42 <= 20) {
        self.var_2ba49f48.var_dcb0fc42++;
    }
    var_61187e1e = 1 - self.var_2ba49f48.var_dcb0fc42 * 0.05;
    function_4238734d(localclientnum, #"hash_4bc228d5f3bcffe5", "Sprite Count Squash", var_61187e1e);
    self thread watch_timeout(localclientnum);
}

// Namespace blade/blade
// Params 1, eflags: 0x1 linked
// Checksum 0xb14c49f5, Offset: 0x7d8
// Size: 0x9c
function watch_timeout(localclientnum) {
    self notify("33717749f8cb9ab");
    self endon("33717749f8cb9ab");
    self endon(#"death");
    wait(0.5);
    self.var_2ba49f48.blendout = 1;
    util::lerp_generic(localclientnum, 375, &function_2789edf8);
    self.var_2ba49f48 = undefined;
    stop_postfx(localclientnum);
}

// Namespace blade/blade
// Params 4, eflags: 0x1 linked
// Checksum 0x63aa44e8, Offset: 0x880
// Size: 0x7c
function function_2789edf8(currenttime, elapsedtime, localclientnum, duration) {
    percent = 1;
    if (duration > 0) {
        percent = 1 - elapsedtime / duration;
    }
    function_4238734d(localclientnum, #"hash_4bc228d5f3bcffe5", "Opacity", percent);
}

