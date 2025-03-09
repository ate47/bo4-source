// hash_1632585dbdb5d250
// metatable "hash_14f01c93e50e6112"

version 35 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 6 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x20
        uint xp;
        // offset 0x20, size 0x20
        uint contractid;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 135
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        ar_an94_t8, // 0xd,
        gadget_supplypod, // 0xe,
        ar_damage_t8, // 0xf,
        sig_buckler_dw, // 0x10,
        gadget_vision_pulse, // 0x11,
        special_crossbow_t8, // 0x12,
        eq_arm_blade, // 0x13,
        gadget_heat_wave, // 0x14,
        melee_cutlass_t8, // 0x15,
        eq_localheal, // 0x16,
        eq_sensor, // 0x17,
        tr_damageburst_t8, // 0x18,
        pistol_fullauto_t8, // 0x19,
        remote_missile, // 0x1a,
        melee_amuletfist_t8, // 0x1b,
        willy_pete, // 0x1c,
        eq_emp_grenade, // 0x1d,
        ar_accurate_t8, // 0x1e,
        sig_lmg, // 0x1f,
        frag_grenade, // 0x20,
        knife_loadout, // 0x21,
        feature_default_class_5, // 0x22,
        feature_default_class_4, // 0x23,
        feature_default_class_6, // 0x24,
        smg_vmp_t8, // 0x25,
        eq_swat_grenade, // 0x26,
        swat_team, // 0x27,
        hatchet, // 0x28,
        supplydrop_marker, // 0x29,
        mute_smoke, // 0x2a,
        smg_minigun_t8, // 0x2b,
        smg_capacity_t8, // 0x2c,
        pistol_standard_t8, // 0x2d,
        null_offhand_secondary, // 0x2e,
        gadget_health_regen, // 0x2f,
        hash_31be8125c7d0f273, // 0x30,
        drone_squadron, // 0x31,
        sniper_damagesemi_t8, // 0x32,
        null_offhand_primary, // 0x33,
        pistol_revolver_t8, // 0x34,
        sniper_powerbolt_t8, // 0x35,
        overwatch_helicopter, // 0x36,
        eq_grapple, // 0x37,
        gadget_jammer, // 0x38,
        hash_3ab58e40011df941, // 0x39,
        launcher_standard_t8, // 0x3a,
        ar_galil_t8, // 0x3b,
        sig_bow_quickshot, // 0x3c,
        sig_blade, // 0x3d,
        pistol_burst_t8, // 0x3e,
        ar_fastfire_t8, // 0x3f,
        hero_pineapplegun, // 0x40,
        sniper_quickscope_t8, // 0x41,
        ability_dog, // 0x42,
        melee_stopsign_t8, // 0x43,
        straferun, // 0x44,
        eq_smoke, // 0x45,
        lmg_heavy_t8, // 0x46,
        eq_seeker_mine, // 0x47,
        recon_car, // 0x48,
        eq_gravityslam, // 0x49,
        feature_custom_class_6, // 0x4a,
        feature_custom_class_5, // 0x4b,
        feature_custom_class_4, // 0x4c,
        special_crossbow_t8_sas, // 0x4d,
        uav, // 0x4e,
        eq_concertina_wire, // 0x4f,
        gadget_spawnbeacon, // 0x50,
        ac130, // 0x51,
        ar_stealth_t8, // 0x52,
        helicopter_comlink, // 0x53,
        gadget_armor, // 0x54,
        feature_cac, // 0x55,
        shotgun_pump_t8, // 0x56,
        gadget_health_boost, // 0x57,
        bare_hands, // 0x58,
        lmg_stealth_t8, // 0x59,
        trophy_system, // 0x5a,
        sniper_mini14_t8, // 0x5b,
        eq_cluster_semtex_grenade, // 0x5c,
        tr_longburst_t8, // 0x5d,
        smg_standard_t8, // 0x5e,
        eq_slow_grenade, // 0x5f,
        smg_folding_t8, // 0x60,
        lmg_spray_t8, // 0x61,
        smg_accurate_t8, // 0x62,
        shotgun_precision_t8, // 0x63,
        ar_modular_t8, // 0x64,
        ar_doublebarrel_t8, // 0x65,
        smg_fastburst_t8, // 0x66,
        eq_molotov, // 0x67,
        melee_slaybell_t8, // 0x68,
        smg_fastfire_t8, // 0x69,
        ai_tank_marker, // 0x6a,
        lmg_standard_t8, // 0x6b,
        gadget_cleanse, // 0x6c,
        melee_demohammer_t8, // 0x6d,
        sniper_locus_t8, // 0x6e,
        hero_annihilator_oic, // 0x6f,
        hero_flamethrower, // 0x70,
        sniper_fastrechamber_t8, // 0x71,
        melee_actionfigure_t8, // 0x72,
        special_ballisticknife_t8_dw, // 0x73,
        hero_annihilator, // 0x74,
        ar_peacekeeper_t8, // 0x75,
        planemortar, // 0x76,
        tr_powersemi_t8, // 0x77,
        shotgun_semiauto_t8, // 0x78,
        gadget_radiation_field, // 0x79,
        ar_standard_t8, // 0x7a,
        weapon_null, // 0x7b,
        default_specialist_equipment, // 0x7c,
        hash_7932008294f0d876, // 0x7d,
        smg_handling_t8, // 0x7e,
        shotgun_fullauto_t8, // 0x7f,
        hash_7ab3f9a730359659, // 0x80,
        tr_flechette_t8, // 0x81,
        melee_secretsanta_t8, // 0x82,
        gadget_icepick, // 0x83,
        melee_coinbag_t8, // 0x84,
        gadget_camo, // 0x85,
        melee_zombiearm_t8, // 0x86
    };

    // idx 2 members 59
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_an94_t8, // 0x3,
        ar_damage_t8, // 0x4,
        special_crossbow_t8, // 0x5,
        melee_cutlass_t8, // 0x6,
        tr_damageburst_t8, // 0x7,
        pistol_fullauto_t8, // 0x8,
        melee_amuletfist_t8, // 0x9,
        ar_accurate_t8, // 0xa,
        knife_loadout, // 0xb,
        smg_vmp_t8, // 0xc,
        smg_minigun_t8, // 0xd,
        smg_capacity_t8, // 0xe,
        pistol_standard_t8, // 0xf,
        sniper_damagesemi_t8, // 0x10,
        pistol_revolver_t8, // 0x11,
        sniper_powerbolt_t8, // 0x12,
        launcher_standard_t8, // 0x13,
        ar_galil_t8, // 0x14,
        pistol_burst_t8, // 0x15,
        ar_fastfire_t8, // 0x16,
        sniper_quickscope_t8, // 0x17,
        melee_stopsign_t8, // 0x18,
        lmg_heavy_t8, // 0x19,
        special_crossbow_t8_sas, // 0x1a,
        ar_stealth_t8, // 0x1b,
        shotgun_pump_t8, // 0x1c,
        lmg_stealth_t8, // 0x1d,
        sniper_mini14_t8, // 0x1e,
        tr_longburst_t8, // 0x1f,
        smg_standard_t8, // 0x20,
        smg_folding_t8, // 0x21,
        lmg_spray_t8, // 0x22,
        smg_accurate_t8, // 0x23,
        shotgun_precision_t8, // 0x24,
        ar_modular_t8, // 0x25,
        ar_doublebarrel_t8, // 0x26,
        smg_fastburst_t8, // 0x27,
        melee_slaybell_t8, // 0x28,
        smg_fastfire_t8, // 0x29,
        lmg_standard_t8, // 0x2a,
        melee_demohammer_t8, // 0x2b,
        sniper_locus_t8, // 0x2c,
        hero_annihilator_oic, // 0x2d,
        sniper_fastrechamber_t8, // 0x2e,
        melee_actionfigure_t8, // 0x2f,
        special_ballisticknife_t8_dw, // 0x30,
        ar_peacekeeper_t8, // 0x31,
        tr_powersemi_t8, // 0x32,
        shotgun_semiauto_t8, // 0x33,
        ar_standard_t8, // 0x34,
        smg_handling_t8, // 0x35,
        shotgun_fullauto_t8, // 0x36,
        tr_flechette_t8, // 0x37,
        melee_secretsanta_t8, // 0x38,
        melee_coinbag_t8, // 0x39,
        melee_zombiearm_t8, // 0x3a
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 11 size 0xf80
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x140
    string(40) hash_3ddb4b48b795bd91;
    // offset 0x818, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0xb30, size 0x8
    byte bo_pass_tier_boost;
    // offset 0xb38, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0xb40, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0xb48, size 0x3b0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xef8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xf38, size 0x8
    byte tier_boost;
    // offset 0xf40, size 0x3b
    bool hash_4473319d8a8d9dcf[hash_4b8d95aacf149fb9];
    // offset 0xf7b, size 0x5
    uint:1 __pad[5];
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_357511b13d992253"

version 34 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 6 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x20
        uint xp;
        // offset 0x20, size 0x20
        uint contractid;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 133
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        ar_an94_t8, // 0xd,
        gadget_supplypod, // 0xe,
        ar_damage_t8, // 0xf,
        sig_buckler_dw, // 0x10,
        gadget_vision_pulse, // 0x11,
        special_crossbow_t8, // 0x12,
        eq_arm_blade, // 0x13,
        gadget_heat_wave, // 0x14,
        melee_cutlass_t8, // 0x15,
        eq_localheal, // 0x16,
        eq_sensor, // 0x17,
        tr_damageburst_t8, // 0x18,
        pistol_fullauto_t8, // 0x19,
        remote_missile, // 0x1a,
        willy_pete, // 0x1b,
        eq_emp_grenade, // 0x1c,
        ar_accurate_t8, // 0x1d,
        sig_lmg, // 0x1e,
        frag_grenade, // 0x1f,
        knife_loadout, // 0x20,
        feature_default_class_5, // 0x21,
        feature_default_class_4, // 0x22,
        feature_default_class_6, // 0x23,
        smg_vmp_t8, // 0x24,
        eq_swat_grenade, // 0x25,
        swat_team, // 0x26,
        hatchet, // 0x27,
        supplydrop_marker, // 0x28,
        mute_smoke, // 0x29,
        smg_minigun_t8, // 0x2a,
        smg_capacity_t8, // 0x2b,
        pistol_standard_t8, // 0x2c,
        null_offhand_secondary, // 0x2d,
        gadget_health_regen, // 0x2e,
        hash_31be8125c7d0f273, // 0x2f,
        drone_squadron, // 0x30,
        sniper_damagesemi_t8, // 0x31,
        null_offhand_primary, // 0x32,
        pistol_revolver_t8, // 0x33,
        sniper_powerbolt_t8, // 0x34,
        overwatch_helicopter, // 0x35,
        eq_grapple, // 0x36,
        gadget_jammer, // 0x37,
        hash_3ab58e40011df941, // 0x38,
        launcher_standard_t8, // 0x39,
        ar_galil_t8, // 0x3a,
        sig_bow_quickshot, // 0x3b,
        sig_blade, // 0x3c,
        pistol_burst_t8, // 0x3d,
        ar_fastfire_t8, // 0x3e,
        hero_pineapplegun, // 0x3f,
        sniper_quickscope_t8, // 0x40,
        ability_dog, // 0x41,
        melee_stopsign_t8, // 0x42,
        straferun, // 0x43,
        eq_smoke, // 0x44,
        lmg_heavy_t8, // 0x45,
        eq_seeker_mine, // 0x46,
        recon_car, // 0x47,
        eq_gravityslam, // 0x48,
        feature_custom_class_6, // 0x49,
        feature_custom_class_5, // 0x4a,
        feature_custom_class_4, // 0x4b,
        special_crossbow_t8_sas, // 0x4c,
        uav, // 0x4d,
        eq_concertina_wire, // 0x4e,
        gadget_spawnbeacon, // 0x4f,
        ac130, // 0x50,
        ar_stealth_t8, // 0x51,
        helicopter_comlink, // 0x52,
        gadget_armor, // 0x53,
        feature_cac, // 0x54,
        shotgun_pump_t8, // 0x55,
        gadget_health_boost, // 0x56,
        bare_hands, // 0x57,
        lmg_stealth_t8, // 0x58,
        trophy_system, // 0x59,
        sniper_mini14_t8, // 0x5a,
        eq_cluster_semtex_grenade, // 0x5b,
        tr_longburst_t8, // 0x5c,
        smg_standard_t8, // 0x5d,
        eq_slow_grenade, // 0x5e,
        smg_folding_t8, // 0x5f,
        lmg_spray_t8, // 0x60,
        smg_accurate_t8, // 0x61,
        shotgun_precision_t8, // 0x62,
        ar_modular_t8, // 0x63,
        ar_doublebarrel_t8, // 0x64,
        smg_fastburst_t8, // 0x65,
        eq_molotov, // 0x66,
        melee_slaybell_t8, // 0x67,
        smg_fastfire_t8, // 0x68,
        ai_tank_marker, // 0x69,
        lmg_standard_t8, // 0x6a,
        gadget_cleanse, // 0x6b,
        melee_demohammer_t8, // 0x6c,
        sniper_locus_t8, // 0x6d,
        hero_annihilator_oic, // 0x6e,
        hero_flamethrower, // 0x6f,
        sniper_fastrechamber_t8, // 0x70,
        special_ballisticknife_t8_dw, // 0x71,
        hero_annihilator, // 0x72,
        ar_peacekeeper_t8, // 0x73,
        planemortar, // 0x74,
        tr_powersemi_t8, // 0x75,
        shotgun_semiauto_t8, // 0x76,
        gadget_radiation_field, // 0x77,
        ar_standard_t8, // 0x78,
        weapon_null, // 0x79,
        default_specialist_equipment, // 0x7a,
        hash_7932008294f0d876, // 0x7b,
        smg_handling_t8, // 0x7c,
        shotgun_fullauto_t8, // 0x7d,
        hash_7ab3f9a730359659, // 0x7e,
        tr_flechette_t8, // 0x7f,
        melee_secretsanta_t8, // 0x80,
        gadget_icepick, // 0x81,
        melee_coinbag_t8, // 0x82,
        gadget_camo, // 0x83,
        melee_zombiearm_t8, // 0x84
    };

    // idx 2 members 57
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_an94_t8, // 0x3,
        ar_damage_t8, // 0x4,
        special_crossbow_t8, // 0x5,
        melee_cutlass_t8, // 0x6,
        tr_damageburst_t8, // 0x7,
        pistol_fullauto_t8, // 0x8,
        ar_accurate_t8, // 0x9,
        knife_loadout, // 0xa,
        smg_vmp_t8, // 0xb,
        smg_minigun_t8, // 0xc,
        smg_capacity_t8, // 0xd,
        pistol_standard_t8, // 0xe,
        sniper_damagesemi_t8, // 0xf,
        pistol_revolver_t8, // 0x10,
        sniper_powerbolt_t8, // 0x11,
        launcher_standard_t8, // 0x12,
        ar_galil_t8, // 0x13,
        pistol_burst_t8, // 0x14,
        ar_fastfire_t8, // 0x15,
        sniper_quickscope_t8, // 0x16,
        melee_stopsign_t8, // 0x17,
        lmg_heavy_t8, // 0x18,
        special_crossbow_t8_sas, // 0x19,
        ar_stealth_t8, // 0x1a,
        shotgun_pump_t8, // 0x1b,
        lmg_stealth_t8, // 0x1c,
        sniper_mini14_t8, // 0x1d,
        tr_longburst_t8, // 0x1e,
        smg_standard_t8, // 0x1f,
        smg_folding_t8, // 0x20,
        lmg_spray_t8, // 0x21,
        smg_accurate_t8, // 0x22,
        shotgun_precision_t8, // 0x23,
        ar_modular_t8, // 0x24,
        ar_doublebarrel_t8, // 0x25,
        smg_fastburst_t8, // 0x26,
        melee_slaybell_t8, // 0x27,
        smg_fastfire_t8, // 0x28,
        lmg_standard_t8, // 0x29,
        melee_demohammer_t8, // 0x2a,
        sniper_locus_t8, // 0x2b,
        hero_annihilator_oic, // 0x2c,
        sniper_fastrechamber_t8, // 0x2d,
        special_ballisticknife_t8_dw, // 0x2e,
        ar_peacekeeper_t8, // 0x2f,
        tr_powersemi_t8, // 0x30,
        shotgun_semiauto_t8, // 0x31,
        ar_standard_t8, // 0x32,
        smg_handling_t8, // 0x33,
        shotgun_fullauto_t8, // 0x34,
        tr_flechette_t8, // 0x35,
        melee_secretsanta_t8, // 0x36,
        melee_coinbag_t8, // 0x37,
        melee_zombiearm_t8, // 0x38
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 11 size 0xf60
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x140
    string(40) hash_3ddb4b48b795bd91;
    // offset 0x818, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0xb30, size 0x8
    byte bo_pass_tier_boost;
    // offset 0xb38, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0xb40, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0xb48, size 0x390
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xed8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xf18, size 0x8
    byte tier_boost;
    // offset 0xf20, size 0x39
    bool hash_4473319d8a8d9dcf[hash_4b8d95aacf149fb9];
    // offset 0xf59, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_543c58d5d63f4fb6"

version 33 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 6 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x20
        uint xp;
        // offset 0x20, size 0x20
        uint contractid;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 132
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        ar_an94_t8, // 0xd,
        gadget_supplypod, // 0xe,
        ar_damage_t8, // 0xf,
        sig_buckler_dw, // 0x10,
        gadget_vision_pulse, // 0x11,
        special_crossbow_t8, // 0x12,
        eq_arm_blade, // 0x13,
        gadget_heat_wave, // 0x14,
        melee_cutlass_t8, // 0x15,
        eq_localheal, // 0x16,
        eq_sensor, // 0x17,
        tr_damageburst_t8, // 0x18,
        pistol_fullauto_t8, // 0x19,
        remote_missile, // 0x1a,
        willy_pete, // 0x1b,
        eq_emp_grenade, // 0x1c,
        ar_accurate_t8, // 0x1d,
        sig_lmg, // 0x1e,
        frag_grenade, // 0x1f,
        knife_loadout, // 0x20,
        feature_default_class_5, // 0x21,
        feature_default_class_4, // 0x22,
        feature_default_class_6, // 0x23,
        smg_vmp_t8, // 0x24,
        eq_swat_grenade, // 0x25,
        swat_team, // 0x26,
        hatchet, // 0x27,
        supplydrop_marker, // 0x28,
        mute_smoke, // 0x29,
        smg_minigun_t8, // 0x2a,
        smg_capacity_t8, // 0x2b,
        pistol_standard_t8, // 0x2c,
        null_offhand_secondary, // 0x2d,
        gadget_health_regen, // 0x2e,
        hash_31be8125c7d0f273, // 0x2f,
        drone_squadron, // 0x30,
        sniper_damagesemi_t8, // 0x31,
        null_offhand_primary, // 0x32,
        pistol_revolver_t8, // 0x33,
        sniper_powerbolt_t8, // 0x34,
        overwatch_helicopter, // 0x35,
        eq_grapple, // 0x36,
        gadget_jammer, // 0x37,
        hash_3ab58e40011df941, // 0x38,
        launcher_standard_t8, // 0x39,
        ar_galil_t8, // 0x3a,
        sig_bow_quickshot, // 0x3b,
        sig_blade, // 0x3c,
        pistol_burst_t8, // 0x3d,
        ar_fastfire_t8, // 0x3e,
        hero_pineapplegun, // 0x3f,
        sniper_quickscope_t8, // 0x40,
        ability_dog, // 0x41,
        melee_stopsign_t8, // 0x42,
        straferun, // 0x43,
        eq_smoke, // 0x44,
        lmg_heavy_t8, // 0x45,
        eq_seeker_mine, // 0x46,
        recon_car, // 0x47,
        eq_gravityslam, // 0x48,
        feature_custom_class_6, // 0x49,
        feature_custom_class_5, // 0x4a,
        feature_custom_class_4, // 0x4b,
        special_crossbow_t8_sas, // 0x4c,
        uav, // 0x4d,
        eq_concertina_wire, // 0x4e,
        gadget_spawnbeacon, // 0x4f,
        ac130, // 0x50,
        ar_stealth_t8, // 0x51,
        helicopter_comlink, // 0x52,
        gadget_armor, // 0x53,
        feature_cac, // 0x54,
        shotgun_pump_t8, // 0x55,
        gadget_health_boost, // 0x56,
        bare_hands, // 0x57,
        lmg_stealth_t8, // 0x58,
        trophy_system, // 0x59,
        sniper_mini14_t8, // 0x5a,
        eq_cluster_semtex_grenade, // 0x5b,
        tr_longburst_t8, // 0x5c,
        smg_standard_t8, // 0x5d,
        eq_slow_grenade, // 0x5e,
        smg_folding_t8, // 0x5f,
        lmg_spray_t8, // 0x60,
        smg_accurate_t8, // 0x61,
        shotgun_precision_t8, // 0x62,
        ar_modular_t8, // 0x63,
        smg_fastburst_t8, // 0x64,
        eq_molotov, // 0x65,
        melee_slaybell_t8, // 0x66,
        smg_fastfire_t8, // 0x67,
        ai_tank_marker, // 0x68,
        lmg_standard_t8, // 0x69,
        gadget_cleanse, // 0x6a,
        melee_demohammer_t8, // 0x6b,
        sniper_locus_t8, // 0x6c,
        hero_annihilator_oic, // 0x6d,
        hero_flamethrower, // 0x6e,
        sniper_fastrechamber_t8, // 0x6f,
        special_ballisticknife_t8_dw, // 0x70,
        hero_annihilator, // 0x71,
        ar_peacekeeper_t8, // 0x72,
        planemortar, // 0x73,
        tr_powersemi_t8, // 0x74,
        shotgun_semiauto_t8, // 0x75,
        gadget_radiation_field, // 0x76,
        ar_standard_t8, // 0x77,
        weapon_null, // 0x78,
        default_specialist_equipment, // 0x79,
        hash_7932008294f0d876, // 0x7a,
        smg_handling_t8, // 0x7b,
        shotgun_fullauto_t8, // 0x7c,
        hash_7ab3f9a730359659, // 0x7d,
        tr_flechette_t8, // 0x7e,
        melee_secretsanta_t8, // 0x7f,
        gadget_icepick, // 0x80,
        melee_coinbag_t8, // 0x81,
        gadget_camo, // 0x82,
        melee_zombiearm_t8, // 0x83
    };

    // idx 2 members 56
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_an94_t8, // 0x3,
        ar_damage_t8, // 0x4,
        special_crossbow_t8, // 0x5,
        melee_cutlass_t8, // 0x6,
        tr_damageburst_t8, // 0x7,
        pistol_fullauto_t8, // 0x8,
        ar_accurate_t8, // 0x9,
        knife_loadout, // 0xa,
        smg_vmp_t8, // 0xb,
        smg_minigun_t8, // 0xc,
        smg_capacity_t8, // 0xd,
        pistol_standard_t8, // 0xe,
        sniper_damagesemi_t8, // 0xf,
        pistol_revolver_t8, // 0x10,
        sniper_powerbolt_t8, // 0x11,
        launcher_standard_t8, // 0x12,
        ar_galil_t8, // 0x13,
        pistol_burst_t8, // 0x14,
        ar_fastfire_t8, // 0x15,
        sniper_quickscope_t8, // 0x16,
        melee_stopsign_t8, // 0x17,
        lmg_heavy_t8, // 0x18,
        special_crossbow_t8_sas, // 0x19,
        ar_stealth_t8, // 0x1a,
        shotgun_pump_t8, // 0x1b,
        lmg_stealth_t8, // 0x1c,
        sniper_mini14_t8, // 0x1d,
        tr_longburst_t8, // 0x1e,
        smg_standard_t8, // 0x1f,
        smg_folding_t8, // 0x20,
        lmg_spray_t8, // 0x21,
        smg_accurate_t8, // 0x22,
        shotgun_precision_t8, // 0x23,
        ar_modular_t8, // 0x24,
        smg_fastburst_t8, // 0x25,
        melee_slaybell_t8, // 0x26,
        smg_fastfire_t8, // 0x27,
        lmg_standard_t8, // 0x28,
        melee_demohammer_t8, // 0x29,
        sniper_locus_t8, // 0x2a,
        hero_annihilator_oic, // 0x2b,
        sniper_fastrechamber_t8, // 0x2c,
        special_ballisticknife_t8_dw, // 0x2d,
        ar_peacekeeper_t8, // 0x2e,
        tr_powersemi_t8, // 0x2f,
        shotgun_semiauto_t8, // 0x30,
        ar_standard_t8, // 0x31,
        smg_handling_t8, // 0x32,
        shotgun_fullauto_t8, // 0x33,
        tr_flechette_t8, // 0x34,
        melee_secretsanta_t8, // 0x35,
        melee_coinbag_t8, // 0x36,
        melee_zombiearm_t8, // 0x37
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 10 size 0xf48
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x140
    string(40) hash_3ddb4b48b795bd91;
    // offset 0x818, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0xb30, size 0x8
    byte bo_pass_tier_boost;
    // offset 0xb38, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0xb40, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0xb48, size 0x380
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xec8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xf08, size 0x8
    byte tier_boost;
    // offset 0xf10, size 0x38
    bool hash_4473319d8a8d9dcf[hash_4b8d95aacf149fb9];
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_4e17738a65943c95"

