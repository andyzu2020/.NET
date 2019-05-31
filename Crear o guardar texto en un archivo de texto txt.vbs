' Crear y guardar

Const fichero As String = "E:\tmp\Prueba.txt"
Dim texto As String = "Pablito tenía una moto con un pito."

Dim sw As New System.IO.StreamWriter(fichero)
sw.WriteLine(texto)
sw.Close()


' Anexar a uno existente

Const fichero As String = "E:\tmp\Prueba.txt"
Dim texto As String = "Pablito tenía una moto con un pito."

Dim sw As New System.IO.StreamWriter(fichero, True)
sw.WriteLine(texto)
sw.Close()