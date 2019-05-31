        Dim CurrentPro As New System.Diagnostics.Process()

        CurrentPro = System.Diagnostics.Process.GetCurrentProcess()

        obtenerPID = CInt(CurrentPro.Id.ToString())