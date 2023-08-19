// Atian COD Tools GSC decompiler test
#include scripts/core_common/scene_objects_shared.gsc;

#namespace scene;

// Namespace scene
// Method(s) 7 Total 104
class cscenevehicle : csceneobject {

    // Namespace cscenevehicle/scene_vehicle_shared
    // Params 0, eflags: 0x89 linked class_linked
    // Checksum 0xa2e431a0, Offset: 0x498
    // Size: 0x14
    __constructor() {
        csceneobject::__constructor();
    }

    // Namespace cscenevehicle/scene_vehicle_shared
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0xea4dc4d0, Offset: 0x4b8
    // Size: 0x14
    __destructor() {
        csceneobject::__destructor();
    }

    // Namespace cscenevehicle/scene_vehicle_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8bf76591, Offset: 0x398
    // Size: 0xf4
    function function_d09b043() {
        self notify(#"hash_3451c0bca5c1ca69");
        self endon(#"hash_3451c0bca5c1ca69");
        self._o_scene endon(#"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_3168dab591a18b9b");
        s_waitresult = undefined;
        s_waitresult = self._e waittill(#"death");
        self.var_1f97724a = 1;
        self._e notify(#"hash_6e7fd8207fd988c6", {#str_scene:self._o_scene._str_name});
        csceneobject::function_1e19d813();
    }

    // Namespace cscenevehicle/scene_vehicle_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x80f724d1, Offset: 0x388
    // Size: 0x4
    function _cleanup() {
        
    }

    // Namespace cscenevehicle/scene_vehicle_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xdacda5ce, Offset: 0x368
    // Size: 0x14
    function _prepare() {
        csceneobject::set_objective();
    }

    // Namespace cscenevehicle/scene_vehicle_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2de968bf, Offset: 0x220
    // Size: 0x13c
    function _set_values(ent = self._e) {
        if (!csceneobject::error(!isvehicle(ent) && ent.classname !== "script_model", "entity is not actually a Vehicle or script_model, but set to Vehicle in scene. Check the GDT to make sure the proper object type is set")) {
            scene::prepare_generic_model_anim(ent);
        }
        csceneobject::set_ent_val("takedamage", isdefined(self._s.takedamage) && self._s.takedamage, ent);
        csceneobject::set_ent_val("ignoreme", !(isdefined(self._s.attackme) && self._s.attackme), ent);
        csceneobject::set_ent_val("allowdeath", isdefined(self._s.allowdeath) && self._s.allowdeath, ent);
    }

    // Namespace cscenevehicle/scene_vehicle_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x7c6b206a, Offset: 0x168
    // Size: 0xac
    function _spawn_ent() {
        if (isdefined(self._s.model)) {
            if (isassetloaded("vehicle", self._s.model)) {
                self._e = spawnvehicle(self._s.model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53());
                scene::prepare_generic_model_anim(self._e);
            }
        }
    }

}

