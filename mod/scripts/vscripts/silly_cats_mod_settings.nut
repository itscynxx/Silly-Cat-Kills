untyped

global function Silly_Cats_Mod_Settings

void function Silly_Cats_Mod_Settings()
{
    if ( !CATS_HAS_CALLBACK )
        return

    ModSettings_AddModTitle( "Silly Cat Kills" )

    ModSettings_AddModCategory( "Cat video settings" )
    ModSettings_AddSetting( "silly_cat_size", "Size of the cat video (max 600)", "int" )
    ModSettings_AddEnumSetting( "cat_specify_video", "Specify a video to be played (default all)", [ "All", "angy_cat", "bingus", "cat_berg", "cat_drinking", "cat_vibe", "concerned_cat", "guh", "jinx_cat", "plink", "voices_cat" ])
}