$Fecha = get-date -Format yyyyMMdd
7z a BACKUPBDRESOLVE.7z ./*
$DirectorioRemoto = 'remoto:' + '/' + $Fecha
rclone sync BACKUPBDRESOLVE.7z $DirectorioRemoto -v