#namespace flowgraph_sound;

// Namespace flowgraph_sound/flowgraph_sound
// Params 3
// Checksum 0x8a6c7a8b, Offset: 0x68
// Size: 0x38, Type: bool
function playsoundaliasatposition( x, snd_name, v_position )
{
    playsoundatposition( snd_name, v_position );
    return true;
}

