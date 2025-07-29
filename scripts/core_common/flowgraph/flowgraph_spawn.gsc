#namespace flowgraph_spawn;

// Namespace flowgraph_spawn/flowgraph_spawn
// Params 6
// Checksum 0x2f1bad38, Offset: 0x68
// Size: 0x7a
function spawnentityfromspawner( x, sp_spawner, str_targetname, b_force_spawn, b_make_room, b_infinite_spawn )
{
    e_spawned = sp_spawner spawnfromspawner( str_targetname, b_force_spawn, b_make_room, b_infinite_spawn );
    return array( isdefined( e_spawned ), e_spawned );
}

