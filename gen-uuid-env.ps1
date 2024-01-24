## generate UUIDs for new .env on Windows

## if you don't want error '...not digitally signed. The script will not execute on the system.':
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass.

# gen UUID: powershell -Command "[guid]::NewGuid().ToString()"
## problematic. if working, all replaced with the same guid.
#Get-Content -Path .\.env.template -replace ' # generate new for each var at https://www.uuidgenerator.net/', [guid]::NewGuid().ToString() > .\.env 

## works, but provides one GUID on every line. We need different for each line.
#(Get-Content ".env.template") -replace ' # generate new for each var at https://www.uuidgenerator.net/', [guid]::NewGuid().ToString() | Set-Content .env

$lines = Get-Content ".env.template"
$len = $lines.count 
for($i=0;$i-lt$len;$i++){
        $lines[$i] = $lines[$i] -replace ' # generate new for each var at https://www.uuidgenerator.net/', [guid]::NewGuid().ToString()
}
$lines > ".env"