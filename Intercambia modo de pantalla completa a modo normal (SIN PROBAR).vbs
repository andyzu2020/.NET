#Region " Toogle FullScreen "
 
    ' [ Toogle FullScreen ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' Toogle_FullScreen()
 
    Dim MyFormBorderStyle = Me.FormBorderStyle
    Dim MyWindowState = Me.WindowState
    Dim MyTopMost = Me.TopMost
    Dim IsFullscreened As Boolean
 
    Public Sub Toogle_FullScreen()
        If Not IsFullscreened Then
            IsFullscreened = True
            Me.FormBorderStyle = FormBorderStyle.None
            Me.WindowState = FormWindowState.Maximized
            Me.TopMost = True
        ElseIf IsFullscreened Then
            IsFullscreened = False
            Me.FormBorderStyle = MyFormBorderStyle
            Me.WindowState = MyWindowState
            Me.TopMost = MyTopMost
        End If
    End Sub
 
#End Region