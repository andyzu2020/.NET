Private Sub teclas(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles MyBase.KeyDown
    'Cierro la aplicación con Ctrl + S
    Try
        If (e.KeyData = Keys.Control + Keys.S) Then
            Me.Close()
        End If

    Catch ex As Exception
    End Try
End Sub