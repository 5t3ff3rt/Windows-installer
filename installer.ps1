Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.3.2691/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile $env:TEMP\winget.msixbundle
Add-AppxPackage -Path $env:TEMP\winget.msixbundle

# winget script
Function main() {
    $exists = Test-CommandExists winget

    if ($exists) {
        # install programs
        winget install -h -e --id Google.Chrome
        winget install -h -e --id BelgianGovernment.Belgium-eIDmiddleware
        winget install -h -e --id BelgianGovernment.eIDViewer
        # uninstall programs
        winget uninstall Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.Getstarted_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall 9NBLGGH42THS --accept-source-agreements --silent
        winget uninstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall 9NBLGGH5FV99 --accept-source-agreements --silent
        winget uninstall Microsoft.BingWeather_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.People_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.Wallet_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.WindowsMaps_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.ZuneVideo_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.MixedReality.Portal_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.GetHelp_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.Todos_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.BingNews_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall MicrosoftTeams_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall MicrosoftCorporationII.MicrosoftFamily_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall disney+ --accept-source-agreements --silent
        winget uninstall Clipchamp.Clipchamp_yxz26nhyzhsrt --accept-source-agreements --silent
        winget uninstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall Microsoft.Office.OneNote_8wekyb3d8bbwe --accept-source-agreements --silent
        winget uninstall cortana --accept-source-agreements --silent
        # update existing programs
        winget upgrade --all
    }
}

# check main function
Function Test-CommandExists
{
    Param ($command)
 
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'stop'
 
    Try { if (Get-Command $command) { $true } }
    Catch { $false }
    Finally { $ErrorActionPreference = $oldPreference }
}

# run the main function
main