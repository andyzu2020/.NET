Private Sub Cntrol_o_Formulario_MouseClick(sender As Object, e As MouseEventArgs) Handles Control_o_Formulario.MouseClick
	If e.Button = MouseButtons.Right Then
		MsgBox("Se presiono el boton derecho sobre el elemento")
	End If
End Sub