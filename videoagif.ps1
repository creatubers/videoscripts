$Archivo = Read-Host -Prompt 'Introduce ruta del video: '
ffmpeg -i $Archivo -vf "fps=10,scale=640:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 Archivoengif.gif