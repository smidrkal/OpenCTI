## generate UUIDs for new .env on Windows

# gen UUID: powershell -Command "[guid]::NewGuid().ToString()"

Get-Content -Path .\.env.template -replace ' # generate new for each var at https://www.uuidgenerator.net/', [guid]::NewGuid().ToString() > .\.env 