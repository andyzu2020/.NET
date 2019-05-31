#Region " Number Is Prime? "
 
    ' [ Number Is Prime? Function ]
    '
    ' Examples :
    ' MsgBox(Number_Is_Prime(4)) ' Result: False
 
    Private Function Number_Is_Prime(ByVal Number As Long, Optional ByVal f As Integer = 2) As Boolean
        If Number = f Then Return True
        If Number Mod f = 0 Or Number = 1 Then Return False _
        Else Return Number_Is_Prime(Number, f + 1)
    End Function
 
#End Region