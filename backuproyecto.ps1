$NombreDirectorio = Split-Path -Path $pwd -Leaf
$Year = get-date -Format yyyy
$DirectorioLocal = $PSScriptRoot
$DirectorioRemoto = 'remoto:BACKUP/' + $Year + '/' + $NombreDirectorio
rclone sync $DirectorioLocal $DirectorioRemoto -v
rclone delete $DirectorioRemoto/backuproyecto.ps1
# shutdown /s
