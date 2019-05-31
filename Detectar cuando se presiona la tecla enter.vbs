#Region "Evento que controla si se presiona uns tecla, enter y despues en txtUrl"

    Private Sub txtUrl_KeyDown(sender As Object, e As KeyEventArgs) Handles txtUrl.KeyDown
        If e.KeyCode = Keys.Enter Then
            ' Se presiona la tecla enter en el control
            e.Handled = True
        End If
    End Sub
#End Region