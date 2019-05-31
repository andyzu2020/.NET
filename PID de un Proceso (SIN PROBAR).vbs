#Region " Get Process PID Function "
 
    ' [ Get Process PID Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' MsgBox(Get_Process_PID("cmd"))
    ' MsgBox(Get_Process_PID("cmd.exe"))
 
    Private Function Get_Process_PID(ByVal ProcessName As String) As IntPtr
        If ProcessName.ToLower.EndsWith(".exe") Then ProcessName = ProcessName.Substring(0, ProcessName.Length - 4)
        Dim ProcessArray = Process.GetProcessesByName(ProcessName)
        If ProcessArray.Length = 0 Then Return Nothing Else Return ProcessArray(0).Id
    End Function
 
#End Region