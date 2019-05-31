Dim hilos(100) As Thread



Private Sub Manejador_de_hilos(numero As Integer)
    Dim clase As New Ocultar 'Clase en donde cree el codigo que deseo utilizar sin que hayan colisiones.
    clase.variable = "algo"

    hilos(numero) = New Thread(AddressOf clase.procedimiento)
    hilos(numero).IsBackground = True
    hilos(numero).Start()
End Sub