version 32 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 6 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x20
        uint xp;
        // offset 0x20, size 0x20
        uint contractid;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 130
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        gadget_supplypod, // 0xd,
        ar_damage_t8, // 0xe,
        sig_buckler_dw, // 0xf,
        gadget_vision_pulse, // 0x10,
        special_crossbow_t8, // 0x11,
        eq_arm_blade, // 0x12,
        gadget_heat_wave, // 0x13,
        melee_cutlass_t8, // 0x14,
        eq_localheal, // 0x15,
        eq_sensor, // 0x16,
        tr_damageburst_t8, // 0x17,
        pistol_fullauto_t8, // 0x18,
        remote_missile, // 0x19,
        willy_pete, // 0x1a,
        eq_emp_grenade, // 0x1b,
        ar_accurate_t8, // 0x1c,
        sig_lmg, // 0x1d,
        frag_grenade, // 0x1e,
        knife_loadout, // 0x1f,
        feature_default_class_5, // 0x20,
        feature_default_class_4, // 0x21,
        feature_default_class_6, // 0x22,
        eq_swat_grenade, // 0x23,
        swat_team, // 0x24,
        hatchet, // 0x25,
        supplydrop_marker, // 0x26,
        mute_smoke, // 0x27,
        smg_minigun_t8, // 0x28,
        smg_capacity_t8, // 0x29,
        pistol_standard_t8, // 0x2a,
        null_offhand_secondary, // 0x2b,
        gadget_health_regen, // 0x2c,
        hash_31be8125c7d0f273, // 0x2d,
        drone_squadron, // 0x2e,
        sniper_damagesemi_t8, // 0x2f,
        null_offhand_primary, // 0x30,
        pistol_revolver_t8, // 0x31,
        sniper_powerbolt_t8, // 0x32,
        overwatch_helicopter, // 0x33,
        eq_grapple, // 0x34,
        gadget_jammer, // 0x35,
        hash_3ab58e40011df941, // 0x36,
        launcher_standard_t8, // 0x37,
        ar_galil_t8, // 0x38,
        sig_bow_quickshot, // 0x39,
        sig_blade, // 0x3a,
        pistol_burst_t8, // 0x3b,
        ar_fastfire_t8, // 0x3c,
        hero_pineapplegun, // 0x3d,
        sniper_quickscope_t8, // 0x3e,
        ability_dog, // 0x3f,
        melee_stopsign_t8, // 0x40,
        straferun, // 0x41,
        eq_smoke, // 0x42,
        lmg_heavy_t8, // 0x43,
        eq_seeker_mine, // 0x44,
        recon_car, // 0x45,
        eq_gravityslam, // 0x46,
        feature_custom_class_6, // 0x47,
        feature_custom_class_5, // 0x48,
        feature_custom_class_4, // 0x49,
        special_crossbow_t8_sas, // 0x4a,
        uav, // 0x4b,
        eq_concertina_wire, // 0x4c,
        gadget_spawnbeacon, // 0x4d,
        ac130, // 0x4e,
        ar_stealth_t8, // 0x4f,
        helicopter_comlink, // 0x50,
        gadget_armor, // 0x51,
        feature_cac, // 0x52,
        shotgun_pump_t8, // 0x53,
        gadget_health_boost, // 0x54,
        bare_hands, // 0x55,
        lmg_stealth_t8, // 0x56,
        trophy_system, // 0x57,
        sniper_mini14_t8, // 0x58,
        eq_cluster_semtex_grenade, // 0x59,
        tr_longburst_t8, // 0x5a,
        smg_standard_t8, // 0x5b,
        eq_slow_grenade, // 0x5c,
        smg_folding_t8, // 0x5d,
        lmg_spray_t8, // 0x5e,
        smg_accurate_t8, // 0x5f,
        shotgun_precision_t8, // 0x60,
        ar_modular_t8, // 0x61,
        smg_fastburst_t8, // 0x62,
        eq_molotov, // 0x63,
        melee_slaybell_t8, // 0x64,
        smg_fastfire_t8, // 0x65,
        ai_tank_marker, // 0x66,
        lmg_standard_t8, // 0x67,
        gadget_cleanse, // 0x68,
        melee_demohammer_t8, // 0x69,
        sniper_locus_t8, // 0x6a,
        hero_annihilator_oic, // 0x6b,
        hero_flamethrower, // 0x6c,
        sniper_fastrechamber_t8, // 0x6d,
        special_ballisticknife_t8_dw, // 0x6e,
        hero_annihilator, // 0x6f,
        ar_peacekeeper_t8, // 0x70,
        planemortar, // 0x71,
        tr_powersemi_t8, // 0x72,
        shotgun_semiauto_t8, // 0x73,
        gadget_radiation_field, // 0x74,
        ar_standard_t8, // 0x75,
        weapon_null, // 0x76,
        default_specialist_equipment, // 0x77,
        hash_7932008294f0d876, // 0x78,
        smg_handling_t8, // 0x79,
        shotgun_fullauto_t8, // 0x7a,
        hash_7ab3f9a730359659, // 0x7b,
        tr_flechette_t8, // 0x7c,
        melee_secretsanta_t8, // 0x7d,
        gadget_icepick, // 0x7e,
        melee_coinbag_t8, // 0x7f,
        gadget_camo, // 0x80,
        melee_zombiearm_t8, // 0x81
    };

    // idx 2 members 54
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        special_crossbow_t8, // 0x4,
        melee_cutlass_t8, // 0x5,
        tr_damageburst_t8, // 0x6,
        pistol_fullauto_t8, // 0x7,
        ar_accurate_t8, // 0x8,
        knife_loadout, // 0x9,
        smg_minigun_t8, // 0xa,
        smg_capacity_t8, // 0xb,
        pistol_standard_t8, // 0xc,
        sniper_damagesemi_t8, // 0xd,
        pistol_revolver_t8, // 0xe,
        sniper_powerbolt_t8, // 0xf,
        launcher_standard_t8, // 0x10,
        ar_galil_t8, // 0x11,
        pistol_burst_t8, // 0x12,
        ar_fastfire_t8, // 0x13,
        sniper_quickscope_t8, // 0x14,
        melee_stopsign_t8, // 0x15,
        lmg_heavy_t8, // 0x16,
        special_crossbow_t8_sas, // 0x17,
        ar_stealth_t8, // 0x18,
        shotgun_pump_t8, // 0x19,
        lmg_stealth_t8, // 0x1a,
        sniper_mini14_t8, // 0x1b,
        tr_longburst_t8, // 0x1c,
        smg_standard_t8, // 0x1d,
        smg_folding_t8, // 0x1e,
        lmg_spray_t8, // 0x1f,
        smg_accurate_t8, // 0x20,
        shotgun_precision_t8, // 0x21,
        ar_modular_t8, // 0x22,
        smg_fastburst_t8, // 0x23,
        melee_slaybell_t8, // 0x24,
        smg_fastfire_t8, // 0x25,
        lmg_standard_t8, // 0x26,
        melee_demohammer_t8, // 0x27,
        sniper_locus_t8, // 0x28,
        hero_annihilator_oic, // 0x29,
        sniper_fastrechamber_t8, // 0x2a,
        special_ballisticknife_t8_dw, // 0x2b,
        ar_peacekeeper_t8, // 0x2c,
        tr_powersemi_t8, // 0x2d,
        shotgun_semiauto_t8, // 0x2e,
        ar_standard_t8, // 0x2f,
        smg_handling_t8, // 0x30,
        shotgun_fullauto_t8, // 0x31,
        tr_flechette_t8, // 0x32,
        melee_secretsanta_t8, // 0x33,
        melee_coinbag_t8, // 0x34,
        melee_zombiearm_t8, // 0x35
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 11 size 0xf28
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x140
    string(40) hash_3ddb4b48b795bd91;
    // offset 0x818, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0xb30, size 0x8
    byte bo_pass_tier_boost;
    // offset 0xb38, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0xb40, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0xb48, size 0x360
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xea8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xee8, size 0x8
    byte tier_boost;
    // offset 0xef0, size 0x36
    bool hash_4473319d8a8d9dcf[hash_4b8d95aacf149fb9];
    // offset 0xf26, size 0x2
    uint:1 __pad[2];
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_62c88f9c57001a"

version 31 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 6 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x20
        uint xp;
        // offset 0x20, size 0x20
        uint contractid;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 130
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        gadget_supplypod, // 0xd,
        ar_damage_t8, // 0xe,
        sig_buckler_dw, // 0xf,
        gadget_vision_pulse, // 0x10,
        special_crossbow_t8, // 0x11,
        eq_arm_blade, // 0x12,
        gadget_heat_wave, // 0x13,
        melee_cutlass_t8, // 0x14,
        eq_localheal, // 0x15,
        eq_sensor, // 0x16,
        tr_damageburst_t8, // 0x17,
        pistol_fullauto_t8, // 0x18,
        remote_missile, // 0x19,
        willy_pete, // 0x1a,
        eq_emp_grenade, // 0x1b,
        ar_accurate_t8, // 0x1c,
        sig_lmg, // 0x1d,
        frag_grenade, // 0x1e,
        knife_loadout, // 0x1f,
        feature_default_class_5, // 0x20,
        feature_default_class_4, // 0x21,
        feature_default_class_6, // 0x22,
        eq_swat_grenade, // 0x23,
        swat_team, // 0x24,
        hatchet, // 0x25,
        supplydrop_marker, // 0x26,
        mute_smoke, // 0x27,
        smg_minigun_t8, // 0x28,
        smg_capacity_t8, // 0x29,
        pistol_standard_t8, // 0x2a,
        null_offhand_secondary, // 0x2b,
        gadget_health_regen, // 0x2c,
        hash_31be8125c7d0f273, // 0x2d,
        drone_squadron, // 0x2e,
        sniper_damagesemi_t8, // 0x2f,
        null_offhand_primary, // 0x30,
        pistol_revolver_t8, // 0x31,
        sniper_powerbolt_t8, // 0x32,
        overwatch_helicopter, // 0x33,
        eq_grapple, // 0x34,
        gadget_jammer, // 0x35,
        hash_3ab58e40011df941, // 0x36,
        launcher_standard_t8, // 0x37,
        ar_galil_t8, // 0x38,
        sig_bow_quickshot, // 0x39,
        sig_blade, // 0x3a,
        pistol_burst_t8, // 0x3b,
        ar_fastfire_t8, // 0x3c,
        hero_pineapplegun, // 0x3d,
        sniper_quickscope_t8, // 0x3e,
        ability_dog, // 0x3f,
        melee_stopsign_t8, // 0x40,
        straferun, // 0x41,
        eq_smoke, // 0x42,
        lmg_heavy_t8, // 0x43,
        eq_seeker_mine, // 0x44,
        recon_car, // 0x45,
        eq_gravityslam, // 0x46,
        feature_custom_class_6, // 0x47,
        feature_custom_class_5, // 0x48,
        feature_custom_class_4, // 0x49,
        special_crossbow_t8_sas, // 0x4a,
        uav, // 0x4b,
        eq_concertina_wire, // 0x4c,
        gadget_spawnbeacon, // 0x4d,
        ac130, // 0x4e,
        ar_stealth_t8, // 0x4f,
        helicopter_comlink, // 0x50,
        gadget_armor, // 0x51,
        feature_cac, // 0x52,
        shotgun_pump_t8, // 0x53,
        gadget_health_boost, // 0x54,
        bare_hands, // 0x55,
        lmg_stealth_t8, // 0x56,
        trophy_system, // 0x57,
        sniper_mini14_t8, // 0x58,
        eq_cluster_semtex_grenade, // 0x59,
        tr_longburst_t8, // 0x5a,
        smg_standard_t8, // 0x5b,
        eq_slow_grenade, // 0x5c,
        smg_folding_t8, // 0x5d,
        lmg_spray_t8, // 0x5e,
        smg_accurate_t8, // 0x5f,
        shotgun_precision_t8, // 0x60,
        ar_modular_t8, // 0x61,
        smg_fastburst_t8, // 0x62,
        eq_molotov, // 0x63,
        melee_slaybell_t8, // 0x64,
        smg_fastfire_t8, // 0x65,
        ai_tank_marker, // 0x66,
        lmg_standard_t8, // 0x67,
        gadget_cleanse, // 0x68,
        melee_demohammer_t8, // 0x69,
        sniper_locus_t8, // 0x6a,
        hero_annihilator_oic, // 0x6b,
        hero_flamethrower, // 0x6c,
        sniper_fastrechamber_t8, // 0x6d,
        special_ballisticknife_t8_dw, // 0x6e,
        hero_annihilator, // 0x6f,
        ar_peacekeeper_t8, // 0x70,
        planemortar, // 0x71,
        tr_powersemi_t8, // 0x72,
        shotgun_semiauto_t8, // 0x73,
        gadget_radiation_field, // 0x74,
        ar_standard_t8, // 0x75,
        weapon_null, // 0x76,
        default_specialist_equipment, // 0x77,
        hash_7932008294f0d876, // 0x78,
        smg_handling_t8, // 0x79,
        shotgun_fullauto_t8, // 0x7a,
        hash_7ab3f9a730359659, // 0x7b,
        tr_flechette_t8, // 0x7c,
        melee_secretsanta_t8, // 0x7d,
        gadget_icepick, // 0x7e,
        melee_coinbag_t8, // 0x7f,
        gadget_camo, // 0x80,
        melee_zombiearm_t8, // 0x81
    };

    // idx 2 members 54
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        special_crossbow_t8, // 0x4,
        melee_cutlass_t8, // 0x5,
        tr_damageburst_t8, // 0x6,
        pistol_fullauto_t8, // 0x7,
        ar_accurate_t8, // 0x8,
        knife_loadout, // 0x9,
        smg_minigun_t8, // 0xa,
        smg_capacity_t8, // 0xb,
        pistol_standard_t8, // 0xc,
        sniper_damagesemi_t8, // 0xd,
        pistol_revolver_t8, // 0xe,
        sniper_powerbolt_t8, // 0xf,
        launcher_standard_t8, // 0x10,
        ar_galil_t8, // 0x11,
        pistol_burst_t8, // 0x12,
        ar_fastfire_t8, // 0x13,
        sniper_quickscope_t8, // 0x14,
        melee_stopsign_t8, // 0x15,
        lmg_heavy_t8, // 0x16,
        special_crossbow_t8_sas, // 0x17,
        ar_stealth_t8, // 0x18,
        shotgun_pump_t8, // 0x19,
        lmg_stealth_t8, // 0x1a,
        sniper_mini14_t8, // 0x1b,
        tr_longburst_t8, // 0x1c,
        smg_standard_t8, // 0x1d,
        smg_folding_t8, // 0x1e,
        lmg_spray_t8, // 0x1f,
        smg_accurate_t8, // 0x20,
        shotgun_precision_t8, // 0x21,
        ar_modular_t8, // 0x22,
        smg_fastburst_t8, // 0x23,
        melee_slaybell_t8, // 0x24,
        smg_fastfire_t8, // 0x25,
        lmg_standard_t8, // 0x26,
        melee_demohammer_t8, // 0x27,
        sniper_locus_t8, // 0x28,
        hero_annihilator_oic, // 0x29,
        sniper_fastrechamber_t8, // 0x2a,
        special_ballisticknife_t8_dw, // 0x2b,
        ar_peacekeeper_t8, // 0x2c,
        tr_powersemi_t8, // 0x2d,
        shotgun_semiauto_t8, // 0x2e,
        ar_standard_t8, // 0x2f,
        smg_handling_t8, // 0x30,
        shotgun_fullauto_t8, // 0x31,
        tr_flechette_t8, // 0x32,
        melee_secretsanta_t8, // 0x33,
        melee_coinbag_t8, // 0x34,
        melee_zombiearm_t8, // 0x35
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 10 size 0xde8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0x9f0, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x9f8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0xa00, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0xa08, size 0x360
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xd68, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xda8, size 0x8
    byte tier_boost;
    // offset 0xdb0, size 0x36
    bool hash_4473319d8a8d9dcf[hash_4b8d95aacf149fb9];
    // offset 0xde6, size 0x2
    uint:1 __pad[2];
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_850e26d264e79a59"

version 30 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 6 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x20
        uint xp;
        // offset 0x20, size 0x20
        uint contractid;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 129
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        gadget_supplypod, // 0xd,
        ar_damage_t8, // 0xe,
        sig_buckler_dw, // 0xf,
        gadget_vision_pulse, // 0x10,
        special_crossbow_t8, // 0x11,
        eq_arm_blade, // 0x12,
        gadget_heat_wave, // 0x13,
        melee_cutlass_t8, // 0x14,
        eq_localheal, // 0x15,
        eq_sensor, // 0x16,
        tr_damageburst_t8, // 0x17,
        pistol_fullauto_t8, // 0x18,
        remote_missile, // 0x19,
        willy_pete, // 0x1a,
        eq_emp_grenade, // 0x1b,
        ar_accurate_t8, // 0x1c,
        sig_lmg, // 0x1d,
        frag_grenade, // 0x1e,
        knife_loadout, // 0x1f,
        feature_default_class_5, // 0x20,
        feature_default_class_4, // 0x21,
        feature_default_class_6, // 0x22,
        eq_swat_grenade, // 0x23,
        swat_team, // 0x24,
        hatchet, // 0x25,
        supplydrop_marker, // 0x26,
        mute_smoke, // 0x27,
        smg_minigun_t8, // 0x28,
        smg_capacity_t8, // 0x29,
        pistol_standard_t8, // 0x2a,
        null_offhand_secondary, // 0x2b,
        gadget_health_regen, // 0x2c,
        hash_31be8125c7d0f273, // 0x2d,
        drone_squadron, // 0x2e,
        sniper_damagesemi_t8, // 0x2f,
        null_offhand_primary, // 0x30,
        pistol_revolver_t8, // 0x31,
        sniper_powerbolt_t8, // 0x32,
        overwatch_helicopter, // 0x33,
        eq_grapple, // 0x34,
        gadget_jammer, // 0x35,
        hash_3ab58e40011df941, // 0x36,
        launcher_standard_t8, // 0x37,
        ar_galil_t8, // 0x38,
        sig_bow_quickshot, // 0x39,
        sig_blade, // 0x3a,
        pistol_burst_t8, // 0x3b,
        ar_fastfire_t8, // 0x3c,
        hero_pineapplegun, // 0x3d,
        sniper_quickscope_t8, // 0x3e,
        ability_dog, // 0x3f,
        melee_stopsign_t8, // 0x40,
        straferun, // 0x41,
        eq_smoke, // 0x42,
        lmg_heavy_t8, // 0x43,
        eq_seeker_mine, // 0x44,
        recon_car, // 0x45,
        eq_gravityslam, // 0x46,
        feature_custom_class_6, // 0x47,
        feature_custom_class_5, // 0x48,
        feature_custom_class_4, // 0x49,
        uav, // 0x4a,
        eq_concertina_wire, // 0x4b,
        gadget_spawnbeacon, // 0x4c,
        ac130, // 0x4d,
        ar_stealth_t8, // 0x4e,
        helicopter_comlink, // 0x4f,
        gadget_armor, // 0x50,
        feature_cac, // 0x51,
        shotgun_pump_t8, // 0x52,
        gadget_health_boost, // 0x53,
        bare_hands, // 0x54,
        lmg_stealth_t8, // 0x55,
        trophy_system, // 0x56,
        sniper_mini14_t8, // 0x57,
        eq_cluster_semtex_grenade, // 0x58,
        tr_longburst_t8, // 0x59,
        smg_standard_t8, // 0x5a,
        eq_slow_grenade, // 0x5b,
        smg_folding_t8, // 0x5c,
        lmg_spray_t8, // 0x5d,
        smg_accurate_t8, // 0x5e,
        shotgun_precision_t8, // 0x5f,
        ar_modular_t8, // 0x60,
        smg_fastburst_t8, // 0x61,
        eq_molotov, // 0x62,
        melee_slaybell_t8, // 0x63,
        smg_fastfire_t8, // 0x64,
        ai_tank_marker, // 0x65,
        lmg_standard_t8, // 0x66,
        gadget_cleanse, // 0x67,
        melee_demohammer_t8, // 0x68,
        sniper_locus_t8, // 0x69,
        hero_annihilator_oic, // 0x6a,
        hero_flamethrower, // 0x6b,
        sniper_fastrechamber_t8, // 0x6c,
        special_ballisticknife_t8_dw, // 0x6d,
        hero_annihilator, // 0x6e,
        ar_peacekeeper_t8, // 0x6f,
        planemortar, // 0x70,
        tr_powersemi_t8, // 0x71,
        shotgun_semiauto_t8, // 0x72,
        gadget_radiation_field, // 0x73,
        ar_standard_t8, // 0x74,
        weapon_null, // 0x75,
        default_specialist_equipment, // 0x76,
        hash_7932008294f0d876, // 0x77,
        smg_handling_t8, // 0x78,
        shotgun_fullauto_t8, // 0x79,
        hash_7ab3f9a730359659, // 0x7a,
        tr_flechette_t8, // 0x7b,
        melee_secretsanta_t8, // 0x7c,
        gadget_icepick, // 0x7d,
        melee_coinbag_t8, // 0x7e,
        gadget_camo, // 0x7f,
        melee_zombiearm_t8, // 0x80
    };

    // idx 2 members 53
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        special_crossbow_t8, // 0x4,
        melee_cutlass_t8, // 0x5,
        tr_damageburst_t8, // 0x6,
        pistol_fullauto_t8, // 0x7,
        ar_accurate_t8, // 0x8,
        knife_loadout, // 0x9,
        smg_minigun_t8, // 0xa,
        smg_capacity_t8, // 0xb,
        pistol_standard_t8, // 0xc,
        sniper_damagesemi_t8, // 0xd,
        pistol_revolver_t8, // 0xe,
        sniper_powerbolt_t8, // 0xf,
        launcher_standard_t8, // 0x10,
        ar_galil_t8, // 0x11,
        pistol_burst_t8, // 0x12,
        ar_fastfire_t8, // 0x13,
        sniper_quickscope_t8, // 0x14,
        melee_stopsign_t8, // 0x15,
        lmg_heavy_t8, // 0x16,
        ar_stealth_t8, // 0x17,
        shotgun_pump_t8, // 0x18,
        lmg_stealth_t8, // 0x19,
        sniper_mini14_t8, // 0x1a,
        tr_longburst_t8, // 0x1b,
        smg_standard_t8, // 0x1c,
        smg_folding_t8, // 0x1d,
        lmg_spray_t8, // 0x1e,
        smg_accurate_t8, // 0x1f,
        shotgun_precision_t8, // 0x20,
        ar_modular_t8, // 0x21,
        smg_fastburst_t8, // 0x22,
        melee_slaybell_t8, // 0x23,
        smg_fastfire_t8, // 0x24,
        lmg_standard_t8, // 0x25,
        melee_demohammer_t8, // 0x26,
        sniper_locus_t8, // 0x27,
        hero_annihilator_oic, // 0x28,
        sniper_fastrechamber_t8, // 0x29,
        special_ballisticknife_t8_dw, // 0x2a,
        ar_peacekeeper_t8, // 0x2b,
        tr_powersemi_t8, // 0x2c,
        shotgun_semiauto_t8, // 0x2d,
        ar_standard_t8, // 0x2e,
        smg_handling_t8, // 0x2f,
        shotgun_fullauto_t8, // 0x30,
        tr_flechette_t8, // 0x31,
        melee_secretsanta_t8, // 0x32,
        melee_coinbag_t8, // 0x33,
        melee_zombiearm_t8, // 0x34
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 10 size 0xdd8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0x9f0, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x9f8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0xa00, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0xa08, size 0x350
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xd58, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xd98, size 0x8
    byte tier_boost;
    // offset 0xda0, size 0x35
    bool hash_4473319d8a8d9dcf[hash_4b8d95aacf149fb9];
    // offset 0xdd5, size 0x3
    uint:1 __pad[3];
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_49d7ab7e72a5b579"

