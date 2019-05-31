Public Moving_From_Secondary_Form As Boolean = False
 
    ' Move Event Main Form
    Private Sub Form1_Move(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Move
        If Not Moving_From_Secondary_Form Then Form2.Location = New Point(Me.Right, Me.Top)
    End Sub
 
    ' Move Event Secondary Form
    Private Sub Form2_Move(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Move
        Form1.Moving_From_Secondary_Form = True
        Form1.Location = New Point(Me.Left - Form1.Width, Me.Top)
        Form1.Moving_From_Secondary_Form = False
    End Sub