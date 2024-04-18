// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\mp_common\item_drop.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_ajax;

// Namespace character_unlock_ajax/character_unlock_ajax
// Params 0, eflags: 0x2
// Checksum 0xd33b04a3, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_ajax", &__init__, undefined, #"character_unlock_ajax_fixup");
}

// Namespace character_unlock_ajax/character_unlock_ajax
// Params 0, eflags: 0x0
// Checksum 0xbae04bde, Offset: 0xe0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"ajax_unlock", &function_2613aeec);
}

// Namespace character_unlock_ajax/character_unlock_ajax
// Params 1, eflags: 0x0
// Checksum 0x2dc6be34, Offset: 0x120
// Size: 0xbc
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_drop_item", &on_drop_item);
        callback::on_item_use(&on_item_use);
        item_drop::function_f3f9788a(#"cu01_item", 0.35);
    }
}

// Namespace character_unlock_ajax/character_unlock_ajax
// Params 1, eflags: 0x0
// Checksum 0xaf5f3103, Offset: 0x1e8
// Size: 0xcc
function function_1c4b5097(item) {
    itementry = item.itementry;
    if (isdefined(itementry) && itementry.name === #"cu01_item") {
        var_b6015a5d = self function_b854ffba();
        if (var_b6015a5d >= 3 && self character_unlock::function_f0406288(#"ajax_unlock")) {
            self character_unlock::function_c8beca5e(#"ajax_unlock", #"hash_6e5a10ffa958d875", 1);
        }
    }
}

// Namespace character_unlock_ajax/character_unlock_ajax
// Params 1, eflags: 0x0
// Checksum 0x666a84fa, Offset: 0x2c0
// Size: 0x124
function on_drop_item(params) {
    if (!isplayer(self)) {
        return;
    }
    itementry = params.item.itementry;
    deathstash = params.item.deathstash;
    if (isdefined(deathstash) && deathstash) {
        return;
    }
    if (isdefined(itementry) && itementry.name === #"cu01_item") {
        var_b6015a5d = self function_b854ffba();
        if (var_b6015a5d < 3 && self character_unlock::function_c70bcc7a(#"ajax_unlock")) {
            self character_unlock::function_c8beca5e(#"ajax_unlock", #"hash_6e5a10ffa958d875", 0);
        }
    }
}

// Namespace character_unlock_ajax/character_unlock_ajax
// Params 1, eflags: 0x0
// Checksum 0xdf581e33, Offset: 0x3f0
// Size: 0xd4
function on_item_use(params) {
    itementry = params.item.itementry;
    if (isdefined(itementry) && itementry.name === #"cu01_item") {
        if (self character_unlock::function_c70bcc7a(#"ajax_unlock")) {
            var_b6015a5d = self function_b854ffba();
            if (var_b6015a5d < 3) {
                self character_unlock::function_c8beca5e(#"ajax_unlock", #"hash_6e5a10ffa958d875", 0);
            }
        }
    }
}

// Namespace character_unlock_ajax/character_unlock_ajax
// Params 0, eflags: 0x4
// Checksum 0x547d726c, Offset: 0x4d0
// Size: 0xf8
function private function_b854ffba() {
    var_b6015a5d = 0;
    if (isdefined(self.inventory) && isdefined(self.inventory.items)) {
        foreach (item in self.inventory.items) {
            itementry = item.itementry;
            if (isdefined(itementry) && itementry.name === #"cu01_item") {
                var_b6015a5d += item.count;
            }
        }
    }
    return var_b6015a5d;
}