version 29 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 6 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x20
        uint xp;
        // offset 0x20, size 0x20
        uint contractid;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 129
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        gadget_supplypod, // 0xd,
        ar_damage_t8, // 0xe,
        sig_buckler_dw, // 0xf,
        gadget_vision_pulse, // 0x10,
        special_crossbow_t8, // 0x11,
        eq_arm_blade, // 0x12,
        gadget_heat_wave, // 0x13,
        melee_cutlass_t8, // 0x14,
        eq_localheal, // 0x15,
        eq_sensor, // 0x16,
        tr_damageburst_t8, // 0x17,
        pistol_fullauto_t8, // 0x18,
        remote_missile, // 0x19,
        willy_pete, // 0x1a,
        eq_emp_grenade, // 0x1b,
        ar_accurate_t8, // 0x1c,
        sig_lmg, // 0x1d,
        frag_grenade, // 0x1e,
        knife_loadout, // 0x1f,
        feature_default_class_5, // 0x20,
        feature_default_class_4, // 0x21,
        feature_default_class_6, // 0x22,
        eq_swat_grenade, // 0x23,
        swat_team, // 0x24,
        hatchet, // 0x25,
        supplydrop_marker, // 0x26,
        mute_smoke, // 0x27,
        smg_minigun_t8, // 0x28,
        smg_capacity_t8, // 0x29,
        pistol_standard_t8, // 0x2a,
        null_offhand_secondary, // 0x2b,
        gadget_health_regen, // 0x2c,
        hash_31be8125c7d0f273, // 0x2d,
        drone_squadron, // 0x2e,
        sniper_damagesemi_t8, // 0x2f,
        null_offhand_primary, // 0x30,
        pistol_revolver_t8, // 0x31,
        sniper_powerbolt_t8, // 0x32,
        overwatch_helicopter, // 0x33,
        eq_grapple, // 0x34,
        gadget_jammer, // 0x35,
        hash_3ab58e40011df941, // 0x36,
        launcher_standard_t8, // 0x37,
        ar_galil_t8, // 0x38,
        sig_bow_quickshot, // 0x39,
        sig_blade, // 0x3a,
        pistol_burst_t8, // 0x3b,
        ar_fastfire_t8, // 0x3c,
        hero_pineapplegun, // 0x3d,
        sniper_quickscope_t8, // 0x3e,
        ability_dog, // 0x3f,
        melee_stopsign_t8, // 0x40,
        straferun, // 0x41,
        eq_smoke, // 0x42,
        lmg_heavy_t8, // 0x43,
        eq_seeker_mine, // 0x44,
        recon_car, // 0x45,
        eq_gravityslam, // 0x46,
        feature_custom_class_6, // 0x47,
        feature_custom_class_5, // 0x48,
        feature_custom_class_4, // 0x49,
        uav, // 0x4a,
        eq_concertina_wire, // 0x4b,
        gadget_spawnbeacon, // 0x4c,
        ac130, // 0x4d,
        ar_stealth_t8, // 0x4e,
        helicopter_comlink, // 0x4f,
        gadget_armor, // 0x50,
        feature_cac, // 0x51,
        shotgun_pump_t8, // 0x52,
        gadget_health_boost, // 0x53,
        bare_hands, // 0x54,
        lmg_stealth_t8, // 0x55,
        trophy_system, // 0x56,
        sniper_mini14_t8, // 0x57,
        eq_cluster_semtex_grenade, // 0x58,
        tr_longburst_t8, // 0x59,
        smg_standard_t8, // 0x5a,
        eq_slow_grenade, // 0x5b,
        smg_folding_t8, // 0x5c,
        lmg_spray_t8, // 0x5d,
        smg_accurate_t8, // 0x5e,
        shotgun_precision_t8, // 0x5f,
        ar_modular_t8, // 0x60,
        smg_fastburst_t8, // 0x61,
        eq_molotov, // 0x62,
        melee_slaybell_t8, // 0x63,
        smg_fastfire_t8, // 0x64,
        ai_tank_marker, // 0x65,
        lmg_standard_t8, // 0x66,
        gadget_cleanse, // 0x67,
        melee_demohammer_t8, // 0x68,
        sniper_locus_t8, // 0x69,
        hero_annihilator_oic, // 0x6a,
        hero_flamethrower, // 0x6b,
        sniper_fastrechamber_t8, // 0x6c,
        special_ballisticknife_t8_dw, // 0x6d,
        hero_annihilator, // 0x6e,
        ar_peacekeeper_t8, // 0x6f,
        planemortar, // 0x70,
        tr_powersemi_t8, // 0x71,
        shotgun_semiauto_t8, // 0x72,
        gadget_radiation_field, // 0x73,
        ar_standard_t8, // 0x74,
        weapon_null, // 0x75,
        default_specialist_equipment, // 0x76,
        hash_7932008294f0d876, // 0x77,
        smg_handling_t8, // 0x78,
        shotgun_fullauto_t8, // 0x79,
        hash_7ab3f9a730359659, // 0x7a,
        tr_flechette_t8, // 0x7b,
        melee_secretsanta_t8, // 0x7c,
        gadget_icepick, // 0x7d,
        melee_coinbag_t8, // 0x7e,
        gadget_camo, // 0x7f,
        melee_zombiearm_t8, // 0x80
    };

    // idx 2 members 53
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        special_crossbow_t8, // 0x4,
        melee_cutlass_t8, // 0x5,
        tr_damageburst_t8, // 0x6,
        pistol_fullauto_t8, // 0x7,
        ar_accurate_t8, // 0x8,
        knife_loadout, // 0x9,
        smg_minigun_t8, // 0xa,
        smg_capacity_t8, // 0xb,
        pistol_standard_t8, // 0xc,
        sniper_damagesemi_t8, // 0xd,
        pistol_revolver_t8, // 0xe,
        sniper_powerbolt_t8, // 0xf,
        launcher_standard_t8, // 0x10,
        ar_galil_t8, // 0x11,
        pistol_burst_t8, // 0x12,
        ar_fastfire_t8, // 0x13,
        sniper_quickscope_t8, // 0x14,
        melee_stopsign_t8, // 0x15,
        lmg_heavy_t8, // 0x16,
        ar_stealth_t8, // 0x17,
        shotgun_pump_t8, // 0x18,
        lmg_stealth_t8, // 0x19,
        sniper_mini14_t8, // 0x1a,
        tr_longburst_t8, // 0x1b,
        smg_standard_t8, // 0x1c,
        smg_folding_t8, // 0x1d,
        lmg_spray_t8, // 0x1e,
        smg_accurate_t8, // 0x1f,
        shotgun_precision_t8, // 0x20,
        ar_modular_t8, // 0x21,
        smg_fastburst_t8, // 0x22,
        melee_slaybell_t8, // 0x23,
        smg_fastfire_t8, // 0x24,
        lmg_standard_t8, // 0x25,
        melee_demohammer_t8, // 0x26,
        sniper_locus_t8, // 0x27,
        hero_annihilator_oic, // 0x28,
        sniper_fastrechamber_t8, // 0x29,
        special_ballisticknife_t8_dw, // 0x2a,
        ar_peacekeeper_t8, // 0x2b,
        tr_powersemi_t8, // 0x2c,
        shotgun_semiauto_t8, // 0x2d,
        ar_standard_t8, // 0x2e,
        smg_handling_t8, // 0x2f,
        shotgun_fullauto_t8, // 0x30,
        tr_flechette_t8, // 0x31,
        melee_secretsanta_t8, // 0x32,
        melee_coinbag_t8, // 0x33,
        melee_zombiearm_t8, // 0x34
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 47
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        stock, // 0x1f,
        holdbreath, // 0x20,
        fmj2, // 0x21,
        quickdraw2, // 0x22,
        fmj, // 0x23,
        adsreload, // 0x24,
        suppressed, // 0x25,
        grip2, // 0x26,
        custom2, // 0x27,
        custom3, // 0x28,
        custom1, // 0x29,
        dualoptic, // 0x2a,
        grip, // 0x2b,
        reflex, // 0x2c,
        uber, // 0x2d,
        damage, // 0x2e
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 10 size 0xdd8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0x9f0, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x9f8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0xa00, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0xa08, size 0x350
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xd58, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xd98, size 0x8
    byte tier_boost;
    // offset 0xda0, size 0x35
    bool hash_4473319d8a8d9dcf[hash_4b8d95aacf149fb9];
    // offset 0xdd5, size 0x3
    uint:1 __pad[3];
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_149f138a224a237a"

version 28 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 5 size 0xe8
    struct lootcontracts {
        // offset 0x0, size 0x20
        uint contractid;
        // offset 0x20, size 0x8
        uint:3 contractgamemode;
        // offset 0x28, size 0x40
        xhash contracthash;
        // offset 0x68, size 0x40
        uint64 progress;
        // offset 0xa8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 129
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        gadget_supplypod, // 0xd,
        ar_damage_t8, // 0xe,
        sig_buckler_dw, // 0xf,
        gadget_vision_pulse, // 0x10,
        special_crossbow_t8, // 0x11,
        eq_arm_blade, // 0x12,
        gadget_heat_wave, // 0x13,
        melee_cutlass_t8, // 0x14,
        eq_localheal, // 0x15,
        eq_sensor, // 0x16,
        tr_damageburst_t8, // 0x17,
        pistol_fullauto_t8, // 0x18,
        remote_missile, // 0x19,
        willy_pete, // 0x1a,
        eq_emp_grenade, // 0x1b,
        ar_accurate_t8, // 0x1c,
        sig_lmg, // 0x1d,
        frag_grenade, // 0x1e,
        knife_loadout, // 0x1f,
        feature_default_class_5, // 0x20,
        feature_default_class_4, // 0x21,
        feature_default_class_6, // 0x22,
        eq_swat_grenade, // 0x23,
        swat_team, // 0x24,
        hatchet, // 0x25,
        supplydrop_marker, // 0x26,
        mute_smoke, // 0x27,
        smg_minigun_t8, // 0x28,
        smg_capacity_t8, // 0x29,
        pistol_standard_t8, // 0x2a,
        null_offhand_secondary, // 0x2b,
        gadget_health_regen, // 0x2c,
        hash_31be8125c7d0f273, // 0x2d,
        drone_squadron, // 0x2e,
        sniper_damagesemi_t8, // 0x2f,
        null_offhand_primary, // 0x30,
        pistol_revolver_t8, // 0x31,
        sniper_powerbolt_t8, // 0x32,
        overwatch_helicopter, // 0x33,
        eq_grapple, // 0x34,
        gadget_jammer, // 0x35,
        hash_3ab58e40011df941, // 0x36,
        launcher_standard_t8, // 0x37,
        ar_galil_t8, // 0x38,
        sig_bow_quickshot, // 0x39,
        sig_blade, // 0x3a,
        pistol_burst_t8, // 0x3b,
        ar_fastfire_t8, // 0x3c,
        hero_pineapplegun, // 0x3d,
        sniper_quickscope_t8, // 0x3e,
        ability_dog, // 0x3f,
        melee_stopsign_t8, // 0x40,
        straferun, // 0x41,
        eq_smoke, // 0x42,
        lmg_heavy_t8, // 0x43,
        eq_seeker_mine, // 0x44,
        recon_car, // 0x45,
        eq_gravityslam, // 0x46,
        feature_custom_class_6, // 0x47,
        feature_custom_class_5, // 0x48,
        feature_custom_class_4, // 0x49,
        uav, // 0x4a,
        eq_concertina_wire, // 0x4b,
        gadget_spawnbeacon, // 0x4c,
        ac130, // 0x4d,
        ar_stealth_t8, // 0x4e,
        helicopter_comlink, // 0x4f,
        gadget_armor, // 0x50,
        feature_cac, // 0x51,
        shotgun_pump_t8, // 0x52,
        gadget_health_boost, // 0x53,
        bare_hands, // 0x54,
        lmg_stealth_t8, // 0x55,
        trophy_system, // 0x56,
        sniper_mini14_t8, // 0x57,
        eq_cluster_semtex_grenade, // 0x58,
        tr_longburst_t8, // 0x59,
        smg_standard_t8, // 0x5a,
        eq_slow_grenade, // 0x5b,
        smg_folding_t8, // 0x5c,
        lmg_spray_t8, // 0x5d,
        smg_accurate_t8, // 0x5e,
        shotgun_precision_t8, // 0x5f,
        ar_modular_t8, // 0x60,
        smg_fastburst_t8, // 0x61,
        eq_molotov, // 0x62,
        melee_slaybell_t8, // 0x63,
        smg_fastfire_t8, // 0x64,
        ai_tank_marker, // 0x65,
        lmg_standard_t8, // 0x66,
        gadget_cleanse, // 0x67,
        melee_demohammer_t8, // 0x68,
        sniper_locus_t8, // 0x69,
        hero_annihilator_oic, // 0x6a,
        hero_flamethrower, // 0x6b,
        sniper_fastrechamber_t8, // 0x6c,
        special_ballisticknife_t8_dw, // 0x6d,
        hero_annihilator, // 0x6e,
        ar_peacekeeper_t8, // 0x6f,
        planemortar, // 0x70,
        tr_powersemi_t8, // 0x71,
        shotgun_semiauto_t8, // 0x72,
        gadget_radiation_field, // 0x73,
        ar_standard_t8, // 0x74,
        weapon_null, // 0x75,
        default_specialist_equipment, // 0x76,
        hash_7932008294f0d876, // 0x77,
        smg_handling_t8, // 0x78,
        shotgun_fullauto_t8, // 0x79,
        hash_7ab3f9a730359659, // 0x7a,
        tr_flechette_t8, // 0x7b,
        melee_secretsanta_t8, // 0x7c,
        gadget_icepick, // 0x7d,
        melee_coinbag_t8, // 0x7e,
        gadget_camo, // 0x7f,
        melee_zombiearm_t8, // 0x80
    };

    // idx 2 members 53
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        special_crossbow_t8, // 0x4,
        melee_cutlass_t8, // 0x5,
        tr_damageburst_t8, // 0x6,
        pistol_fullauto_t8, // 0x7,
        ar_accurate_t8, // 0x8,
        knife_loadout, // 0x9,
        smg_minigun_t8, // 0xa,
        smg_capacity_t8, // 0xb,
        pistol_standard_t8, // 0xc,
        sniper_damagesemi_t8, // 0xd,
        pistol_revolver_t8, // 0xe,
        sniper_powerbolt_t8, // 0xf,
        launcher_standard_t8, // 0x10,
        ar_galil_t8, // 0x11,
        pistol_burst_t8, // 0x12,
        ar_fastfire_t8, // 0x13,
        sniper_quickscope_t8, // 0x14,
        melee_stopsign_t8, // 0x15,
        lmg_heavy_t8, // 0x16,
        ar_stealth_t8, // 0x17,
        shotgun_pump_t8, // 0x18,
        lmg_stealth_t8, // 0x19,
        sniper_mini14_t8, // 0x1a,
        tr_longburst_t8, // 0x1b,
        smg_standard_t8, // 0x1c,
        smg_folding_t8, // 0x1d,
        lmg_spray_t8, // 0x1e,
        smg_accurate_t8, // 0x1f,
        shotgun_precision_t8, // 0x20,
        ar_modular_t8, // 0x21,
        smg_fastburst_t8, // 0x22,
        melee_slaybell_t8, // 0x23,
        smg_fastfire_t8, // 0x24,
        lmg_standard_t8, // 0x25,
        melee_demohammer_t8, // 0x26,
        sniper_locus_t8, // 0x27,
        hero_annihilator_oic, // 0x28,
        sniper_fastrechamber_t8, // 0x29,
        special_ballisticknife_t8_dw, // 0x2a,
        ar_peacekeeper_t8, // 0x2b,
        tr_powersemi_t8, // 0x2c,
        shotgun_semiauto_t8, // 0x2d,
        ar_standard_t8, // 0x2e,
        smg_handling_t8, // 0x2f,
        shotgun_fullauto_t8, // 0x30,
        tr_flechette_t8, // 0x31,
        melee_secretsanta_t8, // 0x32,
        melee_coinbag_t8, // 0x33,
        melee_zombiearm_t8, // 0x34
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 47
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        stock, // 0x1f,
        holdbreath, // 0x20,
        fmj2, // 0x21,
        quickdraw2, // 0x22,
        fmj, // 0x23,
        adsreload, // 0x24,
        suppressed, // 0x25,
        grip2, // 0x26,
        custom2, // 0x27,
        custom3, // 0x28,
        custom1, // 0x29,
        dualoptic, // 0x2a,
        grip, // 0x2b,
        reflex, // 0x2c,
        uber, // 0x2d,
        damage, // 0x2e
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 10 size 0xd78
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x2b8
    lootcontracts loot_contracts[3];
    // offset 0x990, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x998, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x9a0, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0x9a8, size 0x350
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xcf8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xd38, size 0x8
    byte tier_boost;
    // offset 0xd40, size 0x35
    bool hash_4473319d8a8d9dcf[hash_4b8d95aacf149fb9];
    // offset 0xd75, size 0x3
    uint:1 __pad[3];
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_add2766f90f3b27"

version 27 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 5 size 0xe8
    struct lootcontracts {
        // offset 0x0, size 0x20
        uint contractid;
        // offset 0x20, size 0x8
        uint:3 contractgamemode;
        // offset 0x28, size 0x40
        xhash contracthash;
        // offset 0x68, size 0x40
        uint64 progress;
        // offset 0xa8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 127
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        gadget_supplypod, // 0xd,
        ar_damage_t8, // 0xe,
        sig_buckler_dw, // 0xf,
        gadget_vision_pulse, // 0x10,
        eq_arm_blade, // 0x11,
        gadget_heat_wave, // 0x12,
        melee_cutlass_t8, // 0x13,
        eq_localheal, // 0x14,
        eq_sensor, // 0x15,
        tr_damageburst_t8, // 0x16,
        pistol_fullauto_t8, // 0x17,
        remote_missile, // 0x18,
        willy_pete, // 0x19,
        eq_emp_grenade, // 0x1a,
        ar_accurate_t8, // 0x1b,
        sig_lmg, // 0x1c,
        frag_grenade, // 0x1d,
        knife_loadout, // 0x1e,
        feature_default_class_5, // 0x1f,
        feature_default_class_4, // 0x20,
        feature_default_class_6, // 0x21,
        eq_swat_grenade, // 0x22,
        swat_team, // 0x23,
        hatchet, // 0x24,
        supplydrop_marker, // 0x25,
        mute_smoke, // 0x26,
        smg_capacity_t8, // 0x27,
        pistol_standard_t8, // 0x28,
        null_offhand_secondary, // 0x29,
        gadget_health_regen, // 0x2a,
        hash_31be8125c7d0f273, // 0x2b,
        drone_squadron, // 0x2c,
        sniper_damagesemi_t8, // 0x2d,
        null_offhand_primary, // 0x2e,
        pistol_revolver_t8, // 0x2f,
        sniper_powerbolt_t8, // 0x30,
        overwatch_helicopter, // 0x31,
        eq_grapple, // 0x32,
        gadget_jammer, // 0x33,
        hash_3ab58e40011df941, // 0x34,
        launcher_standard_t8, // 0x35,
        ar_galil_t8, // 0x36,
        sig_bow_quickshot, // 0x37,
        sig_blade, // 0x38,
        pistol_burst_t8, // 0x39,
        ar_fastfire_t8, // 0x3a,
        hero_pineapplegun, // 0x3b,
        sniper_quickscope_t8, // 0x3c,
        ability_dog, // 0x3d,
        melee_stopsign_t8, // 0x3e,
        straferun, // 0x3f,
        eq_smoke, // 0x40,
        lmg_heavy_t8, // 0x41,
        eq_seeker_mine, // 0x42,
        recon_car, // 0x43,
        eq_gravityslam, // 0x44,
        feature_custom_class_6, // 0x45,
        feature_custom_class_5, // 0x46,
        feature_custom_class_4, // 0x47,
        uav, // 0x48,
        eq_concertina_wire, // 0x49,
        gadget_spawnbeacon, // 0x4a,
        ac130, // 0x4b,
        ar_stealth_t8, // 0x4c,
        helicopter_comlink, // 0x4d,
        gadget_armor, // 0x4e,
        feature_cac, // 0x4f,
        shotgun_pump_t8, // 0x50,
        gadget_health_boost, // 0x51,
        bare_hands, // 0x52,
        lmg_stealth_t8, // 0x53,
        trophy_system, // 0x54,
        sniper_mini14_t8, // 0x55,
        eq_cluster_semtex_grenade, // 0x56,
        tr_longburst_t8, // 0x57,
        smg_standard_t8, // 0x58,
        eq_slow_grenade, // 0x59,
        smg_folding_t8, // 0x5a,
        lmg_spray_t8, // 0x5b,
        smg_accurate_t8, // 0x5c,
        shotgun_precision_t8, // 0x5d,
        ar_modular_t8, // 0x5e,
        smg_fastburst_t8, // 0x5f,
        eq_molotov, // 0x60,
        melee_slaybell_t8, // 0x61,
        smg_fastfire_t8, // 0x62,
        ai_tank_marker, // 0x63,
        lmg_standard_t8, // 0x64,
        gadget_cleanse, // 0x65,
        melee_demohammer_t8, // 0x66,
        sniper_locus_t8, // 0x67,
        hero_annihilator_oic, // 0x68,
        hero_flamethrower, // 0x69,
        sniper_fastrechamber_t8, // 0x6a,
        special_ballisticknife_t8_dw, // 0x6b,
        hero_annihilator, // 0x6c,
        ar_peacekeeper_t8, // 0x6d,
        planemortar, // 0x6e,
        tr_powersemi_t8, // 0x6f,
        shotgun_semiauto_t8, // 0x70,
        gadget_radiation_field, // 0x71,
        ar_standard_t8, // 0x72,
        weapon_null, // 0x73,
        default_specialist_equipment, // 0x74,
        hash_7932008294f0d876, // 0x75,
        smg_handling_t8, // 0x76,
        shotgun_fullauto_t8, // 0x77,
        hash_7ab3f9a730359659, // 0x78,
        tr_flechette_t8, // 0x79,
        melee_secretsanta_t8, // 0x7a,
        gadget_icepick, // 0x7b,
        melee_coinbag_t8, // 0x7c,
        gadget_camo, // 0x7d,
        melee_zombiearm_t8, // 0x7e
    };

    // idx 2 members 51
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        tr_damageburst_t8, // 0x5,
        pistol_fullauto_t8, // 0x6,
        ar_accurate_t8, // 0x7,
        knife_loadout, // 0x8,
        smg_capacity_t8, // 0x9,
        pistol_standard_t8, // 0xa,
        sniper_damagesemi_t8, // 0xb,
        pistol_revolver_t8, // 0xc,
        sniper_powerbolt_t8, // 0xd,
        launcher_standard_t8, // 0xe,
        ar_galil_t8, // 0xf,
        pistol_burst_t8, // 0x10,
        ar_fastfire_t8, // 0x11,
        sniper_quickscope_t8, // 0x12,
        melee_stopsign_t8, // 0x13,
        lmg_heavy_t8, // 0x14,
        ar_stealth_t8, // 0x15,
        shotgun_pump_t8, // 0x16,
        lmg_stealth_t8, // 0x17,
        sniper_mini14_t8, // 0x18,
        tr_longburst_t8, // 0x19,
        smg_standard_t8, // 0x1a,
        smg_folding_t8, // 0x1b,
        lmg_spray_t8, // 0x1c,
        smg_accurate_t8, // 0x1d,
        shotgun_precision_t8, // 0x1e,
        ar_modular_t8, // 0x1f,
        smg_fastburst_t8, // 0x20,
        melee_slaybell_t8, // 0x21,
        smg_fastfire_t8, // 0x22,
        lmg_standard_t8, // 0x23,
        melee_demohammer_t8, // 0x24,
        sniper_locus_t8, // 0x25,
        hero_annihilator_oic, // 0x26,
        sniper_fastrechamber_t8, // 0x27,
        special_ballisticknife_t8_dw, // 0x28,
        ar_peacekeeper_t8, // 0x29,
        tr_powersemi_t8, // 0x2a,
        shotgun_semiauto_t8, // 0x2b,
        ar_standard_t8, // 0x2c,
        smg_handling_t8, // 0x2d,
        shotgun_fullauto_t8, // 0x2e,
        tr_flechette_t8, // 0x2f,
        melee_secretsanta_t8, // 0x30,
        melee_coinbag_t8, // 0x31,
        melee_zombiearm_t8, // 0x32
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 10 size 0xd58
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x2b8
    lootcontracts loot_contracts[3];
    // offset 0x990, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x998, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x9a0, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0x9a8, size 0x330
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xcd8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xd18, size 0x8
    byte tier_boost;
    // offset 0xd20, size 0x33
    bool hash_4473319d8a8d9dcf[hash_4b8d95aacf149fb9];
    // offset 0xd53, size 0x5
    uint:1 __pad[5];
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_9c72ba15380486b9"

