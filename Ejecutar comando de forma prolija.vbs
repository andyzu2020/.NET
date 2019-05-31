Imports System
Imports System.Diagnostics
Imports System.ComponentModel


Dim proceso As New Process()
proceso.StartInfo.UseShellExecute = False 'Con esto no se muestra.

proceso.StartInfo.FileName = "cmd.exe"
proceso.StartInfo.CreateNoWindow = True
proceso.StartInfo.Arguments = comando
proceso.Start()
proceso.WaitForInputIdle()