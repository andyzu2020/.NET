Imports System
Imports System.IO
Imports System.Collections

Public Class Form1
    Dim i As Integer = 0
    Private Sub CargarDatos()
        i = i + 1
        Dim objReader As New StreamReader("leer.txt")
        Dim sLine As String = ""
        Dim arrText As New ArrayList()
        Dim arrayDatos
        Dim longArray As Integer
        Do
            sLine = objReader.ReadLine()
            If Not sLine Is Nothing Then
                arrayDatos = Split(sLine, vbCrLf)
                longArray = (UBound(arrayDatos))
                If i - 1 <= longArray Then
                    TextBox1.Text = arrayDatos(i - 1)
                    arrText.Add(sLine)
                Else
                    MsgBox("termino de leer el archivo")
                    TextBox1.Text = ""
                End If
            End If
        Loop Until sLine Is Nothing
    End Sub
End Class