version 26 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 4 size 0xc8
    struct lootcontracts {
        // offset 0x0, size 0x8
        uint:3 contractgamemode;
        // offset 0x8, size 0x40
        xhash contracthash;
        // offset 0x48, size 0x40
        uint64 progress;
        // offset 0x88, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 127
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        gadget_supplypod, // 0xd,
        ar_damage_t8, // 0xe,
        sig_buckler_dw, // 0xf,
        gadget_vision_pulse, // 0x10,
        eq_arm_blade, // 0x11,
        gadget_heat_wave, // 0x12,
        melee_cutlass_t8, // 0x13,
        eq_localheal, // 0x14,
        eq_sensor, // 0x15,
        tr_damageburst_t8, // 0x16,
        pistol_fullauto_t8, // 0x17,
        remote_missile, // 0x18,
        willy_pete, // 0x19,
        eq_emp_grenade, // 0x1a,
        ar_accurate_t8, // 0x1b,
        sig_lmg, // 0x1c,
        frag_grenade, // 0x1d,
        knife_loadout, // 0x1e,
        feature_default_class_5, // 0x1f,
        feature_default_class_4, // 0x20,
        feature_default_class_6, // 0x21,
        eq_swat_grenade, // 0x22,
        swat_team, // 0x23,
        hatchet, // 0x24,
        supplydrop_marker, // 0x25,
        mute_smoke, // 0x26,
        smg_capacity_t8, // 0x27,
        pistol_standard_t8, // 0x28,
        null_offhand_secondary, // 0x29,
        gadget_health_regen, // 0x2a,
        hash_31be8125c7d0f273, // 0x2b,
        drone_squadron, // 0x2c,
        sniper_damagesemi_t8, // 0x2d,
        null_offhand_primary, // 0x2e,
        pistol_revolver_t8, // 0x2f,
        sniper_powerbolt_t8, // 0x30,
        overwatch_helicopter, // 0x31,
        eq_grapple, // 0x32,
        gadget_jammer, // 0x33,
        hash_3ab58e40011df941, // 0x34,
        launcher_standard_t8, // 0x35,
        ar_galil_t8, // 0x36,
        sig_bow_quickshot, // 0x37,
        sig_blade, // 0x38,
        pistol_burst_t8, // 0x39,
        ar_fastfire_t8, // 0x3a,
        hero_pineapplegun, // 0x3b,
        sniper_quickscope_t8, // 0x3c,
        ability_dog, // 0x3d,
        melee_stopsign_t8, // 0x3e,
        straferun, // 0x3f,
        eq_smoke, // 0x40,
        lmg_heavy_t8, // 0x41,
        eq_seeker_mine, // 0x42,
        recon_car, // 0x43,
        eq_gravityslam, // 0x44,
        feature_custom_class_6, // 0x45,
        feature_custom_class_5, // 0x46,
        feature_custom_class_4, // 0x47,
        uav, // 0x48,
        eq_concertina_wire, // 0x49,
        gadget_spawnbeacon, // 0x4a,
        ac130, // 0x4b,
        ar_stealth_t8, // 0x4c,
        helicopter_comlink, // 0x4d,
        gadget_armor, // 0x4e,
        feature_cac, // 0x4f,
        shotgun_pump_t8, // 0x50,
        gadget_health_boost, // 0x51,
        bare_hands, // 0x52,
        lmg_stealth_t8, // 0x53,
        trophy_system, // 0x54,
        sniper_mini14_t8, // 0x55,
        eq_cluster_semtex_grenade, // 0x56,
        tr_longburst_t8, // 0x57,
        smg_standard_t8, // 0x58,
        eq_slow_grenade, // 0x59,
        smg_folding_t8, // 0x5a,
        lmg_spray_t8, // 0x5b,
        smg_accurate_t8, // 0x5c,
        shotgun_precision_t8, // 0x5d,
        ar_modular_t8, // 0x5e,
        smg_fastburst_t8, // 0x5f,
        eq_molotov, // 0x60,
        melee_slaybell_t8, // 0x61,
        smg_fastfire_t8, // 0x62,
        ai_tank_marker, // 0x63,
        lmg_standard_t8, // 0x64,
        gadget_cleanse, // 0x65,
        melee_demohammer_t8, // 0x66,
        sniper_locus_t8, // 0x67,
        hero_annihilator_oic, // 0x68,
        hero_flamethrower, // 0x69,
        sniper_fastrechamber_t8, // 0x6a,
        special_ballisticknife_t8_dw, // 0x6b,
        hero_annihilator, // 0x6c,
        ar_peacekeeper_t8, // 0x6d,
        planemortar, // 0x6e,
        tr_powersemi_t8, // 0x6f,
        shotgun_semiauto_t8, // 0x70,
        gadget_radiation_field, // 0x71,
        ar_standard_t8, // 0x72,
        weapon_null, // 0x73,
        default_specialist_equipment, // 0x74,
        hash_7932008294f0d876, // 0x75,
        smg_handling_t8, // 0x76,
        shotgun_fullauto_t8, // 0x77,
        hash_7ab3f9a730359659, // 0x78,
        tr_flechette_t8, // 0x79,
        melee_secretsanta_t8, // 0x7a,
        gadget_icepick, // 0x7b,
        melee_coinbag_t8, // 0x7c,
        gadget_camo, // 0x7d,
        melee_zombiearm_t8, // 0x7e
    };

    // idx 2 members 51
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        tr_damageburst_t8, // 0x5,
        pistol_fullauto_t8, // 0x6,
        ar_accurate_t8, // 0x7,
        knife_loadout, // 0x8,
        smg_capacity_t8, // 0x9,
        pistol_standard_t8, // 0xa,
        sniper_damagesemi_t8, // 0xb,
        pistol_revolver_t8, // 0xc,
        sniper_powerbolt_t8, // 0xd,
        launcher_standard_t8, // 0xe,
        ar_galil_t8, // 0xf,
        pistol_burst_t8, // 0x10,
        ar_fastfire_t8, // 0x11,
        sniper_quickscope_t8, // 0x12,
        melee_stopsign_t8, // 0x13,
        lmg_heavy_t8, // 0x14,
        ar_stealth_t8, // 0x15,
        shotgun_pump_t8, // 0x16,
        lmg_stealth_t8, // 0x17,
        sniper_mini14_t8, // 0x18,
        tr_longburst_t8, // 0x19,
        smg_standard_t8, // 0x1a,
        smg_folding_t8, // 0x1b,
        lmg_spray_t8, // 0x1c,
        smg_accurate_t8, // 0x1d,
        shotgun_precision_t8, // 0x1e,
        ar_modular_t8, // 0x1f,
        smg_fastburst_t8, // 0x20,
        melee_slaybell_t8, // 0x21,
        smg_fastfire_t8, // 0x22,
        lmg_standard_t8, // 0x23,
        melee_demohammer_t8, // 0x24,
        sniper_locus_t8, // 0x25,
        hero_annihilator_oic, // 0x26,
        sniper_fastrechamber_t8, // 0x27,
        special_ballisticknife_t8_dw, // 0x28,
        ar_peacekeeper_t8, // 0x29,
        tr_powersemi_t8, // 0x2a,
        shotgun_semiauto_t8, // 0x2b,
        ar_standard_t8, // 0x2c,
        smg_handling_t8, // 0x2d,
        shotgun_fullauto_t8, // 0x2e,
        tr_flechette_t8, // 0x2f,
        melee_secretsanta_t8, // 0x30,
        melee_coinbag_t8, // 0x31,
        melee_zombiearm_t8, // 0x32
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 10 size 0xcf8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x258
    lootcontracts loot_contracts[3];
    // offset 0x930, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x938, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x940, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0x948, size 0x330
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xc78, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xcb8, size 0x8
    byte tier_boost;
    // offset 0xcc0, size 0x33
    bool hash_4473319d8a8d9dcf[hash_4b8d95aacf149fb9];
    // offset 0xcf3, size 0x5
    uint:1 __pad[5];
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_edd13a9f0eb814b9"

version 25 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 4 size 0xc8
    struct lootcontracts {
        // offset 0x0, size 0x8
        uint:3 contractgamemode;
        // offset 0x8, size 0x40
        xhash contracthash;
        // offset 0x48, size 0x40
        uint64 progress;
        // offset 0x88, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 127
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        gadget_supplypod, // 0xd,
        ar_damage_t8, // 0xe,
        sig_buckler_dw, // 0xf,
        gadget_vision_pulse, // 0x10,
        eq_arm_blade, // 0x11,
        gadget_heat_wave, // 0x12,
        melee_cutlass_t8, // 0x13,
        eq_localheal, // 0x14,
        eq_sensor, // 0x15,
        tr_damageburst_t8, // 0x16,
        pistol_fullauto_t8, // 0x17,
        remote_missile, // 0x18,
        willy_pete, // 0x19,
        eq_emp_grenade, // 0x1a,
        ar_accurate_t8, // 0x1b,
        sig_lmg, // 0x1c,
        frag_grenade, // 0x1d,
        knife_loadout, // 0x1e,
        feature_default_class_5, // 0x1f,
        feature_default_class_4, // 0x20,
        feature_default_class_6, // 0x21,
        eq_swat_grenade, // 0x22,
        swat_team, // 0x23,
        hatchet, // 0x24,
        supplydrop_marker, // 0x25,
        mute_smoke, // 0x26,
        smg_capacity_t8, // 0x27,
        pistol_standard_t8, // 0x28,
        null_offhand_secondary, // 0x29,
        gadget_health_regen, // 0x2a,
        hash_31be8125c7d0f273, // 0x2b,
        drone_squadron, // 0x2c,
        sniper_damagesemi_t8, // 0x2d,
        null_offhand_primary, // 0x2e,
        pistol_revolver_t8, // 0x2f,
        sniper_powerbolt_t8, // 0x30,
        overwatch_helicopter, // 0x31,
        eq_grapple, // 0x32,
        gadget_jammer, // 0x33,
        hash_3ab58e40011df941, // 0x34,
        launcher_standard_t8, // 0x35,
        ar_galil_t8, // 0x36,
        sig_bow_quickshot, // 0x37,
        sig_blade, // 0x38,
        pistol_burst_t8, // 0x39,
        ar_fastfire_t8, // 0x3a,
        hero_pineapplegun, // 0x3b,
        sniper_quickscope_t8, // 0x3c,
        ability_dog, // 0x3d,
        melee_stopsign_t8, // 0x3e,
        straferun, // 0x3f,
        eq_smoke, // 0x40,
        lmg_heavy_t8, // 0x41,
        eq_seeker_mine, // 0x42,
        recon_car, // 0x43,
        eq_gravityslam, // 0x44,
        feature_custom_class_6, // 0x45,
        feature_custom_class_5, // 0x46,
        feature_custom_class_4, // 0x47,
        uav, // 0x48,
        eq_concertina_wire, // 0x49,
        gadget_spawnbeacon, // 0x4a,
        ac130, // 0x4b,
        ar_stealth_t8, // 0x4c,
        helicopter_comlink, // 0x4d,
        gadget_armor, // 0x4e,
        feature_cac, // 0x4f,
        shotgun_pump_t8, // 0x50,
        gadget_health_boost, // 0x51,
        bare_hands, // 0x52,
        lmg_stealth_t8, // 0x53,
        trophy_system, // 0x54,
        sniper_mini14_t8, // 0x55,
        eq_cluster_semtex_grenade, // 0x56,
        tr_longburst_t8, // 0x57,
        smg_standard_t8, // 0x58,
        eq_slow_grenade, // 0x59,
        smg_folding_t8, // 0x5a,
        lmg_spray_t8, // 0x5b,
        smg_accurate_t8, // 0x5c,
        shotgun_precision_t8, // 0x5d,
        ar_modular_t8, // 0x5e,
        smg_fastburst_t8, // 0x5f,
        eq_molotov, // 0x60,
        melee_slaybell_t8, // 0x61,
        smg_fastfire_t8, // 0x62,
        ai_tank_marker, // 0x63,
        lmg_standard_t8, // 0x64,
        gadget_cleanse, // 0x65,
        melee_demohammer_t8, // 0x66,
        sniper_locus_t8, // 0x67,
        hero_annihilator_oic, // 0x68,
        hero_flamethrower, // 0x69,
        sniper_fastrechamber_t8, // 0x6a,
        special_ballisticknife_t8_dw, // 0x6b,
        hero_annihilator, // 0x6c,
        ar_peacekeeper_t8, // 0x6d,
        planemortar, // 0x6e,
        tr_powersemi_t8, // 0x6f,
        shotgun_semiauto_t8, // 0x70,
        gadget_radiation_field, // 0x71,
        ar_standard_t8, // 0x72,
        weapon_null, // 0x73,
        default_specialist_equipment, // 0x74,
        hash_7932008294f0d876, // 0x75,
        smg_handling_t8, // 0x76,
        shotgun_fullauto_t8, // 0x77,
        hash_7ab3f9a730359659, // 0x78,
        tr_flechette_t8, // 0x79,
        melee_secretsanta_t8, // 0x7a,
        gadget_icepick, // 0x7b,
        melee_coinbag_t8, // 0x7c,
        gadget_camo, // 0x7d,
        melee_zombiearm_t8, // 0x7e
    };

    // idx 2 members 51
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        tr_damageburst_t8, // 0x5,
        pistol_fullauto_t8, // 0x6,
        ar_accurate_t8, // 0x7,
        knife_loadout, // 0x8,
        smg_capacity_t8, // 0x9,
        pistol_standard_t8, // 0xa,
        sniper_damagesemi_t8, // 0xb,
        pistol_revolver_t8, // 0xc,
        sniper_powerbolt_t8, // 0xd,
        launcher_standard_t8, // 0xe,
        ar_galil_t8, // 0xf,
        pistol_burst_t8, // 0x10,
        ar_fastfire_t8, // 0x11,
        sniper_quickscope_t8, // 0x12,
        melee_stopsign_t8, // 0x13,
        lmg_heavy_t8, // 0x14,
        ar_stealth_t8, // 0x15,
        shotgun_pump_t8, // 0x16,
        lmg_stealth_t8, // 0x17,
        sniper_mini14_t8, // 0x18,
        tr_longburst_t8, // 0x19,
        smg_standard_t8, // 0x1a,
        smg_folding_t8, // 0x1b,
        lmg_spray_t8, // 0x1c,
        smg_accurate_t8, // 0x1d,
        shotgun_precision_t8, // 0x1e,
        ar_modular_t8, // 0x1f,
        smg_fastburst_t8, // 0x20,
        melee_slaybell_t8, // 0x21,
        smg_fastfire_t8, // 0x22,
        lmg_standard_t8, // 0x23,
        melee_demohammer_t8, // 0x24,
        sniper_locus_t8, // 0x25,
        hero_annihilator_oic, // 0x26,
        sniper_fastrechamber_t8, // 0x27,
        special_ballisticknife_t8_dw, // 0x28,
        ar_peacekeeper_t8, // 0x29,
        tr_powersemi_t8, // 0x2a,
        shotgun_semiauto_t8, // 0x2b,
        ar_standard_t8, // 0x2c,
        smg_handling_t8, // 0x2d,
        shotgun_fullauto_t8, // 0x2e,
        tr_flechette_t8, // 0x2f,
        melee_secretsanta_t8, // 0x30,
        melee_coinbag_t8, // 0x31,
        melee_zombiearm_t8, // 0x32
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 8 size 0xcc0
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x258
    lootcontracts loot_contracts[3];
    // offset 0x930, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x938, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x940, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0x948, size 0x330
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xc78, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xcb8, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_76a3ead57551e1b"

version 24 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 4 size 0xc8
    struct lootcontracts {
        // offset 0x0, size 0x8
        uint:3 contractgamemode;
        // offset 0x8, size 0x40
        xhash contracthash;
        // offset 0x48, size 0x40
        uint64 progress;
        // offset 0x88, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 126
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        gadget_supplypod, // 0xd,
        ar_damage_t8, // 0xe,
        sig_buckler_dw, // 0xf,
        gadget_vision_pulse, // 0x10,
        eq_arm_blade, // 0x11,
        gadget_heat_wave, // 0x12,
        melee_cutlass_t8, // 0x13,
        eq_localheal, // 0x14,
        eq_sensor, // 0x15,
        tr_damageburst_t8, // 0x16,
        pistol_fullauto_t8, // 0x17,
        remote_missile, // 0x18,
        willy_pete, // 0x19,
        eq_emp_grenade, // 0x1a,
        ar_accurate_t8, // 0x1b,
        frag_grenade, // 0x1c,
        knife_loadout, // 0x1d,
        feature_default_class_5, // 0x1e,
        feature_default_class_4, // 0x1f,
        feature_default_class_6, // 0x20,
        eq_swat_grenade, // 0x21,
        swat_team, // 0x22,
        hatchet, // 0x23,
        supplydrop_marker, // 0x24,
        mute_smoke, // 0x25,
        smg_capacity_t8, // 0x26,
        pistol_standard_t8, // 0x27,
        null_offhand_secondary, // 0x28,
        gadget_health_regen, // 0x29,
        hash_31be8125c7d0f273, // 0x2a,
        drone_squadron, // 0x2b,
        sniper_damagesemi_t8, // 0x2c,
        null_offhand_primary, // 0x2d,
        pistol_revolver_t8, // 0x2e,
        sniper_powerbolt_t8, // 0x2f,
        overwatch_helicopter, // 0x30,
        eq_grapple, // 0x31,
        gadget_jammer, // 0x32,
        hash_3ab58e40011df941, // 0x33,
        launcher_standard_t8, // 0x34,
        ar_galil_t8, // 0x35,
        sig_bow_quickshot, // 0x36,
        sig_blade, // 0x37,
        pistol_burst_t8, // 0x38,
        ar_fastfire_t8, // 0x39,
        hero_pineapplegun, // 0x3a,
        sniper_quickscope_t8, // 0x3b,
        ability_dog, // 0x3c,
        melee_stopsign_t8, // 0x3d,
        straferun, // 0x3e,
        eq_smoke, // 0x3f,
        lmg_heavy_t8, // 0x40,
        eq_seeker_mine, // 0x41,
        recon_car, // 0x42,
        eq_gravityslam, // 0x43,
        feature_custom_class_6, // 0x44,
        feature_custom_class_5, // 0x45,
        feature_custom_class_4, // 0x46,
        uav, // 0x47,
        eq_concertina_wire, // 0x48,
        gadget_spawnbeacon, // 0x49,
        ac130, // 0x4a,
        ar_stealth_t8, // 0x4b,
        helicopter_comlink, // 0x4c,
        gadget_armor, // 0x4d,
        feature_cac, // 0x4e,
        shotgun_pump_t8, // 0x4f,
        gadget_health_boost, // 0x50,
        bare_hands, // 0x51,
        lmg_stealth_t8, // 0x52,
        trophy_system, // 0x53,
        sniper_mini14_t8, // 0x54,
        eq_cluster_semtex_grenade, // 0x55,
        tr_longburst_t8, // 0x56,
        smg_standard_t8, // 0x57,
        eq_slow_grenade, // 0x58,
        smg_folding_t8, // 0x59,
        lmg_spray_t8, // 0x5a,
        smg_accurate_t8, // 0x5b,
        shotgun_precision_t8, // 0x5c,
        ar_modular_t8, // 0x5d,
        smg_fastburst_t8, // 0x5e,
        eq_molotov, // 0x5f,
        melee_slaybell_t8, // 0x60,
        smg_fastfire_t8, // 0x61,
        ai_tank_marker, // 0x62,
        lmg_standard_t8, // 0x63,
        gadget_cleanse, // 0x64,
        melee_demohammer_t8, // 0x65,
        sniper_locus_t8, // 0x66,
        hero_annihilator_oic, // 0x67,
        hero_flamethrower, // 0x68,
        sniper_fastrechamber_t8, // 0x69,
        special_ballisticknife_t8_dw, // 0x6a,
        hero_annihilator, // 0x6b,
        ar_peacekeeper_t8, // 0x6c,
        planemortar, // 0x6d,
        tr_powersemi_t8, // 0x6e,
        shotgun_semiauto_t8, // 0x6f,
        gadget_radiation_field, // 0x70,
        ar_standard_t8, // 0x71,
        weapon_null, // 0x72,
        default_specialist_equipment, // 0x73,
        hash_7932008294f0d876, // 0x74,
        smg_handling_t8, // 0x75,
        shotgun_fullauto_t8, // 0x76,
        hash_7ab3f9a730359659, // 0x77,
        tr_flechette_t8, // 0x78,
        melee_secretsanta_t8, // 0x79,
        gadget_icepick, // 0x7a,
        melee_coinbag_t8, // 0x7b,
        gadget_camo, // 0x7c,
        melee_zombiearm_t8, // 0x7d
    };

    // idx 2 members 51
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        tr_damageburst_t8, // 0x5,
        pistol_fullauto_t8, // 0x6,
        ar_accurate_t8, // 0x7,
        knife_loadout, // 0x8,
        smg_capacity_t8, // 0x9,
        pistol_standard_t8, // 0xa,
        sniper_damagesemi_t8, // 0xb,
        pistol_revolver_t8, // 0xc,
        sniper_powerbolt_t8, // 0xd,
        launcher_standard_t8, // 0xe,
        ar_galil_t8, // 0xf,
        pistol_burst_t8, // 0x10,
        ar_fastfire_t8, // 0x11,
        sniper_quickscope_t8, // 0x12,
        melee_stopsign_t8, // 0x13,
        lmg_heavy_t8, // 0x14,
        ar_stealth_t8, // 0x15,
        shotgun_pump_t8, // 0x16,
        lmg_stealth_t8, // 0x17,
        sniper_mini14_t8, // 0x18,
        tr_longburst_t8, // 0x19,
        smg_standard_t8, // 0x1a,
        smg_folding_t8, // 0x1b,
        lmg_spray_t8, // 0x1c,
        smg_accurate_t8, // 0x1d,
        shotgun_precision_t8, // 0x1e,
        ar_modular_t8, // 0x1f,
        smg_fastburst_t8, // 0x20,
        melee_slaybell_t8, // 0x21,
        smg_fastfire_t8, // 0x22,
        lmg_standard_t8, // 0x23,
        melee_demohammer_t8, // 0x24,
        sniper_locus_t8, // 0x25,
        hero_annihilator_oic, // 0x26,
        sniper_fastrechamber_t8, // 0x27,
        special_ballisticknife_t8_dw, // 0x28,
        ar_peacekeeper_t8, // 0x29,
        tr_powersemi_t8, // 0x2a,
        shotgun_semiauto_t8, // 0x2b,
        ar_standard_t8, // 0x2c,
        smg_handling_t8, // 0x2d,
        shotgun_fullauto_t8, // 0x2e,
        tr_flechette_t8, // 0x2f,
        melee_secretsanta_t8, // 0x30,
        melee_coinbag_t8, // 0x31,
        melee_zombiearm_t8, // 0x32
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 8 size 0xcc0
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x258
    lootcontracts loot_contracts[3];
    // offset 0x930, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x938, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x940, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0x948, size 0x330
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xc78, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xcb8, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_ea8731b8b254dab6"

