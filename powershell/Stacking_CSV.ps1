$path =  'C:\Users\pascalv\Documents\Projects\Test'
$file_out = '.\Desktop\master.csv'
Remove-Item $file_out

Get-ChildItem $path -Filter *.csv | Select-Object -ExpandProperty FullName |Import-Csv | Export-Csv $file_out -NoTypeInformation -Append


<#
$filepath = 'C:\Users\pascalv\Documents\Projects\Test'
$outputfile = '.\Desktop\master.csv'
$encoding = [System.Text.Encoding]::UTF8

$files = Get-ChildItem -Path $filePath -Filter *.csv
Remove-Item $outputfile

$w = New-Object System.IO.StreamWriter($outputfile, $true, $encoding)

$skiprow = $false
foreach ($file in $files)
{
    $r = New-Object System.IO.StreamReader($file.fullname, $encoding)
    while (($line = $r.ReadLine()) -ne $null) 
    {
        if (!$skiprow)
        {
            $w.WriteLine($line)
        }
        $skiprow = $false
    }
    $r.Close()
    $r.Dispose()
    $skiprow = $true
}

$w.close()
$w.Dispose()

#>
