// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using script_2f1f2c10d854244;

#namespace localheal;

// Namespace localheal/localheal
// Params 0, eflags: 0x2
// Checksum 0xf6257d98, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"localheal", &init_shared, undefined, undefined);
}

// Namespace localheal/localheal
// Params 1, eflags: 0x1 linked
// Checksum 0xc6cb8b20, Offset: 0x130
// Size: 0x8c
function init_shared(localclientnum) {
    clientfield::register("clientuimodel", "hudItems.localHealActive", 1, 1, "int", undefined, 0, 0);
    clientfield::register("allplayers", "tak_5_heal", 1, 1, "counter", &function_981ad238, 0, 0);
}

// Namespace localheal/localheal
// Params 7, eflags: 0x0
// Checksum 0xd2a802c0, Offset: 0x1c8
// Size: 0x20a
function function_eefb5c87(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    ent = getentbynum(localclientnum, newval);
    if (newval != oldval || isdefined(ent) && !(isdefined(ent.var_4dffc910) && ent.var_4dffc910)) {
        robname = #"hash_aa2ba3bf66e25d2";
        oldent = getentbynum(localclientnum, oldval);
        if (isdefined(oldent) && isdefined(oldent.var_4dffc910) && oldent.var_4dffc910) {
            oldent function_577be059(0);
            oldent stoprenderoverridebundle(robname);
            oldent.var_4dffc910 = undefined;
        }
        entnum = self getentitynumber();
        if (newval != entnum) {
            if (isdefined(ent) && !(isdefined(ent.var_4dffc910) && ent.var_4dffc910)) {
                ent function_577be059(1);
                ent playrenderoverridebundle(robname);
                ent function_78233d29(robname, "", "Alpha", 1);
                ent.var_4dffc910 = 1;
            }
        }
    }
}

// Namespace localheal/localheal
// Params 7, eflags: 0x1 linked
// Checksum 0x1a3e3fa9, Offset: 0x3e0
// Size: 0x7c
function function_981ad238(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval != oldval) {
        if (self function_21c0fa55()) {
            postfx::playpostfxbundle(#"hash_2ac1d3d8a26022e1");
        }
    }
}

