Private Sub FileCopier
    Dim Source As String = "C:\Source.txt"
    Dim Destination As String = "C:\Copy.txt"
    System.IO.File.Copy(Source, Destination, True)
End Sub