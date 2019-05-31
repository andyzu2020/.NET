    '#########################################
    '# Procedimiento para renombrar archivos #
    '#########################################
    Public Sub renombrarArchivo(ByVal nombreAntiguo As String, ByVal nombreNuevo As String)
        Dim OldName, NewName As String
        OldName = nombreAntiguo
        NewName = nombreNuevo
        Rename(OldName, NewName)
    End Sub



Esto renombra archivos que esten en la misma carpeta.