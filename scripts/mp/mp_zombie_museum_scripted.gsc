// Atian COD Tools GSC decompiler test
#using scripts\mp_common\draft.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace mp_zombie_museum_scripted;

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x2
// Checksum 0xcf838b81, Offset: 0x148
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mp_zombie_museum_scripted", &__init__, &__main__, undefined);
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x7312ab2e, Offset: 0x198
// Size: 0x84
function __init__() {
    callback::on_game_playing(&on_game_playing);
    clientfield::register("scriptmover", "zombie_has_eyes", 1, 1, "int");
    clientfield::register("scriptmover", "exhibit_vo", 1, 4, "int");
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x12e2059, Offset: 0x228
// Size: 0xcc
function __main__() {
    scene::add_scene_func(#"hash_19f1cd836fd409da", &function_35fa13e8, "play");
    level.var_f3e25805 = &function_c3c859e1;
    if (getgametypesetting(#"allowmapscripting")) {
        if (getdvarint(#"hash_7ac069c0a6148b32", 1)) {
            level thread function_304304b4();
        }
        level thread function_34fc666e();
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xcb09203f, Offset: 0x300
// Size: 0x54
function function_c3c859e1() {
    level thread scene::stop(#"hash_65e09b4e3d46f3e5", 1);
    level thread scene::stop(#"hash_36b20e793a4a1d22", 1);
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xa33a21ef, Offset: 0x360
// Size: 0x34
function on_game_playing() {
    level thread function_489bd1e9();
    level thread function_208c2a11();
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xab1b9903, Offset: 0x3a0
// Size: 0x530
function function_304304b4() {
    var_9fba9861 = array(#"hash_793682c8025c8a72", #"hash_248819bd6d0bebad", #"hash_248816bd6d0be694", #"hash_248817bd6d0be847", #"hash_248814bd6d0be32e", #"hash_4025d13190c3e1da", #"hash_7e69aaf57b23bac7", #"hash_248815bd6d0be4e1", #"hash_14ac2bc3d088de17", #"hash_69f5eaedbbc28788", #"hash_248812bd6d0bdfc8", #"hash_faf914864952c40", #"hash_3e4b60276426aa55", #"hash_4f6cfe6c270e930b", #"hash_7ec086db9c96cd4d", #"hash_38e510b2ec569146", #"hash_4f6cff6c270e94be", #"hash_22dc2b75f56a628a", #"hash_202837d7ef0f7577", #"hash_632e390849174ebc", #"hash_632e3c08491753d5", #"hash_632e3b0849175222", #"hash_632e3608491749a3", #"hash_632e3508491747f0", #"hash_632e380849174d09", #"hash_632e370849174b56", #"hash_632e420849175e07", #"hash_632e410849175c54", #"hash_632ab408491436e6", #"hash_632ab50849143899", #"hash_632ab20849143380", #"hash_3ba197ae1ed4fcc6", #"hash_28fb7e04d65ac0c2", #"hash_71892698b9803fcf", #"hash_3ba196ae1ed4fb13", #"hash_59d0a72b603fa965", #"hash_1829df3c0efc547e", #"hash_c3eb0cc21539b5", #"hash_c3e80cc215349c", #"hash_76371db8359db0a6", #"hash_76371cb8359daef3", #"hash_76371bb8359dad40", #"hash_763722b8359db925", #"hash_7589cc415b79723b", #"hash_3573abae9f3ec484", #"hash_763721b8359db772", #"hash_31690edc5bfac5e", #"hash_687d46fb134c93d3", #"hash_4af8d26882a98651", #"hash_2f194b687256acac", #"hash_39cea46878fc2ee7", #"hash_65245568918911aa", #"hash_6b996e6894915a65", #"hash_5246e7688669b900", #"hash_5d6ba5fd6755f279", #"hash_5d6ba2fd6755ed60", #"hash_5d6ba3fd6755ef13", #"hash_5d6ba8fd6755f792", #"hash_5d6ba9fd6755f945", #"hash_5d6ba6fd6755f42c", #"hash_5d6bacfd6755fe5e");
    foreach (var_649b3d1e in var_9fba9861) {
        waitframe(1);
        scenes = struct::get_array(var_649b3d1e, "scriptbundlename");
        if (scenes.size == 0) {
            /#
                print("<unknown string>" + function_9e72a96(var_649b3d1e) + "<unknown string>" + "<unknown string>");
            #/
            continue;
        }
        scene::add_scene_func(var_649b3d1e, &function_9b8bc25c);
        /#
            scene::add_scene_func(var_649b3d1e, &function_4ee0d67);
        #/
        level thread scene::play(var_649b3d1e);
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x73c8b1c0, Offset: 0x8d8
// Size: 0x34c
function function_9b8bc25c(a_ents) {
    var_a0bf5f9e = array(#"hash_4af8d26882a98651", #"hash_2f194b687256acac", #"hash_39cea46878fc2ee7", #"hash_65245568918911aa", #"hash_6b996e6894915a65", #"hash_5246e7688669b900", #"hash_5d6ba5fd6755f279", #"hash_5d6ba2fd6755ed60", #"hash_5d6ba3fd6755ef13", #"hash_5d6ba8fd6755f792", #"hash_5d6ba9fd6755f945", #"hash_5d6ba6fd6755f42c", #"hash_5d6bacfd6755fe5e", #"hash_632e390849174ebc");
    var_7a4fb99 = array(#"hash_5d6ba5fd6755f279", #"hash_5d6ba2fd6755ed60", #"hash_5d6ba3fd6755ef13", #"hash_5d6ba8fd6755f792", #"hash_5d6ba9fd6755f945", #"hash_5d6ba6fd6755f42c", #"hash_5d6bacfd6755fe5e");
    var_29942081 = array(#"hash_5d6ba5fd6755f279", #"hash_5d6ba2fd6755ed60", #"hash_5d6ba3fd6755ef13", #"hash_5d6ba8fd6755f792", #"hash_5d6ba9fd6755f945", #"hash_5d6ba6fd6755f42c", #"hash_5d6bacfd6755fe5e", #"hash_4af8d26882a98651", #"hash_2f194b687256acac", #"hash_39cea46878fc2ee7", #"hash_65245568918911aa", #"hash_6b996e6894915a65", #"hash_5246e7688669b900");
    if (!isinarray(var_a0bf5f9e, self.scriptbundlename)) {
        array::run_all(a_ents, &setcandamage, 1);
    }
    if (isinarray(var_7a4fb99, self.scriptbundlename)) {
        array::run_all(a_ents, &notsolid);
    }
    if (!isinarray(var_29942081, self.scriptbundlename)) {
        array::thread_all(a_ents, &clientfield::set, "zombie_has_eyes", 1);
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 1, eflags: 0x0
// Checksum 0x604de0f2, Offset: 0xc30
// Size: 0x134
function function_4ee0d67(a_ents) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        while (getdvarint(#"hash_51e8e64c588c30af", 0)) {
            waitframe(20);
            print3d(self.origin, function_9e72a96(self.scriptbundlename), (0, 1, 0), 1, 0.3, 20);
            foreach (ent in a_ents) {
                line(self.origin, ent.origin, (0, 1, 0), 1, 0, 20);
            }
        }
    #/
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x27e72f23, Offset: 0xd70
// Size: 0xd4
function function_34fc666e() {
    if (getgametypesetting(#"allowmapscripting") && util::isfirstround() && draft::is_draft_this_round()) {
        level endon(#"game_ended");
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        level thread scene::play(#"hash_65e09b4e3d46f3e5");
        waitframe(1);
        level thread scene::play(#"hash_36b20e793a4a1d22");
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x4d0400a0, Offset: 0xe50
// Size: 0x104
function function_489bd1e9() {
    buttons = struct::get_array("exhibit_vo_button");
    if (getgametypesetting(#"allowmapscripting")) {
        foreach (button in buttons) {
            button.mdl_gameobject.var_ee7ff721 = button.var_ee7ff721;
            button.mdl_gameobject gameobjects::set_onuse_event(&function_4967eb5a);
        }
        return;
    }
    button.mdl_gameobject gameobjects::disable_object();
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0xc97b9dd6, Offset: 0xf60
// Size: 0x16c
function function_4967eb5a(activator) {
    level endon(#"game_ended");
    self endon(#"death");
    if (!isdefined(self.var_ee7ff721)) {
        return;
    }
    switch (self.var_ee7ff721) {
    case #"asylum":
        value = 1;
        break;
    case #"moon":
        value = 2;
        break;
    case #"titanic":
        value = 3;
        break;
    case #"tranzit":
        value = 4;
        break;
    default:
        value = 0;
        break;
    }
    self gameobjects::disable_object(1);
    self clientfield::set("exhibit_vo", value);
    wait(60);
    if (isdefined(self)) {
        self gameobjects::enable_object(1);
        self clientfield::set("exhibit_vo", 0);
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x1e0322ea, Offset: 0x10d8
// Size: 0xc4
function function_35fa13e8(a_ents) {
    fakeactor = a_ents[#"fakeactor 1"];
    if (isdefined(fakeactor)) {
        level endon(#"game_ended");
        fakeactor setcandamage(1);
        info = undefined;
        info = fakeactor waittill(#"damage", #"death");
        self util::delay(1, undefined, &scene::stop);
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x5e9bb426, Offset: 0x11a8
// Size: 0x6c
function function_208c2a11() {
    var_ffcbc13a = struct::get("lobby_vo_spot");
    var_ffcbc13a util::delay(randomfloatrange(5, 8), undefined, &function_ac341c2c);
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x8825bdc, Offset: 0x1220
// Size: 0xd8
function function_ac341c2c() {
    level endon(#"game_ended");
    speaker = util::spawn_model(#"tag_origin", self.origin, self.angles);
    while (isdefined(speaker)) {
        speaker playsoundwithnotify("vox_muse_lobby_pa", "pa_done");
        speaker waittill(#"pa_done", #"death");
        wait(randomfloatrange(60, 120));
    }
}

