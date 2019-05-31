#Region " Hex To Dec Function "
 
    ' [ Hex To Dec Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' MsgBox(Hex_To_Dec("0x020032")) ' Result: 131122
 
    Private Function Hex_To_Dec(ByVal str As String) As Int32
        Return Convert.ToInt32(str, 16)
    End Function
 
#End Region