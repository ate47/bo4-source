#using scripts\core_common\system_shared;
#using scripts\core_common\struct;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;

#namespace userspawnselection;

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x2
// Checksum 0x6a25b83d, Offset: 0x198
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"userspawnselection", &__init__, undefined, undefined);
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xf1a83948, Offset: 0x1e0
// Size: 0x84
function __init__() {
    level.next_spawngroup_index = 0;
    level.spawngroups = [];
    level.useteamspecificforwardspawns = getgametypesetting(#"forwardspawnteamspecificspawns");
    callback::on_finalize_initialization(&setupspawngroups);
    setupuimodels();
    setupclientfields();
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x4
// Checksum 0x7db20e46, Offset: 0x270
// Size: 0x20
function private getdatamodelprefix(id) {
    return "spawngroupStatus." + id + ".";
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x126c3471, Offset: 0x298
// Size: 0x1ac
function setupclientfields() {
    for (index = 0; index < 20; index++) {
        basename = getdatamodelprefix(index);
        clientfield::register("worlduimodel", basename + "visStatus", 1, 1, "int", undefined, 0, 1);
        clientfield::register("worlduimodel", basename + "useStatus", 1, 1, "int", undefined, 0, 1);
        clientfield::register("worlduimodel", basename + "team", 1, 2, "int", undefined, 0, 1);
    }
    clientfield::register("clientuimodel", "hudItems.showSpawnSelect", 1, 1, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.killcamActive", 1, 1, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "hideautospawnoption", 1, 1, "int", undefined, 0, 0);
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xdac280d, Offset: 0x450
// Size: 0x136
function setupuimodels() {
    for (index = 0; index < 20; index++) {
        spawngroupprefix = getdatamodelprefix(index);
        createuimodel(getglobaluimodel(), spawngroupprefix + "regionName");
        createuimodel(getglobaluimodel(), spawngroupprefix + "origin.x");
        createuimodel(getglobaluimodel(), spawngroupprefix + "origin.y");
        createuimodel(getglobaluimodel(), spawngroupprefix + "origin.z");
        createuimodel(getglobaluimodel(), spawngroupprefix + "team");
    }
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x4
// Checksum 0xd24364f6, Offset: 0x590
// Size: 0x22c
function private setupstaticmodelfieldsforspawngroup(spawngroup) {
    basename = getdatamodelprefix(spawngroup.uiindex);
    namemodel = getuimodel(getglobaluimodel(), basename + "regionName");
    spawngroupname = "";
    if (isdefined(spawngroup.ui_label)) {
        spawngroupname = spawngroup.ui_label;
    }
    setuimodelvalue(namemodel, spawngroupname);
    teammodel = getuimodel(getglobaluimodel(), basename + "team");
    setuimodelvalue(teammodel, spawngroup.script_team);
    xmodel = getuimodel(getglobaluimodel(), basename + "origin.x");
    setuimodelvalue(xmodel, spawngroup.origin[0]);
    ymodel = getuimodel(getglobaluimodel(), basename + "origin.y");
    setuimodelvalue(ymodel, spawngroup.origin[1]);
    zmodel = getuimodel(getglobaluimodel(), basename + "origin.z");
    setuimodelvalue(zmodel, spawngroup.origin[2]);
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x7c2944fa, Offset: 0x7c8
// Size: 0x12c
function function_bc7ec9a1(spawngroup) {
    spawns = struct::get_array(spawngroup.target, "groupname");
    var_164af2a6 = 0;
    var_98dd92c = 0;
    var_fbc43d99 = 0;
    var_4f210458 = 0;
    foreach (spawn in spawns) {
        var_164af2a6 += spawn.origin.x;
        var_98dd92c += spawn.origin.y;
        var_fbc43d99 += spawn.origin.z;
    }
    return var_98dd92c;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0xbe0c6a6e, Offset: 0x900
// Size: 0x7c
function setupspawngroup(spawngroup) {
    spawngroup.uiindex = level.next_spawngroup_index;
    level.next_spawngroup_index++;
    level.spawngroups[spawngroup.uiindex] = spawngroup;
    function_bc7ec9a1(spawngroup);
    setupstaticmodelfieldsforspawngroup(spawngroup);
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x76fb5b83, Offset: 0x988
// Size: 0xd8
function setupspawngroups(localclientnum) {
    spawngroups = struct::get_array("spawn_group_marker", "targetname");
    if (!isdefined(spawngroups)) {
        return;
    }
    spawngroupssorted = array::get_all_closest((0, 0, 0), spawngroups);
    foreach (spawngroup in spawngroupssorted) {
        setupspawngroup(spawngroup);
    }
}

