Dim processes() As Process
Dim instance As Process
Dim process As New Process()
processes = process.GetProcesses
For Each instance In processes
If instance.ProcessName = "xxx.exe" Then
msgbox("está corriendo el proceso xxx.exe")
End If
Next