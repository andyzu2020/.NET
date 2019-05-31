Dim espacio As DriveInfo = New DriveInfo("C")
Dim eLibre2 As Integer = 0
eLibre2 = Math.Round(((espacio.AvailableFreeSpace / 1024) / 1024) / 1024) ' EN GB TENER CUIDADO CON EL TAMAÑO DE LA VARIABLE