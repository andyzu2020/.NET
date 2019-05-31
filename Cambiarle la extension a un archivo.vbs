Dim arhivoNuevo As String

        For Each archivo As String In archivosEncon
            arhivoNuevo = archivo.Replace(".jad", ".java")
            System.IO.File.Move(archivo, arhivoNuevo)
        Next