version 23 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 4 size 0xc8
    struct lootcontracts {
        // offset 0x0, size 0x8
        uint:3 contractgamemode;
        // offset 0x8, size 0x40
        xhash contracthash;
        // offset 0x48, size 0x40
        uint64 progress;
        // offset 0x88, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 121
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        eq_shroud, // 0xc,
        gadget_supplypod, // 0xd,
        ar_damage_t8, // 0xe,
        sig_buckler_dw, // 0xf,
        gadget_vision_pulse, // 0x10,
        eq_arm_blade, // 0x11,
        gadget_heat_wave, // 0x12,
        melee_cutlass_t8, // 0x13,
        eq_localheal, // 0x14,
        eq_sensor, // 0x15,
        pistol_fullauto_t8, // 0x16,
        remote_missile, // 0x17,
        willy_pete, // 0x18,
        eq_emp_grenade, // 0x19,
        ar_accurate_t8, // 0x1a,
        frag_grenade, // 0x1b,
        knife_loadout, // 0x1c,
        feature_default_class_5, // 0x1d,
        feature_default_class_4, // 0x1e,
        feature_default_class_6, // 0x1f,
        eq_swat_grenade, // 0x20,
        swat_team, // 0x21,
        hatchet, // 0x22,
        supplydrop_marker, // 0x23,
        mute_smoke, // 0x24,
        smg_capacity_t8, // 0x25,
        pistol_standard_t8, // 0x26,
        null_offhand_secondary, // 0x27,
        gadget_health_regen, // 0x28,
        hash_31be8125c7d0f273, // 0x29,
        drone_squadron, // 0x2a,
        null_offhand_primary, // 0x2b,
        pistol_revolver_t8, // 0x2c,
        sniper_powerbolt_t8, // 0x2d,
        overwatch_helicopter, // 0x2e,
        eq_grapple, // 0x2f,
        gadget_jammer, // 0x30,
        hash_3ab58e40011df941, // 0x31,
        launcher_standard_t8, // 0x32,
        ar_galil_t8, // 0x33,
        sig_bow_quickshot, // 0x34,
        sig_blade, // 0x35,
        pistol_burst_t8, // 0x36,
        ar_fastfire_t8, // 0x37,
        hero_pineapplegun, // 0x38,
        sniper_quickscope_t8, // 0x39,
        ability_dog, // 0x3a,
        straferun, // 0x3b,
        eq_smoke, // 0x3c,
        lmg_heavy_t8, // 0x3d,
        eq_seeker_mine, // 0x3e,
        recon_car, // 0x3f,
        eq_gravityslam, // 0x40,
        feature_custom_class_6, // 0x41,
        feature_custom_class_5, // 0x42,
        feature_custom_class_4, // 0x43,
        uav, // 0x44,
        eq_concertina_wire, // 0x45,
        gadget_spawnbeacon, // 0x46,
        ac130, // 0x47,
        ar_stealth_t8, // 0x48,
        helicopter_comlink, // 0x49,
        gadget_armor, // 0x4a,
        feature_cac, // 0x4b,
        shotgun_pump_t8, // 0x4c,
        gadget_health_boost, // 0x4d,
        bare_hands, // 0x4e,
        lmg_stealth_t8, // 0x4f,
        trophy_system, // 0x50,
        sniper_mini14_t8, // 0x51,
        eq_cluster_semtex_grenade, // 0x52,
        tr_longburst_t8, // 0x53,
        smg_standard_t8, // 0x54,
        eq_slow_grenade, // 0x55,
        smg_folding_t8, // 0x56,
        lmg_spray_t8, // 0x57,
        smg_accurate_t8, // 0x58,
        ar_modular_t8, // 0x59,
        smg_fastburst_t8, // 0x5a,
        eq_molotov, // 0x5b,
        melee_slaybell_t8, // 0x5c,
        smg_fastfire_t8, // 0x5d,
        ai_tank_marker, // 0x5e,
        lmg_standard_t8, // 0x5f,
        gadget_cleanse, // 0x60,
        melee_demohammer_t8, // 0x61,
        sniper_locus_t8, // 0x62,
        hero_annihilator_oic, // 0x63,
        hero_flamethrower, // 0x64,
        sniper_fastrechamber_t8, // 0x65,
        special_ballisticknife_t8_dw, // 0x66,
        hero_annihilator, // 0x67,
        ar_peacekeeper_t8, // 0x68,
        planemortar, // 0x69,
        tr_powersemi_t8, // 0x6a,
        shotgun_semiauto_t8, // 0x6b,
        gadget_radiation_field, // 0x6c,
        ar_standard_t8, // 0x6d,
        weapon_null, // 0x6e,
        default_specialist_equipment, // 0x6f,
        hash_7932008294f0d876, // 0x70,
        smg_handling_t8, // 0x71,
        shotgun_fullauto_t8, // 0x72,
        hash_7ab3f9a730359659, // 0x73,
        tr_flechette_t8, // 0x74,
        melee_secretsanta_t8, // 0x75,
        gadget_icepick, // 0x76,
        melee_coinbag_t8, // 0x77,
        gadget_camo, // 0x78
    };

    // idx 2 members 46
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        ar_galil_t8, // 0xd,
        pistol_burst_t8, // 0xe,
        ar_fastfire_t8, // 0xf,
        sniper_quickscope_t8, // 0x10,
        lmg_heavy_t8, // 0x11,
        ar_stealth_t8, // 0x12,
        shotgun_pump_t8, // 0x13,
        lmg_stealth_t8, // 0x14,
        sniper_mini14_t8, // 0x15,
        tr_longburst_t8, // 0x16,
        smg_standard_t8, // 0x17,
        smg_folding_t8, // 0x18,
        lmg_spray_t8, // 0x19,
        smg_accurate_t8, // 0x1a,
        ar_modular_t8, // 0x1b,
        smg_fastburst_t8, // 0x1c,
        melee_slaybell_t8, // 0x1d,
        smg_fastfire_t8, // 0x1e,
        lmg_standard_t8, // 0x1f,
        melee_demohammer_t8, // 0x20,
        sniper_locus_t8, // 0x21,
        hero_annihilator_oic, // 0x22,
        sniper_fastrechamber_t8, // 0x23,
        special_ballisticknife_t8_dw, // 0x24,
        ar_peacekeeper_t8, // 0x25,
        tr_powersemi_t8, // 0x26,
        shotgun_semiauto_t8, // 0x27,
        ar_standard_t8, // 0x28,
        smg_handling_t8, // 0x29,
        shotgun_fullauto_t8, // 0x2a,
        tr_flechette_t8, // 0x2b,
        melee_secretsanta_t8, // 0x2c,
        melee_coinbag_t8, // 0x2d
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 8 size 0xc70
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x258
    lootcontracts loot_contracts[3];
    // offset 0x930, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x938, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x940, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0x948, size 0x2e0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xc28, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xc68, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_c6b8c98b850285ab"

version 22 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 4 size 0xc8
    struct lootcontracts {
        // offset 0x0, size 0x8
        uint:3 contractgamemode;
        // offset 0x8, size 0x40
        xhash contracthash;
        // offset 0x48, size 0x40
        uint64 progress;
        // offset 0x88, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 120
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        ar_galil_t8, // 0x32,
        sig_bow_quickshot, // 0x33,
        sig_blade, // 0x34,
        pistol_burst_t8, // 0x35,
        ar_fastfire_t8, // 0x36,
        hero_pineapplegun, // 0x37,
        sniper_quickscope_t8, // 0x38,
        ability_dog, // 0x39,
        straferun, // 0x3a,
        eq_smoke, // 0x3b,
        lmg_heavy_t8, // 0x3c,
        eq_seeker_mine, // 0x3d,
        recon_car, // 0x3e,
        eq_gravityslam, // 0x3f,
        feature_custom_class_6, // 0x40,
        feature_custom_class_5, // 0x41,
        feature_custom_class_4, // 0x42,
        uav, // 0x43,
        eq_concertina_wire, // 0x44,
        gadget_spawnbeacon, // 0x45,
        ac130, // 0x46,
        ar_stealth_t8, // 0x47,
        helicopter_comlink, // 0x48,
        gadget_armor, // 0x49,
        feature_cac, // 0x4a,
        shotgun_pump_t8, // 0x4b,
        gadget_health_boost, // 0x4c,
        bare_hands, // 0x4d,
        lmg_stealth_t8, // 0x4e,
        trophy_system, // 0x4f,
        sniper_mini14_t8, // 0x50,
        eq_cluster_semtex_grenade, // 0x51,
        tr_longburst_t8, // 0x52,
        smg_standard_t8, // 0x53,
        eq_slow_grenade, // 0x54,
        smg_folding_t8, // 0x55,
        lmg_spray_t8, // 0x56,
        smg_accurate_t8, // 0x57,
        ar_modular_t8, // 0x58,
        smg_fastburst_t8, // 0x59,
        eq_molotov, // 0x5a,
        melee_slaybell_t8, // 0x5b,
        smg_fastfire_t8, // 0x5c,
        ai_tank_marker, // 0x5d,
        lmg_standard_t8, // 0x5e,
        gadget_cleanse, // 0x5f,
        melee_demohammer_t8, // 0x60,
        sniper_locus_t8, // 0x61,
        hero_annihilator_oic, // 0x62,
        hero_flamethrower, // 0x63,
        sniper_fastrechamber_t8, // 0x64,
        special_ballisticknife_t8_dw, // 0x65,
        hero_annihilator, // 0x66,
        ar_peacekeeper_t8, // 0x67,
        planemortar, // 0x68,
        tr_powersemi_t8, // 0x69,
        shotgun_semiauto_t8, // 0x6a,
        gadget_radiation_field, // 0x6b,
        ar_standard_t8, // 0x6c,
        weapon_null, // 0x6d,
        default_specialist_equipment, // 0x6e,
        hash_7932008294f0d876, // 0x6f,
        smg_handling_t8, // 0x70,
        shotgun_fullauto_t8, // 0x71,
        hash_7ab3f9a730359659, // 0x72,
        tr_flechette_t8, // 0x73,
        melee_secretsanta_t8, // 0x74,
        gadget_icepick, // 0x75,
        melee_coinbag_t8, // 0x76,
        gadget_camo, // 0x77
    };

    // idx 2 members 46
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        ar_galil_t8, // 0xd,
        pistol_burst_t8, // 0xe,
        ar_fastfire_t8, // 0xf,
        sniper_quickscope_t8, // 0x10,
        lmg_heavy_t8, // 0x11,
        ar_stealth_t8, // 0x12,
        shotgun_pump_t8, // 0x13,
        lmg_stealth_t8, // 0x14,
        sniper_mini14_t8, // 0x15,
        tr_longburst_t8, // 0x16,
        smg_standard_t8, // 0x17,
        smg_folding_t8, // 0x18,
        lmg_spray_t8, // 0x19,
        smg_accurate_t8, // 0x1a,
        ar_modular_t8, // 0x1b,
        smg_fastburst_t8, // 0x1c,
        melee_slaybell_t8, // 0x1d,
        smg_fastfire_t8, // 0x1e,
        lmg_standard_t8, // 0x1f,
        melee_demohammer_t8, // 0x20,
        sniper_locus_t8, // 0x21,
        hero_annihilator_oic, // 0x22,
        sniper_fastrechamber_t8, // 0x23,
        special_ballisticknife_t8_dw, // 0x24,
        ar_peacekeeper_t8, // 0x25,
        tr_powersemi_t8, // 0x26,
        shotgun_semiauto_t8, // 0x27,
        ar_standard_t8, // 0x28,
        smg_handling_t8, // 0x29,
        shotgun_fullauto_t8, // 0x2a,
        tr_flechette_t8, // 0x2b,
        melee_secretsanta_t8, // 0x2c,
        melee_coinbag_t8, // 0x2d
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 8 size 0xc70
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x258
    lootcontracts loot_contracts[3];
    // offset 0x930, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x938, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x940, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0x948, size 0x2e0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xc28, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xc68, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_b7e1fccd8a280d64"

version 21 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 5 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x40
        xhash hash_6bcde715574b1e8;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 120
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        ar_galil_t8, // 0x32,
        sig_bow_quickshot, // 0x33,
        sig_blade, // 0x34,
        pistol_burst_t8, // 0x35,
        ar_fastfire_t8, // 0x36,
        hero_pineapplegun, // 0x37,
        sniper_quickscope_t8, // 0x38,
        ability_dog, // 0x39,
        straferun, // 0x3a,
        eq_smoke, // 0x3b,
        lmg_heavy_t8, // 0x3c,
        eq_seeker_mine, // 0x3d,
        recon_car, // 0x3e,
        eq_gravityslam, // 0x3f,
        feature_custom_class_6, // 0x40,
        feature_custom_class_5, // 0x41,
        feature_custom_class_4, // 0x42,
        uav, // 0x43,
        eq_concertina_wire, // 0x44,
        gadget_spawnbeacon, // 0x45,
        ac130, // 0x46,
        ar_stealth_t8, // 0x47,
        helicopter_comlink, // 0x48,
        gadget_armor, // 0x49,
        feature_cac, // 0x4a,
        shotgun_pump_t8, // 0x4b,
        gadget_health_boost, // 0x4c,
        bare_hands, // 0x4d,
        lmg_stealth_t8, // 0x4e,
        trophy_system, // 0x4f,
        sniper_mini14_t8, // 0x50,
        eq_cluster_semtex_grenade, // 0x51,
        tr_longburst_t8, // 0x52,
        smg_standard_t8, // 0x53,
        eq_slow_grenade, // 0x54,
        smg_folding_t8, // 0x55,
        lmg_spray_t8, // 0x56,
        smg_accurate_t8, // 0x57,
        ar_modular_t8, // 0x58,
        smg_fastburst_t8, // 0x59,
        eq_molotov, // 0x5a,
        melee_slaybell_t8, // 0x5b,
        smg_fastfire_t8, // 0x5c,
        ai_tank_marker, // 0x5d,
        lmg_standard_t8, // 0x5e,
        gadget_cleanse, // 0x5f,
        melee_demohammer_t8, // 0x60,
        sniper_locus_t8, // 0x61,
        hero_annihilator_oic, // 0x62,
        hero_flamethrower, // 0x63,
        sniper_fastrechamber_t8, // 0x64,
        special_ballisticknife_t8_dw, // 0x65,
        hero_annihilator, // 0x66,
        ar_peacekeeper_t8, // 0x67,
        planemortar, // 0x68,
        tr_powersemi_t8, // 0x69,
        shotgun_semiauto_t8, // 0x6a,
        gadget_radiation_field, // 0x6b,
        ar_standard_t8, // 0x6c,
        weapon_null, // 0x6d,
        default_specialist_equipment, // 0x6e,
        hash_7932008294f0d876, // 0x6f,
        smg_handling_t8, // 0x70,
        shotgun_fullauto_t8, // 0x71,
        hash_7ab3f9a730359659, // 0x72,
        tr_flechette_t8, // 0x73,
        melee_secretsanta_t8, // 0x74,
        gadget_icepick, // 0x75,
        melee_coinbag_t8, // 0x76,
        gadget_camo, // 0x77
    };

    // idx 2 members 46
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        ar_galil_t8, // 0xd,
        pistol_burst_t8, // 0xe,
        ar_fastfire_t8, // 0xf,
        sniper_quickscope_t8, // 0x10,
        lmg_heavy_t8, // 0x11,
        ar_stealth_t8, // 0x12,
        shotgun_pump_t8, // 0x13,
        lmg_stealth_t8, // 0x14,
        sniper_mini14_t8, // 0x15,
        tr_longburst_t8, // 0x16,
        smg_standard_t8, // 0x17,
        smg_folding_t8, // 0x18,
        lmg_spray_t8, // 0x19,
        smg_accurate_t8, // 0x1a,
        ar_modular_t8, // 0x1b,
        smg_fastburst_t8, // 0x1c,
        melee_slaybell_t8, // 0x1d,
        smg_fastfire_t8, // 0x1e,
        lmg_standard_t8, // 0x1f,
        melee_demohammer_t8, // 0x20,
        sniper_locus_t8, // 0x21,
        hero_annihilator_oic, // 0x22,
        sniper_fastrechamber_t8, // 0x23,
        special_ballisticknife_t8_dw, // 0x24,
        ar_peacekeeper_t8, // 0x25,
        tr_powersemi_t8, // 0x26,
        shotgun_semiauto_t8, // 0x27,
        ar_standard_t8, // 0x28,
        smg_handling_t8, // 0x29,
        shotgun_fullauto_t8, // 0x2a,
        tr_flechette_t8, // 0x2b,
        melee_secretsanta_t8, // 0x2c,
        melee_coinbag_t8, // 0x2d
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 8 size 0xd30
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0x9f0, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x9f8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0xa00, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0xa08, size 0x2e0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xce8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xd28, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_828820ea2dd53f04"

version 20 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 5 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x40
        xhash hash_6bcde715574b1e8;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 119
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        ar_galil_t8, // 0x32,
        sig_bow_quickshot, // 0x33,
        sig_blade, // 0x34,
        pistol_burst_t8, // 0x35,
        ar_fastfire_t8, // 0x36,
        hero_pineapplegun, // 0x37,
        sniper_quickscope_t8, // 0x38,
        ability_dog, // 0x39,
        straferun, // 0x3a,
        eq_smoke, // 0x3b,
        lmg_heavy_t8, // 0x3c,
        eq_seeker_mine, // 0x3d,
        recon_car, // 0x3e,
        eq_gravityslam, // 0x3f,
        feature_custom_class_6, // 0x40,
        feature_custom_class_5, // 0x41,
        feature_custom_class_4, // 0x42,
        uav, // 0x43,
        eq_concertina_wire, // 0x44,
        gadget_spawnbeacon, // 0x45,
        ac130, // 0x46,
        ar_stealth_t8, // 0x47,
        helicopter_comlink, // 0x48,
        gadget_armor, // 0x49,
        feature_cac, // 0x4a,
        shotgun_pump_t8, // 0x4b,
        gadget_health_boost, // 0x4c,
        bare_hands, // 0x4d,
        lmg_stealth_t8, // 0x4e,
        trophy_system, // 0x4f,
        sniper_mini14_t8, // 0x50,
        eq_cluster_semtex_grenade, // 0x51,
        tr_longburst_t8, // 0x52,
        smg_standard_t8, // 0x53,
        eq_slow_grenade, // 0x54,
        smg_folding_t8, // 0x55,
        lmg_spray_t8, // 0x56,
        smg_accurate_t8, // 0x57,
        ar_modular_t8, // 0x58,
        smg_fastburst_t8, // 0x59,
        eq_molotov, // 0x5a,
        melee_slaybell_t8, // 0x5b,
        smg_fastfire_t8, // 0x5c,
        ai_tank_marker, // 0x5d,
        lmg_standard_t8, // 0x5e,
        gadget_cleanse, // 0x5f,
        melee_demohammer_t8, // 0x60,
        hero_annihilator_oic, // 0x61,
        hero_flamethrower, // 0x62,
        sniper_fastrechamber_t8, // 0x63,
        special_ballisticknife_t8_dw, // 0x64,
        hero_annihilator, // 0x65,
        ar_peacekeeper_t8, // 0x66,
        planemortar, // 0x67,
        tr_powersemi_t8, // 0x68,
        shotgun_semiauto_t8, // 0x69,
        gadget_radiation_field, // 0x6a,
        ar_standard_t8, // 0x6b,
        weapon_null, // 0x6c,
        default_specialist_equipment, // 0x6d,
        hash_7932008294f0d876, // 0x6e,
        smg_handling_t8, // 0x6f,
        shotgun_fullauto_t8, // 0x70,
        hash_7ab3f9a730359659, // 0x71,
        tr_flechette_t8, // 0x72,
        melee_secretsanta_t8, // 0x73,
        gadget_icepick, // 0x74,
        melee_coinbag_t8, // 0x75,
        gadget_camo, // 0x76
    };

    // idx 2 members 45
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        ar_galil_t8, // 0xd,
        pistol_burst_t8, // 0xe,
        ar_fastfire_t8, // 0xf,
        sniper_quickscope_t8, // 0x10,
        lmg_heavy_t8, // 0x11,
        ar_stealth_t8, // 0x12,
        shotgun_pump_t8, // 0x13,
        lmg_stealth_t8, // 0x14,
        sniper_mini14_t8, // 0x15,
        tr_longburst_t8, // 0x16,
        smg_standard_t8, // 0x17,
        smg_folding_t8, // 0x18,
        lmg_spray_t8, // 0x19,
        smg_accurate_t8, // 0x1a,
        ar_modular_t8, // 0x1b,
        smg_fastburst_t8, // 0x1c,
        melee_slaybell_t8, // 0x1d,
        smg_fastfire_t8, // 0x1e,
        lmg_standard_t8, // 0x1f,
        melee_demohammer_t8, // 0x20,
        hero_annihilator_oic, // 0x21,
        sniper_fastrechamber_t8, // 0x22,
        special_ballisticknife_t8_dw, // 0x23,
        ar_peacekeeper_t8, // 0x24,
        tr_powersemi_t8, // 0x25,
        shotgun_semiauto_t8, // 0x26,
        ar_standard_t8, // 0x27,
        smg_handling_t8, // 0x28,
        shotgun_fullauto_t8, // 0x29,
        tr_flechette_t8, // 0x2a,
        melee_secretsanta_t8, // 0x2b,
        melee_coinbag_t8, // 0x2c
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 8 size 0xd20
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0x9f0, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x9f8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0xa00, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0xa08, size 0x2d0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xcd8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xd18, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_e8efafd7298ff1da"

