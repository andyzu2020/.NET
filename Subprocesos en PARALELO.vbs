Imports System.Threading
Imports System.Threading.Tasks

Module Module1

    Sub Main(ByVal args() As String)
        Parallel.Invoke(New Action(AddressOf Procedimiento1), New Action(AddressOf Procedimiento2))

        Console.ReadLine()
    End Sub

    Sub Procedimiento1()
        For i As Integer = 1 To 9
            Console.WriteLine("Este es el subproceso número: " & 1)
            'Para ver como lo hace y que los haga juntos
            Thread.Sleep(1100)
        Next
    End Sub

    Sub Procedimiento2()
        For j As Integer = 2 To 10
            Console.WriteLine("Este es el subproceso número: " & 2)
            Thread.Sleep(1100)
        Next
    End Sub
End Module
'Nota:
'Si hay mas subprocesos en paralelo que nucleos tiene el procesador, ejecuta del 3er subprocesos en adelante cuando puede
'y va ejecutando, por ejemplo si en un dual core lo toma el nucleo 2 al subprocesos 2 y 3 los ejecuta partecita por
'partecita hasta que termina con ambos.
'Nota 2:
'En cualquier caso ejecuta los subprocesos en cualquier orden.