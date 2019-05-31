        Dim ProcHandle As Integer
        Dim CurrentPro As New System.Diagnostics.Process()

        CurrentPro = System.Diagnostics.Process.GetCurrentProcess()
        ProcHandle = CurrentPro.Handle