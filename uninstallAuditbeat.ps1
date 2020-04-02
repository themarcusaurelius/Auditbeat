Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser	
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope Process

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

if($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Set-ExecutionPolicy Unrestricted

    #Change Directory to Auditbeat
    Set-Location -Path 'c:\Auditbeat-master\auditbeat'

    #Stops auditbeat from running
    Stop-Service -Force auditbeat

    #Get The auditbeat Status
    Get-Service auditbeat

    #Change Directory to auditbeat5
    Set-Location -Path 'c:\'

    "`nUninstalling Auditbeat Now..."

    $Target = "C:\Auditbeat-master"

    Get-ChildItem -Path $Target -Recurse -force |
        Where-Object { -not ($_.pscontainer)} |
            Remove-Item -Force -Recurse

    Remove-Item -Recurse -Force $Target

    "`nAuditbeat Uninstall Successful."

    #Close Powershell window
    Stop-Process -Id $PID
}
else {
    Start-Process -FilePath "powershell" -ArgumentList "$('-File ""')$(Get-Location)$('\')$($MyInvocation.MyCommand.Name)$('""')" -Verb runAs
}