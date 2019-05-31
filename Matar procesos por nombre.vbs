Dim procesos As Process()

procesos  = Process.GetProcessesByName("Powerpnt")

If procesos.Length > 0 Then
    For i = procesos.Length - 1 To 0 Step -1
        procesos(i).Kill()
    Next
End If