version 19 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 5 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x40
        xhash hash_6bcde715574b1e8;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 118
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        sig_blade, // 0x33,
        pistol_burst_t8, // 0x34,
        ar_fastfire_t8, // 0x35,
        hero_pineapplegun, // 0x36,
        sniper_quickscope_t8, // 0x37,
        ability_dog, // 0x38,
        straferun, // 0x39,
        eq_smoke, // 0x3a,
        lmg_heavy_t8, // 0x3b,
        eq_seeker_mine, // 0x3c,
        recon_car, // 0x3d,
        eq_gravityslam, // 0x3e,
        feature_custom_class_6, // 0x3f,
        feature_custom_class_5, // 0x40,
        feature_custom_class_4, // 0x41,
        uav, // 0x42,
        eq_concertina_wire, // 0x43,
        gadget_spawnbeacon, // 0x44,
        ac130, // 0x45,
        ar_stealth_t8, // 0x46,
        helicopter_comlink, // 0x47,
        gadget_armor, // 0x48,
        feature_cac, // 0x49,
        shotgun_pump_t8, // 0x4a,
        gadget_health_boost, // 0x4b,
        bare_hands, // 0x4c,
        lmg_stealth_t8, // 0x4d,
        trophy_system, // 0x4e,
        sniper_mini14_t8, // 0x4f,
        eq_cluster_semtex_grenade, // 0x50,
        tr_longburst_t8, // 0x51,
        smg_standard_t8, // 0x52,
        eq_slow_grenade, // 0x53,
        smg_folding_t8, // 0x54,
        lmg_spray_t8, // 0x55,
        smg_accurate_t8, // 0x56,
        ar_modular_t8, // 0x57,
        smg_fastburst_t8, // 0x58,
        eq_molotov, // 0x59,
        melee_slaybell_t8, // 0x5a,
        smg_fastfire_t8, // 0x5b,
        ai_tank_marker, // 0x5c,
        lmg_standard_t8, // 0x5d,
        gadget_cleanse, // 0x5e,
        melee_demohammer_t8, // 0x5f,
        hero_annihilator_oic, // 0x60,
        hero_flamethrower, // 0x61,
        sniper_fastrechamber_t8, // 0x62,
        special_ballisticknife_t8_dw, // 0x63,
        hero_annihilator, // 0x64,
        ar_peacekeeper_t8, // 0x65,
        planemortar, // 0x66,
        tr_powersemi_t8, // 0x67,
        shotgun_semiauto_t8, // 0x68,
        gadget_radiation_field, // 0x69,
        ar_standard_t8, // 0x6a,
        weapon_null, // 0x6b,
        default_specialist_equipment, // 0x6c,
        hash_7932008294f0d876, // 0x6d,
        smg_handling_t8, // 0x6e,
        shotgun_fullauto_t8, // 0x6f,
        hash_7ab3f9a730359659, // 0x70,
        tr_flechette_t8, // 0x71,
        melee_secretsanta_t8, // 0x72,
        gadget_icepick, // 0x73,
        melee_coinbag_t8, // 0x74,
        gadget_camo, // 0x75
    };

    // idx 2 members 44
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        lmg_stealth_t8, // 0x13,
        sniper_mini14_t8, // 0x14,
        tr_longburst_t8, // 0x15,
        smg_standard_t8, // 0x16,
        smg_folding_t8, // 0x17,
        lmg_spray_t8, // 0x18,
        smg_accurate_t8, // 0x19,
        ar_modular_t8, // 0x1a,
        smg_fastburst_t8, // 0x1b,
        melee_slaybell_t8, // 0x1c,
        smg_fastfire_t8, // 0x1d,
        lmg_standard_t8, // 0x1e,
        melee_demohammer_t8, // 0x1f,
        hero_annihilator_oic, // 0x20,
        sniper_fastrechamber_t8, // 0x21,
        special_ballisticknife_t8_dw, // 0x22,
        ar_peacekeeper_t8, // 0x23,
        tr_powersemi_t8, // 0x24,
        shotgun_semiauto_t8, // 0x25,
        ar_standard_t8, // 0x26,
        smg_handling_t8, // 0x27,
        shotgun_fullauto_t8, // 0x28,
        tr_flechette_t8, // 0x29,
        melee_secretsanta_t8, // 0x2a,
        melee_coinbag_t8, // 0x2b
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 8 size 0xd10
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0x9f0, size 0x8
    byte bo_pass_tier_boost;
    // offset 0x9f8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0xa00, size 0x8
    byte bo_pass_party_tier_boost;
    // offset 0xa08, size 0x2c0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xcc8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xd08, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_25b6b84dbf4457a8"

version 18 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 5 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x40
        xhash hash_6bcde715574b1e8;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 118
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        sig_blade, // 0x33,
        pistol_burst_t8, // 0x34,
        ar_fastfire_t8, // 0x35,
        hero_pineapplegun, // 0x36,
        sniper_quickscope_t8, // 0x37,
        ability_dog, // 0x38,
        straferun, // 0x39,
        eq_smoke, // 0x3a,
        lmg_heavy_t8, // 0x3b,
        eq_seeker_mine, // 0x3c,
        recon_car, // 0x3d,
        eq_gravityslam, // 0x3e,
        feature_custom_class_6, // 0x3f,
        feature_custom_class_5, // 0x40,
        feature_custom_class_4, // 0x41,
        uav, // 0x42,
        eq_concertina_wire, // 0x43,
        gadget_spawnbeacon, // 0x44,
        ac130, // 0x45,
        ar_stealth_t8, // 0x46,
        helicopter_comlink, // 0x47,
        gadget_armor, // 0x48,
        feature_cac, // 0x49,
        shotgun_pump_t8, // 0x4a,
        gadget_health_boost, // 0x4b,
        bare_hands, // 0x4c,
        lmg_stealth_t8, // 0x4d,
        trophy_system, // 0x4e,
        sniper_mini14_t8, // 0x4f,
        eq_cluster_semtex_grenade, // 0x50,
        tr_longburst_t8, // 0x51,
        smg_standard_t8, // 0x52,
        eq_slow_grenade, // 0x53,
        smg_folding_t8, // 0x54,
        lmg_spray_t8, // 0x55,
        smg_accurate_t8, // 0x56,
        ar_modular_t8, // 0x57,
        smg_fastburst_t8, // 0x58,
        eq_molotov, // 0x59,
        melee_slaybell_t8, // 0x5a,
        smg_fastfire_t8, // 0x5b,
        ai_tank_marker, // 0x5c,
        lmg_standard_t8, // 0x5d,
        gadget_cleanse, // 0x5e,
        melee_demohammer_t8, // 0x5f,
        hero_annihilator_oic, // 0x60,
        hero_flamethrower, // 0x61,
        sniper_fastrechamber_t8, // 0x62,
        special_ballisticknife_t8_dw, // 0x63,
        hero_annihilator, // 0x64,
        ar_peacekeeper_t8, // 0x65,
        planemortar, // 0x66,
        tr_powersemi_t8, // 0x67,
        shotgun_semiauto_t8, // 0x68,
        gadget_radiation_field, // 0x69,
        ar_standard_t8, // 0x6a,
        weapon_null, // 0x6b,
        default_specialist_equipment, // 0x6c,
        hash_7932008294f0d876, // 0x6d,
        smg_handling_t8, // 0x6e,
        shotgun_fullauto_t8, // 0x6f,
        hash_7ab3f9a730359659, // 0x70,
        tr_flechette_t8, // 0x71,
        melee_secretsanta_t8, // 0x72,
        gadget_icepick, // 0x73,
        melee_coinbag_t8, // 0x74,
        gadget_camo, // 0x75
    };

    // idx 2 members 44
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        lmg_stealth_t8, // 0x13,
        sniper_mini14_t8, // 0x14,
        tr_longburst_t8, // 0x15,
        smg_standard_t8, // 0x16,
        smg_folding_t8, // 0x17,
        lmg_spray_t8, // 0x18,
        smg_accurate_t8, // 0x19,
        ar_modular_t8, // 0x1a,
        smg_fastburst_t8, // 0x1b,
        melee_slaybell_t8, // 0x1c,
        smg_fastfire_t8, // 0x1d,
        lmg_standard_t8, // 0x1e,
        melee_demohammer_t8, // 0x1f,
        hero_annihilator_oic, // 0x20,
        sniper_fastrechamber_t8, // 0x21,
        special_ballisticknife_t8_dw, // 0x22,
        ar_peacekeeper_t8, // 0x23,
        tr_powersemi_t8, // 0x24,
        shotgun_semiauto_t8, // 0x25,
        ar_standard_t8, // 0x26,
        smg_handling_t8, // 0x27,
        shotgun_fullauto_t8, // 0x28,
        tr_flechette_t8, // 0x29,
        melee_secretsanta_t8, // 0x2a,
        melee_coinbag_t8, // 0x2b
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 46
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom3, // 0x27,
        custom1, // 0x28,
        dualoptic, // 0x29,
        grip, // 0x2a,
        reflex, // 0x2b,
        uber, // 0x2c,
        damage, // 0x2d
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 6 size 0xd00
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0x9f0, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x9f8, size 0x2c0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xcb8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xcf8, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_3ddae8be6ea790f1"

version 17 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 5 size 0x108
    struct lootcontracts {
        // offset 0x0, size 0x40
        xhash hash_6bcde715574b1e8;
        // offset 0x40, size 0x8
        uint:3 contractgamemode;
        // offset 0x48, size 0x40
        xhash contracthash;
        // offset 0x88, size 0x40
        uint64 progress;
        // offset 0xc8, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 118
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        sig_blade, // 0x33,
        pistol_burst_t8, // 0x34,
        ar_fastfire_t8, // 0x35,
        hero_pineapplegun, // 0x36,
        sniper_quickscope_t8, // 0x37,
        ability_dog, // 0x38,
        straferun, // 0x39,
        eq_smoke, // 0x3a,
        lmg_heavy_t8, // 0x3b,
        eq_seeker_mine, // 0x3c,
        recon_car, // 0x3d,
        eq_gravityslam, // 0x3e,
        feature_custom_class_6, // 0x3f,
        feature_custom_class_5, // 0x40,
        feature_custom_class_4, // 0x41,
        uav, // 0x42,
        eq_concertina_wire, // 0x43,
        gadget_spawnbeacon, // 0x44,
        ac130, // 0x45,
        ar_stealth_t8, // 0x46,
        helicopter_comlink, // 0x47,
        gadget_armor, // 0x48,
        feature_cac, // 0x49,
        shotgun_pump_t8, // 0x4a,
        gadget_health_boost, // 0x4b,
        bare_hands, // 0x4c,
        lmg_stealth_t8, // 0x4d,
        trophy_system, // 0x4e,
        sniper_mini14_t8, // 0x4f,
        eq_cluster_semtex_grenade, // 0x50,
        tr_longburst_t8, // 0x51,
        smg_standard_t8, // 0x52,
        eq_slow_grenade, // 0x53,
        smg_folding_t8, // 0x54,
        lmg_spray_t8, // 0x55,
        smg_accurate_t8, // 0x56,
        ar_modular_t8, // 0x57,
        smg_fastburst_t8, // 0x58,
        eq_molotov, // 0x59,
        melee_slaybell_t8, // 0x5a,
        smg_fastfire_t8, // 0x5b,
        ai_tank_marker, // 0x5c,
        lmg_standard_t8, // 0x5d,
        gadget_cleanse, // 0x5e,
        melee_demohammer_t8, // 0x5f,
        hero_annihilator_oic, // 0x60,
        hero_flamethrower, // 0x61,
        sniper_fastrechamber_t8, // 0x62,
        special_ballisticknife_t8_dw, // 0x63,
        hero_annihilator, // 0x64,
        ar_peacekeeper_t8, // 0x65,
        planemortar, // 0x66,
        tr_powersemi_t8, // 0x67,
        shotgun_semiauto_t8, // 0x68,
        gadget_radiation_field, // 0x69,
        ar_standard_t8, // 0x6a,
        weapon_null, // 0x6b,
        default_specialist_equipment, // 0x6c,
        hash_7932008294f0d876, // 0x6d,
        smg_handling_t8, // 0x6e,
        shotgun_fullauto_t8, // 0x6f,
        hash_7ab3f9a730359659, // 0x70,
        tr_flechette_t8, // 0x71,
        melee_secretsanta_t8, // 0x72,
        gadget_icepick, // 0x73,
        melee_coinbag_t8, // 0x74,
        gadget_camo, // 0x75
    };

    // idx 2 members 44
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        lmg_stealth_t8, // 0x13,
        sniper_mini14_t8, // 0x14,
        tr_longburst_t8, // 0x15,
        smg_standard_t8, // 0x16,
        smg_folding_t8, // 0x17,
        lmg_spray_t8, // 0x18,
        smg_accurate_t8, // 0x19,
        ar_modular_t8, // 0x1a,
        smg_fastburst_t8, // 0x1b,
        melee_slaybell_t8, // 0x1c,
        smg_fastfire_t8, // 0x1d,
        lmg_standard_t8, // 0x1e,
        melee_demohammer_t8, // 0x1f,
        hero_annihilator_oic, // 0x20,
        sniper_fastrechamber_t8, // 0x21,
        special_ballisticknife_t8_dw, // 0x22,
        ar_peacekeeper_t8, // 0x23,
        tr_powersemi_t8, // 0x24,
        shotgun_semiauto_t8, // 0x25,
        ar_standard_t8, // 0x26,
        smg_handling_t8, // 0x27,
        shotgun_fullauto_t8, // 0x28,
        tr_flechette_t8, // 0x29,
        melee_secretsanta_t8, // 0x2a,
        melee_coinbag_t8, // 0x2b
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 45
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom3, // 0x26,
        custom1, // 0x27,
        dualoptic, // 0x28,
        grip, // 0x29,
        reflex, // 0x2a,
        uber, // 0x2b,
        damage, // 0x2c
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 6 size 0xd00
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x318
    lootcontracts loot_contracts[3];
    // offset 0x9f0, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x9f8, size 0x2c0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xcb8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xcf8, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_6345ac820af38fd6"

version 16 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 15 members 4 size 0xc8
    struct lootcontracts {
        // offset 0x0, size 0x8
        uint:3 contractgamemode;
        // offset 0x8, size 0x40
        xhash contracthash;
        // offset 0x48, size 0x40
        uint64 progress;
        // offset 0x88, size 0x40
        uint64 target;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 118
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        sig_blade, // 0x33,
        pistol_burst_t8, // 0x34,
        ar_fastfire_t8, // 0x35,
        hero_pineapplegun, // 0x36,
        sniper_quickscope_t8, // 0x37,
        ability_dog, // 0x38,
        straferun, // 0x39,
        eq_smoke, // 0x3a,
        lmg_heavy_t8, // 0x3b,
        eq_seeker_mine, // 0x3c,
        recon_car, // 0x3d,
        eq_gravityslam, // 0x3e,
        feature_custom_class_6, // 0x3f,
        feature_custom_class_5, // 0x40,
        feature_custom_class_4, // 0x41,
        uav, // 0x42,
        eq_concertina_wire, // 0x43,
        gadget_spawnbeacon, // 0x44,
        ac130, // 0x45,
        ar_stealth_t8, // 0x46,
        helicopter_comlink, // 0x47,
        gadget_armor, // 0x48,
        feature_cac, // 0x49,
        shotgun_pump_t8, // 0x4a,
        gadget_health_boost, // 0x4b,
        bare_hands, // 0x4c,
        lmg_stealth_t8, // 0x4d,
        trophy_system, // 0x4e,
        sniper_mini14_t8, // 0x4f,
        eq_cluster_semtex_grenade, // 0x50,
        tr_longburst_t8, // 0x51,
        smg_standard_t8, // 0x52,
        eq_slow_grenade, // 0x53,
        smg_folding_t8, // 0x54,
        lmg_spray_t8, // 0x55,
        smg_accurate_t8, // 0x56,
        ar_modular_t8, // 0x57,
        smg_fastburst_t8, // 0x58,
        eq_molotov, // 0x59,
        melee_slaybell_t8, // 0x5a,
        smg_fastfire_t8, // 0x5b,
        ai_tank_marker, // 0x5c,
        lmg_standard_t8, // 0x5d,
        gadget_cleanse, // 0x5e,
        melee_demohammer_t8, // 0x5f,
        hero_annihilator_oic, // 0x60,
        hero_flamethrower, // 0x61,
        sniper_fastrechamber_t8, // 0x62,
        special_ballisticknife_t8_dw, // 0x63,
        hero_annihilator, // 0x64,
        ar_peacekeeper_t8, // 0x65,
        planemortar, // 0x66,
        tr_powersemi_t8, // 0x67,
        shotgun_semiauto_t8, // 0x68,
        gadget_radiation_field, // 0x69,
        ar_standard_t8, // 0x6a,
        weapon_null, // 0x6b,
        default_specialist_equipment, // 0x6c,
        hash_7932008294f0d876, // 0x6d,
        smg_handling_t8, // 0x6e,
        shotgun_fullauto_t8, // 0x6f,
        hash_7ab3f9a730359659, // 0x70,
        tr_flechette_t8, // 0x71,
        melee_secretsanta_t8, // 0x72,
        gadget_icepick, // 0x73,
        melee_coinbag_t8, // 0x74,
        gadget_camo, // 0x75
    };

    // idx 2 members 44
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        lmg_stealth_t8, // 0x13,
        sniper_mini14_t8, // 0x14,
        tr_longburst_t8, // 0x15,
        smg_standard_t8, // 0x16,
        smg_folding_t8, // 0x17,
        lmg_spray_t8, // 0x18,
        smg_accurate_t8, // 0x19,
        ar_modular_t8, // 0x1a,
        smg_fastburst_t8, // 0x1b,
        melee_slaybell_t8, // 0x1c,
        smg_fastfire_t8, // 0x1d,
        lmg_standard_t8, // 0x1e,
        melee_demohammer_t8, // 0x1f,
        hero_annihilator_oic, // 0x20,
        sniper_fastrechamber_t8, // 0x21,
        special_ballisticknife_t8_dw, // 0x22,
        ar_peacekeeper_t8, // 0x23,
        tr_powersemi_t8, // 0x24,
        shotgun_semiauto_t8, // 0x25,
        ar_standard_t8, // 0x26,
        smg_handling_t8, // 0x27,
        shotgun_fullauto_t8, // 0x28,
        tr_flechette_t8, // 0x29,
        melee_secretsanta_t8, // 0x2a,
        melee_coinbag_t8, // 0x2b
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 45
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom3, // 0x26,
        custom1, // 0x27,
        dualoptic, // 0x28,
        grip, // 0x29,
        reflex, // 0x2a,
        uber, // 0x2b,
        damage, // 0x2c
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 6 size 0xc40
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x258
    lootcontracts loot_contracts[3];
    // offset 0x930, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x938, size 0x2c0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0xbf8, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0xc38, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_1482b2b38bea693c"

version 15 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 118
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        sig_blade, // 0x33,
        pistol_burst_t8, // 0x34,
        ar_fastfire_t8, // 0x35,
        hero_pineapplegun, // 0x36,
        sniper_quickscope_t8, // 0x37,
        ability_dog, // 0x38,
        straferun, // 0x39,
        eq_smoke, // 0x3a,
        lmg_heavy_t8, // 0x3b,
        eq_seeker_mine, // 0x3c,
        recon_car, // 0x3d,
        eq_gravityslam, // 0x3e,
        feature_custom_class_6, // 0x3f,
        feature_custom_class_5, // 0x40,
        feature_custom_class_4, // 0x41,
        uav, // 0x42,
        eq_concertina_wire, // 0x43,
        gadget_spawnbeacon, // 0x44,
        ac130, // 0x45,
        ar_stealth_t8, // 0x46,
        helicopter_comlink, // 0x47,
        gadget_armor, // 0x48,
        feature_cac, // 0x49,
        shotgun_pump_t8, // 0x4a,
        gadget_health_boost, // 0x4b,
        bare_hands, // 0x4c,
        lmg_stealth_t8, // 0x4d,
        trophy_system, // 0x4e,
        sniper_mini14_t8, // 0x4f,
        eq_cluster_semtex_grenade, // 0x50,
        tr_longburst_t8, // 0x51,
        smg_standard_t8, // 0x52,
        eq_slow_grenade, // 0x53,
        smg_folding_t8, // 0x54,
        lmg_spray_t8, // 0x55,
        smg_accurate_t8, // 0x56,
        ar_modular_t8, // 0x57,
        smg_fastburst_t8, // 0x58,
        eq_molotov, // 0x59,
        melee_slaybell_t8, // 0x5a,
        smg_fastfire_t8, // 0x5b,
        ai_tank_marker, // 0x5c,
        lmg_standard_t8, // 0x5d,
        gadget_cleanse, // 0x5e,
        melee_demohammer_t8, // 0x5f,
        hero_annihilator_oic, // 0x60,
        hero_flamethrower, // 0x61,
        sniper_fastrechamber_t8, // 0x62,
        special_ballisticknife_t8_dw, // 0x63,
        hero_annihilator, // 0x64,
        ar_peacekeeper_t8, // 0x65,
        planemortar, // 0x66,
        tr_powersemi_t8, // 0x67,
        shotgun_semiauto_t8, // 0x68,
        gadget_radiation_field, // 0x69,
        ar_standard_t8, // 0x6a,
        weapon_null, // 0x6b,
        default_specialist_equipment, // 0x6c,
        hash_7932008294f0d876, // 0x6d,
        smg_handling_t8, // 0x6e,
        shotgun_fullauto_t8, // 0x6f,
        hash_7ab3f9a730359659, // 0x70,
        tr_flechette_t8, // 0x71,
        melee_secretsanta_t8, // 0x72,
        gadget_icepick, // 0x73,
        melee_coinbag_t8, // 0x74,
        gadget_camo, // 0x75
    };

    // idx 2 members 44
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        lmg_stealth_t8, // 0x13,
        sniper_mini14_t8, // 0x14,
        tr_longburst_t8, // 0x15,
        smg_standard_t8, // 0x16,
        smg_folding_t8, // 0x17,
        lmg_spray_t8, // 0x18,
        smg_accurate_t8, // 0x19,
        ar_modular_t8, // 0x1a,
        smg_fastburst_t8, // 0x1b,
        melee_slaybell_t8, // 0x1c,
        smg_fastfire_t8, // 0x1d,
        lmg_standard_t8, // 0x1e,
        melee_demohammer_t8, // 0x1f,
        hero_annihilator_oic, // 0x20,
        sniper_fastrechamber_t8, // 0x21,
        special_ballisticknife_t8_dw, // 0x22,
        ar_peacekeeper_t8, // 0x23,
        tr_powersemi_t8, // 0x24,
        shotgun_semiauto_t8, // 0x25,
        ar_standard_t8, // 0x26,
        smg_handling_t8, // 0x27,
        shotgun_fullauto_t8, // 0x28,
        tr_flechette_t8, // 0x29,
        melee_secretsanta_t8, // 0x2a,
        melee_coinbag_t8, // 0x2b
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 45
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom3, // 0x26,
        custom1, // 0x27,
        dualoptic, // 0x28,
        grip, // 0x29,
        reflex, // 0x2a,
        uber, // 0x2b,
        damage, // 0x2c
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 5 size 0x9e8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x2c0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0x9a0, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0x9e0, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_4380907c981af577"

