#using scripts\core_common\system_shared;

#namespace wz_ignore_systems;

// Namespace wz_ignore_systems/wz_ignore_systems
// Params 0, eflags: 0x2
// Checksum 0x6c6d7792, Offset: 0x70
// Size: 0x104
function autoexec ignore_systems() {
    system::ignore(#"recon_car");
    system::ignore(#"planemortar");
    system::ignore(#"supplydrop");
    system::ignore(#"ultimate_turret");
    system::ignore(#"armor_station");
    system::ignore(#"counteruav");
    system::ignore(#"uav");
    system::ignore(#"supplypod");
}

