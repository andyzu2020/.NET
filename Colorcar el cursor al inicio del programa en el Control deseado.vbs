#Region "Evento que coloca al inicio del programa el cursor en el Control indicado"
    Private Sub Form1_Shown(sender As Object, e As System.EventArgs) Handles Me.Shown
        txtUrl.Focus()
    End Sub
#End Region