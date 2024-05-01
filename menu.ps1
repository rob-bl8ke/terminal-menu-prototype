<# ###################################################################################################
The Main Menu
------------------------------------------------------------------------------------------------------

Top level menu

################################################################################################### #>

$ScriptPath = Split-Path $MyInvocation.MyCommand.Definition

."$ScriptPath\common\stub-menu-option.ps1"

$Menu = "$ScriptPath\common\operations-menu.ps1"

# $Option1 = New-StubInlineScriptMenuOption "Menu Option 1"
# $Option2 = New-StubInlineScriptMenuOption "Menu Option 2"
# $Option3 = New-StubInlineScriptMenuOption "Menu Option 3"

$OptionWebApi = [PSCustomObject]@{
    Description = "Web API"
    Script = {
        $menu = Join-Path -Path $ScriptPath -ChildPath ".\..\sub-scripts\web-api\menu.ps1"
        & $menu
    }
}

$OptionRunDiagnostics = [PSCustomObject]@{
    Description = "Run system diagnostics check (look for common problems)"
    Script = {
        $menu = Join-Path -Path $ScriptPath -ChildPath ".\..\sub-scripts\diagnostics\diagnostics.ps1"
        & $menu
    }
}

$OptionQuit = [PSCustomObject]@{
    Description = "Quit"
    Script =  {
        exit 0
    }
}

# Pass in the menu sub title, menu options, and configuration to draw and interact with the menu
&$Menu `
    -Title "Main Menu" `
    -Options ([System.Collections.ArrayList]@( `
        $OptionWebApi, `
        $OptionRunDiagnostics, `
        $OptionQuit `
    ))
