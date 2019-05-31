#Region " Char To Byte "
 
    ' [ Char To Byte Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' MsgBox(Char_To_Byte("a")) ' Result: 97
    ' Dim MyChar As String = "a" : MsgBox(Chr(Char_To_Byte(MyChar))) ' Result: a    ( ...xD )
 
    Private Function Char_To_Byte(ByVal str As String) As Int32
        Dim character As Char = str & "c"
        Return Convert.ToByte(character)
    End Function
 
#End Region