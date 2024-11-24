#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\infection;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace infection;

// Namespace infection/infection
// Params 0, eflags: 0x2
// Checksum 0x4234027a, Offset: 0xf0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"wz_infection", &__init__, undefined, #"infection");
}

// Namespace infection/infection
// Params 0, eflags: 0x4
// Checksum 0xce12b6b1, Offset: 0x140
// Size: 0xda
function private __init__() {
    if (!function_74650d7()) {
        return;
    }
    clientfield::register("toplayer", "infected", 21000, 1, "int", &_infected, 0, 0);
    callback::on_localclient_connect(&on_localclient_connect);
    level._effect[#"rise_burst"] = #"zombie/fx_spawn_dirt_hand_burst_zmb";
    level._effect[#"rise_billow"] = #"zombie/fx_spawn_dirt_body_billowing_zmb";
}

// Namespace infection/infection
// Params 1, eflags: 0x0
// Checksum 0xef6275d9, Offset: 0x228
// Size: 0x44
function on_localclient_connect(localclientnum) {
    if (util::get_game_type() == "warzone_pandemic_quad") {
        level thread function_667d34b7(localclientnum);
    }
}

// Namespace infection/infection
// Params 1, eflags: 0x4
// Checksum 0x3a1f3b86, Offset: 0x278
// Size: 0xfe
function private function_667d34b7(localclientnum) {
    var_d5823792 = 0;
    while (true) {
        local_player = function_5c10bd79(localclientnum);
        if (isdefined(local_player)) {
            infected = local_player clientfield::get_to_player("infected");
            if (infected === 1 && !var_d5823792) {
                var_d5823792 = 1;
                function_a837926b(localclientnum, #"hash_29b452119475ca86");
            } else if (infected === 0 && var_d5823792) {
                var_d5823792 = 0;
                function_24cd4cfb(localclientnum, #"hash_29b452119475ca86");
            }
        }
        waitframe(1);
    }
}

// Namespace infection/infection
// Params 7, eflags: 0x4
// Checksum 0xc5cd0f77, Offset: 0x380
// Size: 0x114
function private _infected(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread function_325e85a2(localclientnum);
        playsound(0, #"zmb_zombie_spawn", self.origin);
        burst_fx = level._effect[#"rise_burst"];
        billow_fx = level._effect[#"rise_billow"];
        self thread rise_dust_fx(localclientnum, billow_fx, burst_fx);
        return;
    }
    self notify(#"hash_4f90e54d76985430");
    self thread function_e5f3924e(localclientnum);
}

// Namespace infection/infection
// Params 1, eflags: 0x4
// Checksum 0xa9c02ea6, Offset: 0x4a0
// Size: 0xa8
function private function_e5f3924e(localclientnum) {
    players = getplayers(localclientnum);
    foreach (player in players) {
        player stoprenderoverridebundle("rob_wz_zombievision");
    }
}

// Namespace infection/infection
// Params 1, eflags: 0x4
// Checksum 0x25f58a0c, Offset: 0x550
// Size: 0x1bc
function private function_325e85a2(localclientnum) {
    self endon(#"hash_4f90e54d76985430");
    while (true) {
        players = getplayers(localclientnum);
        foreach (player in players) {
            corpse = player getplayercorpse();
            if (isdefined(corpse) && iscorpse(corpse) && corpse function_d2503806("rob_wz_zombievision")) {
                corpse stoprenderoverridebundle("rob_wz_zombievision");
            }
            if (!isalive(player) || player function_83973173()) {
                if (player function_d2503806("rob_wz_zombievision")) {
                    player stoprenderoverridebundle("rob_wz_zombievision");
                }
                continue;
            }
            player playrenderoverridebundle("rob_wz_zombievision");
        }
        wait 0.25;
    }
}

// Namespace infection/infection
// Params 3, eflags: 0x0
// Checksum 0x301f253e, Offset: 0x718
// Size: 0x10c
function rise_dust_fx(clientnum, billow_fx, burst_fx) {
    self endon(#"death");
    dust_tag = "J_SpineUpper";
    if (isdefined(burst_fx)) {
        playfx(clientnum, burst_fx, self.origin + (0, 0, randomintrange(5, 10)));
    }
    wait 0.25;
    if (isdefined(billow_fx)) {
        playfx(clientnum, billow_fx, self.origin + (randomintrange(-10, 10), randomintrange(-10, 10), randomintrange(5, 10)));
    }
}

