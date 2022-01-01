$to_monitor1 = 'C:\Users\pascalv\Documents\Projects\powershell\location\test1'

$to_copy1 = 'C:\Users\pascalv\Documents\Projects\powershell\location\'
$to_move1 = 'C:\Users\pascalv\Desktop\'

$to_monitor2 = 'C:\Users\pascalv\Documents\Projects\powershell\location\test2'


$Watcher1 =[System.IO.FileSystemWatcher]::new($to_monitor1)
$Watcher1.Filter = "*.csv";


$Watcher2 =[System.IO.FileSystemWatcher]::new($to_monitor2)
$Watcher2.Filter = "*.csv";


Get-Event | Unregister-Event

$Params1 = @{
    InputObject = $Watcher1
    EventName ='Created'
    Action = {
    $filename = $Event.SourceEventArgs.FullPath

    Start-Sleep -Seconds 10

    Copy-Item -Path $filename -Destination $to_copy1
    Move-Item -Path $filename -Destination $to_move1
    Write-Host 'File copied'
}}


$Params2 = @{
    InputObject = $Watcher2
    EventName ='Created'
    Action = {
    $filename = $Event.SourceEventArgs.FullPath

    Start-Sleep -Seconds 10

    Copy-Item -Path $filename -Destination $to_copy1
    Move-Item -Path $filename -Destination $to_move1
    Write-Host 'File copied'
}}


Register-ObjectEvent @Params1
Register-ObjectEvent @Params2