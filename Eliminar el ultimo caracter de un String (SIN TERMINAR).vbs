#Region " Remove Last Char "
 
    ' [ Remove Last Char Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' MsgBox(Remove_Last_Char("C:\Folder\"))
    ' Var = Remove_Last_Char(Var)
 
    Private Function Remove_Last_Char(ByVal str As String) As String
        Return str.Substring(0, str.Length - 1)
    End Function
 
#End Region