#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\flagsys_shared;

#namespace animation;

/#

    // Namespace animation/animation_debug_shared
    // Params 0, eflags: 0x2
    // Checksum 0x617e7723, Offset: 0x80
    // Size: 0x24e, Type: dev
    function autoexec function_c3c9d0e5()
    {
        setdvar( #"anim_debug", 0 );
        setdvar( #"anim_debug_pause", 0 );
        
        while ( true )
        {
            b_anim_debug = getdvarint( #"anim_debug", 0 ) || getdvarint( #"anim_debug_pause", 0 );
            
            if ( b_anim_debug && !level flagsys::get( "<dev string:x38>" ) )
            {
                level flagsys::set( "<dev string:x38>" );
                a_ents = getentarray( "<dev string:x45>", "<dev string:x4e>", 1 );
                
                foreach ( ent in a_ents )
                {
                    ent thread anim_info_render_thread( ent.var_6c4bb19.animation, ent.var_6c4bb19.v_origin_or_ent, ent.var_6c4bb19.v_angles_or_tag, ent.var_6c4bb19.var_f4b34dc1 );
                }
            }
            else if ( !b_anim_debug && level flagsys::get( "<dev string:x38>" ) )
            {
                level notify( #"kill_anim_debug" );
                level flagsys::clear( "<dev string:x38>" );
            }
            
            waitframe( 1 );
        }
    }

    // Namespace animation/animation_debug_shared
    // Params 1
    // Checksum 0x6228d1b, Offset: 0x2d8
    // Size: 0x3e, Type: dev
    function is_anim_debugging( ent )
    {
        return isdefined( ent ) && ent flagsys::get( #"scriptedanim" );
    }

    // Namespace animation/animation_debug_shared
    // Params 4
    // Checksum 0x9250e442, Offset: 0x320
    // Size: 0xaae, Type: dev
    function anim_info_render_thread( animation, v_origin_or_ent, v_angles_or_tag, var_f4b34dc1 )
    {
        self notify( #"_anim_info_render_thread_" );
        self endon( #"_anim_info_render_thread_", #"death", #"scriptedanim" );
        level endon( #"kill_anim_debug" );
        
        if ( !isdefined( v_origin_or_ent ) )
        {
            v_origin_or_ent = self.origin;
        }
        
        if ( !isvec( v_origin_or_ent ) )
        {
            v_origin_or_ent endon( #"death" );
        }
        
        if ( !isdefined( level.debug_ents_by_origin ) )
        {
            level.debug_ents_by_origin = [];
        }
        
        str_origin = "<dev string:x67>" + floor( self.origin[ 0 ] / 10 ) * 10 + "<dev string:x6a>" + floor( self.origin[ 1 ] / 10 ) * 10 + "<dev string:x6a>" + floor( self.origin[ 2 ] / 10 ) * 10;
        
        if ( !isdefined( level.debug_ents_by_origin[ str_origin ] ) )
        {
            level.debug_ents_by_origin[ str_origin ] = [];
        }
        
        array::filter( level.debug_ents_by_origin[ str_origin ], 0, &is_anim_debugging );
        array::add( level.debug_ents_by_origin[ str_origin ], self, 0 );
        n_same_origin_index = array::find( level.debug_ents_by_origin[ str_origin ], self );
        recordent( self );
        
        while ( true )
        {
            _init_frame();
            str_extra_info = "<dev string:x67>";
            color = ( 1, 1, 0 );
            
            if ( flagsys::get( #"firstframe" ) )
            {
                str_extra_info += "<dev string:x6e>";
            }
            
            var_13edeb1f = getanimframecount( animation );
            var_7b160393 = self getanimtime( animation ) * var_13edeb1f;
            var_958054e5 = getanimlength( animation );
            var_f667af2f = self getanimtime( animation ) * var_958054e5;
            str_extra_info += "<dev string:x7e>" + var_f667af2f + "<dev string:x8c>" + var_958054e5 + "<dev string:x90>" + var_7b160393 + "<dev string:x8c>" + var_13edeb1f + "<dev string:xa3>";
            
            if ( isarray( var_f4b34dc1 ) && var_f4b34dc1.size )
            {
                var_1c56a327 = "<dev string:x67>";
                
                foreach ( var_21c1ba1, str_anim in var_f4b34dc1 )
                {
                    var_1c56a327 += "<dev string:xa7>" + var_21c1ba1 + "<dev string:xb1>" + str_anim;
                }
            }
            
            s_pos = _get_align_pos( v_origin_or_ent, v_angles_or_tag );
            self anim_origin_render( s_pos.origin, s_pos.angles, undefined, undefined, !true );
            
            if ( true )
            {
                line( self.origin, s_pos.origin, color, 0.5, 1 );
                sphere( s_pos.origin, 2, ( 0.3, 0.3, 0.3 ), 0.5, 1 );
            }
            
            recordline( self.origin, s_pos.origin, color, "<dev string:xc4>" );
            recordsphere( s_pos.origin, 2, ( 0.3, 0.3, 0.3 ), "<dev string:xc4>" );
            
            if ( !isvec( v_origin_or_ent ) && v_origin_or_ent != self && v_origin_or_ent != level )
            {
                str_name = "<dev string:xd3>";
                
                if ( isdefined( v_origin_or_ent.animname ) )
                {
                    str_name = v_origin_or_ent.animname;
                }
                else if ( isdefined( v_origin_or_ent.targetname ) )
                {
                    str_name = v_origin_or_ent.targetname;
                }
                
                if ( true )
                {
                    print3d( v_origin_or_ent.origin + ( 0, 0, 5 ), str_name, ( 0.3, 0.3, 0.3 ), 1, 0.15 );
                }
                
                record3dtext( str_name, v_origin_or_ent.origin + ( 0, 0, 5 ), ( 0.3, 0.3, 0.3 ), "<dev string:xc4>" );
            }
            
            self anim_origin_render( self.origin, self.angles, undefined, undefined, !true );
            str_name = "<dev string:xd3>";
            
            if ( isdefined( self.anim_debug_name ) )
            {
                str_name = self.anim_debug_name;
            }
            else if ( isdefined( self.animname ) )
            {
                str_name = self.animname;
            }
            else if ( isdefined( self.targetname ) )
            {
                str_name = self.targetname;
            }
            
            maso_they_don_t_see_us_ye_ = self.origin - ( 0, 0, 15 * n_same_origin_index );
            
            if ( true )
            {
                print3d( maso_they_don_t_see_us_ye_, self getentnum() + get_ent_type() + "<dev string:xdd>" + str_name, color, 0.8, 0.3 );
                print3d( maso_they_don_t_see_us_ye_ - ( 0, 0, 5 ), "<dev string:xe8>" + ( isanimlooping( animation ) ? "<dev string:xef>" : "<dev string:xf9>" ) + function_9e72a96( animation ), color, 0.8, 0.3 );
                print3d( maso_they_don_t_see_us_ye_ - ( 0, 0, 11 ), str_extra_info, color, 0.8, 0.3 );
                
                if ( isdefined( var_1c56a327 ) )
                {
                    print3d( maso_they_don_t_see_us_ye_ - ( 0, 0, 13 ), var_1c56a327, color, 0.8, 0.15 );
                }
            }
            
            record3dtext( self getentnum() + get_ent_type() + "<dev string:xfe>" + str_name, maso_they_don_t_see_us_ye_, color, "<dev string:xc4>" );
            record3dtext( "<dev string:x107>" + animation, maso_they_don_t_see_us_ye_ - ( 0, 0, 5 ), color, "<dev string:xc4>" );
            record3dtext( str_extra_info, maso_they_don_t_see_us_ye_ - ( 0, 0, 7 ), color, "<dev string:xc4>" );
            render_tag( "<dev string:x114>", "<dev string:x127>", !true );
            render_tag( "<dev string:x12f>", "<dev string:x141>", !true );
            render_tag( "<dev string:x148>", "<dev string:x155>", !true );
            render_tag( "<dev string:x15e>", "<dev string:x16b>", !true );
            render_tag( "<dev string:x174>", "<dev string:x180>", !true );
            render_tag( "<dev string:x188>", "<dev string:x192>", !true );
            _reset_frame();
            waitframe( 1 );
        }
    }

    // Namespace animation/animation_debug_shared
    // Params 0
    // Checksum 0x3559bf7d, Offset: 0xdd8
    // Size: 0x6e, Type: dev
    function get_ent_type()
    {
        if ( isactor( self ) )
        {
            return "<dev string:x198>";
        }
        
        if ( isvehicle( self ) )
        {
            return "<dev string:x19f>";
        }
        
        return "<dev string:x1ab>" + self.classname + "<dev string:x1af>";
    }

    // Namespace animation/animation_debug_shared
    // Params 0
    // Checksum 0x334431b5, Offset: 0xe50
    // Size: 0x22, Type: dev
    function _init_frame()
    {
        self.v_centroid = self getcentroid();
    }

    // Namespace animation/animation_debug_shared
    // Params 0
    // Checksum 0x11688a71, Offset: 0xe80
    // Size: 0x12, Type: dev
    function _reset_frame()
    {
        self.v_centroid = undefined;
    }

    // Namespace animation/animation_debug_shared
    // Params 3
    // Checksum 0x29d07873, Offset: 0xea0
    // Size: 0x13c, Type: dev
    function render_tag( str_tag, str_label, b_recorder_only )
    {
        if ( !isdefined( str_label ) )
        {
            str_label = str_tag;
        }
        
        if ( !isdefined( self.v_centroid ) )
        {
            self.v_centroid = self getcentroid();
        }
        
        v_tag_org = self gettagorigin( str_tag );
        
        if ( isdefined( v_tag_org ) )
        {
            v_tag_ang = self gettagangles( str_tag );
            anim_origin_render( v_tag_org, v_tag_ang, 2, str_label, b_recorder_only );
            
            if ( !b_recorder_only )
            {
                line( self.v_centroid, v_tag_org, ( 0.3, 0.3, 0.3 ), 0.5, 1 );
            }
            
            recordline( self.v_centroid, v_tag_org, ( 0.3, 0.3, 0.3 ), "<dev string:xc4>" );
        }
    }

    // Namespace animation/animation_debug_shared
    // Params 5
    // Checksum 0x5e60fd08, Offset: 0xfe8
    // Size: 0x244, Type: dev
    function anim_origin_render( org, angles, line_length, str_label, b_recorder_only )
    {
        if ( !isdefined( line_length ) )
        {
            line_length = 6;
        }
        
        if ( isdefined( org ) && isdefined( angles ) )
        {
            originendpoint = org + vectorscale( anglestoforward( angles ), line_length );
            originrightpoint = org + vectorscale( anglestoright( angles ), -1 * line_length );
            originuppoint = org + vectorscale( anglestoup( angles ), line_length );
            
            if ( !b_recorder_only )
            {
                line( org, originendpoint, ( 1, 0, 0 ) );
                line( org, originrightpoint, ( 0, 1, 0 ) );
                line( org, originuppoint, ( 0, 0, 1 ) );
            }
            
            recordline( org, originendpoint, ( 1, 0, 0 ), "<dev string:xc4>" );
            recordline( org, originrightpoint, ( 0, 1, 0 ), "<dev string:xc4>" );
            recordline( org, originuppoint, ( 0, 0, 1 ), "<dev string:xc4>" );
            
            if ( isdefined( str_label ) )
            {
                if ( !b_recorder_only )
                {
                    print3d( org, str_label, ( 1, 0.752941, 0.796078 ), 1, 0.05 );
                }
                
                record3dtext( str_label, org, ( 1, 0.752941, 0.796078 ), "<dev string:xc4>" );
            }
        }
    }

#/
