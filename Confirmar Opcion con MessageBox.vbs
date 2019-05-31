Dim result As Integer = MessageBox.Show("Mensaje", "Titulo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)
If result = DialogResult.Cancel Then
	MessageBox.Show("Cancel pressed")
ElseIf result = DialogResult.No Then
	MessageBox.Show("No pressed")
ElseIf result = DialogResult.OK Then
	MessageBox.Show("Yes pressed")
End If
     