version 14 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 118
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        sig_blade, // 0x33,
        pistol_burst_t8, // 0x34,
        ar_fastfire_t8, // 0x35,
        hero_pineapplegun, // 0x36,
        sniper_quickscope_t8, // 0x37,
        ability_dog, // 0x38,
        straferun, // 0x39,
        eq_smoke, // 0x3a,
        lmg_heavy_t8, // 0x3b,
        eq_seeker_mine, // 0x3c,
        recon_car, // 0x3d,
        eq_gravityslam, // 0x3e,
        feature_custom_class_6, // 0x3f,
        feature_custom_class_5, // 0x40,
        feature_custom_class_4, // 0x41,
        uav, // 0x42,
        eq_concertina_wire, // 0x43,
        gadget_spawnbeacon, // 0x44,
        ac130, // 0x45,
        ar_stealth_t8, // 0x46,
        helicopter_comlink, // 0x47,
        gadget_armor, // 0x48,
        feature_cac, // 0x49,
        shotgun_pump_t8, // 0x4a,
        gadget_health_boost, // 0x4b,
        bare_hands, // 0x4c,
        lmg_stealth_t8, // 0x4d,
        trophy_system, // 0x4e,
        sniper_mini14_t8, // 0x4f,
        eq_cluster_semtex_grenade, // 0x50,
        tr_longburst_t8, // 0x51,
        smg_standard_t8, // 0x52,
        eq_slow_grenade, // 0x53,
        smg_folding_t8, // 0x54,
        lmg_spray_t8, // 0x55,
        smg_accurate_t8, // 0x56,
        ar_modular_t8, // 0x57,
        smg_fastburst_t8, // 0x58,
        eq_molotov, // 0x59,
        melee_slaybell_t8, // 0x5a,
        smg_fastfire_t8, // 0x5b,
        ai_tank_marker, // 0x5c,
        lmg_standard_t8, // 0x5d,
        gadget_cleanse, // 0x5e,
        melee_demohammer_t8, // 0x5f,
        hero_annihilator_oic, // 0x60,
        hero_flamethrower, // 0x61,
        sniper_fastrechamber_t8, // 0x62,
        special_ballisticknife_t8_dw, // 0x63,
        hero_annihilator, // 0x64,
        ar_peacekeeper_t8, // 0x65,
        planemortar, // 0x66,
        tr_powersemi_t8, // 0x67,
        shotgun_semiauto_t8, // 0x68,
        gadget_radiation_field, // 0x69,
        ar_standard_t8, // 0x6a,
        weapon_null, // 0x6b,
        default_specialist_equipment, // 0x6c,
        hash_7932008294f0d876, // 0x6d,
        smg_handling_t8, // 0x6e,
        shotgun_fullauto_t8, // 0x6f,
        hash_7ab3f9a730359659, // 0x70,
        tr_flechette_t8, // 0x71,
        melee_secretsanta_t8, // 0x72,
        gadget_icepick, // 0x73,
        melee_coinbag_t8, // 0x74,
        gadget_camo, // 0x75
    };

    // idx 2 members 43
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        lmg_stealth_t8, // 0x13,
        sniper_mini14_t8, // 0x14,
        tr_longburst_t8, // 0x15,
        smg_standard_t8, // 0x16,
        smg_folding_t8, // 0x17,
        lmg_spray_t8, // 0x18,
        smg_accurate_t8, // 0x19,
        ar_modular_t8, // 0x1a,
        smg_fastburst_t8, // 0x1b,
        melee_slaybell_t8, // 0x1c,
        smg_fastfire_t8, // 0x1d,
        lmg_standard_t8, // 0x1e,
        melee_demohammer_t8, // 0x1f,
        hero_annihilator_oic, // 0x20,
        sniper_fastrechamber_t8, // 0x21,
        ar_peacekeeper_t8, // 0x22,
        tr_powersemi_t8, // 0x23,
        shotgun_semiauto_t8, // 0x24,
        ar_standard_t8, // 0x25,
        smg_handling_t8, // 0x26,
        shotgun_fullauto_t8, // 0x27,
        tr_flechette_t8, // 0x28,
        melee_secretsanta_t8, // 0x29,
        melee_coinbag_t8, // 0x2a
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 45
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom1, // 0x27,
        dualoptic, // 0x28,
        grip, // 0x29,
        reflex, // 0x2a,
        uber, // 0x2b,
        damage, // 0x2c
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 5 size 0x9d8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x2b0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0x990, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0x9d0, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_1e472360da15532e"

version 13 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 117
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        pistol_burst_t8, // 0x33,
        ar_fastfire_t8, // 0x34,
        hero_pineapplegun, // 0x35,
        sniper_quickscope_t8, // 0x36,
        ability_dog, // 0x37,
        straferun, // 0x38,
        eq_smoke, // 0x39,
        lmg_heavy_t8, // 0x3a,
        eq_seeker_mine, // 0x3b,
        recon_car, // 0x3c,
        eq_gravityslam, // 0x3d,
        feature_custom_class_6, // 0x3e,
        feature_custom_class_5, // 0x3f,
        feature_custom_class_4, // 0x40,
        uav, // 0x41,
        eq_concertina_wire, // 0x42,
        gadget_spawnbeacon, // 0x43,
        ac130, // 0x44,
        ar_stealth_t8, // 0x45,
        helicopter_comlink, // 0x46,
        gadget_armor, // 0x47,
        feature_cac, // 0x48,
        shotgun_pump_t8, // 0x49,
        gadget_health_boost, // 0x4a,
        bare_hands, // 0x4b,
        lmg_stealth_t8, // 0x4c,
        trophy_system, // 0x4d,
        sniper_mini14_t8, // 0x4e,
        eq_cluster_semtex_grenade, // 0x4f,
        tr_longburst_t8, // 0x50,
        smg_standard_t8, // 0x51,
        eq_slow_grenade, // 0x52,
        smg_folding_t8, // 0x53,
        lmg_spray_t8, // 0x54,
        smg_accurate_t8, // 0x55,
        ar_modular_t8, // 0x56,
        smg_fastburst_t8, // 0x57,
        eq_molotov, // 0x58,
        melee_slaybell_t8, // 0x59,
        smg_fastfire_t8, // 0x5a,
        ai_tank_marker, // 0x5b,
        lmg_standard_t8, // 0x5c,
        gadget_cleanse, // 0x5d,
        melee_demohammer_t8, // 0x5e,
        hero_annihilator_oic, // 0x5f,
        hero_flamethrower, // 0x60,
        sniper_fastrechamber_t8, // 0x61,
        special_ballisticknife_t8_dw, // 0x62,
        hero_annihilator, // 0x63,
        ar_peacekeeper_t8, // 0x64,
        planemortar, // 0x65,
        tr_powersemi_t8, // 0x66,
        shotgun_semiauto_t8, // 0x67,
        gadget_radiation_field, // 0x68,
        ar_standard_t8, // 0x69,
        weapon_null, // 0x6a,
        default_specialist_equipment, // 0x6b,
        hash_7932008294f0d876, // 0x6c,
        smg_handling_t8, // 0x6d,
        shotgun_fullauto_t8, // 0x6e,
        hash_7ab3f9a730359659, // 0x6f,
        tr_flechette_t8, // 0x70,
        melee_secretsanta_t8, // 0x71,
        gadget_icepick, // 0x72,
        melee_coinbag_t8, // 0x73,
        gadget_camo, // 0x74
    };

    // idx 2 members 43
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        lmg_stealth_t8, // 0x13,
        sniper_mini14_t8, // 0x14,
        tr_longburst_t8, // 0x15,
        smg_standard_t8, // 0x16,
        smg_folding_t8, // 0x17,
        lmg_spray_t8, // 0x18,
        smg_accurate_t8, // 0x19,
        ar_modular_t8, // 0x1a,
        smg_fastburst_t8, // 0x1b,
        melee_slaybell_t8, // 0x1c,
        smg_fastfire_t8, // 0x1d,
        lmg_standard_t8, // 0x1e,
        melee_demohammer_t8, // 0x1f,
        hero_annihilator_oic, // 0x20,
        sniper_fastrechamber_t8, // 0x21,
        ar_peacekeeper_t8, // 0x22,
        tr_powersemi_t8, // 0x23,
        shotgun_semiauto_t8, // 0x24,
        ar_standard_t8, // 0x25,
        smg_handling_t8, // 0x26,
        shotgun_fullauto_t8, // 0x27,
        tr_flechette_t8, // 0x28,
        melee_secretsanta_t8, // 0x29,
        melee_coinbag_t8, // 0x2a
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 45
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom1, // 0x27,
        dualoptic, // 0x28,
        grip, // 0x29,
        reflex, // 0x2a,
        uber, // 0x2b,
        damage, // 0x2c
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 5 size 0x9d8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x2b0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0x990, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0x9d0, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_3a2857afda340c54"

version 12 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 116
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        pistol_burst_t8, // 0x33,
        ar_fastfire_t8, // 0x34,
        hero_pineapplegun, // 0x35,
        sniper_quickscope_t8, // 0x36,
        ability_dog, // 0x37,
        straferun, // 0x38,
        eq_smoke, // 0x39,
        lmg_heavy_t8, // 0x3a,
        eq_seeker_mine, // 0x3b,
        recon_car, // 0x3c,
        eq_gravityslam, // 0x3d,
        feature_custom_class_6, // 0x3e,
        feature_custom_class_5, // 0x3f,
        feature_custom_class_4, // 0x40,
        uav, // 0x41,
        eq_concertina_wire, // 0x42,
        gadget_spawnbeacon, // 0x43,
        ac130, // 0x44,
        ar_stealth_t8, // 0x45,
        helicopter_comlink, // 0x46,
        gadget_armor, // 0x47,
        feature_cac, // 0x48,
        shotgun_pump_t8, // 0x49,
        gadget_health_boost, // 0x4a,
        bare_hands, // 0x4b,
        lmg_stealth_t8, // 0x4c,
        trophy_system, // 0x4d,
        sniper_mini14_t8, // 0x4e,
        eq_cluster_semtex_grenade, // 0x4f,
        tr_longburst_t8, // 0x50,
        smg_standard_t8, // 0x51,
        eq_slow_grenade, // 0x52,
        smg_folding_t8, // 0x53,
        lmg_spray_t8, // 0x54,
        smg_accurate_t8, // 0x55,
        ar_modular_t8, // 0x56,
        smg_fastburst_t8, // 0x57,
        eq_molotov, // 0x58,
        melee_slaybell_t8, // 0x59,
        smg_fastfire_t8, // 0x5a,
        ai_tank_marker, // 0x5b,
        lmg_standard_t8, // 0x5c,
        gadget_cleanse, // 0x5d,
        melee_demohammer_t8, // 0x5e,
        hero_annihilator_oic, // 0x5f,
        hero_flamethrower, // 0x60,
        sniper_fastrechamber_t8, // 0x61,
        special_ballisticknife_t8_dw, // 0x62,
        hero_annihilator, // 0x63,
        planemortar, // 0x64,
        tr_powersemi_t8, // 0x65,
        shotgun_semiauto_t8, // 0x66,
        gadget_radiation_field, // 0x67,
        ar_standard_t8, // 0x68,
        weapon_null, // 0x69,
        default_specialist_equipment, // 0x6a,
        hash_7932008294f0d876, // 0x6b,
        smg_handling_t8, // 0x6c,
        shotgun_fullauto_t8, // 0x6d,
        hash_7ab3f9a730359659, // 0x6e,
        tr_flechette_t8, // 0x6f,
        melee_secretsanta_t8, // 0x70,
        gadget_icepick, // 0x71,
        melee_coinbag_t8, // 0x72,
        gadget_camo, // 0x73
    };

    // idx 2 members 42
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        lmg_stealth_t8, // 0x13,
        sniper_mini14_t8, // 0x14,
        tr_longburst_t8, // 0x15,
        smg_standard_t8, // 0x16,
        smg_folding_t8, // 0x17,
        lmg_spray_t8, // 0x18,
        smg_accurate_t8, // 0x19,
        ar_modular_t8, // 0x1a,
        smg_fastburst_t8, // 0x1b,
        melee_slaybell_t8, // 0x1c,
        smg_fastfire_t8, // 0x1d,
        lmg_standard_t8, // 0x1e,
        melee_demohammer_t8, // 0x1f,
        hero_annihilator_oic, // 0x20,
        sniper_fastrechamber_t8, // 0x21,
        tr_powersemi_t8, // 0x22,
        shotgun_semiauto_t8, // 0x23,
        ar_standard_t8, // 0x24,
        smg_handling_t8, // 0x25,
        shotgun_fullauto_t8, // 0x26,
        tr_flechette_t8, // 0x27,
        melee_secretsanta_t8, // 0x28,
        melee_coinbag_t8, // 0x29
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 45
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom1, // 0x27,
        dualoptic, // 0x28,
        grip, // 0x29,
        reflex, // 0x2a,
        uber, // 0x2b,
        damage, // 0x2c
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 5 size 0x9c8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x2a0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0x980, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0x9c0, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_4a1b801ec965636e"

version 11 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 116
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        pistol_burst_t8, // 0x33,
        ar_fastfire_t8, // 0x34,
        hero_pineapplegun, // 0x35,
        sniper_quickscope_t8, // 0x36,
        ability_dog, // 0x37,
        straferun, // 0x38,
        eq_smoke, // 0x39,
        lmg_heavy_t8, // 0x3a,
        eq_seeker_mine, // 0x3b,
        recon_car, // 0x3c,
        eq_gravityslam, // 0x3d,
        feature_custom_class_6, // 0x3e,
        feature_custom_class_5, // 0x3f,
        feature_custom_class_4, // 0x40,
        uav, // 0x41,
        eq_concertina_wire, // 0x42,
        gadget_spawnbeacon, // 0x43,
        ac130, // 0x44,
        ar_stealth_t8, // 0x45,
        helicopter_comlink, // 0x46,
        gadget_armor, // 0x47,
        feature_cac, // 0x48,
        shotgun_pump_t8, // 0x49,
        gadget_health_boost, // 0x4a,
        bare_hands, // 0x4b,
        lmg_stealth_t8, // 0x4c,
        trophy_system, // 0x4d,
        sniper_mini14_t8, // 0x4e,
        eq_cluster_semtex_grenade, // 0x4f,
        tr_longburst_t8, // 0x50,
        smg_standard_t8, // 0x51,
        eq_slow_grenade, // 0x52,
        smg_folding_t8, // 0x53,
        lmg_spray_t8, // 0x54,
        smg_accurate_t8, // 0x55,
        ar_modular_t8, // 0x56,
        smg_fastburst_t8, // 0x57,
        eq_molotov, // 0x58,
        melee_slaybell_t8, // 0x59,
        smg_fastfire_t8, // 0x5a,
        ai_tank_marker, // 0x5b,
        lmg_standard_t8, // 0x5c,
        gadget_cleanse, // 0x5d,
        melee_demohammer_t8, // 0x5e,
        hero_annihilator_oic, // 0x5f,
        hero_flamethrower, // 0x60,
        sniper_fastrechamber_t8, // 0x61,
        special_ballisticknife_t8_dw, // 0x62,
        hero_annihilator, // 0x63,
        planemortar, // 0x64,
        tr_powersemi_t8, // 0x65,
        shotgun_semiauto_t8, // 0x66,
        gadget_radiation_field, // 0x67,
        ar_standard_t8, // 0x68,
        weapon_null, // 0x69,
        default_specialist_equipment, // 0x6a,
        hash_7932008294f0d876, // 0x6b,
        smg_handling_t8, // 0x6c,
        shotgun_fullauto_t8, // 0x6d,
        hash_7ab3f9a730359659, // 0x6e,
        tr_flechette_t8, // 0x6f,
        melee_secretsanta_t8, // 0x70,
        gadget_icepick, // 0x71,
        melee_coinbag_t8, // 0x72,
        gadget_camo, // 0x73
    };

    // idx 2 members 42
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        lmg_stealth_t8, // 0x13,
        sniper_mini14_t8, // 0x14,
        tr_longburst_t8, // 0x15,
        smg_standard_t8, // 0x16,
        smg_folding_t8, // 0x17,
        lmg_spray_t8, // 0x18,
        smg_accurate_t8, // 0x19,
        ar_modular_t8, // 0x1a,
        smg_fastburst_t8, // 0x1b,
        melee_slaybell_t8, // 0x1c,
        smg_fastfire_t8, // 0x1d,
        lmg_standard_t8, // 0x1e,
        melee_demohammer_t8, // 0x1f,
        hero_annihilator_oic, // 0x20,
        sniper_fastrechamber_t8, // 0x21,
        tr_powersemi_t8, // 0x22,
        shotgun_semiauto_t8, // 0x23,
        ar_standard_t8, // 0x24,
        smg_handling_t8, // 0x25,
        shotgun_fullauto_t8, // 0x26,
        tr_flechette_t8, // 0x27,
        melee_secretsanta_t8, // 0x28,
        melee_coinbag_t8, // 0x29
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 45
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom1, // 0x27,
        dualoptic, // 0x28,
        grip, // 0x29,
        reflex, // 0x2a,
        uber, // 0x2b,
        damage, // 0x2c
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 16
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        hash_70fe115fad3f4fa, // 0x2,
        prt_mp_mercenary, // 0x3,
        prt_mp_technomancer, // 0x4,
        prt_mp_engineer, // 0x5,
        hash_3ca96ae1bd7d344f, // 0x6,
        prt_mp_outrider, // 0x7,
        prt_mp_swatpolice, // 0x8,
        prt_mp_spectre, // 0x9,
        prt_mp_recon, // 0xa,
        prt_mp_battery, // 0xb,
        prt_mp_enforcer, // 0xc,
        prt_mp_zero, // 0xd,
        prt_mp_trapper, // 0xe,
        prt_mp_firebreak, // 0xf
    };

    // idx 0 members 5 size 0x9c8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x2a0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0x980, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0x9c0, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_aedd35dc2a556b7f"

version 10 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 116
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        pistol_burst_t8, // 0x33,
        ar_fastfire_t8, // 0x34,
        hero_pineapplegun, // 0x35,
        sniper_quickscope_t8, // 0x36,
        ability_dog, // 0x37,
        straferun, // 0x38,
        eq_smoke, // 0x39,
        lmg_heavy_t8, // 0x3a,
        eq_seeker_mine, // 0x3b,
        recon_car, // 0x3c,
        eq_gravityslam, // 0x3d,
        feature_custom_class_6, // 0x3e,
        feature_custom_class_5, // 0x3f,
        feature_custom_class_4, // 0x40,
        uav, // 0x41,
        eq_concertina_wire, // 0x42,
        gadget_spawnbeacon, // 0x43,
        ac130, // 0x44,
        ar_stealth_t8, // 0x45,
        helicopter_comlink, // 0x46,
        gadget_armor, // 0x47,
        feature_cac, // 0x48,
        shotgun_pump_t8, // 0x49,
        gadget_health_boost, // 0x4a,
        bare_hands, // 0x4b,
        lmg_stealth_t8, // 0x4c,
        trophy_system, // 0x4d,
        sniper_mini14_t8, // 0x4e,
        eq_cluster_semtex_grenade, // 0x4f,
        tr_longburst_t8, // 0x50,
        smg_standard_t8, // 0x51,
        eq_slow_grenade, // 0x52,
        smg_folding_t8, // 0x53,
        lmg_spray_t8, // 0x54,
        smg_accurate_t8, // 0x55,
        ar_modular_t8, // 0x56,
        smg_fastburst_t8, // 0x57,
        eq_molotov, // 0x58,
        melee_slaybell_t8, // 0x59,
        smg_fastfire_t8, // 0x5a,
        ai_tank_marker, // 0x5b,
        lmg_standard_t8, // 0x5c,
        gadget_cleanse, // 0x5d,
        melee_demohammer_t8, // 0x5e,
        hero_annihilator_oic, // 0x5f,
        hero_flamethrower, // 0x60,
        sniper_fastrechamber_t8, // 0x61,
        special_ballisticknife_t8_dw, // 0x62,
        hero_annihilator, // 0x63,
        planemortar, // 0x64,
        tr_powersemi_t8, // 0x65,
        shotgun_semiauto_t8, // 0x66,
        gadget_radiation_field, // 0x67,
        ar_standard_t8, // 0x68,
        weapon_null, // 0x69,
        default_specialist_equipment, // 0x6a,
        hash_7932008294f0d876, // 0x6b,
        smg_handling_t8, // 0x6c,
        shotgun_fullauto_t8, // 0x6d,
        hash_7ab3f9a730359659, // 0x6e,
        tr_flechette_t8, // 0x6f,
        melee_secretsanta_t8, // 0x70,
        gadget_icepick, // 0x71,
        melee_coinbag_t8, // 0x72,
        gadget_camo, // 0x73
    };

    // idx 2 members 42
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        lmg_stealth_t8, // 0x13,
        sniper_mini14_t8, // 0x14,
        tr_longburst_t8, // 0x15,
        smg_standard_t8, // 0x16,
        smg_folding_t8, // 0x17,
        lmg_spray_t8, // 0x18,
        smg_accurate_t8, // 0x19,
        ar_modular_t8, // 0x1a,
        smg_fastburst_t8, // 0x1b,
        melee_slaybell_t8, // 0x1c,
        smg_fastfire_t8, // 0x1d,
        lmg_standard_t8, // 0x1e,
        melee_demohammer_t8, // 0x1f,
        hero_annihilator_oic, // 0x20,
        sniper_fastrechamber_t8, // 0x21,
        tr_powersemi_t8, // 0x22,
        shotgun_semiauto_t8, // 0x23,
        ar_standard_t8, // 0x24,
        smg_handling_t8, // 0x25,
        shotgun_fullauto_t8, // 0x26,
        tr_flechette_t8, // 0x27,
        melee_secretsanta_t8, // 0x28,
        melee_coinbag_t8, // 0x29
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 45
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom2, // 0x26,
        custom1, // 0x27,
        dualoptic, // 0x28,
        grip, // 0x29,
        reflex, // 0x2a,
        uber, // 0x2b,
        damage, // 0x2c
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 5 size 0x9c8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x2a0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0x980, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0x9c0, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_9a95f563d189fd5a"

version 9 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 116
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        pistol_burst_t8, // 0x33,
        ar_fastfire_t8, // 0x34,
        hero_pineapplegun, // 0x35,
        sniper_quickscope_t8, // 0x36,
        ability_dog, // 0x37,
        straferun, // 0x38,
        eq_smoke, // 0x39,
        lmg_heavy_t8, // 0x3a,
        eq_seeker_mine, // 0x3b,
        recon_car, // 0x3c,
        eq_gravityslam, // 0x3d,
        feature_custom_class_6, // 0x3e,
        feature_custom_class_5, // 0x3f,
        feature_custom_class_4, // 0x40,
        uav, // 0x41,
        eq_concertina_wire, // 0x42,
        gadget_spawnbeacon, // 0x43,
        ac130, // 0x44,
        ar_stealth_t8, // 0x45,
        helicopter_comlink, // 0x46,
        gadget_armor, // 0x47,
        feature_cac, // 0x48,
        shotgun_pump_t8, // 0x49,
        gadget_health_boost, // 0x4a,
        bare_hands, // 0x4b,
        trophy_system, // 0x4c,
        sniper_mini14_t8, // 0x4d,
        eq_cluster_semtex_grenade, // 0x4e,
        tr_longburst_t8, // 0x4f,
        smg_standard_t8, // 0x50,
        eq_slow_grenade, // 0x51,
        smg_folding_t8, // 0x52,
        lmg_spray_t8, // 0x53,
        smg_accurate_t8, // 0x54,
        ar_modular_t8, // 0x55,
        smg_fastburst_t8, // 0x56,
        eq_molotov, // 0x57,
        melee_slaybell_t8, // 0x58,
        smg_fastfire_t8, // 0x59,
        ai_tank_marker, // 0x5a,
        lmg_standard_t8, // 0x5b,
        gadget_cleanse, // 0x5c,
        melee_demohammer_t8, // 0x5d,
        hero_annihilator_oic, // 0x5e,
        hero_flamethrower, // 0x5f,
        sniper_fastrechamber_t8, // 0x60,
        hash_691de0ab16953282, // 0x61,
        special_ballisticknife_t8_dw, // 0x62,
        hero_annihilator, // 0x63,
        planemortar, // 0x64,
        tr_powersemi_t8, // 0x65,
        shotgun_semiauto_t8, // 0x66,
        gadget_radiation_field, // 0x67,
        ar_standard_t8, // 0x68,
        weapon_null, // 0x69,
        default_specialist_equipment, // 0x6a,
        hash_7932008294f0d876, // 0x6b,
        smg_handling_t8, // 0x6c,
        shotgun_fullauto_t8, // 0x6d,
        hash_7ab3f9a730359659, // 0x6e,
        tr_flechette_t8, // 0x6f,
        melee_secretsanta_t8, // 0x70,
        gadget_icepick, // 0x71,
        melee_coinbag_t8, // 0x72,
        gadget_camo, // 0x73
    };

    // idx 2 members 42
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        sniper_mini14_t8, // 0x13,
        tr_longburst_t8, // 0x14,
        smg_standard_t8, // 0x15,
        smg_folding_t8, // 0x16,
        lmg_spray_t8, // 0x17,
        smg_accurate_t8, // 0x18,
        ar_modular_t8, // 0x19,
        smg_fastburst_t8, // 0x1a,
        melee_slaybell_t8, // 0x1b,
        smg_fastfire_t8, // 0x1c,
        lmg_standard_t8, // 0x1d,
        melee_demohammer_t8, // 0x1e,
        hero_annihilator_oic, // 0x1f,
        sniper_fastrechamber_t8, // 0x20,
        hash_691de0ab16953282, // 0x21,
        tr_powersemi_t8, // 0x22,
        shotgun_semiauto_t8, // 0x23,
        ar_standard_t8, // 0x24,
        smg_handling_t8, // 0x25,
        shotgun_fullauto_t8, // 0x26,
        tr_flechette_t8, // 0x27,
        melee_secretsanta_t8, // 0x28,
        melee_coinbag_t8, // 0x29
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 44
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom1, // 0x26,
        dualoptic, // 0x27,
        grip, // 0x28,
        reflex, // 0x29,
        uber, // 0x2a,
        damage, // 0x2b
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 5 size 0x9c8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x2a0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0x980, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0x9c0, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_62e37cbbc39e6a"

