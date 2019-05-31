Imports System.IO

Dim fileName As String = "C:\mydir\myfile.ext"
Dim result As String

result = Path.GetFileName(fileName)
Console.WriteLine(result)
Console.ReadLine()