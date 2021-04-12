New-Item -Name "COMPRIMIDOS" -ItemType "directory" -Force

$VideoMovs = Get-ChildItem -Filter "*.MOV" -Recurse
foreach ($VideoMov in $VideoMovs) {
        ffmpeg -i $VideoMov -vcodec h264_nvenc -preset fast -b:v 1500k -c:a aac -b:a 256k -ac 2 -ar 48000 -y COMPRIMIDOS/$VideoMov
}

$VideoMp4s = Get-ChildItem -Filter "*.mp4" -Recurse
foreach ($VideoMp4 in $VideoMp4s) {
        ffmpeg -i $VideoMp4 -vcodec h264_nvenc -preset fast -b:v 1500k -c:a aac -b:a 256k -ac 2 -ar 48000 -y COMPRIMIDOS/$VideoMp4
}

$Wavs = Get-ChildItem -Filter "*.wav" -Recurse
foreach ($Wavcopia in $Wavs) {
        $Mp3 = [io.path]::ChangeExtension($Wavcopia, '.mp3')
        ffmpeg -i $Wavcopia -acodec libmp3lame -b:a 128k COMPRIMIDOS/$Mp3
}