#Region " Get Screen Resolution "
 
    ' [ Get Screen Resolution Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' MsgBox(Get_Screen_Resolution(False).ToString)
    ' MsgBox(Get_Screen_Resolution(True).ToString)
    ' Me.Size = Get_Screen_Resolution()
 
    Private Function Get_Screen_Resolution(ByVal Get_Extended_Screen_Resolution As Boolean) As Point
 
        If Not Get_Extended_Screen_Resolution Then
            Return New Point(My.Computer.Screen.Bounds.Width, My.Computer.Screen.Bounds.Height)
        Else
            Dim X As Integer, Y As Integer
 
            For Each screen As Screen In screen.AllScreens
                X += screen.Bounds.Width
                Y += screen.Bounds.Height
            Next
 
            Return New Point(X, Y)
        End If
 
    End Function
 
#End Region