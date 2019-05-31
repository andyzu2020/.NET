#Region " Get Process Window Title Function "
 
    ' [ Get Process Window Title Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' MsgBox(Get_Process_Window_Title("cmd"))
    ' MsgBox(Get_Process_Window_Title("cmd.exe"))
 
    Private Function Get_Process_Window_Title(ByVal ProcessName As String) As String
        If ProcessName.ToLower.EndsWith(".exe") Then ProcessName = ProcessName.Substring(0, ProcessName.Length - 4)
        Dim ProcessArray = Process.GetProcessesByName(ProcessName)
        If ProcessArray.Length = 0 Then Return Nothing Else Return ProcessArray(0).MainWindowTitle
    End Function
 
#End Region