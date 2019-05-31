#Region " Get Process Handle Function "
 
    ' [ Get Process Handle Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' MsgBox(Get_Process_Handle("cmd"))
    ' MsgBox(Get_Process_Handle("cmd.exe"))
 
    Private Function Get_Process_Handle(ByVal ProcessName As String) As IntPtr
        If ProcessName.ToLower.EndsWith(".exe") Then ProcessName = ProcessName.Substring(0, ProcessName.Length - 4)
        Dim ProcessArray = Process.GetProcessesByName(ProcessName)
        If ProcessArray.Length = 0 Then Return Nothing Else Return ProcessArray(0).MainWindowHandle
    End Function
 
#End Region