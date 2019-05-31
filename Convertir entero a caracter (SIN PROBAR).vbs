#Region " Byte To Char "
 
    ' [ Byte To Char Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' MsgBox(Byte_To_Char(97)) ' Result: a
 
    Private Function Byte_To_Char(ByVal int As Int32) As String
        Return Convert.ToChar(int)
    End Function
 
#End Region