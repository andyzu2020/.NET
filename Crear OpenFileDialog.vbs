fd.Title = "Cargar imagen que se desea evaluar"
fd.InitialDirectory = "C:\"
fd.Filter = "JPG files (*.jpg)|*.jpg|PNG files (*.png)|*.png|All files (*.*)|*.*"
fd.FilterIndex = 2
fd.RestoreDirectory = True

If fd.ShowDialog() = DialogResult.OK Then
	strFileName = fd.FileName
End If