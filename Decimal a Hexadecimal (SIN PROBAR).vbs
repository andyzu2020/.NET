#Region " Dec To Hex Function "
 
    ' [ Dec To Hex Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' MsgBox(Dec_To_Hex(131122)) ' Result: 0x020032
 
    Private Function Dec_To_Hex(ByVal int As Int32) As String
        Return Convert.ToString(int, 16)
    End Function
 
#End Region