version 8 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 115
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        melee_club_t8, // 0x8,
        tr_midburst_t8, // 0x9,
        sniper_powersemi_t8, // 0xa,
        counteruav, // 0xb,
        gadget_supplypod, // 0xc,
        ar_damage_t8, // 0xd,
        sig_buckler_dw, // 0xe,
        gadget_vision_pulse, // 0xf,
        eq_arm_blade, // 0x10,
        gadget_heat_wave, // 0x11,
        melee_cutlass_t8, // 0x12,
        eq_localheal, // 0x13,
        eq_sensor, // 0x14,
        pistol_fullauto_t8, // 0x15,
        remote_missile, // 0x16,
        willy_pete, // 0x17,
        eq_emp_grenade, // 0x18,
        ar_accurate_t8, // 0x19,
        frag_grenade, // 0x1a,
        knife_loadout, // 0x1b,
        feature_default_class_5, // 0x1c,
        feature_default_class_4, // 0x1d,
        feature_default_class_6, // 0x1e,
        eq_swat_grenade, // 0x1f,
        swat_team, // 0x20,
        hatchet, // 0x21,
        supplydrop_marker, // 0x22,
        mute_smoke, // 0x23,
        smg_capacity_t8, // 0x24,
        pistol_standard_t8, // 0x25,
        null_offhand_secondary, // 0x26,
        gadget_health_regen, // 0x27,
        hash_31be8125c7d0f273, // 0x28,
        drone_squadron, // 0x29,
        null_offhand_primary, // 0x2a,
        pistol_revolver_t8, // 0x2b,
        sniper_powerbolt_t8, // 0x2c,
        overwatch_helicopter, // 0x2d,
        eq_grapple, // 0x2e,
        gadget_jammer, // 0x2f,
        hash_3ab58e40011df941, // 0x30,
        launcher_standard_t8, // 0x31,
        sig_bow_quickshot, // 0x32,
        pistol_burst_t8, // 0x33,
        ar_fastfire_t8, // 0x34,
        hero_pineapplegun, // 0x35,
        sniper_quickscope_t8, // 0x36,
        ability_dog, // 0x37,
        straferun, // 0x38,
        lmg_heavy_t8, // 0x39,
        eq_seeker_mine, // 0x3a,
        recon_car, // 0x3b,
        eq_gravityslam, // 0x3c,
        feature_custom_class_6, // 0x3d,
        feature_custom_class_5, // 0x3e,
        feature_custom_class_4, // 0x3f,
        uav, // 0x40,
        eq_concertina_wire, // 0x41,
        gadget_spawnbeacon, // 0x42,
        ac130, // 0x43,
        ar_stealth_t8, // 0x44,
        helicopter_comlink, // 0x45,
        gadget_armor, // 0x46,
        feature_cac, // 0x47,
        shotgun_pump_t8, // 0x48,
        gadget_health_boost, // 0x49,
        bare_hands, // 0x4a,
        trophy_system, // 0x4b,
        sniper_mini14_t8, // 0x4c,
        eq_cluster_semtex_grenade, // 0x4d,
        tr_longburst_t8, // 0x4e,
        smg_standard_t8, // 0x4f,
        eq_slow_grenade, // 0x50,
        smg_folding_t8, // 0x51,
        lmg_spray_t8, // 0x52,
        smg_accurate_t8, // 0x53,
        ar_modular_t8, // 0x54,
        smg_fastburst_t8, // 0x55,
        eq_molotov, // 0x56,
        melee_slaybell_t8, // 0x57,
        smg_fastfire_t8, // 0x58,
        ai_tank_marker, // 0x59,
        lmg_standard_t8, // 0x5a,
        gadget_cleanse, // 0x5b,
        melee_demohammer_t8, // 0x5c,
        hero_annihilator_oic, // 0x5d,
        hero_flamethrower, // 0x5e,
        sniper_fastrechamber_t8, // 0x5f,
        hash_691de0ab16953282, // 0x60,
        special_ballisticknife_t8_dw, // 0x61,
        hero_annihilator, // 0x62,
        planemortar, // 0x63,
        tr_powersemi_t8, // 0x64,
        shotgun_semiauto_t8, // 0x65,
        gadget_radiation_field, // 0x66,
        ar_standard_t8, // 0x67,
        weapon_null, // 0x68,
        default_specialist_equipment, // 0x69,
        hash_7932008294f0d876, // 0x6a,
        smg_handling_t8, // 0x6b,
        shotgun_fullauto_t8, // 0x6c,
        hash_7ab3f9a730359659, // 0x6d,
        tr_flechette_t8, // 0x6e,
        melee_secretsanta_t8, // 0x6f,
        gadget_icepick, // 0x70,
        melee_coinbag_t8, // 0x71,
        gadget_camo, // 0x72
    };

    // idx 2 members 42
    enum hash_4b8d95aacf149fb9 {
        melee_club_t8, // 0x0,
        tr_midburst_t8, // 0x1,
        sniper_powersemi_t8, // 0x2,
        ar_damage_t8, // 0x3,
        melee_cutlass_t8, // 0x4,
        pistol_fullauto_t8, // 0x5,
        ar_accurate_t8, // 0x6,
        knife_loadout, // 0x7,
        smg_capacity_t8, // 0x8,
        pistol_standard_t8, // 0x9,
        pistol_revolver_t8, // 0xa,
        sniper_powerbolt_t8, // 0xb,
        launcher_standard_t8, // 0xc,
        pistol_burst_t8, // 0xd,
        ar_fastfire_t8, // 0xe,
        sniper_quickscope_t8, // 0xf,
        lmg_heavy_t8, // 0x10,
        ar_stealth_t8, // 0x11,
        shotgun_pump_t8, // 0x12,
        sniper_mini14_t8, // 0x13,
        tr_longburst_t8, // 0x14,
        smg_standard_t8, // 0x15,
        smg_folding_t8, // 0x16,
        lmg_spray_t8, // 0x17,
        smg_accurate_t8, // 0x18,
        ar_modular_t8, // 0x19,
        smg_fastburst_t8, // 0x1a,
        melee_slaybell_t8, // 0x1b,
        smg_fastfire_t8, // 0x1c,
        lmg_standard_t8, // 0x1d,
        melee_demohammer_t8, // 0x1e,
        hero_annihilator_oic, // 0x1f,
        sniper_fastrechamber_t8, // 0x20,
        hash_691de0ab16953282, // 0x21,
        tr_powersemi_t8, // 0x22,
        shotgun_semiauto_t8, // 0x23,
        ar_standard_t8, // 0x24,
        smg_handling_t8, // 0x25,
        shotgun_fullauto_t8, // 0x26,
        tr_flechette_t8, // 0x27,
        melee_secretsanta_t8, // 0x28,
        melee_coinbag_t8, // 0x29
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 44
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom1, // 0x26,
        dualoptic, // 0x27,
        grip, // 0x28,
        reflex, // 0x29,
        uber, // 0x2a,
        damage, // 0x2b
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 5 size 0x9c8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x2a0
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0x980, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0x9c0, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_97e99fb805b2d9aa"

version 7 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 3 members 4 size 0x58
    struct intstat {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x20
        uint statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x20
        uint arenavalue;
    };

    // idx 4 members 4 size 0x60
    struct hash_6e522b658d49b7ba {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x20
        uint statvalue;
        // offset 0x38, size 0x8
        uint:4 challengetier;
        // offset 0x40, size 0x20
        uint arenavalue;
    };

    // idx 5 members 4 size 0x48
    struct hash_6c116eea1f7184ec {
        // offset 0x0, size 0x10
        short challengevalue;
        // offset 0x10, size 0x18
        uint:24 statvalue;
        // offset 0x28, size 0x8
        uint:4 challengetier;
        // offset 0x30, size 0x18
        uint:24 arenavalue;
    };

    // idx 6 members 4 size 0x50
    struct hash_44d4a3dc051e6da2 {
        // offset 0x0, size 0x18
        uint:24 challengevalue;
        // offset 0x18, size 0x18
        uint:24 statvalue;
        // offset 0x30, size 0x8
        uint:4 challengetier;
        // offset 0x38, size 0x18
        uint:24 arenavalue;
    };

    // idx 7 members 4 size 0x40
    struct hash_2b6b162a9af31225 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x18
        uint:24 statvalue;
        // offset 0x20, size 0x8
        uint:4 challengetier;
        // offset 0x28, size 0x18
        uint:24 arenavalue;
    };

    // idx 8 members 5 size 0x38
    struct hash_2a676da7026d7618 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 9 members 5 size 0x28
    struct hash_2df14ab4ac36cb9 {
        // offset 0x0, size 0x10
        uint:16 statvalue;
        // offset 0x10, size 0x10
        uint:16 arenavalue;
        // offset 0x20, size 0x1
        bool challengevalue;
        // offset 0x21, size 0x1
        bool challengetier;
        // offset 0x22, size 0x6
        uint:1 __pad[6];
    };

    // idx 10 members 5 size 0x38
    struct hash_3c449a1a07677764 {
        // offset 0x0, size 0x18
        uint:24 statvalue;
        // offset 0x18, size 0x18
        uint:24 arenavalue;
        // offset 0x30, size 0x1
        bool challengevalue;
        // offset 0x31, size 0x1
        bool challengetier;
        // offset 0x32, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 4 size 0x20
    struct hash_25508de9fa29a5d5 {
        // offset 0x0, size 0x8
        byte challengevalue;
        // offset 0x8, size 0x8
        byte statvalue;
        // offset 0x10, size 0x8
        uint:4 challengetier;
        // offset 0x18, size 0x8
        byte arenavalue;
    };

    // idx 12 members 5 size 0x18
    struct hash_798fe6dfb7cfb479 {
        // offset 0x0, size 0x8
        byte statvalue;
        // offset 0x8, size 0x8
        byte arenavalue;
        // offset 0x10, size 0x1
        bool challengevalue;
        // offset 0x11, size 0x1
        bool challengetier;
        // offset 0x12, size 0x6
        uint:1 __pad[6];
    };

    // idx 13 members 5 size 0x8
    struct bitstat {
        // offset 0x0, size 0x1
        bool challengevalue;
        // offset 0x1, size 0x1
        bool statvalue;
        // offset 0x2, size 0x1
        bool challengetier;
        // offset 0x3, size 0x1
        bool arenavalue;
        // offset 0x4, size 0x4
        uint:1 __pad[4];
    };

    // idx 14 members 1 size 0x10
    struct hash_1c86958671ff27fd {
        // offset 0x0, size 0x10
        uint:16 hash_50ab8b7df567cd2a;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 1 members 111
    enum hash_10d50fe10481423c {
        hash_1773b576c62a506, // 0x0,
        eq_tripwire, // 0x1,
        shock_rifle, // 0x2,
        ability_smart_cover, // 0x3,
        dart, // 0x4,
        ultimate_turret, // 0x5,
        hash_5a7fd1af4a1d5c9, // 0x6,
        eq_hawk, // 0x7,
        tr_midburst_t8, // 0x8,
        sniper_powersemi_t8, // 0x9,
        counteruav, // 0xa,
        gadget_supplypod, // 0xb,
        ar_damage_t8, // 0xc,
        sig_buckler_dw, // 0xd,
        gadget_vision_pulse, // 0xe,
        eq_arm_blade, // 0xf,
        gadget_heat_wave, // 0x10,
        eq_localheal, // 0x11,
        eq_sensor, // 0x12,
        pistol_fullauto_t8, // 0x13,
        remote_missile, // 0x14,
        eq_emp_grenade, // 0x15,
        ar_accurate_t8, // 0x16,
        frag_grenade, // 0x17,
        knife_loadout, // 0x18,
        feature_default_class_5, // 0x19,
        feature_default_class_4, // 0x1a,
        feature_default_class_6, // 0x1b,
        eq_swat_grenade, // 0x1c,
        swat_team, // 0x1d,
        hatchet, // 0x1e,
        supplydrop_marker, // 0x1f,
        mute_smoke, // 0x20,
        smg_capacity_t8, // 0x21,
        pistol_standard_t8, // 0x22,
        null_offhand_secondary, // 0x23,
        gadget_health_regen, // 0x24,
        hash_31be8125c7d0f273, // 0x25,
        drone_squadron, // 0x26,
        null_offhand_primary, // 0x27,
        pistol_revolver_t8, // 0x28,
        sniper_powerbolt_t8, // 0x29,
        overwatch_helicopter, // 0x2a,
        eq_grapple, // 0x2b,
        gadget_jammer, // 0x2c,
        hash_3ab58e40011df941, // 0x2d,
        launcher_standard_t8, // 0x2e,
        sig_bow_quickshot, // 0x2f,
        pistol_burst_t8, // 0x30,
        ar_fastfire_t8, // 0x31,
        hero_pineapplegun, // 0x32,
        sniper_quickscope_t8, // 0x33,
        ability_dog, // 0x34,
        straferun, // 0x35,
        lmg_heavy_t8, // 0x36,
        eq_seeker_mine, // 0x37,
        recon_car, // 0x38,
        eq_gravityslam, // 0x39,
        feature_custom_class_6, // 0x3a,
        feature_custom_class_5, // 0x3b,
        feature_custom_class_4, // 0x3c,
        uav, // 0x3d,
        eq_concertina_wire, // 0x3e,
        gadget_spawnbeacon, // 0x3f,
        ac130, // 0x40,
        ar_stealth_t8, // 0x41,
        helicopter_comlink, // 0x42,
        gadget_armor, // 0x43,
        feature_cac, // 0x44,
        shotgun_pump_t8, // 0x45,
        gadget_health_boost, // 0x46,
        bare_hands, // 0x47,
        hash_578fac7f7b2db62b, // 0x48,
        trophy_system, // 0x49,
        sniper_mini14_t8, // 0x4a,
        eq_cluster_semtex_grenade, // 0x4b,
        tr_longburst_t8, // 0x4c,
        smg_standard_t8, // 0x4d,
        eq_slow_grenade, // 0x4e,
        smg_folding_t8, // 0x4f,
        lmg_spray_t8, // 0x50,
        smg_accurate_t8, // 0x51,
        ar_modular_t8, // 0x52,
        smg_fastburst_t8, // 0x53,
        eq_molotov, // 0x54,
        melee_slaybell_t8, // 0x55,
        smg_fastfire_t8, // 0x56,
        ai_tank_marker, // 0x57,
        lmg_standard_t8, // 0x58,
        gadget_cleanse, // 0x59,
        melee_demohammer_t8, // 0x5a,
        hero_annihilator_oic, // 0x5b,
        hero_flamethrower, // 0x5c,
        sniper_fastrechamber_t8, // 0x5d,
        hero_annihilator, // 0x5e,
        planemortar, // 0x5f,
        tr_powersemi_t8, // 0x60,
        shotgun_semiauto_t8, // 0x61,
        gadget_radiation_field, // 0x62,
        ar_standard_t8, // 0x63,
        weapon_null, // 0x64,
        default_specialist_equipment, // 0x65,
        hash_7932008294f0d876, // 0x66,
        smg_handling_t8, // 0x67,
        shotgun_fullauto_t8, // 0x68,
        hash_7ab3f9a730359659, // 0x69,
        tr_flechette_t8, // 0x6a,
        melee_secretsanta_t8, // 0x6b,
        gadget_icepick, // 0x6c,
        melee_coinbag_t8, // 0x6d,
        gadget_camo, // 0x6e
    };

    // idx 2 members 40
    enum hash_4b8d95aacf149fb9 {
        tr_midburst_t8, // 0x0,
        sniper_powersemi_t8, // 0x1,
        ar_damage_t8, // 0x2,
        pistol_fullauto_t8, // 0x3,
        ar_accurate_t8, // 0x4,
        knife_loadout, // 0x5,
        smg_capacity_t8, // 0x6,
        pistol_standard_t8, // 0x7,
        pistol_revolver_t8, // 0x8,
        sniper_powerbolt_t8, // 0x9,
        launcher_standard_t8, // 0xa,
        pistol_burst_t8, // 0xb,
        ar_fastfire_t8, // 0xc,
        sniper_quickscope_t8, // 0xd,
        lmg_heavy_t8, // 0xe,
        ar_stealth_t8, // 0xf,
        shotgun_pump_t8, // 0x10,
        hash_578fac7f7b2db62b, // 0x11,
        sniper_mini14_t8, // 0x12,
        tr_longburst_t8, // 0x13,
        smg_standard_t8, // 0x14,
        smg_folding_t8, // 0x15,
        lmg_spray_t8, // 0x16,
        smg_accurate_t8, // 0x17,
        ar_modular_t8, // 0x18,
        smg_fastburst_t8, // 0x19,
        melee_slaybell_t8, // 0x1a,
        smg_fastfire_t8, // 0x1b,
        lmg_standard_t8, // 0x1c,
        melee_demohammer_t8, // 0x1d,
        hero_annihilator_oic, // 0x1e,
        sniper_fastrechamber_t8, // 0x1f,
        tr_powersemi_t8, // 0x20,
        shotgun_semiauto_t8, // 0x21,
        ar_standard_t8, // 0x22,
        smg_handling_t8, // 0x23,
        shotgun_fullauto_t8, // 0x24,
        tr_flechette_t8, // 0x25,
        melee_secretsanta_t8, // 0x26,
        melee_coinbag_t8, // 0x27
    };

    // idx 3 members 17
    enum hash_7493d39e2637c1e7 {
        bonuscard, // 0x0,
        hero, // 0x1,
        feature, // 0x2,
        weapon_special, // 0x3,
        weapon_knife, // 0x4,
        miscweapon, // 0x5,
        weapon_pistol, // 0x6,
        killstreak, // 0x7,
        weapon_sniper, // 0x8,
        talent, // 0x9,
        weapon_launcher, // 0xa,
        weapon_grenade, // 0xb,
        weapon_lmg, // 0xc,
        weapon_tactical, // 0xd,
        weapon_smg, // 0xe,
        weapon_cqb, // 0xf,
        weapon_assault, // 0x10
    };

    // idx 4 members 44
    enum hash_1e2de876fb880be2 {
        speedreloader, // 0x0,
        quickdraw, // 0x1,
        acog, // 0x2,
        pistolscope, // 0x3,
        mms, // 0x4,
        dw, // 0x5,
        ir, // 0x6,
        is, // 0x7,
        rf, // 0x8,
        fastreload, // 0x9,
        extbarrel, // 0xa,
        steadyaim, // 0xb,
        stalker, // 0xc,
        fastlockon, // 0xd,
        barrelchoke, // 0xe,
        hipgrip, // 0xf,
        supply, // 0x10,
        stalker2, // 0x11,
        extclip2, // 0x12,
        steadyaim2, // 0x13,
        mixclip, // 0x14,
        killcounter, // 0x15,
        clantag, // 0x16,
        damage2, // 0x17,
        swayreduc, // 0x18,
        extbarrel2, // 0x19,
        extclip, // 0x1a,
        holo, // 0x1b,
        elo, // 0x1c,
        fastreload2, // 0x1d,
        extrapellets, // 0x1e,
        holdbreath, // 0x1f,
        fmj2, // 0x20,
        quickdraw2, // 0x21,
        fmj, // 0x22,
        adsreload, // 0x23,
        suppressed, // 0x24,
        grip2, // 0x25,
        custom1, // 0x26,
        dualoptic, // 0x27,
        grip, // 0x28,
        reflex, // 0x29,
        uber, // 0x2a,
        damage, // 0x2b
    };

    // idx 5 members 42
    enum hash_6cba734728a9b70 {
        bonuscard_overkill, // 0x0,
        talent_gungho, // 0x1,
        talent_engineer, // 0x2,
        talent_coldblooded, // 0x3,
        hash_9fb2125b3e673e5, // 0x4,
        gear_armor, // 0x5,
        talent_tracker, // 0x6,
        hash_101808cdfcd390d6, // 0x7,
        bonuscard_underkill, // 0x8,
        hash_16cfc7f70dbd8712, // 0x9,
        bonuscard_perk_1_greed, // 0xa,
        talent_flakjacket, // 0xb,
        bonuscard_perk_3_greed, // 0xc,
        gadget_medicalinjectiongun, // 0xd,
        hash_20290a682a974c94, // 0xe,
        bonuscard_primary_gunfighter_2, // 0xf,
        bonuscard_primary_gunfighter_3, // 0x10,
        talent_dexterity, // 0x11,
        hash_249e75e962ea5275, // 0x12,
        talent_resistance, // 0x13,
        gear_awareness, // 0x14,
        bonuscard_perk_1_gluttony, // 0x15,
        talent_lightweight, // 0x16,
        gear_equipmentcharge, // 0x17,
        bonuscard_secondary_gunfighter_2, // 0x18,
        bonuscard_secondary_gunfighter_3, // 0x19,
        hash_39045b0020cc3e00, // 0x1a,
        talent_scavenger, // 0x1b,
        talent_skulker, // 0x1c,
        bonuscard_perk_2_greed, // 0x1d,
        bonuscard_secondary_gunfighter, // 0x1e,
        gear_scorestreakcharge, // 0x1f,
        bonuscard_perk_2_gluttony, // 0x20,
        talent_ghost, // 0x21,
        bonuscard_perk_3_gluttony, // 0x22,
        bonuscard_primary_operator_mod, // 0x23,
        talent_teamlink, // 0x24,
        talent_deadsilence, // 0x25,
        bonuscard_primary_gunfighter, // 0x26,
        gear_medicalinjectiongun, // 0x27,
        bonuscard_secondary_operator_mod, // 0x28,
        hash_7716cb3888f5dd8a, // 0x29
    };

    // idx 6 members 14
    enum hash_d17b4e10fa9c28c {
        prt_mp_reaper, // 0x0,
        prt_mp_buffassault, // 0x1,
        prt_mp_mercenary, // 0x2,
        prt_mp_technomancer, // 0x3,
        prt_mp_engineer, // 0x4,
        prt_mp_outrider, // 0x5,
        prt_mp_swatpolice, // 0x6,
        prt_mp_spectre, // 0x7,
        prt_mp_recon, // 0x8,
        prt_mp_battery, // 0x9,
        prt_mp_enforcer, // 0xa,
        prt_mp_zero, // 0xb,
        prt_mp_trapper, // 0xc,
        prt_mp_firebreak, // 0xd
    };

    // idx 0 members 5 size 0x9a8
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x280
    hash_1c86958671ff27fd hash_4953b2b12f1d6b1b[hash_4b8d95aacf149fb9];
    // offset 0x960, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0x9a0, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_69fd4736b52053f5"

version 6 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 4 size 0x728
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x40
    uint64 hash_4016bed15f9183f7;
    // offset 0x720, size 0x8
    byte tier_boost;
}

/////////////////////////////////////////////////
// hash_1632585dbdb5d250
// metatable "hash_13f8b79e6e54a4b"

version 5 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 8 size 0x6d8
    struct hash_6580ccf5f8a0ef6 {
        // offset 0x0, size 0x20
        uint hash_67599f190572ca79;
        // offset 0x20, size 0x400
        string(128) city;
        // offset 0x420, size 0x20
        float longitude;
        // offset 0x440, size 0x10
        string(2) country;
        // offset 0x450, size 0x40
        string(8) timezone;
        // offset 0x490, size 0x28
        string(5) language;
        // offset 0x4b8, size 0x20
        float latitude;
        // offset 0x4d8, size 0x200
        string(64) region;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 3 size 0x720
    // offset 0x0, size 0x6d8
    hash_6580ccf5f8a0ef6 dml;
    // offset 0x6d8, size 0x8
    hash_54196e9e9860f0be platform;
    // offset 0x6e0, size 0x40
    uint64 hash_4016bed15f9183f7;
}

