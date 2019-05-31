Dim fb As New FolderBrowserDialog
Dim ruta As String = ""

With fb
    .Reset() ' resetea  
    .Description = " Seleccione el ejecutable "
    .RootFolder = Environment.SpecialFolder.Desktop

    Dim ret As DialogResult = .ShowDialog

    If ret = Windows.Forms.DialogResult.OK Then
        ruta = fb.SelectedPath
        MsgBox(ruta)
    End If
    .Dispose()

End With