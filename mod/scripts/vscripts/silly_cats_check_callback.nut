untyped

global function Silly_Cat_UI_Init

void function Silly_Cat_UI_Init()
{
    if ( CATS_HAS_CALLBACK )
        return
    else
        Callback_Warn()
}

void function Callback_Warn()
{
    if ( GetConVarInt("cat_callback_remind") == 0 )
        return

    DialogData dialogData
   	dialogData.header = "Missing dependency!"

    dialogData.message = "Silly Cat Kills requires a dependency called Client Kill Callback to use it!\n\nInstall or enable Client Kill Callback in order to use Silly Cat Kills!"

    dialogData.image = $"ui/menu/common/dialog_error"

    AddDialogButton(dialogData, "Link to Client Kill Callback", void function(){
        LaunchExternalWebBrowser("https://northstar.thunderstore.io/package/S2Mods/ClientKillCallback/", WEBBROWSER_FLAG_FORCEEXTERNAL); ClientCommand("cat_callback_remind 0"); ClientCommand("uiscript_reset")
    })
	AddDialogButton( dialogData, "OK", void function(){ClientCommand("cat_callback_remind 0"); ClientCommand("uiscript_reset")})
    OpenDialog(dialogData)
}