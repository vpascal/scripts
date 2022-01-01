$to_monitor = 'S:\inst_research\Covid_Dashboard\CVS Results Dropbox'

$Watcher =[System.IO.FileSystemWatcher]::new($to_monitor)
$Watcher.Filter = "*.csv";


Get-Event | Unregister-Event

$Params = @{
    InputObject = $Watcher
    EventName ='Created'
    Action = {
    $filename = $Event.SourceEventArgs.FullPath

    Start-Sleep -Seconds 30
	Start-Process "C:\Program Files\R\R-4.0.2\bin\Rscript.exe" "C:\Users\pascalv\Documents\Projects\powershell\test.R"

}}

Register-ObjectEvent @Params