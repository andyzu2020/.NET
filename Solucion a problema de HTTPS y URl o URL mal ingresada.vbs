' Hay que probar cual de los 2 sirve



' Metodo 1
Try
	wbAux2.Url = New System.Uri("URL o texto que proviene de textbox, etc.", System.UriKind.Absolute)
	
Catch ex As Exception
	MessageBox.Show("Url invalida, ingrese nuevamente." & ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
	
End Try



' Metodo 2
Dim _url As String = String.Format("URL" & "?Guid={0}", Guid.NewGuid)
wbPpal.Navigate(_url)