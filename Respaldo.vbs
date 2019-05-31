Imports System.Threading
Imports System.Threading.Tasks

Module Module1
    Sub Main(ByVal args() As String)
        Parallel.Invoke(New Action(AddressOf LanzadorDelProceso1), New Action(AddressOf LanzadorDelProceso2), New Action(AddressOf LanzadorDelProceso3))

        Console.ReadLine()
    End Sub

    '---Proceso 1---
    Sub LanzadorDelProceso1()
        Dim trd As Task
        trd = Task.Factory.StartNew(AddressOf CodigoDelProceso1)
    End Sub
    Sub CodigoDelProceso1()
        For i As Integer = 1 To 9
            Console.WriteLine(" Este es el subproceso número: " & 1)
        Next
    End Sub

    '---Proceso 2---
    Sub LanzadorDelProceso2()
        Dim trd As Task
        trd = Task.Factory.StartNew(AddressOf CodigoDelProceso2)
    End Sub
    Sub CodigoDelProceso2()
        For i As Integer = 1 To 9
            Console.WriteLine(" Este es el subproceso número: " & 2)
        Next
    End Sub

    '---Proceso 3---
    Sub LanzadorDelProceso3()
        Dim trd As Task
        trd = Task.Factory.StartNew(AddressOf CodigoDelProceso3)
    End Sub
    Sub CodigoDelProceso3()
        For j As Integer = 1 To 9
            Console.WriteLine(" Este es el subproceso número: " & 3)
        Next
    End Sub
End Module
'Nota:
'Si hay mas subprocesos en paralelo que nucleos tiene el procesador, ejecuta del 3er subprocesos en adelante cuando puede
'y va ejecutando, por ejemplo si en un dual core lo toma el nucleo 2 al subprocesos 2 y 3 los ejecuta partecita por
'partecita hasta que termina con ambos.
'En cualquier caso ejecuta los subprocesos en cualquier orden.