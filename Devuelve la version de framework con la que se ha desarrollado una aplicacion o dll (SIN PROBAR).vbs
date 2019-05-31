#Region " Get FrameWork Of File "
 
    ' [ Get FrameWork Of File Function ]
    '
    ' Examples :
    ' MsgBox(Get_FrameWork_Of_File("C:\My .Net Application.exe"))
 
    Private Function Get_FrameWork_Of_File(ByVal File As String) As String
        Try
            Dim FW As System.Reflection.Assembly = Reflection.Assembly.ReflectionOnlyLoadFrom(File)
            Return FW.ImageRuntimeVersion
        Catch ex As Exception
            Return Nothing ' Is not managed code
        End Try
    End Function
 
#End Region