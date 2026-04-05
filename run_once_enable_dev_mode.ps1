# Enable dev mode on Windows. See
# https://learn.microsoft.com/en-us/windows/advanced-settings/developer-mode#use-group-policies-or-registry-keys-to-enable-a-device

# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
{
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000)
    {
        $CommandLine = "-NoExit -File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -Wait -FilePath powershell.exe -Verb Runas -ArgumentList $CommandLine
        Exit
    }
}

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
