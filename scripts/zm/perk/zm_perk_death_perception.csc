// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace zm_perk_death_perception;

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x2
// Checksum 0x7c757fb5, Offset: 0x178
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_death_perception", &__init__, undefined, undefined);
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x23561a04, Offset: 0x1c0
// Size: 0xc4
function __init__() {
    enable_death_perception_perk_for_level();
    level.var_1c1febec = [];
    for (i = 0; i < getmaxlocalclients(); i++) {
        level.var_1c1febec[i] = 0;
    }
    ai::add_ai_spawn_function(&function_731d83de);
    scene::function_2e58158b(&function_dd6c1a8b);
    zm_perks::function_f3c80d73("zombie_perk_bottle_death_perception", "zombie_perk_totem_death_perception");
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0xd4b9274a, Offset: 0x290
// Size: 0xe4
function enable_death_perception_perk_for_level() {
    zm_perks::register_perk_clientfields(#"specialty_awareness", &function_6e0b6101, &function_95ed7b4a);
    zm_perks::register_perk_effects(#"specialty_awareness", "divetonuke_light");
    zm_perks::register_perk_init_thread(#"specialty_awareness", &function_9b484511);
    zm_perks::function_b60f4a9f(#"specialty_awareness", #"p8_zm_vapor_altar_icon_01_deathperception", "zombie/fx8_perk_altar_symbol_ambient_death_perception", #"zmperksdeathperception");
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x380
// Size: 0x4
function function_9b484511() {
    
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0xed8e8cb9, Offset: 0x390
// Size: 0x4c
function function_6e0b6101() {
    clientfield::register("toplayer", "perk_death_perception_visuals", 1, 1, "int", &perk_death_perception_visuals, 0, 0);
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x3e8
// Size: 0x4
function function_95ed7b4a() {
    
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 7, eflags: 0x1 linked
// Checksum 0x131392da, Offset: 0x3f8
// Size: 0x226
function perk_death_perception_visuals(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    if (newval && !(isdefined(level.var_dc60105c) && level.var_dc60105c) && !isigcactive(localclientnum)) {
        level.var_1c1febec[localclientnum] = 1;
        a_ai = function_793a9f3d(localclientnum);
        foreach (ai in a_ai) {
            ai function_731d83de(localclientnum);
        }
        self thread function_fff5377e(localclientnum);
        return;
    }
    level.var_1c1febec[localclientnum] = 0;
    a_ai = function_793a9f3d(localclientnum);
    foreach (ai in a_ai) {
        ai stoprenderoverridebundle(#"hash_30651f363ef055e9");
    }
    self notify(#"hash_45ed6efeef67b773");
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 1, eflags: 0x1 linked
// Checksum 0xc0dee1f1, Offset: 0x628
// Size: 0x5c
function function_731d83de(localclientnum) {
    if (level.var_1c1febec[localclientnum] && self.team === #"axis") {
        self playrenderoverridebundle(#"hash_30651f363ef055e9");
    }
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 1, eflags: 0x1 linked
// Checksum 0xfa170f32, Offset: 0x690
// Size: 0x284
function function_fff5377e(localclientnum) {
    self endon(#"death", #"hash_45ed6efeef67b773");
    while (1) {
        if (!(isdefined(level.var_dc60105c) && level.var_dc60105c) && !isigcactive(localclientnum)) {
            a_ai = function_793a9f3d(localclientnum);
            a_ai = arraysortclosest(a_ai, self.origin, undefined, undefined, 200);
            var_8475afc1 = anglestoforward(self.angles);
            foreach (ai in a_ai) {
                if (isalive(ai)) {
                    if (vectordot(var_8475afc1, vectornormalize(ai.origin - self.origin)) < 0.35) {
                        var_f2c7b8b0 = ai.origin;
                        if (ai.type === #"vehicle") {
                            var_f2c7b8b0 = (ai.origin[0], ai.origin[1], self.origin[2]);
                        }
                        var_5d77125a = 1000 * (0.05 + 0.016 * a_ai.size + 0.015);
                        self addawarenessindicator(var_f2c7b8b0, "noncombat_danger", int(var_5d77125a));
                    }
                    waitframe(1);
                }
            }
        }
        wait(0.05);
    }
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 1, eflags: 0x5 linked
// Checksum 0xfcc7a624, Offset: 0x920
// Size: 0xb2
function private function_793a9f3d(localclientnum) {
    a_ai = getentarraybytype(localclientnum, 15);
    a_vh = getentarraybytype(localclientnum, 12);
    a_ai = arraycombine(a_ai, a_vh, 0, 0);
    if (a_ai.size) {
        a_ai = array::filter(a_ai, 0, &function_6a5f77);
    }
    return a_ai;
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 1, eflags: 0x1 linked
// Checksum 0xa14484d1, Offset: 0x9e0
// Size: 0x24
function function_6a5f77(val) {
    return val.team === #"axis";
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 1, eflags: 0x1 linked
// Checksum 0x18c25123, Offset: 0xa10
// Size: 0x74
function function_25410869(localclientnum) {
    if (self == function_5c10bd79(localclientnum)) {
        value = self clientfield::get_to_player("perk_death_perception_visuals");
        self perk_death_perception_visuals(localclientnum, undefined, value, undefined, undefined, undefined, undefined);
    }
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 2, eflags: 0x1 linked
// Checksum 0x5b713f60, Offset: 0xa90
// Size: 0x2c
function function_dd6c1a8b(localclientnum, b_igc_active) {
    self function_25410869(localclientnum);
}

