Dim seraSegundoClick As Boolean = False    ' Variable Global

#Region "Evento Click en el TextBox txtUrl"
    Private Sub control_Click(sender As Object, e As EventArgs) Handles control.Click

        If Not seraSegundoClick Then       ' Si no se dio un segundo Click 
            txtUrl.SelectAll()             ' Se selecciona todo
            seraSegundoClick = True
        Else                               ' Si se dio un segundo Click
            seraSegundoClick = False       ' No hara nada mas que esperar un click impar 
        End If
    End Sub
#End Region