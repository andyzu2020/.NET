Dim myStream As Stream = Nothing
Dim OFDialog As New OpenFileDialog()
Dim ruta As String = ""

OFDialog.InitialDirectory = Environment.SpecialFolder.Desktop
OFDialog.Filter = "Archivo Bat (*.bat)|*.bat|Archivo Com (*.com)|*.com|Archivo Exe (*.exe)|*.exe|Archivo Jar (*.jar)|*.jar|Archivo Msi (*.msi)|*.msi|Todos los archivos (*.*)|*.*"
OFDialog.FilterIndex = 2
OFDialog.RestoreDirectory = True

If OFDialog.ShowDialog() = System.Windows.Forms.DialogResult.OK Then
    Try
        ruta = OFDialog.FileName
        MsgBox(ruta)
        
    Catch Ex As Exception
        MessageBox.Show("No se puede leer el ejecutable seleccionado " & Ex.Message, "Error critico", MessageBoxButtons.OK)
    Finally
        ' Check this again, since we need to make sure we didn't throw an exception on open.
        If (myStream IsNot Nothing) Then
            myStream.Close()
        End If
    End Try
End If